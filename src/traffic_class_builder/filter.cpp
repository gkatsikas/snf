// -*- c-basic-offset: 4 -*-
/* filter.cpp
 *
 * Implementation of SNF's traffic class filter.
 *
 * Copyright (c) 2015-2016 KTH Royal Institute of Technology
 * Copyright (c) 2015-2016 Georgios Katsikas, Marcel Enguehard
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>
 */

#include <cstdio>
#include <climits>
#include <iostream>
#include <algorithm>
#include <functional>
#include <stdint.h>

#include "filter.hpp"
#include "output_class.hpp"
#include "click_element.hpp"

#include "../shared/helpers.hpp"
#include "../synthesizer/stateful_synthesizer.hpp"

// The logger of traffic class-related classes
Logger tc_log(__FILE__);

#define MIN(a,b) (a>b) ? b : a
#define MAX(a,b) (a>b) ? a : b

#define IN_RANGE(x,lower,upper) (x>=lower && x<=upper)

//////////////////////////////////////////////////////////////////////////////////////////////////////
// Filter
//////////////////////////////////////////////////////////////////////////////////////////////////////

Filter::Filter() : Filter(unknown, (uint32_t)0, (uint32_t)UINT32_MAX) {}

Filter::Filter(HeaderField field) : Filter(field, 0, UINT32_MAX) {}

Filter::Filter(HeaderField field, uint32_t value) : Filter(field, value, value) {}

Filter::Filter(HeaderField field, short &pos, short &len)
{
	if (field != ambiguous_field) {
		FANCY_BUG(tc_log, "\tAmbiguous field is expected");
	}
	if ((pos < 0) || (pos > 300)) {
		FANCY_BUG(tc_log, "\tInvalid header position for ambiguous field filter");
	}
	if ((len < 1) || (len > 64)) {
		FANCY_BUG(tc_log, "\tInvalid header length for ambiguous field filter");
	}
	this->m_field     = field;
	this->m_field_pos = pos;
	this->m_field_len = len;
	warn_chatter(tc_log, "\tAmbiguous filter");
}

Filter::Filter(HeaderField field, uint32_t lower_value, uint32_t upper_value)
	: m_field(field), m_field_pos(-1), m_field_len(-1), m_filter(), m_to_subtract()
{
	if (lower_value > upper_value) {
		FANCY_BUG(tc_log, "\tInvalid filter: [" << lower_value << ", " << upper_value << "]");
	}
	m_filter.add_segment(lower_value, upper_value);
}

Filter
Filter::get_filter_from_v4_prefix(HeaderField field, uint32_t value, uint32_t prefix)
{
	if (prefix > 32) {
		FANCY_BUG(tc_log, "\tNetwork prefix greater than 32");
	} else if (prefix == 32) {
		return Filter(field, value);
	}

	uint32_t translation = 32 - prefix;
	uint32_t lower_limit = value & (0xffffffff << translation);
	uint32_t upper_limit = value | (0xffffffff >> prefix);

	if (lower_limit > upper_limit) {
		FANCY_BUG(tc_log, "\tInvalid filter [" << lower_limit << ", " << upper_limit << "]");
	}

	return Filter(field, lower_limit, upper_limit);
}

Filter
Filter::get_filter_from_v4_prefix_str(HeaderField field, const std::string &prefix_as_str)
{
	debug_chatter(tc_log, "\tParsing: " + prefix_as_str);

	size_t prefix_pos = prefix_as_str.find("/");
	uint32_t addr   = aton(prefix_as_str.substr(0, prefix_pos));
	uint32_t prefix = atoi(prefix_as_str.substr(prefix_pos + 1, 2).c_str());

	return get_filter_from_v4_prefix(field, addr, prefix);
}

Filter
Filter::get_filter_from_ipclass_pattern(HeaderField field, const std::string &args)
{
	//Cases:
	//1234
	//1234-5678
	//[=<>!]= 1234
	//[<>] 1234
	//1234 or 4567
	//1234 || 1234

	debug_chatter(tc_log, "\tParsing: " << args);

	std::string numbers = "0123456789";
	std::function<uint32_t(std::string)> to_uint = [](std::string a){ return atoi(a.c_str()); };
	if (field == ip_src || field == ip_dst) {
		to_uint = &aton;
		numbers += ".";
	}

	size_t pos = args.find_first_not_of(numbers);
	debug_chatter(tc_log, "\tPosition: " << pos);
	Filter f;

	switch (pos) {
		// 1234
		case std::string::npos: {
			return Filter(field, to_uint(args));
		}
		// Either [=<>!]= 1234 or [<>] 1234
		case 0:
			if (args.size() < 3) {
				FANCY_BUG(tc_log, "\tWrong argument in IPFilter: " + args);
			}

			switch (args[0]) {
				case '=':
					if (args.size() < 2 || args[1] != '=') {
						FANCY_BUG(tc_log, "\tWrong argument in IPFilter: " + args + "\n\tExpected '=' after =");
					} else {
						f = Filter(field, to_uint(args.substr(2, args.size() - 2)));
					}
					break;
				case '<':
					switch (args[1]) {
						case '=':
							f = Filter(field, 0, to_uint(args.substr(2,args.size()-2)));
							break;
						case ' ':
							f = Filter(field, 0, to_uint(args.substr(2,args.size()-2))-1);
							break;
						default:
							FANCY_BUG(tc_log, "\tWrong argument in IPFilter: " + args +
									"\n\tExpected one of ' ' or '=' after <");
					}
					break;
				case '>':
					switch (args[1]) {
						case '=':
							f = Filter(field, to_uint(args.substr(2,args.size()-2)), UINT32_MAX);
							break;
						case ' ':
							f = Filter(field, to_uint(args.substr(2,args.size()-2))+1, UINT32_MAX);
							break;
						default:
							FANCY_BUG(tc_log, "\tWrong argument in IPFilter: " + args +
									"\n\tExpected one of ' ' or '=' after >");
					}
					break;
				case '!':
					if (args[1] != '=') {
						FANCY_BUG(tc_log, "\tWrong argument in IPFilter: " + args + "\n\tExpected '=' after !");
					} else {
						f = Filter(field);
						f.differentiate(Filter(field, to_uint(args.substr(2,args.size()-2))));
					}
					break;
			}
			break;
		// Number or (Number OR range)
		default: {
			size_t start;

			// Range (e.g., 1234-5678)
			if ((field == tp_src_port || field == tp_dst_port) && args[pos] == '-') {
				uint32_t lower = to_uint(args.substr(0, pos));
				start = pos + 1;
				pos = args.find_first_not_of(numbers, start);
				uint32_t upper = to_uint(args.substr(start, pos));
				f = Filter(field, lower, upper);
			} else {
				f = Filter(field, to_uint(args.substr(0, pos)));
			}

			start = args.find_first_of(numbers, pos);

			while (start != std::string::npos) {
				// TODO: check that it's or/|| in the middle
				pos = args.find_first_not_of(numbers, start);

				// Range (e.g., 1234-5678)
				if ((field == tp_src_port || field == tp_dst_port) && args[pos] == '-') {
					uint32_t lower = to_uint(args.substr(start, pos));
					start = pos + 1;
					pos = args.find_first_not_of(numbers, start);
					uint32_t upper = to_uint(args.substr(start, pos));

					f.unite(Filter(field, lower, upper));
				} else {
					std::string s = args.substr(start, pos-start);
					f.unite(Filter(field,to_uint(args.substr(start, pos - start))));
				}
				start = args.find_first_of(numbers, pos);
			}

			return f;
		}
	}

	return f;
}

Filter
Filter::get_filter_from_prefix_pattern(HeaderField field, const std::string &args)
{
	std::string prefix_chars = "0123456789./";
	size_t pos = args.find_first_not_of(prefix_chars);
	Filter f;
	switch (pos) {
		case std::string::npos:
			f = get_filter_from_v4_prefix_str(field,args);
			break;
		// Either == or !=
		case 0:
			switch (args[0]) {
				case '=':
					if (args.size() < 2 || args[1] != '=') {
						FANCY_BUG(tc_log, "\tExpected '=' after = in: " + args);
					}
					f = get_filter_from_v4_prefix_str(field,args.substr(2,args.size()-2));
					break;
				case '!':
					if (args.size() < 2 || args[1] != '=') {
						FANCY_BUG(tc_log, "\tExpected '=' after ! in: " + args);
					}
					f = get_filter_from_v4_prefix_str(field,args.substr(2,args.size()-2));
					f = (Filter(field)).differentiate(f);
					break;
			}
			break;
		default: {
			f.make_none();
			size_t start = 0;
			while (start != std::string::npos) {
				pos = args.find_first_not_of(prefix_chars, start);
				f.unite(get_filter_from_v4_prefix_str(field, args.substr(start, pos - start)));
				start = args.find_first_of(prefix_chars, pos);
			}
		}
	}
	return f;
}

bool
Filter::match(uint32_t value) const
{
	return (m_filter.contains(value) && !m_to_subtract.contains(value));
}

bool
Filter::contains(const Filter &filter) const
{
	DisjointSegmentList is_in = filter.m_filter;
	is_in.substract_seglist(filter.m_to_subtract);
	DisjointSegmentList contains = m_filter;
	contains.substract_seglist(m_to_subtract);
	return contains.contains_seglist(is_in);
}

bool
Filter::is_none(void) const
{
	return (m_filter.empty() || m_to_subtract.contains_seglist(m_filter));
}

Filter &
Filter::translate(uint32_t value, bool forward)
{
	m_filter.translate(value, forward);
	m_to_subtract.translate(value, forward);
	return *this;
}

Filter &
Filter::unite(const Filter &filter)
{
	debug_chatter(tc_log, "Unite: " + to_str() + " with " + filter.to_str());

	m_filter.add_seglist(filter.m_filter);
	m_to_subtract.substract_seglist(filter.m_filter);
	DisjointSegmentList temp = filter.m_to_subtract;
	temp.substract_seglist(m_filter);
	m_to_subtract.add_seglist(temp);

	return *this;
}

Filter &
Filter::intersect(const Filter &filter)
{
	debug_chatter(tc_log, "Intersect: " + to_str() + " with " + filter.to_str());

	m_filter.intersect_seglist(filter.m_filter);
	m_to_subtract.add_seglist(filter.m_to_subtract);

	return *this;
}

Filter &
Filter::differentiate(const Filter &filter)
{
	debug_chatter(tc_log, "Differentiate: " + filter.to_str() + " from " + to_str());

	m_to_subtract.add_seglist(filter.m_filter);

	return *this;
}

bool
Filter::operator== (const Filter &rhs) const
{
	DisjointSegmentList lhs_dsl = this->m_filter;
	lhs_dsl.substract_seglist(this->m_to_subtract);

	DisjointSegmentList rhs_dsl = rhs.m_filter;
	rhs_dsl.substract_seglist(rhs.m_to_subtract);

	return (this->m_field == rhs.m_field && lhs_dsl == rhs_dsl);
}

bool
Filter::operator!= (const Filter &rhs) const
{
	return !(*this == rhs);
}

void
Filter::make_none(void)
{
	this->m_filter      = DisjointSegmentList();
	this->m_to_subtract = DisjointSegmentList();
}

std::string
Filter::to_str(void) const
{
	switch (m_field) {
		case ip_src:
		case ip_dst:
			return "Filter on " + header_field_names[m_field] + ": " + m_filter.to_ip_str();
		default:
			return "Filter on " + header_field_names[m_field] + ": " + m_filter.to_str();
	}
}

/*
 * Translate all the segments of a filter into
 * a format understandable by Click's IPClassifier.
 */
std::string
Filter::to_ip_classifier_pattern(void) const
{
	std::string keyword;
	std::string output;

	switch (m_field) {
		case ip_ver:
			keyword = "ip vers ";
			break;
		case ip_src:
			keyword = "src net ";
			return ip_filter_to_ip_classifier_pattern(keyword);
		case ip_dst:
			keyword = "dst net ";
			return ip_filter_to_ip_classifier_pattern(keyword);
		case ip_proto:
			keyword = "ip proto ";
			break;
		case ip_ihl:
			keyword = "ip ihl ";
			break;
		case ip_id:
			keyword = "ip id ";
			break;
		case ip_dscp:
			keyword = "ip dscp ";
			break;
		case ip_ect:
			if (match(1)) {
				return "ip ect";
			} else {
				return "!(ip ect)";
			}
		case ip_ce:
			if (match(1)) {
				return "ip ce";
			} else {
				return "!(ip ce)";
			}
		case ip_TTL:
			keyword = "ip ttl ";
			break;
		case icmp_type:
			keyword = "icmp type ";
			break;
		case tp_src_port:
			keyword = "src port ";
			break;
		case tp_dst_port:
			keyword = "dst port ";
			break;
		case tcp_flag_syn:
			if (match(1)) {
				return "syn";
			} else {
				return "!(syn)";
			}
		case tcp_flag_ack:
			if (match(1)) {
				return "ack";
			} else {
				return "!(ack)";
			}
		case tcp_flag_psh:
			if (match(1)) {
				return "tcp opt psh";
			} else {
				return "!(tcp opt psh)";
			}
		case tcp_flag_rst:
			if (match(1)) {
				return "tcp opt rst";
			} else {
				return "!(tcp opt rst)";
			}
		case tcp_flag_fin:
			if (match(1)) {
				return "tcp opt fin";
			} else {
				return "!(tcp opt fin)";
			}
		case tcp_flag_urg:
			if (match(1)) {
				return "tcp opt urg";
			} else {
				return "!(tcp opt urg)";
			}
		case tcp_win:
			keyword = "tcp win ";
			break;
		case ambiguous_field: {
			// ip[POS:LEN] matching of IPClassifier
			std::string pos_str = 	"[" + std::to_string(m_field_pos) +
						":" + std::to_string(m_field_len) + "]";
			keyword = "ip" + pos_str;
			break;
		}
		default:
			FANCY_BUG(tc_log, "\tCannot convert filter to IPClassifier");
	}

	std::vector<std::pair<uint32_t, uint32_t> > segments = m_filter.get_segments();

	for (auto &seg : segments) {
		// FIXME: handle IP subnets differently
		if (seg.first == seg.second) {
			output+= "("+keyword + std::to_string(seg.first) + ") || ";
		} else {
			if (seg.first == 0) {
				output += keyword + "<= " + std::to_string(seg.second);
			} else {
				if (seg.second == 0xffffffff) {
					output += keyword + ">= " + std::to_string(seg.first);
				} else {
					output += "(" + keyword + ">= " + std::to_string(seg.first) + " && "
						+ keyword + "<= " + std::to_string(seg.second) + ")";
				}
			}
			output += " || ";
		}
	}

	// Removes trailing  " || "
	output = output.substr(0, output.size() - 4);

	// Lazy subtraction
	if (!m_to_subtract.empty()) {
		output  += " && !(";
		segments = m_to_subtract.get_segments ();

		for (auto &seg:segments) {
			// FIXME: handle IP subnets differently
			if (seg.first == seg.second) {
				output += "(" + keyword + std::to_string(seg.first) + ") || ";
			} else {
				output += "(" + keyword + ">= " + std::to_string(seg.first) + " && "
						+ keyword + "<= " + std::to_string(seg.second) + ") || ";
			}
		}

		// Removes trailing  " || "
		output = output.substr(0, output.size() - 4);
		output += ")";
	}

	return output;
}

/*
 * Translate all the segments of a filter into
 * a format understandable by Click's IPFilter.
 */
std::string
Filter::to_ip_filter_pattern(bool allowed) const
{
	std::string action;
	if (allowed) {
		action = "allow ";
	} else {
		action = "drop ";
	}

	return action + to_ip_classifier_pattern();
}

/*
 * Translate all the segments of a filter into
 * a format understandable by Flow Director.
 */
std::string
Filter::to_flow_director_pattern(void) const
{
	std::string keyword;
	std::string output;

	switch (m_field) {
		case ip_ver:
			keyword = "flow-type ip";
			break;
		case ip_src:
			keyword = "src-ip ";
			return ip_filter_to_ip_classifier_pattern(keyword);
		case ip_dst:
			keyword = "dst-ip ";
			return ip_filter_to_ip_classifier_pattern(keyword);
		case ip_proto:
			keyword = "proto ";
			break;
		case ip_ihl:
		case ip_id:
		case ip_dscp:
		case ip_ect:
		case ip_ce:
		case ip_TTL:
			throw std::runtime_error("IP field " + to_str() + " is not supported by Flow Director");
		case tp_src_port:
			keyword = "src-port ";
			break;
		case tp_dst_port:
			keyword = "dst-port ";
			break;
		case tcp_flag_syn:
		case tcp_flag_ack:
		case tcp_flag_psh:
		case tcp_flag_rst:
		case tcp_flag_fin:
		case tcp_flag_urg:
		case tcp_win:
			throw std::runtime_error("TCP field " + to_str() + " is not supported by Flow Director");
		default:
			throw std::runtime_error("Cannot convert filter " + to_str() + " to Flow Director");
	}

	output = keyword;
	throw std::runtime_error("Flow-Director traffic classification is not implemented");

	return output;
}

/*
 * Algorithm to decompose interval in prefixes: we take the biggest possible prefix
 * containing lower and whose bounds are <= upper, then we keep going on the rest.
 * This would go quicker if we could detect !() patterns.
 */
std::string
ip_segment_to_ip_class_pattern(std::string keyword, uint32_t lower, uint32_t upper)
{
	std::string output;
	uint32_t current_low = lower;

	while (current_low <= upper) {
		int prefix_size = 32;
		while (
			(prefix_size > 0) && ((current_low >> (32 - prefix_size)) % 2 == 0) &&
			(current_low + (0xffffffff >> (prefix_size-1)) <= upper)
		) {
			prefix_size--;
		}

		output += "(" + keyword + ntoa(current_low) + "/" + std::to_string(prefix_size) + ") || ";

		if (prefix_size == 32) {
			current_low++;
		} else {
			current_low += (0xffffffff >> prefix_size) + 1;
		}

		if (current_low == 0) {
			break;
		}
	}

	return output.substr(0, output.size() - 4);
}

/*
 * Translates a (complex) condition on IP src/dst address fields to
 * a format understandable by Click's IPClassfier element.
 */
std::string
Filter::ip_filter_to_ip_classifier_pattern(const std::string &keyword) const
{
	std::string output;
	std::vector<std::pair<uint32_t,uint32_t> > segments = this->m_filter.get_segments();

	if (segments.empty()) {
		return "none";
	}

	for (auto &seg:segments) {
		output += ip_segment_to_ip_class_pattern(keyword, seg.first, seg.second) + " || ";
	}

	// Removes trailing  " || "
	output = output.substr(0, output.size() - 4);

	if (!this->m_to_subtract.empty()) {
		output += " && !(";
		segments = this->m_to_subtract.get_segments();
		for (auto &seg:segments) {
			output += ip_segment_to_ip_class_pattern(keyword, seg.first, seg.second) + " || ";
		}
		output  = output.substr(0, output.size() - 4);
		output += ")";
	}
	return output;
}

std::string
Filter::ip_filter_to_flow_director_pattern(const std::string &keyword) const
{
	std::string output;

	// Get all the segments of the filter
	std::vector<std::pair<uint32_t,uint32_t> > segments = this->m_filter.get_segments();
	if (segments.empty()) {
		return "none";
	}

	for (auto &seg:segments) {
		output += ip_segment_to_ip_class_pattern(keyword, seg.first, seg.second) + " || ";
	}

	return output;
}

HeaderField
Filter::get_field(void) const
{
	return this->m_field;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////
// Condition
//////////////////////////////////////////////////////////////////////////////////////////////////////
Condition::Condition (
	HeaderField field, std::shared_ptr<ClickElement> elem, Filter filter, FieldOperation op
) : m_field(field), m_filter(filter), m_current_write(op), m_element(elem)
{

}

bool
Condition::is_same_write (const FieldOperation &op) const
{
	return op == this->m_current_write;
}

bool
Condition::intersect(const Filter &filter)
{
	this->m_filter.intersect(filter);
	return this->m_filter.is_none();
}

bool
Condition::is_none(void) const
{
	return this->m_filter.is_none();
}

std::string
Condition::to_str(void) const
{
	return "\tCondition on " + this->m_element->to_str() + ": " + this->m_filter.to_str();
}


//////////////////////////////////////////////////////////////////////////////////////////////////////
// TrafficClass
//////////////////////////////////////////////////////////////////////////////////////////////////////
TrafficClass::TrafficClass()
	:
	m_output_iface(), m_nf_of_output_iface(), m_filters(),
	m_write_conditions(), m_calc_checksum(false),
	m_ether_encap_conf(), m_element_path(), m_operation(),
	m_post_operations(), m_stateful_input_port(0)
{

}

bool
TrafficClass::is_discarded(void) const
{
	return (this->m_element_path.back()->get_type() == Discard ||
		this->m_element_path.back()->get_type() == Discard_def);
}

bool
TrafficClass::is_source_nated(void)
{
	FieldOperation *src_port = m_operation.get_field_op(tp_src_port);
	return (src_port && src_port->m_type == WriteSF);
}

/*
 * Add a post-routing element to the list of elements to be synthesized
 * by SNF's IPSytnhesizer.
 */
void
TrafficClass::add_post_routing_operation(const ElementType &et)
{
	// These elements modify part of the header, checksum(s) need(s)
	// to be re-calculated.
	if (
		(et == FixIPSrc) || (et == IPGWOptions) ||
		(et == DecIPTTL) || (et == IPOutputCombo)
	) {
		this->m_calc_checksum = true;
	}

	if (!this->has_post_routing_operation(et)) {
		this->m_post_operations.push_back(et);
	}
}

/*
 * Check if a given element is present in the post-modification
 * pipeline of a traffic class. If so, an appropriate parameter
 * can be given to the IPSynthesizer in order to integrate this
 * element internally.
 */
bool
TrafficClass::has_post_routing_operation(const ElementType &et)
{
	return exists_in_vector(this->m_post_operations, et);
}

/*
 * Retrieve all the post-routing operations of a traffic class
 */
std::vector<ElementType>
TrafficClass::get_post_routing_operations(void)
{
	return this->m_post_operations;
}

/*
 * Here we explicitely apply only a discard operation.
 * Other operations are kept in data structures that
 * are used to configure the IPSynthesizer (which
 * synthesizes these operations internally).
 */
std::string
TrafficClass::post_routing_pipeline(void)
{
	if (this->is_discarded()) {
		return "Discard();";
	}

	return "";
}

/*
 * Returns the configuration of the IPSynthesizer.
 * This configuration encodes the post-routing operations
 * to be synthesized.
 */
std::string
TrafficClass::post_routing_synthesis_configuration(void)
{
	unsigned short counter = 0;
	std::string output;
	for (auto &pr : this->m_post_operations) {
		output += ElementToKeyword.at(pr) + " true";
		if (counter < (this->m_post_operations.size() - 1)) {
			output += ", ";
		}
		counter++;
	}

	if (this->m_calc_checksum) {
		output += ", CALC_CHECKSUM true";
	}

	return output;
}

std::string
TrafficClass::to_ip_classifier_pattern(void) const
{
	std::string output;
	for (auto &it : this->m_filters) {
		output += "(" + it.second.to_ip_classifier_pattern() + ") && ";
	}

	// Removes trailing " && "
	return output.substr(0, output.size() - 4);
}

std::string
TrafficClass::to_ip_filter_pattern(bool allowed) const
{
	std::string action;
	if (allowed) {
		action = "allow ";
	} else {
		action = "drop ";
	}

	std::string output = action;
	for (auto &it : this->m_filters) {
		output += "(" + it.second.to_ip_classifier_pattern() + ") && ";
	}

	// Removes trailing " && "
	return output.substr(0, output.size() - 4);
}

std::string
TrafficClass::to_flow_director_pattern(void) const
{
	std::string output;
	for (auto &it : this->m_filters) {
		output += it.second.to_flow_director_pattern() + " ";
	}

	return output;
}

int
TrafficClass::intersect_filter(const Filter &filter)
{
	HeaderField field = filter.get_field();
	auto got = this->m_filters.find(field);

	if (got == this->m_filters.end()) {
		this->m_filters[field] = filter;
	} else {
		this->m_filters[field].intersect(filter);
	}

	return (int) (this->m_filters[field].is_none());
}

int
TrafficClass::intersect_condition(const Filter &condition, const FieldOperation &operation)
{
	HeaderField field = condition.get_field();
	auto got = this->m_write_conditions.find(field);

	if (got == this->m_write_conditions.end() ||
		!this->m_write_conditions[field].back().is_same_write(operation)) {
		this->m_write_conditions[field].push_back(
			Condition(field, this->m_element_path.back(), condition, operation)
		);
	} else {
		this->m_write_conditions[field].back().intersect(condition);
	}

	return (int) this->m_write_conditions[field].back().is_none();
}

int
TrafficClass::add_element(std::shared_ptr<ClickElement> element, const int port, unsigned short *wr_op_no)
{
	int nb_none_filters = 0;
	(this->m_element_path).push_back(element);

	// Post-routing operations are kept in a map
	if (
		(element->get_type() == DropBroadcasts) ||
		(element->get_type() == IPGWOptions)    ||
		(element->get_type() == FixIPSrc)       ||
		(element->get_type() == DecIPTTL)       ||
		(element->get_type() == IPOutputCombo)  ||
		(element->get_type() == IPFragmenter)
	) {
		this->add_post_routing_operation(element->get_type());
	} else if (
			(element->get_type() == EtherEncap) ||
			(element->get_type() == StoreEtherAddress)) {
		// Interface configuration
		this->m_ether_encap_conf = element->get_configuration();
	}

	// Last element of the chain -> no children
	if (port == -1) {
		return 0;
	}
	PacketFilter pf = (element->get_output_classes()[port]).get_filter();

	for_fields_in_pf(it, pf) {
		HeaderField field = it->first;
		Filter filter = it->second;

		FieldOperation *field_op = this->m_operation.get_field_op(field);

		if (field_op) {
			uint32_t field_value = field_op->m_value[0];
			switch (field_op->m_type) {
				case Write:
					if (!filter.match(field_value)) {
						(this->m_filters[field]).make_none();
						nb_none_filters++;
					}
					if (wr_op_no) {
						debug_chatter(tc_log, "\t\tWrite");
						(*wr_op_no)++;
					}
					break;
				case Translate: {
					Filter translated_filter = filter;
					if (field_value > 0) {
						translated_filter.translate(field_value,true);
					}
					/* FIXME: INFEASIBLE because variable is unsigned */
				//	else if(field_value < 0) {
				//		translated_filter.translate(-field_value, false);
				//	}
					nb_none_filters += intersect_filter(translated_filter);
					debug_chatter(tc_log, "\t\tTranslate");
					break;
				}
				case WriteRR:
				case WriteRa:
				case WriteSF: {
					Filter write_condition(field, field_op->m_value[0], field_op->m_value[1]);
					if (!filter.contains(write_condition)) {
						write_condition.intersect (filter);
						nb_none_filters += intersect_condition (write_condition, *field_op);
						// FIXME: what if I have successive range writes?
					}
					if (wr_op_no) {
						debug_chatter(tc_log, "\t\tWrite RR/Ra/SF");
						(*wr_op_no)++;
					}
					break;
				}
				case WriteLB: {
					Filter write_condition(field);
					write_condition.make_none();
					for (auto &value : field_op->m_lb_values) {
						write_condition.unite(Filter(field,value));
					}
					if (!filter.contains(write_condition)) {
						write_condition.intersect (filter);
						nb_none_filters += intersect_condition (write_condition, *field_op);
						// FIXME: what if I have successive range writes?
					}
					if (wr_op_no) {
						debug_chatter(tc_log, "\t\tWrite LB");
						(*wr_op_no)++;
					}
					break;
				}
				default:
					FANCY_BUG(tc_log, "\tFound non modifying operation");
			}
		} else {
			nb_none_filters += intersect_filter(filter);
			debug_chatter(tc_log, "\t\tNo operation");
		}
	}

	this->m_operation.compose_op((element->get_output_classes()[port]).get_operation());
	return nb_none_filters;
}

const std::string
TrafficClass::get_output_iface_conf(void)
{
	std::string iface_conf = "";

	if (!this->is_discarded()) {
		if (this->m_element_path.size() > 1) {
			std::shared_ptr<ClickElement> todev = NULL;

			// Search backwards for the last output element
			for (int i = this->m_element_path.size() - 1; i >= 0; --i) {
				std::shared_ptr<ClickElement> el = this->m_element_path[i];
				if ((el->get_type() == ToDevice)     ||
					(el->get_type() == ToNetFront)   ||
					(el->get_type() == ToDPDKDevice))
				{
					todev = el;
					break;
				}
			}

			// Something is not right here!
			if (todev == NULL) {
				return "";
			}

			// Configuration contains interface name and other parameters
			std::vector<std::string> conf = split(todev->get_configuration(), ",");
			/**
			 * We discard the interface name.
			 * TODO: Make this robust
			 */
			conf.erase(conf.begin());
			this->set_output_iface_conf(vector_to_str(conf, ","));

			return this->m_output_iface_conf;
		}
	} else {
		warn_chatter(tc_log, "\tNo output interface configuration for a discarded traffic class");
	}

	return iface_conf;
}

const std::string
TrafficClass::get_output_iface(void)
{
	std::string iface = "";

	if (!this->is_discarded()) {
		if (this->m_element_path.size() > 1) {
			std::shared_ptr<ClickElement> todev = NULL;

			// Search backwards for the last output element
			for (int i = this->m_element_path.size() - 1; i >= 0; --i) {
				std::shared_ptr<ClickElement> el = this->m_element_path[i];
				if ((el->get_type() == ToDevice)     ||
					(el->get_type() == ToNetFront)   ||
					(el->get_type() == ToDPDKDevice))
				{
					todev = el;
					break;
				}
			}

			// Something is not right here!
			if (todev == NULL) {
				return "";
			}

			iface = split(todev->get_configuration(), ",")[0];
			this->set_output_iface(iface);
			this->set_nf_of_output_iface(todev->get_nf_name());

			return iface;
		}
	} else {
		warn_chatter(tc_log, "\tNo output interface for a discarded traffic class");
	}

	return iface;
}

std::string
TrafficClass::get_nf_of_output_iface(void) const
{
	return this->m_nf_of_output_iface;
}

Operation
TrafficClass::get_operation(void) const
{
	return this->m_operation;
}

void
TrafficClass::set_stateful_rewriter(
	const std::shared_ptr<StatefulSynthesizer> &sf,
	const unsigned short &port)
{
	this->m_stateful = sf;
	this->m_stateful_input_port = port;
}

void
TrafficClass::set_output_iface(const std::string &iface)
{
	this->m_output_iface = iface;
}

void
TrafficClass::set_output_iface_conf(const std::string &iface_conf)
{
	this->m_output_iface_conf = iface_conf;
}

void
TrafficClass::set_nf_of_output_iface(const std::string &nf)
{
	this->m_nf_of_output_iface = nf;
}

std::string
TrafficClass::to_str(void) const
{
	std::string output = "\n================= Begin Traffic Class =================\nFilters:";
	output += this->to_ip_classifier_pattern();
	output += "\nConditions on Write operations:\n";

	for_fields_in_pf(it, m_write_conditions) {
		for(auto &condition : it->second) {
			output += ("\t"+condition.to_str()+"\n");
		}
	}
	output += m_operation.to_str();

	output += "Passed elements: \n\t";
	for (auto it : m_element_path) {
		output += element_names[it->get_type()];
		if (it->is_leaf()) {
			output += "\n";
		} else {
			output += "->";
		}
	}
	output += "=================  End Traffic Class  =================\n";

	return output;
}

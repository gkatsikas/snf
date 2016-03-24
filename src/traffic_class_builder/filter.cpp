// -*- c-basic-offset: 4 -*-
/* filter.cpp
 * 
 * Implementation of Hyper-NF's traffic class filter.
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

#include "filter.hpp"
#include "output_class.hpp"
#include "click_element.hpp"

#include "../shared/helpers.hpp"
#include "../synthesizer/synth_nat.hpp"

// The logger of traffic class-related classes
Logger tc_log(__FILE__);

#define MIN(a,b) (a>b) ? b : a
#define MAX(a,b) (a>b) ? a : b

#define IN_RANGE(x,lower,upper) (x>=lower && x<=upper)

//////////////////////////////////////////////////////////////////////////////////////////////////////
// Filter
//////////////////////////////////////////////////////////////////////////////////////////////////////

Filter::Filter() : Filter(unknown, 0, UINT32_MAX) {}

Filter::Filter(HeaderField field) : Filter(field, 0, UINT32_MAX) {}

Filter::Filter(HeaderField field,uint32_t value) : Filter(field, value, value) {}

Filter::Filter (HeaderField field, uint32_t lower_value, uint32_t upper_value) :
				m_field(field), m_filter(), m_to_subtract() {
	m_filter.add_segment(lower_value,upper_value);
	if(lower_value > upper_value) {
		FANCY_BUG(tc_log, "Weird filter: ");
	}
}

Filter
Filter::get_filter_from_v4_prefix(HeaderField field, uint32_t value, uint32_t prefix) {

	if(prefix > 32) {
		FANCY_BUG(tc_log, "Prefix higher than 32");
	}
	else if(prefix==32) {
		return Filter(field,value);
	}
	uint32_t translation = 32 - prefix;
	uint32_t lowerLimit = value & (0xffffffff << translation);
	uint32_t upperLimit = value | (0xffffffff >> prefix);
	if(lowerLimit > upperLimit) {
		FANCY_BUG(tc_log, "Weird filter");
	}
	
	return Filter(field, lowerLimit, upperLimit);
}

Filter
Filter::get_filter_from_v4_prefix_str(HeaderField field, const std::string &prefix_as_str) {
	debug_chatter(tc_log, "Parsing: "+prefix_as_str);

	size_t prefix_pos = prefix_as_str.find("/");
	uint32_t addr = aton(prefix_as_str.substr(0,prefix_pos));
	uint32_t prefix = atoi(prefix_as_str.substr(prefix_pos+1,2).c_str());
	
	
	return get_filter_from_v4_prefix(field, addr, prefix);
}

Filter
Filter::get_filter_from_ipclass_pattern(HeaderField field, const std::string &args) {

	//Cases:
	//1234
	//1234-5678
	//[=<>!]= 1234
	//[<>] 1234
	//1234 or 4567
	//1234 || 1234

	std::string numbers = "0123456789";
	std::function<uint32_t(std::string)> to_uint = [](std::string a){return atoi(a.c_str()); };
	if(field==ip_src || field==ip_dst) {
		to_uint = &aton;
		numbers += ".";
	}

	size_t pos = args.find_first_not_of(numbers);
	Filter f;

	switch (pos) {
		case std::string::npos: //1234
			return Filter(field,to_uint(args));
		case 0: //either [=<>!]= 1234 or [<>] 1234
			if(args.size() < 3) {
				FANCY_BUG(tc_log, "Wrong argument in IPFilter: "+args);
			}
			switch (args[0]) {
				case '=':
					if (args.size() < 2 || args[1]!='=') {
						FANCY_BUG(tc_log, "Wrong argument in IPFilter: "+args+"\n\tExpected '='");
					}
					else {
						f = Filter(field,to_uint(args.substr(2,args.size()-2)));
					}
					break;
				case '<':
					switch (args[1]) {
						case '=':
							f = Filter(field,0,to_uint(args.substr(2,args.size()-2)));
							break;
						case ' ':
							f = Filter(field,0,to_uint(args.substr(2,args.size()-2))-1);
							break;
						default:
							FANCY_BUG(tc_log, "Wrong argument in IPFilter: "+args+"\n\tExpected one of ' ' or '='");
					}
					break;
				case '>':
					switch (args[1]) {
						case '=':
							f = Filter(field,to_uint(args.substr(2,args.size()-2)), UINT32_MAX);
							break;
						case ' ':
							f = Filter(field,to_uint(args.substr(2,args.size()-2))+1, UINT32_MAX);
							break;
						default:
							FANCY_BUG(tc_log, "Wrong argument in IPFilter: "+args+"\n\tExpected one of ' ' or '='");
					}
					break;
				case '!':
					if (args[1]!='=') {
						FANCY_BUG(tc_log, "Wrong argument in IPFilter: "+args+"\n\tExpected '='");
					}
					else {
						f = Filter(field);
						f.differentiate(Filter(field,to_uint(args.substr(2,args.size()-2))));
					}
					break;
			}
			break;
		default: {//1234 or 1234 OR 1234-5678

			size_t start;

			if( (field==tp_srcPort || field == tp_dstPort) && args[pos] == '-') {
			//1234-5678
				uint32_t lower = to_uint(args.substr(0,pos));
				start = pos+1;
				pos = args.find_first_not_of(numbers,start);
				uint32_t upper = to_uint(args.substr(start,pos));
				f= Filter(field,lower,upper);
			}
			else {
				f = Filter(field,to_uint(args.substr(0,pos)));
			}

			start = args.find_first_of(numbers,pos);

			while (start != std::string::npos) {
				//TODO_ check that it's or/|| in the middle
				pos = args.find_first_not_of(numbers,start);

				if( (field==tp_srcPort || field == tp_dstPort) && args[pos] == '-') {
				//1234-5678
					uint32_t lower = to_uint(args.substr(start,pos));
					start = pos+1;
					pos = args.find_first_not_of(numbers,start);
					uint32_t upper = to_uint(args.substr(start,pos));
					f.unite(Filter(field,lower,upper));

				}
				else {
					f.unite(Filter(field,to_uint(args.substr(start,pos-start))));
				}
				start = args.find_first_of(numbers,pos);
			}
			return f;
		}
	}
	return f;
}

Filter
Filter::get_filter_from_prefix_pattern(HeaderField field, const std::string &args) {
	std::string prefix_chars = "0123456789./";
	size_t pos = args.find_first_not_of(prefix_chars);
	Filter f;
	switch (pos) {
		case std::string::npos:
			f = get_filter_from_v4_prefix_str(field,args);
			break;
		case 0: //Either == or !=
			switch (args[0]) {
				case '=':
					if (args.size() < 2 || args[1] != '=') {
						FANCY_BUG(tc_log, "Unknown comparator: "+args);
					}
					f = get_filter_from_v4_prefix_str(field,args.substr(2,args.size()-2));
					break;
				case '!':
					if (args.size() < 2 || args[1] != '=') {
						FANCY_BUG(tc_log, "Unknown comparator: "+args);
					}
					f = get_filter_from_v4_prefix_str(field,args.substr(2,args.size()-2));
					f = (Filter(field)).differentiate(f);
					break;
			}
			break;
		default: {
			f.make_none();
			size_t start=0;
			while (start != std::string::npos) {
				pos = args.find_first_not_of(prefix_chars,start);
				f.unite(get_filter_from_v4_prefix_str(field,args.substr(start,pos-start)));
				start = args.find_first_of(prefix_chars,pos);
			}
		}
	}
	return f;
}

bool
Filter::match(uint32_t value) const {
	return (m_filter.contains(value) && !m_to_subtract.contains(value));
}

bool
Filter::contains (const Filter &filter) const{
	DisjointSegmentList is_in = filter.m_filter;
	is_in.substract_seglist(filter.m_to_subtract);
	DisjointSegmentList contains = m_filter;
	contains.substract_seglist (m_to_subtract);
	return contains.contains_seglist(is_in);
}

bool
Filter::is_none(void) const {
	return (m_filter.empty() || m_to_subtract.contains_seglist(m_filter));
}

Filter&
Filter::translate(uint32_t value, bool forward) {
	m_filter.translate(value,forward);
	m_to_subtract.translate(value,forward);
	return *this;
}

Filter&
Filter::unite (const Filter &filter) {
	debug_chatter(tc_log, "unite "+to_str());
	m_filter.add_seglist(filter.m_filter);
	m_to_subtract.substract_seglist (filter.m_filter);
	DisjointSegmentList temp = filter.m_to_subtract;
	temp.substract_seglist (m_filter);
	m_to_subtract.add_seglist(temp);
	return *this;
}

Filter&
Filter::intersect (const Filter &filter) {
	debug_chatter(tc_log, "intersect "+to_str()+" with "+filter.to_str());
	m_filter.intersect_seglist(filter.m_filter);
	m_to_subtract.add_seglist(filter.m_to_subtract);
	return *this;
}

Filter&
Filter::differentiate (const Filter &filter) {
	debug_chatter(tc_log, "Differentiate"+to_str());
	m_to_subtract.add_seglist(filter.m_filter);
	return *this;
}

bool
Filter::operator== (const Filter& rhs) const {
	DisjointSegmentList lhs_dsl = this->m_filter;
	lhs_dsl.substract_seglist(this->m_to_subtract);
	DisjointSegmentList rhs_dsl = rhs.m_filter;
	rhs_dsl.substract_seglist(rhs.m_to_subtract);
	return (this->m_field == rhs.m_field && lhs_dsl == rhs_dsl);
}

void
Filter::make_none (void) {
	this->m_filter = DisjointSegmentList();
	this->m_to_subtract = DisjointSegmentList ();
}

std::string
Filter::to_str (void) const{
	switch (m_field) {
		case ip_src:
		case ip_dst:
			return "Filter on "+header_field_names[m_field]+": "+m_filter.to_ip_str();
		default:
			return "Filter on "+header_field_names[m_field]+": "+m_filter.to_str();
	}
}

/*
 * Translate all the segments of a filter into
 * a format understandable by Click's IPClassifier.
 */
std::string
Filter::to_ip_classifier_pattern(void) const {
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
			if ( match(1) ) { return "ip ect"; }
			else { return "!(ip ect)"; }
		case ip_ce:
			if ( match(1) ) { return "ip ce"; }
			else { return "!(ip ce)"; }
		case ip_TTL:
			keyword = "ip ttl ";
			break;
		case tp_srcPort:
			keyword = "src port ";
			break;
		case tp_dstPort:
			keyword = "dst port ";
			break;
		case tcp_syn:
			if ( match(1) ) { return "syn"; }
			else { return "!(syn)"; }
		case tcp_ack:
			if ( match(1) ) { return "ack"; }
			else { return "!(ack)"; }
		case tcp_psh:
			if ( match(1) ) { return "tcp opt psh"; }
			else { return "!(tcp opt psh)"; }
		case tcp_rst:
			if ( match(1) ) { return "tcp opt rst"; }
			else { return "!(tcp opt rst)"; }
		case tcp_fin:
			if ( match(1) ) { return "tcp opt fin"; }
			else { return "!(tcp opt fin)"; }
		case tcp_urg:
			if ( match(1) ) { return "tcp opt urg"; }
			else { return "!(tcp opt urg)"; }
		case tcp_win:
			keyword = "tcp win ";
			break;
		default:
			FANCY_BUG(tc_log, "Cannot convert filter to IPClassifier ");
	}

	std::vector<std::pair<uint32_t,uint32_t> > segments = m_filter.get_segments();

	for  (auto &seg:segments) {
		//FIXME: handle IP subnets differently
		if ( seg.first == seg.second ) {
			output+= "("+keyword + std::to_string(seg.first) + ") || ";
		}
		else {
			if ( seg.first == 0 ) {
				output += keyword + "<= " + std::to_string(seg.second);
			}
			else {
				if ( seg.second == 0xffffffff ) {
					output += keyword + ">= " + std::to_string(seg.first);
				}
				else {
					output += "(" + keyword + ">= " + std::to_string(seg.first) + " && "
							+ keyword + "<= " + std::to_string(seg.second) + ")";
				}
			}
			output += " || ";
		}
	}
	
	output = output.substr(0,output.size()-4);

	// Lazy subtraction
	if ( !m_to_subtract.empty() ) {
		output  += " && !(";
		segments = m_to_subtract.get_segments ();
		
		for  (auto &seg:segments) {
			//FIXME: handle IP subnets differently
			if ( seg.first == seg.second ) {
				output+= "(" + keyword + std::to_string(seg.first) + ") || ";
			}
			else {
				output += "(" + keyword + ">= " + std::to_string(seg.first) + " && "
						+ keyword + "<= " + std::to_string(seg.second) + ") || ";
			}
		}
		output = output.substr(0,output.size()-4);
		output += ")";
	}

	return output; // Removes trailing  " || "
}

/*
 * Translate all the segments of a filter into
 * a format understandable by Flow Director.
 */
std::string
Filter::to_flow_director_pattern(void) const {
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
		case tp_srcPort:
			keyword = "src-port ";
			break;
		case tp_dstPort:
			keyword = "dst-port ";
			break;
		case tcp_syn:
		case tcp_ack:
		case tcp_psh:
		case tcp_rst:
		case tcp_fin:
		case tcp_urg:
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
ip_segment_to_ip_class_pattern(std::string keyword, uint32_t lower, uint32_t upper) {

	std::string output;
	uint32_t current_low = lower;

	while ( current_low <= upper ) {
		int prefix_size = 32;
		while ( prefix_size > 0 && (current_low>>(32-prefix_size))%2 == 0 &&
				current_low + (0xffffffff>>(prefix_size-1)) <= upper) {
				prefix_size--;
		}

		output += "(" + keyword + ntoa(current_low) + "/" + std::to_string(prefix_size) + ") || ";

		if ( prefix_size == 32 ) {
			current_low++;
		}
		else {
			current_low += (0xffffffff >> prefix_size) + 1;
		}

		if ( current_low == 0 ) {
			break;
		}
	}

	return output.substr(0, output.size()-4);
}

/*
 * Translates a (complex) condition on IP src/dst address fields to
 * a format understandable by Click's IPClassfier element.
 */
std::string
Filter::ip_filter_to_ip_classifier_pattern(const std::string &keyword) const {
	std::string output;
	std::vector<std::pair<uint32_t,uint32_t> > segments = this->m_filter.get_segments();

	if ( segments.empty() ) {
		return "none";
	}

	for (auto &seg:segments) {
		output += ip_segment_to_ip_class_pattern(keyword, seg.first, seg.second)+" || ";
	}
	
	output = output.substr(0,output.size()-4);
	
	if( ! this->m_to_subtract.empty() ) {
		output += " && !(";
		segments = this->m_to_subtract.get_segments ();
		for (auto &seg:segments) {
			output += ip_segment_to_ip_class_pattern(keyword, seg.first, seg.second)+" || ";
		}
		output = output.substr(0,output.size()-4);
		output+=")";
	}
	return output;
}

std::string
Filter::ip_filter_to_flow_director_pattern(const std::string &keyword) const {
	std::string output;

	// Get all the segments of the filter
	std::vector<std::pair<uint32_t,uint32_t> > segments = this->m_filter.get_segments();
	if ( segments.empty() ) {
		return "none";
	}

	for (auto &seg:segments) {
		output += ip_segment_to_ip_class_pattern(keyword, seg.first, seg.second)+" || ";
	}

	return output;
}

HeaderField
Filter::get_field(void) const{
	return this->m_field;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////
// Condition
//////////////////////////////////////////////////////////////////////////////////////////////////////

Condition::Condition (HeaderField field, std::shared_ptr<ClickElement> elem, Filter filter, FieldOperation op) : 
						m_field(field), m_filter(filter), m_current_write(op), m_element(elem) {}

bool
Condition::is_same_write (const FieldOperation &op) const {
	return op == this->m_current_write;
}

bool
Condition::intersect(const Filter &filter) {
	this->m_filter.intersect(filter);
	return this->m_filter.is_none();
}

bool
Condition::is_none(void) const {
	return this->m_filter.is_none();
}

std::string
Condition::to_str(void) const {
	return "Condition on " + this->m_element->to_str() + ": " + this->m_filter.to_str();
}


//////////////////////////////////////////////////////////////////////////////////////////////////////
// TrafficClass
//////////////////////////////////////////////////////////////////////////////////////////////////////
TrafficClass::TrafficClass () : m_output_iface(), m_nf_of_output_iface(), m_filters(),
								m_write_conditions(), m_drop_broadcasts(false),
								m_ip_gw_options(false), m_ether_encap_conf(),
								m_element_path(), m_operation(), m_nat_input_port(0) {}

bool
TrafficClass::is_discarded(void) const {
	return (this->m_element_path.back()->get_type() == Discard ||
			this->m_element_path.back()->get_type() == Discard_def);
}

bool
TrafficClass::is_source_nated(void) {
	FieldOperation* src_port = m_operation.get_field_op(tp_srcPort);
	return (src_port && src_port->m_type==WriteSF);
}

std::string
TrafficClass::synthesize_chain (unsigned short &direction) {
	std::string output;
	if ( this->is_discarded() ) {
		output = "Discard();";
	}
	else {
		if(m_drop_broadcasts) {
			output += "DropBroadcasts() -> ";
		}

		if(m_ip_gw_options) {
			output += "IPGWOptions($ipAddr" + std::to_string(direction) + ") -> ";
		}
		/*
		if(m_nat) {
			output += "["+std::to_string(m_nat_input_port)+"]"+m_nat->get_name()+";";
		}
		else {
			output += "[0]IPRewriter(";
			
			std::string ipsrc, tpsrc, tpdst;

			FieldOperation* field_op = m_operation.get_field_op(ip_src);
			if(field_op) {
				if(field_op->m_type == Write) {
					ipsrc = ntoa(field_op->m_value[0]);
				}
				else {
					FANCY_BUG(tc_log, "Expected write operation");
				}
			}
			else{
				ipsrc = "-";
			}
	
			field_op = m_operation.get_field_op(tp_srcPort);
			if(field_op) {
				if(field_op->m_type == Write) {
					tpsrc = std::to_string(field_op->m_value[0]);
				}
				else {
					FANCY_BUG(tc_log, "Expected write operation, got "+m_operation.to_str());
				}
			}
			else{
				tpsrc = "-";
			}
			
			field_op = m_operation.get_field_op(tp_dstPort);
			if(field_op) {
				if(field_op->m_type == Write) {
					tpdst = std::to_string(field_op->m_value[0]);
				}
				else {
					FANCY_BUG(tc_log, "Expected write operation, got "+m_operation.to_str());
				}
			}
			else{
				tpdst = "-";
			}
	
			field_op = m_operation.get_field_op(ip_dst);
			if(field_op) {
				//TODO: add support for load balancing
				if(field_op->m_type == Write) {
					output += ipsrc+" "+tpsrc+" "+ntoa(field_op->m_value[0])+" "+tpdst+" ";
				}
				else if (field_op->m_type == WriteLB) {
					std::string rr_output = "RoundRobinIPMapper(";
					for (auto &ip : field_op->m_lb_values) {
						rr_output += ipsrc+" "+tpsrc+" "+ntoa(ip)+" "+tpdst+", ";
					}
					rr_output[rr_output.size()-2] = ')';
					output += rr_output;
				}
				else {
					FANCY_BUG(tc_log, "Expected write operation, got "+m_operation.to_str());
				}
			}
			else{
				output += ipsrc+" "+tpsrc+" "+"- "+tpdst+" ";
			}
			output += ");";
		}

		//field_op = m_operation.get_field_op(mtu);
		//if(field_op) {
		//	synthesized_chain.push_back(std::shared_ptr<ClickElement>(new ClickElement(DropBroadcasts,
		//									std::to_string(field_op->m_value[0]) )));
		//}

		//if(m_ether_encap_conf.empty()) {
		//	FANCY_BUG(tc_log, "Empty EtherEncap configuration");
		//}
		//synthesized_chain.push_back(std::shared_ptr<ClickElement>(new ClickElement(EtherEncap,m_ether_encap_conf)));
		//synthesized_chain.push_back(m_element_path.back());
		*/
	}

	return output;
}

std::string
TrafficClass::to_ip_classifier_pattern(void) const {
	std::string output;
	for (auto &it : this->m_filters) {
		output += "("+it.second.to_ip_classifier_pattern() + ") && ";
	}
	return output.substr(0, output.size()-4); //Removes trailing " && "
}

std::string
TrafficClass::to_flow_director_pattern(void) const {
	std::string output;
	for (auto &it : this->m_filters) {
		output += it.second.to_flow_director_pattern() + " ";
	}
	return output;
}

int
TrafficClass::intersect_filter(const Filter &filter) {
	HeaderField field = filter.get_field();
	auto got = this->m_filters.find(field);

	if ( got == this->m_filters.end() ) {
		this->m_filters[field] = filter;
	}
	else {
		this->m_filters[field].intersect(filter);
	}

	return (int) (this->m_filters[field].is_none());
}

int
TrafficClass::intersect_condition(const Filter &condition, const FieldOperation &operation) {
	HeaderField field = condition.get_field();
	auto got = this->m_write_conditions.find(field);

	if ( got == this->m_write_conditions.end() || 
		!this->m_write_conditions[field].back().is_same_write(operation) ) {
		
		this->m_write_conditions[field].push_back(
				Condition(field,this->m_element_path.back(),condition,operation)
		);
	}
	else {
		this->m_write_conditions[field].back().intersect(condition);
	}

	return (int) this->m_write_conditions[field].back().is_none();
}

int
TrafficClass::add_element (std::shared_ptr<ClickElement> element, const int port) {

	int nb_none_filters=0;
	(this->m_element_path).push_back(element);

	if(element->get_type() == IPGWOptions) {
		this->m_ip_gw_options = true;
	}
	else if(element->get_type() == DropBroadcasts) {
		this->m_drop_broadcasts = true;
	}
	else if(element->get_type() == EtherEncap) {
		this->m_ether_encap_conf = element->get_configuration();
	}

	if ( port == -1 ) { //Last element of the chain -> no children
		return 0;
	}
	PacketFilter pf = (element->get_output_classes()[port]).get_filter();

	for_fields_in_pf(it,pf) {
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
					break;
				case Translate: {
					Filter translated_filter = filter;
					if(field_value > 0) {
						translated_filter.translate(field_value,true);
					/* FIXME: INFEASIBLE because variable is unsigned */
					//}else if(field_value < 0) {
					//	translated_filter.translate(-field_value,false);
					}

					nb_none_filters += intersect_filter(translated_filter);
					break;
				}
				case WriteRR:
				case WriteRa:
				case WriteSF: {
					Filter write_condition(field, field_op->m_value[0], field_op->m_value[1]);
					if (! filter.contains(write_condition)) {
						write_condition.intersect (filter);
						nb_none_filters += intersect_condition (write_condition, *field_op);
						//FIXME: what if I have successive range writes?
					}
					break;
				}
				case WriteLB: {
					Filter write_condition(field);
					write_condition.make_none();
					for (auto &value : field_op->m_lb_values) {
						write_condition.unite(Filter(field,value));
					}
					if (! filter.contains(write_condition)) {
						write_condition.intersect (filter);
						nb_none_filters += intersect_condition (write_condition, *field_op);
						//FIXME: what if I have successive range writes?
					}
					break;
				}
				default:
					FANCY_BUG(tc_log, "Found non modifying operation");
			}
		}
		else {
			nb_none_filters+=intersect_filter(filter);
		}
	}

	this->m_operation.compose_op((element->get_output_classes()[port]).get_operation());
	return nb_none_filters;
}

const std::string
TrafficClass::get_output_iface_conf (void) {
	if ( ! this->is_discarded() ) {
		if ( this->m_element_path.size() > 1 ) {
			std::shared_ptr<ClickElement> todev = this->m_element_path.back();
			if ( todev->get_type() == ToDevice ) {
				// Configuration contains interface name and other parameters
				std::vector<std::string> conf = split( todev->get_configuration(), "," );
				// We discard the interface name
				conf.erase(conf.begin());
				this->set_output_iface_conf( vector_to_str(conf, ",") );
				return ( this->m_output_iface_conf );
			}
			else if ( todev->get_type() == No_elem ) {
				todev = this->m_element_path[this->m_element_path.size()-2];
				if ( todev->get_type() == ToDevice ) {
					// Configuration contains interface name and other parameters
					std::vector<std::string> conf = split( todev->get_configuration(), "," );
					// We discard the interface name
					conf.erase(conf.begin());
					this->set_output_iface_conf( vector_to_str(conf, ",") );
					return ( this->m_output_iface_conf );
				}
			}
		}
	}
	return "";
}

const std::string
TrafficClass::get_output_iface (void) {
	std::string iface;

	if ( ! this->is_discarded() ) {
		if ( this->m_element_path.size() > 1 ) {
			std::shared_ptr<ClickElement> todev = this->m_element_path.back();
			if ( todev->get_type() == ToDevice ) {
				iface = split( todev->get_configuration(), "," )[0];
				this->set_output_iface(iface);
				this->set_nf_of_output_iface(todev->get_nf_name());
				return iface;
			}
			else if ( todev->get_type() == No_elem ) {
				todev = this->m_element_path[this->m_element_path.size()-2];
				if ( todev->get_type() == ToDevice ) {
					iface = split( todev->get_configuration(), "," )[0];
					this->set_output_iface(iface);
					this->set_nf_of_output_iface(todev->get_nf_name());
					return iface;
				}
			}
		}
	}
	return "None";
}

std::string
TrafficClass::get_nf_of_output_iface(void) const {
	return this->m_nf_of_output_iface;
}

Operation
TrafficClass::get_operation (void) const {
	return this->m_operation;
}

void
TrafficClass::set_nat (const std::shared_ptr<SynthesizedNAT> &nat, const unsigned short &port) {
	this->m_nat = nat;
	this->m_nat_input_port = port;
}

void
TrafficClass::set_output_iface(const std::string &iface) {
	this->m_output_iface = iface;
}

void
TrafficClass::set_output_iface_conf(const std::string &iface_conf) {
	this->m_output_iface_conf = iface_conf;
}

void
TrafficClass::set_nf_of_output_iface(const std::string &nf) {
	this->m_nf_of_output_iface = nf;
}

std::string
TrafficClass::to_str(void) const {
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
			output+="\n";
		}
		else {
			output+="->";
		}
	}
	output += "=================  End Traffic Class  =================\n";

	return output;
}

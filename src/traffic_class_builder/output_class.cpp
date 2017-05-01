// -*- c-basic-offset: 4 -*-
/* output_class.cpp
 *
 * Implementation of the class that maps traffic class filters
 * to packet operations.
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

#include <cstdlib>
#include <iostream>

#include "header_fields.hpp"
#include "output_class.hpp"
#include "../shared/helpers.hpp"

// The logger of this module
Logger oc_log(__FILE__);

OutputClass::OutputClass (int port_nb)
	: m_port_number(port_nb), m_next_input_port(0), m_child(new ClickElement(No_elem, "")) {}

OutputClass
OutputClass::port_from_lookup_rule(std::string &rule, Filter &parsed_rules)
{
	// Lookup rules check only destination IP addresses!
	if (parsed_rules.get_field() != ip_dst) {
		FANCY_BUG(
			oc_log,
			"\tOutput class from lookup rule must be set" <<
			"on the destination IP address. Header field " <<
			header_field_names[(size_t) parsed_rules.get_field()] <<
			" is given instead."
		);
	}

	std::vector<std::string> decomposed_rule = split(rule, " \t\n");
	int nb_arg = decomposed_rule.size();

	if (nb_arg>3 || nb_arg<2) {
		FANCY_BUG(oc_log, "\tWrong lookup format: " << rule);
	}

	uint32_t port_nb = atoi(decomposed_rule[nb_arg-1].c_str());
	std::vector<std::string> address_and_mask = split(decomposed_rule[0],"/");
	Filter f;
	switch (address_and_mask.size()) {
		case 1:
			f = Filter(ip_dst, aton(decomposed_rule[0]));
			break;
		case 2:
			f = Filter::get_filter_from_v4_prefix(ip_dst, aton(address_and_mask[0]),
								atoi(address_and_mask[1].c_str()));
			break;
		default:
			FANCY_BUG(oc_log, "\tWrong lookup format: " << rule);
	}

	debug_chatter(oc_log, "\tFrom lookup rule \"" + rule + "\" we created: " + f.to_str());

	f.differentiate(parsed_rules);
	parsed_rules.unite(f);

	OutputClass port(port_nb);
	port.add_filter(ip_dst, f);

	return port;
}

std::pair<OutputClass,OutputClass>
OutputClass::output_class_from_pattern(std::vector<std::string> &pattern)
{
	// IPRewriter supported pattern: pattern SADDR SPORT DADDR DPORT FOUTPUT ROUTPUT
	if( pattern.size() != 7 ) {
		FANCY_BUG(oc_log, "\tIncorrect IPRewriter pattern size");
	}

	uint32_t unmodified_port_nb = atoi(pattern[6].c_str());
	uint32_t modified_port_nb   = atoi(pattern[5].c_str());

	OutputClass foutput (modified_port_nb);

	// Source IP address
	if ( pattern[1].compare("-") ) {
		if( !aton(pattern[1]) ) {
			FANCY_BUG(oc_log, "\tSource IP address in IPRewriter pattern null?: " << pattern[1]);
		}

		foutput.add_field_op({Write, ip_src, aton(pattern[1])});
	}

	// Source transport port
	if ( pattern[2].compare("-") ) {
		std::vector<std::string> split_pattern = split(pattern[2], "-");
		if ( split_pattern.size() == 1 ){
			foutput.add_field_op({Write, tp_src_port, (uint32_t) atoi(pattern[2].c_str())});
		}
		else if( split_pattern.size() == 2 ) {
			OperationType op_type = WriteSF;
			switch (split_pattern[1][split_pattern[1].size() - 1]) {
				case '#':
					op_type = WriteRR;
					split_pattern[1].pop_back();
					break;
				case '?':
					op_type = WriteRa;
					split_pattern[1].pop_back();
					break;
				default:
					break;
			}

			FieldOperation field_op;
			field_op.m_type  = op_type;
			field_op.m_field = tp_src_port;
			field_op.m_value[0] = (uint32_t) atoi(split_pattern[0].c_str());
			field_op.m_value[1] = (uint32_t) atoi(split_pattern[1].c_str());

			foutput.add_field_op(field_op);
		}
		else {
			FANCY_BUG(oc_log, "\tIncorrect port pattern: " << pattern[2]);
		}
	}

	// Destination IP address
	if ( pattern[3].compare("-") ) {
		foutput.add_field_op({Write,ip_dst,aton(pattern[3])});
	}

	// Destination IP port
	if ( pattern[4].compare("-") ) {
		std::vector<std::string> split_pattern = split(pattern[4], "-");
		if ( split_pattern.size() == 1 ){
			foutput.add_field_op({Write, tp_dst_port, (uint32_t) atoi(pattern[4].c_str())});
		}
		else if ( split_pattern.size() == 2 ) {
			OperationType op_type = WriteSF;
			switch ( split_pattern[1][split_pattern[1].size() - 1] ) {
				case '#':
					op_type = WriteRR;
					split_pattern[1].pop_back();
					break;
				case '?':
					op_type = WriteRa;
					split_pattern[1].pop_back();
					break;
				default:
					break;
			}

			FieldOperation field_op;
			field_op.m_type = op_type;
			field_op.m_field = tp_dst_port;
			field_op.m_value[0] = (uint32_t) atoi(split_pattern[0].c_str());
			field_op.m_value[1] = (uint32_t) atoi(split_pattern[1].c_str());
			foutput.add_field_op(field_op);
		}
		else {
			FANCY_BUG(oc_log, "\tIncorrect destination port pattern: " << pattern[4]);
		}
	}

	debug_chatter(oc_log, "\tCreated output class: " + foutput.to_str());

	return std::pair<OutputClass,OutputClass>(foutput, OutputClass(unmodified_port_nb));
}

void
OutputClass::add_filter(const HeaderField &field, const Filter &filter)
{
	if ( this->m_filter.find(field) != m_filter.end() ) {
		FANCY_BUG(oc_log, "\tTrying to add filter on already filtered field in OutputPort");
	}
	this->m_filter[field] = filter;
}

void
OutputClass::add_field_op(const FieldOperation &field_op)
{
	(this->m_operation).add_field_op(field_op);
}

std::string
OutputClass::to_str(void) const
{
	std::string output = "======== Begin Output Class ========\nFilters:\n";
	for(auto &it : this->m_filter) {
		output += ("\t"+it.second.to_str()+"\n");
	}
	output += m_operation.to_str();
	output += "========= End Output Class =========\n";

	return output;
}

void
OutputClass::set_filter(const PacketFilter &filter)
{
	this->m_filter = filter;
}

void
OutputClass::set_port_number(const int &port_number)
{
	this->m_port_number = port_number;
}

void
OutputClass::set_operation(const Operation &op)
{
	this->m_operation = op;
}

void
OutputClass::set_child(std::shared_ptr<ClickElement> &child, int next_input_port)
{
	this->m_child = child;
	this->m_next_input_port = next_input_port;
}

const Operation&
OutputClass::get_operation(void) const
{
	return this->m_operation;
}

int
OutputClass::get_port_number(void) const
{
	return this->m_port_number;
}

std::shared_ptr<ClickElement>
OutputClass::get_child(void) const
{
	return this->m_child;
}

PacketFilter
OutputClass::get_filter(void) const
{
	return this->m_filter;
}

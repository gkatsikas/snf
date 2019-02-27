// -*- c-basic-offset: 4 -*-
/* click_element.cpp
 *
 * Implementation of SNF's traffic class node.
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

#include <iostream>
#include <sstream>
#include <vector>
#include <cstdlib>
#include <climits>
#include <utility>

#include "operation.hpp"
#include "output_class.hpp"
#include "click_element.hpp"
#include "header_fields.hpp"
#include "ip_filter_parser.hpp"
#include "hex_filter_parser.hpp"

#include "../shared/helpers.hpp"

std::string empty;
std::string spaces=" \t\n";
std::shared_ptr<ClickElement>

ClickElement::discard_elem_ptr(new ClickElement(Discard_def,empty));

ClickElement::ClickElement(
	ElementVertex *ev,
	short input_port) :
	ClickElement(type_from_name(ev->get_class()),
	ev->get_configuration(), ev, input_port,
	ev->get_implicit_configuration() )
{
	this->log.set_logger_file(__FILE__);
}

ClickElement::ClickElement(
	const std::string &name,
	const std::string &configuration)
	: ClickElement(type_from_name(name), configuration, nullptr)
{
	this->log.set_logger_file(__FILE__);
}

ClickElement::ClickElement(
	ElementType type,
	const std::string &configuration)
	: ClickElement(type, configuration, nullptr)
{
	this->log.set_logger_file(__FILE__);
}

ClickElement::ClickElement(
	ElementType type,
	const std::string &configuration,
	ElementVertex *ev,
	short input_port,
	std::unordered_map< short, std::vector<std::string> > *extra_conf)
	: m_type(type), m_configuration(configuration), m_nb_ports(0), m_ev(ev)
{
	this->log.set_logger_file(__FILE__);

	debug_chatter(this->log, "\tCreating element " + to_str());
	switch (type) {
		case Classifier:
			this->parse_classifier(configuration);
			break;
		case IPFilter:
			parse_ip_filter(configuration);
			break;
		case IPClassifier:
			parse_ip_classifier(configuration);
			break;
		case RadixIPLookup:
		case LinearIPLookup:
		case DirectIPLookup:
		case StaticIPLookup:
		case LookupIPRouteMP:
			parse_lookup_filter(configuration);
			break;
		case IPRewriter:
			parse_ip_rewriter(configuration,input_port,extra_conf);
			break;
		case RoundRobinIPMapper:
			parse_rr_ip_mapper(configuration);
			break;
		case IPFragmenter:
			parse_ip_fragmenter_configuration(configuration);
			break;
		case VLANEncap:
			parse_vlan_encap_configuration(configuration);
			break;
		case VLANDecap:
			parse_vlan_decap_configuration(configuration);
			break;
		case SetVLANAnno:
			parse_set_vlan_anno_configuration(configuration);
			break;
		case ARPResponder:
			this->m_type = Discard_def;
			break;
		case FixIPSrc:
			// parse_fix_ip_src(configuration);
			// break;
		case DecIPTTL:
			// parse_dec_ttl_conf(configuration);
			// Integrated into IPRewriter
			// break;
		case IPOutputCombo:
			// Handle this better
			// break;
		case IPGWOptions:
		case DropBroadcasts:
		case EtherEncap:
		case FromDevice:
		case PollDevice:
		case FromNetFront:
		case FromDPDKDevice:
		case ToDevice:
		case ToNetFront:
		case ToDPDKDevice:
		case Strip:
		case Unstrip:
		case MarkIPHeader:
		case CheckIPHeader:
		case CheckICMPHeader:
		case CheckUDPHeader:
		case CheckTCPHeader:
		case GetIPAddress:
		case Queue:
		case ARPQuerier:
		case Paint:
		case PaintTee:
		case Print:
		case IPPrint:
		case AverageCounter: {
			OutputClass port(0);
			this->add_output_class(port);
			break;
		}
		case Discard:
		case Discard_def:
		case No_elem:
			break;
		default:
			FANCY_BUG(this->log, "\tUnsupported Element");
	}
	debug_chatter(this->log, "\tCreated element "+to_str());
}

void
ClickElement::set_child(
	std::shared_ptr<ClickElement> child,
	int port, int next_input_port)
{
	debug_chatter(this->log, "\tAdding child " + element_names[child->get_type()] + " to " + to_str());
	for (auto &it : m_outputClasses) {
		if (it.get_port_number() == port) {
			it.set_child(child, next_input_port);
		}
	}
}

bool
ClickElement::is_leaf(void)
{
	return (this->m_nb_ports==0);
}

std::string
ClickElement::get_configuration(void) const
{
	return this->m_configuration;
}

int
ClickElement::get_nb_ports(void) const
{
	return this->m_nb_ports;
}

void
ClickElement::set_nb_ports(int nb_ports)
{
	this->m_nb_ports = nb_ports;
}

std::vector<OutputClass>
ClickElement::get_output_classes(void) const
{
	return this->m_outputClasses;
}

ElementType
ClickElement::get_type(void) const
{
	return this->m_type;
}

ElementVertex *
ClickElement::get_ev(void) const
{
	return this->m_ev;
}

void
ClickElement::set_nf_name(const std::string &name)
{
	this->m_nfName = name;
}

std::string
ClickElement::get_nf_name(void) const
{
	return this->m_nfName;
}

std::string
ClickElement::to_str(void) const
{
	return element_names[this->m_type] + " with configuration \"" + this->m_configuration + "\"";
}

ElementType
ClickElement::type_from_name(const std::string &name)
{
	for (size_t i=0; i<NB_ELEMENT_TYPES; i++) {
		if (!name.compare(element_names[i])) {
			return (ElementType) i;
		}
	}
	BUG("\tUnknown name: "+name);
}

void
ClickElement::add_output_class(OutputClass &output_class)
{
	this->m_outputClasses.push_back(output_class);
	if (output_class.get_port_number() + 1 > this->m_nb_ports) {
		this->m_nb_ports = output_class.get_port_number()+1;
	}
}

std::shared_ptr<ClickElement>
ClickElement::get_discard_elem(void)
{
	return (ClickElement::discard_elem_ptr);
}

void
ClickElement::parse_dec_ttl_conf(const std::string &configuration)
{
	if (configuration.size() != 0) {
		configuration_fail();
	}

	FieldOperation ttl_op = {Translate, ip_TTL, 1};

	OutputClass port (0);
	Filter valid_ttl (ip_TTL,2,UINT_MAX);
	port.add_field_op(ttl_op);
	port.add_filter(ip_TTL,valid_ttl);

	this->add_output_class(port);

	// Drops dead packets
	OutputClass port1(1);
	Filter zero_ttl(ip_TTL,0,1);
	port1.add_filter(ip_TTL, zero_ttl);
	port1.set_child(discard_elem_ptr);

	this->add_output_class(port1);
}

void
ClickElement::parse_fix_ip_src(const std::string &configuration)
{
	std::vector<std::string> split_conf = split(configuration, spaces);

	uint32_t new_ip_value = 0;

	FieldOperation fix_ip_src_op = {Write, ip_src, new_ip_value};
	OutputClass port(0);

	switch (split_conf.size()) {
		case 1:
			if (!is_ip4_prefix(configuration)) {
				configuration_fail();
			}
			new_ip_value = aton(configuration);
			break;
		case 2:
			if ((split_conf[0].compare("IPADDR") != 0) || (!is_ip4_prefix(split_conf[1], true))) {
				configuration_fail();
			}
			new_ip_value = aton(split_conf[1]);
			break;
		default: {
			configuration_fail();
		}
	}

	fix_ip_src_op.m_value[0] = new_ip_value;
	port.add_field_op(fix_ip_src_op);
	this->add_output_class(port);

	return;
}

void
ClickElement::parse_ip_filter(const std::string &configuration)
{
	std::vector<std::string> rules = separate_args(configuration);
	std::vector<PacketFilter> to_discard;
	for (size_t i = 0; i < rules.size(); i++) {
		if(rules[i].empty()) {
			FANCY_BUG(this->log, "\tEmpty classifying rule in IPFilter element");
		}
		std::string rule = rules[i].substr(rules[i].find_first_not_of("\n\t "), rules[i].size());
		debug_chatter(this->log, "\t[Rule: " << rule);

		size_t first_space = rule.find(' ');
		std::string behaviour = rule.substr(0, first_space);
		int16_t output = -1;
		if (!behaviour.compare("allow")) {
			output = 0;
		} else if (behaviour.find_first_not_of("0123456789") == std::string::npos) {
			output = atoi(behaviour.c_str());
		} else if (behaviour.compare("deny") && behaviour.compare("drop") ) {
			FANCY_BUG(this->log, "\tUnknown action for IP Filter: " + behaviour);
		}

		std::vector<PacketFilter> outputs = filters_from_ipfilter_line( rules[i].substr(
							first_space+1,rule.size() - first_space - 1));

		if (output == -1) {
			to_discard.insert(to_discard.end(), outputs.begin(), outputs.end());
		} else {
			for (auto &pf : outputs) {
				OutputClass port(output);
				port.set_filter (pf);
				this->add_output_class(port);
			}
		}
	}

	uint32_t discard_port = this->m_nb_ports;
	for (auto &pf : to_discard) {
		OutputClass port(discard_port);
		port.set_child(discard_elem_ptr);
		port.set_filter(pf);
		this->add_output_class(port);
	}
}

void
ClickElement::parse_classifier(const std::string &configuration)
{
	std::vector<std::string> rules = separate_args(configuration);

	for (size_t i = 0; i < rules.size(); i++) {
		if(rules[i].empty()) {
			FANCY_BUG(this->log, "\tEmpty classifying rule in IPClassifier element");
		}

		// Strip white spaces left and right
		std::string rule = trim(rules[i]);

		// Get the packet filters of this rule and a brief description of the policy (pass, drop)
		std::pair< std::vector<PacketFilter>, ClassifierAction > pf_with_action =
			filters_from_classifier_line(rule);

		// Discard the traffic class of this rule
		if (pf_with_action.second == ClassifierAction::DROP) {
			debug_chatter(this->log, "\t[Rule: " << rule << ", Action: DROP]");
			continue;
		}

		// An empty filter means unconditional PASS
		if (pf_with_action.first.empty()) {
			debug_chatter(this->log, "\t[Rule: " << rule << ", Action: Port" << i << "]");
			OutputClass port(i);
			this->add_output_class(port);
			continue;
		}

		// We got some filters
		for (auto &pf : pf_with_action.first) {
			debug_chatter(this->log, "\t" << pf_to_str(pf));
			OutputClass port(i);
			port.set_filter(pf);
			this->add_output_class(port);
		}
	}
}

void
ClickElement::parse_ip_classifier(const std::string &configuration)
{
	std::vector<std::string> rules = separate_args(configuration);

	for (size_t i = 0; i < rules.size(); i++) {
		if(rules[i].empty()) {
			FANCY_BUG(this->log, "\tEmpty classifying rule in IPClassifier element");
		}

		// Strip white spaces left and right
		std::string rule = trim(rules[i]);

		std::vector<PacketFilter> outputs = filters_from_ipfilter_line(rule);
		for (auto &pf : outputs) {
			OutputClass port(i);
			port.set_filter(pf);
			this->add_output_class(port);
		}
	}
}

void
ClickElement::parse_lookup_filter(const std::string &configuration)
{
	std::vector<std::string> rules = separate_args(configuration);
	Filter parsed_prefixes(ip_dst);
	parsed_prefixes.make_none();
	for (auto &it : rules) {
		OutputClass port = OutputClass::port_from_lookup_rule(it, parsed_prefixes);
		this->add_output_class(port);
	}
}

void
ClickElement::parse_ip_rewriter(
	const std::string &configuration,
	short input_port,
	std::unordered_map< short, std::vector<std::string> > *extra_conf)
{
	debug_chatter(this->log, "\tEntering IPRewriter at port " + std::to_string(input_port));

	if (extra_conf && (extra_conf->find(input_port) != extra_conf->end())) {
		std::vector<std::string> rr_ip_mapper_conf = extra_conf->at(input_port);
		FieldOperation field_op (WriteLB, ip_dst, 0);
		unsigned short output_port = 0;
		for (auto &line : rr_ip_mapper_conf) {
			std::vector<std::string> split_line = split(line, " \n\t");
			if (!(split_line.size() == 6)) {
				debug_chatter(this->log, line);
				configuration_fail();
			} else {
				field_op.m_lb_values.push_back(aton(split_line[2]));
				error_chatter(this->log, "\tPushed back: " << aton(split_line[2]));
				output_port = (unsigned short) atoi(split_line[5].c_str());
			}
		}

		OutputClass port(output_port);
		port.add_field_op(field_op);
		error_chatter(this->log, "\tCurrent port: " << port.to_str());
		this->add_output_class(port);
	} else {
		std::string conf_line = separate_args(configuration)[input_port];
		std::vector<std::string> split_inputsec = split(conf_line, spaces);

		switch (split_inputsec.size()) {
			case 1: {
				if ((conf_line.compare("drop") == 0) || (conf_line.compare("discard") == 0)) {
					OutputClass discard(0);
					discard.set_child(discard_elem_ptr);
					this->add_output_class(discard);
				} else {
					configuration_fail();
				}
				break;
			}
			case 7: {
				std::pair<OutputClass,OutputClass> ports =
						OutputClass::output_class_from_pattern(split_inputsec);
				this->add_output_class(ports.first);
				break;
			}
			default: {
				configuration_fail();
			}
		}
	}
}

void
ClickElement::parse_vlan_encap_configuration(const std::string &configuration)
{
	size_t pos = configuration.find(' ');
	if (pos == std::string::npos) {
		FANCY_BUG(this->log, "\tExpected keyword in VLANEncap configuration and got: \""+configuration+"\"");
	}

	std::string keyword = configuration.substr(0,pos);
	uint32_t pcp = 0;
	uint32_t dei = 2;
	uint32_t vid = 0;
	if (!keyword.compare("VLAN_TCI")) {
		uint32_t value  = atoi (configuration.substr(pos+1,configuration.size()-pos-1).c_str());
		pcp = value >> 13;                     // Removes 13 last bits
		dei = (value>>12) & (0xffffffff << 1); // Gets 12th bit from smaller endian
		vid = value & (0xffffffff << 12);      // Gets 12 last bits
	} else {
		while (pos != std::string::npos) {
			if (!keyword.compare("VLAN_PCP")) {
				pcp  = atoi (configuration.substr(pos+1,configuration.size()-pos-1).c_str());
			} else if (!keyword.compare("VLAN_ID")) {
				vid = atoi (configuration.substr(pos+1,configuration.size()-pos-1).c_str());
			} else {
				FANCY_BUG(this->log, "\tUnknown keyword in VLANEncap: "+keyword);
			}

			uint32_t start = configuration.find_first_not_of(" ,", configuration.find(',',pos));
			pos = configuration.find(' ',start);
		}
	}

	OutputClass port(0);
	port.add_field_op({Write, vlan_pcp, pcp});
	port.add_field_op({Write, vlan_vid, vid});
	if (dei < 2) {
		port.add_field_op({Write,vlan_dei,dei});
	}
	this->add_output_class(port);
}

void
ClickElement::parse_vlan_decap_configuration(const std::string &configuration)
{
	if (configuration.empty()) {
		// TODO do we handle ANNO and if yes how?
		FANCY_BUG(this->log, "\tVLAN annotation not implemented yet");
	}
	OutputClass port(0);
	port.add_field_op({Write, vlan_pcp, UINT32_MAX});
	port.add_field_op({Write, vlan_vid, UINT32_MAX});
	port.add_field_op({Write, vlan_dei, UINT32_MAX});
	this->add_output_class(port);
}

void
ClickElement::parse_set_vlan_anno_configuration(const std::string &configuration __attribute__((unused)))
{
	// TODO complete
	def_chatter(this->log, configuration);
	FANCY_BUG(this->log, "\tVLAN annotation not implemented yet");
}

// New syntax: [IPSRC|IPDST] xxx.xxx.xxx.xxx-yyy.yyy.yyy.yyy
void
ClickElement::parse_rr_ip_mapper(const std::string &configuration)
{
	std::string separators = " \t\n";

	size_t start = 0;
	size_t end = configuration.find_first_of(separators);

	HeaderField field = unknown;

	if ((end == 5) && (configuration[0] == 'I') && (configuration[1] == 'P')) {
		if ((configuration[2] == 'S') && (configuration[3] == 'R') && (configuration[4] == 'C')) {
			field = ip_src;
		} else if ((configuration[2] == 'D') && (configuration[3] == 'S') && (configuration[4] == 'T')) {
			field = ip_dst;
		} else {
			configuration_fail();
		}
	} else {
		configuration_fail();
	}

	start = configuration.find_first_not_of(separators, end);
	end = configuration.find('-',start);

	uint32_t start_ip = aton(configuration.substr(start,end-start));
	start = end + 1;
	end = configuration.find_first_of(separators,start);
	uint32_t end_ip = aton(configuration.substr(start,end-start));

	OutputClass port(0);
	FieldOperation field_op;
	field_op.m_type = WriteRR;
	field_op.m_field = field;
	field_op.m_value[0] = start_ip;
	field_op.m_value[1] = end_ip;
	port.add_field_op(field_op);

	this->add_output_class(port);
}

void
ClickElement::parse_ip_fragmenter_configuration(const std::string &configuration)
{
	if (configuration.find_first_not_of("0123456789") != std::string::npos) {
		configuration_fail();
	}

	OutputClass port(0);
	FieldOperation field_op = {
		Write, mtu, (uint32_t) atoi(configuration.c_str())
	};
	port.add_field_op(field_op);
	this->add_output_class(port);
}

void
ClickElement::configuration_fail(void)
{
	FANCY_BUG(this->log, "\tCould not parse configuration for " +
			element_names[m_type] + ":\n\t" + m_configuration);
}

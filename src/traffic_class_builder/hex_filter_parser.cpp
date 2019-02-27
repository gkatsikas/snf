// -*- c-basic-offset: 4 -*-
/* hex_filter_parser.cpp
 *
 * Implementation of the methods that parse the hexadecimal filters of
 * SNF's traffic classes.
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
#include <string>
#include <cstdint>
#include <iostream>

#include "ip_filter_parser.hpp"
#include "hex_filter_parser.hpp"

Logger hex_par_lg(__FILE__);

std::pair< std::vector<PacketFilter>, ClassifierAction>
filters_from_classifier_line(const std::string &line)
{
	if (!line.size()) {
		FANCY_BUG(hex_par_lg, "\tEmpty IPFilter configuration");
	}

	std::vector<PacketFilter> finished_filters;

	// All the rest traffic (Usually last option of Classifier)
	if (line == "-") {
		debug_chatter(hex_par_lg, "\tDefault Classifier's traffic class");
		return {finished_filters, ClassifierAction::DROP};
	}

	std::string    basic_type;
	unsigned short rule_no = 0;

	// Get all pairs of HeaderField/Value
	for (auto &pair : split(line, " \t")) {

		std::string h_field_pos = get_substr_before(pair, "/");
		std::string h_field_val = get_substr_after (pair, "/");
		debug_chatter(hex_par_lg, "\tHeader field: " << h_field_pos << " with value: " << h_field_val);

		// The first rule classifies the type of the packet (IP, ARP, ...)
		if (rule_no == 0) {
			basic_type = ip_or_arp(h_field_pos, h_field_val);

			// We currently accept rules that deal with IP traffic
			if ((basic_type == "IP") || (basic_type == "ARP")) {
				rule_no++;
				continue;
			} else {
				return {finished_filters, ClassifierAction::DROP};
			}
		}

		// Given that the first match of this rule is IP,
		// now parse subsequent fields in the header, including
		// ICMP, TCP, and UDP fields
		if (basic_type == "IP") {
			filter_from_ip_option(finished_filters, h_field_pos, h_field_val);
		} else {
			// Further classify ARP
			basic_type = which_arp(h_field_pos, h_field_val);
			// FIXME: Add ARP support to IPClassifer
			//filter_from_arp_option(finished_filters, h_field_pos, h_field_val);
			return {finished_filters, ClassifierAction::DROP};
		}

		rule_no++;
	}

	return {finished_filters, ClassifierAction::PASS};
}

const std::string
ip_or_arp(const std::string &h_field_pos, const std::string &h_field_val)
{
	try {
		switch (EtherPositionToFieldLabel.at(h_field_pos)) {
			case Option::ETH_TYPE: {
				const HdrPosWithVal pos = {Option(Option::ETH_TYPE), h_field_val};

				switch (EthernetSemantics.at(pos)) {
					case Semantics::ETH_TYPE_IP:
						debug_chatter(hex_par_lg, "\tEthenet type IP class at " << h_field_pos
							<< " with value: " << h_field_val);
						return "IP";
					case Semantics::ETH_TYPE_ARP:
						debug_chatter(hex_par_lg, "\tEthenet type ARP class at " << h_field_pos
							<< " with value: " << h_field_val);
						return "ARP";
					default:
						error_chatter(hex_par_lg, "\tEthernet type " << h_field_pos + "/" + h_field_val
								<< " is neither IP nor ARP");
						return "None";
				}
			}
			default:
				debug_chatter(hex_par_lg, "\tUnknown Ethernet type at " << h_field_pos
						<< " with value: " << h_field_val);
				return "None";
		}
	}
	catch(...) {
		error_chatter(hex_par_lg, "\tProblem while parsing Classifier's rule: "
			<< h_field_pos + "/" + h_field_val);
	}

	return "None";
}

const std::string
which_arp(const std::string &h_field_pos, const std::string &h_field_val)
{
	try {
		switch (ARPPositionToFieldLabel.at(h_field_pos)) {
			case Option::ARP_OP: {
				const HdrPosWithVal pos = {Option(Option::ARP_OP), h_field_val};

				switch (ARPSemantics.at(pos)) {
					case Semantics::ARP_OP_REQ:
						debug_chatter(hex_par_lg, "\tARP Request  at " << h_field_pos
							<< " with value: " << h_field_val);
						return "REQ";
					case Semantics::ARP_OP_RES:
						debug_chatter(hex_par_lg, "\tARP Response at " << h_field_pos
							<< " with value: " << h_field_val);
						return "RES";
					default:
						error_chatter(hex_par_lg, "\tARP type " << h_field_pos + "/" + h_field_val
							<< " is neither Request nor Response");
						return "None";
				}
			}
			default:
				debug_chatter(hex_par_lg, "\tNon-ARP class" << h_field_pos << " with value: " << h_field_val);
				return "None";
		}
	}
	catch(...) {
		error_chatter(hex_par_lg, "\tProblem while parsing Classifier's rule: "
			<< h_field_pos + "/" + h_field_val);
	}

	return "None";
}

bool
filter_from_ip_option(
	std::vector<PacketFilter> &finished_filters,
	const std::string         &h_field_pos,
	const std::string         &h_field_val)
{
	Filter f;
	PacketFilter pf;

	try {
		switch (IPPositionToFieldLabel.at(h_field_pos)) {
			case Option::IP_VERS_HL:{
				debug_chatter(hex_par_lg, "\tIP Version + Header length at " << h_field_pos
					<< " with value: " << h_field_val);
				uint8_t i_dec = std::stoi("0x"+h_field_val, nullptr);
				f = Filter(ambiguous_field, i_dec);
				break;
			}
			case Option::IP_DSCP: {
				debug_chatter(hex_par_lg, "\tIP DSCP at " << h_field_pos
					<< " with value: " << h_field_val);
				uint8_t i_dec = std::stoi("0x"+h_field_val, nullptr);
				f = Filter(ambiguous_field, i_dec);
				break;
			}
			case Option::IP_TL: {
				debug_chatter(hex_par_lg, "\tIP total length at " << h_field_pos
					<< " with value: " << h_field_val);
				uint16_t i_dec = std::stoi("0x"+h_field_val, nullptr);
				f = Filter(ip_tl, i_dec);
				break;
			}
			case Option::IP_ID: {
				debug_chatter(hex_par_lg, "\tIP ID at " << h_field_pos
					<< " with value: " << h_field_val);
				uint16_t i_dec = std::stoi("0x"+h_field_val, nullptr);
				f = Filter(ip_id, i_dec);
				break;
			}
			case Option::IP_FLAGS: {
				debug_chatter(hex_par_lg, "\tIP Flags at " << h_field_pos
					<< " with value: " << h_field_val);
				uint16_t i_dec = std::stoi("0x"+h_field_val, nullptr);
				f = Filter(ambiguous_field, i_dec);
				break;
			}
			case Option::IP_TtL: {
				debug_chatter(hex_par_lg, "\tIP TTL at " << h_field_pos
					<< " with value: " << h_field_val);
				uint8_t i_dec = std::stoi("0x"+h_field_val, nullptr);
				f = Filter(ip_TTL, i_dec);
				break;
			}
			case Option::IP_PROTO: {
				debug_chatter(hex_par_lg, "\tIP proto at " << h_field_pos
					<< " with value: " << h_field_val);
				uint8_t i_dec = std::stoi("0x"+h_field_val, nullptr);
				f = Filter(ip_proto, i_dec);
				break;
			}
			case Option::IP_CHS: {
				debug_chatter(hex_par_lg, "\tIP checksum at " << h_field_pos
					<< " with value: " << h_field_val);
				uint16_t i_dec = std::stoi("0x"+h_field_val, nullptr);
				f = Filter(ambiguous_field, i_dec);
				break;
			}
			case Option::IP_SRC: {
				debug_chatter(hex_par_lg, "\tIP source address at " << h_field_pos
					<< " with value: " << h_field_val);
				uint32_t i_dec = std::stoi("0x"+h_field_val, nullptr);
				f = Filter(tp_src_port, i_dec);
				break;
			}
			case Option::IP_DST: {
				debug_chatter(hex_par_lg, "\tIP destination address at " << h_field_pos
					<< " with value: " << h_field_val);
				uint32_t i_dec = std::stoi("0x"+h_field_val, nullptr);
				f = Filter(tp_src_port, i_dec);
				break;
			}
			default:
				error_chatter(hex_par_lg, "\tUnknown IP position " << h_field_pos
					<< " with value: " << h_field_val);
				exit(CLICK_PARSING_PROBLEM);
		}
	}
	catch(...) {
		error_chatter(hex_par_lg, "\tProblem while parsing Classifier's rule: "
			<< h_field_pos + "/" + h_field_val);
		exit(CLICK_PARSING_PROBLEM);
	}

	add_filter_to_pf(pf, std::move(f));
	finished_filters.push_back(pf);

	return true;
}

#ifdef TEST
int
main(int argc, char **argv)
{
	std::string a = "12/0806 20/0001";
	std::pair< std::vector<PacketFilter>, ClassifierAction > pf_with_action = filters_from_classifier_line(a);

	if (pf_with_action.second == ClassifierAction::DROP) {
		info_chatter(this->log, "\t[Rule: " << rule << ", Action: DROP]");
		continue;
	}

	// An empty filter means unconditional PASS
	if (pf_with_action.first.empty()) {
		info_chatter(this->log, "\t[Rule: " << rule << ", Action: Port" << i << "]");
		OutputClass port(i);
		this->add_output_class(port);
		continue;
	}

	for (auto &pf : pf_with_action.first) {
		//info_chatter(this->log, "\tRule " << rule << " goes to port " << i << " with filter " << pf.to_str());
		info_chatter(this->log, "\t" << pf_to_str(pf));
		OutputClass port(i);
		port.set_filter(pf);
		this->add_output_class(port);
	}

}
#endif

// -*- c-basic-offset: 4 -*-
/* ip_filter_parser.cpp
 *
 * Implementation of the methods that parse the IP filters of
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

#include <string>
#include <cstdint>
#include <iostream>
#include <cstdio>

#include "ip_filter_parser.hpp"

Logger ip_par_lg(__FILE__);

std::vector<PacketFilter>
negate_pf(const PacketFilter &pf)
{
	std::vector<PacketFilter> pf_vec;

	for (auto &it : pf) {
		PacketFilter new_pf;
		new_pf[it.first] = (Filter(it.first)).differentiate(it.second);

		if (!new_pf[it.first].is_none()) {
			pf_vec.push_back(new_pf);
		}
	}

	return pf_vec;
}

bool
add_filter_to_pf(PacketFilter &base_pf, const Filter &f)
{
	HeaderField field = f.get_field();
	auto got = base_pf.find(field);

	if ( got == base_pf.end() ) {
		base_pf[field] = f;
	}
	else {
		base_pf[field].intersect(f);
	}

	return base_pf[field].is_none();
}

std::vector<PacketFilter>
and_pf_vec(const std::vector<PacketFilter> &a, const std::vector<PacketFilter> &b)
{
	std::vector<PacketFilter> result;
	int is_none;
	PacketFilter temp_pf;

	for (auto &it1 : a) {
		for (auto &it2 : b) {
			temp_pf = it1;
			is_none = 0;
			for (auto &filter : it2) {
				is_none += add_filter_to_pf(temp_pf, filter.second);
			}
			if (!is_none) {
				result.push_back(temp_pf);
			}
		}
	}
	return result;
}

std::vector<PacketFilter>
negate_pf_vec(const std::vector<PacketFilter> &vec)
{
	std::vector<PacketFilter> result;
	result.push_back(PacketFilter());

	for (auto &it : vec) {
		result = and_pf_vec(result, negate_pf(it));
	}

	return result;
}

void
reset_pf_vec(std::vector<PacketFilter> &vec)
{
	vec.clear();
	vec.push_back(PacketFilter());
}

const std::string
pf_to_str(const PacketFilter &pf)
{
	std::stringstream pf_str;

	for (auto &it : pf) {
		pf_str 	<< "[Header Field: " << header_field_names[it.first] << ", "
			<< "Filter: " << it.second.to_str();
	}

	return pf_str.str();
}

const std::string
pf_vec_to_str(const std::vector<PacketFilter> &vec)
{
	std::stringstream pf_str;

	for (auto &it1 : vec) {
		for (auto &it2 : it1) {
			pf_str 	<< "[Header Field: " << header_field_names[it2.first] << ", "
				<< "Filter: " << it2.second.to_str() << "\n";
		}
	}

	return pf_str.str();
}

PacketFilter
filter_from_option(const Primitive &primitive, const Option &option, const std::string &arg)
{
	debug_chatter(ip_par_lg, "\tOption " << option_names[(size_t) option] << " with value " << arg);

	switch (primitive) {
		case Primitive::IP:
			return filter_from_ip_option  (option, arg);
		case Primitive::SRC:
			return filter_from_src_option (option, arg);
		case Primitive::DST:
			return filter_from_dst_option (option, arg);
		case Primitive::TCP:
			return filter_from_tcp_option (option, arg);
		case Primitive::ICMP:
			return filter_from_icmp_option(option, arg);
		default:
			error_chatter(ip_par_lg, "\tUndefined primitive");
			exit(CLICK_PARSING_PROBLEM);
	}
}

PacketFilter
filter_from_icmp_option(const Option &option, const std::string &arg)
{
	PacketFilter pf;
	Filter f;

	switch (option) {
		case Option::ICMP_TYPE:
			f = Filter::get_filter_from_ipclass_pattern(icmp_type, arg);
			break;
		default:
			break;
	}

	add_filter_to_pf(pf, f);

	return pf;
}

PacketFilter
filter_from_src_option(const Option &option, const std::string &arg)
{
	PacketFilter pf;
	Filter f;

	switch (option) {
		case Option::SRC_HOST:
			f = Filter::get_filter_from_ipclass_pattern(ip_src, arg);
			break;
		case Option::SRC_NET:
			f = Filter::get_filter_from_prefix_pattern (ip_src, arg);
			break;
		case Option::SRC_UDP_PORT:
			f = Filter(ip_proto, 17);
			add_filter_to_pf(pf, f);
			goto add_port;
		case Option::SRC_TCP_PORT:
			f = Filter(ip_proto, 6);
			add_filter_to_pf(pf, f);
			goto add_port;
		case Option::SRC_PORT:
		add_port:
			f = Filter::get_filter_from_ipclass_pattern(tp_src_port, arg);
			break;
		default:
			break;
	}

	add_filter_to_pf(pf, f);

	return pf;
}

PacketFilter
filter_from_dst_option(const Option &option, const std::string &arg)
{
	PacketFilter pf;
	Filter f;

	switch (option) {
		case Option::DST_HOST:
			f = Filter::get_filter_from_ipclass_pattern(ip_dst, arg);
			break;
		case Option::DST_NET:
			f = Filter::get_filter_from_prefix_pattern (ip_dst, arg);
			break;
		case Option::DST_UDP_PORT:
			f = Filter(ip_proto, 17);
			add_filter_to_pf(pf, f);
			goto add_port;
		case Option::DST_TCP_PORT:
			f = Filter(ip_proto, 6);
			add_filter_to_pf(pf, f);
			goto add_port;
		case Option::DST_PORT:
		add_port:
			f = Filter::get_filter_from_ipclass_pattern(tp_dst_port, arg);
			break;
		default:
			break;
	}

	add_filter_to_pf(pf,f);

	return pf;
}

PacketFilter
filter_from_ip_option(const Option &option, const std::string &arg)
{
	Filter f;
	PacketFilter pf;

	switch (option) {
		case Option::IP_VERS:
			f = Filter::get_filter_from_ipclass_pattern(ip_ver, arg);
			break;
		case Option::IP_HL:
			f = Filter::get_filter_from_ipclass_pattern(ip_ihl, arg);
			break;
		case Option::IP_ToS:
			error_chatter(ip_par_lg, "\tIP ToS not supported, please use IP DSCP and IP ECT/CE");
			exit(CLICK_PARSING_PROBLEM);
		case Option::IP_DSCP:
			f = Filter::get_filter_from_ipclass_pattern(ip_dscp, arg);
			break;
		case Option::IP_ID:
			f = Filter::get_filter_from_ipclass_pattern(ip_id, arg);
			break;
		case Option::IP_CE:
			f = Filter(ip_ce, 1);
			break;
		case Option::IP_FRAG:
		case Option::IP_UNFRAG:
			error_chatter(ip_par_lg, "\tIP fragmentation not supported yet");
			exit(CLICK_PARSING_PROBLEM);
		case Option::IP_ECT:
			f = Filter(ip_ect, 1);
			break;
		case Option::IP_TtL:
			f = Filter::get_filter_from_ipclass_pattern(ip_TTL, arg);
			break;
		case Option::IP_PROTO:
			if (!arg.compare("tcp")) {
				f = Filter(ip_proto, 6);
			}
			else if (!arg.compare("udp")) {
				f = Filter(ip_proto, 17);
			}
			else if(!arg.compare("icmp")) {
				f = Filter(ip_proto, 1);
			}
			else if (arg.find_first_not_of("0123456789") == std::string::npos) {
				f = Filter::get_filter_from_ipclass_pattern(ip_proto, arg);
			}
			else {
				error_chatter(ip_par_lg, "\tUnknown protocol name: " << arg);
				exit(CLICK_PARSING_PROBLEM);
			}
			break;
		default:
			error_chatter(ip_par_lg, "\tUnknown option for IP primitive");
			exit(CLICK_PARSING_PROBLEM);
	}

	add_filter_to_pf(pf, f);

	return pf;
}

PacketFilter
filter_from_tcp_option(const Option &option, const std::string &arg)
{
	PacketFilter pf;
	pf[ip_proto] = Filter(ip_proto, 6);
	Filter f;

	switch (option) {
		case Option::TCP_OPT:
			if (arg.empty()) {
				error_chatter(ip_par_lg, "\tEmpty argument for tcp opt");
				exit(CLICK_PARSING_PROBLEM);
			}
			switch (arg[0]) {
				case 'a':
					if (!arg.compare("ack")) {
						f = Filter(tcp_flag_ack, 1);
						break;
					}
				case 'f':
					if (!arg.compare("fin")) {
						f = Filter(tcp_flag_fin, 1);
						break;
					}
				case 'p':
					if (!arg.compare("psh")) {
						f = Filter(tcp_flag_psh, 1);
						break;
					}
				case 'r':
					if (!arg.compare("rst")) {
						f = Filter(tcp_flag_rst, 1);
						break;
					}
				case 's':
					if (!arg.compare("syn")) {
						f = Filter(tcp_flag_syn, 1);
						break;
					}
				case 'u':
					if (!arg.compare("urg")) {
						f = Filter(tcp_flag_urg, 1);
						break;
					}
					break;
				default:
					error_chatter(ip_par_lg, "\tUnknown TCP option: " + arg);
					exit(CLICK_PARSING_PROBLEM);
			}
			break;
		case Option::TCP_WIN:
			f = Filter::get_filter_from_ipclass_pattern(tcp_win, arg);
			break;
		default:
			error_chatter(ip_par_lg, "\tUnknown option for TCP primitive");
			exit(CLICK_PARSING_PROBLEM);
	}

	add_filter_to_pf(pf, f);

	return pf;
}

Primitive
primitive_from_string(const std::string &str)
{
	if (str.size()) {
		// Let's make it linear
		switch (str[0]) {
			case '&':
				if (str.size()==2 && str[1] =='&') {
					return Primitive::AND;
				}
				break;
			case '|':
				if (str.size()==2 && str[1] =='|') {
					return Primitive::OR;
				}
				break;
			case 'a':
				if (str.size() == 3 && str[1] == 'n' && str[2] == 'd') {
					return Primitive::AND;
				}
				break;
			case 'o':
				if (str.size()==2 && str[1] =='r') {
					return Primitive::OR;
				}
				break;
			case 'i':
				if (str.size() == 2 && str[1] == 'p') {
					return Primitive::IP;
				}
				else if (!str.compare("icmp")) {
					return Primitive::ICMP;
				}
				break;
			case 't':
				if (str.size() == 3 && str[1] == 'c' && str[2] == 'p') {
					return Primitive::TCP;
				}
				break;
			case 's':
				if (str.size() == 3 && str[1] == 'r' && str[2] == 'c') {
					return Primitive::SRC;
				}
				break;
			case 'd':
				if (str.size() == 3 && str[1] == 's' && str[2] == 't') {
					return Primitive::DST;
				}
				break;
			default:
				break;
		}
	}

	return Primitive::Undefined;
}

Option
ip_option_from_string(const std::string &str)
{
	if (str.size()) {
		switch (str[0]) {
			case 'c':
				if (str.size() == 2 && str[1]=='e') {
					return Option::IP_CE;
				}
				break;
			case 'd':
				if (!str.compare("dscp")) {
					return Option::IP_DSCP;
				}
				break;
			case 'e':
				if (str.size() == 3 && str[1] == 'c' && str[2] == 't') {
					return Option::IP_ECT;
				}
				break;
			case 'f':
				if (!str.compare("frag")) {
					return Option::IP_FRAG;
				}
				break;
			case 'h':
				if (str.size() == 2 && str[1]=='l') {
					return Option::IP_HL;
				}
				break;
			case 'i':
				if (str.size() == 2 && str[1]=='d') {
					return Option::IP_ID;
				}
				break;
			case 'p':
				if (!str.compare("proto")) {
					return Option::IP_PROTO;
				}
				break;
			case 't':
				if (str.size() == 3) {
					if (str[1] == 'o' && str[2] == 's') {
						return Option::IP_ToS;
					}
					else if (str[1] == 't' && str[2]=='l') {
						return Option::IP_TtL;
					}
				}
				break;
			case 'u':
				if (!str.compare("unfrag")) {
					return Option::IP_UNFRAG;
				}
				break;
			case 'v':
				if (!str.compare("vers")) {
					return Option::IP_VERS;
				}
				break;
			default:
				break;
		}
	}

	return Option::Undefined;
}

bool
is_operator(const Primitive prim)
{
	return (prim == Primitive::OR || prim == Primitive::AND);
}

Option
srcdst_option_from_string(const Primitive &prim, const std::string &str)
{
	if (str.size() ) {
		switch (str[0]) {
			case 'h':
				if (!str.compare("host")) {
					if (prim == Primitive::SRC) {
						return Option::SRC_HOST;
					}
					else if (prim == Primitive::DST) {
						return Option::DST_HOST;
					}
				}
			case 'n':
				if (str.size() == 3 && str[1] == 'e' && str[2] == 't') {
					if (prim == Primitive::SRC) {
						return Option::SRC_NET;
					}
					else if (prim == Primitive::DST) {
						return Option::DST_NET;
					}
				}
			case 'p':
				if (!str.compare("port")) {
					if (prim == Primitive::SRC) {
						return Option::SRC_PORT;
					}
					else if (prim == Primitive::DST) {
						return Option::DST_PORT;
					}
				}
			case 't':
				if (str.size() == 3 && str[1] == 'c' && str[2] == 'p') {
					if (prim == Primitive::SRC) {
						return Option::SRC_TCP_PORT;
					}
					else if (prim == Primitive::DST) {
						return Option::DST_TCP_PORT;
					}
				}
			case 'u':
				if (str.size() == 3 && str[1] == 'd' && str[2] == 'p') {
					if (prim == Primitive::SRC) {
						return Option::SRC_UDP_PORT;
					}
					else if (prim == Primitive::DST) {
						return Option::DST_UDP_PORT;
					}
				}
			default:
				break;
		}
	}

	return Option::Undefined;
}

Option
tcp_option_from_string(const std::string &str)
{
	if (str.size()) {
		switch (str[0])	{
			case 'o':
				if (str.size() == 3 && str[1] == 'p' && str[2] == 't') {
					return Option::TCP_OPT;
				}
			case 'w':
				if (str.size() == 3 && str[1] == 'i' && str[2] == 'n') {
					return Option::TCP_WIN;
				}
			default:
				break;
		}
	}

	return Option::Undefined;
}

Option
option_from_string(const Primitive &curr_prim, const std::string &str)
{
	switch (curr_prim) {
		case Primitive::IP:
			return ip_option_from_string(str);
		case Primitive::SRC:
		case Primitive::DST:
			return srcdst_option_from_string(curr_prim, str);
		case Primitive::TCP:
			return tcp_option_from_string(str);
		case Primitive::ICMP:
			if (!str.compare("type")) {
				return Option::ICMP_TYPE;
			}
		default:
			error_chatter(ip_par_lg, "\tUndefined primitive, cannot parse option");
			exit(CLICK_PARSING_PROBLEM);
	}
}

bool
is_opening_char(const char c)
{
	return (c == '(' || c == '!');
}

std::string
parse_value(char **position, char *end)
{
	std::string current_word;
	std::string value;
	std::string temp;
	char *current_position = *position;

	while ((current_position != end) && (*current_position != ')')) {
		debug_chatter(ip_par_lg, "\tCurrent pos in parse value: " + std::string(current_position));

		if (*current_position == ' ') {
			Primitive p = primitive_from_string(current_word);
			debug_chatter(ip_par_lg, "\tPrimitive from word " + current_word);

			/**
			 * New primitive, end of the value
			 */
			if (
				(p != Primitive::Undefined) &&
				(p != Primitive::TCP && p != Primitive::ICMP) &&
				!is_operator(p))
			{
				break;
			}
			// We wait to see whether the next one is a primitive or not
			else if (is_operator(p)) {
				temp = current_word + " ";
				current_word.clear();
			}
			/**
			 * Normal  case: p is not a primitive --> We found a value
			 * Special case: We found a primitive (TCP or ICMP) but it is actually a value.
			 *               E.g., `ip proto tcp` -> tcp is not the primitive but the value!
			 */
			else {
				*position = current_position;
				value += temp + current_word + ' ';
				current_word.clear();
				temp.clear();
			}
		}
		else if (!value.empty() && is_opening_char(*current_position)) {
			break;
		}
		else {
			current_word.push_back(*current_position);
		}
		current_position++;
	}
	if ((current_position == end) || (*current_position == ')')) {
		value += temp + current_word;
		*position = current_position;
	}
	else {
		debug_chatter(ip_par_lg, "\tAbout to pop: " + value);
		value.pop_back();
		(*position)++;
	}

	debug_chatter(ip_par_lg, "\tReturning: " + value);

	return value;
}

std::vector<PacketFilter>
filters_from_substr(char **position, char *end)
{
/*
 * TODO:
 * - support pattern that are not of the type "primitive option [value]"
 * - Add a PacketFilter containing the current filter and wait for "or" that
 *   change the primitive to push it into open_filters
 *   ll 287 && 312
 */
	std::vector<PacketFilter> finished_filters;
	std::vector<PacketFilter> open_filters;
	reset_pf_vec (open_filters);

	if (*position==end) {
		insert_last(finished_filters, open_filters);
		return finished_filters;
	}

	std::string current_word;
	bool negate=false;
	Primitive curr_prim = Primitive::Undefined;
	Primitive curr_operator = Primitive::AND;
	Option curr_opt = Option::Undefined;

	while ((*position < end) && (**position != ')')) {

		debug_chatter(ip_par_lg, "\tConsidering character: " + std::string(*position));

		if (**position == '!') {
			negate=true;
			(*position)++;
		}
		else if (**position == '(') {
			(*position)++;

			std::vector<PacketFilter> pf_vec = filters_from_substr(position, end);
			debug_chatter(ip_par_lg, "\tEnded recursion");

			if (negate) {
				pf_vec = negate_pf_vec(pf_vec);
				negate = false;
			}
			switch (curr_operator) {
				case Primitive::AND:
					open_filters = and_pf_vec(open_filters, pf_vec);
					break;
				case Primitive::OR:
					insert_last(finished_filters, open_filters);
					open_filters = pf_vec;
					break;
				default:
					error_chatter(ip_par_lg, "\tcurr_operator is not an operator");
					exit(CLICK_PARSING_PROBLEM);
			}

			curr_operator = curr_prim = Primitive::Undefined;
			curr_opt = Option::Undefined;
			(*position)++; //Go past blank space
		}
		else if (**position == ' ') {
			(*position)++;
			if (curr_operator == Primitive::Undefined) {
				curr_operator = primitive_from_string(current_word);
				if (!is_operator(curr_operator)) {
					error_chatter(ip_par_lg, "\tExpected operator and got: \"" + current_word + "\"");
					exit(CLICK_PARSING_PROBLEM);
				}
			}
			// Current word is a primitive
			else if (curr_prim == Primitive::Undefined) {
				curr_prim = primitive_from_string(current_word);
			}
			// Current word is an option
			else if (curr_opt == Option::Undefined) {
				curr_opt = option_from_string(curr_prim, current_word);

				// We expect a value OR an operator primitive
				std::string value;
				switch (curr_opt) {
					case Option::IP_ECT:
					case Option::IP_CE:
					case Option::IP_FRAG:
					case Option::IP_UNFRAG:
						break;
					case Option::SRC_UDP_PORT:
					case Option::SRC_TCP_PORT:
					case Option::DST_UDP_PORT:
					case Option::DST_TCP_PORT:
						current_word.clear();
						while ((*position < end) && (**position != ')') && (**position != ' ')) {
							current_word.push_back(**position);
							(*position)++;
						}

						if (current_word.compare("port")) {
							error_chatter(
								ip_par_lg, "\tExpected \"port\" after " +
								option_names[(size_t) curr_opt]
							);
							exit(CLICK_PARSING_PROBLEM);
						}
						(*position)++;
					default:
						value = parse_value(position, end);
				}

				PacketFilter pf = filter_from_option(curr_prim, curr_opt, value);
				std::vector<PacketFilter> temp;

				if (negate) {
					temp = negate_pf(pf);
					negate = false;
				}
				else {
					temp.push_back(pf);
				}

				switch (curr_operator) {
					case Primitive::OR:
						insert_last(finished_filters, open_filters);
						reset_pf_vec(open_filters);
						open_filters[0] = pf;
					case Primitive::AND: {
						open_filters = and_pf_vec(open_filters, temp);
						break;
					}
					default:
						error_chatter(ip_par_lg, "\tExpected operator");
						exit(CLICK_PARSING_PROBLEM);
				}
				curr_operator = curr_prim = Primitive::Undefined;
				curr_opt = Option::Undefined;
			}
			current_word.clear();
		}
		else {
			current_word.push_back(**position);
			(*position)++;
		}
	}

	(*position)++;
	insert_last(finished_filters, open_filters);

	return finished_filters;
}

std::vector<PacketFilter>
filters_from_ipfilter_line(const std::string &line)
{
	if (line.empty()) {
		error_chatter(ip_par_lg, "\tEmpty IPFilter configuration");
		exit(CLICK_PARSING_PROBLEM);
	}

	const char *start = &(line[0]);
	return filters_from_substr((char**)&start, (char*)start + line.size());
}

#ifdef test
int
main(int argc, char **argv)
{
	std::string a = "tcp opt syn && tcp win < 20";
	std::cout << pf_vec_to_str(filters_from_ipfilter_line(a));
}
#endif

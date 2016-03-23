#ifndef _IP_FILTER_PARSER_HPP_
#define _IP_FILTER_PARSER_HPP_

/*
 * ip_filter_parser.hpp
 * 
 * Definition of the methods that parse the filters of 
 * Hyper-NF's traffic classes.
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

#include "filter.hpp"
#include "../shared/helpers.hpp"

static const int prim_start = __LINE__;
#define Prim(FOO) \
	FOO(Undefined) \
	FOO(IP) \
	FOO(SRC) \
	FOO(DST) \
	FOO(TCP) \
	FOO(ICMP) \
	FOO(OR) \
	FOO(AND)
static const int prim_end = __LINE__;

static const int opt_start = __LINE__;
#define Opt(FOO) \
	FOO(Undefined) \
	FOO(IP_PROTO) \
	FOO(IP_VERS) \
	FOO(IP_HL) \
	FOO(IP_ID) \
	FOO(IP_ToS) \
	FOO(IP_DSCP) \
	FOO(IP_ECT) \
	FOO(IP_CE) \
	FOO(IP_ttl) \
	FOO(IP_FRAG) \
	FOO(IP_UNFRAG) \
	FOO(TCP_OPT) \
	FOO(TCP_WIN) \
	FOO(ICMP_TYPE) \
	FOO(SRC_HOST) \
	FOO(SRC_NET) \
	FOO(SRC_PORT) \
	FOO(SRC_UDP_PORT) \
	FOO(SRC_TCP_PORT) \
	FOO(DST_HOST) \
	FOO(DST_NET) \
	FOO(DST_PORT) \
	FOO(DST_UDP_PORT) \
	FOO(DST_TCP_PORT)
static const int opt_end = __LINE__;

#define DO_DESCRIPTION(e) #e,
#define DO_ENUM(e) e,

enum class Primitive {
	Prim(DO_ENUM)
};

const std::string primitiveNames[prim_end - prim_start-2] = {
	Prim(DO_DESCRIPTION)
};

enum class Option {
	Opt(DO_ENUM)
};

const std::string optionNames[opt_end - opt_start -2] = {
	Opt(DO_DESCRIPTION)
};

PacketFilter filter_from_option         (const Primitive &primitive, const Option &option, const std::string &arg);
PacketFilter filter_from_ip_option      (const Option &option, const std::string &arg);
PacketFilter filter_from_src_option     (const Option &option, const std::string &arg);
PacketFilter filter_from_dst_option     (const Option &option, const std::string &arg);
PacketFilter filter_from_tcp_option     (const Option &option, const std::string &arg);
PacketFilter filter_from_icmp_option    (const Option &option, const std::string &arg);

std::vector<PacketFilter> filters_from_ipfilter_line (const std::string &line);
std::vector<PacketFilter> filters_from_substr        (char **position, char *end);

Primitive find_primitive_from_string (const std::string &str);

#endif
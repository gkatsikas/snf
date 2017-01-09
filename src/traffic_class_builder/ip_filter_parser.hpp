#ifndef _IP_FILTER_PARSER_HPP_
#define _IP_FILTER_PARSER_HPP_

/*
 * ip_filter_parser.hpp
 *
 * Definition of the methods that parse the IP filters of
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

#include "filter.hpp"
#include "../shared/helpers.hpp"

static const int prim_start = __LINE__;
#define Prim(PR) \
	PR(Undefined) \
	PR(IP) \
	PR(SRC) \
	PR(DST) \
	PR(TCP) \
	PR(ICMP) \
	PR(OR) \
	PR(AND)
static const int prim_end = __LINE__;

/* L2-L4 header space fields */
static const int opt_start = __LINE__;
#define Opt(OP) \
	OP(Undefined) \
	OP(ETH_DST) \
	OP(ETH_SRC) \
	OP(ETH_TYPE) \
	OP(ETH_CRC) \
	OP(ARP_HW_TYPE) \
	OP(ARP_PT_TYPE) \
	OP(ARP_HW_ADD_LEN) \
	OP(ARP_PT_ADD_LEN) \
	OP(ARP_OP) \
	OP(ARP_SDR_HW) \
	OP(ARP_SDR_IP) \
	OP(ARP_TRG_HW) \
	OP(ARP_TRG_IP) \
	OP(IP_VERS_HL) \
	OP(IP_VERS) \
	OP(IP_HL) \
	OP(IP_ToS) \
	OP(IP_DSCP) \
	OP(IP_TL) \
	OP(IP_ID) \
	OP(IP_FLAGS) \
	OP(IP_CE) \
	OP(IP_FRAG) \
	OP(IP_UNFRAG) \
	OP(IP_ECT) \
	OP(IP_TtL) \
	OP(IP_PROTO) \
	OP(IP_CHS) \
	OP(IP_SRC) \
	OP(IP_DST) \
	OP(SRC_HOST) \
	OP(SRC_NET) \
	OP(DST_HOST) \
	OP(DST_NET) \
	OP(ICMP_TYPE) \
	OP(ICMP_CODE) \
	OP(ICMP_CHS) \
	OP(ICMP_ID) \
	OP(ICMP_SEQ) \
	OP(SRC_PORT) \
	OP(DST_PORT) \
	OP(SRC_UDP_PORT) \
	OP(DST_UDP_PORT) \
	OP(UDP_LEN) \
	OP(UDP_CHS) \
	OP(SRC_TCP_PORT) \
	OP(DST_TCP_PORT) \
	OP(TCP_SEQ) \
	OP(TCP_ACK) \
	OP(TCP_OFF_RES) \
	OP(TCP_FLAGS) \
	OP(TCP_WIN) \
	OP(TCP_CHS) \
	OP(TCP_URG) \
	OP(TCP_OPT)
static const int opt_end = __LINE__;

enum class Primitive {
	Prim(DO_ENUM)
};

const std::string primitive_names[prim_end - prim_start - 2] = {
	Prim(DO_DESCRIPTION)
};

enum class Option {
	Opt(DO_ENUM)
};

const std::string option_names[opt_end - opt_start - 2] = {
	Opt(DO_DESCRIPTION)
};

std::vector<PacketFilter> negate_pf       (const PacketFilter &pf);
bool                      add_filter_to_pf(PacketFilter &base_pf, const Filter &f);
std::vector<PacketFilter> and_pf_vec      (const std::vector<PacketFilter> &a, const std::vector<PacketFilter> &b);
std::vector<PacketFilter> negate_pf_vec   (const std::vector<PacketFilter> &vec);
void                      reset_pf_vec    (std::vector<PacketFilter> &vec);
const std::string         pf_to_str       (const PacketFilter &pf);
const std::string         pf_vec_to_str   (std::vector<PacketFilter> &vec);

PacketFilter filter_from_option     (const Primitive &primitive, const Option &option, const std::string &arg);
PacketFilter filter_from_ip_option  (const Option &option, const std::string &arg);
PacketFilter filter_from_src_option (const Option &option, const std::string &arg);
PacketFilter filter_from_dst_option (const Option &option, const std::string &arg);
PacketFilter filter_from_tcp_option (const Option &option, const std::string &arg);
PacketFilter filter_from_icmp_option(const Option &option, const std::string &arg);

std::vector<PacketFilter> filters_from_ipfilter_line(const std::string &line);
std::vector<PacketFilter> filters_from_substr       (char **position, char *end);

Primitive find_primitive_from_string(const std::string &str);

#endif

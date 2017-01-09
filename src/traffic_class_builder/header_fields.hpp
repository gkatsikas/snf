#ifndef _HEADER_FIELDS_HPP_
#define _HEADER_FIELDS_HPP_

/*
 * header_fields.hpp
 *
 * A collection of important header fields.
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

// List of supported header fields
static const int start = __LINE__;
#define HEADER(FL) \
	FL(unknown) \
	FL(ambiguous_field) \
	FL(mtu) \
	FL(vlan_pcp) \
	FL(vlan_vid) \
	FL(vlan_dei) \
	FL(ip_ver) \
	FL(ip_ihl) \
	FL(ip_tl) \
	FL(ip_id) \
	FL(ip_dscp) \
	FL(ip_ect) \
	FL(ip_ce) \
	FL(ip_TTL) \
	FL(ip_proto) \
	FL(ip_chksum) \
	FL(ip_src) \
	FL(ip_dst) \
	FL(icmp_type) \
	FL(icmp_code) \
	FL(icmp_chs) \
	FL(icmp_id) \
	FL(icmp_seq) \
	FL(tp_src_port) \
	FL(tp_dst_port) \
	FL(udp_len) \
	FL(udp_chs) \
	FL(tcp_sec) \
	FL(tcp_ack) \
	FL(tcp_off_res) \
	FL(tcp_flags) \
	FL(tcp_flag_syn) \
	FL(tcp_flag_fin) \
	FL(tcp_flag_ack) \
	FL(tcp_flag_rst) \
	FL(tcp_flag_psh) \
	FL(tcp_flag_urg) \
	FL(tcp_win) \
	FL(tcp_chs) \
	FL(tcp_urg) \
	FL(tcp_opt)
static const int end = __LINE__;

#define DO_DESCRIPTION(e) #e,
#define DO_ENUM(e) e,

const std::string
header_field_names[end - start - 2] = {
	HEADER(DO_DESCRIPTION)
};

enum HeaderField {
	HEADER(DO_ENUM)
};

#endif

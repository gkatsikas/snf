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

static const int start = __LINE__;
#define HEADER(FOO) \
	FOO(unknown) \
	FOO(mtu) \
	FOO(vlan_pcp) \
	FOO(vlan_vid) \
	FOO(vlan_dei) \
	FOO(ip_src) \
	FOO(ip_dst) \
	FOO(ip_ihl) \
	FOO(ip_proto) \
	FOO(ip_ver) \
	FOO(ip_id) \
	FOO(ip_dscp) \
	FOO(ip_ect) \
	FOO(ip_ce) \
	FOO(ip_chksum) \
	FOO(ip_TTL) \
	FOO(tp_srcPort) \
	FOO(tp_dstPort) \
	FOO(tcp_syn) \
	FOO(tcp_fin) \
	FOO(tcp_ack) \
	FOO(tcp_rst) \
	FOO(tcp_psh) \
	FOO(tcp_urg) \
	FOO(tcp_win)
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

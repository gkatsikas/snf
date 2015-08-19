#ifndef HEADER_FIELDS_HPP
#define HEADER_FIELDS_HPP

#include <string>

static const int start = __LINE__;
#define HEADER(FOO) \
	FOO(unknown) \
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

const std::string headerFieldNames[end-start-2] = {
	HEADER(DO_DESCRIPTION)
};

enum HeaderField {
	HEADER(DO_ENUM)
};

#endif

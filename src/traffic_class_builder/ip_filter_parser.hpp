//============================================================================
//        Name: ip_filter_parser.hpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: Definition of the methods that parse the filters of 
//              Hyper-NF's traffic classes.
//============================================================================

#ifndef _IP_FILTER_PARSER_HPP_
#define _IP_FILTER_PARSER_HPP_

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
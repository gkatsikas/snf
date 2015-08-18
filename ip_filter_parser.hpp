#include <string>
#include "filter.hpp"

static const int prim_start = __LINE__;
#define Prim(FOO) \
	FOO(Undefined) \
	FOO(IP) \
	FOO(SRC) \
	FOO(DST) \
	FOO(TCP) \
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
	FOO(IP_TOS) \
	FOO(IP_DSCP) \
	FOO(IP_ECT) \
	FOO(IP_CE) \
	FOO(IP_TTL) \
	FOO(IP_FRAG) \
	FOO(IP_UNFRAG) \
	FOO(TCP_OPT) \
	FOO(TCP_WIN) \
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

PacketFilter filter_from_option (Primitive primitive, Option option, std::string& arg);
PacketFilter filter_from_ip_option (Option option, std::string& arg);
PacketFilter filter_from_src_option (Option option, std::string& arg);
PacketFilter filter_from_dst_option (Option option, std::string& arg);
PacketFilter filter_from_tcp_option (Option option, std::string& arg);

Primitive find_primitive_from_string (std::string str);

std::vector<PacketFilter> filters_from_ipfilter_line (std::string line);
std::vector<PacketFilter> filters_from_substr (char** position, char* end);

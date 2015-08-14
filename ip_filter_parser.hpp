#include <string>
#include "filter.hpp"


enum class Primitive {
	Undefined,
	IP,
	SRC,
	DST,
	TCP,
	
	OR,
	AND
};

enum class Option {
	Undefined,

	IP_PROTO,
	IP_VERS,
	IP_HL,
	IP_ID,
	IP_TOS,
	IP_DSCP,
	IP_ECT,
	IP_CE,
	IP_TTL,
	IP_FRAG,
	IP_UNFRAG,
	
	TCP_OPT,
	TCP_WIN,
	
	SRC_HOST,
	SRC_NET,
	SRC_PORT,
	SRC_UDP_PORT,
	SRC_TCP_PORT,
	
	DST_HOST,
	DST_NET,
	DST_PORT,
	DST_UPD_PORT,
	DST_TCP_PORT
};

Filter filter_from_option (Primitive primitive, Option option, std::string& arg);
Filter filter_from_ip_option (Option option, std::string& arg);

void negate_pf (PacketFilter& pf);

Primitive find_primitive_from_string (std::string str);

std::vector<PacketFilter> filters_from_ipfilter_line (std::string line);
std::vector<PacketFilter> filters_from_substr (char** position, char* end,
												PacketFilter& current_filter);

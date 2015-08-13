#include <string>
#include "filter.hpp"


enum Primitive {
	IP,
	SRC,
	DST,
	TCP
};

enum Option {
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

#include <string>
#include <cstdint>
#include <iostream>

#include "filter.hpp"
#include "ip_filter_parser.hpp"

#define BUG(A) std::cerr<<"["<<__FILE__<<":"<<__LINE__<<"] "<<A \
				<<std::endl; \
				exit(1)

Filter filter_from_option (Primitive primitive, Option option, std::string& arg) {
	switch (primitive) {
		case IP:
			return filter_from_ip_option (option, arg);
		case SRC:
		case DST:
		case TCP:
			break;
	}
	return Filter();
}

Filter filter_from_ip_option (Option option, std::string& arg) {
	switch (option) {
		case IP_PROTO:
			if (!arg.compare("tcp")) {
				return Filter(ip_proto,	6);		
			}
			else if (!arg.compare("udp")) {
				return Filter(ip_proto, 6);
			}
			else if(!arg.compare("icmp")) {
				return Filter(ip_proto,1);
			}
			else if (arg.find_first_not_of("0123456789") == std::string::npos) {
				return Filter::get_filter_from_ipclass_pattern(ip_proto,arg);
			}
			else {
				BUG("Unknown protocol name: "<<arg);
			}
		case IP_VERS:
			return Filter::get_filter_from_ipclass_pattern(ip_ver,arg);
		case IP_HL:
			return Filter::get_filter_from_ipclass_pattern(ip_ihl,arg);
		case IP_ID:
			return Filter::get_filter_from_ipclass_pattern(ip_id,arg);
		case IP_TOS:
			BUG("ip tos not supported, please use ip dscp and ip ect/ce");
		case IP_DSCP:
			return Filter::get_filter_from_ipclass_pattern(ip_dscp,arg);
		case IP_ECT:
			return Filter(ip_ect,1);
		case IP_CE:
			return Filter(ip_ce,1);
		case IP_TTL:
			return Filter::get_filter_from_ipclass_pattern(ip_ttl,arg);
		case IP_FRAG:
		case IP_UNFRAG:
			BUG("IP fragmentation not supported yet");
		default:
			BUG("Unknown option for IP primitive");
	}
}

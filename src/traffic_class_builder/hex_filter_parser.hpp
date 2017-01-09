#ifndef _HEX_FILTER_PARSER_HPP_
#define _HEX_FILTER_PARSER_HPP_

/*
 * hex_filter_parser.hpp
 *
 * Definition of the methods that parse the hexadecimal filters of
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

#include <map>
#include <string>

#include "filter.hpp"
#include "../shared/helpers.hpp"

/*
 * Outcome of Classifier's filter
 */
enum ClassifierAction {
	PASS,
	DROP
};

#define   IP_HL_VAL(ipvhl) ((ipvhl) & 0x0f)
#define IP_VERS_VAL(ipvhl) ((ipvhl) >> 4)
#define IP_DSCP_VAL(iptos) ((iptos) >> 2)

///////////////////////////////////////////////////////////////////////////////////
// Maps of Header Positions --> Header Fields (Ethernet, ARP, IPv4, ICMP, TCP, UDP)
///////////////////////////////////////////////////////////////////////////////////
typedef std::unordered_map< std::string, Option > HdrPosToField;

static const HdrPosToField EtherPositionToFieldLabel = {
	{"0",  Option(Option::ETH_SRC)},
	{"6",  Option(Option::ETH_DST)},
	{"12", Option(Option::ETH_TYPE)}
};

static const HdrPosToField ARPPositionToFieldLabel = {
	{"14", Option(Option::ARP_HW_TYPE)},
	{"16", Option(Option::ARP_PT_TYPE)},
	{"18", Option(Option::ARP_HW_ADD_LEN)},
	{"19", Option(Option::ARP_PT_ADD_LEN)},
	{"20", Option(Option::ARP_OP)},
	{"22", Option(Option::ARP_SDR_HW)},
	{"28", Option(Option::ARP_SDR_IP)},
	{"32", Option(Option::ARP_TRG_HW)},
	{"38", Option(Option::ARP_TRG_IP)}
};

static const HdrPosToField IPPositionToFieldLabel = {
	{"14", Option(Option::IP_VERS_HL)},
	{"15", Option(Option::IP_DSCP)},
	{"16", Option(Option::IP_TL)},
	{"18", Option(Option::IP_ID)},
	{"20", Option(Option::IP_FLAGS)},
	{"22", Option(Option::IP_TtL)},
	{"23", Option(Option::IP_PROTO)},
	{"24", Option(Option::IP_CHS)},
	{"26", Option(Option::IP_SRC)},
	{"30", Option(Option::IP_DST)}
};

static const HdrPosToField ICMPPositionToFieldLabel = {
	{"34", Option(Option::ICMP_TYPE)},
	{"35", Option(Option::ICMP_CODE)},
	{"36", Option(Option::ICMP_CHS)},
	{"38", Option(Option::ICMP_ID)},
	{"40", Option(Option::ICMP_SEQ)}
};

static const HdrPosToField UDPPositionToFieldLabel = {
	{"34", Option(Option::SRC_UDP_PORT)},
	{"36", Option(Option::DST_UDP_PORT)},
	{"38", Option(Option::UDP_LEN)},
	{"40", Option(Option::UDP_CHS)}
};

static const HdrPosToField TCPPositionToFieldLabel = {
	{"34", Option(Option::SRC_TCP_PORT)},
	{"36", Option(Option::DST_TCP_PORT)},
	{"38", Option(Option::TCP_SEQ)},
	{"42", Option(Option::TCP_ACK)},
	{"46", Option(Option::TCP_OFF_RES)},
	{"47", Option(Option::TCP_FLAGS)},
	{"48", Option(Option::TCP_WIN)},
	{"50", Option(Option::TCP_CHS)},
	{"52", Option(Option::TCP_URG)},
	{"54", Option(Option::TCP_OPT)}
};

///////////////////////////////////////////////////////////////////////////////////
// Associate values of specific header fields with network stack semantics
///////////////////////////////////////////////////////////////////////////////////
enum class Semantics {
	ETH_TYPE_IP,
	ETH_TYPE_ARP,
	ARP_OP_REQ,
	ARP_OP_RES,
	IP_PR_ICMP,
	IP_PR_IGMP,
	IP_PR_TCP,
	IP_PR_UDP,
	ICMP_TYPE_REQ,
	ICMP_TYPE_REP,
	TCP_FLAG_FIN,
	TCP_FLAG_SYN,
	TCP_FLAG_RST,
	TCP_FLAG_PSH,
	TCP_FLAG_ACK,
	TCP_FLAG_URG,
	TCP_FLAG_ECE,
	TCP_FLAG_CWR,
	TCP_FLAG_FIN_ACK
};

/* A header field associated with a value */
typedef std::pair< const Option, const std::string > HdrPosWithVal;
/* A pair of (headerField, Value) associated with a meaning */
typedef std::map< HdrPosWithVal, Semantics > HdrSemantics;

static const HdrSemantics EthernetSemantics = {
	{ {Option(Option::ETH_TYPE), "0800"}, Semantics::ETH_TYPE_IP  },
	{ {Option(Option::ETH_TYPE), "0806"}, Semantics::ETH_TYPE_ARP }
};

static const HdrSemantics ARPSemantics = {
	{ {Option(Option::ARP_OP), "0001"},   Semantics::ARP_OP_REQ },
	{ {Option(Option::ARP_OP), "0002"},   Semantics::ARP_OP_RES }
};

static const HdrSemantics IPSemantics = {
	{ {Option(Option::IP_PROTO), "01"},   Semantics::IP_PR_ICMP },
	{ {Option(Option::IP_PROTO), "02"},   Semantics::IP_PR_IGMP },
	{ {Option(Option::IP_PROTO), "06"},   Semantics::IP_PR_TCP  },
	{ {Option(Option::IP_PROTO), "11"},   Semantics::IP_PR_UDP  }
};

static const HdrSemantics ICPMPSemantics = {
	{ {Option(Option::ICMP_TYPE), "08"},  Semantics::ICMP_TYPE_REQ },
	{ {Option(Option::ICMP_TYPE), "00"},  Semantics::ICMP_TYPE_REP }
};

static const HdrSemantics TCPSemantics = {
	{ {Option(Option::TCP_FLAGS), "01"},  Semantics::TCP_FLAG_FIN },
	{ {Option(Option::TCP_FLAGS), "02"},  Semantics::TCP_FLAG_SYN },
	{ {Option(Option::TCP_FLAGS), "04"},  Semantics::TCP_FLAG_RST },
	{ {Option(Option::TCP_FLAGS), "08"},  Semantics::TCP_FLAG_PSH },
	{ {Option(Option::TCP_FLAGS), "10"},  Semantics::TCP_FLAG_ACK },
	{ {Option(Option::TCP_FLAGS), "11"},  Semantics::TCP_FLAG_FIN_ACK },
	{ {Option(Option::TCP_FLAGS), "20"},  Semantics::TCP_FLAG_URG },
	{ {Option(Option::TCP_FLAGS), "40"},  Semantics::TCP_FLAG_ECE },
	{ {Option(Option::TCP_FLAGS), "80"},  Semantics::TCP_FLAG_CWR }
};

const std::string ip_or_arp(
	const std::string &h_field_pos, const std::string &h_field_val
);
const std::string which_arp(
	const std::string &h_field_pos, const std::string &h_field_val
);
bool filter_from_ip_option (
	std::vector<PacketFilter> &finished_filters,
	const std::string &h_field_pos,	const std::string &h_field_val
);
bool filter_from_arp_option(
	std::vector<PacketFilter> &finished_filters,
	const std::string &h_field_pos,	const std::string &h_field_val
);

std::pair< std::vector<PacketFilter>, ClassifierAction > filters_from_classifier_line(
	const std::string &line
);

#endif

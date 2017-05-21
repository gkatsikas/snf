// -*- c-basic-offset: 4 -*-
/*
 * ip_filter_parser_test.cpp
 *
 * Tests SNF's IPFilter parser.
 *
 * Copyright (c) 2015-2017 KTH Royal Institute of Technology
 * Copyright (c) 2015-2017 Georgios Katsikas, Marcel Enguehard
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

#include <random>
#include <cstdlib>

#include "../../src/logger/logger.hpp"
#include "../../src/shared/helpers.hpp"
#include "../../src/traffic_class_builder/filter.hpp"
#include "../../src/traffic_class_builder/ip_filter_parser.hpp"

int
main()
{
	// Initialize logger
	Logger test_log(__FILE__);

	info_chatter(test_log, "IPFilter parser test started");

	info_chatter(test_log, "");
        info_chatter(test_log, "------------ Test 0 ------------");
	std::string line = "(dst tcp port > 1023), (dst net 10.0.0.0/24) && (ip proto icmp)";
	std::vector<std::string> rules = separate_args(line);
	std::vector<PacketFilter> pf_vec;
	for (auto &it : rules) {
		info_chatter(test_log, "Rule: " << it);
		pf_vec = filters_from_ipfilter_line(it);
		def_chatter(test_log, pf_vec_to_str(pf_vec));
	}

	info_chatter(test_log, "");
	info_chatter(test_log, "------------ Test 1 ------------");

	std::string pattern = "(ip ttl 5 or ip vers < 6)";
	pf_vec = filters_from_ipfilter_line(pattern);
	def_chatter(test_log, "\tPacket filter t1: " << pf_vec_to_str(pf_vec));

	info_chatter(test_log, "");
	info_chatter(test_log, "------------ Test 2 ------------");

	pattern = "10.0.0.4";
	Filter f1 = Filter::get_filter_from_ipclass_pattern(ip_dst, pattern);
	def_chatter(test_log, "\tFilter f1: " << f1.to_str());

	pattern = "192.168.0.1";
	Filter f2 = Filter::get_filter_from_ipclass_pattern(ip_src, pattern);
	def_chatter(test_log, "\tFilter f2: " << f2.to_str());

	PacketFilter pf1;
	pf1[ip_dst] = f1;
	def_chatter(test_log, "\tPacket Filter pf1: " << pf_to_str(pf1));
	PacketFilter pf2;
	pf2[ip_src] = f2;
	def_chatter(test_log, "\tPacket Filter pf2: " << pf_to_str(pf2));

	std::vector<PacketFilter> pf_vec1;
	pf_vec1.push_back(pf1);
	std::vector<PacketFilter> pf_vec2;
	pf_vec2.push_back(pf2);

	pf_vec = and_pf_vec(pf_vec1, pf_vec2);
	def_chatter(test_log, "Merged pf: " << pf_vec_to_str(pf_vec));

	info_chatter(test_log, "");
	info_chatter(test_log, "------------ Test 3 ------------");

	std::vector<PacketFilter> neg_pf_vec_sin = negate_pf(pf1);
	def_chatter(test_log, "Negated pf (Single): " << pf_vec_to_str(neg_pf_vec_sin));

	std::vector<PacketFilter> neg_pf_vec_list = negate_pf_vec(pf_vec1);
	def_chatter(test_log, "Negated pf   (List): " << pf_vec_to_str(neg_pf_vec_list));

	if (neg_pf_vec_sin == neg_pf_vec_list) {
		info_chatter(test_log, "Correct negations");
	}
	else {
		throw std::runtime_error("Negations do not agree");
	}

	info_chatter(test_log, "");
	info_chatter(test_log, "------------ Test 4 ------------");

	std::string a = "tcp opt syn && tcp win < 20";
	pf_vec = filters_from_ipfilter_line(a);
	def_chatter(test_log, pf_vec_to_str(pf_vec));

	info_chatter(test_log, "");
	info_chatter(test_log, "------------ Test 5 ------------");

	a = "(dst net 10.0.0.0/24) and (ip proto icmp)";
	pf_vec = filters_from_ipfilter_line(a);
	def_chatter(test_log, pf_vec_to_str(pf_vec));

	std::string b = "(src udp port <= 456)";
	std::vector<PacketFilter> pf_vec_2 = filters_from_ipfilter_line(b);
	def_chatter(test_log, pf_vec_to_str(pf_vec_2));

	std::cout << std::endl;
	info_chatter(test_log, "IPFilter parser test is completed");

	exit(SUCCESS);
}

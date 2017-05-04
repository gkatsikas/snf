// -*- c-basic-offset: 4 -*-
/*
 * filter_test.cpp
 *
 * Generates and benchmarks SNF packet filters.
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

void create_filters();
void intersect_filters();

// Initialize logger
Logger test_log(__FILE__);

int
main()
{
	info_chatter(test_log, "Filter test started");

	create_filters();

	intersect_filters();

	std::cout << std::endl;
	info_chatter(test_log, "Filter test is completed");

	exit(SUCCESS);
}

void create_filters()
{
	info_chatter(test_log, "\t>>>>>>>>>>>>>> Create Filters");

	Filter f1(ip_dst, aton("200.0.0.2"));
	def_chatter(test_log, "\t\tFilter f1: " << f1.to_str());

	Filter f2(tp_dst_port, 1234);
	def_chatter(test_log, "\t\tFilter f2: " << f2.to_str());

	Filter f3(ip_proto, 17);
	def_chatter(test_log, "\t\tFilter f3: " << f3.to_str());
	// uint32_t base_address = aton("10.0.0.0");
	std::string port_pattern("65546");
	Filter f4 = Filter::get_filter_from_ipclass_pattern(tp_dst_port, port_pattern);
	def_chatter(test_log, "\t\tFilter f4: " << f4.to_str());

//	std::string pattern("pattern - - 10.0.0.4 1024-10000 0 0");
	std::string pattern("10.0.0.4");
	Filter f5 = Filter::get_filter_from_ipclass_pattern(ip_dst, pattern);
	def_chatter(test_log, "\t\tFilter f5: " << f5.to_str());

	port_pattern = "1479-65457";
	Filter f6 = Filter::get_filter_from_ipclass_pattern(tp_dst_port, port_pattern);
	def_chatter(test_log, "\t\tFilter f6: " << f6.to_str());

	pattern = "10.0.0.4/24";
	Filter f7 = Filter::get_filter_from_v4_prefix_str(ip_src, pattern);
	def_chatter(test_log, "\t\tFilter f7: " << f7.to_str());

	pattern = "255.255.255.255/1";
	Filter f8 = Filter::get_filter_from_v4_prefix_str(ip_src, pattern);
	def_chatter(test_log, "\t\tFilter f8: " << f8.to_str());

	port_pattern = "> 80";
	Filter f9 = Filter::get_filter_from_ipclass_pattern(tp_dst_port, port_pattern);
	def_chatter(test_log, "\t\tFilter f9: " << f9.to_str());

	port_pattern = "!= 1000";
	Filter f10 = Filter::get_filter_from_ipclass_pattern(tp_dst_port, port_pattern);
	def_chatter(test_log, "\t\tFilter f10: " << f10.to_str());
	def_chatter(test_log, "\t\tFilter f10 to IPCl: " << f10.to_ip_classifier_pattern());
}

void intersect_filters()
{
	std::cout << std::endl;
	info_chatter(test_log, "\t>>>>>>>>>>>>>> Intersect Filters");

	std::string pattern = "10.0.0.4/24";
	Filter f1 = Filter::get_filter_from_v4_prefix_str(ip_src, pattern);
	def_chatter(test_log, "\t\tFilter f1: " << f1.to_str());

	pattern = "192.168.0.1/24";
	Filter f2 = Filter::get_filter_from_v4_prefix_str(ip_src, pattern);
	def_chatter(test_log, "\t\tFilter f2: " << f2.to_str());

	f1.intersect(f2);
	def_chatter(test_log, "\t\tIntersection of f1 Λ f2: " << f1.to_str());

	pattern = "20.18.0.1/24";
	Filter f3 = Filter::get_filter_from_v4_prefix_str(ip_src, pattern);
	def_chatter(test_log, "\t\tFilter f3: " << f3.to_str());

	f1.intersect(f3);
	def_chatter(test_log, "\t\tIntersection of (f1Λf2) Λ f3: " << f1.to_str());
}
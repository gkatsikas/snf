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

	std::string pattern = "255.255.255.255/1";
	Filter f1 = Filter::get_filter_from_v4_prefix_str(ip_src, pattern);
	info_chatter(test_log, "\tFilter f1: " << f1.to_str());

	// !(ip ttl 5 or ip vers < 6) DOES NOT WORK
	pattern = "(ip ttl 5 or ip vers < 6)";
	Filter f2 = Filter::get_filter_from_ipclass_pattern(ip_src, pattern);
	info_chatter(test_log, "\tFilter f2: " << f2.to_str());

	const std::string a = "tcp opt syn && tcp win < 20";
	std::vector<PacketFilter> pf_vec = filters_from_ipfilter_line(a);
	std::cout << pf_vec_to_str(pf_vec);

	std::cout << std::endl;
	info_chatter(test_log, "IPFilter parser test is completed");

	exit(SUCCESS);
}

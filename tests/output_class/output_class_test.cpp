// -*- c-basic-offset: 4 -*-
/*
 * output_class_test.cpp
 *
 * Generates and benchmarks SNF output classes.
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

#include <string>
#include <vector>
#include <random>
#include <cstdlib>

#include "../../src/logger/logger.hpp"
#include "../../src/shared/helpers.hpp"
#include "../../src/traffic_class_builder/filter.hpp"
#include "../../src/traffic_class_builder/output_class.hpp"

int
main()
{
	// Initialize logger
	Logger test_log(__FILE__);

	info_chatter(test_log, "Output Class test started");


	std::string pattern("pattern - - 10.0.0.4 1024-10000 0 0");
	std::vector<std::string> v = split(pattern, " ");

	std::pair<OutputClass, OutputClass> ocp = OutputClass::output_class_from_pattern(v);
	std::cout << "Pattern: " << pattern << std::endl;
	std::cout << "Output Class: \n" << ocp.first.to_str()  << std::endl;


	std::cout << std::endl;


	pattern = "pattern 192.168.23.45 67-590 103.50.60.48 34567-60000 0 1";
	v = split(pattern, " ");

	ocp = OutputClass::output_class_from_pattern(v);
	std::cout << "Pattern: " << pattern << std::endl;
	std::cout << "Output Class: \n" << ocp.first.to_str()  << std::endl;


	std::cout << std::endl;


	Filter f1 = Filter::get_filter_from_v4_prefix_str(ip_dst, "192.168.70.2/24");
	pattern = "204.56.78.98 0";
	OutputClass oc = OutputClass::port_from_lookup_rule(pattern, f1);
	std::cout << "Pattern: " << pattern << std::endl;
	std::cout << "Output Class: \n" << oc.to_str()  << std::endl;


	std::cout << std::endl;
	info_chatter(test_log, "Output Class test is completed");

	exit(SUCCESS);
}

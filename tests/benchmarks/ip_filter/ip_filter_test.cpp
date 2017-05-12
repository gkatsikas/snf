// -*- c-basic-offset: 4 -*-
/*
 * ip_filter_test.cpp
 *
 * Generates and benchmarks Click's IPFilter.
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
#include <fstream>
#include <cstdlib>
#include <iostream>

#include "../../../src/logger/logger.hpp"
#include "../../../src/shared/helpers.hpp"
#include "../../../src/traffic_class_builder/filter.hpp"

#define MAX_NUMBER_CLASSES 8192
#define REMOVED_ADDRESSES  5
#define ALLOWED_PORTS      5

#define CLASSIFIERS_REPO (std::string)"./output"
#define CLASSIFIERS_PREF (std::string)"ip_filter_bench_"

std::string
generate_conf_parameters()
{
	std::stringstream config_stream;

	config_stream << "define(" << std::endl;

	config_stream << "\t$iface         0,"              << std::endl;
	config_stream << "\t$macAddr       ec:f4:bb:d5:fe:08," << std::endl;
	config_stream << "\t$gwMACAddr     ec:f4:bb:d5:fe:d0," << std::endl;
	config_stream << "\t$queueSize     1024,"  << std::endl;
	config_stream << "\t$burst         32"     << std::endl;
	config_stream << ");" << std::endl << std::endl;

	return config_stream.str();
}

std::string
generate_click_class_start()
{
	std::stringstream config_stream;

	config_stream << "/////////////////////////////////////////////////////////////////////////////" << std::endl;
	config_stream << std::endl;
	config_stream << "/////////////////////////////////////////////////////////////////////////////" << std::endl;
	config_stream << "// Compound element" << std::endl;
	config_stream << "elementclass IPFilterBench {" << std::endl;
	config_stream << "\t// Module's arguments" << std::endl;
	config_stream << "\t$iface, $macAddr, $gwMACAddr," << std::endl;
	config_stream << "\t$queueSize, $burst |" << std::endl;
	config_stream << std::endl;
	config_stream << "\t// Module's I/O" << std::endl;
	config_stream << "\tin  :: FromDPDKDevice($iface);" << std::endl;
	config_stream << "\tout :: ToDPDKDevice  ($iface);" << std::endl;
	config_stream << std::endl;
	config_stream << "\t// Encapsulate Ethernet" << std::endl;
	config_stream << "\tetherEncap :: EtherEncap(0x0800, $macAddr, $gwMACAddr);" << std::endl;
	config_stream << std::endl;
	config_stream << "\t// Strip Ethernet header" << std::endl;
	config_stream << "\tstrip :: Strip(14);" << std::endl;
	config_stream << std::endl;
	config_stream << "\t// Mark IP header" << std::endl;
	config_stream << "\tmark :: MarkIPHeader();" << std::endl;
	config_stream << std::endl;
	config_stream << "\t/////////////////////////////////////////////////////////////////////" << std::endl;
	config_stream << "\t// Pipeline" << std::endl;
	config_stream << "\t/////////////////////////////////////////////////////////////////////" << std::endl;
	config_stream << "\t// Input" << std::endl;
	config_stream << "\tin -> strip;" << std::endl;
	config_stream << std::endl;

	return config_stream.str();
}

std::string
generate_click_class_end()
{
	std::stringstream config_stream;

	config_stream << "}" << std::endl;
	config_stream << "/////////////////////////////////////////////////////////////////////////////" << std::endl;
	config_stream << std::endl;
	config_stream << std::endl;
	config_stream << "/////////////////////////////////////////////////////////////////////////////" << std::endl;
	config_stream << "// Call Click class" << std::endl;
	config_stream << "/////////////////////////////////////////////////////////////////////////////" << std::endl;
	config_stream << "ipFilterBech :: IPFilterBench(" << std::endl;
	config_stream << "\t$iface, $macAddr, $gwMACAddr," << std::endl;
	config_stream << "\t$queueSize, $burst" << std::endl;
	config_stream << ");" << std::endl;
	config_stream << "/////////////////////////////////////////////////////////////////////////////" << std::endl;

	return config_stream.str();
}

int
main()
{
	// Initialize logger
	Logger test_log(__FILE__);

	unsigned short size = 1;

	std::vector<std::string> position = {"first", "middle", "end"};

	std::default_random_engine generator;
	std::uniform_int_distribution<uint16_t> distribution(0, 0xffff);

	std::ofstream myfile;

	TrafficClass test_tc;
	test_tc.intersect_filter(Filter(ip_dst, aton("200.0.0.2")));
	test_tc.intersect_filter(Filter(tp_dst_port, 1234));
	test_tc.intersect_filter(Filter(ip_proto, 17));

	// Create the ouput folder, if it does not exist
	if ( ! create_directory_path(CLASSIFIERS_REPO) ) {
		error_chatter(test_log, "Failed to create output directory: " << CLASSIFIERS_REPO);
		exit(FAILURE);
	}
	info_chatter(test_log, "Created output directory: " << CLASSIFIERS_REPO);

	// We increase the number of traffic classes exponentially (1, 2, 4, ..., MAX_NUMBER_CLASSES)
	while (size <= MAX_NUMBER_CLASSES) {
		// For each traffic class size, we create 3 different Click configurations (fisrt, middle, end)
		// |->  First: The hit in the classifier occurs at the first rule  (fastest case)
		// |-> Middle: The hit in the classifier occurs at the middle rule (average case)
		// |->   Last: The hit in the classifier occurs at the last rule   (slowest case)
		for(int i=0; i<3; i++) {
			myfile.open(
				CLASSIFIERS_REPO + "/" + CLASSIFIERS_PREF + std::to_string(size) + "_" + position[i] + ".click",
				std::ios::out
			);

			myfile << generate_conf_parameters();
			myfile << generate_click_class_start();

			myfile << "\t// IPFilter" << std::endl;
			myfile << "\tipFilter :: IPFilter(\n";
			for(int j=0; j<size; j++) {
				if ((i==0 && j==0) || (i==1 && j==size/2) || (i==2 && j==size-1)){
					// We only allow this traffic class (arg is true)
					myfile << "\t\t" << test_tc.to_ip_filter_pattern(true) << ",\n";
					continue;
				}

				TrafficClass tc;
				uint32_t base_address = aton(std::to_string(j) + ".0.0.0");
				Filter f = Filter::get_filter_from_v4_prefix(ip_dst, base_address, 8);

				uint16_t dice_roll;

				for(int k=0; k<REMOVED_ADDRESSES; k++) {
					dice_roll = distribution(generator);
					f.differentiate(Filter(ip_dst, base_address + dice_roll));
				}

				tc.intersect_filter(f);

				f = Filter(tp_dst_port);
				f.make_none();

				for(int k=0; k<ALLOWED_PORTS; k++) {
					dice_roll = distribution(generator);
					f.unite(Filter(tp_dst_port, dice_roll));
				}

				tc.intersect_filter(f);

				// We drop this traffic class (arg is false)
				myfile << "\t\t" << tc.to_ip_filter_pattern(false) << ",\n";
			}
			myfile << "\t);\n";
			myfile << "\n\tstrip -> mark -> [0]ipFilter;\n\n";

			myfile << "\tipFilter[0] -> etherEncap -> out;\n";
			myfile << "\tipFilter[1] -> Discard;\n";

			myfile << generate_click_class_end();

			myfile.close();
		}
		size *= 2;
	}

	info_chatter(test_log, "Done! Check output Click confgurations at: " << CLASSIFIERS_REPO);

	exit(SUCCESS);
}

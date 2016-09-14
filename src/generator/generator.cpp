// -*- c-basic-offset: 4 -*-
/* generator.cpp
 * 
 * Export a runnable, SNF configuration.
 * The input parameters will drive the Generator to either create
 * a fully software-based SNF or a hardware-assisted one.
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

#include "generator.hpp"

#include "../shared/helpers.hpp"
#include "../synthesizer/synthesizer.hpp"

Generator::Generator(Synthesizer *synth) {
	this->log.set_logger_file(__FILE__);
	if ( !synth ) {
		FANCY_BUG(this->log, "\tGenerator: Invalid Synthesizer object");
	}

	this->synthesizer      = synth;
	this->input_properties = this->synthesizer
								->get_chain_parser()
								->get_chain_graph()
								->get_properties();

	this->hw_classification             = this->input_properties->has_hardware_classification();
	this->click_type                    = this->input_properties->get_click_type();
	this->traffic_classification_format = this->input_properties->get_traffic_classification_format();
	this->proc_layer                    = this->input_properties->get_processing_layer();
	this->basic_configuration_filename  = this->input_properties->get_output_filename();
	this->soft_configuration_filename   = this->basic_configuration_filename + ".click";
}

Generator::~Generator() {
	delete this->synthesizer;
}

const std::string
Generator::get_output_files_list_str(void) {
	std::string all_out_files;
	all_out_files = "\n\t\t\t\t\t\t\t==== |--> " + this->soft_configuration_filename;
	TrafficClassFormat tc_format = this->traffic_classification_format;

	// A single configuration file is produced if we are in Click or RSS mode.
	if  ( 
		(!this->hw_classification) || 
		((tc_format != FlowDirector) && (tc_format != OpenFlow))
	)
		return all_out_files;

	std::string extension;

	// Some hardware classification options generate additional configuration files
	if ( this->hw_classification ) {
		switch (tc_format) {
			case ClickIPClassifier:
			case RSSHashing:
			case FlowDirector:
				extension = ".flowdirector";
				break;
			case OpenFlow:
				extension = ".openflow";
				break;
		}
	}

	info_chatter(this->log, "Ifaces: " << this->synthesizer->get_snf_ifaces_no());

	all_out_files += "\n";

	// Output files (one per interface) to host the Flow director commands of each SNF interface.
	unsigned short iface_counter = 0;
	for ( auto &it : this->synthesizer->get_snf_ifaces() ) {
		std::string nf    = it.first;
		std::string iface = it.second;
		std::string hdwr_file = this->basic_configuration_filename + "_" + nf + "_" + iface + extension;
		all_out_files += "\t\t\t\t\t\t\t==== |--> " + hdwr_file;

		++iface_counter;

		// Still have interfaces left
		if ( iface_counter < this->synthesizer->get_snf_ifaces_no()) {
			all_out_files += "\n";
		}
	}

	return all_out_files;
}

void
Generator::generate_indicative_chain_parameters(unsigned short &snf_ifaces_no, std::stringstream &config_stream) {

	if ( snf_ifaces_no < 4 ) {
		return;
	}

	config_stream << "define(" << std::endl;

	for (unsigned short i=0 ; i<snf_ifaces_no ; i++) {
		if ( i == 0 ) {
			config_stream << "\t$iface0         0,"                 << std::endl;
			config_stream << "\t$macAddr0       ec:f4:bb:d5:fe:08," << std::endl;
			config_stream << "\t$ipAddr0        10.0.0.1,"          << std::endl;
			config_stream << "\t$ipNetHost0     10.0.0.0/32,"       << std::endl;
			config_stream << "\t$ipBcast0       10.0.0.255/32,"     << std::endl;
			config_stream << "\t$ipNet0         10.0.0.0/24,"       << std::endl;
			config_stream << "\t$color0         1,"                 << std::endl;
			config_stream << "\t$gwMACAddr0     ec:f4:bb:d5:fe:d0," << std::endl;
		}
		else if ( i == 1 ) {
			config_stream << "\t$iface1         1,"                 << std::endl;
			config_stream << "\t$macAddr1       ec:f4:bb:d5:fe:0a," << std::endl;
			config_stream << "\t$ipAddr1        100.0.0.1,"         << std::endl;
			config_stream << "\t$ipNetHost1     100.0.0.0/32,"      << std::endl;
			config_stream << "\t$ipBcast1       100.0.0.255/32,"    << std::endl;
			config_stream << "\t$ipNet1         100.0.0.0/24,"      << std::endl;
			config_stream << "\t$color1         2,"                 << std::endl;
			config_stream << "\t$gwMACAddr1     ec:f4:bb:d5:fe:d2," << std::endl;
		}
		else if ( i == 2 ) {
			config_stream << "\t$iface2         2,"               << std::endl;
			config_stream << "\t$macAddr2       00:1b:21:4b:09:c8," << std::endl;
			config_stream << "\t$ipAddr2        150.0.0.1,"         << std::endl;
			config_stream << "\t$ipNetHost2     150.0.0.0/32,"      << std::endl;
			config_stream << "\t$ipBcast2       150.0.0.255/32,"    << std::endl;
			config_stream << "\t$ipNet2         150.0.0.0/24,"      << std::endl;
			config_stream << "\t$color2         3,"                 << std::endl;
			config_stream << "\t$gwMACAddr2     ec:f4:bb:d6:06:d8," << std::endl;
		}
		else if ( i == 3 ) {
			config_stream << "\t$iface3         3,"                 << std::endl;
			config_stream << "\t$macAddr3       00:1b:21:4b:09:c9," << std::endl;
			config_stream << "\t$ipAddr3        200.0.0.1,"         << std::endl;
			config_stream << "\t$ipNetHost3     200.0.0.0/32,"      << std::endl;
			config_stream << "\t$ipBcast3       200.0.0.255/32,"    << std::endl;
			config_stream << "\t$ipNet3         200.0.0.0/24,"      << std::endl;
			config_stream << "\t$color3         4,"                 << std::endl;
			config_stream << "\t$gwMACAddr3     ec:f4:bb:d6:06:da," << std::endl;
		}
		config_stream << std::endl;
	}

	config_stream << "\t$gwPort         " << std::to_string(snf_ifaces_no-1) << "," << std::endl;
	config_stream << std::endl;
	config_stream << "\t$queueSize      1024," << std::endl;
	config_stream << "\t$mtuSize        9000," << std::endl;
	config_stream << "\t$ioMethod       DPDK," << std::endl;
	config_stream << std::endl;
	config_stream << "\t$burst          32,"   << std::endl;
	config_stream << "\t$burstIn        128,"  << std::endl;
	config_stream << "\t$burstOut       32,"   << std::endl;
	config_stream << "\t$txNdesc        1024," << std::endl;
	config_stream << "\t$rxNdesc        256,"  << std::endl;
	config_stream << std::endl;
	config_stream << "\t$ioCore0        0,"    << std::endl;
	config_stream << "\t$ioCore1        0,"    << std::endl;
	config_stream << "\t$position       1,"    << std::endl;
	config_stream << "\t$reportFile     nf_rate.dat" << std::endl;
	config_stream << ");" << std::endl << std::endl;
}
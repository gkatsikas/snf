// -*- c-basic-offset: 4 -*-
/* generator.cpp
 * 
 * Export a runnable, Hyper-NF configuration.
 * The input parameters will drive the Generator to either create
 * a fully software-based Hyper-NF or a hardware-assisted one.
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
		FANCY_BUG(this->log, "Generator: Invalid Synthesizer object");
	}

	this->synthesizer      = synth;
	this->input_properties = this->synthesizer
								->get_chain_parser()
								->get_chain_graph()
								->get_properties();

	this->hw_classification             = this->input_properties->has_hardware_classification();
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
	all_out_files = "\n\t\t\t\t\t\t\t\t==== |--> " + this->soft_configuration_filename;
	TrafficClassFormat tc_format = this->traffic_classification_format;

	// A single configuration file is produced if we are in Click or RSS mode.
	if  ( 
		(!this->hw_classification) || 
		((tc_format != Flow_Director) && (tc_format != OpenFlow))
	)
		return all_out_files;

	std::string extension;

	// Some hardware classification options generate additional configuration files
	if ( this->hw_classification ) {
		switch (tc_format) {
			case Click:
			case RSS_Hashing:
			case Flow_Director:
				extension = ".flowdirector";
				break;
			case OpenFlow:
				extension = ".openflow";
				break;
		}
	}

	info_chatter(this->log, "Ifaces: " << this->synthesizer->get_hyper_nf_ifaces_no());

	all_out_files += "\n";

	// Output files (one per interface) to host the Flow director commands of each Hyper-NF interface.
	unsigned short iface_counter = 0;
	for ( auto &it : this->synthesizer->get_hyper_nf_ifaces() ) {
		std::string nf    = it.first;
		std::string iface = it.second;
		std::string hdwr_file = this->basic_configuration_filename + "_" + nf + "_" + iface + extension;
		all_out_files += "\t\t\t\t\t\t\t\t==== |--> " + hdwr_file;

		++iface_counter;

		// Still have interfaces left
		if ( iface_counter < this->synthesizer->get_hyper_nf_ifaces_no()) {
			all_out_files += "\n";
		}
	}

	return all_out_files;
}

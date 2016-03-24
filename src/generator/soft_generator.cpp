// -*- c-basic-offset: 4 -*-
/* soft_generator.cpp
 * 
 * Export a runnable, software-based (Click) only Hyper-NF configuration.
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

#include "soft_generator.hpp"

SoftGenerator::SoftGenerator(Synthesizer *synth) : Generator(synth) {
	def_chatter(this->log, "\tSoftware-based generator constructed");
}

SoftGenerator::~SoftGenerator() {
	def_chatter(this->log, "\tSoftware-based generator deleted");
}

/*
 * Method that abstracts the input-dependent code generation process.
 */
bool
SoftGenerator::generate_equivalent_configuration(const bool to_file) {
	return this->generate_all_in_soft_configuration(to_file);
}

/*
 * Generate a new Click configuration that implements the chain in one Click module.
 * The configuration must achieve equivalent functionality with the initial one.
 */
bool
SoftGenerator::generate_all_in_soft_configuration(const bool &to_file) {

	std::ofstream  *out_file = NULL;
	std::streambuf *def_cout = NULL;
	std::stringstream config_stream;

	def_chatter(this->log, "\tAll-in-Software Hyper-NF Generator...");

	this->synthesizer->print_hyper_nf_ifaces();

	// Costruct the path of Click elements that will lead this modified
	// (i.e., rewritten by Click IPRewriter already) traffic class out of Click.
	// This set of elements follows IPRewriter.
	for ( auto &it : this->synthesizer->get_nat_per_output_iface() ) {

		std::string out_nf_and_iface = it.first;

		// Extract the NF name and its' interface
		std::vector<std::string> token = split(out_nf_and_iface, "-");
		std::string nf    = token[0];
		std::string iface = token[1];

		// The NAT of this path
		auto nat = it.second;

		// The configuration parameters of the ToDevice element
		std::string iface_config = out_nf_and_iface + ", " +
									this->synthesizer->get_nat_per_output_iface_conf(out_nf_and_iface);

		// If we meet the interface of the first NF, it means that we go backward
		// The MAC addresses are set accordingly
		std::string encap_addresses;
		if ( nf == "NF_1" ) {
			encap_addresses = "$macAddr0, $gwMACAddr0";
		}
		// If we meet the interface of the last NF, it means that we go forward
		else {
			encap_addresses = "$macAddr1, $gwMACAddr1";
		}

		config_stream 	<< "/** NAT going to: " << out_nf_and_iface << " **/" << std::endl;	
		config_stream 	<< nat->get_name() << " :: IPRewriter(" << nat->compute_conf() 
						<< "DEC_IP_TTL true, CALC_CHECKSUM true);" << std::endl;

		// Be careful, some interfaces that appear here are internal.
		// These need to be discarded.
		if ( this->synthesizer->is_hyper_nf_iface(nf, iface) ) {
			config_stream 	<< nat->get_name() << "[" << nat->get_outbound_port()
							<< "] -> EtherEncap(0x0800, " + encap_addresses + 
							") -> Queue ($queueSize) -> ToDevice ("
							<< iface_config << ");" << std::endl;
			//config_stream << nat->get_name() << "[" << nat->get_outbound_port()
			//				<< "] -> StoreEtherAddress($gwMACAddr1, dst) -> ToDPDKDevice ("
			//				<< dpdk_iface << ", BURST $burst, NDESC $txNdesc, IQUEUE $queueSize, TIMEOUT 0);"
			//				<< std::endl;
		}
		else {
			config_stream 	<< nat->get_name() << "[" << nat->get_outbound_port()
							<< "] -> Discard();" << std::endl;
		}
		
		// Discarded paths
		for(unsigned short i=0; i<nat->get_outbound_port(); i++) {
			config_stream 	<< nat->get_name() << "[" << i << "] -> Discard();" << std::endl;
		}

		config_stream << std::endl;
	}

	int i = 0;

	// Construct the IPClassifier(s) and the path of Click elements
	// that lead to all its/their traffic classes.
	for ( auto &it : this->synthesizer->get_tc_per_input_iface() ) {
		std::string ipc_name = "ipc"+std::to_string(i++);
		config_stream << ipc_name + " :: IPClassifier (" << std::endl;
		std::vector<std::string> chains;
		for (auto &tc: it.second) {
			config_stream << "\t" << tc.second.m_pattern << "," << std::endl;
			chains.push_back(tc.second.get_chain());
		}
		config_stream << ");" << std::endl;

		for (size_t i = 0; i<chains.size(); i++) {
			config_stream << ipc_name + "[" << i << "] -> " << chains[i] << std::endl;
		}

		//config_stream << "FromDevice (" << it.first << ") -> MarkIPHeader(OFFSET 14) -> " + ipc_name + ";" << std:;endl;	
		//config_stream << "FromDevice (" << it.first << ") -> Strip(14) -> MarkIPHeader() -> IPPrint(LENGTH true, TTL true) -> " + ipc_name + ";" << std::endl;
		//config_stream << "FromDevice (" << it.first << ") -> MarkIPHeader(OFFSET 14) -> " + ipc_name + ";" << std::endl;
		config_stream << "FromDevice (" << it.first << ") -> Strip(14) -> MarkIPHeader() -> " + ipc_name + ";" << std::endl;
		i++;
	}

	// The generated Click configuration will be written to a file
	if ( to_file ) {
		// Open the output file to host our synthesized chain
		out_file = new std::ofstream(this->soft_configuration_filename);

		// Save old cout buffer and redirect cout to the file above.
		def_cout = std::cout.rdbuf(out_file->rdbuf());
	}

	// Write the configuration
	std::cout << config_stream.str();

	// Reset to standard output again
	if ( to_file ) {
		std::cout.rdbuf(def_cout);
		out_file->close();
		delete out_file;
	}

	def_chatter(this->log,	"\tSuccessfully generated the NF chain synthesis to: \n" << 
							"\t\t\t\t\t\t\t\t|--> " << this->soft_configuration_filename);

	return DONE;
}

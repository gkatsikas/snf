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
	//this->synthesizer->print_hyper_nf_ifaces();

	// Step 1: Write some static information about the interfaces'
	// addressing of the Hyper-NF configuration.
	this->generate_static_configuration(config_stream);

	// A map between a NIC and the IPClassifier to handle its packets.
	std::map < std::string, std::string > nic_to_ip_classifier;

	// Step 2: Construct the path of Click elements that will lead each 
	// modified (i.e., rewritten by Click IPRewriter already) traffic 
	// class out of Click. This path of elements follows IPRewriter.
	if ( ! this->generate_write_and_output_part_of_synthesis(config_stream) ) {
		return CODE_GENERATION_PROBLEM;
	}

	// Step 3: Construct the IPClassifier(s) and the path of Click elements
	// that lead to all its/their traffic classes.
	if ( ! this->generate_read_part_of_synthesis(
			config_stream,
			nic_to_ip_classifier)) {
		return CODE_GENERATION_PROBLEM;
	}

	// Step 4: Construct the input Click elements that capture incoming traffic 
	// to be sent to the Classifiers.
	if ( ! this->generate_input_part_of_synthesis(
			config_stream,
			nic_to_ip_classifier) ) {
		return CODE_GENERATION_PROBLEM;
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

void
SoftGenerator::generate_static_configuration(std::stringstream &config_stream) {
	for (unsigned short i = 0 ; i < this->synthesizer->get_hyper_nf_ifaces_no() ; i++) {
		config_stream << "AddressInfo(dev" << i << " $macAddr" << i << " $ipAddr"<< i << ");" << std::endl; 
	}
	config_stream << std::endl;
}

/*
 * Generate the input part of a Hyper-NF chain.
 */
bool
SoftGenerator::generate_input_part_of_synthesis(
		std::stringstream                     &config_stream,
		std::map < std::string, std::string > &nic_to_ip_classifier) {

	config_stream << "///////////////////////////////////////////////////////////////" << std::endl;
	config_stream << "// The input-part of the synthesized Hyper-NF code"              << std::endl;
	config_stream << "///////////////////////////////////////////////////////////////" << std::endl;

	for (auto &it : nic_to_ip_classifier) {

		std::string nic      = it.first;
		std::string ipc_name = it.second;

		std::string decap;
		decap = (this->proc_layer == L3)? \
						"Strip(14) -> MarkIPHeader()" : 
						"MarkIPHeader(OFFSET 14)";

		#ifdef HAVE_DPDK
		config_stream << 	"FromDPDKDevice(" << nic
							<< ", BURST $burst, NDESC $rxNdesc) -> " << decap << " -> " << ipc_name << ";"
							<< std::endl;
		#else
		// "IPPrint(LENGTH true, TTL true) -> "
		config_stream << 	"FromDevice(" << nic
							<< ", SNAPLEN $mtuSize, PROMISC true, METHOD $ioMethod, SNIFFER false) -> " 
							<< decap << " -> " << ipc_name << ";" << std::endl;
		#endif
	}

	return DONE;
}

/*
 * Generate the read part of a Hyper-NF chain.
 */
bool
SoftGenerator::generate_read_part_of_synthesis(
		std::stringstream                     &config_stream,
		std::map < std::string, std::string > &nic_to_ip_classifier) {

	config_stream << "///////////////////////////////////////////////////////////////" << std::endl;
	config_stream << "// The read-part of the synthesized Hyper-NF code"               << std::endl;
	config_stream << "///////////////////////////////////////////////////////////////" << std::endl;
	config_stream << std::endl;

	unsigned short i = 0;

	// Construct the IPClassifier(s) and the path of Click elements
	// that lead to all its/their traffic classes.
	for ( auto &it : this->synthesizer->get_tc_per_input_iface() ) {
		std::string ipc_name = "ipc"+std::to_string(i);
		config_stream << ipc_name + " :: IPClassifier(" << std::endl;
		std::vector<std::string> chains;
		for (auto &tc: it.second) {
			config_stream << "\t" << tc.second.m_pattern << "," << std::endl;
			chains.push_back( tc.second.get_path_to_rewriter_after_classifier() );
		}
		config_stream << ");" << std::endl;

		for (size_t j = 0; j<chains.size(); j++) {
			config_stream << ipc_name + "[" << j << "] -> " << chains[j] << std::endl;
		}
		config_stream << std::endl;

		std::string key;
		#ifdef HAVE_DPDK
			key = std::to_string(i);
		#else
			key = it.first;
		#endif

		nic_to_ip_classifier[key] = ipc_name;

		i++;
	}

	return DONE;
}

/*
 * Generate the write and output parts of a Hyper-NF chain.
 */
bool
SoftGenerator::generate_write_and_output_part_of_synthesis(std::stringstream &config_stream) {

	config_stream << "///////////////////////////////////////////////////////////////" << std::endl;
	config_stream << "// The write and output parts of the synthesized Hyper-NF code"  << std::endl;
	config_stream << "///////////////////////////////////////////////////////////////" << std::endl;
	config_stream << std::endl;

	// Costruct the path of Click elements that will lead this modified
	// (i.e., rewritten by Click IPRewriter already) traffic class out 
	// of Click. This set of elements follows IPRewriter.
	for ( auto &it : this->synthesizer->get_stateful_rewriter_per_output_iface() ) {

		std::string out_nf_and_iface = it.first;

		// Extract the NF name and its' interface
		std::vector<std::string> token = split(out_nf_and_iface, "-");
		std::string nf    = token[0];
		std::string iface = token[1];

		// The statefule Rewriter of this path
		auto rewriter = it.second;

		// If we meet the interface of the first NF, it means that we go backwards.
		// Processing layer arguments determines whether we strip Ethernet headers or not.
		// The MAC addresses are set accordingly.
		#ifdef HAVE_DPDK
		unsigned short dpdk_iface;
		#endif
		std::string encap;
		if ( nf == "NF_1" ) {
			#ifdef HAVE_DPDK
			dpdk_iface = 0;
			#endif

			encap = (this->proc_layer == L3)? \
						"EtherEncap(0x0800, $macAddr0, $gwMACAddr0)" : 
						"StoreEtherAddress($gwMACAddr0, dst)";
		}
		// If we meet the interface of the last NF, it means that we go forward
		else {
			#ifdef HAVE_DPDK
			dpdk_iface = 1;
			#endif

			encap = (this->proc_layer == L3)? \
						"EtherEncap(0x0800, $macAddr1, $gwMACAddr1)" : 
						"StoreEtherAddress($gwMACAddr1, dst)";
		}

		// If --enable-dpdk=yes, a FromDPDKDevice is used instead of regualar FromDevice
		std::string to_device;
		#ifdef HAVE_DPDK
		to_device = "ToDPDKDevice(" + std::to_string(dpdk_iface) + ", BURST $burst, NDESC $txNdesc, IQUEUE $queueSize, TIMEOUT 0);";
		#else
		std::string iface_config = out_nf_and_iface + ", " +
									this->synthesizer->get_stateful_rewriter_per_output_iface_conf(out_nf_and_iface);
		to_device = "Queue($queueSize) -> ToDevice(" + iface_config + ", BURST $burst, METHOD $);";
		#endif

		config_stream 	<< "/** Stateful Path going to: " << out_nf_and_iface << " **/" << std::endl;
		config_stream 	<< rewriter->get_name() << " :: IPRewriter(" << rewriter->compute_conf() 
						<< "DEC_IP_TTL true, CALC_CHECKSUM true);" << std::endl;

		// Only a Hyper-NF interface will take a ToDevice element.
		if ( this->synthesizer->is_hyper_nf_iface(nf, iface) ) {
			config_stream 	<< rewriter->get_name() << "[" << rewriter->get_outbound_port()
							<< "] -> " << encap << " -> " + to_device << std::endl;
		}
		// Be careful, some interfaces that appear here are internal.
		// These need to be discarded.
		else {
			config_stream 	<< rewriter->get_name() << "[" << rewriter->get_outbound_port()
							<< "] -> Discard();" << std::endl;
		}
		
		// Discarded paths
		for(unsigned short j=0; j<rewriter->get_outbound_port(); j++) {
			config_stream 	<< rewriter->get_name() << "[" << j << "] -> Discard();" << std::endl;
		}

		config_stream << std::endl;
	}

	return DONE;
}
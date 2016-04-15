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
	def_chatter(this->log, "\tSoftware-based, single-core Hyper-NF generator constructed");
}

SoftGenerator::~SoftGenerator() {
	def_chatter(this->log, "\tSoftware-based, single-core Hyper-NF generator deleted");
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

	#ifdef DEBUG_MODE
		this->synthesizer->print_hyper_nf_ifaces();
	#endif

	// Step 1: Write some static information about the interfaces'
	// addressing of the Hyper-NF configuration.
	this->generate_static_configuration(config_stream);

	// A map between a NIC and the IPClassifier to handle its packets.
	std::map < std::string, std::string > nic_to_ip_classifier;

	// Step 2: Construct the path of Click elements that will lead each 
	// modified (i.e., rewritten by Click IPRewriter already) traffic 
	// class out of Click. This path of elements follows IPRewriter.
	if ( ! this->generate_write_and_output_part_of_synthesis(config_stream) ) {
		return TO_BOOL(CODE_GENERATION_PROBLEM);
	}

	this->synthesizer->print_hyper_nf_ifaces_to_nics();

	// Step 3: Construct the IPClassifier(s) and the path of Click elements
	// that lead to all its/their traffic classes.
	if ( ! this->generate_read_part_of_synthesis(
			config_stream,
			nic_to_ip_classifier)) {
		return TO_BOOL(CODE_GENERATION_PROBLEM);
	}

	// Step 4: Construct the input Click elements that capture incoming traffic 
	// to be sent to the Classifiers.
	if ( ! this->generate_input_part_of_synthesis(
			config_stream,
			nic_to_ip_classifier) ) {
		return TO_BOOL(CODE_GENERATION_PROBLEM);
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
							"\t\t\t\t\t\t\t|--> " << this->soft_configuration_filename);

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

	std::string decap = (this->proc_layer == L3)? \
						"Strip(14) -> MarkIPHeader()" : 
						"MarkIPHeader(OFFSET 14)";

	std::vector< std::string > driven_nics;

	for (auto &it : nic_to_ip_classifier) {

		std::string nic      = it.first;
		std::string ipc_name = it.second;

		#ifdef HAVE_DPDK
		config_stream << 	"FromDPDKDevice(" << nic
							<< ", BURST $burst, NDESC $rxNdesc) -> " 
							<< decap << " -> " 
							#ifdef  DEBUG_MODE
							<< "IPPrint(NIC" + nic + ", LENGTH true, TTL true) -> "
							#endif
							<< ipc_name << ";"
							<< std::endl;
		#else
		config_stream << 	"FromDevice(" << nic
							<< ", SNAPLEN $mtuSize, PROMISC true, METHOD $ioMethod, SNIFFER false) -> " 
							<< decap << " -> " 
							#ifdef  DEBUG_MODE
							<< "IPPrint(NIC" + nic + ", LENGTH true, TTL true) -> "
							#endif
							<< ipc_name << ";" << std::endl;
		#endif

		driven_nics.push_back(nic);
	}

	if ( driven_nics.size() == this->synthesizer->get_hyper_nf_ifaces_no() ) {
		return DONE;
	}

	// There are interfaces that sit behind proxies
	// These interfaces can access the chain only in-response
	// to already initiated traffic request from inside.
	for ( auto &pair_if : this->synthesizer->get_hyper_nf_ifaces() ) {

		std::string nic = this->synthesizer->get_nic_of_hyper_nf_iface(pair_if);

		if( exists_in_vector(driven_nics, nic) ) continue;

		#ifdef HAVE_DPDK
		config_stream << 	"FromDPDKDevice(" << nic
							<< ", BURST $burst, NDESC $rxNdesc) -> " 
							<< decap << " -> " 
							#ifdef  DEBUG_MODE
							<< "IPPrint(NIC" + nic + ", LENGTH true, TTL true) -> "
							#endif
							<< "Discard();" << std::endl;
		#else
		config_stream << 	"FromDevice(" << nic
							<< ", SNAPLEN $mtuSize, PROMISC true, METHOD $ioMethod, SNIFFER false) -> " 
							<< decap << " -> " 
							#ifdef  DEBUG_MODE
							<< "IPPrint(NIC" + nic + ", LENGTH true, TTL true) -> "
							#endif
							<< "Discard();" << std::endl;
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

	unsigned short ipc_no = 0;

	// Construct the IPClassifier(s) and the path of Click elements
	// that lead to all its/their traffic classes.
	for ( auto &it : this->synthesizer->get_tc_per_input_iface() ) {
		std::string ipc_name = "ipc" + std::to_string(ipc_no);
		config_stream << ipc_name + " :: IPClassifier(" << std::endl;
		std::vector<std::string> chains;
		for (auto &tc: it.second) {
			config_stream << "\t" << tc.second.m_pattern << "," << std::endl;
			chains.push_back( tc.second.get_path_to_rewriter_after_classifier() );
		}
		config_stream << ");" << std::endl;

		for (size_t j = 0; j<chains.size(); j++) {
			config_stream << ipc_name + "[" << std::right << std::setw(2) << j << "] -> " << chains[j] << ";" << std::endl;
		}
		config_stream << std::endl;

		std::string key;
		#ifdef HAVE_DPDK
			key = std::to_string(ipc_no);
		#else
			key = it.first;
		#endif

		nic_to_ip_classifier[key] = ipc_name;

		ipc_no++;
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

	int cur_hyper_nf_iface = -1;

	// Costruct the path of Click elements that will lead this modified
	// (i.e., rewritten by Click IPRewriter already) traffic class out 
	// of Click. This set of elements follows IPRewriter.
	for ( auto &it : this->synthesizer->get_stateful_rewriter_per_output_iface() ) {

		std::string out_nf_and_iface = it.first;

		// Extract the NF name and its' interface
		std::vector<std::string> token = split(out_nf_and_iface, "-");
		std::string nf    = token[0];
		std::string iface = token[1];

		// Hyper-NF's configuration to be filled below
		std::string hyper_nf_iface = out_nf_and_iface;    // Initialized here, might change below
		std::string hyper_nf_encap_conf;
		std::string hyper_nf_to_device;

		// The stateful Rewriter of this path
		auto rewriter = it.second;

		// Get the DAG's vertex that corresponds to this NF
		ChainVertex *this_nf = static_cast<ChainVertex*> (
			this->synthesizer->get_chain_parser()->get_chain_graph()->get_chain()->get_vertex_by_name(nf)
		);

		// This interface is the very first one
		if ( (nf == "NF_1") && this_nf->has_entry_interface(iface) ) {
			#ifdef HAVE_DPDK
				hyper_nf_iface = std::to_string(0);
			#endif

			hyper_nf_encap_conf = (this->proc_layer == L3)? \
						"EtherEncap(0x0800, $macAddr0, $gwMACAddr0)" : 
						"StoreEtherAddress($gwMACAddr0, dst)";
		}
		else {
			#ifdef HAVE_DPDK
				if ( cur_hyper_nf_iface < 0 ) {
					cur_hyper_nf_iface = 1;
				}
				hyper_nf_iface = std::to_string(cur_hyper_nf_iface++);
			#endif

			hyper_nf_encap_conf = (this->proc_layer == L3)? \
						"EtherEncap(0x0800, $macAddr1, $gwMACAddr1)" : 
						"StoreEtherAddress($gwMACAddr1, dst)";
		}

		// If --enable-dpdk=yes, a FromDPDKDevice is used instead of regular FromDevice
		#ifdef HAVE_DPDK
			hyper_nf_to_device = "ToDPDKDevice(" + hyper_nf_iface + ", BURST $burst, NDESC $txNdesc, IQUEUE $queueSize, TIMEOUT -1);";
		#else
			std::string iface_config = 	hyper_nf_iface + ", " + 
										this->synthesizer->get_stateful_rewriter_per_output_iface_conf(out_nf_and_iface);
			hyper_nf_to_device = "Queue($queueSize) -> ToDevice(" + iface_config + ", BURST $burst, METHOD $ioMethod);";
		#endif

		config_stream 	<< "/** Stateful Path going to: " << out_nf_and_iface << " **/" << std::endl;
		config_stream 	<< rewriter->get_name() << " :: IPRewriter(" << rewriter->compute_conf() 
						<< "DEC_IP_TTL true, CALC_CHECKSUM true);" << std::endl;

		// Only a Hyper-NF interface will take a ToDevice element.
		if ( this->synthesizer->is_hyper_nf_iface(nf, iface) ) {
			this->synthesizer->add_nic_of_hyper_nf_iface( std::make_pair(nf, iface), hyper_nf_iface );
			config_stream 	<< rewriter->get_name() << "[" << rewriter->get_outbound_port()
							<< "] -> " << hyper_nf_encap_conf << " -> " + hyper_nf_to_device << std::endl;
		}
		// Be careful, some interfaces that appear here are internal. These need to be discarded.
		else {
			config_stream 	<< rewriter->get_name() << "[" << rewriter->get_outbound_port()
							<< "] -> IPPrint(Discarded-Path) "
							<< "-> Discard();" << std::endl;
		}
		
		// Discarded paths
		for(unsigned short disc=0; disc<rewriter->get_outbound_port(); disc++) {
			config_stream 	<< rewriter->get_name() << "[" << disc 
							<< "] -> IPPrint(Discarded-Path) "
							<< "-> Discard();" << std::endl;
		}

		config_stream << std::endl;
	}

	return DONE;
}
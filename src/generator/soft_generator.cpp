// -*- c-basic-offset: 4 -*-
/* soft_generator.cpp
 *
 * Export a runnable, software-based (Click) SNF configuration.
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

SoftGenerator::SoftGenerator(Synthesizer *synth) : Generator(synth)
{
	def_chatter(this->log, "\tSoftware-based, single-core SNF generator constructed");
}

SoftGenerator::~SoftGenerator()
{
	def_chatter(this->log, "\tSoftware-based, single-core SNF generator deleted");
}

/*
 * Method that abstracts the input-dependent code generation process.
 */
bool
SoftGenerator::generate_equivalent_configuration(const bool to_file)
{
	return this->generate_all_in_soft_configuration(to_file);
}

/*
 * Generate a new Click configuration that implements the chain in one Click module.
 * The configuration must achieve equivalent functionality with the initial one.
 */
bool
SoftGenerator::generate_all_in_soft_configuration(const bool &to_file)
{
	std::ofstream  *out_file = NULL;
	std::streambuf *def_cout = NULL;
	std::stringstream config_stream;

	#ifdef DEBUG_MODE
		this->synthesizer->print_snf_ifaces();
	#endif

	// Step 1: Write some static information about the interfaces'
	// addressing of the SNF configuration.
	this->generate_static_configuration(config_stream);

	// A map between a NIC and the IPClassifier to handle its packets.
	std::map < std::string, std::string > nic_to_ip_classifier;

	// Step 2: Construct the path of Click elements that will lead each
	// modified (i.e., rewritten by Click IPSynthesizer already) traffic
	// class out of Click. This path of elements follows IPSynthesizer.
	if (! this->generate_write_and_output_part_of_synthesis(config_stream))
		return TO_BOOL(CODE_GENERATION_PROBLEM);

	def_chatter(this->log, "\tGenerate Write & Output Parts...");

	#ifdef DEBUG_MODE
		this->synthesizer->print_snf_ifaces_to_nics();
	#endif

	// Step 3: Construct the IPClassifier(s) and the path of Click elements
	// that lead to all its/their traffic classes.
	if (! this->generate_read_part_of_synthesis(
			config_stream,
			nic_to_ip_classifier)) {
		return TO_BOOL(CODE_GENERATION_PROBLEM);
	}

	def_chatter(this->log, "\tGenerate Read Part...");

	// Step 4: Construct the input Click elements that capture incoming traffic
	// to be sent to the Classifiers.
	if (! this->generate_input_part_of_synthesis(
			config_stream,
			nic_to_ip_classifier)) {
		return TO_BOOL(CODE_GENERATION_PROBLEM);
	}

	def_chatter(this->log, "\tGenerate Input Part...");

	// The generated Click configuration will be written to a file
	if (to_file) {
		// Open the output file to host our synthesized chain
		out_file = new std::ofstream(this->soft_configuration_filename);

		// Save old cout buffer and redirect cout to the file above.
		def_cout = std::cout.rdbuf(out_file->rdbuf());
	}

	// Write the configuration
	std::cout << config_stream.str();

	// Reset to standard output again
	if (to_file) {
		std::cout.rdbuf(def_cout);
		out_file->close();
		delete out_file;
	}

	def_chatter(this->log,	"\tSuccessfully generated the service chain synthesis to: \n" <<
				"\t\t\t\t\t\t\t|--> " << this->soft_configuration_filename);

	return DONE;
}

void
SoftGenerator::generate_static_configuration(std::stringstream &config_stream)
{
	for (unsigned short i = 0 ; i < this->synthesizer->get_snf_ifaces_no() ; i++) {
		config_stream << "AddressInfo(dev" << i << " $macAddr" << i << " $ipAddr"<< i << ");" << std::endl;
	}
	config_stream << std::endl;

	// This is a class that handles packet I/O.
	std::string io_click_class = this->get_io_classes_by_type();

	config_stream << "///////////////////////////////////////////////////////////////" << std::endl;
	config_stream << "// Classes for handling and scheduling packet I/O"               << std::endl;
	config_stream << "///////////////////////////////////////////////////////////////" << std::endl;
	config_stream << io_click_class << std::endl;
}

/*
 * Generate the input part of a SNF chain.
 */
bool
SoftGenerator::generate_input_part_of_synthesis(
		std::stringstream                     &config_stream,
		std::map < std::string, std::string > &nic_to_ip_classifier)
{
	config_stream << "///////////////////////////////////////////////////////////////" << std::endl;
	config_stream << "// The input-part of the synthesized SNF code"                   << std::endl;
	config_stream << "///////////////////////////////////////////////////////////////" << std::endl;

	std::string decap = (this->proc_layer == L3)? \
				"Strip(14) -> MarkIPHeader()" :
				"MarkIPHeader(OFFSET 14)";

	std::vector< std::string > driven_nics;

	for (auto &it : nic_to_ip_classifier) {

		std::string nic      = it.first;
		std::string ipc_name = it.second;

	#ifdef HAVE_DPDK
		config_stream 	<< InputClassName << "(" << nic
				<< ", $burst, $rxNdesc, $ioCore"
				<< nic << ") -> ";
	#else
		config_stream 	<< InputClassName << "($iface" << nic
				<< ", $burst, $mtuSize, $ioCore"
				<< nic << ") -> ";
	#endif
		config_stream 	<< decap << " -> "
			#ifdef  DEBUG_MODE
				<< "IPPrint(NIC" + nic + ", LENGTH true, TTL true) -> "
			#endif
				<< ipc_name << ";" << std::endl;

		driven_nics.push_back(nic);
	}

	if (driven_nics.size() == this->synthesizer->get_snf_ifaces_no()) {
		return DONE;
	}

	// There are interfaces that sit behind proxies
	// These interfaces can access the chain only in-response
	// to already initiated traffic request from inside.
	// We currently disable them but they should technically fall
	// into the same Classifier and stateful rewriter as the other
	// direction.
	for (auto &pair_if : this->synthesizer->get_snf_ifaces()) {
		std::string nic = this->synthesizer->get_nic_of_snf_iface(pair_if);

		if (exists_in_vector(driven_nics, nic)) {
			continue;
		}

		#ifdef HAVE_DPDK
			config_stream 	<< InputClassName << "(" << nic
					<< ", $burst, $rxNdesc, $ioCore"
					<< nic << ") -> ";
		#else
			config_stream 	<< InputClassName << "($iface" << nic
					<< ", $burst, $mtuSize, $ioCore"
					<< nic << ") -> ";
		#endif
		config_stream	<< decap << " -> "
			#ifdef  DEBUG_MODE
				<< "IPPrint(NIC" + nic + ", LENGTH true, TTL true) -> "
			#endif
				<< "Discard();" << std::endl;
	}

	return DONE;
}

/*
 * Generate the read part of a SNF chain.
 */
bool
SoftGenerator::generate_read_part_of_synthesis(
		std::stringstream                     &config_stream,
		std::map < std::string, std::string > &nic_to_ip_classifier)
{
	config_stream << "///////////////////////////////////////////////////////////////" << std::endl;
	config_stream << "// The read-part of the synthesized SNF code"                    << std::endl;
	config_stream << "///////////////////////////////////////////////////////////////" << std::endl;

	unsigned short ipc_no = 0;

	// Construct the IPClassifier(s) and the path of Click elements
	// that lead to all its/their traffic classes.
	for (auto &it : this->synthesizer->get_tc_per_input_iface()) {
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
		key = std::to_string(ipc_no);
	/*#ifdef HAVE_DPDK
		key = std::to_string(ipc_no);
	#else
		key = it.first;
	#endif*/

		nic_to_ip_classifier[key] = ipc_name;

		ipc_no++;
	}

	return DONE;
}

/*
 * Generate the write and output parts of a SNF chain.
 */
bool
SoftGenerator::generate_write_and_output_part_of_synthesis(std::stringstream &config_stream)
{
	config_stream << "///////////////////////////////////////////////////////////////" << std::endl;
	config_stream << "// The write and output parts of the synthesized SNF code"       << std::endl;
	config_stream << "///////////////////////////////////////////////////////////////" << std::endl;

	int cur_snf_iface = -1;
	std::string ip_modifier = "IPSynthesizer";

	// Costruct the path of Click elements that will lead this modified
	// (i.e., rewritten by Click IPSynthesizer already) traffic class out
	// of Click. This set of elements follows IPSynthesizer.
	for (auto &it : this->synthesizer->get_stateful_rewriter_per_output_iface()) {

		std::string out_nf_and_iface = it.first;

		// Extract the NF name and its' interface
		std::vector<std::string> token = split(out_nf_and_iface, "-");
		std::string nf    = token[0];
		std::string iface = token[1];

		// SNF's configuration to be filled below
		std::string snf_iface;
		std::string snf_encap_conf;
		std::string snf_synth_conf =
			this->synthesizer->get_synthesized_config_per_output_iface(out_nf_and_iface);
		std::stringstream snf_to_device;

		// The stateful Rewriter of this path
		auto rewriter = it.second;

		// Check what's going on at this output interface
		#ifdef  DEBUG_MODE
			snf_encap_conf = "IPPrint(LENGTH true, TTL true) -> ";
		#endif

		// This interface is the very first one
		unsigned short chain_len =
			this->synthesizer->get_chain_parser()->get_chain_graph()->get_chain_length();
		std::string last_nf = "NF_" + std::to_string(chain_len);
		// This interface is the very first one
		if (nf != last_nf) {
			if ( cur_snf_iface <= 0 ) {
				cur_snf_iface = 0;
			}
		}

		snf_iface = std::to_string(cur_snf_iface);
		#ifdef HAVE_DPDK
			snf_to_device << OutputClassName << "(" << snf_iface;
		#else
			snf_to_device << OutputClassName << "($iface" << snf_iface;
		#endif

		snf_encap_conf += (this->proc_layer == L3)? \
			"EtherEncap(0x0800, $macAddr"   + std::to_string(cur_snf_iface) +
			", $gwMACAddr" + std::to_string(cur_snf_iface) + ")" :
			"StoreEtherAddress($gwMACAddr"  + std::to_string(cur_snf_iface) +
			", dst)";

		// If --enable-dpdk=yes, a FromDPDKDevice is used instead of regular FromDevice
		#ifdef HAVE_DPDK
			snf_to_device 	<< ", $queueSize, $burst, $txNdesc, $ioCore"
					<< cur_snf_iface << ");";
		#else
			/*std::string iface_config = 	"," +
				this->synthesizer->get_stateful_rewriter_per_output_iface_conf(
				out_nf_and_iface
			);
			snf_to_device 	<< iface_config */
			snf_to_device 	<< ", $queueSize, $burst, $ioMethod, $ioCore"
								<< cur_snf_iface << ");";
		#endif

		config_stream 	<< "/** Stateful Path going to: " << out_nf_and_iface << " **/" << std::endl;
		config_stream 	<< rewriter->get_name() << " :: " << ip_modifier << "("
				<< rewriter->compute_conf();

		config_stream 	<< snf_synth_conf
				<< ", CAPACITY 100000, MTU $mtuSize, IPADDR $ipAddr"
				<< cur_snf_iface << ");" << std::endl;

		// Only a SNF interface will take a ToDevice element.
		if (this->synthesizer->is_snf_iface(nf, iface)) {
			this->synthesizer->add_nic_of_snf_iface( std::make_pair(nf, iface), snf_iface );
			config_stream 	<< rewriter->get_name() << "[" << rewriter->get_outbound_port()
					<< "] -> " << snf_encap_conf << " -> " << snf_to_device.str()
					<< std::endl;

			debug_chatter(this->log, "\tSNF " << nf << " with iface: " << iface);
			cur_snf_iface++;
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

std::string
SoftGenerator::get_io_classes_by_type(void) const
{
	#ifdef HAVE_DPDK
		return ""
"elementclass "+ InputClassName +" {\n"
"	// Module's arguments\n"
"	$iface, $burst, $rxNdesc, $ioCore |\n\n"
"	// Read from DPDK interface\n"
"	nicIn :: FromDPDKDevice($iface, BURST $burst, NDESC $rxNdesc);\n\n"
"	// Pin the input element of this device to a specific core\n"
"	StaticThreadSched(nicIn $ioCore);\n\n"
"	// Packet is received by the attached interface (I)\n"
"	nicIn -> output;\n"
"}\n\n"
"elementclass "+ OutputClassName +" {\n"
"	// Module's arguments\n"
"	$iface, $queueSize, $burst, $txNdesc, $ioCore |\n\n"
"	// Write to the interface\n"
"	nicOut :: ToDPDKDevice($iface, BURST $burst, NDESC $txNdesc, IQUEUE $queueSize, TIMEOUT -1);\n\n"
"	// Pin the output element of this device to a specific core\n"
"	StaticThreadSched(nicOut $ioCore);\n\n"
"	// Packet is received by the attached pipeline (O); sent it out\n"
"	input -> nicOut;\n"
"}\n";
	// Standard Click mode
	#else
		return ""
"elementclass "+ InputClassName +" {\n"
"	// Module's arguments\n"
"	$iface, $burst, $mtuSize, $ioCore |\n\n"
"	// Read from DPDK interface\n"
"	nicIn :: FromDevice($iface, BURST $burst, SNAPLEN $mtuSize, PROMISC true, METHOD $ioMethod, SNIFFER false);\n\n"
"	// Pin the input element of this device to a specific core\n"
"	StaticThreadSched(nicIn $ioCore);\n\n"
"	// Packet is received by the attached interface (I)\n"
"	nicIn -> output;\n"
"}\n\n"
"elementclass "+ OutputClassName +" {\n"
"	// Module's arguments\n"
"	$iface, $queueSize, $burst, $ioMethod, $ioCore |\n\n"
"	// Write to the interface\n"
"	nicOut :: Queue($queueSize) -> ToDevice($iface, BURST $burst, METHOD $ioMethod);\n\n"
"	// Pin the output element of this device to a specific core\n"
"	StaticThreadSched(nicOut $ioCore);\n\n"
"	// Packet is received by the attached pipeline (O); sent it out\n"
"	input -> nicOut;\n"
"}\n";
	#endif
}

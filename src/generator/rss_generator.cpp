// -*- c-basic-offset: 4 -*-
/* rss_generator.cpp
 * 
 * Export a runnable, hardware-assisted Hyper-NF configuration that 
 * exploits the hardware queues of modern NICs together with the 
 * powerful processing capacities of multi-core architectures, to 
 * parallelize NFV chain deployments.
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

#include "rss_generator.hpp"

RSSGenerator::RSSGenerator(Synthesizer *synth) : Generator(synth) {
	this->rss_queues   = this->synthesizer->get_chain_parser()->get_chain_graph()->get_properties()->get_nic_hw_queues_no();
	this->rss_cores    = this->synthesizer->get_chain_parser()->get_chain_graph()->get_properties()->get_cpu_cores_no();
	this->socket_cores = this->synthesizer->get_chain_parser()->get_chain_graph()->get_properties()->get_cpu_sockets_no();

	def_chatter(this->log, "\tRSS-based generator constructed");
}

RSSGenerator::~RSSGenerator() {
	def_chatter(this->log, "\tRSS-based generator deleted");
}

/*
 * Method that abstracts the input-dependent code generation process.
 */
bool
RSSGenerator::generate_equivalent_configuration(const bool to_file) {
	return this->generate_rss_cloned_pipelines(to_file);
}

/*
 * Hardware-assisted, RSS-based Hyper-NF:
 *    RSS-Hashing in the NIC splits traffic at will (based on fields that we specify).
 *    Then, a Click-DPDK configuration is reading packets from different queues, schedules threads
 *    from multiple cores on these queues, and clones the chain across all of them.
 */
bool
RSSGenerator::generate_rss_cloned_pipelines(const bool &to_file) {

	std::ofstream  *out_file = NULL;
	std::streambuf *def_cout = NULL;
	std::stringstream config_stream;

	def_chatter(this->log, "\tHardware-assisted, multi-core Hyper-NF Generator...");

	this->synthesizer->print_hyper_nf_ifaces();

	// Step 1: Write some static information about the interfaces'
	// addressing of the Hyper-NF configuration.
	for (unsigned short i = 0 ; i < this->synthesizer->get_hyper_nf_ifaces_no() ; i++) {
		config_stream << "AddressInfo(dev" << i << " $macAddr" << i << " $ipAddr"<< i << ");" << std::endl; 
	}
	config_stream << std::endl;

	// Step 2: Costruct the path of Click elements that will lead each modified
	// (i.e., rewritten by Click IPRewriter already) traffic class out of Click.
	// This path of elements follows IPRewriter.
	for ( auto &it : this->synthesizer->get_nat_per_output_iface() ) {

		std::string out_nf_and_iface = it.first;

		// Extract the NF name and its' interface
		std::vector<std::string> token = split(out_nf_and_iface, "-");
		std::string nf    = token[0];
		std::string iface = token[1];

		// The NAT of this path
		auto nat = it.second;

		// If we meet the interface of the first NF, it means that we go backward
		// The MAC addresses are set accordingly
		unsigned short dpdk_iface;
		std::string encap_addresses;
		if ( nf == "NF_1" ) {
			dpdk_iface = 0;
			encap_addresses = "$macAddr0, $gwMACAddr0";
		}
		// If we meet the interface of the last NF, it means that we go forward
		else {
			dpdk_iface = 1;
			encap_addresses = "$macAddr1, $gwMACAddr1";
		}

		config_stream 	<< "/** NAT going to: " << out_nf_and_iface << " **/" << std::endl;
		config_stream 	<< nat->get_name() << " :: IPRewriter(" << nat->compute_conf() 
						<< "DEC_IP_TTL true, CALC_CHECKSUM true);" << std::endl;

		// Be careful, some interfaces that appear here are internal.
		// These need to be discarded.
		if ( this->synthesizer->is_hyper_nf_iface(nf, iface) ) {
			config_stream 	<< nat->get_name() << "[" << nat->get_outbound_port()
							<< "] -> EtherEncap(0x0800, " + encap_addresses + ") -> ToDPDKDevice ("
							<< dpdk_iface << ", BURST $burst, NDESC $txNdesc, IQUEUE $queueSize, TIMEOUT 0);" << std::endl;
			//config_stream << nat->get_name() << "[" << nat->get_outbound_port()
			//				<< "] -> StoreEtherAddress($gwMACAddr1, dst) -> ToDPDKDevice ("
			//				<< dpdk_iface << ", BURST $burst, NDESC $txNdesc, IQUEUE $queueSize, TIMEOUT 0);" << std::endl;
		}
		else {
			config_stream 	<< nat->get_name() << "[" << nat->get_outbound_port()
							<< "] -> Discard();" << std::endl;
		}

		// Discarded paths
		for (unsigned short i=0; i<nat->get_outbound_port(); i++) {
			config_stream << nat->get_name() << "[" << i << "] -> Discard();" << std::endl;
		}

		config_stream << std::endl;
	}

	unsigned short i = 0;

	// A map between a nic queue's descriptor and a CPU core to handle its packets.
	std::map <std::string, unsigned short> nic_desc_to_core;
	std::map < std::string, std::vector<std::string> > nic_desc_to_ip_class;
	std::string code_buffer("");

	// Step 3: Construct the IPClassifier(s) and the path of Click elements
	// that lead to all its/their traffic classes.
	// Replicate this set of elements across all hardware queues and assign queues to cores.
	for ( auto &it : this->synthesizer->get_tc_per_input_iface() ) {
		std::string ipc_name = "ipc"+std::to_string(i);
		config_stream << ipc_name + " :: IPClassifier (" << std::endl;
		std::vector<std::string> chains;
		for (auto &tc: it.second) {
			config_stream << "\t" << tc.second.m_pattern << "," << std::endl;
			chains.push_back(tc.second.get_chain());
		}

		config_stream << std::endl;

		for (size_t i = 0; i<chains.size(); i++) {
			config_stream << ipc_name + "[" << i << "] -> " << chains[i] << std::endl;
		}

		config_stream << std::endl;

		// Multiple FromDPDKDevice, one per hardware queue
		if ( !this->allocate_queues_to_cores(
				nic_desc_to_core, nic_desc_to_ip_class,
				code_buffer, i, ipc_name) ) {
			return ERROR;
		}
		i++;
	}

	// Print the current code
	config_stream << code_buffer;
	
	code_buffer = "";
	if ( !this->schedule_core_threads_on_queues(nic_desc_to_core, code_buffer) ) {
		return ERROR;
	}

	// Print again
	config_stream << code_buffer;

	// Form the paths between NIC descriptors and IPClassifiers
	for (auto& it : nic_desc_to_ip_class) {
		// Implode the vector into a large string
		for (auto fd : it.second) {
			//config_stream << fd << " -> MarkIPHeader(OFFSET 14) -> " << it.first << ";" << std::endl;
			//config_stream << fd << " -> Strip(14) -> MarkIPHeader() -> IPPrint(" + fd + ") -> " << it.first << ";" << std::endl;
			config_stream << fd << " -> Strip(14) -> MarkIPHeader() -> PushNull() -> " << it.first << ";" << std::endl;
			//config_stream << fd << " -> Strip(14) -> MarkIPHeader() -> " << it.first << ";" << std::endl;
		}
		config_stream << std::endl;	
	}

	// 
	//if ( !this->generate_rss_configuration(hard_out_file, nic_classifiers_no, def_cout) ) {
	//	return FAILURE;
	//}

	// The generated Click configuration will be written to a file
	if ( to_file ) {
		// Output file to host our synthesized Click-DPDK chain
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
		out_file = NULL;
	}

	def_chatter(this->log,	"\tSuccessfully generated the NF chain synthesis to: \n" << 
							"\t\t\t\t\t\t\t\t|--> " << this->soft_configuration_filename);

	return DONE;
}

/*
 * When hardware classification is on, we need to schedule multiple
 * threads (one per core) to the various NIC queues and attach one 
 * Click-DPDK Input element (FromDPDKDevice) to each queue.
 * The first argument (map of nic descriptors to cores) is passed by reference,
 * updated by the method, and returns back to the caller.
 * After all NICs are iterated, this map will be used by Click's scheduler.
 */
bool
RSSGenerator::allocate_queues_to_cores(
		std::map <std::string, unsigned short>            &nic_desc_to_core,
		std::map < std::string, std::vector<std::string>> &nic_desc_to_ip_class,
		std::string          &code_buffer,
		const unsigned short &nic_no,
		const std::string    &ipcl_name) {

	unsigned short i = 0, core_no = 0;
	
	// NIC 0 -> Socket 0, NIC 1 -> Socket 1, NIC 2 -> Socket 0, ...
	bool even_cores = ( nic_no%2 == 0 )? true:false;

	// We start from the appropriate core (and socket)
	core_no = (even_cores) ? 0:1;
	// FIXME
	core_no = 0;

	// Each FromDPDKDevice has a name that indicates the interface and queue number.
	std::string input_nic_desc = "fd_nic_" + std::to_string(nic_no) +"q_";

	std::vector<std::string> nic_descs;

	// For each queue of this NIC
	for (i=0 ; i<this->rss_queues ; i++) {
		// Define a Click-DPDK input element per queue per NIC
		code_buffer += input_nic_desc + std::to_string(i) + 
					" :: FromDPDKDevice (" + std::to_string(nic_no) + ", QUEUE " + std::to_string(i) + 
					", BURST $burst, NDESC $rxNdesc);\n";

		// Append the vector of descriptors that will be assigned to this IPClassifier
		nic_descs.push_back(input_nic_desc + std::to_string(i));

		// Round-robin of socket's core across all NIC queues.
		nic_desc_to_core[input_nic_desc + std::to_string(i)] = core_no % this->rss_cores;
		core_no += 2;
	}
	code_buffer += "\n";

	nic_desc_to_ip_class[ipcl_name] = nic_descs;

	return DONE;
}

/*
 * Compose the arguments of Click's StaticThreadSched element.
 * These arguments are maps of nic descriptors to CPU cores.
 */
bool
RSSGenerator::schedule_core_threads_on_queues(
		std::map <std::string, unsigned short> &nic_desc_to_core, 
		std::string &code_buffer) {

	unsigned short i = 0;

	code_buffer = "StaticThreadSched(\n";
	for (auto &it : nic_desc_to_core) {
		if ( i == nic_desc_to_core.size()-1 ) {
			code_buffer += "\t" + it.first + " " + std::to_string(it.second) + "\n);";
		}
		else {
			code_buffer += "\t" + it.first + " " + std::to_string(it.second) + ", \n";
		}
		i++;
	}
	code_buffer +=  "\n\n";

	return DONE;
}

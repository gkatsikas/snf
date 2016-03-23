// -*- c-basic-offset: 4 -*-
/* parser_configuration.cpp
 * 
 * Export a runnable Hyper-NF configuration.
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

	this->synthesizer = synth;
	this->hw_classification = this->synthesizer
											->get_chain_parser()
											->get_chain_graph()
											->get_properties()
											->has_hardware_classification();
	this->traffic_classification_format = this->synthesizer
											->get_chain_parser()
											->get_chain_graph()
											->get_properties()
											->get_traffic_classification_format();
	this->basic_configuration_filename = this->synthesizer
											->get_chain_parser()
											->get_chain_graph()
											->get_properties()
											->get_output_filename();
	this->soft_configuration_filename = this->basic_configuration_filename + ".click";
	
	def_chatter(this->log, "\tGenerator constructed");
}

Generator::~Generator() {
	delete this->synthesizer;
	def_chatter(this->log, "\tGenerator deleted");
}

/*
 * Generate a new configuration that depends on the user input.
 * |--> Hardware-assisted, multi-core Hyper-NF
 * If hardware classification is requested, generate two files: (a) an implementation of 
 * the traffic classification in the NIC's language (Intel-RSS), and (b) a Click-DPDK configuration
 * that schedules a multitude of threads (one per core) that handle different pieces of the header space.
 * |--> All-in-Software Hyper-NF
 * If hardware classification is not requested, generate a Click equivalent of the entire chain.
 */
bool
Generator::generate_equivalent_configuration(bool to_file) {

	if ( this->hw_classification ) {
		#ifdef HAVE_DPDK
			TrafficClassFormat tc_format = this->traffic_classification_format;

			switch (tc_format) {
				case RSS_Hashing:
					return this->generate_rss_cloned_pipelines          (to_file);
				case Flow_Director:
					return this->generate_flow_director_split_pipelines (to_file);
				case OpenFlow:
					return this->generate_openflow_split_pipelines      (to_file);
				default:
					MISSING_FEATURE(this->log, "Unimplemented Traffic Class Format: " + tc_to_label(tc_format));
			}
		#else
			error_chatter(this->log, "Hardware classification requires DPDK support!");
			return ERROR;
		#endif
	}
	// Pure software based implementation in Click.
	else {
		return this->generate_all_in_soft_configuration(to_file);
	}

	return DONE;
}

/*
 * Generate a new Click configuration that implements the chain in one Click module.
 * The configuration must achieve equivalent functionality with the initial one.
 */
bool
Generator::generate_all_in_soft_configuration(const bool to_file) {

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
	std::cout << config_stream;

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

/*
 * Hardware-assisted, multi-core Hyper-NF has 3 versions:
 * (A) RSS-Hashing in the NIC splits traffic at will (based on fields that we specify).
 *     Then, a Click-DPDK configuration is reading packets from different queues, schedules threads
 *     from multiple cores on these queues, and clones the chain across all of them.
 * (B) Flow Director commands are generated to split the traffic based on specific field values.
 *     This provides a very limited classification but still can share traffic among cores.
 *     Each Click-DPDK configuration implements a subset of the chain.
 * (C) OpenFlow rules are generated to spit the traffic classes to the TCAM.
 *     OpenVSwitch is used to implement these rules and then assign the traffic classes to 
 *     different Click-DPDK processes. This is a split model again, the pipeline is not cloned.
 * If hardware classification is requested, generate two files: (a) an implementation of 
 * the traffic classification in the NIC's language (Intel-RSS), and (b) a Click-DPDK configuration
 * that schedules a multitude of threads (one per core) that handle different pieces of the header space.
 */
bool
Generator::generate_rss_cloned_pipelines(const bool to_file) {

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
	std::cout << config_stream;

	// Reset to standard output again
	if ( to_file ) {
		std::cout.rdbuf(def_cout);
		out_file->close();
		delete out_file;
		out_file = NULL;
	}

	def_chatter(this->log,	"\tSuccessfully generated the NF chain synthesis to: \n" << 
							"\t\t\t\t\t\t\t|--> " << this->soft_configuration_filename);

	return DONE;
}

bool
Generator::generate_flow_director_split_pipelines(const bool to_file) {

	//std::ofstream  *soft_out_file  = NULL;
	//std::ofstream  **hard_out_file = NULL;
	//std::streambuf *def_cout       = NULL;
	//std::string all_out_files;

	if ( to_file ) {
		// Open the output files to host our synthesized chain
		//soft_out_file = new std::ofstream(this->soft_configuration_filename);

		//all_out_files = "\t\t\t\t\t\t\t\t|--> " + this->soft_configuration_filename + "\n";

		// Output files (one per interface) to host the Flow director commands of each Hyper-NF interface.
		/*hard_out_file = new std::ofstream*[nic_classifiers_no];
		unsigned short i = 0;
		for (auto &it : this->hyper_nf_ifaces) {
			std::string nf = it.first;
			std::string iface = it.second;

			std::pair<std::string, std::string> comb_key = std::make_pair(nf, iface);
			this->hrdw_configuration_per_nic[comb_key] = 
				this->basic_configuration_filename + "_" + nf + "_" + iface + ".flowdir";
			//std::cout << this->hrdw_configuration_per_nic[comb_key] << std::endl;

			hard_out_file[i] = new std::ofstream(this->hrdw_configuration_per_nic[comb_key]);
			all_out_files += "\t\t\t\t\t\t\t\t|--> " + this->hrdw_configuration_per_nic[comb_key] + "\n";
			i++;
		}*/

		// Save old cout buffer and redirect cout to the file above.
		//def_cout = std::cout.rdbuf(soft_out_file->rdbuf());
	}

	// ....

	// Reset to standard output again
	if ( to_file ) {
		//std::cout.rdbuf(def_cout);
		//soft_out_file->close();
		//hard_out_file->close();
		//delete soft_out_file;

		//for (unsigned short i = 0 ; i < this->get_hyper_nf_ifaces_no() ; i++) {
		//	hard_out_file[i]->close();
		//	delete hard_out_file[i];
		//}
		//delete[] hard_out_file;
		//hard_out_file = NULL;
	}

	MISSING_FEATURE(this->log, "Flow Director traffic class generator not implemented");
	return DONE;
}

bool
Generator::generate_openflow_split_pipelines (const bool to_file) {
	if ( to_file ) {
		// Open the output files to host our synthesized chain
		//soft_out_file = new std::ofstream(this->soft_configuration_filename);
		// One per nic
		// this->hrdw_configuration_per_nic
		//hard_out_file[i] = new std::ofstream(this->hrdw_configuration_per_nic + nic.rss);

		// Save old cout buffer and redirect cout to the file above.
		//def_cout = std::cout.rdbuf(soft_out_file->rdbuf());
	}

	// ....

	// Reset to standard output again
	if ( to_file ) {
		//std::cout.rdbuf(def_cout);
		//soft_out_file->close();
		//hard_out_file->close();
		//delete soft_out_file;
		//delete hard_out_file;
	}

	MISSING_FEATURE(this->log, "OpenFlow traffic class generator not implemented");
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
Generator::allocate_queues_to_cores(
		std::map <std::string, unsigned short> &nic_desc_to_core,
		std::map < std::string, std::vector<std::string>> &nic_desc_to_ip_class,
		std::string &code_buffer, const unsigned short &nic_no, const std::string &ipcl_name) {

	unsigned short i = 0, core_no = 0;
	unsigned short rss_queues   = this->synthesizer->get_chain_parser()->get_chain_graph()->get_properties()->get_nic_hw_queues_no();
	unsigned short rss_cores    = this->synthesizer->get_chain_parser()->get_chain_graph()->get_properties()->get_cpu_cores_no();
	//unsigned short socket_cores = rss_cores / this->synthesizer->get_chain_parser()->get_chain_graph()->get_properties()->get_cpu_sockets_no();

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
	for (i=0 ; i<rss_queues ; i++) {
		// Define a Click-DPDK input element per queue per NIC
		code_buffer += input_nic_desc + std::to_string(i) + 
					" :: FromDPDKDevice (" + std::to_string(nic_no) + ", QUEUE " + std::to_string(i) + 
					", BURST $burst, NDESC $rxNdesc);\n";

		// Append the vector of descriptors that will be assigned to this IPClassifier
		nic_descs.push_back(input_nic_desc + std::to_string(i));

		// Round-robin of socket's core across all NIC queues.
		nic_desc_to_core[input_nic_desc + std::to_string(i)] = core_no % rss_cores;
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
Generator::schedule_core_threads_on_queues(std::map <std::string, unsigned short> &nic_desc_to_core, 
											std::string &code_buffer) {

	unsigned short i = 0;

	std::cout << "StaticThreadSched(\n";
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

/*
 * Dump ethtool configuration for the NICs involved in a Hyper-NF.
 */
bool
Generator::generate_rss_configuration(std::ofstream **hw_out_file,
										unsigned short nics_no,
										std::streambuf *def_cout) {

	for (unsigned short i = 0 ; i < nics_no ; i++) {
		// Move cout to the files where we write the hardware configuration
		def_cout = std::cout.rdbuf(hw_out_file[i]->rdbuf());
		//std::cout << "OOOOOOOOOOOOOO" << std::endl;
	}

	(void)def_cout;
	return DONE;
}

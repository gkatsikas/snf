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
	this->numa                   = this->input_properties->has_numa();
	this->rss_queues             = this->input_properties->get_nic_hw_queues_no();
	this->rss_cores              = this->input_properties->get_cpu_cores_no    ();
	this->cpu_sockets_no         = this->input_properties->get_cpu_sockets_no  ();
	this->cores_per_socket       = this->rss_cores / this->cpu_sockets_no;
	this->rss_aggressive_pinning = this->input_properties->get_rss_aggressive_pinning();

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

	// A map between a NIC queue's descriptor and a CPU core to handle its packets.
	// E.g., fd_nic0_q0 --> core 0
	std::map < std::string,    unsigned short >                 nic_desc_to_core;
	// A map between a NIC and the IPClassifier to classify its packets.
	// E.g., 0 --> ipc0
	std::map < unsigned short, std::string >                    nic_to_classifier;
	// A map between an IPClassifier and its' associated list of NIC descriptors (queues).
	// E.g., ipc0 --> (fd_nic0_q0, ... , fd_nic0_q15)
	std::map < std::string,    std::vector<std::string> >       classifier_to_nic_desc;
	// A map between a NIC and its' associated list of IPClassifier replicas (one per queue).
	// E.g., 0 --> (ipc0_q0, ... , ipc0_q15)
	std::map < unsigned short, std::vector<std::string> >       nic_to_classifier_repl;
	// A map between a relpica of an IPClassifier and a CPU core to handle its packets.
	std::map < std::string,    unsigned short >                 classifier_to_core;
	// A map between a replica of an (IPClassifier, outport) and an (IPRewriter, inport).
	// E.g., ipc0_q0[0] --> [0]iprw0
	std::map <  std::pair< std::string, unsigned short>, 
				std::pair< std::string, unsigned short> >       classifier_repl_to_rewriter;
	// // A map between a replica of an (IPClassifier, outport) and a vector of (IPRewriter, inport) replicas.
	// E.g., ipc0_q0[0] --> ([0]iprw0_q0, [1]iprw0_q2, ...)
	std::map < 
		std::string,
		std::vector< std::pair< std::string, unsigned short > >
	>                                                           classifier_repl_to_rewriter_repl;

	// Step 1: Write some static information about the interfaces'
	// addressing of the Hyper-NF configuration.
	this->generate_static_configuration(config_stream);

	// Step 2: Encode the connection map between classifiers and rewriters
	if ( ! this->construct_classifier_to_rewriter_map(
			classifier_repl_to_rewriter) ) {
		return TO_BOOL(CODE_GENERATION_PROBLEM);
	}

	// Step 3: Construct the path of Click elements that will lead each 
	// modified (i.e., rewritten by Click IPRewriter already) traffic 
	// class out of Click. This path of elements follows IPRewriter.
	if ( ! this->replicate_write_and_output_part_of_synthesis(
			config_stream,
			classifier_repl_to_rewriter) ) {
		return TO_BOOL(CODE_GENERATION_PROBLEM);
	}

	// Step 4: Construct the IPClassifier(s) and the path of Click elements
	// that lead to all its/their traffic classes. Replicate this set of 
	// elements across all input elements.
	if ( ! this->replicate_read_part_of_synthesis(
			config_stream,
			nic_to_classifier,
			nic_to_classifier_repl,
			classifier_repl_to_rewriter_repl) ) {
		return TO_BOOL(CODE_GENERATION_PROBLEM);
	}

	// Step 5: Construct the input Click elements that capture incoming traffic to be sent to the Classifiers.
	// Replicate this set of elements across all hardware queues and assign queues to cores.
	if ( ! this->replicate_input_part_of_synthesis(
			config_stream,
			nic_to_classifier,
			nic_desc_to_core,
			nic_to_classifier_repl,
			classifier_to_nic_desc,
			classifier_to_core) ) {
		return TO_BOOL(CODE_GENERATION_PROBLEM);
	}

	// Step 6: Schedule paths between IPClassifiers and IPRewriters
	if ( this->rss_aggressive_pinning ) {
		warn_chatter(this->log,	"\tAggressive pinning of potentially stateful paths...");
		warn_chatter(this->log,	"\tPerformance might be affected due to increased inter-core communication");
		if ( ! this->stateful_path_scheduling(
				classifier_to_core, classifier_repl_to_rewriter_repl, config_stream) )
			return TO_BOOL(CODE_GENERATION_PROBLEM);
	}

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
 * Generate some static information about the interfaces' addresses.
 */
void
RSSGenerator::generate_static_configuration(std::stringstream &config_stream) {
	for (unsigned short i=0 ; i<this->synthesizer->get_hyper_nf_ifaces_no() ; i++) {
		config_stream << "AddressInfo(dev" << i << " $macAddr" << i << " $ipAddr"<< i << ");" << std::endl; 
	}
	config_stream << std::endl;
}

/*
 * Clone the input part of a Hyper-NF chain across multiple hardware queues
 * (associated with different CPU cores) on a NIC.
 */
bool
RSSGenerator::replicate_input_part_of_synthesis(
		std::stringstream                                     &config_stream,
		std::map < unsigned short, std::string >              &nic_to_classifier,
		std::map < std::string,    unsigned short >           &nic_desc_to_core,
		std::map < unsigned short, std::vector<std::string> > &nic_to_classifier_repl,
		std::map < std::string,    std::vector<std::string> > &classifier_to_nic_desc,
		std::map < std::string,    unsigned short >           &classifier_to_core) {

	config_stream << "///////////////////////////////////////////////////////////////" << std::endl;
	config_stream << "// The input-part of the synthesized Hyper-NF code"              << std::endl;
	config_stream << "///////////////////////////////////////////////////////////////" << std::endl;

	// Multiple FromDPDKDevice, one per hardware queue
	info_chatter(this->log, "\tTarget System has " << this->cpu_sockets_no 
							<< " sockets with " << this->cores_per_socket << " CPU cores/socket");
	for (unsigned short i=0; i < this->synthesizer->get_hyper_nf_ifaces_no() ; i++) {
		if ( !this->assign_nic_queues_to_cores(
				nic_desc_to_core, classifier_to_nic_desc,
				config_stream, i, nic_to_classifier[i]) ) {
			return TO_BOOL(CODE_GENERATION_PROBLEM);
		}
	}

	const std::string nic_purpose = "Pin NICS's hardware queues to CPU cores";
	if ( ! this->static_path_scheduling(nic_desc_to_core, config_stream, nic_purpose) ) {
		return TO_BOOL(CODE_GENERATION_PROBLEM);
	}

	std::string decap;
	decap = (this->proc_layer == L3)? \
				"Strip(14) -> MarkIPHeader()" : 
				"MarkIPHeader(OFFSET 14)";

	// Form the paths between NIC descriptors and IPClassifiers
	for (auto &it : classifier_to_nic_desc) {

		std::string ipc_class = it.first;

		// Search for the NIC ID of this classifier
		short nic = -1;
		for (auto &n : nic_to_classifier) {
			if ( n.second == ipc_class ) {
				nic = n.first;
				break;
			}
		}
		if ( nic < 0 ) {
			error_chatter(this->log, "\tCould not find the NIC of IPClassifier: " + ipc_class);
			return TO_BOOL(CODE_GENERATION_PROBLEM);
		}

		unsigned short replica_counter = 0;

		// Implode the vector into a large string that maps fd_nicX_qY -> ipclasX_qY
		for (auto fd : it.second) {

			unsigned short core_of_this_fd = nic_desc_to_core[fd];
			std::string class_repl = nic_to_classifier_repl[nic][replica_counter];
			classifier_to_core[class_repl] = core_of_this_fd;
			debug_chatter(this->log, "\t\tClassifier " + class_repl + " handled by core " + std::to_string(core_of_this_fd));

			config_stream 	<< std::left << std::setw(15) << fd << " -> " << decap << " -> " 
							#ifdef  DEBUG_MODE
							<< "IPPrint(" << std::left << std::setw(15) << fd // Check which core gets packets from RSS
							<< ", LENGTH true, TTL true) -> "
							#endif
							<< std::right << std::setw(10) << class_repl << ";" << std::endl;

			replica_counter++;
		}
		config_stream << std::endl;	
	}

	if ( this->rss_aggressive_pinning ) {
		const std::string ipc_purpose = "Pin IPClassifiers to CPU cores";
		if ( ! this->static_path_scheduling(classifier_to_core, config_stream, ipc_purpose) ) {
			return TO_BOOL(CODE_GENERATION_PROBLEM);
		}
	}

	return DONE;
}

/*
 * Clone the read part of a Hyper-NF chain across multiple input elements (aka cores).
 */
bool
RSSGenerator::replicate_read_part_of_synthesis(
		std::stringstream                                     &config_stream,
		std::map < unsigned short, std::string >              &nic_to_classifier,
		std::map < unsigned short, std::vector<std::string> > &nic_to_classifier_repl,
		std::map < std::string, std::vector< 
			std::pair< std::string, unsigned short > >
		>                                                     &classifier_repl_to_rewriter_repl) {

	config_stream << "///////////////////////////////////////////////////////////////" << std::endl;
	config_stream << "// The read-part of the synthesized Hyper-NF code"               << std::endl;
	config_stream << "///////////////////////////////////////////////////////////////" << std::endl;
	config_stream << std::endl;

	unsigned short ipc_no = 0;

	// Construct the IPClassifier(s) and the path of Click elements that will undertake
	// the modifications of its/their traffic classes. Replicate this set of elements 
	// across input elements.
	for ( auto &it : this->synthesizer->get_tc_per_input_iface() ) {

		std::unordered_map< std::string, ConsolidatedTc > tc_group = it.second;

		// The Classifier of this interface
		std::string ipc_class = "ipc" + std::to_string(ipc_no);

		// Here we store the name of each clone of the classifier.
		std::vector<std::string> ipc_replicas;
		std::vector < std::pair< std::string, unsigned short > > rewr_replicas_list;

		// Replicate the classifier across all queues
		for (unsigned short queue=0 ; queue<this->rss_queues ; queue++) {

			std::string queue_str = this->queue_ext_prefix + std::to_string(queue);

			// Example ipc0_q0
			std::string ipc_class_of_queue = ipc_class + queue_str;
			ipc_replicas.push_back(ipc_class_of_queue);

			config_stream << "/** IPClassifer " << ipc_class << ": Replica for NIC queue " << queue << " **/" << std::endl;

			std::vector<std::string> chains;
			unsigned short tc_no = 0;

			// Each traffic class becomes a pattern for IPClassifier
			config_stream << ipc_class_of_queue + " :: IPClassifier(" << std::endl;
			for (auto &tc: tc_group) {
				config_stream << "\t" << tc.second.m_pattern << "," << std::endl;

				// Get the path of Click elements between this classifier 
				// and this rewriter (excluding the rewriter)
				std::string path = tc.second.get_path_to_rewriter_after_classifier(
					"",     // at_queue = ""
					false   // with_the_rewriter = false
				);
				// Get the rewriter separately
				std::string rw = tc.second.get_stateful_rewriter(
					queue_str, // at_queue = queue_str appends the queue ID to the rewriter's name
					false      // with_inport = false
				);
				// .. and its input port
				unsigned short port = tc.second.get_input_port();

				// Now, get them together as a string
				std::string rw_with_inport_str = tc.second.get_stateful_rewriter(
					queue_str, // at_queue = queue_str appends the queue ID to the rewriter's name
					true       // with_inport = true
				);
				path += rw_with_inport_str + ";";
				chains.push_back(path);

				// Add a map of this rewriter to its classifer
				rewr_replicas_list.push_back( std::make_pair(rw, port) );

				tc_no++;
			}
			config_stream << ");" << std::endl;

			// Discarded paths
			for (size_t j = 0; j<chains.size(); j++) {
				config_stream << ipc_class_of_queue + "[" << std::right << std::setw(2) << j << "] -> " << chains[j] << std::endl;
			}
			config_stream << std::endl;

			// Map IPClassifer_qX[port] --> [ [Port]IPRewriter_Repl0, [Port]IPRewriter_Repl1, ..]
			classifier_repl_to_rewriter_repl[ipc_class_of_queue] = rewr_replicas_list;
		}

		// Keep a map NIC -> IPClassifier object to be used by the input elements.
		// These elements will connect the input with the read pipelines.
		nic_to_classifier[ipc_no] = ipc_class;

		// Keep a map NIC -> IPClassifier replica. One NIC has as many IPClassifier replicas 
		// as the number of its queues.
		nic_to_classifier_repl[ipc_no] = ipc_replicas;

		ipc_no++;
	}

	return DONE;
}

/*
 * Clone the write and output parts of a Hyper-NF chain.
 */
bool
RSSGenerator::replicate_write_and_output_part_of_synthesis(
		std::stringstream                                     &config_stream,
		std::map < 	std::pair< std::string, unsigned short>, 
					std::pair< std::string, unsigned short> > &classifier_repl_to_rewriter) {

	config_stream << "///////////////////////////////////////////////////////////////" << std::endl;
	config_stream << "// The write and output parts of the synthesized Hyper-NF code"  << std::endl;
	config_stream << "///////////////////////////////////////////////////////////////" << std::endl;
	config_stream << std::endl;

	// Costruct the path of Click elements that will lead each modified
	// (i.e., rewritten by Click IPRewriter) traffic class out of Click.
	// This path of elements follows IPRewriter.
	for ( auto &it : this->synthesizer->get_stateful_rewriter_per_output_iface() ) {

		std::string out_nf_and_iface = it.first;

		// Extract the NF name and its' interface
		std::vector<std::string> token = split(out_nf_and_iface, "-");
		std::string nf    = token[0];
		std::string iface = token[1];

		// The stateful Rewriter of this path
		auto rewriter = it.second;
		std::string rewriter_name = rewriter->get_name();

		// If we meet the interface of the first NF, it means that we go backwards.
		// Processing layer arguments determines whether we strip Ethernet headers or not.
		// The MAC addresses are set accordingly.
		unsigned short dpdk_iface;
		std::string encap;
		if ( nf == "NF_1" ) {
			dpdk_iface = 0;
			encap = (this->proc_layer == L3)? \
						"EtherEncap(0x0800, $macAddr0, $gwMACAddr0)" : 
						"StoreEtherAddress($gwMACAddr0, dst)";
		}
		// If we meet the interface of the last NF, it means that we go forward
		else {
			dpdk_iface = 1;
			encap = (this->proc_layer == L3)? \
						"EtherEncap(0x0800, $macAddr1, $gwMACAddr1)" : 
						"StoreEtherAddress($gwMACAddr1, dst)";
		}

		// Find the IPClassifier that leads to this rewriter 
		// to print a complete processing path
		std::pair < std::string, unsigned short > class_and_port_of_rewriter = 
			this->from_rewriter_to_classifier(
				classifier_repl_to_rewriter,
				rewriter_name
		);

		// Towards a particular output interface
		config_stream 	<< "/** Stateful Path from IPClassifier " << class_and_port_of_rewriter.first 
						<<  "[" << class_and_port_of_rewriter.second << "] going to: " << out_nf_and_iface 
						<< " **/" << std::endl;

		// The rewriters are replicated across all classifiers' replicas (as many as queues)
		for (unsigned short queue=0 ; queue<this->rss_queues ; queue++) {

			// Rewriter replica's name now includes the queue number
			std::string rewriter_name_of_queue = 	rewriter_name + 
													this->queue_ext_prefix + 
													std::to_string(queue);

			config_stream 	<< rewriter_name_of_queue << " :: IPRewriter(" << rewriter->compute_conf() 
							<< "DEC_IP_TTL true, CALC_CHECKSUM true);" << std::endl;

			// Only a Hyper-NF interface will take a ToDevice element.
			if ( this->synthesizer->is_hyper_nf_iface(nf, iface) ) {
				config_stream 	<< rewriter_name_of_queue << "[" << rewriter->get_outbound_port()
								<< "] -> " + encap + " -> ToDPDKDevice(" << dpdk_iface
								<< ", QUEUE " << std::right << std::setw(2) << queue
								<< ", BURST $burst, NDESC $txNdesc, IQUEUE $queueSize, TIMEOUT -1);" << std::endl;
			}
			// Be careful, some interfaces that appear here are internal.
			// These need to be discarded.
			else {
				config_stream 	<< rewriter_name_of_queue << "[" << rewriter->get_outbound_port()
								<< "] -> IPPrint(Discarded-Path-of-" << class_and_port_of_rewriter.first 
								<< ") -> Discard();" << std::endl;
			}

			// Discarded paths
			for (unsigned short j=0; j<rewriter->get_outbound_port(); j++) {
				config_stream 	<< rewriter_name_of_queue << "[" << j 
								<< "] -> IPPrint(Discarded-Path-of-" << class_and_port_of_rewriter.first 
								<< ") -> Discard();" << std::endl;
			}

			config_stream << std::endl;
		}
	}

	return DONE;
}

/*
 * Map a Classifier to the Rewriter objects that will
 * modify its traffic classes. One classifier has at maximum
 * as many rewriters as the number of its traffic classes.
 * However, sometimes traffic classes from different classifiers
 * might end up to the same rewriter. This is the case for stateful
 * middlebox operations such as NAPT, where two directions of the
 * same flow need to pass through the same stateful rewriter.
 */
bool
RSSGenerator::construct_classifier_to_rewriter_map(
		std::map < 	std::pair< std::string, unsigned short>, 
					std::pair< std::string, unsigned short> > &classifier_repl_to_rewriter) {

	unsigned short ipc_no = 0;

	// One Classifier per Hyper-NF interface
	for ( auto &it : this->synthesizer->get_tc_per_input_iface() ) {

		// The group of traffic classes of this Classifier is the value of the map
		std::unordered_map< std::string, ConsolidatedTc > tc_group = it.second;

		// The Classifier of this interface
		std::string ipc_class = "ipc" + std::to_string(ipc_no);
		//info_chatter(this->log, "\tClassifier: " + ipc_class);

		// Replicate the classifier across all queues of the interface
		for (unsigned short queue=0 ; queue<this->rss_queues ; queue++) {

			// Queue ID to append to classifier
			std::string queue_str = this->queue_ext_prefix + std::to_string(queue);

			// Example ipc0_q0
			std::string ipc_class_repl_of_queue = ipc_class + queue_str;
			//info_chatter(this->log, "\t\tClassifier Replica: " + ipc_class_repl_of_queue);

			unsigned short tc_no = 0;

			for (auto &tc: tc_group) {
				//info_chatter(this->log, "\t\t\t Map " << ipc_class_repl_of_queue << "[" << tc_no << 
				//						"] --> [" << tc.second.get_input_port() << "]" 
				//						<< tc.second.get_stateful_rewriter());

				// Map IPClassifier[outport] --> [inport]IPRewriter
				classifier_repl_to_rewriter[
					std::make_pair(ipc_class_repl_of_queue, tc_no)
				] = std::make_pair(tc.second.get_stateful_rewriter(), tc.second.get_input_port());
				
				tc_no++;
			}
		}

		ipc_no++;
	}

	return DONE;
}

/*
 * Given a rewriter, search in the Classifier-Rewriter map to
 * find the classifier associated to that specific rewriter.
 */
std::pair< std::string, unsigned short > 
RSSGenerator::from_rewriter_to_classifier(
		const std::map<
			std::pair< std::string, unsigned short>, 
			std::pair< std::string, unsigned short>
		>                                            &classifier_repl_to_rewriter,
		const std::string                            &rewriter_name) {

	for ( auto &class_to_rw : classifier_repl_to_rewriter ) {
		std::string    classifier_repl      = class_to_rw.first.first;
		unsigned short classifier_repl_port = class_to_rw.first.second;
		std::string    rewriter             = class_to_rw.second.first;

		for ( auto &token : split(rewriter, "_") ) {
			if ( token == rewriter_name ) {
				std::string class_repl_without_queue = get_substr_before(classifier_repl, this->queue_ext_prefix);
				return std::make_pair(class_repl_without_queue, classifier_repl_port);
			}
		}
	}

	return std::make_pair("", -1);
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
RSSGenerator::assign_nic_queues_to_cores(
		std::map <std::string, unsigned short>            &nic_desc_to_core,
		std::map < std::string, std::vector<std::string>> &classifier_to_nic_desc,
		std::stringstream                                 &config_stream,
		const unsigned short                              &nic_no,
		const std::string                                 &ipcl_name) {

	unsigned short step    = 1;
	unsigned short core_no = 0;

	if ( this->cpu_sockets_no > 1 ) {
		step = ( this->numa ) ? 2 : 1;
	}

	// We start from the appropriate core (and socket)
	//unsigned short sock = ( nic_no % this->cpu_sockets_no == 0 )? true:false;
	core_no = ( (nic_no % this->cpu_sockets_no) % 2 == 0 ) ? 0:1;
	info_chatter(this->log, "\t\t[NIC " 	<< nic_no << " with " << this->rss_queues 
										<< " queues]: Starts from CPU core " << core_no 
										<< " with step " << step);

	// Each FromDPDKDevice has a name that indicates the interface and queue number.
	std::string input_nic_desc = "fd_nic" + std::to_string(nic_no) + this->queue_ext_prefix;

	// Store the queue descriptors
	std::vector<std::string> nic_descs;

	// For each queue of this NIC
	for (unsigned short queue=0 ; queue<this->rss_queues ; queue++) {

		// If only one queue is requested, we omit the QUEUE argument in order to read
		// frames fromm all queues.
		std::string queue_conf = (this->rss_queues > 1) ? (boost::format(", QUEUE %2d") % std::to_string(queue)).str() : "";

		// Define a Click-DPDK input element per queue per NIC
		config_stream 	<< input_nic_desc << std::left << std::setw(2) << queue 
						<< " :: FromDPDKDevice(" << nic_no << queue_conf 
						<< ", BURST $burst, NDESC $rxNdesc);" << std::endl;

		// Append the vector of descriptors that will be assigned to this IPClassifier
		nic_descs.push_back(input_nic_desc + std::to_string(queue));

		// Round-robin of socket's core across all NIC queues.
		nic_desc_to_core[input_nic_desc + std::to_string(queue)] = core_no % this->rss_cores;
		core_no += step;
	}
	config_stream << std::endl;

	classifier_to_nic_desc[ipcl_name] = nic_descs;

	return DONE;
}

/*
 * Call Click's StaticThreadSched element to schedule a map
 * of Click instances to different CPU cores.
 */
bool
RSSGenerator::static_path_scheduling(
		std::map <std::string, unsigned short> &instance_to_core, 
		std::stringstream                      &config_stream,
		const std::string                      &purpose) {

	if ( !purpose.empty() ) {
		config_stream << "/** " + purpose + " **/"  << std::endl;
	}

	unsigned short desc_no = 0;

	config_stream << "StaticThreadSched(" << std::endl;
	for (auto &it : instance_to_core) {

		if ( desc_no == instance_to_core.size()-1 )
			config_stream 	<< "\t" << std::left << std::setw(15) << it.first 
							<< " " << std::right << std::setw(3)  << it.second << "\n);";
		else
			config_stream 	<< "\t" << std::left << std::setw(15) << it.first 
							<< " " << std::right << std::setw(3)  << it.second << ", \n";

		desc_no++;
	}
	config_stream << std::endl << std::endl;

	return DONE;
}

/*
 * Call Click's StaticThreadSched element to schedule a map
 * of paths between IPClassifiers and IPRewriters
 */
bool
RSSGenerator::stateful_path_scheduling(
		std::map <std::string, unsigned short>          &classifier_to_core,
		std::map <
			std::string, std::vector< 
			std::pair< std::string, unsigned short > >
		>                                               &classifier_repl_to_rewriter_repl,
		std::stringstream                               &config_stream) {

	config_stream << "/** Pin IPClassifier -> IPRewriter paths to CPU cores **/"  << std::endl;
	config_stream << "StaticThreadSched(" << std::endl;

	unsigned short cl_inst_no  = classifier_repl_to_rewriter_repl.size();
	unsigned short cl_inst_cnt = 0;

	for ( auto &class_to_rw : classifier_repl_to_rewriter_repl ) {
		std::string classifier_repl = class_to_rw.first;
		unsigned short core_of_this_class = classifier_to_core[classifier_repl];

		unsigned short rw_inst_no  = class_to_rw.second.size();
		unsigned short rw_inst_cnt = 0;
		for ( auto &rw_repl : class_to_rw.second ) {
			std::string rewriter_repl = rw_repl.first;
			debug_chatter(this->log, "\tClassifier Replica: " + classifier_repl + " --> " + rewriter_repl);

			// Pin the rewriter to the same core as the classifier
			if ( (cl_inst_cnt == cl_inst_no-1) && (rw_inst_cnt == rw_inst_no-1) )
				config_stream 	<< "\t" << std::left << std::setw(10) << rewriter_repl << " " 
								<< std::right << std::setw(3) << core_of_this_class << "\n);";
			else
				config_stream 	<< "\t" << std::left << std::setw(10) << rewriter_repl << " " 
								<< std::right << std::setw(3) << core_of_this_class << ", \n";

			rw_inst_cnt++;
		}
		cl_inst_cnt++;
	}

	return DONE;
}
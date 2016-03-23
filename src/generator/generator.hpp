#ifndef _GENERATOR_HPP_
#define _GENERATOR_HPP_

/*
 * generator.hpp
 * 
 * Class declaration for exporting a runnable Hyper-NF configuration.
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

#ifdef HAVE_CONFIG_H
#include "../../config.h"
#endif

#include "../synthesizer/synthesizer.hpp"

class Generator {
	private:
		/*
		 * Generate the synthesis as a combination of Intel-RSS rules for the NIC
		 * and Click code that runs per hardware queue.
		 */
		bool hw_classification;

		/*
		 * If hardware_classification is set, one of the following formats are valid:
		 * |--> RSS-Hashing
		 * |--> FlowDirector
		 * |--> OpenFlow
		 * Otherwise, Click is the standard way.
		 */
		TrafficClassFormat traffic_classification_format;

		/*
		 * The filename that becomes the base for either software or hardware configuration files.
		 */
		std::string basic_configuration_filename;

		/*
		 * The filename where the generated Click code will be written.
		 */
		std::string soft_configuration_filename;

		/*
		 * The filenames where the generated hardware-related code will be written.
		 * One file per NIC
		 */
		std::map< std::pair<std::string, std::string>, std::string > hrdw_configuration_per_nic;

		 /*
		 * The object that provides the Hyper-NF configuration we want to generate.
		 */
		Synthesizer *synthesizer;

		/*
		 * Logger instance
		 */
		Logger log;

	public:
		/*
		 * Public API for the Generator
		 */
		Generator (Synthesizer *synth);
		~Generator();

		inline TrafficClassFormat get_traffic_class_format        (void) {
			return this->traffic_classification_format;
		};
		inline std::string        get_basic_configuration_filename(void) {
			return this->basic_configuration_filename;
		};
		inline std::string        get_soft_configuration_filename (void) {
			return this->soft_configuration_filename;
		};
		inline Synthesizer*       get_synthesizer                 (void) {
			return this->synthesizer;
		};

		/*
		 * Generate a new configuration that depends on the user input.
		 * |--> Hardware-assisted, multi-core Hyper-NF
		 * If hardware classification is requested, generate two files: (a) an implementation of 
		 * the traffic classification in the NIC's language (Intel-RSS), and (b) a Click-DPDK configuration
		 * that schedules a multitude of threads (one per core) that handle different pieces of the header space.
		 * |--> All-in-Software Hyper-NF
		 * If hardware classification is not requested, generate a Click equivalent of the entire chain.
		 */
		bool generate_equivalent_configuration     (const bool to_file=true);

		/*
		 * Generate a new Click configuration that implements the chain in one Click module.
		 * The configuration must achieve equivalent functionality with the initial one.
		 */
		bool generate_all_in_soft_configuration    (const bool to_file=true);

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
		 */
		bool generate_rss_cloned_pipelines         (const bool to_file=true);
		bool generate_flow_director_split_pipelines(const bool to_file=true);
		bool generate_openflow_split_pipelines     (const bool to_file=true);

	private:

		/*
		 * When hardware classification is on, we need to schedule multiple
		 * threads (one per core) to the various NIC queues and attach one 
		 * Click-DPDK Input element (FromDPDKDevice) to each queue.
		 */
		bool allocate_queues_to_cores(
			std::map < std::string, unsigned short >           &nic_desc_to_core,
			std::map < std::string, std::vector<std::string> > &nic_desc_to_ip_class,
			std::string                                        &code_buffer,
			const unsigned short                               &nic_no,
			const std::string                                  &ipcl_name
		);

		/*
		 * Compose the arguments of Click's StaticThreadSched element.
		 * These arguments are maps of nic descriptors to CPU cores.
		 */
		bool schedule_core_threads_on_queues(
			std::map <std::string, unsigned short> &nic_desc_to_core,
			std::string &code_buffer
		);

		/*
		 * Dump ethtool configuration for the NICs involved in a Hyper-NF.
		 */
		bool generate_rss_configuration(
			std::ofstream  **hw_out_file,
			unsigned short nics_no,
			std::streambuf *def_cout
		);
};

#endif

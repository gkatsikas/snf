#ifndef _RSS_GENERATOR_HPP_
#define _RSS_GENERATOR_HPP_

/*
 * rss_generator.hpp
 * 
 * Class for exporting a hardware-assisted Hyper-NF configuration.
 * A Click-DPDK module is generated with the following properties:
 * |-> Receive-side Scaling (RSS) mechanism to read packets from different
 *     hardware queues of the NIC, using one FromDPDKDevice element per queue.
 * |-> Scheduling of all the FromDPDKDevice elements to perform distributed I/O 
 *     across multiple cores.
 * |-> Replication of the chain across multiple cores to perfrom distributed, 
 *     parallel processing. Each FromDPDKDevice is linked to a copy of the 
 *     synthesized chain.
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

#include "generator.hpp"

class RSSGenerator : public Generator {
	private:
		/*
		 * The number of available CPU cores, as specified by 
		 * the user in the input file.
		 */
		unsigned short rss_cores;
		/*
		 * The number of available hardware queues, as specified by 
		 * the user in the input file.
		 */
		unsigned short rss_queues;
		/*
		 * The number of available CPU sockets, as specified by 
		 * the user in the input file.
		 */
		unsigned short socket_cores;

	public:
		/*
		 * Public API for RSSGenerator
		 */
		RSSGenerator (Synthesizer *synth);
		~RSSGenerator();

		/*
		 * Implements the abstract method of parent Generator class by calling the
		 * private generate_rss_cloned_pipelines method below.
		 * This method generates a hardware-assisted Hyper-NF configuration based 
		 * on Click-DPDK and RSS.
		 */
		bool generate_equivalent_configuration(const bool to_file=true);

	private:
		/*
		 * Hardware-assisted, RSS-based Hyper-NF:
		 *    RSS-Hashing in the NIC splits traffic at will (based on fields that we specify).
		 *    Then, a Click-DPDK configuration is reading packets from different queues, schedules threads
		 *    from multiple cores on these queues, and clones the chain across all of them.
		 */
		bool generate_rss_cloned_pipelines    (const bool &to_file);

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
};

#endif

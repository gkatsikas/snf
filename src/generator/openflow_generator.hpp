#ifndef _OPENFLOW_GENERATOR_HPP_
#define _OPENFLOW_GENERATOR_HPP_

/*
 * openflow_generator.hpp
 *
 * Class for exporting a hardware-assisted SNF configuration.
 * SNF's global, chain classifier (i.e., ``read-part of synthesis) is
 * translated into a set of OpenFlow v1.3 rules that can be deployed to either
 * a hardware or software-based OpenFlow v1.3 switch.
 * The switch will apply tags (VLAN) to the different traffic classes
 * and send those classes to one of multiple NFV servers.
 *
 * On the server side, a Click-DPDK module is generated with the following properties:
 * |-> Generate a set of Flow Director rules that will guide each VLAN tag
 *     (coming form the switch), to a different hardware queue of the NIC.
 * |-> Read packets from different hardware queues of the NIC, using one
 *     FromDPDKDevice element per queue.
 * |-> Scheduling of all the FromDPDKDevice elements to perform distributed I/O
 *     across multiple cores.
 * |-> Implementation of the ``write'' part of the synthesized chain in Click.
 *     Packets read by a FromDPDKDevice on a particular queue will be modified by
 *     the synthesized Click modification element and then sent out of the chain.
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

class OpenFlowGenerator : public Generator {

	private:
		/*
		 * The OpenFlow rules to be dumped to the switch.
		 */
		std::string openflow_rules;
		/*
		 * A map <Traffic Class ID, VLAN Tag> --> <Server ID, NIC name>
		 */
		std::map< std::pair<std::string, std::string>, std::pair<std::string, std::string> >
			tc_tags_per_server_per_nic;

	public:
		/*
		 * Public API for OpenFlowGenerator
		 */
		OpenFlowGenerator (Synthesizer *synth);
		~OpenFlowGenerator();

		/*
		 * Implements the abstract method of parent Generator class by calling the
		 * private generate_openflow_split_pipelines method below.
		 * This method generates a hardware-assisted SNF configuration based
		 * on OpenFlow, Click-DPDK, and RSS.
		 */
		bool generate_equivalent_configuration(const bool to_file=true);

	private:

		/*
		 * Hardware-assisted, OpenFlow-based SNF:
		 *    OpenFlow v1.3 rules are generated to spit the traffic classes
		 *    in an OpenFlow-based switch.
		 *    Packets are tagged by the switch and then dispatched to one or
		 *    more NFV servers. Each server applies RSS hashing on the tags to
		 *    assign different traffic classes to different Click-DPDK pipelines.
		 *    This is a split processing model, the pipeline is not cloned.
		 */
		bool generate_openflow_split_pipelines(const bool &to_file);
};

#endif

#ifndef _FLOW_DIRECTOR_GENERATOR_HPP_
#define _FLOW_DIRECTOR_GENERATOR_HPP_

/*
 * flow_director_generator.hpp
 *
 * Class for exporting a hardware-assisted SNF configuration.
 * SNF's global, chain classifier (i.e., ``read-part of synthesis) is
 * translated into a set of NIC-specific rules using the FlowDirector API.
 * Each rule associates the matching packets with a particular CPU core
 * that will undertakes their processing.
 * After a packet is caught by a core, a set of Click elements undertake
 * its modifications.
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

class FlowDirectorGenerator : public Generator {

	private:
		/*
		 * A map <Traffic Class ID, NIC> --> <File Name>
		 * The filenames where the generated Flow Director commands will be written.
		 */
		std::map< std::pair<std::string, std::string>, std::string > hrdw_configuration_per_nic;

	public:
		/*
		 * Public API for FlowDirectorGenerator
		 */
		FlowDirectorGenerator (Synthesizer *synth);
		~FlowDirectorGenerator();

		/*
		 * Implements the abstract method of parent Generator class by calling the
		 * private generate_flow_director_split_pipelines method below.
		 * This method generates a hardware-assisted SNF configuration based
		 * on FlowDirector and Click-DPDK.
		 */
		bool generate_equivalent_configuration     (const bool to_file=true);

	private:

		/*
		 * Hardware-assisted, OpenFlow-based SNF:
		 *    Flow Director commands are generated to split the traffic based on specific field values.
		 *    Each Click-DPDK configuration implements a subset of the chain.
		 */
		bool generate_flow_director_split_pipelines(const bool &to_file);

		/*
		 * Dump ethtool configuration for the NICs involved in a SNF.
		 */
		bool generate_flow_director_configuration(
			std::ofstream  **hw_out_file,
			unsigned short &nics_no,
			std::streambuf *def_cout
		);
};

#endif

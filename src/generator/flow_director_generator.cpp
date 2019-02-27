// -*- c-basic-offset: 4 -*-
/* flow_director_generator.cpp
 *
 * Export a runnable, SNF configuration that implements a
 * service chain in a distributed, hardware-assisted fashion.
 * The conditional part of the chain (i.e., read and classify flows)
 * is exported to a programmable NIC. The NIC encodes the traffic
 * classes using FlowDirector filters and sends the matching packets to
 * different CPU cores.
 * Each core is then assigned with a pipeline that modifies the
 * corresponding traffic class accordingly.
 * This processing model is totally distributed because each core's pipeline is
 * different; we do not replicate the pipeline of the entire chain).
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

#include "flow_director_generator.hpp"

FlowDirectorGenerator::FlowDirectorGenerator(Synthesizer *synth) : Generator(synth)
{
	def_chatter(this->log, "\tFlow Director-based SNF generator constructed");
}

FlowDirectorGenerator::~FlowDirectorGenerator()
{
	def_chatter(this->log, "\tFlow Director-based SNF generator deleted");
}

/*
 * Method that abstracts the input-dependent code generation process.
 */
bool
FlowDirectorGenerator::generate_equivalent_configuration(const bool to_file)
{
	return this->generate_flow_director_split_pipelines(to_file);
}

/*
 * Hardware-assisted, OpenFlow-based SNF:
 *    Flow Director commands are generated to split the traffic based on specific field values.
 *    Each Click-DPDK configuration implements a subset of the chain.
 */
bool
FlowDirectorGenerator::generate_flow_director_split_pipelines(const bool &to_file)
{
	(void) to_file;
	MISSING_FEATURE(this->log, "Flow Director traffic class generator is not implemented yet");
	return DONE;
}

/*
 * Dump ethtool configuration for the NICs involved in a SNF.
 */
bool
FlowDirectorGenerator::generate_flow_director_configuration(
		std::ofstream  **hw_out_file,
		unsigned short &nics_no,
		std::streambuf *def_cout)
{
	for (unsigned short nic = 0 ; nic < nics_no ; nic++) {
		// Move cout to the files where we write the hardware configuration
		def_cout = std::cout.rdbuf(hw_out_file[nic]->rdbuf());
	}

	(void)def_cout;
	return DONE;
}

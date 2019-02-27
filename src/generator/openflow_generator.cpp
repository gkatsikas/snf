// -*- c-basic-offset: 4 -*-
/* openflow_generator.cpp
 *
 * Export a runnable, SNF configuration that implements a
 * service chain in a distributed, hardware-assisted fashion.
 * The conditional part of the chain (i.e., read and classify flows)
 * is exported to an OpenFlow v1.3 switch. The switch encodes the traffic
 * classes using tags on the packet headers and sends those packets to
 * one or more NFV servers.
 * Each server distributes the traffic based on the tag to dispatch load across
 * multiple cores using Flow Director. Each core is then assigned with a pipeline
 * that modifies the corresponding traffic class accordingly.
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

#include "openflow_generator.hpp"

OpenFlowGenerator::OpenFlowGenerator(Synthesizer *synth) : Generator(synth)
{
	def_chatter(this->log, "\tOpenFlow-based SNF generator constructed");
}

OpenFlowGenerator::~OpenFlowGenerator()
{
	delete this->synthesizer;
	def_chatter(this->log, "\tOpenFlow-based SNF generator deleted");
}

/*
 * Method that abstracts the input-dependent code generation process.
 */
bool
OpenFlowGenerator::generate_equivalent_configuration(const bool to_file)
{
	return this->generate_openflow_split_pipelines(to_file);
}

/*
 * Hardware-assisted, OpenFlow-based SNF:
 *    OpenFlow v1.3 rules are generated to spit the traffic classes
 *    in an OpenFlow-based switch.
 *    Packets are tagged by the switch and then dispatched to one or
 *    more NFV servers. Each server uses Flow Director rules on the tags to
 *    assign different traffic classes to different Click-DPDK pipelines.
 *    This is a split processing model, the pipeline is not cloned.
 */
bool
OpenFlowGenerator::generate_openflow_split_pipelines (const bool &to_file)
{
	(void) to_file;
	MISSING_FEATURE(this->log, "OpenFlow traffic class generator is not implemented yet");
	return DONE;
}

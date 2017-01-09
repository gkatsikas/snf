// -*- c-basic-offset: 4 -*-
/* flow_director_generator.cpp
 *
 * Export a runnable, SNF configuration that implements the
 * NFV chain in a distributed, hardware-assisted fashion.
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
	//std::ofstream  *soft_out_file  = NULL;
	//std::ofstream  **hard_out_file = NULL;
	//std::streambuf *def_cout       = NULL;
	//std::string all_out_files;

	if ( to_file ) {
		// Open the output files to host our synthesized chain
		//soft_out_file = new std::ofstream(this->soft_configuration_filename);

		//all_out_files = "\t\t\t\t\t\t\t\t|--> " + this->soft_configuration_filename + "\n";

		// Output files (one per interface) to host the Flow director commands of each SNF interface.
		/*hard_out_file = new std::ofstream*[nic_classifiers_no];
		unsigned short i = 0;
		for ( auto &it : this->synthesizer->get_snf_ifaces() ) {
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

		//for (unsigned short i = 0 ; i < this->get_snf_ifaces_no() ; i++) {
		//	hard_out_file[i]->close();
		//	delete hard_out_file[i];
		//}
		//delete[] hard_out_file;
		//hard_out_file = NULL;
	}

	MISSING_FEATURE(this->log, "Flow Director traffic class generator not implemented yet");
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
		//std::cout << "OOOOOOOOOOOOOO" << std::endl;
	}

	(void)def_cout;
	return DONE;
}

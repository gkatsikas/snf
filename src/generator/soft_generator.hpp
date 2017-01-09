#ifndef _SOFT_GENERATOR_HPP_
#define _SOFT_GENERATOR_HPP_

/*
 * soft_generator.hpp
 *
 * Class for exporting a pure software-based SNF configuration based on Click.
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

class SoftGenerator : public Generator {

	private:
		// Nothing special

	public:
		/*
		 * Public API for SoftGenerator
		 */
		SoftGenerator (Synthesizer *synth);
		~SoftGenerator();

		/*
		 * Implements the abstract method of parent Generator class by calling the
		 * private generate_all_in_soft_configuration method below.
		 * This method generates an All-in-Software SNF configuration based on Click.
		 */
		bool generate_equivalent_configuration (const bool to_file=true);

	private:
		/*
		 * Generate a new Click configuration that implements the chain in one Click module.
		 * The configuration must achieve equivalent functionality with the initial chain.
		 */
		bool generate_all_in_soft_configuration(const bool &to_file);

		/*
		 * Generate some static information about the interfaces' addresses.
		 */
		void generate_static_configuration     (
			std::stringstream &config_stream
		);

		/*
		 * Generate the input, read, write, and output parts of
		 * a SNF chain.
		 */
		bool generate_input_part_of_synthesis  (
			std::stringstream                     &config_stream,
			std::map < std::string, std::string > &nic_to_ip_classifier
		);
		bool generate_read_part_of_synthesis   (
			std::stringstream                     &config_stream,
			std::map < std::string, std::string > &nic_to_ip_classifier
		);
		bool generate_write_and_output_part_of_synthesis(
			std::stringstream &config_stream
		);

		/*
		 * Generate code for I/O depending on the Click mode (i.e., Standard or DPDK)
		 */
		std::string get_io_classes_by_type(void) const;
};

#endif

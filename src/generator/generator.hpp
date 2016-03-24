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
	protected:
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
		virtual ~Generator();

		/*
		 * Generate a new configuration that depends on the user input.
		 * |--> Hardware-assisted, RSS-based Hyper-NF
		 * |--> Hardware-assisted, OpenFlow-based Hyper-NF
		 * |--> Hardware-assisted, Flow Director-based Hyper-NF
		 * |--> All-in-Software Hyper-NF (Click)
		 */
		virtual bool      generate_equivalent_configuration(const bool to_file=true) = 0;

		/*
		 * Expose the list of generated filenames
		 */
		const std::string get_output_files_list_str(void);

	protected:
		/*
		 * Expose a set of setters and getters to the derived classes
		 */
		inline TrafficClassFormat get_traffic_class_format        (void) const {
			return this->traffic_classification_format;
		};
		inline std::string        get_basic_configuration_filename(void) const {
			return this->basic_configuration_filename;
		};
		inline std::string        get_soft_configuration_filename (void) const {
			return this->soft_configuration_filename;
		};
		inline Synthesizer*       get_synthesizer                 (void) {
			return this->synthesizer;
		};
};

#endif

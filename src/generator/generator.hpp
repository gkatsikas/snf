#ifndef _GENERATOR_HPP_
#define _GENERATOR_HPP_

/*
 * generator.hpp
 * 
 * Class declaration for exporting a runnable SNF configuration.
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

static const std::string InputClassName  = "Input";
static const std::string OutputClassName = "Output";

class Generator {

	protected:
		/*
		 * Logger instance
		 */
		Logger             log;

		/*
		 * The object that provides the SNF configuration we want to generate.
		 */
		Synthesizer        *synthesizer;

		/*
		 * Pointer to the input properties class
		 */
		Properties         *input_properties;

		/*
		 * Generate the synthesis as a combination of Intel-RSS rules for the NIC
		 * and Click code that runs per hardware queue.
		 */
		bool               hw_classification;

		/*
		 * The variance of Click we base SNF upon.
		 * We support Click and FastClick.
		 */
		ClickType          click_type;

		/*
		 * If hardware_classification is set, one of the following formats are valid:
		 * |--> RSS-Hashing
		 * |--> FlowDirector
		 * |--> OpenFlow
		 * Otherwise, ClickIPClassifier is the standard way.
		 */
		TrafficClassFormat traffic_classification_format;

		/*
		 * SNF can process traffic at L2 and L3
		 * Input confguration can set this accordingly.
		 */
		ProcessingLayer    proc_layer;

		/*
		 * The filename that becomes the base for either software or hardware configuration files.
		 */
		std::string        basic_configuration_filename;

		/*
		 * The filename where the generated Click code will be written.
		 */
		std::string        soft_configuration_filename;

	public:
		/*
		 * Public API for the Generator
		 */
		Generator(Synthesizer *synth);
		virtual ~Generator();

		/*
		 * Generate a new configuration that depends on the user input.
		 * |--> Hardware-assisted, RSS-based SNF
		 * |--> Hardware-assisted, OpenFlow-based SNF
		 * |--> Hardware-assisted, Flow Director-based SNF
		 * |--> All-in-Software SNF (ClickIPClassifier)
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

		void generate_indicative_chain_parameters(
			unsigned short &snf_ifaces_no,
			std::stringstream &config_stream
		);
};

#endif

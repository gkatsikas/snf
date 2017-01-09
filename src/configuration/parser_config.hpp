#ifndef _PARSER_CONFIG_HPP_
#define _PARSER_CONFIG_HPP_

/*
 * parser_config.hpp
 *
 * Defines the parsing mechanisms that feed the NF Synthesizer.
 * Represents a NF chain as a digraph of interconnected NFs while
 * another digraph shows the connectivity of this chain with
 * external NFV domains.
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

#include "properties.hpp"
#include "generic_config.hpp"

 #include "../graph/graph.hpp"

/*
 * Class that loads the NF chain configuration from a
 * property file and builds the graph of the chain.
 */
class ParserConfiguration : public GenericConfiguration {

	private:
		/*
		 * A Directed Acyclic Graph of chained NFs
		 */
		Graph      *nf_chain;

		/*
		 * Another DAG that shows how the NF chain is connected to several domains
		 */
		Graph      *nf_domains;


		/*
		 * A set of useful properties that will define and drive the synthesis outcome.
		 */
		Properties *properties;

		/*
		 * How many NFs the chain has.
		 */
		unsigned short chain_length;

	public:
		/*
		 * Constructor that loads the property file by calling the super class
		 */
		ParserConfiguration (const std::string &config_file);
		~ParserConfiguration();

		/*
		 * Setters & Getters
		 */
		inline Graph         *get_chain        (void) { return this->nf_chain;     };
		inline unsigned short get_chain_length (void) { return this->chain_length; };
		inline Graph         *get_chain_domains(void) { return this->nf_domains;   };
		inline Properties    *get_properties   (void) { return this->properties;   };

		/*
		 * Implements load_property_file (abstract method in the super class)
		 */
		bool load_property_file (void);

	private:
		/*
		 * Read the generic parameters of the Chain Configurator
		 */
		bool parse_generic_properties(void);

		/*
		 * Parse the internal NF chain connections
		 */
		bool parse_topology(const std::string &nf_topo);

		/*
		 * Corner case of parsing a single NF to be synthesized.
		 * This case forms a singleton graph.
		 */
		bool parse_uni_chain(const std::string &nf_topo);

		/*
		 * Parse the external NF chain connections with various domains
		 */
		bool parse_domains(const std::string &nf_domains);

		/*
		 * Create a chain vertex node that represents a NF as part of a DAG
		 */
		ChainVertex *fill_chain_vertex(const std::string &nf, int &position);

		/*
		 * Check whether the formulated graph of the chain is acyclic
		 */
		bool check_for_loops(void);

		/*
		 * Print error messages regarding the property file
		 */
		void usage(const std::string &message, const std::string &usage="");

		/*
		 * Print the loaded configuration
		 */
		void print_loaded_property_status(void);
};

#endif

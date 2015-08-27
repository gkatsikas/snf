//============================================================================
//        Name: parser_configuration.hpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: Defines the parsing mechanisms that feed the NF Synthesizer.
//              Represents a NF chain as a digraph of interconnected NFs while
//              another digraph shows the connectivity of this chain with
//              external NFV domains.
//============================================================================

#ifndef _PARSER_CONFIG_HPP_
#define _PARSER_CONFIG_HPP_

#include "../graph/graph.hpp"
#include "generic_configuration.hpp"

/*
 * Class loads the NF chain configuration from a property file and builds the graph of the chain
 */
class ParserConfiguration : public GenericConfiguration
{
	private:
		/*
		 * A Directed Acyclic Graph of chained NFs
		 */
		Graph* nf_chain;

		/*
		 * Another DAG that shows how the NF chain is connected to several domains
		 */
		Graph* nf_domains;

	public:
		/*
		 * Constructor that loads the property file by calling the super class
		 */
		ParserConfiguration(const std::string& config_file);
		~ParserConfiguration();

		/*
		 * Setters & Getters
		 */
		inline Graph* get_chain        (void) { return this->nf_chain;   };
		inline Graph* get_chain_domains(void) { return this->nf_domains; };

		/*
		 * Implements load_property_file (abstract methid in the super class)
		 */
		virtual void load_property_file(void);

	private:
		/*
		 * Parse the internal NF chain connections
		 */
		short parse_topology(const std::string& nf_topo);
		
		/*
		 * Parse the external NF chain connections with various domains
		 */
		short parse_domains(const std::string& nf_domains);

		/*
		 * Check whether the formulated graph of the chain is acyclic
		 */
		void check_for_loops(void);
		
		/*
		 * Extract numbers from strings
		 */
		std::string get_number_from_string(std::string const& str);
		
		/*
		 * Print error messages regarding the property file
		 */
		void usage(const std::string& message, const std::string& usage);
};

#endif

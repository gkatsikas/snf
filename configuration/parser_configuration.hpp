//============================================================================
// Name        : parser_configuration.hpp
// Copyright   : KTH ICT CoS Network Systems Lab
// Description : Defines a NF chain as a digraph of interconnected NFs
//============================================================================

#ifndef _PARSER_CONFIG_HPP_
#define _PARSER_CONFIG_HPP_

#include "graph.hpp"
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

	public:
		/*
		 * Constructor that loads the property file by calling the super class
		 */
		ParserConfiguration(const std::string& config_file);
		~ParserConfiguration();

		/*
		 * Setters & Getters
		 */
		inline Graph* get_graph(void) { return this->nf_chain; };

		/*
		 * Implements load_property_file (abstract methid in the super class)
		 */
		virtual void load_property_file(void);

	private:
		/*
		 * Check the loaded properties for errors
		 */
		short int check_topology_correctness(const boost::tokenizer<boost::char_separator<char>>& array,
							const unsigned short& nfs_no, const std::string& type);
		void check_for_loops(void);
};

#endif

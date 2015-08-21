//============================================================================
// Name        : chain_parser.hpp
// Copyright   : KTH ICT CoS Network Systems Lab
// Description : Class that helps in parsing Click configurations.
//============================================================================

#ifndef _CHAIN_PARSER_HPP_
#define _CHAIN_PARSER_HPP_

#include "../configuration/parser_configuration.hpp"

class ChainParser {
	private:
		/*
		 * The length of the chain
		 */
		unsigned short chain_length;

		/*
		 * The chain (represented as a DAG) to be synthesized
		 */
		ParserConfiguration* chain_graph;

		/*
		 * Logger instance
		 */
		Logger log;

	public:
		/*
		 * Public API for the Parser
		 */
		ChainParser (ParserConfiguration* pc);
		~ChainParser();

		short load_chained_configuratios(void);

	private:
		short load_nf_configuration(std::string& nf_source);
};

#endif

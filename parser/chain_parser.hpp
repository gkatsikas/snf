//============================================================================
// Name        : chain_parser.hpp
// Copyright   : KTH ICT CoS Network Systems Lab
// Description : Class declaration for parsing Click configurations.
//============================================================================

#ifndef _CHAIN_PARSER_HPP_
#define _CHAIN_PARSER_HPP_

#include <unordered_map>

#include "../logger/logger.hpp"
#include "../click/click_parse_configuration.hpp"
#include "../configuration/parser_configuration.hpp"

using NF_Map = std::unordered_map<unsigned short, Router*>;

class ChainParser {
	private:
		/*
		 * The length of the chain
		 */
		unsigned short chain_length;

		/*
		 * The NF chain (represented as a DAG) to be synthesized
		 */
		ParserConfiguration* chain_graph;

		/*
		 * Maps the position of a NF in the chain with a Click Router object
		 */
		NF_Map nf_configuration;

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

		/*
		 * Reads and loads the input Click configurations one-by-one.
		 * It belongs to the public API.
		 * It calls the private load_nf_configuration as many times an the number
		 * of input NFs that compose the chain.
		 */
		short load_chained_configuratios(void);

	private:
		/*
		 * Reads and loads one input Click configuration.
		 * It uses built-in Click methods and data structures linked with this file.
		 */
		short load_nf_configuration(unsigned short position, std::string nf_source);
};

#endif

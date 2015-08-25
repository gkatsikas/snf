//============================================================================
//        Name: chain_parser.hpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: Class declaration for parsing Click configurations.
//============================================================================

#ifndef _CHAIN_PARSER_HPP_
#define _CHAIN_PARSER_HPP_

#include <unordered_map>

#include "nf_graph.hpp"
#include "../configuration/parser_configuration.hpp"

template<typename T>
using NF_Map = std::unordered_map<unsigned short, T>;

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
		NF_Map<Router*> nf_configuration;

		/*
		 * One DAG of Click elements per NF in the chain
		 */
		NF_Map<NFGraph*> nf_dag;

		/*
		 * Logger instance
		 */
		Logger log;

	private:
		/*
		 * Reads and loads one input Click configuration.
		 * It uses built-in Click methods and data structures linked with this file.
		 */
		short load_nf_configuration(std::string nf_source, unsigned short position);

		/*
		 * After loading all the NFs into the parser's memory, run a DFS visit per DAG
		 * to build the NF Synthesizer's graph.
		 */
		short build_nf_dag(unsigned short position);

		/*
		 * Visits recursively the Click DAG and returns the vector of Elements it contains
		 */
		Vector<Element*> visit_dag(unsigned short position);

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
};

#endif

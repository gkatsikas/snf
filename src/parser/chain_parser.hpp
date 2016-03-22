//============================================================================
//        Name: chain_parser.hpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: Class declaration for parsing Click configurations.
//============================================================================

#ifndef _CHAIN_PARSER_HPP_
#define _CHAIN_PARSER_HPP_

#include <unordered_map>

#include "../graph/nf_graph.hpp"
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
		ParserConfiguration *chain_graph;

		/*
		 * Maps the position of a NF in the chain with a Click Router object.
		 * The key is the position of the NF in the chain.
		 */
		NF_Map<Router*> nf_configuration;

		/*
		 * One DAG of Click elements per NF in the chain.
		 * The key is the position of the NF in the chain.
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
		short load_nf(
			const std::string &nf_name,
			const std::string &nf_source, 
			const unsigned short &position
		);

		/*
		 * After loading all the NFs into the parser's memory, run a DFS visit per DAG
		 * to build the NF Synthesizer's graph.
		 */
		short build_nf_dag(
			const std::string &nf_name,
			const unsigned short &position
		);

		/*
		 * After loading the Click elements into the DAG, we go back to the loaded topology and NFs (from property file)
		 * and verify whether the interfaces are correct. The property file interfaces must be included int the actual
		 * Click configuration, otherwise the synthesizer cannot assess the connectivity between two NFs.
		 */
		 short verify_and_connect_nfs(
		 	const std::string &nf_name,
		 	const unsigned short &position
		 );

		/*
		 * Given a position in the chain and an output interface, we want to find the Click element of the next NF in
		 * the chain. Essentially this function is a glue between two connected NFs.
		 */
		ElementVertex* find_input_element_of_nf(
			NFGraph *next_nf_graph,
			const std::string &target_interface
		);

		/*
		 * Assign IPMapper element to the appropriate IPRewriter.
		 * IPMapper elements are exceptional. They have no inputs and outputs but serve as inputs to IPRewriters.
		 */
		int associate_ip_mapper_to_rewriter(
			Router *router,
			const std::string &mapper_variable,
			const std::string &mapper_conf,
			std::vector<std::string> &implicit_conf,
			short &implicit_port
		);

		/*
		 * Visits recursively the Click DAG and returns the vector of Elements it contains.
		 * DEPRECATED from Click
		 */
		//Vector<Element*> visit_dag(unsigned short position);

	public:
		/*
		 * Public API for the Parser
		 */
		ChainParser (ParserConfiguration *pc);
		~ChainParser();

		/*
		 * Setters & Getters
		 */
		inline ParserConfiguration* get_chain_graph(void) { return this->chain_graph; };
		inline NF_Map<NFGraph*>     get_nf_graphs  (void) { return this->nf_dag;      };
		inline NFGraph*             get_nf_graph_at(const unsigned short &position) {
			return this->nf_dag[position];
		};

		/*
		 * A.
		 * Reads, verifies and loads the input Click configurations one-by-one.
		 * It belongs to the public API.
		 * It calls the private load_nf_configuration as many times an the number
		 * of input NFs that compose the chain.
		 */
		short load_nf_configurations(void);

		/*
		 * B.
		 * After passing the loading step above, we are ready to chain these configurations
		 * by linking leaf nodes with roots.
		 */
		short chain_nf_configurations(void);
};

#endif

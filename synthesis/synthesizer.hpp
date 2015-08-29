//============================================================================
//        Name: synthesizer.hpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: Class declaration for synthesizing Click configurations.
//============================================================================

#ifndef _SYNTHESIZER_HPP_
#define _SYNTHESIZER_HPP_

#include "../parser/chain_parser.hpp"

class Synthesizer {
	private:
		/*
		 * The object that provides the individual NF data structures
		 */
		ChainParser* parser;

		/*
		 * Logger instance
		 */
		Logger log;

	public:
		/*
		 * Public API for the Parser
		 */
		Synthesizer (ChainParser* cp);
		~Synthesizer();

		inline ChainParser* get_chain_parser(void) { return this->parser; };

		/*
		 * Traverse the NF DAGs, jump from NF to NF until you reach an
		 * endpoint. Along the way build the traffic classes required for
		 * the synthesis.
		 */
		short build_traffic_classes(void);

		/*
		 * Synthesis Core
		 * Traverse the traffic classes and eliminate redundancy by:
		 *   1. Removing unecessary I/O elements (the internal connecitons
		 *      between chained NFs).
		 *   2. Applying the chain-level classifiaction in one element (SINGLE READ)
		 *   3. Applying the chain-level packet operations in one or few elements (SINGLE WRITE)
		 */
		short eliminate_redundancy(void);

		/*
		 * Create a new Click configuration that implements the chain in one Click module.
		 * The configuration must achieve equivalent functionality with the initial one.
		 */
		short generate_equivalent_configuration(void);
};

void test_click_tree(void);

#endif

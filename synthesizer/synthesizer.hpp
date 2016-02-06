//============================================================================
//        Name: synthesizer.hpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: Class declaration for synthesizing Click configurations.
//============================================================================

#ifndef _SYNTHESIZER_HPP_
#define _SYNTHESIZER_HPP_

#include "synth_nat.hpp"

#include "../parser/chain_parser.hpp"
#include "../traffic_class_builder/filter.hpp"
#include "../traffic_class_builder/click_element.hpp"

struct ConsolidatedTc {
	std::string    m_outIface;
	std::string    m_operation;
	std::string    m_pattern;
	std::string    m_chain;
	unsigned short m_inputPort;
	std::string    m_nat;
	
	ConsolidatedTc ();
	ConsolidatedTc (const std::string& out_iface, const std::string& op, const std::string& chain);

	void        add_tc (const TrafficClass& tc);
	void        set_nat(std::shared_ptr<SynthesizedNat> nat, unsigned short input_port);
	std::string get_chain ();
};

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
		
		/*
		 * Generated traffic classes
		 */
		std::unordered_map< std::string, std::unordered_map<std::string, ConsolidatedTc> > tc_per_input_iface;
		std::unordered_map< std::string, std::shared_ptr<SynthesizedNat> > nat_per_output_iface;

		/*
		 * Genrate the synthesis as a combination of Intel-RSS rules for the NIC
		 * and Click code that runs per hardware queue.
		 */
		bool generate_hardware_classification;

		/*
		 * The filename where the generated Click code will be written
		 */
		std::string hyper_nf_soft_configuration_name;

		/*
		 * The filename where the generated Intel-RSS code will be written
		 */
		std::string hyper_nf_hrdw_configuration_name;

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

		
		short synthesize_nat(void);

		/*
		 * Generate a new configuration that depends on the user input.
		 * (A) Hardware-assisted, multi-core Hyper-NF
		 * If hardware classification is requested, generate two files: (a) an implementation of 
		 * the traffic classification in the NIC's language (Intel-RSS), and (b) a Click-DPDK configuration
		 * that schedules a multitude of threads (one per core) that handle different pieces of the header space.
		 * (B) All-in-Software Hyper-NF
		 * If hardware classification is not requested, generate a Click equivalent of the entire chain.
		 */
		short generate_equivalent_configuration(bool to_file=true);

		/*
		 * Generate a new Click configuration that implements the chain in one Click module.
		 * The configuration must achieve equivalent functionality with the initial one.
		 */
		short generate_all_soft_configuration(bool to_file=true);


		short generate_hw_assisted_soft_configuration(bool to_file=true);

		/*
		 * Test the traffic classes's construction
		 */
		void test_traffic_class_builder(void);
};

/*
 * Recursive DFS function to visit all vertices from 'vertex'.
 * The vertices can also belong to different graph, so in reality,
 * this is a recursive graph composition function.
 */
namespace TrafficBuilder {
	void traffic_class_builder_dfs(
		Graph* graph,
		NF_Map<NFGraph*> nf_chain,
		unsigned short nf_position,
		std::shared_ptr<ClickElement>,
		std::string nf_conf
	);
}

#endif

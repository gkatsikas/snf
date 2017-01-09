#ifndef _SYNTHESIZER_HPP_
#define _SYNTHESIZER_HPP_

/*
 * synthesizer.hpp
 * 
 * Class declaration for synthesizing chained Click configurations.
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

#include "stateful_synthesizer.hpp"

#include "../parser/chain_parser.hpp"
#include "../traffic_class_builder/filter.hpp"
#include "../traffic_class_builder/click_element.hpp"

struct ConsolidatedTc {

	std::string    m_nf_of_out_iface;
	std::string    m_out_iface;
	std::string    m_out_iface_conf;
	std::string    m_operation;
	std::string    m_pattern;
	// Elements between IPClassifier-IPSynthesizer
	// (usually none exists because they are all synthesized)
	std::string    m_interm_chain;
	unsigned short m_input_port;
	std::string    m_stateful;
	
	ConsolidatedTc();
	ConsolidatedTc(
		const std::string &nf_of_out_iface, const std::string &out_iface,
		const std::string &out_iface_conf,  const std::string &op,
		const std::string &chain
	);

	bool           add_tc(
		const TrafficClass       &tc,
		const TrafficClassFormat &tc_format
	);

	void           set_stateful_rewriter(
		std::shared_ptr<StatefulSynthesizer> st_synth,
		unsigned short input_port
	);

	unsigned short get_input_port(void);

	std::string    get_stateful_rewriter(
		const std::string &at_queue    = std::string(""),
		const bool        &with_inport = false
	);

	std::string    get_path_to_rewriter_after_classifier(
		const std::string &at_queue          = std::string(""),
		const bool        &with_the_rewriter = true
	);
};

class Synthesizer {

	private:
		/*
		 * Generated synthesized paths.
		 * A traffic class specification associated with an input interface.
		 * |--> {FromDevice --> IPClassifier --> IPSynthesizer} paths.
		 */
		std::unordered_map< std::string, std::unordered_map<std::string, ConsolidatedTc> > 
							tc_per_input_iface;

		/*
		 * A map of output interfaces associated with stateful rewrite operations.
		 * |--> {IPSynthesizer --> ToDevice} paths.
		 */
		std::map< std::string, std::shared_ptr<StatefulSynthesizer> > 
							st_oper_per_out_iface;
		/*
		 * The configuration of these interfaces
		 */
		std::unordered_map< std::string, std::string > 
							st_oper_per_out_iface_conf;

		/*
		 * The set of synthesized operations to be applied before leaving an
		 * interface
		 */
		std::unordered_map< std::string, std::string > 
							synth_oper_per_out_iface;

		/*
		 * A vector with the discrete interfaces of the final chain.
		 * E.g., (NF_1, nf1vif0)
		 */
		std::set < std::pair<std::string, std::string> > 
							snf_ifaces;

		/*
		 * A vector with the discrete interfaces of the final chain
		 * mapped to the actual NICs
		 * E.g., (NF_1, nf1vif0) --> NIC 0
		 */
		std::map < std::pair<std::string, std::string>, std::string >
							snf_ifaces_to_nics;

		/*
		 * Logger instance
		 */
		Logger              log;

		/*
		 * The object that provides the individual NF data structures
		 */
		ChainParser         *parser;

		/*
		 * If hardware_classification is set, one of the following formats are valid:
		 * |--> RSS-Hashing
		 * |--> FlowDirector
		 * |--> OpenFlow
		 * Otherwise, Click is the standard way.
		 */
		TrafficClassFormat  traffic_classification_format;

	public:
		/*
		 * Public API for the Synthesizer
		 */
		Synthesizer (ChainParser *cp);
		~Synthesizer();

		inline 
		std::unordered_map< std::string, std::unordered_map<std::string, ConsolidatedTc> > 
				get_tc_per_input_iface(void) {
			return this->tc_per_input_iface;
		};
		inline std::map< std::string, std::shared_ptr<StatefulSynthesizer> > 
				get_stateful_rewriter_per_output_iface(void) {
			return this->st_oper_per_out_iface;
		};
		inline std::string get_stateful_rewriter_per_output_iface_conf(
				const std::string &key) {
			return this->st_oper_per_out_iface_conf[key];
		};
		inline std::string get_synthesized_config_per_output_iface(
				const std::string &key) {
			return this->synth_oper_per_out_iface[key];
		};
		inline std::set < std::pair<std::string, std::string> > get_snf_ifaces(void) {
			return this->snf_ifaces;
		};
		inline std::map < std::pair<std::string, std::string>, std::string > 
				get_snf_ifaces_to_nics     (void) {
			return this->snf_ifaces_to_nics;
		};
		inline ChainParser* get_chain_parser(void) { return this->parser; };

		bool is_snf_iface (
			const std::string &nf, const std::string &iface
		);
		unsigned short get_snf_ifaces_no   (void);
		std::string    get_nic_of_snf_iface(
			std::pair<std::string, std::string> nf_iface
		);
		std::pair<std::string, std::string> get_snf_iface_of_nic(
			std::string nic			
		);

		void add_nic_of_snf_iface(
			std::pair<std::string, std::string> nf_iface, std::string nic
		);
		
		void print_snf_ifaces        (void);
		void print_snf_ifaces_to_nics(void);

		/*
		 * Traverse the NF DAGs, jump from NF to NF until you reach an
		 * endpoint. Along the way build the traffic classes required for
		 * the synthesis.
		 */
		bool build_traffic_classes     (void);

		/*
		 * Builds a path of elements per input-output interface pair
		 */
		bool synthesize_stateful       (void);


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
		Graph                         *graph,
		NF_Map<NFGraph*>              nf_chain,
		std::vector<unsigned short>   nfs_traversed,
		unsigned short                nf_position,
		std::shared_ptr<ClickElement> elem,
		std::string                   nf_conf
	);

	std::string retrieve_lb_patterns_from_st_element(
		ElementVertex *ev
	);

}

#endif

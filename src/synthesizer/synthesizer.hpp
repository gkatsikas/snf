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
	std::string    m_chain;
	unsigned short m_input_port;
	std::string    m_stateful;
	
	ConsolidatedTc();
	ConsolidatedTc(
		const std::string &nf_of_out_iface, const std::string &out_iface,
		const std::string &out_iface_conf,  const std::string &op,
		const std::string &chain
	);

	void           add_tc(
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
		 * The object that provides the individual NF data structures
		 */
		ChainParser *parser;

		/*
		 * Logger instance
		 */
		Logger log;
		
		/*
		 * Generated synthesized paths.
		 * A traffic class specification associated with an input interface.
		 * |--> {FromDevice --> IPClassifier --> IPRewriter} paths.
		 */
		std::unordered_map< std::string, std::unordered_map<std::string, ConsolidatedTc> > 
			tc_per_input_iface;

		/*
		 * A map of output interfaces associated with stateful rewrite operations.
		 * |--> {IPRewriter --> ToDevice} paths.
		 */
		std::unordered_map< std::string, std::shared_ptr<StatefulSynthesizer> > 
			st_oper_per_out_iface;
		/*
		 * The configuration of these interfaces
		 */
		std::unordered_map< std::string, std::string > 
			st_oper_per_out_iface_conf;

		/*
		 * A vector with the discrete interfaces of the final chain.
		 */
		std::set < std::pair<std::string, std::string> > 
			hyper_nf_ifaces;

		/*
		 * If hardware_classification is set, one of the following formats are valid:
		 * |--> RSS-Hashing
		 * |--> FlowDirector
		 * |--> OpenFlow
		 * Otherwise, Click is the standard way.
		 */
		TrafficClassFormat traffic_classification_format;

	public:
		/*
		 * Public API for the Synthesizer
		 */
		Synthesizer (ChainParser *cp);
		~Synthesizer();

		inline ChainParser* get_chain_parser(void) { return this->parser; };
		inline std::unordered_map< std::string, std::unordered_map<std::string, ConsolidatedTc> > 
				get_tc_per_input_iface(void) {
			return this->tc_per_input_iface;
		};
		inline std::unordered_map< std::string, std::shared_ptr<StatefulSynthesizer> > 
				get_stateful_rewriter_per_output_iface(void) {
			return this->st_oper_per_out_iface;
		};
		inline std::string get_stateful_rewriter_per_output_iface_conf(const std::string &key) {
			return this->st_oper_per_out_iface_conf[key];
		};
		inline std::set < std::pair<std::string, std::string> > get_hyper_nf_ifaces(void) {
			return this->hyper_nf_ifaces;
		};

		short get_hyper_nf_ifaces_no   (void);
		bool  is_hyper_nf_iface        (const std::string &nf, const std::string &iface);
		void  print_hyper_nf_ifaces    (void);

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
		unsigned short                nf_position,
		std::shared_ptr<ClickElement> elem,
		std::string                   nf_conf
	);
}

#endif

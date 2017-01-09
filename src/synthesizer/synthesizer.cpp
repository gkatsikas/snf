// -*- c-basic-offset: 4 -*-
/* synthesizer.cpp
 *
 * Combine read and write operations together to compose an optimized,
 * single-read single-write Click configuration.
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

#include "synthesizer.hpp"

#include "../shared/helpers.hpp"
#include "../traffic_class_builder/click_tree.hpp"
#include "../traffic_class_builder/output_class.hpp"
#include "../traffic_class_builder/click_element.hpp"

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Synthesis of ``Read'' operations
ConsolidatedTc::ConsolidatedTc()
	:
	m_nf_of_out_iface(),
	m_out_iface      (),
	m_out_iface_conf (),
	m_operation      (),
	m_pattern        (),
	m_interm_chain   (),
	m_input_port     (256),
	m_stateful       ()
{

}

ConsolidatedTc::ConsolidatedTc(
		const std::string &nf_of_out_iface, const std::string &out_iface,
		const std::string &out_iface_conf,  const std::string &op,
		const std::string &int_chain)
	:
	m_nf_of_out_iface(nf_of_out_iface),
	m_out_iface      (out_iface),
	m_out_iface_conf (out_iface_conf),
	m_operation      (op),
	m_interm_chain   (int_chain),
	m_input_port     (256)
{

}

bool
ConsolidatedTc::add_tc(const TrafficClass &tc, const TrafficClassFormat &tc_format)
{
	Logger m_lg(__FILE__);

	switch (tc_format) {

		case ClickIPClassifier:
		case RSSHashing:
			if( !this->m_pattern.empty() ) {
				this->m_pattern += " || ";
			}
			this->m_pattern += "(" + tc.to_ip_classifier_pattern() + ")";
			break;

		case FlowDirector:
			error_chatter(m_lg, "\tUnimplemented Traffic Class pattern: " + tc_to_label(tc_format));
			return TO_BOOL(CHAIN_SYNTHESIS_PROBLEM);
			//this->m_pattern = tc.to_flow_director_pattern();
			//break;

		case OpenFlow:
			error_chatter(m_lg, "\tUnimplemented Traffic Class pattern: " + tc_to_label(tc_format));
			return TO_BOOL(CHAIN_SYNTHESIS_PROBLEM);
			//this->m_pattern = tc.to_openflow_pattern();
			//break;

		default:
			error_chatter(m_lg, "\tUnknown Traffic Class pattern: " + tc_to_label(tc_format));
			return TO_BOOL(CHAIN_SYNTHESIS_PROBLEM);
	}

	return DONE;
}

void
ConsolidatedTc::set_stateful_rewriter(std::shared_ptr<StatefulSynthesizer> st_synth, unsigned short input_port)
{
	this->m_stateful = st_synth->get_name();
	this->m_input_port = input_port;
}

unsigned short
ConsolidatedTc::get_input_port(void)
{
	return this->m_input_port;
}

std::string
ConsolidatedTc::get_stateful_rewriter(const std::string &at_queue, const bool &with_inport)
{
	// Return the rewriter with its port
	if ( with_inport )
		return (boost::format("[%2d]%s%s") % this->m_input_port % this->m_stateful % at_queue ).str();
	// Or the rewriter only
	return (boost::format("%s%s") % this->m_stateful % at_queue ).str();
}

std::string
ConsolidatedTc::get_path_to_rewriter_after_classifier(const std::string &at_queue, const bool &with_the_rewriter)
{
	if ( with_the_rewriter )
		return this->m_interm_chain + this->get_stateful_rewriter(at_queue, true);
	return this->m_interm_chain;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////

Synthesizer::Synthesizer(ChainParser *cp)
	:
	tc_per_input_iface(), st_oper_per_out_iface(),
	st_oper_per_out_iface_conf(), snf_ifaces(),
	snf_ifaces_to_nics()
{
	this->log.set_logger_file(__FILE__);
	if ( !cp ) {
		FANCY_BUG(this->log, "\tSynthesizer: Invalid Parser object");
	}

	this->parser = cp;
	this->traffic_classification_format =
		this->parser->get_chain_graph()->get_properties()->get_traffic_classification_format();

	def_chatter(this->log, "\tSynthesizer constructed");
}

Synthesizer::~Synthesizer()
{
	delete this->parser;
	def_chatter(this->log, "\tSynthesizer deleted");
}

/*
 * Traverse the NF DAGs, jump from NF to NF until you reach an
 * endpoint. Along the way build the traffic classes required for
 * the synthesis.
 */
bool
Synthesizer::build_traffic_classes(void)
{
	info_chatter(this->log, "");
	info_chatter(this->log, "==============================================================================");
	info_chatter(this->log, "Build Traffic Classes ...");

	// The output format of a traffic class
	TrafficClassFormat tc_format = this->traffic_classification_format;

	// Get all NFs, one-by-one
	for ( Vertex *v : this->get_chain_parser()->get_chain_graph()->get_chain()->get_vertex_order() ) {
		// The node of this NF in the chain graph
		ChainVertex *cv = static_cast<ChainVertex*>(v);
		unsigned short nf_position = cv->get_position();

		// Vector that accumulates all the NFs seen across a path
		// so as to avoid looping around the chain forever.
		std::vector<unsigned short> nfs_traversed;
		nfs_traversed.push_back(nf_position);

		// The Click DAG of this NF
		NFGraph* nf_graph = this->get_chain_parser()->get_nf_graph_at(nf_position);
		if ( !nf_graph )
			return TO_BOOL(NO_MEM_AVAILABLE);

		// Display the NFs that interface with the real world, not the internal ones
		// Only these interfaces can give an end-to-end path throughout the chain.
		if ( nf_graph->get_endpoint_vertices(VertexType::Input).size() > 0 ) {
			info_chatter(this->log, "Network Function: " << cv->get_name());
		}

		// Get all the input entry points of this NF (if any)
		// From these points, we start building the traffic classes
		for ( auto &endpoint : nf_graph->get_endpoint_vertices(VertexType::Input) ) {
			std::string elem_name = endpoint->get_name();
			std::string elem_conf = endpoint->get_configuration();
			std::string interface = elem_conf.substr(0, elem_conf.find(","));

			def_chatter(this->log, "\t" << elem_name << "(" << interface << ")");

			// Go DFS until the end of life
			std::shared_ptr<ClickElement> ep( new ClickElement(endpoint) );
			TrafficBuilder::traffic_class_builder_dfs(
				this->get_chain_parser()->get_chain_graph()->get_chain(),
				this->get_chain_parser()->get_nf_graphs(),
				nfs_traversed,
				nf_position,
				ep,
				interface
			);

			// A chain interface in always internal, hence we keep only the externals;
			// Those are part of the final SNF configuration.
			if ( ! cv->has_chain_interface(interface) )
				this->snf_ifaces.insert( std::make_pair(cv->get_name(), interface) );

			std::string key = cv->get_name() + "-" + interface;
			ClickTree ct(ep);

			unsigned short all_tc = ct.get_traffic_classes().size();
			unsigned short discarded_tc = 0;

			// Create an array with all the traffic classes
			for (auto &tc : ct.get_traffic_classes()) {

				// A valid traffic class
				if ( ! tc.is_discarded() ) {
					std::string op_as_str = tc.get_operation().to_iprw_conf();
					debug_chatter(this->log, op_as_str);
					std::string snd_key = op_as_str+"\\"+tc.get_output_iface();
					debug_chatter(this->log, snd_key);
					if( this->tc_per_input_iface[key].find(snd_key) == this->tc_per_input_iface[key].end() ) {

						std::string nf_of_tc_out_iface = tc.get_nf_of_output_iface();
						std::string tc_out_iface = tc.get_output_iface();

						/*unsigned short direction;
						if ( is_snf_iface( nf_of_tc_out_iface, tc_out_iface) && (nf_of_tc_out_iface == "NF_1") ) {
							direction = 0;
						}
						else {
							direction = 1;
						}*/

						this->tc_per_input_iface[key][snd_key] = {
							nf_of_tc_out_iface,
							tc_out_iface,
							tc.get_output_iface_conf(),
							op_as_str,
							tc.post_routing_pipeline()
						};

						std::string out_nf_and_iface = nf_of_tc_out_iface + "-" + tc_out_iface;
						this->synth_oper_per_out_iface[out_nf_and_iface] = tc.post_routing_synthesis_configuration();

						info_chatter(this->log, "\t\tAdded traffic class towards " << tc_out_iface);
					}

					bool exit_status = this->tc_per_input_iface[key][snd_key].add_tc(tc, tc_format);
					if ( !exit_status ) {
						return exit_status;
					}
				}
				else
					discarded_tc++;
			}

			if ( discarded_tc == all_tc ) {
				warn_chatter(this->log, "\t\tNo way out from " << elem_name << "(" << interface << ")");
				warn_chatter(this->log, "\t\tIs behind proxy: " << ((ct.get_behind_proxy()) ? "True":"False"));
			}

			def_chatter(this->log, "");
		}
	}
	info_chatter(this->log, "==============================================================================");

	return DONE;
}

/*
 * Builds a path of elements per input-output interface pair.
 * Synthesizes ``Write'' operations by calling stateful_synthesizer.
 */
bool
Synthesizer::synthesize_stateful(void)
{
	for (auto &it : this->tc_per_input_iface) {
		for(auto &tc : it.second) {
			// The NF name with the output interface name is the combined key.
			std::string out_nf_and_iface = tc.second.m_nf_of_out_iface + "-" + tc.second.m_out_iface;

			// Create space for the path of elements and the interface's configuration
			if ( this->st_oper_per_out_iface.find(out_nf_and_iface) == this->st_oper_per_out_iface.end()) {
				this->st_oper_per_out_iface[out_nf_and_iface] = std::shared_ptr<StatefulSynthesizer> (
					new StatefulSynthesizer()
				);
				this->st_oper_per_out_iface_conf[out_nf_and_iface] = tc.second.m_out_iface_conf;
			}

			tc.second.set_stateful_rewriter(
				this->st_oper_per_out_iface[out_nf_and_iface],
				this->st_oper_per_out_iface[out_nf_and_iface]->add_traffic_class(tc.second, it.first)
			);
		}
	}

	def_chatter(this->log, "\tSuccessfully synthesized the NF chain");

	return DONE;
}

/*
 * Check whether an interface belongs to the interfaces' list of the final SNF chain.
 */
bool
Synthesizer::is_snf_iface(const std::string& nf, const std::string& iface)
{
	for (auto &it : this->snf_ifaces )
		if ( (it.first == nf) && (it.second == iface) )
			return true;
	return false;
}

/*
 * Get the number of interfaces of the final SNF chain.
 */
unsigned short
Synthesizer::get_snf_ifaces_no(void)
{
	return this->snf_ifaces.size();
}

/*
 * Given a SNF, retrieve the associated NIC.
 */
std::string
Synthesizer::get_nic_of_snf_iface(std::pair<std::string, std::string> nf_iface)
{
	if ( nf_iface.first.empty() || nf_iface.second.empty() ) return "";
	if ( exists_in_map(this->snf_ifaces_to_nics, nf_iface) )
		return this->snf_ifaces_to_nics[nf_iface];
	return "";
}

/*
 * Given a NIC of the system, retrieve the SNF iface associated with this NIC.
 */
std::pair<std::string, std::string>
Synthesizer::get_snf_iface_of_nic(std::string nic)
{
	if ( nic.empty() ) return std::make_pair("", "");
	for (auto &it : this->snf_ifaces_to_nics ) {
		if ( it.second == nic ) return it.first;
	}
	return std::make_pair("", "");
}

/*
 * Add a mapping of a pair of (NF_X, nfxvify) --> NIC
 */
void
Synthesizer::add_nic_of_snf_iface(std::pair<std::string, std::string> nf_iface, std::string nic)
{
	if ( nf_iface.first.empty() || nf_iface.second.empty() || nic.empty() ) return;
	this->snf_ifaces_to_nics[nf_iface] = nic;
}


/*
 * Print the interfaces (and NFs that possess those interfaces) of the final SNF chain.
 */
void
Synthesizer::print_snf_ifaces(void)
{
	for (auto &it __attribute__((unused)) : this->snf_ifaces ) {
		info_chatter (this->log, "\t[Network Function: "
			<< std::right << std::setw(5)  << it.first
			<< ", Iface: "
			<< std::right << std::setw(8) << it.second
		);
	}
}

/*
 * Print the (NF, interface) associated with the NICs of the final SNF chain.
 */
void
Synthesizer::print_snf_ifaces_to_nics(void)
{
	for (auto &it __attribute__((unused)) : this->snf_ifaces_to_nics ) {
		info_chatter (this->log, "\t[Network Function: "
			<< std::right << std::setw(5)  << it.first.first
			<< ", Iface: "
			<< std::right << std::setw(8) << it.first.second
			<< "] --> NIC: " << it.second
		);
	}
}

void
Synthesizer::test_traffic_class_builder(void)
{
	setvbuf(stdout, NULL, _IONBF, 0);

	std::string routing_table = "10/8 0,192.168.5/24 1,0/0 2";
	std::shared_ptr<ClickElement> lookup  (new ClickElement("RadixIPLookup",routing_table));

	std::string empty;
	std::shared_ptr<ClickElement> discard (new ClickElement("Discard", empty));

	std::shared_ptr<ClickElement> ttl     (new ClickElement("DecIPTTL", empty));

	std::string address = "192.10.0.1";
	std::shared_ptr<ClickElement> fixip   (new ClickElement("FixIPSrc", address ));

	//std::string rewrite = "- - 192.168.0.1 100-200# 0 1";
	//std::shared_ptr<ClickElement> iprewriter(new ClickElement(IPRewriter, rewrite));

	std::string filter = "allow src port 100-150";
	std::shared_ptr<ClickElement> ipfilter(new ClickElement("IPFilter", filter));

	//fixip->set_child(iprewriter,0);
	//iprewriter->set_child(ipfilter,0);
	fixip->set_child(ipfilter,0);
	ipfilter->set_child(ttl,0);
	lookup->set_child(ttl,2);
	ttl->set_child(discard,0);
	ClickTree tree(fixip);

	for (auto &it : tree.get_traffic_classes())
		std::cout<<it.to_str();
}

/*
 * Recursive DFS function to visit all vertices from 'vertex'.
 * The vertices can also belong to different graph, so in reality,
 * this is a recursive graph composition function.
 */
void
TrafficBuilder::traffic_class_builder_dfs(
	Graph                         *graph,
	NF_Map<NFGraph*>              nf_chain,
	std::vector<unsigned short>   nfs_traversed,
	unsigned short                nf_position,
	std::shared_ptr<ClickElement> elem,
	std::string                   nf_iface)
{
	Logger log(__FILE__);
	ElementVertex *nf_vertex = elem->get_ev();

	// Retrieve the appropriate adjacency list
	Graph::AdjacencyList adjacency_list = nf_chain[nf_position]->get_adjacency_list();

	// We reached an Output vertex and need to find for a connection with a following NF
	if ( adjacency_list.at(nf_vertex).size() == 0 ) {

		// Let's see who 's next
		unsigned short next_nf_position = nf_vertex->get_glue_nf_position();
		//warn_chatter(log, "\t\t Glue NF position " << next_nf_position);

		// We are looking for an endpoint Outpout element with different configuration (aka interface)
		// Otherwise a loop will be created
		if ( (nf_vertex->is_endpoint()) && (nf_vertex->get_interface() != nf_iface) ) {
			def_chatter(log, "\t\t ----->  ENDPOINT " << nf_vertex->get_name() << "(" << nf_vertex->get_interface() << ")");
			return;
		}
		// A way to continue in the chain.
		// Initial position must be always different from the next position
		// to avoid looping around the same NFs
		else if ( (! nf_vertex->is_endpoint()) && (nf_vertex->get_interface() != nf_iface) &&
			 !exists_in_vector(nfs_traversed, next_nf_position) ) {
			// Give me the 'good' paths
			if ( (nf_vertex->get_class() != "Discard") ) {
				std::string next_nf_iface = nf_vertex->get_glue_iface();

				// Change context, move to next graph
				// 1. Change adjacency list
				adjacency_list = nf_chain[next_nf_position]->get_adjacency_list();

				// 2. Change vertex pointer to the first element of the next NF
				bool found = false;
				for ( ElementVertex *input_elem : nf_chain[next_nf_position]->get_vertices_by_stage(VertexType::Input) ) {
					if ( input_elem->get_interface() == next_nf_iface ) {
						info_chatter  (log, "\t\t -----> JUMP FROM " << nf_vertex->get_name()
								<< "(" << nf_vertex->get_interface() << ")"
								<< " -----> TO " << input_elem->get_class()
								<<  "(" << input_elem->get_interface() << ")"
								<< ", Next Position: " << next_nf_position);
						nf_vertex = input_elem;
						found     = true;

						break;
					}
				}

				if ( !found )
					error_chatter(log, "\t\t Unable to find next jump");

				// 3. Change origin interface using the interface of the new vertex
				nf_iface = next_nf_iface;

				// 4. Change NF postion in the Chain DAG
				nf_position = next_nf_position;

				// 5. Add this NF to the list of traversed NFs so as not to come back again (for this path).
				nfs_traversed.push_back(next_nf_position);
			}
			// A path that leads to the cliff
			else {
				def_chatter(log, "\t\t ----->      DROP " << nf_vertex->get_name() << "("
									<< nf_vertex->get_interface() << ")");
			}
		}
		// Do not chain because a loop will be created
		else if ( (nf_vertex->get_interface() == nf_iface) || exists_in_vector(nfs_traversed, next_nf_position) ) {
			def_chatter(log, "\t\t ----->      LOOP " << nf_vertex->get_name() << "("
								<< nf_vertex->get_interface() << ")");
			return;
		}
		else {
			def_chatter(log, "\t\t ----->       BUG " << nf_vertex->get_name() << "("
								<< nf_vertex->get_interface() << ")");
			return;
		}
	}

	unsigned int count = 0;
	for ( auto &neighbour : adjacency_list.at(nf_vertex) ) {
		// A way to get an IPMapper's patterns when you encounter a stateful element
		//ElementVertex *ev = static_cast<ElementVertex*> (neighbour.second);
		//std::string lb_patterns = TrafficBuilder::retrieve_lb_patterns_from_st_element(ev);

		std::shared_ptr<ClickElement> child(
			new ClickElement( static_cast<ElementVertex*> (neighbour.second), neighbour.first )
		);
		child->set_nf_name( static_cast<ChainVertex*> (graph->get_vertex_by_position(nf_position))->get_name() );
		elem->set_child(child, count++);

		// Unvisited node --> recursion
		traffic_class_builder_dfs(graph, nf_chain, nfs_traversed, nf_position, child, nf_iface);
	}
}

std::string
TrafficBuilder::retrieve_lb_patterns_from_st_element(ElementVertex *ev)
{
	Logger log(__FILE__);
	std::string el_class = ev->get_class();

	if (	(el_class != std::string("IPAddrRewriter"))  || (el_class != std::string("IPAddrPairRewriter")) ||
			(el_class != std::string("IPRewriter"))      || (el_class != std::string("IPSynthesizer"))      ||
			(el_class != std::string("UDPRewriter"))     || (el_class != std::string("TCPRewriter"))        ||
			(el_class != std::string("ICMPPingRewriter")) ) {
		return "";
	}

	def_chatter(log, "\t\tFound: " << el_class);
	def_chatter(log, "\t\t\t with conf: " << ev->get_configuration());

	std::string patterns;
	for ( auto &pair : *(ev->get_implicit_configuration()) ) {
		def_chatter(log, "\t\t\t Port: " << pair.first << " maps to patterns: ");
		for ( auto &pattern : pair.second ) {
			def_chatter(log, "\t\t\t    " << pattern);
			patterns += pattern + "\n";
		}
	}

	return patterns;
}

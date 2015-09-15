//============================================================================
//        Name: synthesizer.cpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: Compose one Click configuration out of a chain of
//              Click configurations.
//============================================================================

#include "../helpers.hpp"
#include "synthesizer.hpp"

#include "../click_tree.hpp"
#include "../output_class.hpp"
#include "../click_element.hpp"

Synthesizer::Synthesizer(ChainParser* cp) : tc_per_input_iface(), nat_per_output_iface() {
	this->log.set_logger_file(__FILE__);
	if ( cp == NULL )
		throw std::runtime_error("Synthesizer: Invalid Parser object");
	this->parser = cp;
	log << debug << "Synthesizer constructed" << def << std::endl;
}

Synthesizer::~Synthesizer() {
	delete this->parser;
	log << debug << "Synthesizer deleted" << def << std::endl;
}

/*
 * Traverse the NF DAGs, jump from NF to NF until you reach an
 * endpoint. Along the way build the traffic classes required for
 * the synthesis.
 */
short Synthesizer::build_traffic_classes(void) {

	log << "" << std::endl;
	log << info << "==============================================================================" << def << std::endl;
	log << info << "Build Traffic Classes ..." << def << std::endl;

	// Get all NFs, one-by-one
	for ( Vertex* v : this->get_chain_parser()->get_chain_graph()->get_chain()->get_vertex_order() ) {
		// The node of this NF in the chain graph
		ChainVertex* cv = (ChainVertex*) v;
		unsigned short nf_position = cv->get_position();

		// The Click DAG of this NF
		NFGraph* nf_graph = this->get_chain_parser()->get_nf_graph_at(nf_position);
		if ( nf_graph == NULL )
			return NO_MEM_AVAILABLE;

		log << info << "Network Function: " << cv->get_name() << def << std::endl;

		// Get all the input entry points of this NF (if any)
		// From these points, we start building the traffic classes
		for ( auto& endpoint : nf_graph->get_endpoint_vertices(VertexType::Input) ) {
			std::string elem_name = endpoint->get_name();
			std::string elem_conf = endpoint->get_configuration();
			std::string interface = elem_conf.substr(0, elem_conf.find(","));

			log << "\t" << elem_name << "(" << interface << ")" << def << std::endl;

			// Go DFS until the end of life
			std::shared_ptr<ClickElement> ep(new ClickElement(endpoint));
			TrafficBuilder::traffic_class_builder_dfs(this->get_chain_parser()->get_chain_graph()->get_chain(),
									this->get_chain_parser()->get_nf_graphs(), nf_position, ep, interface);

			std::string key = cv->get_name()+","+interface;
			ClickTree ct (ep);
			std::cout<<"####################################################";
			std::cout<<"####################################################"<< std::endl;
			for (auto &it : ct.get_trafficClasses()) {
				if (!it.is_discarded ())/**/ { 
					tc_per_input_iface[key].push_back(it);
				}/**/
			}

			log << "" << def << std::endl;
		}
	}
	log << info << "==============================================================================" << def << std::endl;

	return SUCCESS;
}

short Synthesizer::synthesize_nat(void) {
	for (auto &it : tc_per_input_iface) {		
		for(auto &tc : it.second) {
					std::string out_iface = tc.get_outputIface();
			if (nat_per_output_iface.find(out_iface) == nat_per_output_iface.end()) {
				nat_per_output_iface[out_iface] = std::shared_ptr<SynthesizedNat> ( new SynthesizedNat() );
			}
			tc.set_nat(nat_per_output_iface[out_iface],
					nat_per_output_iface[out_iface]->add_traffic_class(tc,it.first));
		}
	}
	
	return SUCCESS;
}

/*
 * Create a new Click configuration that implements the chain in one Click module.
 * The configuration must achieve equivalent functionality with the initial one.
 */
short Synthesizer::generate_equivalent_configuration(void) {
	for (auto &it : tc_per_input_iface) {
		for (auto &tc: it.second) {
			std::cout<<it.first<<"-->["<<tc.get_natInputPort()<<"]"<<
						tc.get_nat()->get_name()<<"-->"<<tc.get_outputIface()<<"\n";
		}
	}

	return SUCCESS;
}

/*
 * Recursive DFS function to visit all vertices from 'vertex'.
 * The vertices can also belong to different graph, so in reality,
 * this is a recursive graph composition function.
 */
void TrafficBuilder::traffic_class_builder_dfs(Graph* graph, NF_Map<NFGraph*> nf_chain, unsigned short nf_position,
												std::shared_ptr<ClickElement> elem, std::string nf_iface) {

	Logger log(__FILE__);
	ElementVertex* nf_vertex = elem->get_ev();

	// Retrieve the appropriate adjacency list
	Graph::AdjacencyList adjacency_list = nf_chain[nf_position]->get_adjacency_list();

	// We reached an Output vertex and need to find for a conneciton with a following NF
	if ( adjacency_list.at(nf_vertex).size() == 0 ) {
		// We are looking for an endpoint Outpout element with different configuration (aka interface)
		// Otherwise a loop will be created
		if ( (nf_vertex->is_endpoint()) && (nf_vertex->get_interface() != nf_iface) ) {
			log << "\t\t ----->  ENDPOINT " << nf_vertex->get_name() << "(" << nf_vertex->get_interface() << ")" << def << std::endl;
			return;
		}
		// A way to continue in the chain
		else if ( (!nf_vertex->is_endpoint()) && (nf_vertex->get_interface() != nf_iface) ) {
			// Give me the 'good' paths
			if ( (nf_vertex->get_class() != "Discard") ) {
				unsigned short next_nf_position = nf_vertex->get_glue_nf_position();
				std::string next_nf_iface = nf_vertex->get_glue_iface();

				log << "\t\t -----> JUMP FROM " << nf_vertex->get_name() << "(" << nf_vertex->get_interface() << ")" << def << std::endl;
				//log << "\t\t -----> Next Pos: " << next_nf_position << " at iface " << next_nf_iface << def << std::endl;

				// Change context, move to next graph
				// 1. Change adjacency list
				adjacency_list = nf_chain[next_nf_position]->get_adjacency_list();

				// 2. Change vertex pointer to the first element of the next NF
				bool found = false;
				for ( ElementVertex* input_elem : nf_chain[next_nf_position]->get_vertices_by_stage(VertexType::Input) ) {
					if ( input_elem->get_interface() == next_nf_iface ) {
						nf_vertex = input_elem;
						found = true;
						log << "\t\t ----->        TO " << nf_vertex->get_class() <<  "(" << nf_vertex->get_interface() << ")" << def << std::endl;
						break;
					}
				}

				if ( !found ) {
					log << error << "\t\t Unable to find next jump " << def << std::endl;
				}

				// 3. Change origin interface using the interface of the new vertex
				nf_iface = next_nf_iface;

				// 4. Change NF postion in the Chain DAG
				nf_position = next_nf_position;
			}
			// A path that leads to the cliff
			else {
				log << "\t\t ----->      DROP " << nf_vertex->get_name() << "(" << nf_vertex->get_interface() << ")" << def << std::endl;
			}
		}
		// Do not chain because a loop will be created
		else if ( nf_vertex->get_interface() == nf_iface ) {
			log << "\t\t ----->      LOOP " << nf_vertex->get_name() << "(" << nf_vertex->get_interface() << ")" << def << std::endl;
			return;
		}
		else {
			log << "\t\t ----->       BUG " << nf_vertex->get_name() << "(" << nf_vertex->get_interface() << ")" << def << std::endl;
			return;
		}
	}

	int count = 0;
	for ( auto& neighbour : adjacency_list.at(nf_vertex) ) {

		// A way to get an IPMapper's patterns when you encounter IPRewriter
		ElementVertex* ev = (ElementVertex*) neighbour.second;
		if ( ev->get_name() == std::string("IPRewriter") ) {
			log << warn << "\t\tFound: " << ev->get_name() << def << std::endl;
			//log << warn << "\t\t\t with conf: " << ev->get_configuration() << def << std::endl;
			for (auto& pattern : ev->get_extra_configuration() ) {
				log << warn << "\t\t\t IPMapper Pattern: " << pattern << def << std::endl;
			}
		}

		std::shared_ptr<ClickElement> child(new ClickElement((ElementVertex*) neighbour.second, neighbour.first));
		child->set_nfName(((ChainVertex*) graph->get_vertex_by_position(nf_position))->get_name() );
		elem->set_child(child, count++);
		//log<< "\t\tCreated: "+child->to_str()<<std::endl;
		//log << "\t\t Child: " << ev->get_name() << def << std::endl;

		// Unvisited node --> recursion
		traffic_class_builder_dfs(graph, nf_chain, nf_position, child, nf_iface);
	}
}

void Synthesizer::test_traffic_class_builder(void) {
	setvbuf(stdout, NULL, _IONBF, 0);

	std::string routing_table = "10/8 0,192.168.5/24 1,0/0 2";
	std::shared_ptr<ClickElement> lookup (new ClickElement("RadixIPLookup",routing_table));

	std::string empty;
	std::shared_ptr<ClickElement> discard (new ClickElement("Discard", empty));

	std::shared_ptr<ClickElement> ttl (new ClickElement("DecIPTTL", empty));

	std::string address = "192.10.0.1";
	std::shared_ptr<ClickElement> fixip (new ClickElement("FixIPSrc", address ));

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

	for (auto &it : tree.get_trafficClasses()) {
		std::cout<<it.to_str();
	}
}

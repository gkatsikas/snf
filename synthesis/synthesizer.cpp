//============================================================================
//        Name: synthesizer.cpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: Compose one Click configuration out of a chain of 
//              Click configurations.
//============================================================================

#include "../helpers.hpp"
#include "synthesizer.hpp"

#include "../click_tree.hpp"
#include "../click_element.hpp"
#include "../output_class.hpp"

Synthesizer::Synthesizer(ChainParser* cp) {
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

		Graph::VertexMap<Colour> visited;

		// Get all the input entry points of this NF (if any)
		// From these points, we start building the traffic classes
		for ( auto& endpoint : nf_graph->get_endpoint_vertices(VertexType::Input) ) {
			std::string elem_name = endpoint->get_name();
			std::string elem_conf = endpoint->get_configuration();

			log << "\t" << elem_name << "(" << elem_conf << ")" << def << std::endl;

			Colour& colour = visited[endpoint];

			// This should never happen here because vertex has in degree 0
			assert (colour == White);

			// Not visited, go DFS
			TrafficBuilder::traffic_class_builder_dfs(this->get_chain_parser()->get_nf_graphs(), nf_position, endpoint, elem_conf, colour, visited);

			log << "" << def << std::endl;
		}

		log << "" << std::endl;
	}
	log << info << "==============================================================================" << def << std::endl;

	return SUCCESS;
}

/*
 * Synthesis Core
 * Traverse the traffic classes and eliminate redundancy by:
 *   1. Removing unecessary I/O elements (the internal connecitons
 *      between chained NFs).
 *   2. Applying the chain-level classifiaction in one element (SINGLE READ)
 *   3. Applying the chain-level packet operations in one or few elements (SINGLE WRITE)
 */
short eliminate_redundancy(void) {
	return SUCCESS;
}

/*
 * Create a new Click configuration that implements the chain in one Click module.
 * The configuration must achieve equivalent functionality with the initial one.
 */
short generate_equivalent_configuration(void) {
	return SUCCESS;
}

void test_click_tree(void) {
	setvbuf(stdout, NULL, _IONBF, 0);

	std::string routing_table = "10/8 0,192.168.5/24 1,0/0 2";
	std::shared_ptr<ClickElement> lookup (new ClickElement(RadixIPLookup,routing_table));

	std::string empty;
	std::shared_ptr<ClickElement> discard (new ClickElement(Discard, empty));

	std::shared_ptr<ClickElement> ttl (new ClickElement(DecIPTTL, empty));

	std::string address = "192.10.0.1";
	std::shared_ptr<ClickElement> fixip (new ClickElement(FixIPSrc, address ));

	std::string rewrite = "- - 192.168.0.1 100-200# 0 1";
	std::shared_ptr<ClickElement> iprewriter(new ClickElement(IPRewriter, rewrite));

	std::string filter = "allow src port 100-150";
	std::shared_ptr<ClickElement> ipfilter(new ClickElement(IPFilter, filter));

	fixip->set_child(iprewriter,0);
	iprewriter->set_child(ipfilter,0);
	ipfilter->set_child(ttl,0);
	lookup->set_child(ttl,2);
	ttl->set_child(discard,0);
	ClickTree tree(fixip);

	for (auto &it : tree.get_trafficClasses()) {
		std::cout<<it.to_str();
	}
}

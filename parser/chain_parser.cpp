//============================================================================
//        Name: chain_parser.cpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: Read a Click configuration and load it into a Graph.
//              Then compose multiple graphs to form chains.
//============================================================================

#include "../helpers.hpp"
#include "chain_parser.hpp"
#include "../configuration/parser_configuration.hpp"

#include <click/routervisitor.hh>

ChainParser::ChainParser(ParserConfiguration* pc) : chain_graph(pc) {
	this->log.set_logger_file(__FILE__);
	this->chain_length = this->chain_graph->get_graph()->get_vertices_no();

	if ( this->chain_length <= 0 ) {
		this->chain_graph = NULL;
		throw std::runtime_error("ChainParser: Invalid chain length");
	}
}

ChainParser::~ChainParser() {
	this->chain_graph = NULL;

	for ( auto& nf : this->nf_configuration )
		nf.second = NULL;
	this->nf_configuration.clear();

	for ( auto& tc : this->nf_traffic_classes )
		if ( !tc.second.empty() )
			tc.second.clear();
	this->nf_traffic_classes.clear();
}

/*
 * Reads and loads the input Click configurations one-by-one.
 * It belongs to the public API.
 * It calls the private load_nf_configuration as many times an the number
 * of input NFs that compose the chain.
 */
short ChainParser::load_chained_configuratios(void) {
	short exit_status = 0;

	// For each NF
	for (Vertex* v : this->chain_graph->get_graph()->get_chain_order() ) {
		// 1. Load its elements into a Click Router object
		exit_status = this->load_nf_configuration(v->get_source_code_path(), v->get_position());
		if ( exit_status != SUCCESS )
			exit(exit_status);

		// 2. Visit all the Click elements of the NF and build the synthesizer's tree
		exit_status = this->build_nf_tree(v->get_position());
		if ( exit_status != SUCCESS )
			exit(exit_status);

		std::cout << std::endl;
	}

	return SUCCESS;
}

/*
 * Reads and loads one input Click configuration.
 * It uses built-in Click methods and data structures linked with this file.
 */
short ChainParser::load_nf_configuration(std::string nf_source, unsigned short position) {
	log << warn << "\tLoading Click Configuration no" << position << ": " << nf_source << def << std::endl;

	Router* router = input_a_click_configuration(nf_source.c_str(), position);
	if ( router == NULL )
		exit(CLICK_PARSING_PROBLEM);
	log << info << "\tNetwork Function parsed successfully" << def << std::endl;

	// Insert this Router object into parser's memory
	this->nf_configuration[position] = std::move(router);
	log << info << "\tNetwork Function inserted into Parser's memory" << def << std::endl;

	return SUCCESS;
}

short ChainParser::build_nf_tree(unsigned short position) {
	int port = -1;

	// Get the specific Click NF object
	Router* router = this->nf_configuration[position];
	log << info << "\tNetwork Function " << position << " has " << router->nelements() << " elements" << def << std::endl;

	// A temporal memory to store the Click elements of a specific path
	Vector<Element*> path_elements;

	// Start from the first element of the graph
	Element* first = Router::element(router, 0);
	log << info << "\tFirst element is " << std::string(first->class_name()) << def << std::endl;

	// DEPRECATED but the only operational one
	if ( router->downstream_elements(first, port, NULL, path_elements) != SUCCESS ) {
	//if ( router->visit_downstream(first, port, &tracker) != SUCCESS ) {
		log << error << "\tError while traversing NF no " << position << " configuration" << def << std::endl;
		exit(FAILURE);
	}
	log << info << "\tNetwork Function is successfully traversed" << def << std::endl;
	log << info << "\tFound " << path_elements.size() << " elements" << def << std::endl;

	for ( Vector<Element*>::const_iterator i=path_elements.begin(); i!=path_elements.end(); ++i)
		log << info << "\t\tElement Found: " << (*i)->class_name() << def << std::endl;
	//for ( Element* e : tracker.elements() )
	//	log << info << "\t\tElement Found: " << e->class_name() << def << std::endl;

	return SUCCESS;
}

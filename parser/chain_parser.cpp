//============================================================================
//        Name: chain_parser.cpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: Read a Click configuration and load it into a Graph.
//              Then compose multiple graphs to form chains.
//============================================================================

#include "../helpers.hpp"
#include "chain_parser.hpp"

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

	for ( auto& conf : this->nf_configuration )
		conf.second = NULL;
	this->nf_configuration.clear();

	this->nf_dag.clear();

	/*for ( auto& tc : this->nf_traffic_classes )
		if ( !tc.second.empty() )
			tc.second.clear();
	this->nf_traffic_classes.clear();*/
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
	for (Vertex* v : this->chain_graph->get_graph()->get_vertex_order() ) {
		ChainVertex* cv = (ChainVertex*) v;

		// 1. Load its elements into a Click Router object
		exit_status = this->load_nf_configuration(cv->get_source_code_path(), cv->get_position());
		if ( exit_status != SUCCESS )
			exit(exit_status);

		// 2. Visit all the Click elements of the NF and build the synthesizer's graph
		exit_status = this->build_nf_dag(cv->get_position());
		if ( exit_status != SUCCESS )
			exit(exit_status);

		std::cout << "" << std::endl;
	}

	return SUCCESS;
}

/*
 * Reads and loads one input Click configuration.
 * It uses built-in Click methods and data structures linked with this file.
 */
short ChainParser::load_nf_configuration(std::string nf_source, unsigned short position) {
	log << warn << "Loading Click Configuration no" << position << ": " << nf_source << def << std::endl;

	Router* router = input_a_click_configuration(nf_source.c_str());
	if ( router == NULL )
		exit(CLICK_PARSING_PROBLEM);
	log << info << "Network Function " << position << " with " << router->nelements() << " elements parsed successfully" << def << std::endl;

	// Insert this Router object into parser's memory
	this->nf_configuration[position] = std::move(router);

	return SUCCESS;
}

short ChainParser::build_nf_dag(unsigned short position) {

	Router* router = this->nf_configuration[position];

	if ( router == NULL ) {
		log << error << "Network Function object is invalid" << def << std::endl;
		return CLICK_PARSING_PROBLEM;
	}

	// Create an empty Graph if does not exist
	if ( this->nf_dag[position] == NULL )
		this->nf_dag[position] = new NFGraph();
	NFGraph* nf_graph = this->nf_dag[position];

	// Store the Click elements after visiting the Click DAG
	//Vector<Element*> path_elements = this->visit_dag(position);

	for ( int i=0 ; i < router->nelements() ; i++ ) {
		Element* e = Router::element(router, i);

		// Turn this Click element into a DAG Vertex
		if ( !nf_graph->contains(i) ) {
			ElementVertex* u = new ElementVertex(e, e->class_name(), e->eindex());

			// Add this vertex to the NF DAG along with its neighbouring connections (vertices)
			try {
				nf_graph->add_vertex_and_neighbours(std::move(u));
			}
			catch (const std::exception& e) {
				log << error << "|--> " << e.what() << def << std::endl;
				exit(CLICK_PARSING_PROBLEM);
			}
		}
	}

	// The generated DAG should contain the same number of vertices with the Click configuration
	if ( nf_graph->get_vertices_no() != router->nelements() ) {
		delete nf_graph;
		return CLICK_PARSING_PROBLEM;
	}

	log << warn << "Network Function's DAG contains " << nf_graph->get_vertices_no() << " elements" << def << std::endl;
	nf_graph->print_adjacency_list();

	return SUCCESS;
}

/*Vector<Element*> ChainParser::visit_dag(unsigned short position) {

	// Storage to put the visited elements
	Vector<Element*> path_elements;

	Router*  router   = this->nf_configuration[position];
	if ( router == NULL )
		return path_elements;

	// When set to -1, it means that all ports will be searched
	int port = -1;

	// Start from the first element of the graph
	Element* first = Router::element(router, 0);

	if ( first == NULL ) {
		log << error << "\tError while traversing NF no " << position << " configuration" << def << std::endl;
		return path_elements;
	}
	path_elements.push_back(first);
	//log << info << "\tFirst element is " << std::string(first->class_name()) << def << std::endl;

	// DEPRECATED but the only operational one
	if ( router->downstream_elements(first, port, NULL, path_elements) != SUCCESS ) {
		log << error << "\tError while traversing NF no " << position << " configuration" << def << std::endl;
		return path_elements;
	}
	log << info << "\tNetwork Function is successfully traversed" << def << std::endl;
	log << info << "\tFound " << path_elements.size() << " elements" << def << std::endl;

	//for ( Vector<Element*>::const_iterator i=path_elements.begin(); i!=path_elements.end(); ++i)
	//	log << info << "\t\tElement Found: " << (*i)->class_name() << def << std::endl;

	return path_elements;
}
*/

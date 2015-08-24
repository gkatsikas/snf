//============================================================================
//        Name: chain_parser.cpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: Read a Click configuration and load it into a Graph.
//              Then compose multiple graphs to form chains.
//============================================================================

#include "../helpers.hpp"
#include "chain_parser.hpp"
//#include "../configuration/parser_configuration.hpp"

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

	for ( auto& dag : this->nf_configuration )
		delete dag.second;
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
		ParserVertex* pv = (ParserVertex*) v;

		// 1. Load its elements into a Click Router object
		exit_status = this->load_nf_configuration(pv->get_source_code_path(), pv->get_position());
		if ( exit_status != SUCCESS )
			exit(exit_status);

		// 2. Visit all the Click elements of the NF and build the synthesizer's tree
		exit_status = this->build_nf_tree(pv->get_position());
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
	log << info << "\tNetwork Function " << position << " parsed successfully" << def << std::endl;

	// Insert this Router object into parser's memory
	this->nf_configuration[position] = std::move(router);

	return SUCCESS;
}

short ChainParser::build_nf_tree(unsigned short position) {

	Router* router = this->nf_configuration[position];
	log << info << "\tNetwork Function " << position << " has " << router->nelements() << " elements" << def << std::endl;

	// Create an empty Graph
	if ( this->nf_dag[position] == NULL )
		this->nf_dag[position] = new Graph();

	Vector<Element*> input;
	Vector<Element*> output;
	Vector<Element*> processing;

	for ( int i=0 ; i < router->nelements() ; i++ ) {
		Element* e = Router::element(router, i);

		// This element has no input ports
		if ( e->ninputs() == 0 )
			input.push_back(e);
		// This element has no output ports
		else if ( e->noutputs() == 0 )
			output.push_back(e);
		// This element has both port types
		else
			processing.push_back(e);
	}
	log << info << "\t     Input elements[" << input.size() << "]" << def << std::endl;
	if ( this->update_dag(input, position) != SUCCESS )
		return FAILURE;

	log << info << "\t    Output elements[" << output.size() << "]" << def << std::endl;
	if ( this->update_dag(output, position) != SUCCESS )
		return FAILURE;

	log << info << "\tProcessing elements[" << processing.size() << "]" << def << std::endl;
	if ( this->update_dag(processing, position) != SUCCESS )
		return FAILURE;

	//this->nf_dag[position]->print_vertex_order();
	//this->nf_dag[position]->print_topological_sort();
	this->nf_dag[position]->print_adjacency_list();

	return SUCCESS;
}

short ChainParser::update_dag(Vector<Element*> element_class, unsigned short position) {

	if ( this->nf_dag[position] == NULL )
		return FAILURE;

	for ( Element* e : element_class ) {
		Vertex* u = new Vertex(e->class_name(), e->eindex());
		log << info << "\t\t" << e->class_name() << ": " << e->eindex() << ", " << def << std::endl;

		Element* neighbour = NULL;

		log << info << "\t\t\t has " << e->ninputs() << " input ports" << def << std::endl;
		// For each active input port
		for ( int i=0 ; i < e->ninputs() ; i++ ) {
			if ( e->input(i).active() ) {
				neighbour = e->input(i).element();
				// This element is not in the graph. A pair is composed
				if ( this->nf_dag[position]->get_vertex_by_position((unsigned short)neighbour->eindex()) == NULL ) {
					unsigned short p = (unsigned short) neighbour->eindex();
					Vertex* v = new Vertex(neighbour->class_name(), p);
					this->nf_dag[position]->add_edge(std::move(v), std::move(u));
				}
			}
		}

		log << info << "\t\t\t has " << e->noutputs() << " output ports" << def << std::endl;
		// For each active output port
		for ( int i=0 ; i < e->noutputs() ; i++ ) {
			if ( e->output(i).active() ) {
				neighbour = e->output(i).element();
				// This element is not in the graph. A pair is composed
				if ( this->nf_dag[position]->get_vertex_by_position(neighbour->eindex()) == NULL ) {
					unsigned short p = (unsigned short) neighbour->eindex();
					Vertex* v = new Vertex(neighbour->class_name(), p);
					this->nf_dag[position]->add_edge(std::move(u), std::move(v));
				}
			}
		}
	}
	return SUCCESS;
}

/*short ChainParser::build_nf_tree(unsigned short position) {
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

	return SUCCESS;
}
*/

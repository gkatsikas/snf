//============================================================================
//        Name: chain_parser.cpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: Read a Click configuration and load it into a Graph.
//              Then compose multiple graphs to form chains.
//============================================================================

#include "../helpers.hpp"
#include "chain_parser.hpp"
#include "../configuration/parser_configuration.hpp"

#include "/opt/click/include/click/routervisitor.hh"

ChainParser::ChainParser(ParserConfiguration* pc) {
	this->log.set_logger_file(__FILE__);
	this->chain_graph = pc;
	this->chain_length = this->chain_graph->get_graph()->get_vertices_no();
	// log << info << "Chain Length: " << this->chain_length << def << std::endl;
}

ChainParser::~ChainParser() {
	this->chain_graph = NULL;

	//for (auto& nf : this->nf_configuration) {
	//	delete nf.second;
	//}
	this->nf_configuration.clear();
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
		exit_status = this->load_nf_configuration(v->get_position(), v->get_source_code_path());
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
short ChainParser::load_nf_configuration(unsigned short position, std::string nf_source) {
	log << warn << "\tLoading Click Configuration no" << position << ": " << nf_source << def << std::endl;

	Router* router = input_a_click_configuration(nf_source.c_str());
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

	Router* router = this->nf_configuration[position];

	// 1. Get the root element of this NF
	Element* root = router->root_element();
	log << info << "\tRoot element is " << std::string(root->class_name()) << def << std::endl;
	log << info << "\tNF has " << router->nelements() << " elements" << def << std::endl;

	Element* first = Router::element(router, 0);
	log << info << "\tFirst element is " << std::string(first->class_name()) << def << std::endl;

	//Element* first = router->find("FromDevice", "router");
	//log << info << "\tFirst element is " << std::string(first->class_name()) << def << std::endl;

	//String s = Router::handler(root, "flatconfig")->call_read(root);
	//log << info << s.data() << def << std::endl;

	// 2. Create a router visitor object to be filled with the elements of the NF
	ElementTracker tracker(router);

	// Visit the elements downwards (Starting from the root)
	// Port set to -1 in order to visit all ports
	if ( router->visit(first, true, port, &tracker) != SUCCESS )
	//Vector<Element*> result;
	//if ( router->downstream_elements(first, port, NULL, result) != SUCCESS )
		log << error << "\tError while traversing NF no " << position << " configuration" << def << std::endl;
	log << info << "\tNetwork Function is successfully traversed" << def << std::endl;
	Vector<Element*> elements = tracker.elements();
	log << info << "\tFound " << tracker.size() << " elements" << def << std::endl;

	return SUCCESS;
}

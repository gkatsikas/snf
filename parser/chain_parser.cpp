//============================================================================
// Name        : chain_parser.cpp
// Copyright   : KTH ICT CoS Network Systems Lab
// Description : Read a Click configuration and load it into a Graph.
//               Then compose multiple graphs to form chains.
//============================================================================

#include "../helpers.hpp"
#include "chain_parser.hpp"
#include "../configuration/parser_configuration.hpp"
//#include "../click/click_parse_configuration.hpp"

ChainParser::ChainParser(ParserConfiguration* pc) {
	this->log.set_logger_file(__FILE__);
	this->chain_graph = pc;
	this->chain_length = this->chain_graph->get_graph()->get_vertices_no();
	log << info << "Chain Length: " << this->chain_length << def << std::endl;
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
		exit_status = this->load_nf_configuration(v->get_position(), v->get_source_code_path());
		if ( exit_status != SUCCESS )
			exit(exit_status);
		//Element *root = click_router->root_element();
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
	if ( !router ) {
		return CLICK_PARSING_PRBLEM;
	}
	this->nf_configuration[position] = std::move(router);
	log << "Router inserted" << std::endl;

	//Element *root = click_router->root_element();

	return SUCCESS;
}

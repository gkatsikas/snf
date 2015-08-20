//============================================================================
// Name        : chain_parser.cpp
// Copyright   : KTH ICT CoS Network Systems Lab
// Description : Read a Click configuration and load it into a Graph.
//               Then compose multiple graphs to form chains.
//============================================================================

//#include "../logger.hpp"
//#include "../helpers.hpp"
#include "chain_parser.hpp"
#include "../configuration/parser_configuration.hpp"

ChainParser::ChainParser(ParserConfiguration* pc) {
	this->log.set_logger_file(__FILE__);
	this->chain_graph = pc;
	this->chain_length = this->chain_graph->get_graph()->get_vertices_no();
	log << info << "Chain Length: " << this->chain_length << def << std::endl;
}

ChainParser::~ChainParser() {
	this->chain_graph = NULL;
}

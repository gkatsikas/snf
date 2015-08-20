//============================================================================
// Name        : vertex.cpp
// Copyright   : KTH ICT CoS Network Systems Lab
// Description : Implements a digraph vertex.
//============================================================================

#include "vertex.hpp"

Vertex::Vertex(std::string name, std::string path, unsigned short pos, unsigned short weight) :
	name(name), source_code_path(path), position(pos), weight(weight), file_handler(NULL) {
	this->file_handler = new FileT<std::ifstream>(path);
	//this->file_handler.set_file_name(path);
	this->log.set_logger_file(__FILE__);
}

Vertex::~Vertex() {
	delete this->file_handler;
}

Vertex& Vertex::operator=(Vertex& v) {
	// Avoid self-assignment
	if ( this != &v ) {
		this->name             = v.get_name();
		this->source_code_path = v.get_source_code_path();
		this->position         = v.get_position();
		this->weight           = v.get_weight();
	}
	return *this;
}

void Vertex::print_info(void) {
	log << info << "===============================================" << def << std::endl;
	log << info << "===     NF Name: " << this->name                 << def << std::endl;
	log << info << "=== NF Position: " << this->position             << def << std::endl;
	log << info << "=== Source Code: " << this->source_code_path     << def << std::endl;
	log << info << "===============================================" << def << std::endl;
}

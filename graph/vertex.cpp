//============================================================================
//        Name: vertex.cpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: Implements a digraph's vertex.
//============================================================================

#include "vertex.hpp"

Vertex::Vertex(std::string name, unsigned short pos, unsigned short weight) :
	name(std::move(name)), position(pos), weight(weight) {
	this->log.set_logger_file(__FILE__);
	//log << info << "\tVertex constructed" << def << std::endl;
}

Vertex::~Vertex() {
	//log << info << "\tVertex destroyed" << def << std::endl;
}

Vertex& Vertex::operator=(Vertex& v) {
	// Avoid self-assignment
	if ( this != &v ) {
		this->name     = v.get_name();
		this->position = v.get_position();
		this->weight   = v.get_weight();
	}
	return *this;
}

void Vertex::print_info(void) {
	log << info << "===     NF Name: " << this->name     << def << std::endl;
	log << info << "=== NF Position: " << this->position << def << std::endl;
}

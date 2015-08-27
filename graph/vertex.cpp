//============================================================================
//        Name: vertex.cpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: Implements a digraph's vertex.
//============================================================================

#include "vertex.hpp"

Vertex::Vertex(std::string name, unsigned short pos, VertexType t) :
	name(std::move(name)), position(pos), type(t) {
	this->log.set_logger_file(__FILE__);
	//log << info << "\tVertex constructed" << def << std::endl;
}

Vertex::~Vertex() {
	//log << info << "\tVertex destroyed" << def << std::endl;
}

Vertex::Vertex(const Vertex& v) {
	this->name     = v.get_name();
	this->position = v.get_position();
	this->type     = v.get_type();
}

Vertex& Vertex::operator=(Vertex& v) {
	if ( this != &v ) {
		this->name     = v.name;
		this->position = v.position;
		this->type     = v.type;
	}
	return *this;
}

void Vertex::print_info(void) {
	log << info << "===     NF Name: " << this->name     << def << std::endl;
	log << info << "=== NF Position: " << this->position << def << std::endl;
}

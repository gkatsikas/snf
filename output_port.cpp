#include <iostream> //cerr 

#include "output_port.hpp"

OutputPort::OutputPort (int port_nb) : m_portNumber(port_nb) {
	m_child=nullptr;
}

void OutputPort::add_filter (HeaderField field, Filter& filter) {
	if ( m_filter.find(field) != m_filter.end() ) {
		std::cerr << "[" << __FILE__ << ":" << __LINE__ <<"] Trying to add filter "
				"on already filtered field in OutputPort"<<std::endl;
		exit(1);
	}
	m_filter[field] = filter;
}

void OutputPort::add_field_op(const FieldOperation & field_op) {
	(this->m_operation).add_field_op(field_op);
}

void OutputPort::set_operation (const Operation & op) {
	this->m_operation = op;
}

void OutputPort::set_child ( ClickElement * child) {
	this->m_child = child;
}

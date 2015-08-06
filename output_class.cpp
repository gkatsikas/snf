#include "output_class.hpp"

#include <iostream> //cerr 
#include <cstdlib> //atoi

#include "helpers.hpp"

OutputClass::OutputClass (int port_nb) : m_portNumber(port_nb), m_child(nullptr) {
}

void OutputClass::add_filter (HeaderField field, Filter& filter) {
	if ( m_filter.find(field) != m_filter.end() ) {
		std::cerr << "[" << __FILE__ << ":" << __LINE__ <<"] Trying to add filter "
				"on already filtered field in OutputPort"<<std::endl;
		exit(1);
	}
	m_filter[field] = filter;
}

void OutputClass::add_field_op(const FieldOperation & field_op) {
	(this->m_operation).add_field_op(field_op);
}

void OutputClass::set_operation (const Operation & op) {
	this->m_operation = op;
}

void OutputClass::set_child (std::shared_ptr<ClickElement> child) {
	this->m_child = child;
}

OutputClass OutputClass::port_from_filter_rule (int port_nb, std::string& rule) {
	OutputClass port(port_nb);
	std::string action = rule.substr(0,rule.find(' '));
	
	if (action.compare("deny") == 0 || action.compare("drop") == 0) {
		port.set_child (ClickElement::get_discard_elem());
	}
	else if (action.compare("allow") !=0) {
		std::cerr << "[" << __FILE__ << ":" << __LINE__ <<"] Unknown action in "
				"IPFilter: "<<rule<<std::endl;
	}
	
	//TODO: keep going...
	
	return port;
}

OutputClass OutputClass::port_from_lookup_rule(std::string& rule) {
	std::vector<std::string> decomposed_rule = split(rule,' ');
	int nb_arg = decomposed_rule.size();
	if (nb_arg>3 || nb_arg<2) {
		std::cerr << "[" << __FILE__ << ":" << __LINE__ <<"] Wrong lookup format: "
			<<rule<<std::endl;
		exit(1);
	}
	
	uint32_t port_nb = atoi(decomposed_rule[nb_arg-1].c_str());
	std::vector<std::string> address_and_mask = split(decomposed_rule[0],'/');
	
	Filter f = Filter::get_filter_from_v4_prefix(aton(address_and_mask[0]), 
									atoi(address_and_mask[0].c_str()));
	//TODO HIERARCHICAL
	
	OutputClass port(port_nb);
	port.add_filter(ip_dst,f);
	return port;
}

std::shared_ptr<ClickElement> OutputClass::get_child() const {
	return m_child;
}

PacketFilter OutputClass::get_filter() const {
	return m_filter;
}

void OutputClass::set_filter(PacketFilter filter) {
	m_filter = filter;
}

const Operation& OutputClass::get_operation() const {
	return m_operation;
}

int OutputClass::get_portNumber() const {
	return m_portNumber;
}

void OutputClass::set_portNumber(int portNumber) {
	m_portNumber = portNumber;
}

#include <iostream> //cerr 
#include <cstdlib> //atoi

#include "output_port.hpp"

OutputPort::OutputPort (int port_nb) : m_portNumber(port_nb), m_child(nullptr) {
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

void OutputPort::set_child (std::shared_ptr<ClickElement> child) {
	this->m_child = child;
}

OutputPort OutputPort::port_from_filter_rule (int port_nb, std::string& rule) {
	OutputPort port(port_nb);
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

OutputPort OutputPort::port_from_lookup_rule(std::string& rule) {
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
	
	OutputPort port(port_nb);
	port.add_filter(ip_dst,f);
	return port;
}

#include <iostream>
#include <sstream>
#include <vector>
#include <cstdlib> //atoi
#include <climits>

#include "click_element.hpp"

#include "header_fields.hpp"
#include "operation.hpp"
#include "helpers.hpp"
#include "output_class.hpp"

//ClickElement class
std::string empty;
std::shared_ptr<ClickElement> ClickElement::discard_elem_ptr(new ClickElement(Discard_def,empty));

ClickElement::ClickElement ( ElementType type, std::string& configuration ) :
					m_type(type), m_configuration(configuration), m_nbPorts(0)
{
	switch (type) {
		case DecIPTTL:
			parse_dec_ttl_conf (configuration);
			break;
		case FixIPSrc:
			parse_fix_ip_src (configuration);
			break;
		case IPFilter:
			parse_ip_filter (configuration);
			break;
		case Discard:
		case Discard_def:
			break;
		case RadixIPLookup:
		case LinearIPLookup:
		case DirectIPLookup:
			parse_lookup_filter (configuration);
			break;
		default:
			std::cerr << "Unsupported Element"<<std::endl;
			exit(1);
	}
}

void ClickElement::set_child (std::shared_ptr<ClickElement> child, int port) {
	for (auto &it : m_outputPorts) {
		if (it.get_portNumber() == port) {
			it.set_child(child);
		}
		
	}
}


bool ClickElement::is_leaf() {
	return (m_nbPorts==0);
}

std::string ClickElement::get_configuration() const {
	return m_configuration;
}

int ClickElement::get_nbPorts() const {
	return m_nbPorts;
}

void ClickElement::set_nbPorts(int nbPorts) {
	m_nbPorts = nbPorts;
}

std::vector<OutputClass> ClickElement::get_outputPorts() const {
	return m_outputPorts;
}

ElementType ClickElement::get_type() const {
	return m_type;
}

void ClickElement::add_port (OutputClass & port) {
	this->m_outputPorts.push_back(port);
	this->m_nbPorts++;
}

std::shared_ptr<ClickElement> ClickElement::get_discard_elem () {
	return (ClickElement::discard_elem_ptr);
}

void ClickElement::parse_dec_ttl_conf (std::string& configuration) {
	if (configuration.size() != 0) {
		std::cerr << "Unsupported option in DecIPTTL: "<<configuration <<std::endl;
		exit(1);
	}
	
	FieldOperation ttl_op = {Translate, ip_TTL, 1};
	
	OutputClass port (0);
	Filter valid_ttl = Filter::get_range_filter(1,UINT_MAX);
	port.add_field_op(ttl_op);
	port.add_filter(ip_TTL,valid_ttl);
	
	this->add_port(port);
	
	//Drops dead packets
	OutputClass port1(1);
	Filter zero_ttl = Filter::get_equals_filter(0);
	port1.add_filter(ip_TTL, zero_ttl);
	port1.set_child(discard_elem_ptr);
	
	this->add_port(port1);
}

void ClickElement::parse_fix_ip_src (std::string& configuration) {
	std::vector<std::string> split_conf = split(configuration, ' ');
	
	uint32_t new_ip_value=0;
	
	FieldOperation fix_ip_src_op = {Write, ip_src, new_ip_value};
	OutputClass port(0);
		
	switch (split_conf.size()) {
		case 1:
			if (!is_ip4_prefix(configuration)) { goto fail; }
			new_ip_value = aton(configuration);
			break;
		case 2:
			if (split_conf[0].compare("IPADDR") !=0 || !is_ip4_prefix(split_conf[1], true) ) {
				goto fail;
			}
			new_ip_value = aton(split_conf[1]);
			break;
		default:
			goto fail;
	}
	
	fix_ip_src_op.m_value = new_ip_value;
	port.add_field_op(fix_ip_src_op);
	this->add_port(port);
	return;
	
fail:
	std::cerr<<"Wrong configuration for FixIPSrc element"<<std::endl;
	exit(1);
}

void ClickElement::parse_ip_filter (std::string& configuration) {
	std::vector<std::string> rules = split(configuration,',');
	for (uint32_t i=0; i<rules.size(); i++) {
		OutputClass port = OutputClass::port_from_filter_rule(i,rules[i]);
		this->add_port (port);
	}
}

void ClickElement::parse_lookup_filter(std::string& configuration) {
	std::vector<std::string> rules = split(configuration,',');
	for (auto &it : rules) {
		OutputClass port = OutputClass::port_from_lookup_rule(it);
		this->add_port(port);
	}
}


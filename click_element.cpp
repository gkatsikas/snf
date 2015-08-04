#include <iostream>
#include <sstream>
#include <vector>
#include <cstdlib> //atoi
#include <climits>

#include "click_element.hpp"
#include "output_port.hpp"
#include "operation.hpp"
#include "headerFields.hpp"

//HELPERS
std::vector<std::string> &split(const std::string &s, char delim, std::vector<std::string> &elems) {
    std::stringstream ss(s);
    std::string item;
    while (std::getline(ss, item, delim)) {
        elems.push_back(item);
    }
    return elems;
}


std::vector<std::string> split(const std::string &s, char delim) {
    std::vector<std::string> elems;
    split(s, delim, elems);
    return elems;
}

bool is_ip4_address (const std::string &address) {
	std::vector<std::string> split_address = split(address,'.');
	if (address.find_first_not_of(".0123456789") != std::string::npos 
				|| split_address.size() != 4) {
		return false;
	}
	for(int i=0; i<4; i++) {
		int temp = atoi (split_address[i].c_str());
		if ( temp > 255 ) {
			return false;
		}
	}
	return true;
}

uint32_t aton (const std::string &address, int ip_version) {
	if (ip_version != 4) {
		std::cerr << "IPv6 not supported yet" <<std::endl;
		exit(1);
	}

	uint32_t result = 0;
	std::vector<std::string> split_address = split(address,'.');
	
	for (int i=0; i<4; i++) {
		result <<= 8;
		result += atoi (split_address[i].c_str());
	}
	return result;
}


//ClickElement class
ClickElement ClickElement::discard_elem(Discard,(std::string&) "");

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

void ClickElement::add_port (OutputPort & port) {
	this->m_outputPorts.push_back(port);
	this->m_nbPorts++;
}

ClickElement& ClickElement::get_discard_elem () {
	return ClickElement::discard_elem;
}

void ClickElement::parse_dec_ttl_conf (std::string& configuration) {
	if (configuration.size() != 0) {
		std::cerr << "Unsupported option in DecIPTTL: "<<configuration <<std::endl;
		exit(1);
	}
	
	FieldOperation ttl_op = {Translate, ip_TTL, 1};
	
	OutputPort port (0);
	Filter valid_ttl = Filter::get_range_filter(1,UINT_MAX);
	port.add_field_op(ttl_op);
	port.add_filter(ip_TTL,valid_ttl);
	
	this->add_port(port);
	
	//Drops dead packets
	OutputPort port1(1);
	Filter zero_ttl = Filter::get_equals_filter(0);
	port1.add_filter(ip_TTL, zero_ttl);
	port1.set_child(&(ClickElement::get_discard_elem()));
	
	this->add_port(port1);
}

void ClickElement::parse_fix_ip_src (std::string& configuration) {
	std::vector<std::string> split_conf = split(configuration, ' ');
	
	uint32_t new_ip_value=0;
	
	FieldOperation fix_ip_src_op = {Write, ip_src, new_ip_value};
	OutputPort port(0);
		
	switch (split_conf.size()) {
		case 1:
			if (!is_ip4_address(configuration)) { goto fail; }
			new_ip_value = aton(configuration);
			break;
		case 2:
			if (split_conf[0].compare("IPADDR") !=0 || !is_ip4_address(split_conf[1]) ) {
				goto fail;
			}
			new_ip_value = aton(split_conf[1]);
			break;
		default:
			goto fail;
	}
	
	fix_ip_src_op.value = new_ip_value;
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
		OutputPort port = OutputPort::port_from_filter_rule(i,rules[i]);
		this->add_port (port);
	}
}

void ClickElement::parse_lookup_filter(std::string& configuration) {
	std::vector<std::string> rules = split(configuration,',');
	for (auto &it : rules) {
		OutputPort port = OutputPort::port_from_lookup_rule(it);
		this->add_port(port);
	}
}


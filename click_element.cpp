#include <iostream>
#include <sstream>
#include <vector>
#include <cstdlib> //atoi

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

static uint32_t aton (const std::string &address, int ip_version = 4 ) {
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


//ClickElementClass
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
		default:
			std::cerr << "Unsupported Element"<<std::endl;
			exit(1);
	}
}

void ClickElement::add_port (OutputPort & port) {
	this->m_outputPorts.push_back(port);
	this->m_nbPorts++;
}

void ClickElement::parse_dec_ttl_conf (std::string& configuration) {
	if (configuration.size() != 0) {
		std::cerr << "Unsupported option in DecIPTTL: "<<configuration <<std::endl;
		exit(1);
	}
	
	FieldOperation ttl_op = {Translate, ip_TTL, 1};
	
	OutputPort port (0);
	port.add_field_op(ttl_op);
	
	this->add_port(port);
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


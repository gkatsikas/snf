#ifndef CLICK_ELEMENT_HPP
#define CLICK_ELEMENT_HPP

#include <vector>
#include <string>
#include <unordered_map>
#include "element_type.hpp"

class OutputPort;

std::vector<std::string> split(const std::string &s, char delim);
bool is_ip4_address (const std::string &address);
uint32_t aton (const std::string &address, int ip_version = 4 );

//Abstract representation of a Click element
class ClickElement {
public:
	ClickElement (ElementType type, std::string& configuration);

	ElementType m_type;
	std::string m_configuration; //FIXME: is this really necessary?
	int m_nbPorts; //Number of output ports
	std::vector<OutputPort> m_outputPorts;
	
	static ClickElement& get_discard_elem ();
	
private:
	static ClickElement discard_elem;

	//Configuration string parsing functions:
	void parse_dec_ttl_conf (std::string& configuration);
	void parse_fix_ip_src (std::string& configuration);
	void parse_ip_filter(std::string& configuration);
	void parse_lookup_filter(std::string& configuration);
	
	void add_port (OutputPort & port);
};

#endif

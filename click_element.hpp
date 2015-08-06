#ifndef CLICK_ELEMENT_HPP
#define CLICK_ELEMENT_HPP

#include <vector>
#include <string>
#include <unordered_map>
#include <memory>
#include "element_type.hpp"

class OutputPort;

//Abstract representation of a Click element
class ClickElement {
public:
	ClickElement (ElementType type, std::string& configuration);
	
	void set_child (std::shared_ptr<ClickElement> child, int port);

	ElementType m_type;
	std::string m_configuration; //FIXME: is this really necessary?
	int m_nbPorts; //Number of output ports
	std::vector<OutputPort> m_outputPorts;
	
	static std::shared_ptr<ClickElement> get_discard_elem ();
	
private:
	static std::shared_ptr<ClickElement> discard_elem_ptr;

	//Configuration string parsing functions:
	void parse_dec_ttl_conf (std::string& configuration);
	void parse_fix_ip_src (std::string& configuration);
	void parse_ip_filter(std::string& configuration);
	void parse_lookup_filter(std::string& configuration);
	
	void add_port (OutputPort & port);
};

#endif

#ifndef CLICK_ELEMENT_HPP
#define CLICK_ELEMENT_HPP

#include <vector>
#include <string>
#include <unordered_map>
#include "headerFields.hpp"
#include "operation.hpp"
#include "filter.hpp"
#include "element_type.hpp"

class OutputPort;

//Abstract representation of a Click element
//TODO: Create class output_port and merge the vector inside
class ClickElement {
public:
	ElementType type;
	std::string configuration; //FIXME: is this really necessary?
	int nb_ports; //Number of output ports
	std::vector<OutputPort> output_ports;
};

void createElement(ClickElement* buffer, ElementType type, std::string conf);

#endif

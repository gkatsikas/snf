#ifndef OUTPUT_PORT_HPP
#define OUTPUT_PORT_HPP

#include "click_element.hpp"
#include "filter.hpp"

class OutputPort {
public:
	int m_portNumber;
	ClickElement m_child;
	Operation m_operation;
	PacketFilter m_filter;
};

#endif

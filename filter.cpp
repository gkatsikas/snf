#include "filter.hpp"

Filter& Filter::operator += (const Filter &rhs) {
	
	//TODO: implement that
	//Create subclasses of Filter per type?
	//Or simply add a vector for representing the list
	return *this;
}

TrafficClass & TrafficClass::operator= (const TrafficClass &rhs) {
	this-> m_filters = rhs.m_filters;
	this-> m_elementPath = rhs.m_elementPath;
	
	return *this;
}

void TrafficClass::addElement (const ClickElement &element, int port) {

	this->m_elementPath.push_back(element);

	if (port==-1) { //Last element of the chain -> no children
		return;
	}
	PacketFilter pf = element.port_to_filter[port];
	
	for (auto it = pf.begin(); it != pf.end(); ++it ) {
		HeaderField field = it->first;
		Filter filter = it->second;
		
		this->m_filters[field] += filter;
	}
}

#ifndef CLICK_ELEMENT_HPP
#define CLICK_ELEMENT_HPP

#include <vector>
#include <string>
#include <unordered_map>
#include "headerFields.hpp"

class Filter;
typedef std::unordered_map<HeaderField,Filter, std::hash<int> > PacketFilter;
#define for_fields_in_pf(it,pf) for (auto it=pf.begin(); it != pf.end(); ++it)

//List of allowed click elements
enum ElementType {
	IPClassifier,
	Discard,
	FromDevice,
	ToDevice
};

//Abstract representation of a Click element
/*
 	TODO: include filter<-->field mapping
 	One port can also filter on several fields
 	Two solutions:
 		one "field" element
*/
struct ClickElement {
	ElementType type;
	std::string configuration; //FIXME: is this really necessary?
	int nb_ports; //Number of output ports
	std::vector<PacketFilter> port_to_filter;
	std::vector<ClickElement> children;	
};

void createElement(ClickElement* buffer, ElementType type, std::string conf);

#endif

#ifndef FILTER_HPP
#define FILTER_HPP

#define MAX_UINT32 0xFFFFFFFF

#include <string>
#include <unordered_map>
#include "headerFields.hpp"
#include "click_element.hpp"


typedef unsigned int uint32_t;
typedef std::unordered_map<HeaderField,Filter, std::hash<int> > PacketFilter;

enum FilterType { //In order of generality
	Equals,
	List,
	Range
};

//Contains one field-specific filter
class Filter {
public:
	Filter () : m_type(Range), m_lowerLimit(0), m_upperLimit(MAX_UINT32) {};
	Filter (const ElementType &element, std::string configuration);
	Filter& operator+=(const Filter &rhs); //Intersects this and rhs
	bool is_in_filter (uint32_t value);

private:
	FilterType m_type;
	uint32_t m_lowerLimit;
	uint32_t m_upperLimit;

	void read_IPClassifier_conf(std::string configuration);
	void read_RadixLookup_conf(std::string configuration);
	void read_LinearLookup_conf(std::string configuration);
	void read_IPMapper_conf(std::string configuration);

};

//Class overlay for a collection of filters
class TrafficClass {

public:
	//Adds the element with output port port
	//-1 indicates no output port (end of chain)
	void addElement (const ClickElement &element, int port=-1);
	TrafficClass & operator= (const TrafficClass &rhs);

private:
	PacketFilter m_filters;
	//Path of the class in terms of elements
	std::vector<ClickElement> m_elementPath;
	
	void addFilter(Filter filter,HeaderField field);
};

#endif

#ifndef FILTER_HPP
#define FILTER_HPP

#define MAX_UINT32 0xFFFFFFFF

#include <string>
#include <unordered_map>
#include "headerFields.hpp"
#include "element_type.hpp"
#include "operation.hpp"

class ClickElement;

typedef unsigned int uint32_t;
#define in_range(x,lower,upper) (x>lower && x<upper)

enum FilterType { //By increasing generality
	None,
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
	bool match (uint32_t value) const;
	Filter translate(int value) const;
	
	FilterType m_type;
	uint32_t m_lowerLimit;
	uint32_t m_upperLimit;
	std::vector<uint32_t> m_allowedValues; 
	//This must be ordered during construction with std::sort

private:
	void read_IPClassifier_conf(std::string configuration);
	void read_RadixLookup_conf(std::string configuration);
	void read_LinearLookup_conf(std::string configuration);
	void read_IPMapper_conf(std::string configuration);
	
	//Intersect functions
	void intersect_equals (uint32_t value);
	void intersect_list(const std::vector<uint32_t>& list);
	void intersect_range (uint32_t lower, uint32_t upper);
	
	void update_type_from_list(const std::vector<uint32_t>& list);
	
	//Translate helpers
	void move_forward(uint32_t value);
	void move_backward(uint32_t value);
	
	//getters & setters
	FilterType get_type ();

};


typedef std::unordered_map<HeaderField, Filter, std::hash<int> > PacketFilter;
#define for_fields_in_pf(it,pf) for (auto it=pf->begin(); it != pf->end(); ++it)

//Class overlay for a collection of filters
class TrafficClass {

public:
	//Adds the element with output port port
	//-1 indicates no output port (end of chain)
	//Returns the number of updated filters that are equals to None
	int addElement (const ClickElement &element, int port=-1);
	TrafficClass & operator= (const TrafficClass &rhs);

private:
	PacketFilter m_filters;
	//Path of the class in terms of elements
	std::vector<ClickElement> m_elementPath;
	Operation m_operation;
	
	void addFilter(Filter filter,HeaderField field);
};

#endif

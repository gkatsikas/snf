#ifndef FILTER_HPP
#define FILTER_HPP

#define MAX_UINT32 0xFFFFFFFF

#include <string>
#include <unordered_map>
#include <memory>
#include <cstdint>
#include "element_type.hpp"
#include "operation.hpp"
#include "segment_list.hpp"

class ClickElement;

//Contains one field-specific filter
class Filter {
public:
	Filter ();
	Filter (HeaderField field);
	Filter (HeaderField field, uint32_t value);
	Filter (HeaderField field, uint32_t lower_value, uint32_t upper_value);

	static Filter get_filter_from_v4_prefix(HeaderField field, uint32_t value, uint32_t prefix);
	static Filter get_filter_from_ipclass_pattern(HeaderField field, std::string& args);
	
	void intersect (const Filter &filter); //Intersects this and rhs
	void unite (const Filter &filter);
	void differentiate (const Filter &filter);
	void translate(uint32_t value, bool forward=true);
	
	void make_none (); //Make this filter refuse all packets
	
	bool is_none () const; //Returns true if the filter refuses all packets
	bool match (uint32_t value) const;
	bool contains (const Filter& filter) const;

	HeaderField get_field() const;
	
	std::string to_str() const;

private:
	DisjointSegmentList m_filter;
	HeaderField m_field;
};


typedef std::unordered_map<HeaderField, Filter, std::hash<int> > PacketFilter;
#define for_fields_in_pf(it,pf) for (auto it=pf.begin(); it != pf.end(); ++it)

//Class overlay for a collection of filters
class TrafficClass {

public:
	//Adds the element with output port port
	//-1 indicates no output port (end of chain)
	//Returns the number of updated filters that are equals to None
	int addElement (std::shared_ptr<ClickElement> element, int port=-1);
	std::string to_str () const;

private:
	PacketFilter m_filters;
	PacketFilter m_writeConditions;
	
	//Path of the class in terms of elements
	std::vector<std::shared_ptr<ClickElement> > m_elementPath;
	Operation m_operation;
	
	void addFilter(Filter filter,HeaderField field);
	int intersect_filter(const Filter& filter);
	int intersect_condition (const Filter& condition);
};

#endif

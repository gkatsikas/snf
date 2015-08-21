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

		Filter& intersect (const Filter &filter); //Intersects this and rhs
		Filter& unite (const Filter &filter);
		Filter& differentiate (const Filter &filter);
		Filter& translate(uint32_t value, bool forward=true);

		bool operator== (const Filter& rhs) const;

		static Filter get_filter_from_v4_prefix(HeaderField field, uint32_t value, uint32_t prefix);
		static Filter get_filter_from_v4_prefix_str(HeaderField field, const std::string& prefix_as_str);
		static Filter get_filter_from_ipclass_pattern(HeaderField field, const std::string& args);
		static Filter get_filter_from_prefix_pattern(HeaderField field, const std::string& args);

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


class Condition { //FIXME: just inherit Filter?

public:
	Condition(HeaderField, std::shared_ptr<ClickElement>, Filter, FieldOperation);
	
	bool is_same_write(const FieldOperation&) const;
	bool intersect(const Filter&); //return true if condition is not empty
	std::string to_str() const;
	bool is_none() const;

private:
	HeaderField m_field;
	std::shared_ptr<ClickElement> m_element;
	Filter m_filter;
	FieldOperation m_currentWrite;
};

typedef std::unordered_map<HeaderField, Filter, std::hash<int> > PacketFilter;
typedef std::unordered_map<HeaderField, std::vector<Condition>, std::hash<int> > ConditionMap;
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
		ConditionMap m_writeConditions;

		//Path of the class in terms of elements
		std::vector<std::shared_ptr<ClickElement> > m_elementPath;
		Operation m_operation;

		void addFilter(Filter filter,HeaderField field);
		int intersect_filter(const Filter& filter);
		int intersect_condition (const Filter& condition, const FieldOperation& operation);
};

#endif

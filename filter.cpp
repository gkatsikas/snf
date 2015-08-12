#include <algorithm>  //std::set_intersection std::sort
#include <iostream> //std::cerr
#include <climits> //UINT_MAX
#include <cstdio>

#include "filter.hpp"
#include "click_element.hpp"
#include "output_class.hpp"

#define MIN(a,b) (a>b) ? b : a
#define MAX(a,b) (a>b) ? a : b

#define in_range(x,lower,upper) (x>=lower && x<=upper)
#define DEBUG(a) printf("[%s:%d] %s\n",__FILE__,__LINE__,a)

Filter::Filter() : Filter(unknown, 0, UINT32_MAX) {}

Filter::Filter(HeaderField field) : Filter(field, 0, UINT32_MAX) {}

Filter::Filter (HeaderField field, uint32_t lower_value, uint32_t upper_value) :
					m_filter(), m_field(field) {
	m_filter.add_segment(lower_value,upper_value);
}

Filter Filter::get_filter_from_v4_prefix(HeaderField field, uint32_t value, uint32_t prefix) {
	uint32_t translation = 32 - prefix;
	uint32_t lowerLimit = value & (0xffffffff << translation);
	uint32_t upperLimit = value | (0xffffffff >> prefix);
	
	return Filter(field, lowerLimit, upperLimit);
}

bool Filter::match(uint32_t value) const {
	return m_filter.contains(value);
}

bool Filter::contains (const Filter& filter) const{
	return m_filter.contains_seglist(filter.m_filter);
}

bool Filter::is_none() const {
	return m_filter.empty();
}

void Filter::translate(uint32_t value, bool forward) {
	m_filter.translate(value,forward);
}

//TODO: implement unite/differentiate
void Filter::unite (const Filter &filter) {
	m_filter.add_seglist(filter.m_filter);
}

void Filter::intersect (const Filter &filter) {
	m_filter.intersect_seglist(filter.m_filter);
}

void Filter::differentiate (const Filter& filter) {
	m_filter.substract_seglist(filter.m_filter);
}

void Filter::make_none () {
	this->m_filter = DisjointSegmentList();
}

std::string Filter::to_str () const{
	switch (m_field) {
		case ip_src:
		case ip_dst:
			return "Filter on "+headerFieldNames[m_field]+": "+m_filter.to_ip_str();
		default:
			return "Filter on "+headerFieldNames[m_field]+": "+m_filter.to_str();	
	}
}

HeaderField Filter::get_field() const{
	return this->m_field;
}

int TrafficClass::intersect_filter(const Filter& filter) {
	HeaderField field = filter.get_field();
	auto got=this->m_filters.find(field);
	if(got == this->m_filters.end()) {
		this->m_filters[field]=filter;
	}
	else {
		this->m_filters[field].intersect(filter);
	}
	
	return (int) (this->m_filters[field].is_none());
}

int TrafficClass::intersect_condition(const Filter& condition) {
	HeaderField field = condition.get_field();
	auto got=this->m_writeConditions.find(field);
	if(got == this->m_writeConditions.end()) {
		this->m_writeConditions[field]=condition;
	}
	else {
		this->m_writeConditions[field].intersect(condition);
	}
	
	return (int) (this->m_writeConditions[field].is_none());
}

int TrafficClass::addElement (std::shared_ptr<ClickElement> element, int port) {

	int nb_none_filters=0;
	(this->m_elementPath).push_back(element);


	if (port==-1) { //Last element of the chain -> no children
		return 0;
	}
	PacketFilter pf = (element->get_outputClasses()[port]).get_filter();
	
	for_fields_in_pf(it,pf) {
		HeaderField field = it->first;
		Filter filter = it->second;
		
		FieldOperation *field_op = this->m_operation.get_field_op(field);
		
		if (field_op) {
			uint32_t field_value = field_op->m_value[0];
			switch (field_op->m_type) {
				case Write:
					if (!filter.match(field_value)) {
						(this->m_filters[field]).make_none();
						nb_none_filters++;
					}
					break;
				case Translate: {
					Filter translated_filter = filter;
					if(field_value > 0) {
						translated_filter.translate(field_value,true);
					}else if(field_value < 0) {
						translated_filter.translate(-field_value,false);
					}
					
					nb_none_filters += intersect_filter(translated_filter);
					break;
				}
				case WriteRR:
				case WriteRa:
				case WriteSF: {
					Filter write_condition(field, field_op->m_value[0], field_op->m_value[1]);
					if (! filter.contains(write_condition)) {
						write_condition.intersect (filter);
						nb_none_filters += intersect_condition (write_condition);
						//FIXME: what if I have successive range writes?
					}
					break;
				}
				default:
					std::cerr<<"["<<__FILE__<<":"<<__LINE__<<"] Found non "
							"modifying operation"<<std::endl;
					exit(1);
				
			}
		}
		else {
			nb_none_filters+=intersect_filter(filter);
		}
	}

	this->m_operation.compose_op((element->get_outputClasses()[port]).get_operation());
	return nb_none_filters;
}

std::string TrafficClass::to_str() const {
	std::string output = "\n================= Begin Traffic Class =================\nFilters:\n";
	for_fields_in_pf(it,m_filters) {
		output += ("\t"+it->second.to_str()+"\n");
	}
	output += "Conditions on Write operations:\n";
	for_fields_in_pf(it,m_writeConditions) {
		output += ("\t"+it->second.to_str()+"\n");
	}
	output += m_operation.to_str();
	
	output += "Passed elements: \n\t";
	for (auto it : m_elementPath) {
		output += elementNames[it->get_type()];
		if (it->is_leaf()) {
			output+="\n";
		}
		else {
			output+="->";
		}
	}
	output += "=================  End Traffic Class  =================\n";
	return output;
}

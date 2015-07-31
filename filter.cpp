#include <algorithm>  //std::set_intersection std::sort

#include "filter.hpp"
#define for_allowed_values(it) for (auto it=m_allowedValues.begin() ; \
								it != m_allowedValues.end(); ++it)
#define MIN(a,b) (a>b) ? b : a
#define MAX(a,b) (a>b) ? a : b

//TODO: if output type is None print error message
Filter& Filter::operator += (const Filter &rhs) {
	
	FilterType rhs_type = rhs.m_type;

	switch (rhs_type) {
		case None :
			this->m_type=None;
			break;
		case Equals :
			this->intersect_equals(rhs.m_lowerLimit);
			break;
		case List :
			this->intersect_list(rhs.m_allowedValues);
			break;
		case Range:
			this->intersect_range(rhs.m_lowerLimit, rhs.m_upperLimit);
			break;
	}
	
	return *this;
}

void Filter::intersect_equals (uint32_t value) {
	switch (this->m_type) {
		case None:
			return;
		case Equals :
			if (this->m_lowerLimit != value) {
				this->m_type=None;
			}
			return;
		case List:
			for_allowed_values(it) {
				if (*it == value) {
					this->m_lowerLimit = this->m_upperLimit = value;
					this->m_type = Equals;
					return;
				}
			}
			this->m_type=None;
			return;
		case Range:
			if in_range(value,this->m_lowerLimit, this->m_upperLimit) {
				this->m_lowerLimit = this->m_upperLimit = value;
				this->m_type = Equals;
				return;
			}
			this->m_type=None;
			return;
	}
}

void Filter::intersect_list (const std::vector<uint32_t> &list) {

	switch (this->m_type) {
		case None:
			return;
		case Equals : {
			for (auto it=list.begin() ; it != list.end(); ++it) {
				if (*it == this->m_lowerLimit) { return; }
			}
			this->m_type=None;
			return;
		}
		case List: {
			std::vector<uint32_t> intersection(list.size());
			std::vector<uint32_t>::iterator it;
			it = std::set_intersection (list.begin(), list.end(), 
					this->m_allowedValues.begin(), this->m_allowedValues.end(), 
					intersection.begin() );
			this->m_allowedValues = intersection;
			this->update_type_from_list(intersection);		
			return;
		}
		case Range: {
			std::vector<uint32_t> temp;
			for (auto it=list.begin() ; it != list.end(); ++it) {
				if in_range(*it, this->m_lowerLimit, this->m_upperLimit) {
					temp.push_back(*it);
				}
			}
			this->m_allowedValues = temp;
			
			this->update_type_from_list(temp);
			return;
		}
	}
}

void Filter::intersect_range (uint32_t lower, uint32_t upper) {
	switch (this->m_type) {
		case None:
			return;
		case Equals :
			if (!in_range(this->m_lowerLimit,lower,upper)) {
				this->m_type = None;
			}
			return;
		case List : {
			std::vector<uint32_t> temp;
			for_allowed_values(it) {
				if in_range(*it, this->m_lowerLimit, this->m_upperLimit) {
					temp.push_back(*it);
				}
			}
			this->update_type_from_list(temp);
			return;
		}
		case Range : {
			this->m_lowerLimit = MAX(this->m_lowerLimit, lower);
			this->m_upperLimit = MIN(this->m_upperLimit, upper);
			if ( this->m_lowerLimit > this->m_upperLimit ) {
				this->m_type = None;
			}
			else if (this->m_lowerLimit == this->m_upperLimit) {
				this->m_type=Equals;
			}
			return;
		}
	}
}

void Filter::update_type_from_list(const std::vector<uint32_t>& list) {
	if(list.empty() ) { 
		this->m_type = None; 
	}
	else if (list.size() == 1) {
		this->m_type = Equals;
		this->m_lowerLimit = this->m_upperLimit = list[0];
	} 
	else {
		this->m_type = List;
	}
}

//Getters & Setters
FilterType Filter::get_type () { return this->m_type; }

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
	
	for_fields_in_pf(it,pf) {
		HeaderField field = it->first;
		Filter filter = it->second;
		
		this->m_filters[field] += filter;
	}
}

#include "segment_list.hpp"
#include <vector>
#include <iostream>

#define MIN(a,b) (a>b) ? b : a
#define MAX(a,b) (a>b) ? a : b

struct SegmentNode {
	uint32_t m_lowerLimit;
	uint32_t m_upperLimit;
	std::shared_ptr<SegmentNode> m_parent;
	std::shared_ptr<SegmentNode> m_child;
	
	SegmentNode (uint32_t lower, uint32_t upper);
	std::string to_str() ;
};

SegmentNode::SegmentNode (uint32_t lower, uint32_t upper) :
		m_lowerLimit(lower),m_upperLimit(upper), 
		m_parent(), m_child() {}
		
std::string SegmentNode::to_str () {
	return "["+std::to_string(m_lowerLimit)+","+
					std::to_string(m_upperLimit)+"]";
}

DisjointSegmentList::DisjointSegmentList () {}

DisjointSegmentList::DisjointSegmentList (const DisjointSegmentList& rhs) : m_head(copy_list(rhs.m_head) ) {};

DisjointSegmentList::~DisjointSegmentList () {
	if(m_head) { destroy_list(m_head); }
}

bool DisjointSegmentList::empty () { 
	return (bool) m_head;
}

bool DisjointSegmentList::contains (uint32_t value) {
	std::shared_ptr<SegmentNode> current_node = m_head;
	while (current_node) {
		if (value < current_node->m_lowerLimit) {
			return false;
		}
		else if (value <= current_node->m_upperLimit) {
			return true;
		}
		
		current_node = current_node->m_child;
	}
	return false;
}

void DisjointSegmentList::add_segment (uint32_t lower_limit, uint32_t upper_limit) {
	if(!m_head) {
		std::shared_ptr<SegmentNode> seg(new SegmentNode(lower_limit, upper_limit));
		m_head = seg;
		return;
	}
	
	std::shared_ptr<SegmentNode> current_parent(nullptr);
	std::shared_ptr<SegmentNode> current_child (m_head);
	
	//This puts us in front of all the stricly smaller segments
	while (current_child && lower_limit > current_child->m_upperLimit) {
		current_parent = current_child;
		current_child = current_child->m_child;
	}
	
	//We are past all the other segments
	//We can just insert a new one here
	if (!current_child) {
		std::shared_ptr<SegmentNode> seg(new SegmentNode(lower_limit, upper_limit));
		update_relation(current_parent,seg);
		return;
	}
	
	uint32_t new_minimum = MIN(lower_limit, current_child->m_lowerLimit);
	std::vector<std::shared_ptr<SegmentNode> > to_clean;
	uint32_t new_maximum = upper_limit;
	
	//We find all the segments that we intersect
	while (current_child && upper_limit >= current_child->m_lowerLimit) {
		new_maximum = MAX(upper_limit, current_child->m_upperLimit) ;
		to_clean.push_back(current_child);
		current_child = current_child->m_child;
	}
	
	std::shared_ptr<SegmentNode> seg(new SegmentNode(new_minimum, new_maximum));
	if(current_parent) {update_relation(current_parent,seg);}
	else {this->m_head = seg;} //If we have no parent we're the lowest one
	
	if(current_child) {	update_relation(seg,current_child); }
	//Reset pointers to delete objects
	for (auto &it : to_clean) { reset_node(it); }
}

void DisjointSegmentList::substract_segment (uint32_t lower_limit, uint32_t upper_limit ) {
	if(!m_head) { //There's nothing to substract from
		return;
	}
	
	std::shared_ptr<SegmentNode> current_parent(nullptr);
	std::shared_ptr<SegmentNode> current_child (m_head);

	//This puts us in front of all the stricly smaller segments
	while (current_child && lower_limit > current_child->m_upperLimit) {
		current_parent = current_child;
		current_child = current_child->m_child;
	}

	if (!current_child) { //All the segments are stricly smaller
		return;           //Nothing to do then
	}
	
	if (current_child->m_lowerLimit < lower_limit) { //Goes past the first segment
		std::shared_ptr<SegmentNode> new_parent (new SegmentNode(current_child->m_lowerLimit, lower_limit-1) );
		if(current_parent) {update_relation(current_parent,new_parent);}
		else{this->m_head = new_parent;}
		current_parent = new_parent;
	}
	
	std::vector<std::shared_ptr<SegmentNode> > to_clean;
	while (current_child && upper_limit >= current_child->m_upperLimit) {
		to_clean.push_back(current_child);
		current_child = current_child->m_child;
	}
	
	if (!current_child) {
		if(current_parent) {current_parent->m_child.reset();}
		else {this->m_head.reset();}
	}
	else {
		if (current_child->m_lowerLimit <= upper_limit) { //we are in the last segment
			current_child->m_lowerLimit = upper_limit+1;
		}
		if(current_parent) {update_relation(current_parent,current_child);}
		else {this->m_head = current_child;}
	}
	
	for (auto &it : to_clean) {reset_node(it);}
}

void DisjointSegmentList::intersect_segment (uint32_t lower_limit, uint32_t upper_limit) {
		
	std::shared_ptr<SegmentNode> current_node (m_head);

	//This puts us in front of all the stricly smaller segments
	while (current_node && lower_limit > current_node->m_upperLimit) {
		current_node = current_node->m_child;
	}

	if (!current_node) {
		destroy_list(this->m_head);
		return;
	}
	
	if(current_node->m_parent) { //removes leading segments if necessary
		(current_node->m_parent)->m_child.reset();
		current_node->m_parent.reset();
		destroy_list(this->m_head); //Destr
		this->m_head = current_node;
	}

	current_node->m_lowerLimit = MAX(lower_limit,current_node->m_lowerLimit);
	
	while(current_node->m_child && 
			upper_limit >= (current_node->m_child)->m_lowerLimit) { //Goes through all nodes that intersect
		current_node = current_node->m_child;
	}
	if(current_node->m_child) { //destroy trailing elements
		destroy_list(current_node->m_child);
	}
	
	current_node->m_upperLimit = MIN(upper_limit, current_node->m_upperLimit);
}

DisjointSegmentList& DisjointSegmentList::operator= (const DisjointSegmentList& rhs) {
	destroy_list(this->m_head);
	this->m_head = copy_list(rhs.m_head);

	return *this;
}

void DisjointSegmentList::update_relation(std::shared_ptr<SegmentNode> parent,
										  std::shared_ptr<SegmentNode> child) {

	parent->m_child	= child;
	child->m_parent = parent;
}

void DisjointSegmentList::reset_node(std::shared_ptr<SegmentNode> node) {
	node->m_parent.reset();
	node->m_child.reset();
	node.reset();
}

std::string DisjointSegmentList::to_str() {
	if (!m_head) { return "Empty list"; }
	
	std::string output;
	std::shared_ptr<SegmentNode> current_node = m_head;
	while (current_node) {
		output += current_node->to_str() + " ";
		current_node = current_node->m_child;
	}
	return output;
}

void DisjointSegmentList::destroy_list(std::shared_ptr<SegmentNode> node) {
	if(node) {
		if (node->m_child) {
			destroy_list(node->m_child);
		}
		reset_node(node);
	}
}

std::shared_ptr<SegmentNode> DisjointSegmentList::copy_list(std::shared_ptr<SegmentNode> old_list) {

	if(!old_list) {return std::shared_ptr<SegmentNode>();}

	std::shared_ptr<SegmentNode> new_list = std::shared_ptr<SegmentNode>(
												new SegmentNode(old_list->m_lowerLimit,
														old_list->m_upperLimit));
														
	std::shared_ptr<SegmentNode> new_child = copy_list(old_list->m_child);
	if (new_child) {update_relation (new_list,new_child);}
	return new_list;
}

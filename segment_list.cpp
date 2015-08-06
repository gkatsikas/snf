#include "segment_list.hpp"
#include <vector>
#include <iostream>

#define MIN(a,b) (a>b) ? b : a
#define MAX(a,b) (a>b) ? a : b

SegmentNode::SegmentNode (uint32_t lower, uint32_t upper) :
		m_lowerLimit(lower),m_upperLimit(upper), 
		m_parent(nullptr), m_child(nullptr) {}

DisjointSegmentList::DisjointSegmentList () {}

DisjointSegmentList::~DisjointSegmentList () {
	destroy_list(m_head);
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
	std::cout<<"line "<<__LINE__<<std::endl;
	
	std::shared_ptr<SegmentNode> current_parent(nullptr);
	std::shared_ptr<SegmentNode> current_child (m_head);
	
	//This puts us in front of all the stricly smaller segments
	while (current_child && lower_limit > current_child->m_upperLimit) {
		current_parent = current_child;
		current_child = current_child->m_child;
	}
	
	std::cout<<"line "<<__LINE__<<std::endl;
	
	//We are past all the other segments
	//We can just insert a new one here
	if (!current_child) {
		std::shared_ptr<SegmentNode> seg(new SegmentNode(lower_limit, upper_limit));
		update_relation(current_parent,seg);
		return;
	}
	
	std::cout<<"line "<<__LINE__<<std::endl;
	
	uint32_t new_minimum = MIN(lower_limit, current_child->m_lowerLimit);
	std::vector<std::shared_ptr<SegmentNode> > to_clean;
	uint32_t new_maximum = upper_limit;
	
	std::cout<<"line "<<__LINE__<<std::endl;
	
	//We find all the segments that we intersect
	while (current_child && upper_limit >= current_child->m_lowerLimit) {
		new_maximum = MAX(upper_limit, current_child->m_upperLimit) ;
		to_clean.push_back(current_child);
		current_child = current_child->m_child;
	}
	
	std::cout<<"line "<<__LINE__<<std::endl;
	
	std::shared_ptr<SegmentNode> seg(new SegmentNode(new_minimum, new_maximum));
	if(current_parent) {update_relation(current_parent,seg);}
	else {this->m_head = seg;} //If we have no parent we're the lowest one
	
	std::cout<<"line "<<__LINE__<<std::endl;
	
	if(current_child) {	update_relation(seg,current_child); }
	//Reset pointers to delete objects
	for (auto &it : to_clean) { reset_node(it); }
	
	std::cout<<"line "<<__LINE__<<std::endl;
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
		output += "["+std::to_string(current_node->m_lowerLimit)+","+
					std::to_string(current_node->m_upperLimit)+"] ";
		current_node = current_node->m_child;
	}
	return output;
}

void DisjointSegmentList::destroy_list(std::shared_ptr<SegmentNode> node) {
	if(node->m_child) {
		destroy_list(node->m_child);
		reset_node(node->m_child);
	}
}


int main() {
	DisjointSegmentList a;
	a.add_segment (5,10);
	a.add_segment (15,20);
	std::cout<<a.to_str()<<std::endl;
	a.add_segment(4,7);
	std::cout<<a.to_str()<<std::endl;
	a.add_segment(14,21);
	std::cout<<a.to_str()<<std::endl;
	a.add_segment(6,17);
	std::cout<<a.to_str()<<std::endl;
	a.add_segment(1,3);
	std::cout<<a.to_str()<<std::endl;
	a.add_segment(65,65);
	std::cout<<a.to_str()<<std::endl;
}

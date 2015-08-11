#include "segment_list.hpp"
#include <vector>
#include <iostream>

#define MIN(a,b) (a>b) ? b : a
#define MAX(a,b) (a>b) ? a : b

uint32_t safe_substract (uint32_t a, uint32_t b) {
	return ((b>a) ? 0 : a-b);
}

uint32_t safe_add (uint32_t a, uint32_t b) {
	return ((UINT32_MAX-b<a) ? UINT32_MAX : b+a);
}

typedef std::pair<uint32_t,uint32_t> Segment;

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

bool DisjointSegmentList::empty () const { 
	return !((bool) m_head);
}

bool DisjointSegmentList::contains (uint32_t value) const {
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
	std::shared_ptr<SegmentNode> seg (new SegmentNode(lower_limit, upper_limit));
	m_head=unify(m_head,seg);
}

void DisjointSegmentList::add_seglist (const DisjointSegmentList& rhs) {
	m_head = unify(m_head,rhs.m_head);
}

std::shared_ptr<SegmentNode> DisjointSegmentList::unify (
											std::shared_ptr<SegmentNode>& container,
											const std::shared_ptr<SegmentNode>& to_add) {
	
	if(!to_add) {
		return container;
	}
	
	uint32_t lower_limit = to_add->m_lowerLimit;
	uint32_t upper_limit = to_add->m_upperLimit;
	
						
	if(!container) {
		std::shared_ptr<SegmentNode> seg(new SegmentNode(lower_limit, upper_limit));
		return unify(seg,to_add->m_child);
	}
	
	std::shared_ptr<SegmentNode> current_parent;
	std::shared_ptr<SegmentNode> current_child = container;
	
	//This puts us in front of all the stricly smaller segments
	while (current_child && lower_limit > safe_add(current_child->m_upperLimit,1)) {
		current_parent = current_child;
		current_child = current_child->m_child;
	}
	
	//We are past all the other segments
	//We can just insert a new one here
	if (!current_child) {
		std::shared_ptr<SegmentNode> seg(new SegmentNode(lower_limit, upper_limit));
		seg=unify(seg,to_add->m_child);
		update_relation(current_parent,seg);
		return container;
	}

	uint32_t new_minimum = MIN(lower_limit, current_child->m_lowerLimit);
	
	std::vector<std::shared_ptr<SegmentNode> > to_clean;
	uint32_t new_maximum = upper_limit;
	
	//We find all the segments that we touch
	while (current_child && safe_add(upper_limit,1) >= current_child->m_lowerLimit) {
		new_maximum = MAX(upper_limit, current_child->m_upperLimit) ;
		to_clean.push_back(current_child);
		current_child = current_child->m_child;
	}
	
	//Reset pointers to delete objects
	for (auto &it : to_clean) { reset_node(it); }
	
	std::shared_ptr<SegmentNode> seg(new SegmentNode(new_minimum, new_maximum));

	if(current_child) {	update_relation(seg,current_child); }

	seg = unify(seg, to_add->m_child);
	
	if(current_parent) {update_relation(current_parent,seg);}
	else {return seg;} //If we have no parent we're the lowest one

	return container;
}

void DisjointSegmentList::substract_segment (uint32_t lower_limit, uint32_t upper_limit ) {
	m_head = differentiate(m_head,std::shared_ptr<SegmentNode>(
									new SegmentNode(lower_limit,upper_limit)));
}

void DisjointSegmentList::substract_seglist (const DisjointSegmentList& rhs) {
	m_head = differentiate(m_head,rhs.m_head);
}

std::shared_ptr<SegmentNode> DisjointSegmentList::differentiate(
									std::shared_ptr<SegmentNode>& container,
									const std::shared_ptr<SegmentNode>& to_substract) {
	if(!container || !to_substract) { //There's nothing to substract 
		return container;			  //or to substract from
	}
	
	std::shared_ptr<SegmentNode> current_parent;
	std::shared_ptr<SegmentNode> current_child = container;

	uint32_t lower_limit = to_substract->m_lowerLimit;
	uint32_t upper_limit = to_substract->m_upperLimit;

	//This puts us in front of all the stricly smaller segments
	while (current_child && lower_limit > current_child->m_upperLimit) {
		current_parent = current_child;
		current_child = current_child->m_child;
	}

	if (!current_child) { //All the segments are stricly smaller
		return container; //Nothing to do then
	}
	
	if (current_child->m_lowerLimit < lower_limit) { //Goes past the first segment
		std::shared_ptr<SegmentNode> new_parent (new SegmentNode(current_child->m_lowerLimit, lower_limit-1) );
		if(current_parent) {update_relation(current_parent,new_parent);}
		else{container = new_parent;}
		current_parent = new_parent;
		if(current_child->m_upperLimit > upper_limit) {
			current_child->m_lowerLimit = upper_limit+1;
		}
		else { current_child = current_child->m_child; }
	}
	
	std::vector<std::shared_ptr<SegmentNode> > to_clean;
	while (current_child && upper_limit >= current_child->m_upperLimit) {
		to_clean.push_back(current_child);
		current_child = current_child->m_child;
	}
	
	for (auto &it : to_clean) {reset_node(it);}
	
	current_child = differentiate(current_child,to_substract->m_child);
	if (!current_child) {
		if(current_parent) {current_parent->m_child.reset();}
		else return std::shared_ptr<SegmentNode>();
	}
	else {
		if (current_child->m_lowerLimit <= upper_limit) { //we are in the last segment
			current_child->m_lowerLimit = upper_limit+1;
		}
		if(current_parent) {update_relation(current_parent,current_child);}
		else {container = current_child;}
	}
	
	return container;
}

void DisjointSegmentList::intersect_segment (uint32_t lower_limit, uint32_t upper_limit) {
	std::shared_ptr<SegmentNode> seg (new SegmentNode(lower_limit, upper_limit));
	m_head=intersect(m_head,seg);
}

void DisjointSegmentList::intersect_seglist (const DisjointSegmentList& rhs) {
	m_head = intersect(m_head, rhs.m_head);
}

std::shared_ptr<SegmentNode> DisjointSegmentList::intersect (
									std::shared_ptr<SegmentNode>& container,
									const std::shared_ptr<SegmentNode>& to_intersect) {
									
	if (!container || !to_intersect) {
		destroy_list(container);
		return container;
	}
	
	uint32_t lower_limit = to_intersect->m_lowerLimit;
	uint32_t upper_limit = to_intersect->m_upperLimit;
	std::shared_ptr<SegmentNode> current_node = container;

	//This puts us in front of all the stricly smaller segments
	while (current_node && lower_limit > current_node->m_upperLimit) {
		current_node = current_node->m_child;
	}

	if (!current_node) {
		destroy_list(container);
		return std::shared_ptr<SegmentNode>();
	}
	
	if(current_node->m_parent) { //removes leading segments if necessary
		(current_node->m_parent)->m_child.reset();
		current_node->m_parent.reset();
		destroy_list(container); //Destr
		container = current_node;
	}

	current_node->m_lowerLimit = MAX(lower_limit,current_node->m_lowerLimit);
	
	while(current_node->m_child && 
			upper_limit >= (current_node->m_child)->m_lowerLimit) { //Goes through all nodes that intersect
		current_node = current_node->m_child;
	}
	
	uint32_t old_upper_lim = current_node->m_upperLimit;
	current_node->m_upperLimit = MIN(upper_limit, current_node->m_upperLimit);
	if (old_upper_lim > upper_limit+1) {
		std::shared_ptr<SegmentNode> grandchild = current_node->m_child;
		std::shared_ptr<SegmentNode> new_child (new SegmentNode(upper_limit+1,old_upper_lim));
		update_relation(current_node,new_child);
		if(grandchild) { update_relation(new_child,grandchild); }
	}

	std::shared_ptr<SegmentNode> new_child = intersect(current_node->m_child, to_intersect->m_child);
	if(!new_child) {
		current_node->m_child.reset();
	}
	else {
		update_relation(current_node, new_child);
	}
	return container;
}

DisjointSegmentList& DisjointSegmentList::operator= (const DisjointSegmentList& rhs) {
	destroy_list(this->m_head);
	this->m_head = copy_list(rhs.m_head);

	return *this;
}

void DisjointSegmentList::translate (uint32_t value, bool forward) {
	if (forward) {
		this->move_forward(value);
	}
	else {
		this->move_backwards(value);
	}
}

void DisjointSegmentList::move_forward (uint32_t value) {
	std::shared_ptr<SegmentNode> current_node = m_head;
	
	if(m_head && (UINT32_MAX-m_head->m_lowerLimit)<value) {destroy_list(m_head); m_head.reset(); return;}
	
	while (current_node && (UINT32_MAX-current_node->m_lowerLimit)>=value) {
		current_node->m_lowerLimit += value;
		current_node->m_upperLimit = safe_add(current_node->m_upperLimit,value);
		current_node = current_node->m_child;
	}
	
	if(!current_node) { return ; }
	else { destroy_list(current_node->m_child); }
}

void DisjointSegmentList::move_backwards (uint32_t value) {
	std::shared_ptr<SegmentNode> current_node = m_head;
	
	//Let's go past all the segments that are below value
	while (current_node && current_node->m_upperLimit < value) {
		current_node = current_node->m_child;
	}

	if (!current_node) { destroy_list (this->m_head); m_head.reset(); return;}

	if (current_node && current_node->m_parent) { // All the previous nodes are
		current_node->m_parent->m_child.reset();  // too small to be translated
		current_node->m_parent.reset();			  // so they must be destroyed
		destroy_list (this->m_head);
		this->m_head = current_node;
	}

	current_node->m_lowerLimit= safe_substract(current_node->m_lowerLimit,value);
	
	current_node->m_upperLimit -= value;
	current_node = current_node->m_child;

	while(current_node) {
		current_node->m_lowerLimit -= value;
		current_node->m_upperLimit -= value;
		current_node=current_node->m_child;
	}
}

void DisjointSegmentList::update_relation(std::shared_ptr<SegmentNode> parent,
										  std::shared_ptr<SegmentNode> child) {

	parent->m_child	= child;
	child->m_parent = parent;
}

void DisjointSegmentList::reset_node(std::shared_ptr<SegmentNode>& node) {
	node->m_parent.reset();
	node->m_child.reset();
	node.reset();
}

std::string DisjointSegmentList::to_str() const {
	if (!m_head) { return "Empty list"; }
	
	std::string output;
	std::shared_ptr<SegmentNode> current_node = m_head;
	while (current_node) {
		output += current_node->to_str() + " ";
		current_node = current_node->m_child;
	}
	return output;
}

std::vector<Segment > DisjointSegmentList::get_segments() const {
	std::vector<Segment> output;
	std::shared_ptr<SegmentNode> current_node = m_head;
	while (current_node) {
		Segment p(current_node->m_lowerLimit,current_node->m_upperLimit);
		output.push_back(p);
		current_node = current_node->m_child;
	}
	
	return output;
}

void DisjointSegmentList::destroy_list(std::shared_ptr<SegmentNode>& node) {
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

//#define TEST
#ifdef TEST
int main() {
	DisjointSegmentList a;
	a.add_segment(10,20);
	a.add_segment (35,42);
	a.substract_segment(34,35);
	DisjointSegmentList c=a;
	DisjointSegmentList b;
	b.add_segment(5,13);
	b.add_segment(20,36);
	b.add_segment(42,47);
	std::cout<<a.to_str()<<std::endl;
	a.intersect_seglist(b);
	std::cout<<a.to_str()<<std::endl;
	a.intersect_seglist(c);
	std::cout<<a.to_str()<<std::endl;
}
#endif

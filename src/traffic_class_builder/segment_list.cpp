// -*- c-basic-offset: 4 -*-
/* segment_list.cpp
 *
 * Implementation of a disjoint list of segments to be used for
 * the construction of complex traffic class filters.
 *
 * Copyright (c) 2015-2016 KTH Royal Institute of Technology
 * Copyright (c) 2015-2016 Georgios Katsikas, Marcel Enguehard
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>
 */

#include <vector>
#include <iostream>

#include "segment_list.hpp"
#include "../shared/helpers.hpp"

// The logger of this module
Logger sg_log(__FILE__);

#define MIN(a,b) (a>b) ? b : a
#define MAX(a,b) (a>b) ? a : b

uint32_t
safe_substract(uint32_t a, uint32_t b)
{
	return ((b>a) ? 0 : a-b);
}

uint32_t
safe_add(uint32_t a, uint32_t b)
{
	return ((UINT32_MAX - b < a) ? UINT32_MAX : b + a);
}

typedef std::pair<uint32_t,uint32_t> Segment;

struct SegmentNode {
	uint32_t                     m_lowerLimit;
	uint32_t                     m_upperLimit;
	std::shared_ptr<SegmentNode> m_parent;
	std::shared_ptr<SegmentNode> m_child;

	SegmentNode (uint32_t lower, uint32_t upper);
	bool operator==(const SegmentNode &node) const;
	bool operator!=(const SegmentNode &node) const;
	std::string to_str   (void);
	std::string to_ip_str(void);
};

SegmentNode::SegmentNode(uint32_t lower, uint32_t upper)
	: m_lowerLimit(lower), m_upperLimit(upper), m_parent(), m_child()
{

}

std::string
SegmentNode::to_str(void)
{
	return "[" + std::to_string(this->m_lowerLimit) + ", " +
		 std::to_string(this->m_upperLimit) + "]";
}

std::string
SegmentNode::to_ip_str(void)
{
	return "[" + ntoa(this->m_lowerLimit) + ", " + ntoa(this->m_upperLimit) + "]";
}

bool
SegmentNode::operator==(const SegmentNode& node) const
{
	return (
		// Bounds must agree
		(this->m_upperLimit == node.m_upperLimit) &&
		(this->m_lowerLimit == node.m_lowerLimit) &&
		(	// Either none of them has a child
			(!this->m_child && !node.m_child) ||
			(	// Or both have children that are equal
				this->m_child && node.m_child &&
				*(this->m_child) == *(node.m_child)
			)
		)
	);
}

bool
SegmentNode::operator!=(const SegmentNode &node) const
{
	return !(*this == node);
}

DisjointSegmentList::DisjointSegmentList() {}

DisjointSegmentList::DisjointSegmentList(const DisjointSegmentList &rhs)
	: m_head(copy_list(rhs.m_head) ) {}

DisjointSegmentList::~DisjointSegmentList()
{
	if (m_head) {
		destroy_list(this->m_head);
	}
}

bool
DisjointSegmentList::empty(void) const
{
	return !((bool) this->m_head);
}

bool
DisjointSegmentList::contains(uint32_t value) const
{
	std::shared_ptr<SegmentNode> current_node = this->m_head;

	while (current_node) {
		if (value < current_node->m_lowerLimit) {
			return false;
		} else if (value <= current_node->m_upperLimit) {
			return true;
		}
		current_node = current_node->m_child;
	}
	return false;
}

bool
DisjointSegmentList::contains_segment(uint32_t lower_limit, uint32_t upper_limit) const
{
	std::shared_ptr<SegmentNode> seg (new SegmentNode(lower_limit, upper_limit));
	return include(m_head, seg);
}

bool
DisjointSegmentList::contains_seglist(const DisjointSegmentList &rhs) const
{
	return include(m_head, rhs.m_head);
}

bool
DisjointSegmentList::include(
	const std::shared_ptr<SegmentNode> &container,
 	const std::shared_ptr<SegmentNode> &containee)
{

	if (!containee) {
		return true;
	} else if (!container) {
		return false;
	}

	uint32_t lower_limit = containee->m_lowerLimit;
	uint32_t upper_limit = containee->m_upperLimit;

	std::shared_ptr<SegmentNode> current_seg = container;
	while (current_seg && lower_limit > current_seg->m_upperLimit) {
		current_seg = current_seg->m_child;
	}

	return (
		current_seg &&
		lower_limit >= current_seg->m_lowerLimit &&
		upper_limit <= current_seg->m_upperLimit &&
		include(current_seg, containee->m_child)
	);
}

void
DisjointSegmentList::add_segment(uint32_t lower_limit, uint32_t upper_limit)
{
	std::shared_ptr<SegmentNode> seg (new SegmentNode(lower_limit, upper_limit));
	m_head = unify(m_head, seg);
}

void
DisjointSegmentList::add_seglist(const DisjointSegmentList &rhs)
{
	m_head = unify(m_head, rhs.m_head);
}

std::shared_ptr<SegmentNode>
DisjointSegmentList::unify(std::shared_ptr<SegmentNode> &container, const std::shared_ptr<SegmentNode> &to_add)
{
	if (!to_add) {
		return container;
	}

	uint32_t lower_limit = to_add->m_lowerLimit;
	uint32_t upper_limit = to_add->m_upperLimit;

	if (!container) {
		std::shared_ptr<SegmentNode> seg(new SegmentNode(lower_limit, upper_limit));
		return unify(seg, to_add->m_child);
	}

	std::shared_ptr<SegmentNode> current_parent;
	std::shared_ptr<SegmentNode> current_child = container;

	// This puts us in front of all the stricly smaller segments
	while (current_child && lower_limit > safe_add(current_child->m_upperLimit, 1)) {
		current_parent = current_child;
		current_child = current_child->m_child;
	}

	// We are past all the other segments, we can just insert a new one here
	if (!current_child) {
		std::shared_ptr<SegmentNode> seg(new SegmentNode(lower_limit, upper_limit));
		seg=unify(seg,to_add->m_child);
		update_relation(current_parent, seg);
		return container;
	}

	uint32_t new_minimum = MIN(lower_limit, current_child->m_lowerLimit);

	std::vector<std::shared_ptr<SegmentNode> > to_clean;
	uint32_t new_maximum = upper_limit;

	// We find all the segments that we touch
	while (current_child && safe_add(upper_limit, 1) >= current_child->m_lowerLimit) {
		new_maximum = MAX(upper_limit, current_child->m_upperLimit) ;
		to_clean.push_back(current_child);
		current_child = current_child->m_child;
	}

	// Reset pointers to delete objects
	for (auto &it : to_clean) {
		reset_node(it);
	}

	std::shared_ptr<SegmentNode> seg(new SegmentNode(new_minimum, new_maximum));

	if (current_child) {
		update_relation(seg, current_child);
	}

	seg = unify(seg, to_add->m_child);

	if (current_parent) {
		update_relation(current_parent, seg);
	} else {
		// If we have no parent we're the lowest one
		return seg;
	}

	return container;
}

void
DisjointSegmentList::substract_segment(uint32_t lower_limit, uint32_t upper_limit)
{
	m_head = differentiate(
		m_head,
		std::shared_ptr<SegmentNode>(
			new SegmentNode(lower_limit, upper_limit)
		)
	);
}

void
DisjointSegmentList::substract_seglist(const DisjointSegmentList &rhs)
{
	m_head = differentiate(m_head, rhs.m_head);
}

std::shared_ptr<SegmentNode>
DisjointSegmentList::differentiate(
	std::shared_ptr<SegmentNode> &container,
	const std::shared_ptr<SegmentNode> &to_substract)
{
	// There's nothing to substract or to substract from
	if (!container || !to_substract) {
		return container;
	}

	std::shared_ptr<SegmentNode> current_parent;
	std::shared_ptr<SegmentNode> current_child = container;

	uint32_t lower_limit = to_substract->m_lowerLimit;
	uint32_t upper_limit = to_substract->m_upperLimit;

	// This puts us in front of all the stricly smaller segments
	while (current_child && lower_limit > current_child->m_upperLimit) {
		current_parent = current_child;
		current_child = current_child->m_child;
	}

	// All the segments are stricly smaller means no more work
	if (!current_child) {
		return container;
	}

	// Goes past the first segment
	if (current_child->m_lowerLimit < lower_limit) {
		std::shared_ptr<SegmentNode> new_parent (
			new SegmentNode(current_child->m_lowerLimit, lower_limit-1)
		);

		if (current_parent) {
			update_relation(current_parent,new_parent);
		} else {
			container = new_parent;
		}

		current_parent = new_parent;
		if (current_child->m_upperLimit > upper_limit) {
			current_child->m_lowerLimit = upper_limit+1;
		} else {
			current_child = current_child->m_child;
		}
	}

	std::vector<std::shared_ptr<SegmentNode> > to_clean;
	while (current_child && upper_limit >= current_child->m_upperLimit) {
		to_clean.push_back(current_child);
		current_child = current_child->m_child;
	}

	for (auto &it : to_clean) {
		reset_node(it);
	}

	current_child = differentiate(current_child, to_substract->m_child);
	if (!current_child) {
		if(current_parent) {
			current_parent->m_child.reset();
		} else {
			return std::shared_ptr<SegmentNode>();
		}
	} else {
		// We are in the last segment
		if (current_child->m_lowerLimit <= upper_limit) {
			current_child->m_lowerLimit = upper_limit+1;
		}
		if (current_parent) {
			update_relation(current_parent, current_child);
		} else {
			container = current_child;
		}
	}

	return container;
}

void
DisjointSegmentList::intersect_segment(uint32_t lower_limit, uint32_t upper_limit)
{
	std::shared_ptr<SegmentNode> seg (new SegmentNode(lower_limit, upper_limit));
	m_head = intersect(m_head, seg);
}

void
DisjointSegmentList::intersect_seglist(const DisjointSegmentList &rhs)
{
	m_head = intersect(m_head, rhs.m_head);
}

std::shared_ptr<SegmentNode>
DisjointSegmentList::intersect(
	std::shared_ptr<SegmentNode> &container,
	const std::shared_ptr<SegmentNode> &to_intersect)
{
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

	if (!current_node || upper_limit < current_node->m_lowerLimit) {
		destroy_list(container);
		return std::shared_ptr<SegmentNode>();
	}

	// Removes leading segments if necessary
	if (current_node->m_parent) {
		(current_node->m_parent)->m_child.reset();
		current_node->m_parent.reset();
		destroy_list(container);
		container = current_node;
	}

	current_node->m_lowerLimit = MAX(lower_limit, current_node->m_lowerLimit);

	//Goes through all nodes that intersect
	while (current_node->m_child &&
		upper_limit >= (current_node->m_child)->m_lowerLimit) {
		current_node = current_node->m_child;
	}

	uint32_t old_upper_lim = current_node->m_upperLimit;
	current_node->m_upperLimit = MIN(upper_limit, current_node->m_upperLimit);
	if (old_upper_lim > upper_limit + 1) {
		std::shared_ptr<SegmentNode> grandchild = current_node->m_child;
		std::shared_ptr<SegmentNode> new_child (new SegmentNode(upper_limit+1, old_upper_lim));
		update_relation(current_node,new_child);
		if (grandchild) {
			update_relation(new_child, grandchild);
		}
	}

	std::shared_ptr<SegmentNode> new_child = intersect(current_node->m_child, to_intersect->m_child);
	if (!new_child) {
		current_node->m_child.reset();
	} else {
		update_relation(current_node, new_child);
	}

	return container;
}

DisjointSegmentList &
DisjointSegmentList::operator= (const DisjointSegmentList &rhs)
{
	destroy_list(this->m_head);
	this->m_head = copy_list(rhs.m_head);

	return *this;
}

bool
DisjointSegmentList::operator== (const DisjointSegmentList &rhs) const
{
	return *(this->m_head) == *(rhs.m_head);
}

bool
DisjointSegmentList::operator!= (const DisjointSegmentList &rhs) const
{
	return !(*this == rhs);
}

void
DisjointSegmentList::translate(uint32_t value, bool forward)
{
	if (forward) {
		this->move_forward(value);
	} else {
		this->move_backwards(value);
	}
}

void
DisjointSegmentList::move_forward(uint32_t value)
{
	std::shared_ptr<SegmentNode> current_node = m_head;

	if (m_head && (UINT32_MAX-m_head->m_lowerLimit)<value) {
		destroy_list(m_head);
		this->m_head.reset();
		return;
	}

	while (current_node && (UINT32_MAX-current_node->m_lowerLimit)>=value) {
		current_node->m_lowerLimit += value;
		current_node->m_upperLimit = safe_add(current_node->m_upperLimit, value);
		current_node = current_node->m_child;
	}

	if (!current_node) {
		return;
	}

	destroy_list(current_node->m_child);
}

void
DisjointSegmentList::move_backwards(uint32_t value)
{
	std::shared_ptr<SegmentNode> current_node = m_head;

	// Let's go past all the segments that are below value
	while (current_node && current_node->m_upperLimit < value) {
		current_node = current_node->m_child;
	}

	if (!current_node) {
		destroy_list (this->m_head);
		this->m_head.reset();
		return;
	}

	// All the previous nodes are too small to be translated, so they must be destroyed
	if (current_node && current_node->m_parent) {
		current_node->m_parent->m_child.reset();
		current_node->m_parent.reset();
		destroy_list (this->m_head);
		this->m_head = current_node;
	}

	current_node->m_lowerLimit= safe_substract(current_node->m_lowerLimit, value);

	current_node->m_upperLimit -= value;
	current_node = current_node->m_child;

	while (current_node) {
		current_node->m_lowerLimit -= value;
		current_node->m_upperLimit -= value;
		current_node=current_node->m_child;
	}
}

void
DisjointSegmentList::update_relation(
	std::shared_ptr<SegmentNode> parent, std::shared_ptr<SegmentNode> child)
{
	parent->m_child	= child;
	child->m_parent = parent;
}

void
DisjointSegmentList::reset_node(std::shared_ptr<SegmentNode> &node)
{
	node->m_parent.reset();
	node->m_child.reset();
	node.reset();
}

std::string
DisjointSegmentList::to_str(void) const
{
	if (!m_head) {
		return "Empty list";
	}

	std::string output;
	std::shared_ptr<SegmentNode> current_node = m_head;
	while (current_node) {
		output += current_node->to_str() + " ";
		current_node = current_node->m_child;
	}
	return output;
}

std::string
DisjointSegmentList::to_ip_str(void) const
{
	if (!m_head) {
		return "Empty list";
	}

	std::string output;
	std::shared_ptr<SegmentNode> current_node = m_head;
	while (current_node) {
		output += current_node->to_ip_str() + " ";
		current_node = current_node->m_child;
	}
	return output;
}

std::vector<Segment>
DisjointSegmentList::get_segments(void) const
{
	std::vector<Segment> output;
	std::shared_ptr<SegmentNode> current_node = m_head;
	while (current_node) {
		Segment p(current_node->m_lowerLimit,current_node->m_upperLimit);
		output.push_back(p);
		current_node = current_node->m_child;
	}

	return output;
}

void
DisjointSegmentList::destroy_list(std::shared_ptr<SegmentNode> &node)
{
	if (node) {
		if (node->m_child) {
			destroy_list(node->m_child);
		}
		reset_node(node);
	}
}

std::shared_ptr<SegmentNode>
DisjointSegmentList::copy_list(std::shared_ptr<SegmentNode> old_list)
{
	if (!old_list) {
		return std::shared_ptr<SegmentNode>();
	}

	std::shared_ptr<SegmentNode> new_list = std::shared_ptr<SegmentNode>(
		new SegmentNode(old_list->m_lowerLimit, old_list->m_upperLimit)
	);

	std::shared_ptr<SegmentNode> new_child = copy_list(old_list->m_child);
	if (new_child) {
		update_relation (new_list, new_child);
	}
	return new_list;
}

#ifdef TEST
int
main()
{
	DisjointSegmentList a;
	a.add_segment(10, 20);
	a.add_segment(35, 42);

	std::cout << a.contains_segment(35, 37) << std::endl;
	std::cout << a.contains_segment(42, 43) << std::endl;
	std::cout << a.contains_segment(15, 20) << std::endl;
}
#endif

// -*- c-basic-offset: 4 -*-
/* click_tree.cpp
 *
 * Implementation of SNF's traffic class tree.
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

#include <stack>
#include <string>
#include <cstdio>
#include <iostream>

#include "click_tree.hpp"
#include "click_element.hpp"
#include "output_class.hpp"

#include "../logger/logger.hpp"

ClickTree::ClickTree(std::shared_ptr<ClickElement> root)
	:
	m_root({root, TrafficClass()}),
	m_input_nf(-1), m_input_iface(),
	m_traffic_classes(), m_behind_proxy(false)
{
	this->log.set_logger_file(__FILE__);
	this->find_classes();
}

ClickTree::ClickTree(
	int input_nf, std::string input_interface,
	std::shared_ptr<ClickElement> root)
	:
	m_root({root, TrafficClass()}),
	m_input_nf(input_nf), m_input_iface(input_interface),
	m_traffic_classes(), m_behind_proxy(false)
{
	this->log.set_logger_file(__FILE__);
	this->find_classes();
}

void
ClickTree::set_behind_proxy(const bool& bn)
{
	this->m_behind_proxy = bn;
}

bool
ClickTree::get_behind_proxy(void)
{
	return this->m_behind_proxy;
}

std::vector<TrafficClass>
ClickTree::get_traffic_classes(void) const
{
	return this->m_traffic_classes;
}

void
ClickTree::find_classes(void)
{
	std::stack<ClickNode> nodes_to_visit;
	nodes_to_visit.push(this->m_root);

	ClickNode curr_node;
	std::shared_ptr<ClickElement> curr_element;
	TrafficClass curr_tc;

	int add_elem_failure = 0;

	// DFS starting from m_root
	while (!nodes_to_visit.empty()) {

		curr_node = nodes_to_visit.top();
		nodes_to_visit.pop();

		curr_element = curr_node.element;
		int nb_ports = curr_element->get_nb_ports();
		curr_tc = curr_node.traffic_class;

		if (nb_ports) {

			unsigned short wr_ops = 0;

			for(uint32_t i = 0; i < curr_element->get_output_classes().size(); i++) {

				TrafficClass next_tc = curr_tc;
				add_elem_failure = next_tc.add_element(curr_element, i, &wr_ops);

				if (!add_elem_failure) {
					std::shared_ptr<ClickElement> child = (curr_element->get_output_classes()[i]).get_child();
					ClickNode next_node = ClickNode{
						child,
						next_tc
					};
					debug_chatter(
						this->log, "\t\tFound transition from " <<
						element_names[curr_element->get_type()] <<
						" to " << element_names[child->get_type()]
					);
					nodes_to_visit.push(next_node);
				}
				// This is possible in case of NATing
				else {
					debug_chatter(this->log, "\t\tFailed to add element " << element_names[curr_element->get_type()]);
				}
			}

			debug_chatter(this->log, "\t\tWrite operations for this tc: " << wr_ops);
			debug_chatter(this->log, "\t\t  Output classes for this tc: " << curr_element->get_output_classes().size());

			// Attempt to take a decision (i.e., read using IPLookup) on re-written IP fields by stateful elements.
			// This can happen e.g., when we try to pass a NAT/Proxy from the outside.
			if (wr_ops == curr_element->get_output_classes().size()) {
				this->set_behind_proxy(true);
			}
		}
		// It's a leaf
		else {
			debug_chatter(this->log, "\t\tFound leaf of type " << element_names[curr_element->get_type()]);
			curr_tc.add_element(curr_element);
			this->m_traffic_classes.push_back(curr_tc);
		}
	}

	def_chatter(this->log, "\t\tComposed " << this->m_traffic_classes.size() << " traffic classes");
}

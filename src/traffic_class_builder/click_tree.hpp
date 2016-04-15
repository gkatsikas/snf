#ifndef _CLICK_TREE_HPP_
#define _CLICK_TREE_HPP_

/*
 * click_tree.hpp
 * 
 * Definition of Hyper-NF's traffic class tree.
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

#include <memory>

#include "filter.hpp"

class ClickElement;

// Overlay of Element to make it a node
struct ClickNode {
	std::shared_ptr<ClickElement> element;
	TrafficClass traffic_class;
};

class ClickTree {
	private:
		ClickNode                 m_root;
		int                       m_input_nf;
		std::string               m_input_iface;
		std::vector<TrafficClass> m_traffic_classes;
		bool                      m_behind_proxy;

		Logger log;

		/*
		 * Graph search from m_root
		 */
		void find_classes(void);

	public:
		ClickTree(std::shared_ptr<ClickElement> root) ;
		ClickTree(int input_nf, std::string input_interface, std::shared_ptr<ClickElement> root);

		void set_behind_proxy(const bool& bn);
		bool get_behind_proxy(void);
		std::vector<TrafficClass> get_traffic_classes(void) const;
};

#endif
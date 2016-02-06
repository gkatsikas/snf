//============================================================================
//        Name: click_tree.hpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: Definition of Hyper-NF's traffic class tree.
//============================================================================

#ifndef _CLICK_TREE_HPP_
#define _CLICK_TREE_HPP_

#include <memory>

#include "filter.hpp"

class ClickElement;

//Overlay of Element to make it a node
struct ClickNode {
	std::shared_ptr<ClickElement> element;
	TrafficClass traffic_class;
};

class ClickTree {
	public:
		ClickTree (std::shared_ptr<ClickElement> root) ;
		ClickTree(int input_nf, std::string input_interface, std::shared_ptr<ClickElement> root);
		std::vector<TrafficClass> get_traffic_classes() const;

	private:
		ClickNode m_root;
		int m_input_nf;
		std::string m_input_iface;
		std::vector<TrafficClass> m_traffic_classes;

		void find_classes(void); //Graph search from m_root
};

#endif
#ifndef CLICK_TREE_HPP
#define CLICK_TREE_HPP

#include "filter.hpp"

class ClickElement;

//Overlay of Element to make it a node
struct ClickNode {
	ClickElement* element;
	TrafficClass traffic_class;
};

class ClickTree {

public:
	ClickTree (ClickElement* root) ;
	

//private:
	ClickNode m_root;
	std::vector<TrafficClass> m_trafficClasses;
	
	void find_classes(); //Graph search from m_root
	
};
#endif

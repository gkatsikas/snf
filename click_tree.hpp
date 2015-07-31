#ifndef CLICK_TREE_HPP
#define CLICK_TREE_HPP

#include "click_element.hpp"
#include "filter.hpp"

//Overlay of Element to make it a node
struct ClickNode {
	ClickElement element;
	TrafficClass traffic_class;
	std::vector<ClickElement> current_path;
};

class ClickTree {

public:
	ClickTree (ClickElement &root) ;
	

private:
	ClickNode m_root;
	std::vector<TrafficClass> m_trafficClasses;
	
	void find_classes(); //Graph search from m_root
	
};


int main() { return 0;}
#endif

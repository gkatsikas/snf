#include <stack>
#include <string>
#include <iostream>
#include <cstdio>

#include "click_tree.hpp"
#include "click_element.hpp"
#include "output_class.hpp"
#include "logger/logger.hpp"

#define DEBUG(a) printf("[%s:%d] %s\n",__FILE__,__LINE__,a)

ClickTree::ClickTree (std::shared_ptr<ClickElement> root) : m_root( {root, TrafficClass()}),
								m_trafficClasses() {
	this->find_classes();
}

std::vector<TrafficClass> ClickTree::get_trafficClasses() const {
	return m_trafficClasses;
}

void ClickTree::find_classes (void) {
	std::stack<ClickNode> nodes_to_visit;
	nodes_to_visit.push(this->m_root);

	ClickNode curr_node;
	std::shared_ptr<ClickElement> curr_element;
	TrafficClass curr_tc;

	int nb_ports=0;
	int add_elem_failure=0;

	//DFS starting from m_root
	while (!nodes_to_visit.empty()) {

		curr_node = nodes_to_visit.top();
		nodes_to_visit.pop();

		curr_element = curr_node.element;
		nb_ports = curr_element->get_nbPorts();
		curr_tc = curr_node.traffic_class;

		if(nb_ports) {
			for(uint32_t i=0; i<curr_element->get_outputClasses().size(); i++) {


					TrafficClass next_tc = curr_tc;
					add_elem_failure = next_tc.addElement(curr_element, i);

					if (!add_elem_failure) {
						std::shared_ptr<ClickElement> child = (curr_element->get_outputClasses()[i]).get_child();
						ClickNode next_node = (ClickNode) {
							child,
							next_tc
						 };
						 //std::cout<<"Found transition from "<<elementNames[curr_element->get_type()]
						 //		<<" to "<<elementNames[child->get_type()]<<std::endl;
						 nodes_to_visit.push (next_node);
					}else {
						std::cerr<<"Failed to add element "<<elementNames[curr_element->get_type()]<<std::endl;
					}
			}
		} else { //It's a leaf
			//std::cout<<"Found leaf of type "<<elementNames[curr_element->get_type()]<<std::endl;
			curr_tc.addElement(curr_element); //Pass as pointer instead?
			this->m_trafficClasses.push_back(curr_tc);
		}
	}
}

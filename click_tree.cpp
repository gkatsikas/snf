#include "click_tree.hpp"
#include <stack>
#include "output_port.hpp"
#include <string>

ClickTree::ClickTree (ClickElement &root) : m_root( {root, TrafficClass()}),
											m_trafficClasses() {	
	this->find_classes();
}

void ClickTree::find_classes () {
	std::stack<ClickNode> nodes_to_visit;
	nodes_to_visit.push(this->m_root);
	
	ClickNode curr_node;
	ClickElement curr_element;
	OutputPort output_port;
	ClickNode next_node;
	TrafficClass curr_tc;
	TrafficClass next_tc;
	
	int nb_ports=0;
	
	//DFS starting from m_root
	while (!nodes_to_visit.empty()) {
		curr_node = nodes_to_visit.top();
		nodes_to_visit.pop();
		
		curr_element = curr_node.element;
		nb_ports = curr_element.nb_ports;
		curr_tc = curr_node.traffic_class;		
		
		if(nb_ports) {
			for(int i=0; i<curr_element.nb_ports; i++) {
					next_tc = curr_tc;
					next_tc.addElement(curr_element, i);
					
					//The updated child
					next_node = (ClickNode) {
						(curr_element.output_ports[i]).m_child,
						next_tc						
					 };
					 nodes_to_visit.push (next_node);
			}
		} else { //It's a leaf
			curr_tc.addElement(curr_element);
			this->m_trafficClasses.push_back(curr_tc);
		}
	}
}

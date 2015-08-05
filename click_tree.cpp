#include <stack>
#include <string>
#include <iostream>
#include <cstdio>

#include "click_tree.hpp"
#include "output_port.hpp"
#include "click_element.hpp"

#define DEBUG(a) printf("[%s:%d] %s\n",__FILE__,__LINE__,a)

ClickTree::ClickTree (ClickElement* root) : m_root( {root, TrafficClass()}),
											m_trafficClasses() {
	this->find_classes();
}

void ClickTree::find_classes () {
	std::stack<ClickNode> nodes_to_visit;
	nodes_to_visit.push(this->m_root);
	
	ClickNode* curr_node;
	ClickElement* curr_element;
	TrafficClass* curr_tc;
	
	int nb_ports=0;
	int add_elem_failure=0;
	
	//DFS starting from m_root
	while (!nodes_to_visit.empty()) {

		curr_node = &(nodes_to_visit.top());
		nodes_to_visit.pop();
		
		curr_element = curr_node->element;
		nb_ports = curr_element->m_nbPorts;
		curr_tc = &(curr_node->traffic_class);
		
		if(nb_ports) {
			for(uint32_t i=0; i<curr_element->m_outputPorts.size(); i++) {
			
					TrafficClass next_tc = *curr_tc;
					add_elem_failure = next_tc.addElement(curr_element, i);
					
					if (!add_elem_failure) {
						ClickElement* child = (curr_element->m_outputPorts[i]).m_child;
						ClickNode next_node = (ClickNode) {
							child,
							next_tc						
						 };
						 nodes_to_visit.push (next_node);
					}
			}
		} else { //It's a leaf
			curr_tc->addElement(curr_element); //Pass as pointer instead?
			this->m_trafficClasses.push_back(*curr_tc);
		}
	}
}

int main() {
	setvbuf(stdout, NULL, _IONBF, 0);

	std::string empty;
	ClickElement* discard = new ClickElement(Discard, empty);

	ClickElement* ttl = new ClickElement(DecIPTTL, empty);

	std::string address = "192.10.0.1";
	ClickElement* fixip = new ClickElement(FixIPSrc, address );
	
	fixip->set_child(ttl,0);
	ttl->set_child(discard,0);
	ClickTree tree(fixip);

	std::cout<<tree.m_trafficClasses.size()<<std::endl;
	
	delete fixip;	
	delete ttl;
	delete discard;
	
	return 0;
}

#include "output_class.hpp"

#include <iostream> //cerr 
#include <cstdlib> //atoi

#include "helpers.hpp"

OutputClass::OutputClass (int port_nb) : m_portNumber(port_nb), m_child(ClickElement::get_discard_elem()) {
}

void OutputClass::add_filter (HeaderField field, Filter& filter) {
	if ( m_filter.find(field) != m_filter.end() ) {
		std::cerr << "[" << __FILE__ << ":" << __LINE__ <<"] Trying to add filter "
				"on already filtered field in OutputPort"<<std::endl;
		exit(1);
	}
	m_filter[field] = filter;
}

OutputClass OutputClass::port_from_lookup_rule(std::string& rule, Filter& parsed_rules) {
	std::vector<std::string> decomposed_rule = split(rule,' ');
	int nb_arg = decomposed_rule.size();
	if (nb_arg>3 || nb_arg<2) {
		std::cerr << "[" << __FILE__ << ":" << __LINE__ <<"] Wrong lookup format: "
			<<rule<<std::endl;
		exit(1);
	}
	
	uint32_t port_nb = atoi(decomposed_rule[nb_arg-1].c_str());
	std::vector<std::string> address_and_mask = split(decomposed_rule[0],'/');
	
	Filter f = Filter::get_filter_from_v4_prefix(ip_dst, aton(address_and_mask[0]), 
									atoi(address_and_mask[1].c_str()));
									
	f.differentiate(parsed_rules);
	parsed_rules.unite(f);
	
	OutputClass port(port_nb);
	port.add_filter(ip_dst,f);
	return port;
}

std::pair<OutputClass,OutputClass> OutputClass::output_class_from_pattern(
											std::vector<std::string>& pattern) {
											
	if(pattern.size() != 7) {
		std::cerr<<"["<<__FILE__<<":"<<__LINE__<<"] Incorrect pattern size\n";
		exit(1);
	}
	uint32_t unmodified_port_nb = atoi(pattern[6].c_str());
	uint32_t modified_port_nb = atoi(pattern[5].c_str());
	
	OutputClass foutput (modified_port_nb);
	if (pattern[1].compare("-")) {
		foutput.add_field_op({Write,ip_src,aton(pattern[0])});
	}
	if (pattern[2].compare("-")) {
		std::vector<std::string> split_pattern = split(pattern[2],'-');
		if (split_pattern.size() == 1){
			foutput.add_field_op({Write,tp_srcPort,(uint32_t) atoi(pattern[2].c_str())});
		}
		else if(split_pattern.size() == 2) {
			OperationType op_type = WriteSF;
			switch (split_pattern[1][split_pattern[1].size()-1]) {
				case '#':
					op_type = WriteRR;
					split_pattern[1].pop_back();
					break;
				case '?':
					op_type = WriteRa;
					split_pattern[1].pop_back();
					break;
				default:
					break;	
			}
			
			FieldOperation field_op;
			field_op.m_type = op_type;
			field_op.m_field = tp_srcPort;
			field_op.m_value[0] = (uint32_t) atoi(split_pattern[0].c_str());
			field_op.m_value[1] = (uint32_t) atoi(split_pattern[1].c_str());
			std::cout<<"Adding field operation: "<<field_op.to_str()<<"\n";
			foutput.add_field_op(field_op);
		}
		else {
			std::cerr<<"["<<__FILE__<<":"<<__LINE__<<"] Incorrect port pattern: "<<pattern[1]<<"\n";
			exit(1);
		}
	}
	if (pattern[3].compare("-")) {
		foutput.add_field_op({Write,ip_dst,aton(pattern[3])});
	}
	if (pattern[4].compare("-")) {
		std::vector<std::string> split_pattern = split(pattern[4],'-');
		if (split_pattern.size() == 1){
			foutput.add_field_op({Write,tp_srcPort,(uint32_t) atoi(pattern[4].c_str())});
		}
		else if(split_pattern.size() == 2) {
			OperationType op_type = WriteSF;
			switch (split_pattern[1][split_pattern[1].size()-1]) {
				case '#':
					op_type = WriteRR;
					split_pattern[1].pop_back();
					break;
				case '?':
					op_type = WriteRa;
					split_pattern[1].pop_back();
					break;
				default:
					break;	
			}
			
			FieldOperation field_op;
			field_op.m_type = op_type;
			field_op.m_field = tp_srcPort;
			field_op.m_value[0] = (uint32_t) atoi(split_pattern[0].c_str());
			field_op.m_value[1] = (uint32_t) atoi(split_pattern[1].c_str());
			foutput.add_field_op(field_op);
		}
		else {
			std::cerr<<"["<<__FILE__<<":"<<__LINE__<<"] Incorrect port pattern: "<<pattern[3]<<"\n";
			exit(1);
		}
	}
	
	
	return std::pair<OutputClass,OutputClass>(foutput,OutputClass(unmodified_port_nb));
}

std::string OutputClass::to_str() const {
	std::string output = "======== Begin Output Class ========\nFilters:\n";
	for(auto &it : m_filter) {
		output += ("\t"+it.second.to_str()+"\n");
	}
	output += m_operation.to_str();
	
	output += "========= End Output Class =========\n";
	return output;
}

std::shared_ptr<ClickElement> OutputClass::get_child() const {
	return m_child;
}

PacketFilter OutputClass::get_filter() const {
	return m_filter;
}

void OutputClass::set_filter(PacketFilter filter) {
	m_filter = filter;
}

const Operation& OutputClass::get_operation() const {
	return m_operation;
}

int OutputClass::get_portNumber() const {
	return m_portNumber;
}

void OutputClass::set_portNumber(int portNumber) {
	m_portNumber = portNumber;
}

void OutputClass::add_field_op(const FieldOperation & field_op) {
	(this->m_operation).add_field_op(field_op);
}

void OutputClass::set_operation (const Operation & op) {
	this->m_operation = op;
}

void OutputClass::set_child (std::shared_ptr<ClickElement> child) {
	this->m_child = child;
}

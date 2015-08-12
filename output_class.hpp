#ifndef OUTPUT_PORT_HPP
#define OUTPUT_PORT_HPP

#include <string>
#include <vector>
#include <utility>

#include "filter.hpp"
#include "click_element.hpp"
#include "header_fields.hpp"

class OutputClass {
public:
	//Constructor
	OutputClass(int port_nb);
	
	static OutputClass port_from_filter_rule(int port_nb, std::string& rule);
	//parsed_rules: prefixes already rooted by more prioritary rules
	//To be updated during function call
	static OutputClass port_from_lookup_rule(std::string& rule,Filter& parsed_rules);
	static std::pair<OutputClass,OutputClass> output_class_from_pattern(std::vector<std::string>& pattern);
	
	void add_filter (HeaderField field, Filter& filter);
	void add_field_op (const FieldOperation & field_op);
	
	std::string to_str() const;
	
	//Getters & setters
	void set_operation (const Operation & op);
	void set_child (std::shared_ptr<ClickElement> child);
	std::shared_ptr<ClickElement> get_child() const;
	PacketFilter get_filter() const;
	void set_filter(PacketFilter filter);
	const Operation& get_operation() const;
	int get_portNumber() const;
	void set_portNumber(int portNumber);

private:
	int m_portNumber;
	std::shared_ptr<ClickElement> m_child;
	Operation m_operation;
	PacketFilter m_filter;
};

#endif

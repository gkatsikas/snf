//============================================================================
//        Name: output_class.hpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: Definition of the class that maps traffic class filters 
//              to packet operations.
//============================================================================

#ifndef OUTPUT_PORT_HPP
#define OUTPUT_PORT_HPP

#include <string>
#include <vector>
#include <utility>

#include "filter.hpp"
#include "click_element.hpp"
#include "header_fields.hpp"

class OutputClass {
	private:
		int                           m_port_number;
		int                           m_next_input_port;
		std::shared_ptr<ClickElement> m_child;
		Operation                     m_operation;
		PacketFilter                  m_filter;

	public:
		OutputClass(int port_nb);

		//static OutputClass port_from_filter_rule(int port_nb, std::string& rule);
		//parsed_rules: prefixes already rooted by more prioritary rules
		//To be updated during function call
		static OutputClass port_from_lookup_rule(std::string &rule, Filter &parsed_rules);
		static std::pair<OutputClass,OutputClass> output_class_from_pattern(std::vector<std::string> &pattern);

		void add_filter     (const HeaderField &field, const Filter &filter);
		void add_field_op   (const FieldOperation &field_op);

		std::string to_str  (void) const;

		// Getters & setters
		void set_operation  (const Operation &op);
		void set_filter     (const PacketFilter &filter);
		void set_port_number(const int &port_number);
		void set_child      (std::shared_ptr<ClickElement> &child, int next_input_port=0);

		std::shared_ptr<ClickElement> get_child      (void) const;
		PacketFilter                  get_filter     (void) const;
		const Operation&              get_operation  (void) const;
		int                           get_port_number(void) const;
};

#endif

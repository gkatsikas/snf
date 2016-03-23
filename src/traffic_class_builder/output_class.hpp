#ifndef _OUTPUT_PORT_HPP_
#define _OUTPUT_PORT_HPP_

/*
 * output_class.hpp
 * 
 * Definition of the class that maps traffic class filters 
 * to packet operations.
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

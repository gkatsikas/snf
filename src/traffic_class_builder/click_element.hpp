#ifndef _CLICK_ELEMENT_HPP_
#define _CLICK_ELEMENT_HPP_

/*
 * click_element.hpp
 *
 * Definition of SNF's traffic class node.
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

#include <vector>
#include <string>
#include <memory>
#include <unordered_map>

#include "element_type.hpp"
#include "../graph/nf_graph.hpp"

class OutputClass;

// Abstract representation of a Click element
class ClickElement {

	private:
		ElementType              m_type;
		std::string              m_configuration;
		int                      m_nb_ports;
		ElementVertex            *m_ev;
		std::vector<OutputClass> m_outputClasses;
		std::string              m_nfName;

		Logger log;

		ClickElement (
			ElementType type, const std::string &configuration, ElementVertex *ev,
			short input_port=0,
			std::unordered_map<short, std::vector<std::string> > *extra_conf = nullptr
		);

		static std::shared_ptr<ClickElement> discard_elem_ptr;

		// Configuration parsing functions
		void parse_dec_ttl_conf               (const std::string &configuration);
		void parse_fix_ip_src                 (const std::string &configuration);
		void parse_ip_filter                  (const std::string &configuration);
		void parse_classifier                 (const std::string &configuration);
		void parse_ip_classifier              (const std::string &configuration);
		void parse_lookup_filter              (const std::string &configuration);
		void parse_rr_ip_mapper               (const std::string &configuration);
		void parse_vlan_encap_configuration   (const std::string &configuration);
		void parse_vlan_decap_configuration   (const std::string &configuration);
		void parse_set_vlan_anno_configuration(const std::string &configuration);
		void parse_ip_fragmenter_configuration(const std::string &configuration);
		void parse_ip_rewriter                (const std::string &configuration,
							short input_port,
							std::unordered_map<short,
							std::vector<std::string>> *extra_conf);

		void add_output_class  (OutputClass &output_class);
		void configuration_fail(void);

	public:
		ClickElement(ElementVertex *ev, short input_port = 0);
		ClickElement(const std::string &name, const std::string &configuration);
		ClickElement(ElementType type, const std::string &configuration);

		void set_child(std::shared_ptr<ClickElement> child, int port, int next_input_port=0);
		bool is_leaf  (void);

		// Getters & Setters
		static std::shared_ptr<ClickElement> get_discard_elem (void);
		std::string                          get_configuration(void) const;

		int  get_nb_ports(void) const;
		void set_nb_ports(int nbPorts);

		std::vector<OutputClass> get_output_classes(void) const;
		ElementType    get_type(void) const;
		ElementVertex* get_ev  (void) const;

		void        set_nf_name(const std::string &name);
		std::string get_nf_name(void) const;

		std::string to_str     (void) const;

		static ElementType type_from_name(const std::string &name);
};

#endif

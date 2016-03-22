//============================================================================
//        Name: click_element.hpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: Definition of Hyper-NF's traffic class node.
//============================================================================

#ifndef _CLICK_ELEMENT_HPP_
#define _CLICK_ELEMENT_HPP_

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
		ElementType   m_type;
		std::string   m_configuration;
		int           m_nb_ports;
		ElementVertex *m_ev;
		std::vector<OutputClass> m_outputClasses;
		std::string   m_nfName;

		Logger log;

		ClickElement (
			ElementType type, const std::string &configuration, ElementVertex *ev, 
			short input_port=0, 
			std::unordered_map<short, std::vector<std::string> > *extra_conf = nullptr
		);
	
		static std::shared_ptr<ClickElement> discard_elem_ptr;

		// Configuration parsing functions
		void parse_dec_ttl_conf  (const std::string &configuration);
		void parse_fix_ip_src    (const std::string &configuration);
		void parse_ip_filter     (const std::string &configuration);
		void parse_ip_classifier (const std::string &configuration);
		void parse_lookup_filter (const std::string &configuration);
		void parse_ip_rewriter   (const std::string &configuration,
									short input_port,
									std::unordered_map<short, std::vector<std::string>> *extra_conf);
		void parse_rr_ip_mapper               (const std::string &configuration);
		void parse_vlan_encap_configuration   (const std::string &configuration);
		void parse_vlan_decap_configuration   (const std::string &configuration);
		void parse_set_vlan_anno_configuration(const std::string &configuration);
		void parse_ip_fragmenter_configuration(const std::string &configuration);

		void add_output_class   (OutputClass &output_class);
		void configuration_fail (void);

	public:
		ClickElement (ElementVertex *ev, short input_port = 0);
		ClickElement (const std::string &name, const std::string &configuration);
		ClickElement (ElementType type, const std::string &configuration);

		//TODO: add next_input_port with default = 0
		void set_child (std::shared_ptr<ClickElement> child, int port, int next_input_port=0);
		bool is_leaf();

		// Getters & Setters
		static std::shared_ptr<ClickElement> get_discard_elem ();
		std::string get_configuration() const;

		int  get_nb_ports() const;
		void set_nb_ports(int nbPorts);

		std::vector<OutputClass> get_output_classes() const;
		ElementType    get_type() const;
		ElementVertex* get_ev  () const;

		void        set_nf_name (const std::string &name);
		std::string get_nf_name () const;

		std::string to_str() const;
		
		static ElementType type_from_name (const std::string &name);
};

#endif

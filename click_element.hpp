#ifndef _CLICK_ELEMENT_HPP_
#define _CLICK_ELEMENT_HPP_

#include <vector>
#include <string>
#include <memory>
#include <unordered_map>

#include "element_type.hpp"
#include "graph/nf_graph.hpp"

class OutputClass;

//Abstract representation of a Click element
class ClickElement {
	public:
		ClickElement (ElementVertex* ev);
		ClickElement (const std::string& name, const std::string& configuration);
		ClickElement (ElementType type, const std::string& configuration);

		void set_child (std::shared_ptr<ClickElement> child, int port);

		bool is_leaf();

		//Getters & Setters
		static std::shared_ptr<ClickElement> get_discard_elem ();
		std::string get_configuration() const;
		int get_nbPorts() const;
		void set_nbPorts(int nbPorts);
		std::vector<OutputClass> get_outputClasses() const;
		ElementType get_type() const;
		ElementVertex* get_ev () const;

		std::string to_str() const;
		
		static ElementType type_from_name (const std::string& name);

	private:
		ClickElement (ElementType type, const std::string& configuration, ElementVertex* ev);
	
		static std::shared_ptr<ClickElement> discard_elem_ptr;

		//Configuration string parsing functions:
		void parse_dec_ttl_conf (const std::string& configuration);
		void parse_fix_ip_src (const std::string& configuration);
		void parse_ip_filter (const std::string& configuration);
		void parse_ip_classifier (const std::string& configuration);
		void parse_lookup_filter (const std::string& configuration);
		void parse_ip_rewriter (const std::string& configuration);
		void parse_rr_ip_mapper (const std::string& configuration);
		void parse_vlan_encap_configuration(const std::string& configuration);
		void parse_vlan_decap_configuration(const std::string& configuration);
		void parse_set_vlan_anno_configuration(const std::string& configuration);
		void parse_ip_fragmenter_configuration(const std::string& configuration);

		void configuration_fail ();

		void add_output_class (OutputClass & output_class);

		ElementType m_type;
		std::string m_configuration; //FIXME: is this really necessary?
		int m_nbPorts; //Number of output ports
		ElementVertex* m_ev;
		std::vector<OutputClass> m_outputClasses;

};

#endif

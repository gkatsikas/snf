#include <iostream>
#include <sstream>
#include <vector>
#include <cstdlib> //atoi
#include <climits>
#include <utility> //std::pair

#include "click_element.hpp"

#include "header_fields.hpp"
#include "operation.hpp"
#include "helpers.hpp"
#include "output_class.hpp"
#include "ip_filter_parser.hpp"

#define BUG(A) std::cerr<<"["<<__FILE__<<":"<<__LINE__<<"] ERROR: "<<A \
				<<std::endl; \
				exit(1)

//ClickElement class
std::string empty;
std::shared_ptr<ClickElement> ClickElement::discard_elem_ptr(new ClickElement(Discard_def,empty));

ClickElement::ClickElement ( ElementType type, std::string& configuration ) :
					m_type(type), m_configuration(configuration), m_nbPorts(0)
{
	switch (type) {
		case DecIPTTL:
			parse_dec_ttl_conf (configuration);
			break;
		case FixIPSrc:
			parse_fix_ip_src (configuration);
			break;
		case IPFilter:
			parse_ip_filter (configuration);
			break;
		case IPClassifier:
			parse_ip_classifier(configuration);
			break;
		case Discard:
		case Discard_def:
			break;
		case RadixIPLookup:
		case LinearIPLookup:
		case DirectIPLookup:
			parse_lookup_filter (configuration);
			break;
		case IPRewriter:
			parse_ip_rewriter (configuration);
			break;
		case RoundRobinIPMapper:
			parse_rr_ip_mapper (configuration);
			break;
		case MarkIPHeader:
		case CheckIPHeader:
		case CheckICMPHeader:
		case GetIPAddress:
		case CheckUDPHeader:
		case CheckTCPHeader: {
			OutputClass port(0);
			this->add_output_class (port);
			break;
		}
		case VLANEncap:
			parse_vlan_encap_configuration(configuration);
			break;
		case VLANDecap:
			parse_vlan_decap_configuration(configuration);
			break;
		case SetVLANAnno:
			parse_set_vlan_anno_configuration(configuration);
		default:
			std::cerr << "["<<__FILE__<<":"<<__LINE__<<"] "<< "Unsupported Element"<<std::endl;
			exit(1);
	}
}

void ClickElement::set_child (std::shared_ptr<ClickElement> child, int port) {
	for (auto &it : m_outputClasses) {
		if (it.get_portNumber() == port) {
			it.set_child(child);
		}
	}
}


bool ClickElement::is_leaf() {
	return (m_nbPorts==0);
}

std::string ClickElement::get_configuration() const {
	return m_configuration;
}

int ClickElement::get_nbPorts() const {
	return m_nbPorts;
}

void ClickElement::set_nbPorts(int nbPorts) {
	m_nbPorts = nbPorts;
}

std::vector<OutputClass> ClickElement::get_outputClasses() const {
	return m_outputClasses;
}

ElementType ClickElement::get_type() const {
	return m_type;
}

std::string ClickElement::to_str() const {
	return elementNames[m_type]+" with configuration \""+m_configuration+"\"";
}

void ClickElement::add_output_class (OutputClass & output_class) {
	this->m_outputClasses.push_back(output_class);
	if (output_class.get_portNumber()+1 > m_nbPorts) {
		m_nbPorts = output_class.get_portNumber()+1;
	}
}

std::shared_ptr<ClickElement> ClickElement::get_discard_elem () {
	return (ClickElement::discard_elem_ptr);
}

void ClickElement::parse_dec_ttl_conf (std::string& configuration) {
	if (configuration.size() != 0) {
		configuration_fail();
	}

	FieldOperation ttl_op = {Translate, ip_TTL, 1};

	OutputClass port (0);
	Filter valid_ttl (ip_TTL,2,UINT_MAX);
	port.add_field_op(ttl_op);
	port.add_filter(ip_TTL,valid_ttl);

	this->add_output_class(port);

	//Drops dead packets
	OutputClass port1(1);
	Filter zero_ttl(ip_TTL,0,1);
	port1.add_filter(ip_TTL, zero_ttl);
	port1.set_child(discard_elem_ptr);

	this->add_output_class(port1);
}

void ClickElement::parse_fix_ip_src (std::string& configuration) {
	std::vector<std::string> split_conf = split(configuration, ' ');

	uint32_t new_ip_value=0;

	FieldOperation fix_ip_src_op = {Write, ip_src, new_ip_value};
	OutputClass port(0);

	switch (split_conf.size()) {
		case 1:
			if (!is_ip4_prefix(configuration)) {configuration_fail(); }
			new_ip_value = aton(configuration);
			break;
		case 2:
			if (split_conf[0].compare("IPADDR") !=0 || !is_ip4_prefix(split_conf[1], true) ) {
				configuration_fail();
			}
			new_ip_value = aton(split_conf[1]);
			break;
		default:
			configuration_fail();
	}

	fix_ip_src_op.m_value[0] = new_ip_value;
	port.add_field_op(fix_ip_src_op);
	this->add_output_class(port);
	return;
}

void ClickElement::parse_ip_filter (std::string& configuration) {
	std::vector<std::string> rules = split(configuration,',');
	std::vector<PacketFilter> to_discard;
	for (size_t i=0; i<rules.size(); i++) {
		if(rules[i].empty()) {
			BUG("Empty classifying rule in IPFilter element");
		}
		std::string rule = (rules[i][0]==' ') ? rules[i].substr(1,rules[i].size()-1) : rules[i];

		size_t first_space = rule.find(' ');
		std::string behaviour = rule.substr(0,first_space);
		int16_t output = -1;
		if (!behaviour.compare("allow")) {
			output = 0;
		}
		else if (behaviour.find_first_not_of("0123456789") == std::string::npos) {
			output = atoi(behaviour.c_str());
		}
		else if(behaviour.compare("deny")  && behaviour.compare("drop")) {
			BUG("Unknown action for IP Filter: "+behaviour);
		}
		std::vector<PacketFilter> outputs = filters_from_ipfilter_line( rules[i].substr(
									first_space+1,rule.size() - first_space - 1));

		if (output==-1) {
			to_discard.insert(to_discard.end(), outputs.begin(), outputs.end());
		}
		else {
			for (auto &pf : outputs) {
				OutputClass port(output);
				port.set_filter (pf);
				this->add_output_class(port);
			}
		}
	}
	uint32_t discard_port = this->m_nbPorts;
	for(auto &pf : to_discard) {
		OutputClass port(discard_port);
		port.set_child(discard_elem_ptr);
		port.set_filter(pf);
		this->add_output_class(port);
	}
}

void ClickElement::parse_ip_classifier (std::string& configuration) {
	std::vector<std::string> rules = split(configuration,',');

	for (size_t i=0; i<rules.size(); i++) {
		if(rules[i].empty()) {
			BUG("Empty classifying rule in IPClassifier element");
		}
		std::string rule = (rules[i][0]==' ') ? rules[i].substr(1,rules[i].size()-1) : rules[i];
		std::vector<PacketFilter> outputs = filters_from_ipfilter_line(rule);
		for (auto &pf : outputs) {
			OutputClass port(i);
			port.set_filter(pf);
			this->add_output_class(port);
		}
	}
}

void ClickElement::parse_lookup_filter(std::string& configuration) {
	std::vector<std::string> rules = split(configuration,',');
	Filter parsed_prefixes(ip_src);
	parsed_prefixes.make_none();
	for (auto &it : rules) {
		OutputClass port = OutputClass::port_from_lookup_rule(it,parsed_prefixes);
		this->add_output_class(port);
	}
}

void ClickElement::parse_ip_rewriter (std::string& configuration) {
	//We assume that the configuration holds for only one input port
	std::vector<std::string> split_inputsec = split(configuration, ' ');

	switch (split_inputsec.size()) {
		case 1: {
			if (configuration.compare("drop")==0 || configuration.compare("discard")==0) {
				OutputClass discard(0);
				discard.set_child(discard_elem_ptr);
				this->add_output_class(discard);
				break;
			}
			else{ configuration_fail(); }
		}
		case 6: {
			std::pair<OutputClass,OutputClass> ports =
					OutputClass::output_class_from_pattern(split_inputsec);
			this->add_output_class(ports.first);
			this->add_output_class(ports.second);
			break;
		}
		default:
			configuration_fail();
	}
}

void ClickElement::parse_vlan_encap_configuration(std::string& configuration) {
	size_t pos = configuration.find(' ');
	if (pos == std::string::npos) {
		BUG("Expected keyword in VLANEncap configuration and got: \""+configuration+"\"");
	}
	std::string keyword = configuration.substr(0,pos);
	uint32_t pcp = 0;
	uint32_t dei = 2;
	uint32_t vid = 0;
	if (!keyword.compare("VLAN_TCI")) {
		uint32_t value  = atoi (configuration.substr(pos+1,configuration.size()-pos-1).c_str());
		pcp = value >> 13; //Removes 13 last bits
		dei = (value>>12) & (0xffffffff << 1); //Gets 12th bit from smaller endian
		vid = value & (0xffffffff << 12); //Gets 12 last bits
	}
	else {
		while (pos != std::string::npos) {
			if (!keyword.compare("VLAN_PCP")) {
				pcp  = atoi (configuration.substr(pos+1,configuration.size()-pos-1).c_str());
			}
			else if(!keyword.compare("VLAN_ID")) {
				vid = atoi (configuration.substr(pos+1,configuration.size()-pos-1).c_str());
			}
			else {
				BUG("Unknown keyword in VLANEncap: "+keyword);
			}
			uint32_t start = configuration.find_first_not_of(" ,", configuration.find(',',pos));
			pos = configuration.find(' ',start);
		}
	}

	OutputClass port(0);
	port.add_field_op({Write, vlan_pcp, pcp});
	port.add_field_op({Write, vlan_vid, vid});
	if (dei < 2) {
		port.add_field_op({Write,vlan_dei,dei});
	}
	this->add_output_class(port);
}

void ClickElement::parse_vlan_decap_configuration(std::string& configuration) {
	if(configuration.empty()) {
		//TODO do we handle ANNO and if yes how?
		BUG("VLAN annotation not implemented yet");
	}
	OutputClass port(0);
	port.add_field_op({Write, vlan_pcp, UINT32_MAX});
	port.add_field_op({Write, vlan_vid, UINT32_MAX});
	port.add_field_op({Write, vlan_dei, UINT32_MAX});
	this->add_output_class(port);
}

void ClickElement::parse_set_vlan_anno_configuration(std::string& configuration) {
	//TODO complete
	//Or not
	std::cout << configuration << std::endl;
	BUG("VLAN annotation not implemented yet");
}

void ClickElement::parse_rr_ip_mapper (std::string& configuration) {

	size_t start = 0;
	size_t end = configuration.find(",");

	while(start != std::string::npos) {
		std::string pattern = configuration.substr(start,end-start);
		// The following line is commentd by Georgios because it was not compiling
		// std::pair<OutputClass,OutputClass> ports = OutputClass::output_class_from_pattern(split_inputsec);

		//FIXME: How to allow only one parameter to be changed
		//Change the way ip_mapper is configured?
		//e.g. SRCIP IPA, IPB, IPC,...
	}
}

void ClickElement::configuration_fail() {
	std::cerr<<"Could not parse configuration for "<<elementNames[m_type]<<":\n\t"
		<<m_configuration<<"\n";
	exit(1);
}

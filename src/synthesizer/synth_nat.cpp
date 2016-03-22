//============================================================================
//        Name: synth_nat.cpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: Implementation of the NAT operations' synthesis.
//============================================================================

#include <set>

#include "synth_nat.hpp"
#include "synthesizer.hpp"

#include "../shared/helpers.hpp"

int SynthesizedNAT::count = 0;

SynthesizedNAT::SynthesizedNAT() : m_name("iprw" + std::to_string(count++)), m_outbound_port(0) {
	this->log.set_logger_file(__FILE__);
}

unsigned short
SynthesizedNAT::add_traffic_class (const struct ConsolidatedTc &tc, const std::string &src_iface) {
	std::string confLine = tc.m_operation;

	unsigned short idx = this->m_input_port_to_iface.size();
	this->m_input_port_to_iface.push_back(src_iface);
	this->m_conf_string.push_back(confLine);

	return idx;
}

std::string
SynthesizedNAT::compute_conf (void) {

	std::string output;

	for(auto &it : this->m_input_port_to_iface) {
		if ( this->m_iface_to_output_port.find (it) == this->m_iface_to_output_port.end() ) {
			this->m_output_port_to_iface.push_back(it);
			this->m_iface_to_output_port.emplace(it, this->m_output_port_to_iface.size()-1);
		}
	}

	this->m_outbound_port = this->m_output_port_to_iface.size();
	for (size_t i=0; i<this->m_conf_string.size(); i++) {

		if ( this->m_conf_string[i][0] == 'R' ) { //if RRIPMapper then include ports in the RR conf
			std::string conf_str = this->m_conf_string[i];
			std::string ports = " " + std::to_string(this->m_outbound_port) + " "
					+ std::to_string(this->m_iface_to_output_port[this->m_input_port_to_iface[i]]);

			size_t pos = conf_str.rfind(')');
			while (pos != std::string::npos) {
				conf_str.insert(pos,ports);
				pos = conf_str.rfind(',',pos);
			}
			output += conf_str + ", ";
		}
		else {
			output += this->m_conf_string[i] + std::to_string(this->m_outbound_port) + " "
				+ std::to_string(this->m_iface_to_output_port[this->m_input_port_to_iface[i]]) +", ";
		}
	}

	return (output.substr(0, output.size()));
}

std::string
SynthesizedNAT::get_name (void) const {
	return this->m_name;
}

unsigned short
SynthesizedNAT::get_outbound_port (void) const {
	return this->m_outbound_port;
}

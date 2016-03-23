// -*- c-basic-offset: 4 -*-
/* synth_nat.cpp
 * 
 * Implementation of stateful operations' synthesis.
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

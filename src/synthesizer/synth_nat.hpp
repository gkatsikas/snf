#ifndef _SYNTH_NAT_HPP_
#define _SYNTH_NAT_HPP_

/*
 * synth_nat.hpp
 * 
 * Definition of the class that handles the synthesis of stateful operations.
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

#include <map>
#include <unordered_map>

#include "../traffic_class_builder/filter.hpp"

struct ConsolidatedTc;

class SynthesizedNAT {

	public:
		SynthesizedNAT();
	
		//Returns the input port on which to connect
		unsigned short add_traffic_class (const struct ConsolidatedTc &tc, const std::string &src_iface);
		std::string    compute_conf      (void);

		std::string    get_name          (void) const;
		unsigned short get_outbound_port (void) const;

	private:
		/*
		 * Logger instance
		 */
		Logger log;
		
		static int count;

		std::string              m_name;
		std::vector<std::string> m_conf_string;

		unsigned short           m_outbound_port;

		// One entry = one line = one input port
		std::vector<std::string> m_input_port_to_iface;
		std::vector<std::string> m_output_port_to_iface;
		std::unordered_map<std::string,unsigned short> m_iface_to_output_port;

		// Returns the part of the pattern that sets the rewriting up
		std::string conf_line_from_operation (Operation &op);
};

#endif

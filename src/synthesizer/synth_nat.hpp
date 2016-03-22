//============================================================================
//        Name: synth_nat.hpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: Definition of the NAT operations' synthesis.
//============================================================================

#ifndef _SYNTH_NAT_HPP_
#define _SYNTH_NAT_HPP_

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

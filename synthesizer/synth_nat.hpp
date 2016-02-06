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

class SynthesizedNat {

	public:
		SynthesizedNat();
	
		//Returns the input port on which to connect
		unsigned short add_traffic_class (const struct ConsolidatedTc& tc, const std::string& src_iface);
		std::string    compute_conf();

		std::string    get_name () const;
		unsigned short get_outboundPort () const;

	private:
		static int count;
		
		std::vector<std::string> m_outputPortToIface;
		std::unordered_map<std::string,unsigned short> m_ifaceToOutputPort;
		std::vector<std::string> m_inputPortToIface;
		//One entry = one line = one input port
		std::vector<std::string> m_confString;
		
		std::string m_name;
		
		unsigned short m_outboundPort;

		//Returns the part of the pattern that sets the rewriting up
		std::string conf_line_from_operation (Operation& op);
};

#endif

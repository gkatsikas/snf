#ifndef _SYNTH_NAT_HPP_
#define _SYNTH_NAT_HPP_

#include <map>
#include <unordered_map>

#include "../filter.hpp"

class SynthesizedNat {

	public:
		SynthesizedNat();
	
		//Returns the input port on which to connect
		unsigned short add_traffic_class (TrafficClass& tc, const std::string& src_iface);
		std::string compute_conf();
		
		std::string get_name ();
		
		unsigned short get_outboundPort ();

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

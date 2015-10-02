#include "synth_nat.hpp"
#include "../helpers.hpp"
#include "synthesizer.hpp"
#include <set>

#define BUG(A) std::cerr<<"["<<__FILE__<<":"<<__LINE__<<"] "<<A <<std::endl; exit(1)

int SynthesizedNat::count = 0;

SynthesizedNat::SynthesizedNat() : m_name("iprw"+std::to_string(count++)) {}

unsigned short SynthesizedNat::add_traffic_class (const struct ConsolidatedTc& tc, const std::string& src_iface) {
	std::string confLine = tc.m_operation;

	unsigned short idx = m_inputPortToIface.size();
	m_inputPortToIface.push_back(src_iface);
	m_confString.push_back(confLine);

	return idx;
}

std::string SynthesizedNat::compute_conf () {

	std::string output;

	for(auto &it : m_inputPortToIface) {
		if (m_ifaceToOutputPort.find (it) == m_ifaceToOutputPort.end()) {
			m_outputPortToIface.push_back(it);
			m_ifaceToOutputPort.emplace(it, m_outputPortToIface.size()-1);
		}
	}

	m_outboundPort = m_outputPortToIface.size();
	for (size_t i=0; i<m_confString.size(); i++) {

		if(m_confString[i][0] == 'R') { //if RRIPMapper then include ports in the RR conf
			std::string conf_str = m_confString[i];
			std::string ports = " " + std::to_string(m_outboundPort) + " "
					+ std::to_string(m_ifaceToOutputPort[m_inputPortToIface[i]]);

			size_t pos = conf_str.rfind(')');
			while (pos != std::string::npos) {
				conf_str.insert(pos,ports);
				pos = conf_str.rfind(',',pos);
			}
			output += conf_str + ", ";
		}
		else {
			output += m_confString[i] + std::to_string(m_outboundPort) + " "
				+ std::to_string(m_ifaceToOutputPort[m_inputPortToIface[i]]) +", ";
		}
	}

	return (output.substr(0, output.size()));
}

std::string SynthesizedNat::get_name () const{
	return m_name;
}

unsigned short SynthesizedNat::get_outboundPort () const {
	return m_outboundPort;
}

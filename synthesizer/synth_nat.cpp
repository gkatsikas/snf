#include "synth_nat.hpp"
#include "../helpers.hpp"
#include <set>

#define BUG(A) std::cerr<<"["<<__FILE__<<":"<<__LINE__<<"] "<<A <<std::endl; exit(1)

int SynthesizedNat::count = 0;

SynthesizedNat::SynthesizedNat() : m_name("iprw"+std::to_string(count++)) {}

unsigned short SynthesizedNat::add_traffic_class (TrafficClass& tc, const std::string& src_iface) {
	Operation op = tc.get_operation();
	std::string confLine = conf_line_from_operation (op);

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

std::string SynthesizedNat::get_name () {
	return m_name;
}

unsigned short SynthesizedNat::get_outboundPort () {
	return m_outboundPort;
}

std::string SynthesizedNat::conf_line_from_operation (Operation& op) {

	std::string ipsrc, tpsrc, tpdst;
	
	FieldOperation* field_op = op.get_field_op(ip_src);
	if(field_op) {
		if(field_op->m_type == Write) {
			ipsrc = ntoa(field_op->m_value[0]);
		}
		else {
			BUG("Expected write operation");
		}
	}
	else{
		ipsrc= "-";
	}
	
	
	field_op = op.get_field_op(tp_srcPort);
	if(field_op) {
		switch (field_op->m_type) {
			case Write:
				tpsrc = std::to_string(field_op->m_value[0]);
				break;
			case WriteRR:
				tpsrc = std::to_string(field_op->m_value[0])+"-"+std::to_string(field_op->m_value[1])+"#";
				break;
			case WriteRa:
				tpsrc = std::to_string(field_op->m_value[0])+"-"+std::to_string(field_op->m_value[1])+"?";
				break;
			case WriteSF:
				tpsrc = std::to_string(field_op->m_value[0])+"-"+std::to_string(field_op->m_value[1]);
				break;
			default:
				BUG("Expected write operation");
		}
	}
	else{
		tpsrc = "-";
	}
	
	field_op = op.get_field_op(tp_dstPort);
	if(field_op) {
		if(field_op->m_type == Write) {
			tpdst = std::to_string(field_op->m_value[0]);
		}
		else {
			BUG("Expected write operation, got "+op.to_str());
		}
	}
	else{
		tpdst = "-";
	}
	
	field_op = op.get_field_op(ip_dst);
	if(field_op) {
		//TODO: add support for load balancing
		if(field_op->m_type == Write) {
			return ipsrc+" "+tpsrc+" "+ntoa(field_op->m_value[0])+" "+tpdst+" ";
		}
		else if (field_op->m_type == WriteLB) {
			std::string output = "RoundRobinIPMapper(";
			for (auto &ip : field_op->m_lbValues) {
				output += ipsrc+" "+tpsrc+" "+ntoa(ip)+" "+tpdst+", ";
			}
			output[output.size()-2] = ')';
			return output.substr(0,output.size()-1);
		}
		else {
			BUG("Expected write operation, got "+op.to_str());
		}
	}
	else{
		return "pattern "+ipsrc+" "+tpsrc+" "+"- "+tpdst+" ";
	}
}

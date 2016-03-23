// -*- c-basic-offset: 4 -*-
/* operation.cpp
 * 
 * Implementation of the class that encodes the packet operations
 * to be applied to Hyper-NF's traffic classes.
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

#include <iostream>
#include <cstring>
#include <functional>

#include "operation.hpp"
#include "../shared/helpers.hpp"

// The logger of this module
Logger op_log(__FILE__);

FieldOperation::FieldOperation () : m_type(Noop), m_field(unknown) {}

FieldOperation::FieldOperation (OperationType type, HeaderField field, uint32_t value) :
								m_type(type), m_field(field) {
	m_value[0] = value;
}

void
FieldOperation::compose (const FieldOperation &rhs) {
	if (this->m_field != rhs.m_field) {
		error_chatter(op_log, "Trying to compose FieldOperation on different fields");
	}

	switch (rhs.m_type) {
		case Write:
			this->m_type = Write;
			this->m_value[0] = rhs.m_value[0];
			return;
		case WriteLB:
			this->m_type = WriteLB;
			this->m_lb_values.clear();
			error_chatter(op_log, "Before composition: "<<to_str());
			this->m_lb_values.insert(m_lb_values.begin(),rhs.m_lb_values.begin(),rhs.m_lb_values.end());
			error_chatter(op_log, "After composition: "<<to_str());
			return;
		case WriteRR:
		case WriteRa:
		case WriteSF:
			this->m_type = rhs.m_type;
			this->m_value[0] = rhs.m_value[0];
			this->m_value[1] = rhs.m_value[1];
			return;
		case Translate:
			this->m_value[0] += rhs.m_value[0];
			return;
		default:
			FANCY_BUG(op_log, "Can only compose Write and Translate");
	}
}

uint32_t
FieldOperation::get_value (void) const {
	return this->m_value[0];
}

bool
FieldOperation::is_same_value (const FieldOperation &rhs) const{
	bool result = true;
	switch (m_type) {
		case WriteRR:
		case WriteRa:
		case WriteSF:
			result = (result && m_value[1] == rhs.m_value[1]);
		case Write:
		case Translate:
			result = (result && m_value[0] == rhs.m_value[0]);
		default:
			break;
	}
	return result;
}

bool
FieldOperation::operator== (const FieldOperation &rhs) const{
	return (rhs.m_field==m_field && rhs.m_type==m_type && is_same_value(rhs));
}

FieldOperation*
Operation::get_field_op(const HeaderField &field) {
	if (m_field_ops.find(field) == m_field_ops.end() ) {
		return nullptr;
	}
	else {
		return &(m_field_ops[field]);
	}
}

bool
Operation::has_field_op(const HeaderField &field) const {
	return (m_field_ops.find(field) != m_field_ops.end());
}

std::string
FieldOperation::to_str (void) const {
	std::string output = header_field_names[m_field];
	
	std::function<std::string(uint32_t)> to_str= [](uint32_t x){return std::to_string(x);};
	if (m_field == ip_src || m_field == ip_dst) {
		to_str = ntoa;
	}
	
	switch (m_type) {
		case Write:
		case Translate:
			switch (m_field) {
				case ip_src:
				case ip_dst:
					output+= (": "+OperationName[m_type]+"("+ntoa(m_value[0])+")");
					break;
				default:
					output+= (": "+OperationName[m_type]+"("+std::to_string(m_value[0])+")");
					break;
			}
			break;
		case WriteLB:
			output += ":"+OperationName[m_type]+"(";
			for(auto &value: m_lb_values) {
				output+=to_str(value)+",";
			}
			output[output.size()-1]=')';
			break;
		case WriteRR:
		case WriteRa:
		case WriteSF:
			switch (m_field) {
				case ip_src:
				case ip_dst:
					output += (": "+OperationName[m_type]+"("+ntoa(m_value[0])+
								","+ntoa(m_value[1])+")");
					break;
				default:
					output += (": "+OperationName[m_type]+"("+std::to_string(m_value[0])+
								","+std::to_string(m_value[1])+")");
			}
			break;
		case Noop:
		case Monitor:
			output += (": "+OperationName[m_type]+"()");
	}
	return output;
}

bool
Operation::operator== (const Operation &rhs) {
	
	for (auto &it : m_field_ops) {
		FieldOperation *rfield_op = get_field_op(it.first);
		if(!rfield_op || !(*rfield_op == it.second))
			return false;
	}
	
	for (auto &it : rhs.m_field_ops) {
		if(!this->has_field_op(it.first))
			return false;
	}

	return true;
}

void
Operation::add_field_op(const FieldOperation &field_op) {
	OperationType new_op_type = field_op.m_type;
	
	switch (new_op_type) {
		case Monitor: {
			this->m_monitors.push_back(field_op.m_value[0]);
			return;
		}
		case Noop:
			return;
		case Write:
		case Translate:
		case WriteRR:
		case WriteRa:
		case WriteSF:
		case WriteLB:
			HeaderField field = field_op.m_field;

			//If we don't have any operation yet
			if (m_field_ops.find(field) == m_field_ops.end() ) {
				this->m_field_ops.emplace(field, field_op);
			}
			else {
				m_field_ops[field].compose(field_op);
			}
	}
}

void
Operation::compose_op (const Operation &operation) {
	std::unordered_map<HeaderField, FieldOperation, std::hash<int> >
					field_ops = operation.m_field_ops;
	for (auto it=field_ops.begin(); it!=field_ops.end(); ++it) {
		this->add_field_op (it->second);
	}
}

std::string
Operation::to_str (void) const {
	std::string output = "Operation:\n";
	for (auto &it : m_field_ops) {
		output += ("\t"+it.second.to_str()+"\n");
	}
	return output;
}

std::string
Operation::to_iprw_conf (void) const {
	
	std::string ipsrc, tpsrc, tpdst;

	auto field_op = m_field_ops.find(ip_src);
	if(field_op != m_field_ops.end()) {
		if(field_op->second.m_type == Write) {
			ipsrc = ntoa(field_op->second.m_value[0]);
		}
		else {
			FANCY_BUG(op_log, "Unexpected write operation");
		}
	}
	else{
		ipsrc= "-";
	}

	field_op = m_field_ops.find(tp_srcPort);
	if(field_op != m_field_ops.end()) {
		switch (field_op->second.m_type) {
			case Write:
				tpsrc = std::to_string(field_op->second.m_value[0]);
				break;
			case WriteRR:
				tpsrc = std::to_string(field_op->second.m_value[0])+"-"+std::to_string(field_op->second.m_value[1])+"#";
				break;
			case WriteRa:
				tpsrc = std::to_string(field_op->second.m_value[0])+"-"+std::to_string(field_op->second.m_value[1])+"?";
				break;
			case WriteSF:
				tpsrc = std::to_string(field_op->second.m_value[0])+"-"+std::to_string(field_op->second.m_value[1]);
				break;
			default:
				FANCY_BUG(op_log, "Unexpected write operation");
		}
	}
	else{
		tpsrc = "-";
	}

	field_op = m_field_ops.find(tp_dstPort);
	if(field_op != m_field_ops.end()) {
		if(field_op->second.m_type == Write) {
			tpdst = std::to_string(field_op->second.m_value[0]);
		}
		else {
			FANCY_BUG(op_log, "Expected write operation, got "+to_str());
		}
	}
	else{
		tpdst = "-";
	}

	field_op = m_field_ops.find(ip_dst);

	if(field_op != m_field_ops.end()) {
		//TODO: add support for load balancing
		if ( field_op->second.m_type == Write ) {
			return ipsrc+" "+tpsrc+" "+ntoa(field_op->second.m_value[0])+" "+tpdst+" ";
		}
		else if ( field_op->second.m_type == WriteLB ) {
			std::string output = "RoundRobinIPMapper(";
			for (auto &ip : field_op->second.m_lb_values) {
				output += ipsrc+" "+tpsrc+" "+ntoa(ip)+" "+tpdst+", ";
			}
			output[output.size()-2] = ')';
			return output.substr(0,output.size()-1);
		}
		else {
			FANCY_BUG(op_log, "Expected write operation, got "+to_str());
		}
	}
	else {
		return "pattern "+ipsrc+" "+tpsrc+" "+"- "+tpdst+" ";
	}
}

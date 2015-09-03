#include "operation.hpp"
#include <iostream>
#include <cstring>

#include "helpers.hpp"

void FieldOperation::compose (const FieldOperation & rhs) {
	if (this->m_field != rhs.m_field) {
		std::cerr<<"["<<__FILE__<<":"<<__LINE__<<"] Trying to compose FieldOperation "
				"on different fields"<<std::endl;
	}

	switch (rhs.m_type) {
		case Write:
			this->m_type = Write;
			this->m_value[0] = rhs.m_value[0];
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
			std::cerr<<"["<<__FILE__<<":"<<__LINE__<<"] Can only compose Write "
						" and Translate"<<std::endl;
			exit(1);
	}
}

uint32_t FieldOperation::get_value () const { return this->m_value[0]; }

bool FieldOperation::is_same_value (const FieldOperation& rhs) const{
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

bool FieldOperation::operator== (const FieldOperation& rhs) const{
	return (rhs.m_field==m_field && rhs.m_type==m_type && is_same_value(rhs));
}

FieldOperation* Operation::get_field_op(HeaderField field) {
	if (m_fieldOps.find(field) == m_fieldOps.end() ) {
		return nullptr;
	}
	else {
		return &(m_fieldOps[field]);
	}
}

std::string FieldOperation::to_str () const {
	std::string output = headerFieldNames[m_field];
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

void Operation::add_field_op(const FieldOperation &field_op) {
	OperationType new_op_type = field_op.m_type;
	
	switch (new_op_type) {
		case Monitor: {
			this->monitors.push_back(field_op.m_value[0]);
			return;
		}
		case Noop:
			return;
		case Write:
		case Translate:
		case WriteRR:
		case WriteRa:
		case WriteSF:
			HeaderField field = field_op.m_field;

			//If we don't have any operation yet
			if (m_fieldOps.find(field) == m_fieldOps.end() ) {
				this->m_fieldOps.emplace(field, field_op);
			}
			else {
				m_fieldOps[field].compose(field_op);
			}
	}
}

void Operation::compose_op (const Operation & operation) {
	std::unordered_map<HeaderField, FieldOperation, std::hash<int> >
					field_ops = operation.m_fieldOps;
	for (auto it=field_ops.begin(); it!=field_ops.end(); ++it) {
		this->add_field_op (it->second);
	}
}

std::string Operation::to_str() const {
	std::string output = "Operation:\n";
	for (auto &it : m_fieldOps) {
		output += ("\t"+it.second.to_str()+"\n");
	}
	return output;
}

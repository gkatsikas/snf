#include "operation.hpp"
#include <iostream>

void Operation::add_field_op(const FieldOperation &field_op) {
	OperationType new_op_type = field_op.type;
	
	switch (new_op_type) {
		case Monitor: {
			this->monitors.push_back(field_op.value);
			return;
		}
		case Noop:
			return;
		case Write: 
		case Translate:
			HeaderField field = field_op.field;
		
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

void FieldOperation::compose (const FieldOperation & rhs) {
	if (this->field != rhs.field) {
		std::cerr<<"["<<__FILE__<<":"<<__LINE__<<"] Trying to compose FieldOperation "
				"on different fields"<<std::endl;
	}

	switch (rhs.type) {
		case Write:
			this->type = Write;
			this->value = rhs.value;
			return;
		case Translate:
			this->value += rhs.value;
			return;
		default:
			std::cerr<<"["<<__FILE__<<":"<<__LINE__<<"] Can only compose Write "
						" and Translate"<<std::endl;
			exit(1);
	}
}

uint32_t FieldOperation::get_value () { return this->value; }

FieldOperation* Operation::get_field_op(HeaderField field) {
	if (m_fieldOps.find(field) == m_fieldOps.end() ) {
		return nullptr;
	}
	else {
		return &(m_fieldOps[field]);
	}
}

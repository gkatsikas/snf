#include "operation.hpp"

void Operation::add_field_op(const FieldOperation &field_op) {
	HeaderField field = field_op.field;
	
	if (m_fieldOps.find(field) != m_fieldOps.end() ) {
		//TODO: handle it (throw an exception or something
	}
	
	this->m_fieldOps.emplace(field, field_op);
}



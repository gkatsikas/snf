#ifndef OPERATION_HPP
#define OPERATION_HPP

#include <unordered_map>
#include <vector>
#include "headerFields.hpp"

enum OperationType {
	Write,
	Translate,
	Monitor,
	Noop
};

struct FieldOperation {
	OperationType type;
	HeaderField field;
	/*
	 * Values equals, depending on the operation:
	 *    - new value to write for Write: x->value
	 *    - translation vector for Translation: x->x+value
	 *    - Monitor ID for Monitor: Monitor[i](packet)
	 */
	uint32_t value;
	void compose (const FieldOperation & rhs);
	uint32_t get_value();
};

class Operation {

public:
	void add_field_op(const FieldOperation &field_op);
	void compose_op(const Operation &operation);
	
	FieldOperation* get_field_op(HeaderField field);

private:
	std::unordered_map<HeaderField, FieldOperation, std::hash<int> > m_fieldOps;
	uint32_t m_identifier;
	std::vector<int> monitors; /* List of monitors that this class goes through */
};


#endif

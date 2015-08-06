#ifndef OPERATION_HPP
#define OPERATION_HPP

#include <unordered_map>
#include <vector>
#include <string>

#include "header_fields.hpp"

enum OperationType {
	Write,
	Translate,
	Monitor,
	Noop
};

const std::string OperationName[4] = { "Write", "Translate", "Monitor", "Noop"};

struct FieldOperation {
	OperationType m_type;
	HeaderField m_field;
	/*
	 * Values equals, depending on the operation:
	 *    - new value to write for Write: x->value
	 *    - translation vector for Translation: x->x+value
	 *    - Monitor ID for Monitor: Monitor[i](packet)
	 */
	uint32_t m_value;
	void compose (const FieldOperation & rhs);
	uint32_t get_value() const;
	std::string to_str();
};

class Operation {

public:
	void add_field_op(const FieldOperation &field_op);
	void compose_op(const Operation &operation);
	
	FieldOperation* get_field_op(HeaderField field);
	
	std::string to_str();

private:
	std::unordered_map<HeaderField, FieldOperation, std::hash<int> > m_fieldOps;
	uint32_t m_identifier;
	std::vector<int> monitors; /* List of monitors that this class goes through */
};


#endif

#ifndef OPERATION_HPP
#define OPERATION_HPP

#include <unordered_map>
#include <vector>
#include "headerFields.hpp"

enum OperationType {
	Write,
	Translate,
	Monitor,
	
};

struct FieldOperation {
	OperationType type;
	HeaderField field;
	uint32_t value;
};

class Operation {

public:
	void add_field_op(const FieldOperation &field_op);
	
	static Operation compose_op(const std::vector<Operation> &operations);
	static std::vector<int> get_monitors(const std::vector<Operation> &operations);

private:
	std::unordered_map<HeaderField, FieldOperation, std::hash<int> > m_fieldOps;
	uint32_t m_identifier;
};


#endif

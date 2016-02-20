//============================================================================
//        Name: operation.hpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: Definition of the class that encodes the packet operations
//              to be applied to Hyper-NF's traffic classes.
//============================================================================

#ifndef OPERATION_HPP
#define OPERATION_HPP

#include <vector>
#include <string>
#include <unordered_map>

#include "header_fields.hpp"

enum OperationType {
	Write,
	WriteRR, //Round-robin value selection
	WriteRa, //Random value selection
	WriteSF, //Write from stateful map
	WriteLB, //Manual fix for load-balancing, TODO: switch FieldOperation.m_value to SegmentList object
	Translate,
	Monitor,
	Noop
};

const std::string OperationName[8] = { "Write", "Write-Round Robin", "Write-Random",
					 "Write-Stateful", "Write load-balance", "Translate", "Monitor", "Noop"};

struct FieldOperation {
	FieldOperation ();
	FieldOperation (OperationType, HeaderField, uint32_t);

	OperationType m_type;
	HeaderField m_field;
	/*
	 * Values equals, depending on the operation:
	 *    - new value to write for Write: x->value
	 *    - translation vector for Translation: x->x+value
	 *    - Monitor ID for Monitor: Monitor[i](packet)
	 */
	uint32_t m_value[2];
	std::vector<uint32_t> m_lbValues; //Values for the load balancer
	void compose (const FieldOperation & rhs);
	uint32_t get_value() const;
	std::string to_str() const;
	bool operator== (const FieldOperation& rhs) const;
	bool is_same_value (const FieldOperation& rhs) const;
};

class Operation {

	public:
		void add_field_op(const FieldOperation &field_op);
		void compose_op(const Operation &operation);
		
		bool has_field_op(HeaderField field) const;
		
		bool operator== (const Operation& rhs);

		FieldOperation* get_field_op(HeaderField field);

		std::string to_str() const;
		
		std::string to_iprw_conf () const;

	private:
		std::unordered_map<HeaderField, FieldOperation, std::hash<int> > m_fieldOps;
		uint32_t m_identifier;
		std::vector<int> monitors; /* List of monitors that this class goes through */
};

#endif

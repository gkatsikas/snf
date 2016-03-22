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
#include "../logger/logger.hpp"
#include "../shared/helpers.hpp"

enum OperationType {
	Write,
	WriteRR,   // Round-robin value selection
	WriteRa,   // Random value selection
	WriteSF,   // Write from stateful map
	WriteLB,   // Manual fix for load-balancing, TODO: switch FieldOperation.m_value to SegmentList object
	Translate,
	Monitor,
	Noop
};

// 1-1 mapping with the types above
const std::string OperationName[8] = {
	"Write", "Write-Round Robin",
	"Write-Random",	"Write-Stateful",
	"Write load-balance", "Translate",
	"Monitor", "Noop"
};

struct FieldOperation {
	FieldOperation ();
	FieldOperation (OperationType, HeaderField, uint32_t);

	OperationType m_type;
	HeaderField   m_field;
	/*
	 * Values equals, depending on the operation:
	 *    - new value to write for Write: x->value
	 *    - translation vector for Translation: x->x+value
	 *    - Monitor ID for Monitor: Monitor[i](packet)
	 */
	uint32_t              m_value[2];
	std::vector<uint32_t> m_lb_values; //Values for the load balancer

	void compose       (const FieldOperation &rhs);
	uint32_t get_value (void) const;
	std::string to_str (void) const;
	bool operator==    (const FieldOperation &rhs) const;
	bool is_same_value (const FieldOperation &rhs) const;
};

class Operation {

	private:
		std::unordered_map<HeaderField, FieldOperation, std::hash<int> > m_fieldOps;
		uint32_t         m_identifier;
		std::vector<int> m_monitors;    /* List of m_monitors that this class goes through */

	public:
		void add_field_op(const FieldOperation &field_op);
		void compose_op  (const Operation &operation);
		bool has_field_op(const HeaderField &field) const;
		bool operator==  (const Operation &rhs);

		std::string to_str       (void) const;
		std::string to_iprw_conf (void) const;

		FieldOperation* get_field_op(const HeaderField &field);
};

#endif

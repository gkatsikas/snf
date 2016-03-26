#ifndef _FILTER_HPP_
#define _FILTER_HPP_

/*
 * filter.hpp
 * 
 * Definition of the Hyper-NF traffic class filter on a packet's
 * header space.
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

#define MAX_UINT32 0xFFFFFFFF

#include <string>
#include <memory>
#include <cstdint>
#include <unordered_map>

#include "operation.hpp"
#include "element_type.hpp"
#include "segment_list.hpp"

#include "../logger/logger.hpp"

#define TRAFFIC_CLASS_FORMAT

class ClickElement;
class StatefulSynthesizer;

/*
 * Contains one field-specific filter
 */
class Filter {
	public:
		Filter ();
		Filter (HeaderField field);
		Filter (HeaderField field, uint32_t value);
		Filter (HeaderField field, uint32_t lower_value, uint32_t upper_value);

		Filter& intersect     (const Filter &filter); // Intersects this and rhs
		Filter& unite         (const Filter &filter);
		Filter& differentiate (const Filter &filter);
		Filter& translate     (uint32_t value, bool forward=true);

		bool operator== (const Filter &rhs) const;

		static Filter get_filter_from_v4_prefix      (
			HeaderField field, uint32_t value, uint32_t prefix
		);
		static Filter get_filter_from_v4_prefix_str  (
			HeaderField field, const std::string &prefix_as_str
		);
		static Filter get_filter_from_ipclass_pattern(
			HeaderField field, const std::string &args
		);
		static Filter get_filter_from_prefix_pattern (
			HeaderField field, const std::string &args
		);

		void make_none (void);       // Make this filter refuse all packets
		bool is_none   (void) const; // Returns true if the filter refuses all packets
		bool match     (uint32_t       value) const;
		bool contains  (const Filter &filter) const;

		HeaderField get_field(void) const;
		std::string to_str   (void) const;

		/*
		 * Public API to turn a Filter into a format understandable by:
		 * |--> Click's IPClassifier element
		 * |--> Flow Director (Intel NIC)
		 * |--> OpenFlow
		 */
		std::string to_ip_classifier_pattern(void) const;
		std::string to_flow_director_pattern(void) const;
		std::string to_openflow_pattern     (void) const;

	private:
		HeaderField         m_field;
		DisjointSegmentList m_filter;
		DisjointSegmentList m_to_subtract;

		/*
		 * Translates a (complex) condition on IP src/dst address fields to
		 * a format understandable by Click's IPClassfier element.
		 */
		std::string ip_filter_to_ip_classifier_pattern(const std::string &keyword) const;

		/*
		 * Translates a (complex) condition on IP header fields to
		 * a format understandable by the NIC (Intel Flow Director or ntuple filters).
		 */
		std::string ip_filter_to_flow_director_pattern(const std::string &keyword) const;

		/*
		 * Translates a (complex) condition on IP header fields to OpenFlow rules.
		 */
		std::string ip_filter_to_openflow_pattern     (const std::string &keyword) const;
};

/*
 * Condition on a Filter
 */
class Condition { //FIXME: just inherit Filter?

	public:
		Condition(HeaderField, std::shared_ptr<ClickElement>, Filter, FieldOperation);

		bool        is_same_write(const FieldOperation &op) const;
		bool        intersect    (const Filter &filter); //return true if condition is not empty
		std::string to_str       (void) const;
		bool        is_none      (void) const;

	private:
		HeaderField                   m_field;
		Filter                        m_filter;
		FieldOperation                m_current_write;
		std::shared_ptr<ClickElement> m_element;
};

typedef std::unordered_map<HeaderField, Filter, std::hash<int> > PacketFilter;
typedef std::unordered_map<HeaderField, std::vector<Condition>, std::hash<int> > ConditionMap;
#define for_fields_in_pf(it,pf) for (auto it=pf.begin(); it != pf.end(); ++it)

/*
 * Overlay class for a collection of filters
 */
class TrafficClass {

	public:
		TrafficClass();

		bool is_source_nated(void);
		bool is_discarded   (void) const;
		std::string to_str  (void) const;

		/*
		 * Adds the element with output port port
		 * |-> -1 indicates no output port (end of chain)
		 * Returns the number of updated filters that are equals to None
		 */
		int  add_element (std::shared_ptr<ClickElement> element, const int port=-1);

		void set_stateful_rewriter (
			const std::shared_ptr<StatefulSynthesizer> &sf,
			const unsigned short &port
		);
		void set_output_iface      (const std::string &iface);
		void set_output_iface_conf (const std::string &iface_conf);
		void set_nf_of_output_iface(const std::string &nf);
		
		const std::string                    get_output_iface                (void);
		const std::string                    get_output_iface_conf           (void);
		std::string                          get_nf_of_output_iface          (void) const;
		Operation                            get_operation                   (void) const;
		unsigned short                       get_stateful_rewriter_input_port(void) const;
		std::shared_ptr<StatefulSynthesizer> get_stateful_rewriter           (void) const;

		/*
		 * Core method that extends a filter by applying intersection with another.
		 */
		int intersect_filter(const Filter &filter);

		/*
		 * Append a set of trailing Click elements after a traffic class's operation.
		 * These elements lead the traffic class out of Click without redundancy.
		 * The direction of the traffic is given in order to generate the proper elements' configuration.
		 */
		std::string synthesize_chain(unsigned short &direction);

		/*
		 * Public API to convert a traffic class into a format understandable by:
		 * |--> Click
		 * |--> FlowDirector
		 * |--> OpenFlow
		 */
		std::string to_ip_classifier_pattern(void) const;
		std::string to_flow_director_pattern(void) const;
		std::string to_openflow_pattern     (void) const;

	private:
		/*
		 * The interface name and configuration of the element that
		 * pushes this traffic class out of the chain.
		 */
		std::string m_output_iface;
		std::string m_output_iface_conf;

		/*
		 * The NF to which the interface above belongs to.
		 */
		std::string m_nf_of_output_iface;

		/*
		 * The disjoint list of filters on header fields.
		 */
		PacketFilter m_filters;
		/*
		 * The header space fields on which we need to apply rewrites.
		 */
		ConditionMap m_write_conditions;

		/*
		 * Does this traffic class contain a DropBroadcast element (afterwards)?
		 */
		bool m_drop_broadcasts;
		/*
		 * Does this traffic class contain an IPGWOptions element (afterwards)?
		 */
		bool m_ip_gw_options;

		/*
		 * The configuraiton parameters of the EtherEncap element that
		 * will convert the IP packets into Ethernet frames.
		 */
		std::string m_ether_encap_conf;
		
		/*
		 * Path of the class in terms of Click elements
		 */
		std::vector<std::shared_ptr<ClickElement> > m_element_path;

		/*
		 * The rewrite operations to be applied to this traffic class.
		 */
		Operation m_operation;

		/*
		 * 
		 */
		std::shared_ptr<StatefulSynthesizer> m_stateful;

		/*
		 * The input port of the IPRewriter that performs NAT.
		 */
		unsigned short m_stateful_input_port;

		void add_filter         (Filter filter, HeaderField field);
		int  intersect_condition(const Filter &condition, const FieldOperation &operation);
};

#endif

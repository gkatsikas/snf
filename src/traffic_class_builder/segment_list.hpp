#ifndef _SEGMENT_LIST_HPP_
#define _SEGMENT_LIST_HPP_

/*
 * segment_list.hpp
 *
 * Definition of a disjoint list of segments to be used for
 * the construction of complex traffic class filters.
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

#include <memory>
#include <string>
#include <vector>
#include <utility>
#include <cstdint>

#include "../logger/logger.hpp"

// Stores a segment as a node of a list
struct SegmentNode;

// Stores an union of segments
class DisjointSegmentList {

	private:
		std::shared_ptr<SegmentNode> m_head;

		void move_forward  (uint32_t value);
		void move_backwards(uint32_t value);

	private:
		static void update_relation(
			std::shared_ptr<SegmentNode> parent,
			std::shared_ptr<SegmentNode> child
		);
		static void reset_node(std::shared_ptr<SegmentNode> &node);

		static std::shared_ptr<SegmentNode> copy_list(std::shared_ptr<SegmentNode> old_list);
		static void destroy_list(std::shared_ptr<SegmentNode> &node);
		static std::shared_ptr<SegmentNode> unify(
			std::shared_ptr<SegmentNode> &container,
			const std::shared_ptr<SegmentNode> &to_add
		);
		static std::shared_ptr<SegmentNode> differentiate(
			std::shared_ptr<SegmentNode> &container,
			const std::shared_ptr<SegmentNode> &to_substract
		);
		static std::shared_ptr<SegmentNode> intersect(
			std::shared_ptr<SegmentNode> &container,
			const std::shared_ptr<SegmentNode> &to_intersect
		);
		static bool include(
			const std::shared_ptr<SegmentNode> &container,
			const std::shared_ptr<SegmentNode> &containee
		);

	public:
		DisjointSegmentList ();
		DisjointSegmentList (const DisjointSegmentList &rhs);
		~DisjointSegmentList();

		// Returns true if the list is empty
		bool empty(void) const;

		// Returns true if one of the segments contains value
		bool contains(uint32_t value) const;
		bool contains_segment(uint32_t lower_limit, uint32_t upper_limit) const;
		bool contains_seglist(const DisjointSegmentList &rhs) const;

		// Add a segment to the union
		void add_segment(uint32_t lower_limit, uint32_t upper_limit);
		void add_seglist(const DisjointSegmentList &rhs);
		// Differentiate the union from a segment
		void substract_segment(uint32_t lower_limit, uint32_t upper_limit);
		void substract_seglist(const DisjointSegmentList &rhs);
		// Intersect the union with a segment
		void intersect_segment(uint32_t lower_limit, uint32_t upper_limit);
		void intersect_seglist(const DisjointSegmentList &rhs);
		// Translate all the segments by value, either forward or backwards
		void translate(uint32_t value, bool forward=true);

		DisjointSegmentList &operator= (const DisjointSegmentList &rhs);
		bool operator== (const DisjointSegmentList &rhs) const;
		bool operator!= (const DisjointSegmentList &rhs) const;

		std::string to_str   (void) const;
		std::string to_ip_str(void) const;

		std::vector<std::pair<uint32_t,uint32_t>> get_segments(void) const;
};

#endif

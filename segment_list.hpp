#ifndef SEGMENT_LIST_HPP
#define SEGMENT_LIST_HPP

#include <utility>
#include <memory>
#include <string>

typedef unsigned int uint32_t;

//Stores a segment as a node of a list
struct SegmentNode;

//Stores an union of segments
class DisjointSegmentList {

public:
	DisjointSegmentList ();
	DisjointSegmentList (const DisjointSegmentList& rhs);
	~DisjointSegmentList ();
	
	//returns true if the list is empty
	bool empty();
	
	//returns true if one of the segments contains value
	bool contains (uint32_t value);
	
	//Add a segment to the union
	void add_segment (uint32_t lower_limit, uint32_t upper_limit);
	//Differentiate the union from a segment
	void substract_segment (uint32_t lower_limit, uint32_t upper_limit);
	//Intersect the union with a segment
	void intersect_segment (uint32_t lower_limit, uint32_t upper_limit);
	
	DisjointSegmentList& operator= (const DisjointSegmentList& rhs);
	
	std::string to_str ();

private:
	std::shared_ptr<SegmentNode> m_head;
	static void update_relation(std::shared_ptr<SegmentNode> parent,
								std::shared_ptr<SegmentNode> child);
	static void reset_node(std::shared_ptr<SegmentNode> node);
	
	static std::shared_ptr<SegmentNode> copy_list(std::shared_ptr<SegmentNode> old_list);
	static void destroy_list(std::shared_ptr<SegmentNode> node);
};

#endif

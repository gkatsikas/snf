#ifndef SEGMENT_LIST_HPP
#define SEGMENT_LIST_HPP

#include <utility>
#include <memory>
#include <string>
#include <cstdint>
#include <vector>

//Stores a segment as a node of a list
struct SegmentNode;

//Stores an union of segments
class DisjointSegmentList {

public:
	DisjointSegmentList ();
	DisjointSegmentList (const DisjointSegmentList& rhs);
	~DisjointSegmentList ();
	
	//returns true if the list is empty
	bool empty() const;
	
	//returns true if one of the segments contains value
	bool contains (uint32_t value) const;
	
	//Add a segment to the union
	void add_segment (uint32_t lower_limit, uint32_t upper_limit);
	void add_seglist (const DisjointSegmentList& rhs);
	//Differentiate the union from a segment
	void substract_segment (uint32_t lower_limit, uint32_t upper_limit);
	void substract_seglist (const DisjointSegmentList& rhs);
	//Intersect the union with a segment
	void intersect_segment (uint32_t lower_limit, uint32_t upper_limit);
	void intersect_seglist (const DisjointSegmentList& rhs);
	//Translate all the segments by value, either forward or backwards
	void translate (uint32_t value,bool forward=true);
	
	DisjointSegmentList& operator= (const DisjointSegmentList& rhs);
	
	std::string to_str () const;
	
	std::vector<std::pair<uint32_t,uint32_t> > get_segments() const;

private:
	std::shared_ptr<SegmentNode> m_head;
	
	void move_forward(uint32_t value);
	void move_backwards(uint32_t value);
	
private:
	static void update_relation(std::shared_ptr<SegmentNode> parent,
								std::shared_ptr<SegmentNode> child);
	static void reset_node(std::shared_ptr<SegmentNode>& node);
	
	static std::shared_ptr<SegmentNode> copy_list(std::shared_ptr<SegmentNode> old_list);
	static void destroy_list(std::shared_ptr<SegmentNode>& node);
	static std::shared_ptr<SegmentNode> unify (std::shared_ptr<SegmentNode>& container,
											const std::shared_ptr<SegmentNode>& to_add);
	static std::shared_ptr<SegmentNode> differentiate(
									std::shared_ptr<SegmentNode>& container,
									const std::shared_ptr<SegmentNode>& to_substract);
	static std::shared_ptr<SegmentNode> intersect (
									std::shared_ptr<SegmentNode>& container,
									const std::shared_ptr<SegmentNode>& to_intersect);
};

#endif

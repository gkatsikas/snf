//============================================================================
//        Name: nf_graph.hpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: Extensions of basic Vertex and Graph classes to represent 
//              Click elements in a NF DAG.
//============================================================================

#ifndef _NF_GRAPH_HPP_
#define _NF_GRAPH_HPP_

#include <memory>

#include "graph.hpp"
#include "../helpers.hpp"
#include "../click/click_parse_configuration.hpp"

/*
 * The Parser's graph contains Click Elements as vertices together with some extra information
 */
class ElementVertex : public Vertex
{
	private:

		/*
		 * A shared pointer that maps this vertex with the corresponding Click element
		 */
		std::shared_ptr<Element> click_element;

		/*
		 * If true, we mark the elements that serve as interfaces between the NF Chain
		 * and the NFV domains (outside world). It can only be assigned to elements that
		 * belong to Input or Output VertexType.
		 * If false and the element is an Input/Output, then this element serves as glue
		 * between two consecutive NFs.
		 */
		bool _is_endpoint;

		/*
		 * This set of pointers is only valid for certain Output Elements, with _is_endpoint=false.
		 * It contains references to the first input element(s) (e.g. FromDevice), of the
		 * next NF(s).
		 */
		std::vector<std::shared_ptr<ElementVertex>> _jump_to_next_nf;

	public:
		ElementVertex(Element* element, std::string name, unsigned short pos);
		~ElementVertex() {};
		ElementVertex& operator=(ElementVertex& ev);

		/*
		 * Setters & Getters
		 */
		bool   is_endpoint (void);
		void   set_endpoint(bool ep);

		std::vector<std::shared_ptr<ElementVertex>> get_jump_to_next_nfs(void);
		void add_jump_element(ElementVertex* j);

		inline std::string get_class(void)         const { return this->click_element->class_name(); };
		inline std::string get_configuration(void) const { return this->click_element->router()->econfiguration(this->get_position()).c_str(); };
		inline std::shared_ptr<Element> get_click_element(void) const { return this->click_element; };

		/*
		 * Debugging
		 */
		void print_info(void);
};

class NFGraph : public Graph
{
	private:
		// Nothing really different from a normal graph

	public:
		NFGraph()  {};
		~NFGraph() {};

		/*
		 * Add u into graph along with all its discovered neighbours
		 */
		void add_vertex_and_neighbours(ElementVertex* u);

		/*
		 * Get subset of vertices based on several characteristics.
		 */
		Vector<ElementVertex*> get_vertices_by_stage(VertexType t);
		ElementVertex*         get_vertex_by_click_element(Element* e);
		Vector<ElementVertex*> get_all_endpoint_vertices(void);
		Vector<ElementVertex*> get_endpoint_vertices(VertexType t);

		/*
		 * NF graph is not ordinary DAG. Not all the leaf nodes (the ones without children) are heirless.
		 * It all depends on the placement of an NF in the chain. If there is another NF in the chain
		 * after this one, the output node contains pointers to the appropriate input elements of the
		 * successive NF. Thus, only endpoint (interfaces that connect the chain with external domains)
		 * output nodes do not have children.
		 */
		std::vector<std::shared_ptr<ElementVertex>> get_vertex_children(ElementVertex* u);
};

void enhanced_dfs(
	NFGraph* graph, 
	ElementVertex* vertex,
	Colour& colour,
	const Graph::AdjacencyList& adjacency_list,
	Graph::VertexMap<Colour>& visited,
	std::vector<ElementVertex*>& sorted
);

#endif

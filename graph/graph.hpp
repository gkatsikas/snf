//============================================================================
//        Name: graph.hpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: Defines a simple directed graph
//============================================================================

#ifndef _GRAPH_HPP_
#define _GRAPH_HPP_

#include <unordered_map>

#include "vertex.hpp"
#include "../logger/logger.hpp"

/*
 * Colors will "paint" the vertices in the topological sort
 */
enum Colour { White, Grey, Black };

template <class T>
class Graph
{
	public:
		Graph();
		~Graph();

		/*
		 * Data structures
		 */
		template<typename U>
		using VertexMap     = std::unordered_map<T*, U>;
		using AdjacencyList = VertexMap<std::vector<T*>>;

		/*
		 * In degree per vertex
		 */
		VertexMap<int> in_degrees;

		/*
		 * Setters & Getters
		 */
		inline void                   add_vertex(T* u);
		inline void                   add_edge  (T* u, T* v);

		inline unsigned short         get_vertices_no(void);
		inline void                   find_in_degrees(void);
		inline int                    get_in_degree(T*);
		inline VertexMap<int>         get_in_degrees(void);
		inline const AdjacencyList&   get_adjacency_list(void) const { return this->vertices; };
		inline T* get_vertex_by_name(std::string& name);
		inline T* get_vertex_by_position(unsigned short pos);

		/*
		 * Printouts
		 */
		inline void print_in_degrees      (void);
		inline void print_adjacency_list  (void);
		inline void print_topological_sort(void);
		inline void print_vertex_order    (void);

		/*
		 * Graph features
		 */
		inline bool is_empty(void);
		inline std::vector<T*> topological_sort(void);
		inline std::vector<T*> get_vertex_order(void);

	protected:
		/*
		 * A vector of vertices
		 */
		AdjacencyList vertices;

		/*
		 * Logger
		 */
		Logger log;
};

/*
 * Helper functions
 */
/*void topological_sort_vertex (
	Vertex* vertex,
	Colour& colour,
	const Graph<Vertex>::AdjacencyList& adjacency_list,
	Graph<Vertex>::VertexMap<Colour>& visited,
	std::vector<Vertex*>& sorted
);*/

#include "graph.cpp"

#endif

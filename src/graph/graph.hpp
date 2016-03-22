//============================================================================
//        Name: graph.hpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: Defines a directed graph
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

/*
 * A Directed Graph
 */
class Graph
{
	public:
		/*
		 * Data structures
		 */
		template<typename U>
		using VertexMap     = std::unordered_map<Vertex*, U>;
		using AdjacencyList = VertexMap< std::vector<std::pair<unsigned short, Vertex*>>>;

	protected:
		/*
		 * A vector of vertices
		 */
		AdjacencyList vertices;

		/*
		 * In degree per vertex
		 */
		VertexMap<int> in_degrees;

		/*
		 * Logger
		 */
		Logger log;

	public:
		Graph();
		~Graph();

		/*
		 * Setters & Getters
		 */
		bool                   is_leaf           (Vertex *u)                 const;
		bool                   is_empty          (void)                      const;
		bool                   contains          (const unsigned short &pos) const;
		bool                   vertex_exists     (Vertex *u)                 const;

		void                   add_vertex        (Vertex *u);
		void                   add_edge          (Vertex *u, Vertex *v, const unsigned short &input_port_v);

		void                   find_in_degrees   (void);
		int                    get_in_degree     (Vertex *u);
		const VertexMap<int>   get_in_degrees    (void);

		unsigned short         get_vertices_no   (void)   const;
		const AdjacencyList    get_adjacency_list(void)   const;


		Vertex*                get_vertex_by_name    (const std::string   &name) const;
		Vertex*                get_vertex_by_position(const unsigned short &pos) const;
		std::vector<Vertex*>   get_vertex_children   (Vertex *u)                 const;
		std::vector<std::pair<unsigned short, Vertex*>> get_vertex_children_and_ports(Vertex *u) const ;

		/*
		 * Printouts
		 */
		void print_in_degrees      (void);
		void print_adjacency_list  (void);
		void print_vertex_order    (void);
		void print_topological_sort(void);

		/*
		 * Graph features
		 */
		std::vector<Vertex*> get_vertex_order(void);
		std::vector<Vertex*> topological_sort(void);
};

/*
 * Recursive DFS function to visit all vertices from 'vertex'.
 */
void dfs(
	Vertex                    *vertex,
	Colour                     &colour,
	const Graph::AdjacencyList &adjacency_list,
	Graph::VertexMap<Colour>   &visited,
	std::vector<Vertex*>       &sorted
);

#endif

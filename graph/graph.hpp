//============================================================================
//        Name: graph.hpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: Defines a directed graph
//============================================================================

#ifndef _GRAPH_HPP_
#define _GRAPH_HPP_

#include <stack>
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
		using AdjacencyList = VertexMap< std::vector< Vertex*> >;

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
		void                   add_vertex(Vertex* u);
		void                   add_edge  (Vertex* u, Vertex* v);
		
		void                   find_in_degrees(void);
		unsigned short         get_vertices_no(void);
		int                    get_in_degree(Vertex* u);
		VertexMap<int>         get_in_degrees(void);
		const AdjacencyList    get_adjacency_list(void) const;
		std::vector<Vertex*>   get_vertex_children(Vertex* u);
		Vertex* get_vertex_by_name(std::string& name);
		Vertex* get_vertex_by_position(unsigned short pos);

		/*
		 * Printouts
		 */
		void print_in_degrees      (void);
		void print_adjacency_list  (void);
		void print_topological_sort(void);
		void print_vertex_order    (void);

		/*
		 * Graph features
		 */
		bool is_empty(void);
		bool contains(unsigned short pos);
		bool vertex_exists(Vertex* u);
		std::vector<Vertex*> get_vertex_order(void);
		std::vector<Vertex*> topological_sort(void);
		
		/*
		 * ATTENTION: Under development (Use with own risk :p)
		 */
		std::vector<Vertex*> all_paths_from_vertex(Vertex* vertex);
		std::vector<std::vector<Vertex*>> all_paths(void);
};

/*
 * Recursive DFS function to visit all vertices.
 */
void dfs(
	Vertex* vertex,
	Colour& colour,
	const Graph::AdjacencyList& adjacency_list,
	Graph::VertexMap<Colour>& visited,
	std::vector<Vertex*>& sorted
);

/*
 * Iterative DFS function to visit all vertices.
 */
void dfs_iterative(
	Vertex* vertex,
	const Graph::AdjacencyList& adjacency_list,
	Graph::VertexMap<Colour>& visited,
	std::stack<Vertex*>& sorted
);

#endif

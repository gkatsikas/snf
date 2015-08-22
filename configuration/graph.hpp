//============================================================================
// Name        : graph.hpp
// Copyright   : KTH ICT CoS Network Systems Lab
// Description : Defines a simple directed graph
//============================================================================

#ifndef _GRAPH_HPP_
#define _GRAPH_HPP_

#include <unordered_map>

#include "vertex.hpp"
#include "../logger/logger.hpp"

class Graph
{
	public:
		Graph();
		~Graph();

		/*
		 * Data structures
		 */
		template<typename T>
		using VertexMap     = std::unordered_map<Vertex*, T>;
		using AdjacencyList = VertexMap<std::vector<Vertex*>>;

		/*
		 * In degree per vertex
		 */
		VertexMap<int> in_degrees;

		/*
		 * Setters & Getters
		 */
		void                   add_vertex(Vertex* u);
		void                   add_edge(Vertex* u, Vertex* v);

		unsigned short         get_vertices_no(void);
		void                   find_in_degrees(void);
		int                    get_in_degree(Vertex*);
		VertexMap<int>         get_in_degrees(void);
		const AdjacencyList&   get_adjacency_list(void) const;
		Vertex* get_vertex_by_name(std::string& name);
		Vertex* get_vertex_by_position(unsigned short& pos);

		/*
		 * Printouts
		 */
		void print_in_degrees      (void);
		void print_adjacency_list  (void);
		void print_topological_sort(void);
		void print_chain_order     (void);

		/*
		 * Graph features
		 */
		bool is_empty(void);
		std::vector<Vertex*> topological_sort(void);
		std::vector<Vertex*> get_chain_order(void);

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
 * Colors will "paint" the vertices in the topological sort
 */
enum Colour { White, Grey, Black };

/*
 * Helper functions
 */
void topological_sort_vertex (
	Vertex* vertex,
	Colour& colour,
	const Graph::AdjacencyList& adjacency_list,
	Graph::VertexMap<Colour>& visited,
	std::vector<Vertex*>& sorted
);

#endif

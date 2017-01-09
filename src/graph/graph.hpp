#ifndef _GRAPH_HPP_
#define _GRAPH_HPP_

/*
 * graph.hpp
 *
 * Defines a directed graph.
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
class Graph {

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
		VertexMap<short> in_degrees;

		/*
		 * Logger
		 */
		Logger log;

	public:
		Graph ();
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
		short                  get_in_degree     (Vertex *u);
		const VertexMap<short> get_in_degrees    (void);

		unsigned short         get_vertices_no   (void)   const;
		const AdjacencyList    get_adjacency_list(void)   const;


		Vertex*                get_vertex_by_name    (const std::string   &name);
		Vertex*                get_vertex_by_position(const unsigned short &pos) const;
		std::vector<Vertex*>   get_vertex_children   (Vertex *u)                 const;
		std::vector<std::pair<unsigned short, Vertex*>> get_vertex_children_and_ports(Vertex *u) const ;

		/*
		 * Graph features
		 */
		std::vector<Vertex*>   get_vertex_order(void);
		std::vector<Vertex*>   topological_sort(void);

		/*
		 * Printouts
		 */
		void print_in_degrees      (void);
		void print_adjacency_list  (void);
		void print_vertex_order    (void);
		void print_topological_sort(void);
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

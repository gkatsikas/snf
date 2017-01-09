// -*- c-basic-offset: 4 -*-
/* graph.cpp
 * 
 * Implements a directed graph with topological sorting.
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

#include "graph.hpp"
#include "../shared/helpers.hpp"

Graph::Graph() {
	this->log.set_logger_file(__FILE__);
	debug_chatter(this->log, "\tGraph constructed");
}

Graph::~Graph() {
	for (auto &pair : this->get_in_degrees())
		if ( pair.first )
			delete pair.first;
	this->in_degrees.clear();
	this->vertices.clear();

	debug_chatter(this->log, "\tGraph deleted");
}

/*
 * Check if vertex is a leaf (out degree is 0)
 */
bool
Graph::is_leaf(Vertex *u) const {
	if ( !this->vertex_exists(u) )
		return false;

	if ( this->get_adjacency_list().at(u).size() == 0 )
		return true;
	return false;
}

/*
 * Check if graph has any vertices
 */
bool
Graph::is_empty(void) const {
	if ( this->get_adjacency_list().size() == 0 )
		return true;
	return false;
}

/*
 * Position field corresponds to a unique key for the graph
 */
bool
Graph::contains(const unsigned short &pos) const {
	for ( auto &pair : this->vertices )
		if ( pair.first->get_position() == pos )
			return true;
	return false;
}

/*
 * Check whether this vertex is already in the graph
 */
bool
Graph::vertex_exists(Vertex *u) const {
	return this->contains(u->get_position());
}

/*
 * Add a new vertex in the graph
 */
void
Graph::add_vertex(Vertex *u) {
	// Check if it already exists
	if ( this->vertex_exists(u) ) {
		debug_chatter(this->log, "\t\tVertex exists: [" << u->get_name() << ":" << u->get_position() <<"]");
		return;
	}

	this->vertices[u];
	debug_chatter(this->log, "\t\tVertex added [" << u->get_name() << ":" << u->get_position() <<"]");
}

/*
 * Add a new connection in the graph
 */
void
Graph::add_edge(Vertex *u, Vertex *v, const unsigned short &input_port_v) {
	// Add these two vertices if do not exist
	this->add_vertex(std::move(u));
	this->add_vertex(std::move(v));

	// Check whether the edge does exist
	for ( auto &neighbour : this->vertices[u] ) {
		if ( neighbour.second->get_position() == v->get_position() ) {
			debug_chatter(this->log, "\t\tEdge exists: [" << u->get_name() << ":" << u->get_position() << 
							"] -> [" << v->get_name() << ":" << v->get_position() << "]");
			return;
		}
	}

	// Add v as being adjacent to u
	this->vertices[u].push_back(std::make_pair(input_port_v, std::move(v)));
	debug_chatter(this->log, "\t\tEdge  added: [" << u->get_name() << ":" << u->get_position() << "] -> ["
					<< v->get_name() << ":" << v->get_position() << "]");
}

/*
 * Calculate the in degrees of all vertices
 */
void
Graph::find_in_degrees(void) {
	// Empty any previous entry
	this->in_degrees.clear();

	// Populate the data structure
	for (auto &pair : this->vertices) {
		// Initialise in degree for this vertex
		this->in_degrees[pair.first];

		for (auto& neighbour : pair.second)
			++this->in_degrees[neighbour.second];
	}
}

/*
 * Get the in degree of a specific vertex
 */
short
Graph::get_in_degree(Vertex *u) {
	// If the data structure is empty, we need to invoke the find method first
	if ( this->in_degrees.empty() )
		this->find_in_degrees();
	return this->in_degrees.at(u);
}

/*
 * Get all the in degrees of the graph vertices
 */
const Graph::VertexMap<short>
Graph::get_in_degrees(void) {
	// If the data structure is empty, we need to invoke the find method first
	if ( this->in_degrees.empty() )
		this->find_in_degrees();
	return this->in_degrees;
}

/*
 * Get the number of vertices in the graph
 */
unsigned short
Graph::get_vertices_no(void) const {
	return this->vertices.size();
}

/*
 * Get the adjacency list of the graph
 */
const Graph::AdjacencyList
Graph::get_adjacency_list(void) const {
	return this->vertices;
}

/*
 * Get a graph vertex by name (The first one to be found)
 */
Vertex*
Graph::get_vertex_by_name(const std::string &name) {
	if ( this->is_empty() )
		return NULL;

	if ( name.empty() ) {
		debug_chatter(this->log, "\tBad vertex name");
		return NULL;
	}

	for (auto &pair : this->vertices) {
		if ( pair.first->get_name() == name )
			return pair.first;
	}

	return NULL;
}

/*
 * Get a graph vertex by its position
 */
Vertex*
Graph::get_vertex_by_position(const unsigned short &pos) const {
	if ( this->is_empty() )
		return NULL;

	for ( auto &pair : this->vertices ) {
		if ( pair.first->get_position() == pos ) {
			return pair.first;
		}
	}

	return NULL;
}

/*
 * The natural flow of the NF chain is the reverse topological sort
 */
std::vector<Vertex*>
Graph::get_vertex_order(void) {
	std::vector<Vertex*> chain_order;
	std::vector<Vertex*> topo_sort;

	try {
		topo_sort = this->topological_sort();
	}
	catch (const std::exception& e) {
		error_chatter(this->log, "\t|--> " << e.what());
		exit(NF_CHAIN_NOT_ACYCLIC);
	}

	if ( topo_sort.empty() ) {
		warn_chatter(this->log, "\tEmpty topo sort");
		return chain_order;
	}

	std::reverse(topo_sort.begin(), topo_sort.end());
	for ( Vertex *v : topo_sort )
		chain_order.push_back(v);

	return chain_order;
}

/*
 * The natural flow of the NF chain is the reverse topological sort
 */
std::vector<Vertex*>
Graph::get_vertex_children(Vertex *u) const {
	std::vector<Vertex*> children;
	for ( auto &pair : this->vertices.at(u) ) {
		children.push_back(pair.second);
	}
	return children;
}

std::vector<std::pair<unsigned short, Vertex*>> Graph::get_vertex_children_and_ports(Vertex *u) const {
	return this->vertices.at(u);
}

/*
 * Simple topological sorting
 */
std::vector<Vertex*>
Graph::topological_sort(void) {
	if ( this->is_empty() ) {
		warn_chatter(this->log, "\tGraph is empty");
		std::vector<Vertex*> sorted;
		return sorted;
	}

	// A list of all the vertices of the graph, associated with their in degrees.
	VertexMap<short> in_degs = this->get_in_degrees();

	// The first vertex of the graph
	Vertex *first = this->get_vertex_by_position(1);
	
	std::vector<Vertex*> sorted;
	sorted.reserve(in_degs.size());

	// List of in degrees has only one node and this node is a leaf.
	// |--> Singleton graph (one node only)
	bool singleton_graph = (
		(in_degs.size() == 1) && 
		this->is_leaf(first)
	);
	// No need for DFS, just output the singleton.
	if ( singleton_graph ) {
		debug_chatter(this->log, "\tTopological sort found a singleton graph");
		sorted.push_back(first);
		return sorted;
	}

	VertexMap<Colour> visited;
	visited.reserve(in_degs.size());

	for (auto &pair : in_degs) {
		// Vertex has in degree of 0
		if (pair.second == 0) {
			
			Vertex *vertex = pair.first;
			Colour &colour = visited[vertex];

			// This should never happen here because vertex has in degree 0
			assert (colour == White);

			// If no successors exist, DFS is in vain.
			if ( this->is_leaf(vertex) )
				continue;

			// Not visited, go DFS
			dfs(vertex, colour, this->vertices, visited, sorted);
		}
	}

	if ( (sorted.size() == 0) && (this->get_vertices_no() > 1) ) {
		error_chatter(this->log, "\tCycle in graph");
		exit(NF_CHAIN_NOT_ACYCLIC);
	}

	return sorted;
}

/*
 * Recursive DFS function to visit all vertices from 'vertex'
 */
void
dfs(
	Vertex *vertex, Colour &colour, const Graph::AdjacencyList &adjacency_list,
	Graph::VertexMap<Colour> &visited, std::vector<Vertex*> &sorted) {

	Logger log(__FILE__);

	colour = Grey;

	try {		
		for ( auto& neighbour : adjacency_list.at(vertex) ) {
			Colour& neighbour_colour = visited[neighbour.second];

			// Unvisited node --> recursion
			if (neighbour_colour == White)
				dfs(neighbour.second, neighbour_colour, adjacency_list, visited, sorted);
			// Ambiguous color denotes a cycle!
			else if (neighbour_colour == Grey) {
				error_chatter(log, "\tCycle in graph");
				exit(NF_CHAIN_NOT_ACYCLIC);
			}
		}
	}
	catch (const std::logic_error& le) {
		error_chatter(log, "\tCycle in graph: " << le.what());
		exit(NF_CHAIN_NOT_ACYCLIC);
	}
	catch (const std::exception& e) {
		error_chatter(log, "\tGraph is not built properly, invalid access to memory.");
		error_chatter(log, "\t|--> " << e.what());
		exit(NF_CHAIN_NOT_ACYCLIC);
	}

	// Visited nodes are in black list :p
	colour = Black;
	sorted.push_back(vertex);
}

/*
 * Print graph info
 */
void
Graph::print_in_degrees(void) {
	unsigned short counter   = 0;
	unsigned short list_size = this->get_in_degrees().size();
	const std::string align  = "\t\t\t\t\t\t";
	std::ostringstream output;

	def_chatter(this->log, "\t================== In degrees =================");
	for (auto &pair : this->get_in_degrees()) {
		if ( counter > 0 ) {
			output << align;
		}
		output 	<< "\t" << std::setw(2) << pair.first->get_name() 
				<< " has in-degree: " << pair.second;

		if ( counter < list_size-1 )
			output << std::endl;
		counter++;
	}
	def_chatter(this->log, output.str());
	def_chatter(this->log, "\t===============================================");
}

void
Graph::print_adjacency_list(void) {
	unsigned short counter   = 0;
	unsigned short list_size = this->get_adjacency_list().size();
	const std::string align  = "\t\t\t\t\t\t";
	std::ostringstream output;

	def_chatter(this->log, "\t================ Adjacency List ===============");
	for (auto& pair : this->get_adjacency_list()) {
		if ( counter > 0 ) {
			output << align;
		}
		output 	<< "\t" << std::setw(2) << pair.first->get_name() 
				<< ":" << pair.first->get_position() << "-> ";

		unsigned short elements = 0;
		unsigned short elements_list_size = pair.second.size();
		for (auto& neighbour : pair.second) {
			output 	<< "[" << neighbour.first << "]" << neighbour.second->get_name() 
					<< ":" << neighbour.second->get_position();
			if ( elements < elements_list_size-1 )
				output << ", ";
			elements++;
		}

		if ( counter < list_size-1 )
			output << std::endl;
		counter++;
	}
	def_chatter(this->log, output.str());
	def_chatter(this->log, "\t===============================================");
}

void
Graph::print_topological_sort(void) {
	unsigned short counter   = 0;
	const std::string align  = "\t\t\t\t\t\t";
	std::ostringstream output;

	def_chatter(this->log, "\t=============== Topological Sort ==============");
	std::vector<Vertex*> ts;
	try {
		ts = this->topological_sort();
	}
	catch (const std::exception& e) {
		error_chatter(this->log, "\t\t|--> " << e.what());
		exit(NF_CHAIN_NOT_ACYCLIC);
	}

	unsigned short list_size = ts.size();

	for (Vertex *v : ts) {
		output << "\t"<< v->get_name();
		if ( counter < list_size-1 )
			output << ", ";
		if ( counter % 3 == 0 )
			output << std::endl << align;
		counter++;
	}
	def_chatter(this->log, output.str());
	def_chatter(this->log, "\t===============================================");
}

void
Graph::print_vertex_order(void) {
	unsigned short counter = 0;
	unsigned short list_size = this->get_vertex_order().size();
	std::ostringstream output;

	if ( this->get_vertices_no() <= 1 ) {
		return;
	}

	def_chatter(this->log, "\t================= Vertex Order ================");
	output << "\t";
	for (Vertex *v : this->get_vertex_order()) {
		output << v->get_name();

		if ( counter < list_size-1 )
			output << ", ";
		counter++;
	}
	def_chatter(this->log, output.str());
	def_chatter(this->log, "\t===============================================");
}

/*std::vector<Vertex*>
Graph::all_paths_from_vertex(Vertex *vertex) {
	if ( this->is_empty() ) {
		error_chatter(this->log, "\tGraph is empty");
		std::vector<Vertex*> paths;
		return paths;
	}

	VertexMap<Colour> visited;
	Colour& colour = visited[vertex];

	// Not visited, go DFS
	std::vector<Vertex*> paths;
	dfs(vertex, colour, this->vertices, visited, paths);

	return paths;
}*/

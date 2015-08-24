//============================================================================
//        Name: graph.cpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: Implements a simple directed graph with topological sort and
//              check for cycles.
//============================================================================

#ifndef _GRAPH_CPP_
#define _GRAPH_CPP_

#include "graph.hpp"
#include "../helpers.hpp"

template <typename T>
Graph<T>::Graph() {
	this->log.set_logger_file(__FILE__);
	log << debug << "Graph constructed" << def << std::endl;
}

template <typename T>
Graph<T>::~Graph() {
	for (auto& pair : this->get_in_degrees())
		delete pair.first;
	this->in_degrees.clear();
	this->vertices.clear();

	log << debug << "Graph destroyed" << def << std::endl;
}

template <typename T>
void Graph<T>::add_vertex(T* u) {
	this->vertices[u];
	log << debug << "\tVertex added [" << u->get_name() << ":" << u->get_position() <<"]" << def << std::endl;
}

/*
 * Add a new connection in the graph
 */
template <typename T>
void Graph<T>::add_edge(T* u, T* v) {
	// initialise adjacency list for v
	this->vertices[v];

	// add v as being adjacent to u
	if ( std::find(this->vertices[u].begin(), this->vertices[u].end(), v) != this->vertices[u].end() )
		log 	<< warn  << "\t\t\tEdge exists: [" << u->get_name() << ":" << u->get_position() << "] -> ["
			<< v->get_name() << ":" << v->get_position() << "]" << def << std::endl;
	else {
		this->vertices[u].push_back(v);
		log 	<< debug << "\t\t\tEdge  added: [" << u->get_name() << ":" << u->get_position() << "] -> ["
			<< v->get_name() << ":" << v->get_position() << "]" << def << std::endl;
	}
}

/*
 * Get the number of vertices in the graph
 */
template <typename T>
unsigned short Graph<T>::get_vertices_no(void) {
	return this->vertices.size();
}

/*
 * Calculate the in degrees of all vertices
 */
template <typename T>
void Graph<T>::find_in_degrees() {
	// Empty any previous entry
	in_degrees.clear();

	// Populate the data structure
	for (auto& pair : this->vertices) {
		// Initialise in degree for this vertex
		this->in_degrees[pair.first];

		for (T* neighbour : pair.second)
			++this->in_degrees[neighbour];
	}
}

/*
 * Get the in degree of a specific vertex
 */
template <typename T>
int Graph<T>::get_in_degree(T* v) {
	// If the data structure is empty, we need to invoke the find method first
	if ( this->in_degrees.empty() )
		this->find_in_degrees();
	return this->in_degrees.at(v);
}

/*
 * Get all the in degrees of the graph vertices
 */
template <typename T>
Graph<T>::VertexMap<int> Graph<T>::get_in_degrees() {
	// If the data structure is empty, we need to invoke the find method first
	if ( this->in_degrees.empty() )
		this->find_in_degrees();
	return this->in_degrees;
};

template <typename T>
T* Graph<T>::get_vertex_by_name(std::string& name) {
	if ( name.empty() ) {
		//log << warn << "\tBad vertex name" << def << std::endl;
		return NULL;
	}

	if ( this->is_empty() ) {
		log << warn << "\tGraph is empty" << def << std::endl;
		return NULL;
	}

	for (auto& pair : this->vertices) {
		if ( pair.first->get_name().compare(name) )
			return pair.first;
	}

	log << warn << "\tVertex not found" << def << std::endl;
	return NULL;
}

template <typename T>
T* Graph<T>::get_vertex_by_position(unsigned short pos) {
	if ( pos >= this->get_vertices_no() ) {
		//log << warn << "\tBad vertex position" << def << std::endl;
		return NULL;
	}

	if ( this->is_empty() ) {
		log << warn << "\tGraph is empty" << def << std::endl;
		return NULL;
	}

	for (auto& pair : this->vertices) {
		if ( pair.first->get_position() == pos )
			return pair.first;
	}

	// log << warn << "\tVertex not found" << def << std::endl;
	return NULL;
}

/*
 * Check if graph has any vertices
 */
template <typename T>
bool Graph<T>::is_empty(void) {
	if ( this->get_adjacency_list().empty() )
		return true;
	return false;
}

/*
 * Print graph info
 */
template <typename T>
void Graph<T>::print_in_degrees(void) {
	log << info << "================== In degrees =================" << def << std::endl;
	for (auto& pair : this->get_in_degrees())
		log << info << std::setw(2) << pair.first->get_name() << " has in-degree: " << pair.second << def << std::endl;
	log << info << "===============================================" << def << std::endl;
}

template <typename T>
void Graph<T>::print_adjacency_list(void) {
	log << info << "================ Adjacency List ===============" << def << std::endl;
        for (auto& pair : this->get_adjacency_list()) {
		log << info << std::setw(2) << pair.first->get_name() << "-> ";
		for (Vertex* neighbour : pair.second)
			log << info << neighbour->get_name() << ", " << def;
		log << def << std::endl;
        }
	log << info << "===============================================" << def << std::endl;
};

template <typename T>
void Graph<T>::print_topological_sort(void) {
	log << info << "=============== Topological Sort ==============" << def << std::endl;
	std::vector<Vertex*> ts;
	try {
		ts = this->topological_sort();
	}
	catch (const std::exception& e) {
		log << error << "|--> " << e.what() << def << std::endl;
		exit(NF_CHAIN_NOT_ACYCLIC);
	}
	for (Vertex* v : ts)
		log << info << v->get_name() << "," << def;
	log << std::endl;
	log << info << "===============================================" << def << std::endl;
}

template <typename T>
void Graph<T>::print_vertex_order(void) {
	log << info << "================= Vertex Order ================" << def << std::endl;
	for (Vertex* v : this->get_vertex_order()) {
		log << info << v->get_name() << "," << def;
	}
	log << std::endl;
	log << info << "===============================================" << def << std::endl;
}

/*
 * Simple topological sorting
 */
template <typename T>
std::vector<T*> Graph<T>::topological_sort() {
	if ( this->is_empty() ) {
		log << warn << "\tGraph is empty" << def << std::endl;
		std::vector<T*> sorted;
		return sorted;
	}

	VertexMap<int> in_degs = get_in_degrees();

	std::vector<T*> sorted;
	sorted.reserve(in_degs.size());

	VertexMap<Colour> visited;
	visited.reserve(in_degs.size());

	for (auto& pair : in_degs) {
		// Vertex has in degree of 0
		if (pair.second == 0) {
			Vertex* vertex = pair.first;
			Colour& colour = visited[vertex];

			// This should never happen here because vertex has in degree 0
			assert (colour == White);

			// Not visited, go
			topological_sort_vertex(vertex, colour, this->vertices, visited, sorted);
		}
	}

	if ( (sorted.size() == 0) && (this->get_vertices_no() > 1) )
		throw std::logic_error("Cycle in graph");

	return sorted;
}

/*
 * The natural flow of the NF chain is the reverse topological sort
 */
template <typename T>
std::vector<T*> Graph<T>::get_vertex_order(void) {
	std::vector<T*> chain_order;
	std::vector<T*> topo_sort;

	try {
		topo_sort = this->topological_sort();
	}
	catch (const std::exception& e) {
		log << error << "|--> " << e.what() << def << std::endl;
		exit(NF_CHAIN_NOT_ACYCLIC);
	}

	std::reverse(topo_sort.begin(), topo_sort.end());
	for ( T* v : topo_sort )
		chain_order.push_back(v);

	return chain_order;
}

/*
 * Recursive function to visit all vertices and do the topological sort
 */
void topological_sort_vertex(Vertex* vertex, Colour& colour, const Graph<Vertex>::AdjacencyList& adjacency_list,
                        Graph<Vertex>::VertexMap<Colour>& visited, std::vector<Vertex*>& sorted) {
	Logger log(__FILE__);

	colour = Grey;

	for (Vertex* neighbour : adjacency_list.at(vertex)) {
		Colour& neighbour_colour = visited[neighbour];

		// Unvisited node --> recursion
		if (neighbour_colour == White) {
			topological_sort_vertex(neighbour, neighbour_colour, adjacency_list, visited, sorted);
		}
		// Ambiguous color denotes a cycle!
		else if (neighbour_colour == Grey)
			throw std::logic_error("Cycle in graph");
	}

	// Visited nodes are in black list :p
	colour = Black;
	sorted.push_back(vertex);
}

#endif

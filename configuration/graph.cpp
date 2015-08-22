//============================================================================
// Name        : graph.cpp
// Copyright   : KTH ICT CoS Network Systems Lab
// Description : Implements a simple directed graph with topological sort and
//               check for cycles.
//============================================================================

#include "graph.hpp"
#include "../helpers.hpp"

Graph::Graph() {
	this->log.set_logger_file(__FILE__);
	log << debug << "Graph constructed" << def << std::endl;
}

Graph::~Graph() {
	for (auto& pair : this->get_in_degrees())
		delete pair.first;
	this->in_degrees.clear();
	this->vertices.clear();

	log << debug << "Graph destroyed" << def << std::endl;
}

void Graph::add_vertex(Vertex* u) {
	this->vertices[u];

	log << debug << "\tVertex added [" << u->get_name() << "]" << def << std::endl;
}

/*
 * Add a new connection in the graph
 */
void Graph::add_edge(Vertex* u, Vertex* v) {
	// initialise adjacency list for v
	this->vertices[v];
	// add v as being adjacent to u
	this->vertices[u].push_back(v);

	log << debug << "\tEdge added [" << u->get_name() << "] -> [" << v->get_name() << "]" << def << std::endl;
}

/*
 * Get the number of vertices in the graph
 */
unsigned short Graph::get_vertices_no(void) {
	return this->vertices.size();
}

/*
 * Calculate the in degrees of all vertices
 */
void Graph::find_in_degrees() {
	// Empty any previous entry
	in_degrees.clear();

	// Populate the data structure
	for (auto& pair : this->vertices) {
		// Initialise in degree for this vertex
		this->in_degrees[pair.first];

		for (Vertex* neighbour : pair.second)
			++this->in_degrees[neighbour];
	}
}

/*
 * Get the in degree of a specific vertex
 */
int Graph::get_in_degree(Vertex* v) {
	// If the data structure is empty, we need to invoke the find method first
	if ( this->in_degrees.empty() )
		this->find_in_degrees();
	return this->in_degrees.at(v);
}

/*
 * Get all the in degrees of the graph vertices
 */
Graph::VertexMap<int> Graph::get_in_degrees() {
	// If the data structure is empty, we need to invoke the find method first
	if ( this->in_degrees.empty() )
		this->find_in_degrees();
	return this->in_degrees;
};

/*
 * Get the adjacent nodes' list
 */
const Graph::AdjacencyList& Graph::get_adjacency_list() const {
	return this->vertices;
}

Vertex* Graph::get_vertex_by_name(std::string& name) {
	if ( name.empty() ) {
		log << warn << "\tBad vertex name" << def << std::endl;
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

	return NULL;
}

Vertex* Graph::get_vertex_by_position(unsigned short& pos) {
	if ( pos >= this->get_vertices_no() ) {
		log << warn << "\tBad position given" << def << std::endl;
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

	return NULL;
}

/*
 * Check if graph has any vertices
 */
bool Graph::is_empty(void) {
	if ( this->get_adjacency_list().empty() )
		return true;
	return false;
}

/*
 * Print graph info
 */
void Graph::print_in_degrees(void) {
	log << info << "================== In degrees =================" << def << std::endl;
	for (auto& pair : this->get_in_degrees())
		log << info << std::setw(2) << pair.first->get_name() << " has in-degree: " << pair.second << def << std::endl;
	log << info << "===============================================" << def << std::endl;
}

void Graph::print_adjacency_list(void) {
	log << info << "================ Adjacency List ===============" << def << std::endl;
        for (auto& pair : this->get_adjacency_list()) {
		log << info << std::setw(2) << pair.first->get_name() << "-> ";
		for (Vertex* neighbour : pair.second)
			log << info << neighbour->get_name() << ", " << def;
		log << def << std::endl;
        }
	log << info << "===============================================" << def << std::endl;
};

void Graph::print_topological_sort(void) {
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

void Graph::print_chain_order(void) {
	log << info << "================ NF Chain Order ===============" << def << std::endl;
	for (Vertex* v : this->get_chain_order()) {
		log << info << v->get_name() << "," << def;
	}
	log << std::endl;
	log << info << "===============================================" << def << std::endl;
}

/*
 * Simple topological sorting
 */
std::vector<Vertex*> Graph::topological_sort() {
	if ( this->is_empty() ) {
		log << warn << "\tGraph is empty" << def << std::endl;
		std::vector<Vertex*> sorted;
		return sorted;
	}

	VertexMap<int> in_degs = get_in_degrees();

	std::vector<Vertex*> sorted;
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
 * Recursive function to visit all vertices and do the topological sort
 */
void topological_sort_vertex(Vertex* vertex, Colour& colour, const Graph::AdjacencyList& adjacency_list,
                        Graph::VertexMap<Colour>& visited, std::vector<Vertex*>& sorted) {
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

/*
 * The natural flow of the NF chain is the reverse topological sort
 */
std::vector<Vertex*> Graph::get_chain_order(void) {
	std::vector<Vertex*> chain_order;
	std::vector<Vertex*> topo_sort;

	try {
		topo_sort = this->topological_sort();
	}
	catch (const std::exception& e) {
		log << error << "|--> " << e.what() << def << std::endl;
		exit(NF_CHAIN_NOT_ACYCLIC);
	}

	std::reverse(topo_sort.begin(), topo_sort.end());
	for ( Vertex* v : topo_sort )
		chain_order.push_back(v);

	return chain_order;
}

//============================================================================
// Name        : graph.cpp
// Copyright   : KTH ICT CoS Network Systems Lab
// Description : Implements a simple directed graph with topological sort and
//               check for cycles.
//============================================================================

#include "graph.hpp"

Graph::Graph() {
	this->log.set_logger_file(__FILE__);
}

Graph::~Graph() {
	for (auto& pair : this->get_in_degrees())
		delete pair.first;
	this->in_degrees.clear();

	this->vertices.clear();

	log << debug << "Graph destroyed" << def << std::endl;
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
	log << info << "===============================================" << def << std::endl;
	log << info << "================== In degrees =================" << def << std::endl;
	for (auto& pair : this->get_in_degrees())
		log << info << std::setw(2) << pair.first->get_name() << " has in-degree: " << pair.second << def << std::endl;
	log << info << "===============================================" << def << std::endl;
}

void Graph::print_adjacency_list(void) {
	log << info << "===============================================" << def << std::endl;
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
	log << info << "===============================================" << def << std::endl;
	log << info << "=============== Topological Sort ==============" << def << std::endl;
	for (Vertex* v : this->topological_sort())
		log << info << v->get_name() << "," << def;
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
		// vertex has in degree of 0
		if (pair.second == 0) {
			Vertex* vertex = pair.first;
			Colour& colour = visited[vertex];

			// Not visited, go
			//if (colour == White)
			assert (colour == White);
			topological_sort_vertex(vertex, colour, this->vertices, visited, sorted);
		}
	}

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
		else if (neighbour_colour == Grey) {
			//throw std::runtime_error("Cycle in graph");
			log << error << "|--> Cycle in graph" << def << std::endl;
			throw std::runtime_error("");
		}
	}

	// Visited nodes are in black list :p
	colour = Black;
	sorted.push_back(vertex);
}

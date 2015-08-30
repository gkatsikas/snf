//============================================================================
//        Name: graph.cpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: Implements a directed graph with topological sort and
//              check for cycles.
//============================================================================

#include "graph.hpp"
#include "../helpers.hpp"

Graph::Graph() {
	this->log.set_logger_file(__FILE__);
	//log << debug << "\tGraph constructed" << def << std::endl;
}

Graph::~Graph() {
	for (auto& pair : this->get_in_degrees())
		if ( pair.first != NULL )
			delete pair.first;
	this->in_degrees.clear();
	this->vertices.clear();

	//log << debug << "\tGraph destroyed" << def << std::endl;
}

/*
 * Check if vertex is a leaf (out degree is 0)
 */
bool Graph::is_leaf(Vertex* u) {
	if ( !this->vertex_exists(u) )
		return false;

	if ( this->get_adjacency_list().at(u).size() == 0 )
		return true;
	return false;
}

/*
 * Check if graph has any vertices
 */
bool Graph::is_empty(void) {
	if ( this->get_adjacency_list().size() == 0 )
		return true;
	return false;
}

/*
 * Position field corresponds to a unique key for the graph
 */
bool Graph::contains(unsigned short pos) {
	for ( auto& pair : this->vertices )
		if ( pair.first->get_position() == pos )
			return true;
	return false;
}

/*
 * Check whether this vertex is already in the graph
 */
bool Graph::vertex_exists(Vertex* u) {
	return this->contains(u->get_position());
}

/*
 * Add a new vertex in the graph
 */
void Graph::add_vertex(Vertex* u) {
	// Check if it already exists
	if ( this->vertex_exists(u) ) {
		//log << debug << "\t\tVertex exists: [" << u->get_name() << ":" << u->get_position() <<"]" << def << std::endl;
		return;
	}

	this->vertices[u];
	//log << debug << "\t\tVertex added [" << u->get_name() << ":" << u->get_position() <<"]" << def << std::endl;
}

/*
 * Add a new connection in the graph
 */
void Graph::add_edge(Vertex* u, Vertex* v) {

	// Add these two vertices if do not exist
	this->add_vertex(std::move(u));
	this->add_vertex(std::move(v));

	// Check whether the edge does exist
	for ( Vertex* neighbour : this->vertices[u] ) {
		if ( neighbour->get_position() == v->get_position() ) {
			//log 	<< warn  << "\t\tEdge exists: [" << u->get_name() << ":" << u->get_position() << "] -> ["
			//<< v->get_name() << ":" << v->get_position() << "]" << def << std::endl;
			return;
		}
	}

	// Add v as being adjacent to u
	this->vertices[u].push_back(std::move(v));
	//log 	<< debug << "\t\tEdge  added: [" << u->get_name() << ":" << u->get_position() << "] -> ["
	//		<< v->get_name() << ":" << v->get_position() << "]" << def << std::endl;
}

/*
 * Calculate the in degrees of all vertices
 */
void Graph::find_in_degrees(void) {
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
int Graph::get_in_degree(Vertex* u) {
	// If the data structure is empty, we need to invoke the find method first
	if ( this->in_degrees.empty() )
		this->find_in_degrees();
	return this->in_degrees.at(u);
}

/*
 * Get all the in degrees of the graph vertices
 */
Graph::VertexMap<int> Graph::get_in_degrees() {
	// If the data structure is empty, we need to invoke the find method first
	if ( this->in_degrees.empty() )
		this->find_in_degrees();
	return this->in_degrees;
}

/*
 * Get the number of vertices in the graph
 */
unsigned short Graph::get_vertices_no(void) {
	return this->vertices.size();
}

/*
 * Get the adjacency list of the graph
 */
const Graph::AdjacencyList Graph::get_adjacency_list(void) const {
	return this->vertices;
}

/*
 * Get a graph vertex by name (The first one to be found)
 */
Vertex* Graph::get_vertex_by_name(std::string& name) {
	if ( this->is_empty() )
		return NULL;

	if ( name.empty() ) {
		log << warn << "\tBad vertex name" << def << std::endl;
		return NULL;
	}

	for (auto& pair : this->vertices) {
		if ( pair.first->get_name() == name )
			return pair.first;
	}

	return NULL;
}

/*
 * Get a graph vertex by its position
 */
Vertex* Graph::get_vertex_by_position(unsigned short pos) {
	if ( this->is_empty() )
		return NULL;

	if ( pos > this->get_vertices_no() )
		return NULL;

	for ( auto& pair : this->vertices )
		if ( pair.first->get_position() == pos )
			return pair.first;

	return NULL;
}

/*
 * Print graph info
 */
void Graph::print_in_degrees(void) {
	log << "\t================== In degrees =================" << def << std::endl;
	log << "\t" << def;
	for (auto& pair : this->get_in_degrees())
		log << std::setw(2) << pair.first->get_name() << " has in-degree: " << pair.second << def << std::endl;
	log << "\t===============================================" << def << std::endl;
}

void Graph::print_adjacency_list(void) {
	log << "\t================ Adjacency List ===============" << def << std::endl;
	for (auto& pair : this->get_adjacency_list()) {
		log << std::setw(2) << "\t" << pair.first->get_name() << ":" << pair.first->get_position() << "-> ";
		for (Vertex* neighbour : pair.second)
			log << neighbour->get_name() << ":" << neighbour->get_position() << ", " << def;
		log << def << std::endl;
	}
	log << "\t===============================================" << def << std::endl;
}

void Graph::print_topological_sort(void) {
	log << "\t=============== Topological Sort ==============" << def << std::endl;
	std::vector<Vertex*> ts;
	try {
		ts = this->topological_sort();
	}
	catch (const std::exception& e) {
		log << error << "\t|--> " << e.what() << def << std::endl;
		exit(NF_CHAIN_NOT_ACYCLIC);
	}
	log << "\t" << def;
	for (Vertex* v : ts)
		log << v->get_name() << "," << def;
	log << std::endl;
	log << "\t===============================================" << def << std::endl;
}

void Graph::print_vertex_order(void) {
	log << "\t================= Vertex Order ================" << def << std::endl;
	log << "\t" << def;
	for (Vertex* v : this->get_vertex_order()) {
		log << v->get_name() << "," << def;
	}
	log << std::endl;
	log << "\t===============================================" << def << std::endl;
}

/*
 * The natural flow of the NF chain is the reverse topological sort
 */
std::vector<Vertex*> Graph::get_vertex_order(void) {
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

/*
 * The natural flow of the NF chain is the reverse topological sort
 */
std::vector<Vertex*> Graph::get_vertex_children(Vertex* u) {
	return this->vertices.at(u);
}

/*
 * Simple topological sorting
 */
std::vector<Vertex*> Graph::topological_sort(void) {
	if ( this->is_empty() ) {
		log << warn << "\tGraph is empty" << def << std::endl;
		std::vector<Vertex*> sorted;
		return sorted;
	}

	VertexMap<int> in_degs = this->get_in_degrees();

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

			// Not visited, go DFS
			dfs(vertex, colour, this->vertices, visited, sorted);
		}
	}

	if ( (sorted.size() == 0) && (this->get_vertices_no() > 1) )
		throw std::logic_error("Cycle in graph");

	return sorted;
}

/*
 * Recursive DFS functions to visit all vertices from 'vertex'
 */
void dfs(Vertex* vertex, Colour& colour, const Graph::AdjacencyList& adjacency_list,
		Graph::VertexMap<Colour>& visited, std::vector<Vertex*>& sorted) {

	Logger log(__FILE__);

	colour = Grey;

	try {
		for ( Vertex* neighbour : adjacency_list.at(vertex) ) {
			Colour& neighbour_colour = visited[neighbour];

			// Unvisited node --> recursion
			if (neighbour_colour == White) {
				dfs(neighbour, neighbour_colour, adjacency_list, visited, sorted);
			}
			// Ambiguous color denotes a cycle!
			else if (neighbour_colour == Grey)
				throw std::logic_error("Cycle in graph");
		}
	}
	catch (const std::exception& e) {
		throw std::logic_error("Graph is not built properly. Invalid access to memory \nCheck Click Configuration file");
	}

	// Visited nodes are in black list :p
	colour = Black;
	sorted.push_back(vertex);
}

/*std::vector<Vertex*> Graph::all_paths_from_vertex(Vertex* vertex) {
	if ( this->is_empty() ) {
		log << warn << "\tGraph is empty" << def << std::endl;
		std::vector<Vertex*> paths;
		return paths;
	}

	VertexMap<Colour> visited;
	Colour& colour = visited[vertex];

	// Not visited, go DFS
	std::vector<Vertex*> paths;
	dfs(vertex, colour, this->vertices, visited, paths);

	return paths;
}

std::vector<std::vector<Vertex*>> Graph::all_paths(void) {
	if ( this->is_empty() ) {
		log << warn << "\tGraph is empty" << def << std::endl;
		std::vector<std::vector<Vertex*>> all_paths;
		return all_paths;
	}

	VertexMap<int> in_degs = this->get_in_degrees();

	std::vector<std::vector<Vertex*>> all_paths;

	VertexMap<Colour> visited;
	visited.reserve(in_degs.size());

	for (auto& pair : in_degs) {

		std::vector<Vertex*> sorted;

		// Vertex has in degree of 0
		if (pair.second == 0) {
			Vertex* vertex = pair.first;
			Colour& colour = visited[vertex];

			// This should never happen here because vertex has in degree 0
			assert (colour == White);

			// Not visited, go DFS
			dfs(vertex, colour, this->vertices, visited, sorted);

			all_paths.push_back(sorted);
		}
	}

	return all_paths;
}*/

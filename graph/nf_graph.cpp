//============================================================================
//        Name: nf_graph.cpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: Implements a Click configuration as a DAG of Click Elements.
//============================================================================

#include "nf_graph.hpp"
#include <click/routervisitor.hh>

////////////////////////////////////////////////////////////////////////
// ElementVertex
////////////////////////////////////////////////////////////////////////
// While constructing an Element, check to which category it belongs to:
//   1. Input
//   2. Processing
//   3. Output
ElementVertex::ElementVertex(Element* element, std::string name,
				unsigned short pos) :
				Vertex(std::move(name), pos, VertexType::None),
				click_element(element) {
	if ( element->ninputs() == 0 )
		this->type = Input;
	else if ( element->noutputs() == 0 )
		this->type = Output;
	else
		this->type = Processing;
	this->_is_endpoint = false;
}

ElementVertex& ElementVertex::operator=(ElementVertex& ev) {
	if ( this != &ev ) {
		Vertex::operator=(ev);
		this->_is_endpoint  = ev.is_endpoint();
		this->click_element = ev.get_click_element();
		this->_jump_to_next_nf = ev._jump_to_next_nf;
	}
	return *this;
}

bool ElementVertex::is_endpoint(void) {
	if ( this->type == Processing )
		return false;
	else
		return this->_is_endpoint;
}

void ElementVertex::set_endpoint(bool ep) {
	if ( this->type == Processing ) {
		log << warn << "Processing elements cannot be endpoints" << def << std::endl;
		return;
	}
	this->_is_endpoint = ep;
}

std::vector<std::shared_ptr<ElementVertex>> ElementVertex::get_jump_to_next_nfs(void) {
	return this->_jump_to_next_nf;
}

void ElementVertex::add_jump_element(ElementVertex* j) {
	if ( (this->type == Output) && !this->is_endpoint() )
		this->_jump_to_next_nf.push_back((std::shared_ptr<ElementVertex>)j);
}

void ElementVertex::print_info(void) {
	log << info << "===============================================" << def << std::endl;
	Vertex::print_info();
	log << info << "===         Stage: " << this->type               << def << std::endl;
	log << info << "=== Click Element: " << this->click_element->class_name() << def << std::endl;
	log << info << "===============================================" << def << std::endl;
}

////////////////////////////////////////////////////////////////////////
// NFGraph
////////////////////////////////////////////////////////////////////////
void NFGraph::add_vertex_and_neighbours(ElementVertex* u) {
	Element* e = u->get_click_element().get();
	Element* neighbour = NULL;

	//log << info << "\t" << e->class_name() << ":" << e->eindex() << " has " << e->ninputs() << " input ports" << def << std::endl;

	// For each active input port
	for ( int i=0 ; i < e->ninputs() ; i++ ) {
		if ( e->input(i).active() ) {
			neighbour = e->input(i).element();

			ElementVertex* v = (ElementVertex*) this->get_vertex_by_position(neighbour->eindex());

			// This element is not in the graph. New vertex needs to be created
			if ( v == NULL ) {
				//log << info << "\t\t" << neighbour->class_name() << ":" << neighbour->eindex() << def << std::endl;
				v = new ElementVertex(neighbour, neighbour->class_name(), (unsigned short) neighbour->eindex());
			}
			this->add_edge(std::move(v), std::move(u));
		}
		else {
			// Search with diameter=1
			ElementNeighborhoodTracker tracker(e->router(), 1);

			// Backwards search
			if ( e->router()->visit_upstream(e, i, &tracker) != SUCCESS )
				throw std::logic_error("Lost element");
			Vector<Element*> found = tracker.elements();

			// Make pairs between the current node (e) and all these vertices found
			for ( Vector<Element*>::const_iterator j=found.begin(); j!=found.end(); ++j) {
				//log << info << "\t\t" << (*j)->class_name() << ":" << (*j)->eindex() << def << std::endl;
				ElementVertex* v = (ElementVertex*) this->get_vertex_by_position((*j)->eindex());
				if ( v == NULL )
					v = new ElementVertex(*j, (*j)->class_name(), (*j)->eindex());
				this->add_edge(std::move(v), std::move(u));
			}
		}
	}

	//log << info << "\t" << e->class_name() << ":" << e->eindex() << " has " << e->noutputs() << " output ports" << def << std::endl;

	// For each active output port
	for ( int i=0 ; i < e->noutputs() ; i++ ) {
		if ( e->output(i).active() ) {
			neighbour = e->output(i).element();

			ElementVertex* v = (ElementVertex*) this->get_vertex_by_position(neighbour->eindex());

			// This element is not in the graph. New vertex needs to be created
			if ( v == NULL ) {
				//log << info << "\t\t" << neighbour->class_name() << ":" << neighbour->eindex() << def << std::endl;
				v = new ElementVertex(neighbour, neighbour->class_name(), (unsigned short) neighbour->eindex());
			}
			this->add_edge(std::move(u), std::move(v));
		}
		else {
			// Search with diameter=1
			ElementNeighborhoodTracker tracker(e->router());

			// Forward search
			if ( e->router()->visit_downstream(e, i, &tracker) != SUCCESS )
				throw std::logic_error("Lost element");
			Vector<Element*> found = tracker.elements();

			for ( Vector<Element*>::const_iterator j=found.begin(); j!=found.end(); ++j) {
				//log << info << "\t\t" << (*j)->class_name() << ":" << (*j)->eindex() << def << std::endl;
				ElementVertex* v = (ElementVertex*) this->get_vertex_by_position((*j)->eindex());
				if ( v == NULL )
					v = new ElementVertex(*j, (*j)->class_name(), (*j)->eindex());
				this->add_edge(std::move(u), std::move(v));
			}
		}
	}
}

Vector<ElementVertex*> NFGraph::get_vertices_by_stage(VertexType st) {

	Vector<ElementVertex*> vertices;

	for (auto& pair : this->vertices) {
		ElementVertex* ev = (ElementVertex*) pair.first;
		if ( ev->get_type() == st )
			vertices.push_back(ev);
	}
	return vertices;
}

ElementVertex* NFGraph::get_vertex_by_click_element(Element* e) {

	for (auto& pair : this->vertices) {
		ElementVertex* ev = (ElementVertex*) pair.first;
		if ( ev->get_click_element()->eindex() == e->eindex() )
			return ev;
	}
	return NULL;
}

Vector<ElementVertex*> NFGraph::get_all_endpoint_vertices(void) {
	Vector<ElementVertex*> endpoints;

	for (auto& pair : this->vertices) {
		ElementVertex* ev = (ElementVertex*) pair.first;
		if ( ev->is_endpoint() )
			endpoints.push_back(ev);
	}
	return endpoints;
}

Vector<ElementVertex*> NFGraph::get_endpoint_vertices(VertexType t) {
	Vector<ElementVertex*> endpoints;

	for (auto& pair : this->vertices) {
		ElementVertex* ev = (ElementVertex*) pair.first;
		if ( (ev->is_endpoint()) && (ev->get_type() == t) )
			endpoints.push_back(ev);
	}
	return endpoints;
}

std::vector<std::shared_ptr<ElementVertex>> NFGraph::get_vertex_children(ElementVertex* u) {
	std::vector<std::shared_ptr<ElementVertex>> children;

	// Output nodes can be:
	//  1. Endpoints (They are connected to external domains so they do not have children --> End of graph)
	//  2. Normal output nodes ( They are connected to input elements of following NFs in the chain )
	//  The data member _jump_to_next_nf will tell you the truth.
	if ( u->get_type() == VertexType::Output ) {
		log << "\tMpike: " << def << std::endl;
		return u->get_jump_to_next_nfs();
	}
	// Input and Processing elements have a normal adjacency list
	else {
		for ( auto& v : this->get_adjacency_list().at(u) ) {
			ElementVertex* ev = (ElementVertex*) v;
			children.push_back( (std::shared_ptr<ElementVertex>)ev );
		}
	}

	return children;
}

void enhanced_dfs(NFGraph* graph, ElementVertex* vertex, Colour& colour, const Graph::AdjacencyList& adjacency_list,
		Graph::VertexMap<Colour>& visited, std::vector<ElementVertex*>& sorted) {

	Logger log(__FILE__);

	colour = Grey;
	log << "\tMpike: " << def << std::endl;

	std::vector<std::shared_ptr<ElementVertex>> list;
	if ( (adjacency_list.at(vertex).size() == 0) && (!vertex->is_endpoint()) ) {
		log << "\tOOOOOOOOOOOOOOOO: " << def << std::endl;
		list = graph->get_vertex_children(vertex);
	}
	else {
		for ( Vertex* neighbour : adjacency_list.at(vertex) ) {
			ElementVertex* ev = (ElementVertex*) neighbour;
			log << "\t\tNeighbour: " << ev->get_name() << def << std::endl;
			list.push_back( (std::shared_ptr<ElementVertex>)ev );
		}
	}
	
	log << "\t\tKsekina For: " << def << std::endl;

	for ( auto& neighbour : list ) {
		Colour& neighbour_colour = visited[neighbour.get()];

		// Unvisited node --> recursion
		if (neighbour_colour == White) {
			enhanced_dfs(graph, neighbour.get(), neighbour_colour, adjacency_list, visited, sorted);
		}
		// Ambiguous color denotes a cycle!
		else if (neighbour_colour == Grey)
			throw std::logic_error("Cycle in graph");
	}

	// Visited nodes are in black list :p
	colour = Black;
	sorted.push_back(vertex);
}

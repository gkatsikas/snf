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
ElementVertex::ElementVertex(Element* element, std::string name, unsigned short pos) :
				Vertex(std::move(name), pos, VertexType::None),
				click_element(element), _is_endpoint(false) {
	if ( element->ninputs() == 0 )
		this->type = Input;
	else if ( element->noutputs() == 0 )
		this->type = Output;
	else
		this->type = Processing;
}

ElementVertex& ElementVertex::operator=(ElementVertex& ev) {
	if ( this != &ev ) {
		Vertex::operator=(ev);
		this->_is_endpoint  = ev.is_endpoint();
		this->click_element = ev.get_click_element();
		this->glue = ev.glue;
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

void ElementVertex::print_info(void) {
	log << info << "===============================================" << def << std::endl;
	Vertex::print_info();
	log << info << "===         Stage: " << this->type               << def << std::endl;
	log << info << "=== Click Element: " << this->click_element->class_name() << def << std::endl;
	log << info << "===       Enpoint: " << std::string(this->is_endpoint() ? "True" : "False") << def << std::endl;
	if ( this->is_endpoint() )
		log << info << "===         Stage: " << this->type               << def << std::endl;
		log << info << "===  Next NF Info: [Pos " << this->glue.first << ", Iface  " << this->glue.second << "]" << def << std::endl;
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
				//log << info << "\t\tNEW " << neighbour->class_name() << ":" << neighbour->eindex() << def << std::endl;
				v = new ElementVertex(neighbour, neighbour->class_name(), (unsigned short) neighbour->eindex());
			}
			this->add_edge(std::move(v), std::move(u), i);
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
				if ( v == NULL ) {
					v = new ElementVertex(*j, (*j)->class_name(), (*j)->eindex());
				}
				this->add_edge(std::move(v), std::move(u), i);
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
				//log << info << "\t\tNEW " << neighbour->class_name() << ":" << neighbour->eindex() << def << std::endl;
				v = new ElementVertex(neighbour, neighbour->class_name(), (unsigned short) neighbour->eindex());
			}
			this->add_edge(std::move(u), std::move(v), e->output(i).port());
		}
		else {
			// Search with diameter=1
			ElementNeighborhoodTracker tracker(e->router());

			// Forward search
			if ( e->router()->visit_downstream(e, i, &tracker) != SUCCESS )
				throw std::logic_error("Lost element");
			Vector<Element*> found = tracker.elements();

			unsigned short neighbour_inport = 0;
			for ( Vector<Element*>::const_iterator j=found.begin(); j!=found.end(); ++j) {
				log << info << "\t\t" << (*j)->class_name() << ":" << (*j)->eindex() << def << std::endl;
				ElementVertex* v = (ElementVertex*) this->get_vertex_by_position((*j)->eindex());
				if ( v == NULL ) {
					v = new ElementVertex(*j, (*j)->class_name(), (*j)->eindex());
				}
				this->add_edge(std::move(u), std::move(v), neighbour_inport);

				neighbour_inport++;
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

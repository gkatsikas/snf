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
ElementVertex::ElementVertex(Element *element, const std::string &name, 
							const unsigned short &pos) :
							Vertex(std::move(name), pos, VertexType::None),
							click_element(element), _is_endpoint(false) {
	if ( element->ninputs() == 0 )
		this->type = Input;
	else if ( element->noutputs() == 0 )
		this->type = Output;
	else
		this->type = Processing;
}

ElementVertex& ElementVertex::operator=(ElementVertex &ev) {
	if ( this != &ev ) {
		Vertex::operator=(ev);
		this->_is_endpoint  = ev.is_endpoint();
		this->click_element = ev.get_click_element();
		this->glue = ev.glue;
	}
	return *this;
}

bool
ElementVertex::is_endpoint(void) const {
	if ( this->type == Processing )
		return false;
	else
		return this->_is_endpoint;
}

const
std::string ElementVertex::get_class(void) const {
	return this->click_element->class_name();
}

const
std::string ElementVertex::get_interface(void) const {
	std::string elem_conf = this->get_configuration();
	return elem_conf.substr(0, elem_conf.find(","));
}

const
std::string ElementVertex::get_configuration(void) const {
	//return std::string( this->click_element->configuration().c_str() );
	return std::string(
		this->click_element->router()->econfiguration( this->get_position() ).c_str()
	);
}

const
std::shared_ptr<Element> ElementVertex::get_click_element(void) const {
	return this->click_element;
}

std::unordered_map<short, std::vector<std::string>>*
ElementVertex::get_implicit_configuration(void) {
	return &(this->implicit_configuration);
}

void
ElementVertex::set_endpoint(const bool &ep) {
	if ( this->type == Processing ) {
		warn_chatter(this->log, "Processing elements cannot be endpoints");
		return;
	}
	this->_is_endpoint = ep;
}

void
ElementVertex::set_glue_info(const unsigned short &next_nf_pos, const std::string &next_nf_iface) {
	this->glue = std::make_pair(next_nf_pos, next_nf_iface);
}

void
ElementVertex::set_implicit_configuration(const short &port, 
											const std::vector<std::string> &implicit_conf) {
	this->implicit_configuration[port] = implicit_conf;
}

void
ElementVertex::print_info(void) {
	info_chatter(this->log, "===============================================");
	Vertex::print_info();
	info_chatter(this->log, "===         Stage: " << this->type);
	info_chatter(this->log, "=== Click Element: " << this->click_element->class_name());
	info_chatter(this->log, "===       Enpoint: " << std::string(this->is_endpoint() ? "True" : "False"));
	if ( this->is_endpoint() )
		info_chatter(this->log, "===         Stage: " << this->type);
		info_chatter(this->log, "===  Next NF Info: [Pos " << this->glue.first << 
								", Iface  " << this->glue.second << "]");
	info_chatter(this->log, "===============================================");
}

////////////////////////////////////////////////////////////////////////
// NFGraph
////////////////////////////////////////////////////////////////////////
void
NFGraph::add_vertex_and_neighbours(ElementVertex *u) {
	Element *e = u->get_click_element().get();
	Element *neighbour = NULL;

	debug_chatter(this->log, "\t" << e->class_name() << ":" << e->eindex() << " has " << e->ninputs() << " input ports");

	// For each active input port
	for ( int i=0 ; i < e->ninputs() ; i++ ) {
		if ( e->input(i).active() ) {
			neighbour = e->input(i).element();

			ElementVertex *v = static_cast<ElementVertex*> ( this->get_vertex_by_position(neighbour->eindex()) );

			// This element is not in the graph. New vertex needs to be created
			if ( v == NULL ) {
				debug_chatter(this->log, "\t\tNEW " << neighbour->class_name() << ":" << neighbour->eindex());
				v = new ElementVertex(neighbour, neighbour->class_name(), (unsigned short) neighbour->eindex());
			}
			this->add_edge(std::move(v), std::move(u), i);
		}
		else {
			// Search with diameter=1
			ElementNeighborhoodTracker tracker(e->router(), 1);

			// Backwards search
			if ( e->router()->visit_upstream(e, i, &tracker) != SUCCESS )
				error_chatter(this->log, "Lost element");
			Vector<Element*> found = tracker.elements();

			// Make pairs between the current node (e) and all these vertices found
			for ( Vector<Element*>::const_iterator j=found.begin(); j!=found.end(); ++j) {
				debug_chatter(this->log, "\t\t" << (*j)->class_name() << ":" << (*j)->eindex());

				ElementVertex *v = static_cast<ElementVertex*> ( this->get_vertex_by_position((*j)->eindex()) );
				if ( v == NULL ) {
					v = new ElementVertex(*j, (*j)->class_name(), (*j)->eindex());
				}
				this->add_edge(std::move(v), std::move(u), i);
			}
		}
	}

	debug_chatter(this->log, "\t" << e->class_name() << ":" << e->eindex() << " has " << e->noutputs() << " output ports");

	// For each active output port
	for ( int i=0 ; i < e->noutputs() ; i++ ) {
		if ( e->output(i).active() ) {
			neighbour = e->output(i).element();

			ElementVertex *v = static_cast<ElementVertex*> ( this->get_vertex_by_position(neighbour->eindex()) );

			// This element is not in the graph. New vertex needs to be created
			if ( v == NULL ) {
				debug_chatter(this->log, "\t\tNEW " << neighbour->class_name() << ":" << neighbour->eindex());
				v = new ElementVertex(neighbour, neighbour->class_name(), (unsigned short) neighbour->eindex());
			}
			this->add_edge(std::move(u), std::move(v), e->output(i).port());
		}
		else {
			// Search with diameter=1
			ElementNeighborhoodTracker tracker(e->router());

			// Forward search
			if ( e->router()->visit_downstream(e, i, &tracker) != SUCCESS )
				error_chatter(this->log, "Lost element");
			Vector<Element*> found = tracker.elements();

			unsigned short neighbour_inport = 0;
			for ( Vector<Element*>::const_iterator j=found.begin(); j!=found.end(); ++j) {
				debug_chatter(this->log, "\t\t" << (*j)->class_name() << ":" << (*j)->eindex());
	
				ElementVertex *v = static_cast<ElementVertex*> ( this->get_vertex_by_position((*j)->eindex()) );
				if ( v == NULL ) {
					v = new ElementVertex(*j, (*j)->class_name(), (*j)->eindex());
				}
				this->add_edge(std::move(u), std::move(v), neighbour_inport);

				neighbour_inport++;
			}
		}
	}
}

Vector<ElementVertex*>
NFGraph::get_vertices_by_stage(const VertexType &st) const {

	Vector<ElementVertex*> vertices;

	for (auto& pair : this->vertices) {
		ElementVertex* ev = static_cast<ElementVertex*> (pair.first);
		if ( ev->get_type() == st )
			vertices.push_back(ev);
	}
	return vertices;
}

ElementVertex*
NFGraph::get_vertex_by_click_element(const Element *e) const {

	for (auto& pair : this->vertices) {
		ElementVertex* ev = static_cast<ElementVertex*> (pair.first);
		if ( ev->get_click_element()->eindex() == e->eindex() )
			return ev;
	}
	return NULL;
}

Vector<ElementVertex*>
NFGraph::get_all_endpoint_vertices(void) const {

	Vector<ElementVertex*> endpoints;

	for (auto& pair : this->vertices) {
		ElementVertex* ev = static_cast<ElementVertex*> (pair.first);
		if ( ev->is_endpoint() )
			endpoints.push_back(ev);
	}
	return endpoints;
}

Vector<ElementVertex*>
NFGraph::get_endpoint_vertices(const VertexType &t) const {

	Vector<ElementVertex*> endpoints;

	for (auto& pair : this->vertices) {
		ElementVertex* ev = static_cast<ElementVertex*> (pair.first);
		if ( (ev->is_endpoint()) && (ev->get_type() == t) )
			endpoints.push_back(ev);
	}
	return endpoints;
}

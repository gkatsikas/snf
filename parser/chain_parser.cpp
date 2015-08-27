//============================================================================
//        Name: chain_parser.cpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: Read a Click configuration and load it into a Graph.
//              Then compose multiple graphs to form chains.
//============================================================================

#include "../helpers.hpp"
#include "chain_parser.hpp"

#include <click/routervisitor.hh>

ChainParser::ChainParser(ParserConfiguration* pc) : chain_graph(pc) {
	this->log.set_logger_file(__FILE__);
	this->chain_length = this->chain_graph->get_chain()->get_vertices_no();

	if ( this->chain_length <= 0 ) {
		this->chain_graph = NULL;
		throw std::runtime_error("ChainParser: Invalid chain length");
	}
	//log << debug << "Chain Parser constructed" << def << std::endl;
}

ChainParser::~ChainParser() {
	this->chain_graph = NULL;

	// From Click
	ClickCleaner::cleanup(NULL, true);

	for ( auto& conf : this->nf_configuration )
		conf.second = NULL;
	this->nf_configuration.clear();

	//for ( auto& dag : this->nf_dag )
	//	delete dag.second;
	this->nf_dag.clear();

	log << debug << "Chain Parser deleted" << def << std::endl;
}

/*
 * A.
 * Reads, verifies and loads the input Click configurations one-by-one.
 * It belongs to the public API.
 * It calls the private load_nf_configuration as many times an the number
 * of input NFs that compose the chain.
 */
short ChainParser::load_nf_configurations(void) {
	short exit_status = 0;

	log << "" << std::endl;

	// For each NF
	for (Vertex* v : this->chain_graph->get_chain()->get_vertex_order() ) {
		ChainVertex* cv = (ChainVertex*) v;

		log << info << "==============================================================================" << def << std::endl;
		log << info << "Network Function: " << cv->get_name() << def << std::endl;

		// 1. Load its elements into a Click Router object
		exit_status = this->load_nf(cv->get_name(), cv->get_source_code_path(), cv->get_position());
		if ( exit_status != SUCCESS )
			exit(exit_status);

		// 2. Visit all the Click elements of the NF and build the synthesizer's graph
		exit_status = this->build_nf_dag(cv->get_name(), cv->get_position());
		if ( exit_status != SUCCESS )
			exit(exit_status);

		exit_status = this->verify_nf_configuration(cv->get_name(), cv->get_position());
		if ( exit_status != SUCCESS )
			exit(exit_status);

		log << info << "==============================================================================" << def << std::endl;
		log << "" << std::endl;
	}

	return SUCCESS;
}

/*
 * B.
 * After passing the loading step above, we are ready to chain these configurations
 * into one big Click graph so as to start the synthesis.
 */
short ChainParser::chain_nf_configurations(void) {
	
	log << "" << std::endl;
	log << info << "Chaining all Click Configurations..." << def << std::endl;
	
	return SUCCESS;
}

/*
 * Reads and loads one input Click configuration.
 * It uses built-in Click methods and data structures linked with this file.
 */
short ChainParser::load_nf(std::string nf_name, std::string nf_source, unsigned short position) {
	
	log << info << "Loading Click Configuration for " << nf_name << ": " << nf_source << def << std::endl;

	Router* router = input_a_click_configuration(nf_source.c_str());
	if ( router == NULL )
		exit(NO_MEM_AVAILABLE);
	log << "\tNetwork Function " << position << " has " << router->nelements() << " elements: Status --> Parsed successfully" << def << std::endl;

	// Insert this Router object into parser's memory
	this->nf_configuration[position] = std::move(router);

	return SUCCESS;
}

short ChainParser::build_nf_dag(std::string nf_name, unsigned short position) {

	Router* router = this->nf_configuration[position];

	if ( router == NULL ) {
		log << error << "Network Function object is invalid" << def << std::endl;
		return NO_MEM_AVAILABLE;
	}

	// Create an empty Graph if does not exist
	if ( this->nf_dag[position] == NULL )
		this->nf_dag[position] = new NFGraph();
	NFGraph* nf_graph = this->nf_dag[position];

	log << "" << std::endl;
	log << info << "Building Click Graph for " << nf_name << def << std::endl;

	for ( int i=0 ; i < router->nelements() ; i++ ) {
		Element* e = Router::element(router, i);

		// Turn this Click element into a DAG Vertex
		if ( !nf_graph->contains(i) ) {
			ElementVertex* u = new ElementVertex(e, e->class_name(), e->eindex());

			// Add this vertex to the NF DAG along with its neighbouring connections (vertices)
			try {
				nf_graph->add_vertex_and_neighbours(std::move(u));
			}
			catch (const std::exception& e) {
				log << error << "|--> " << e.what() << def << std::endl;
				exit(CLICK_PARSING_PROBLEM);
			}
		}
	}

	// The generated DAG should contain the same number of vertices with the Click configuration
	if ( nf_graph->get_vertices_no() != router->nelements() ) {
		delete nf_graph;
		return CLICK_PARSING_PROBLEM;
	}

	nf_graph->print_adjacency_list();

	return SUCCESS;
}

short ChainParser::verify_nf_configuration(std::string nf_name, unsigned short position) {
	Router* router = this->nf_configuration[position];

	if ( router == NULL ) {
		log << error << "Network Function object is invalid" << def << std::endl;
		return NO_MEM_AVAILABLE;
	}

	// Get the references of the two graphs: 
	//  1. The Chain graph that comprises of connected NFs. 
	//     From this graph we need the vertex of this particular NF.
	//  2. The NF graph that comprises of Click elements
	Graph*   chain_graph = this->chain_graph->get_chain();
	if ( chain_graph == NULL )
		return NO_MEM_AVAILABLE;

	ChainVertex* this_nf = (ChainVertex*) chain_graph->get_vertex_by_position(position);
	if ( this_nf == NULL )
		return NO_MEM_AVAILABLE;

	NFGraph* nf_graph    = this->nf_dag[position];
	if ( nf_graph == NULL )
		return NO_MEM_AVAILABLE;
	
	Vector<ElementVertex*> input_elements      = nf_graph->get_vertices_by_stage(VertexType::Input);
	//Vector<ElementVertex*> processing_elements = nf_graph->get_vertices_by_stage(VertexType::Processing);
	Vector<ElementVertex*> output_elements     = nf_graph->get_vertices_by_stage(VertexType::Output);

	// A vector with both I and O elements
	Vector<ElementVertex*> io_elements(input_elements);
	for ( auto& el : output_elements )
		io_elements.push_back(el);

	unsigned short seen_entry_ifaces = 0;
	unsigned short seen_chain_ifaces = 0;

	log << "" << std::endl;
	log << info << "Verifying Click Configuration for " << nf_name << "..." << def << std::endl;

	// Parse input elements' configuration and cross check with the inputs from the property file.
	// --> Currently supported input elements: FromDevice()
	for ( auto& el : io_elements ) {
		std::string name = el->get_name();
		std::string el_class = el->get_class();
		VertexType  type     = el->get_type();
		std::string type_str = el->get_type_str();
		std::string configuration = el->get_configuration();

		// Configuration might contain e.g. BURST burst_size after the interface.
		// We don't want it.
		std::string interface = configuration.substr(0, configuration.find(","));

		// I/O elements
		if ( type != VertexType::Processing ) {
			// Supported Input elements
			if ( (el_class == "FromDevice")   || (el_class == "PollDevice") ||
				 (el_class == "FromNetFront") || (el_class == "ToDevice")   ||
				 (el_class == "ToNetFront")) {

				//log << warn << "" << def << std::endl;
				//log << warn << " Element  Name: " << name          << def << std::endl;
				//log << "\t Element Class: " << el_class      << def << std::endl;
				//log << "\t Element  Type: " << type_str      << def << std::endl;
				//log << "\t Configuration: " << configuration << def << std::endl;
				//log << "\t     Interface: " << interface     << def << std::endl;
				
				// This is an entry interface that connects the chain to a domain
				if ( this_nf->get_entry_interface(interface) != "NULL" ) {
					//log << "\tInterface Type: ENTRY" << def << std::endl;
					el->set_endpoint(true);
					
					// Count only this side of the interface (not the ToDevice counterpart).
					if ( type == VertexType::Input )
						seen_entry_ifaces++;
				}
				// This is an internal interface that connects the NF with a subsequent NF
				else if ( this_nf->get_chain_interface(interface) != "NULL" ) {
					//log << "\tInterface Type: CHAIN" << def << std::endl;
					
					// Count only this side of the interface (not the ToDevice counterpart).
					if ( type == VertexType::Input )
						seen_chain_ifaces++;
					
					// ---> IMPORNTANT
					// For Output chain inerfaces (e.g. ToDevice(eth1) in NF_1[eth1] -> NF_2)
					// set a pointer to the first input element of the next NF.
					if ( type == VertexType::Output ) {
						ElementVertex* next_jump = this->find_input_element_of_next_nf(position, interface);
					}
				}
				// It can happen for chain interfaces that are attached to the inputs of the NFs
				// If you check property file, section [NF_TOPO], you will see that we do not specify
				// the input interfaces if these are not entry interfaces.
				else {
					//log << error << "Undeclared interface " << interface << def << std::endl;
				}
			}
		}
	}
	
	unsigned short all_ifaces_no = this_nf->get_interfaces_no();
	
	// This means that here is an error in the definition of the chain in the property file.
	if ( seen_entry_ifaces+seen_chain_ifaces > all_ifaces_no ) {
		log << error << "Click configuration for NF " << position << " is incompatible with the chain setup in the property file." << def << std::endl;
		log << error << "Please check the interfaces." << def << std::endl;
		return CLICK_PARSING_PROBLEM;
	}
	
	// I must be able to see all the entry interfaces of the property file in my Click configuration.
	if ( seen_entry_ifaces != this_nf->get_entry_interfaces_no() ) {
		log << error << "Click configuration for NF " << position << " is incompatible with the chain setup in the property file." << def << std::endl;
		log << error << "Please check the entry interfaces -> [ENTRY_POINTS] in the property file." << def << std::endl;
		return CLICK_PARSING_PROBLEM;
	}
	
	// If I see fewer chain interfaces than exist in the property file, there is a problem
	if ( seen_chain_ifaces < this_nf->get_chain_interfaces_no() ) {
		log << error << "Click configuration for NF " << position << " is incompatible with the chain setup in the property file." << def << std::endl;
		log << error << "Please check the chain interfaces -> [NF_TOPO] in the property file." << def << std::endl;
		return CLICK_PARSING_PROBLEM;
	}

	log << "\tNetwork Function " << nf_name << " is successfully verified against the property file" << def << std::endl;

	return SUCCESS;
}

/*
 * Given a position in the chain and an output interface, we want to find the Click element of the next NF in 
 * the chain. Essentially this function is a glue between two connected NFs.
 */
ElementVertex* ChainParser::find_input_element_of_next_nf(unsigned short position, std::string interface) {

	Graph* chain_graph = this->chain_graph->get_chain();
	if ( chain_graph == NULL )
		return NULL;

	ChainVertex* this_nf = (ChainVertex*) chain_graph->get_vertex_by_position(position);
	if ( this_nf == NULL )
		return NULL;

	NFGraph* this_nf_graph = this->nf_dag[position];
	if ( this_nf_graph == NULL )
		return NULL;

	// Placeholder for the vertex we are looking for
	ElementVertex* found = NULL;
	unsigned short next_position_in_chain = 0;

	// Search for 
	for ( auto& child : chain_graph->get_vertex_children(this_nf) ) {
		
		ChainVertex* cv_child = (ChainVertex*) child;
		
		if ( cv_child->get_chain_interface(interface) != "NULL" ) {
			
		}
	}

	return found;
}

/*Vector<Element*> ChainParser::visit_dag(unsigned short position) {

	// Storage to put the visited elements
	Vector<Element*> path_elements;

	Router*  router   = this->nf_configuration[position];
	if ( router == NULL )
		return path_elements;

	// When set to -1, it means that all ports will be searched
	int port = -1;

	// Start from the first element of the graph
	Element* first = Router::element(router, 0);

	if ( first == NULL ) {
		log << error << "\tError while traversing NF no " << position << " configuration" << def << std::endl;
		return path_elements;
	}
	path_elements.push_back(first);
	//log << info << "\tFirst element is " << std::string(first->class_name()) << def << std::endl;

	// DEPRECATED but the only operational one
	if ( router->downstream_elements(first, port, NULL, path_elements) != SUCCESS ) {
		log << error << "\tError while traversing NF no " << position << " configuration" << def << std::endl;
		return path_elements;
	}
	log << info << "\tNetwork Function is successfully traversed" << def << std::endl;
	log << info << "\tFound " << path_elements.size() << " elements" << def << std::endl;

	//for ( Vector<Element*>::const_iterator i=path_elements.begin(); i!=path_elements.end(); ++i)
	//	log << info << "\t\tElement Found: " << (*i)->class_name() << def << std::endl;

	return path_elements;
}
*/

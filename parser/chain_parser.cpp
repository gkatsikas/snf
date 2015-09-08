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
	log << debug << "Chain Parser constructed" << def << std::endl;
}

ChainParser::~ChainParser() {
	if ( this->chain_graph != NULL )
		delete this->chain_graph;

	// From Click
	ClickCleaner::cleanup(NULL, true);

	for ( auto& conf : this->nf_configuration )
		conf.second = NULL;
	this->nf_configuration.clear();
	this->nf_dag.clear();

	log << debug << "Chain Parser deleted" << def << std::endl;
}

/*
 * PUBLIC API
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
	for ( Vertex* v : this->chain_graph->get_chain()->get_vertex_order() ) {
		ChainVertex* cv = (ChainVertex*) v;

		log << info << "==============================================================================" << def << std::endl;
		log << info << "Network Function: " << cv->get_name() << def << std::endl;

		// 1. Load its elements into a Click Router object
		exit_status = this->load_nf(cv->get_name(), cv->get_source_code_path(), cv->get_position());
		if ( exit_status != SUCCESS )
			return exit_status;

		// 2. Visit all the Click elements of the NF and build the synthesizer's graph
		exit_status = this->build_nf_dag(cv->get_name(), cv->get_position());
		if ( exit_status != SUCCESS )
			return exit_status;

		log << info << "==============================================================================" << def << std::endl;
	}

	log << "" << std::endl;
	// Now we have the Click DAGs per NF

	return SUCCESS;
}

/*
 * PUBLIC API
 * B.
 * After passing the loading step above, we are ready to chain these configurations
 * into one big Click graph so as to start the synthesis.
 */
short ChainParser::chain_nf_configurations(void) {
	short exit_status = 0;

	log << "" << std::endl;
	log << info << "==============================================================================" << def << std::endl;
	log << info << "Chaining all Click Configurations..." << def << std::endl;

	// For each NF
	for ( Vertex* v : this->chain_graph->get_chain()->get_vertex_order() ) {
		ChainVertex* cv = (ChainVertex*) v;

		log << "Network Function: " << cv->get_name() << def << std::endl;

		// 3. Verify the NF chain against the property file and create connections between NFs
		exit_status = this->verify_and_connect_nfs(cv->get_name(), cv->get_position());
		if ( exit_status != SUCCESS )
			return exit_status;

		log << "" << std::endl;
	}
	log << info << "==============================================================================" << def << std::endl;

	return SUCCESS;
}

/*
 * Reads and loads one input Click configuration.
 * It uses built-in Click methods and data structures linked with this file.
 */
short ChainParser::load_nf(std::string nf_name, std::string nf_source, unsigned short position) {

	log << info << "Loading Click Configuration for " << nf_name << ": " << nf_source << def << std::endl;

	Router* router = input_a_click_configuration(nf_source.c_str());
	if ( router == NULL ) {
		log << error << "\tProblem while parsing Network Function " << position << def << std::endl;
		return CLICK_PARSING_PROBLEM;
	}
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

	unsigned short total_elements = router->nelements();

	for ( int i=0 ; i < router->nelements() ; i++ ) {
		Element* e = Router::element(router, i);
		//log << "Element " << e->class_name() << " " << e->eindex() << ": " << e->configuration().c_str() << std::endl;

		ElementVertex* u = NULL;

		// Turn this Click element into a DAG Vertex
		if ( !nf_graph->contains(e->eindex()) )
			u = new ElementVertex(e, e->class_name(), e->eindex());
		else
			u = (ElementVertex*) nf_graph->get_vertex_by_position(e->eindex());

		//log << "Element " << u->get_name() << " " << u->get_position() << ": " << u->get_configuration() << std::endl;

		// Add this vertex to the NF DAG along with its neighbouring connections (vertices)
		try {
			nf_graph->add_vertex_and_neighbours(std::move(u));
		}
		catch (const std::exception& e) {
			log << error << "|--> " << e.what() << def << std::endl;
			exit(CLICK_PARSING_PROBLEM);
		}
	}

	// The generated DAG should not contain more vertices than the original one.
	// It can contain less though because we may have AddressInfo elements that are used only 
	// as configuration elements.
	if ( nf_graph->get_vertices_no() > total_elements ) {
		delete nf_graph;
		return CLICK_PARSING_PROBLEM;
	}

	// Check if the created graph has cycles
	try {
		nf_graph->topological_sort();
	}
	catch (const std::exception& e) {
		log << error << "\t|--> " << e.what() << def << std::endl;
		return NF_CHAIN_NOT_ACYCLIC;
	}
	log << "\tClick Graph is acyclic" << def << std::endl;

	// If acyclic, print the adjacency list
	nf_graph->print_adjacency_list();

	return SUCCESS;
}

short ChainParser::verify_and_connect_nfs(std::string nf_name, unsigned short position) {
	Router* router = this->nf_configuration[position];

	if ( router == NULL ) {
		log << error << "Network Function object is invalid" << def << std::endl;
		return NO_MEM_AVAILABLE;
	}

	// Get the references of the two graphs:
	//  1. The Chain graph that comprises of connected NFs.
	//     From this graph we need the vertex of this particular NF.
	//  2. The NF graph that comprises of Click elements
	Graph* chain_graph = this->chain_graph->get_chain();
	if ( chain_graph == NULL )
		return NO_MEM_AVAILABLE;

	ChainVertex* this_nf = (ChainVertex*) chain_graph->get_vertex_by_position(position);
	if ( this_nf == NULL )
		return NO_MEM_AVAILABLE;

	NFGraph* nf_graph = this->nf_dag[position];
	if ( nf_graph == NULL )
		return NO_MEM_AVAILABLE;

	Vector<ElementVertex*> input_elements  = nf_graph->get_vertices_by_stage(VertexType::Input);
	Vector<ElementVertex*> output_elements = nf_graph->get_vertices_by_stage(VertexType::Output);

	// A vector with both I and O elements
	Vector<ElementVertex*> io_elements(input_elements);
	for ( auto& el : output_elements )
		io_elements.push_back(el);

	unsigned short seen_entry_ifaces = 0;
	unsigned short seen_chain_ifaces = 0;

	// Parse input elements' configuration and cross check with the inputs from the property file.
	// --> Currently supported input elements: FromDevice()
	for ( auto& element : io_elements ) {
		std::string el_name  = element->get_name();
		std::string el_class = element->get_class();
		VertexType  type     = element->get_type();
		std::string type_str = element->get_type_str();
		std::string configuration = element->get_configuration();

		// Configuration might contain e.g. BURST burst_size after the interface.
		// We don't want it.
		std::string interface = configuration.substr(0, configuration.find(","));

		// Supported I/O elements
		if ( (el_class == "FromDevice")   || (el_class == "PollDevice") ||
			 (el_class == "FromNetFront") || (el_class == "ToDevice")   ||
			 (el_class == "ToNetFront")) {

			//log << "" << def << std::endl;
			//log << "\tElement  Name: " << el_name       << def << std::endl;
			//log << "\tElement Class: " << el_class      << def << std::endl;
			//log << "\tElement  Type: " << type_str      << def << std::endl;
			//log << "\tConfiguration: " << configuration << def << std::endl;
			//log << "\t    Interface: " << interface     << def << std::endl;

			// This is an entry interface that connects the chain to a domain
			if ( this_nf->has_entry_interface(interface) ) {
				//log << "\tInterface Type: ENTRY" << def << std::endl;
				element->set_endpoint(true);

				// Count only this side of the interface (not the ToDevice counterpart).
				if ( type == VertexType::Input )
					seen_entry_ifaces++;
			}
			// This is an internal interface that connects the NF with a subsequent NF
			else if ( this_nf->has_chain_interface(interface) ) {
				//log << "\tInterface Type: CHAIN" << def << std::endl;

				// Count only this side of the interface (not the ToDevice counterpart).
				if ( type == VertexType::Input )
					seen_chain_ifaces++;

				// ---> IMPORNTANT
				// For Output chain inerfaces (e.g. ToDevice(eth1) in NF_1[eth1] -> NF_2)
				// set a pointer to the first input element of the next NF.
				if ( type == VertexType::Output ) {

					log << "\t" << nf_name << " --> " << el_name << "(" << interface << ")" << def << std::endl;

					std::string next_nf_name = this_nf->get_nf_from_chain_interface(interface);
					ChainVertex* next_nf = (ChainVertex*) chain_graph->get_vertex_by_name(next_nf_name);
					unsigned short next_nf_position = next_nf->get_position();
					std::string next_nf_iface = next_nf->get_iface_from_chain_nf(nf_name);
					//log << "\tNext NF is " << next_nf_name << " at position: " << next_nf_position << " and iface: " << next_nf_iface << def << std::endl;

					NFGraph* next_nf_graph = this->nf_dag[next_nf_position];

					ElementVertex* next_jump = this->find_input_element_of_nf(next_nf_graph, next_nf_iface);
					if ( next_jump == NULL ) {
						log << error << "There is no connection between " << nf_name << " and " << next_nf_name << ". Element not found" << std::endl;
						return NO_MEM_AVAILABLE;
					}
					log << "\t\t Goes to " << next_nf_name << " --> " << next_jump->get_class() << "(" << next_nf_iface << ")" << def << std::endl;

					// Create the link between the Output vertex of this NF and the Input vertex of the next one
					element->set_glue_info(next_nf_position, next_nf_iface);
				}
			}
			// It can happen for chain interfaces that are attached to the inputs of the NFs
			// If you check property file, section [NF_TOPO], you will see that we do not specify
			// the input interfaces if these are not entry interfaces.
			else {
				//log << error << "\tUndeclared interface " << interface << def << std::endl;
				element->set_endpoint(true);
				//return CLICK_PARSING_PROBLEM;
			}
		}
	}

	unsigned short all_ifaces_no = this_nf->get_interfaces_no();

	// This means that here is an error in the definition of the chain in the property file.
	if ( seen_entry_ifaces+seen_chain_ifaces != all_ifaces_no ) {
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
	if ( seen_chain_ifaces != this_nf->get_chain_interfaces_no() ) {
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
ElementVertex* ChainParser::find_input_element_of_nf(NFGraph* next_nf_graph, std::string target_interface) {

	if ( next_nf_graph == NULL )
		return NULL;

	// Get all the input elements of this NF
	Vector<ElementVertex*> input_elements = next_nf_graph->get_vertices_by_stage(VertexType::Input);

	// Search for the Input element with this interface
	for ( auto& element : input_elements ) {
		std::string name = element->get_name();
		std::string el_class = element->get_class();
		std::string configuration = element->get_configuration();

		// Configuration might contain e.g. BURST burst_size after the interface.
		// We don't want it.
		std::string interface = configuration.substr(0, configuration.find(","));

		if ( interface == target_interface )
			return element;
	}

	return NULL;
}

/*
Vector<Element*> ChainParser::visit_dag(unsigned short position) {

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

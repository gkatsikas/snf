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

/*ChainParser::clean_up_if_error(void) {
	
}*/

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

		log << info << "Network Function: " << cv->get_name() << def << std::endl;

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
 * C.
 * Build the traffic classes as a test
 */
short ChainParser::test_chain_nf(void) {

	log << "" << std::endl;
	log << info << "==============================================================================" << def << std::endl;
	log << info << "Test the chaining..." << def << std::endl;

	// Get all NFs, one-by-one
	for ( Vertex* v : this->chain_graph->get_chain()->get_vertex_order() ) {
		// The node of this NF in the chain graph
		ChainVertex* cv = (ChainVertex*) v;
		unsigned short nf_position = cv->get_position();

		// The Click DAG of this NF
		NFGraph* nf_graph = this->nf_dag[nf_position];
		if ( nf_graph == NULL )
			return NO_MEM_AVAILABLE;

		log << info << "Network Function: " << cv->get_name() << def << std::endl;

		Graph::VertexMap<Colour> visited;

		// Get all the input entry points of this NF (if any)
		// From these points, we start building the traffic classes
		for ( auto& endpoint : nf_graph->get_endpoint_vertices(VertexType::Input) ) {
			std::string elem_name = endpoint->get_name();
			std::string elem_conf = endpoint->get_configuration();

			log << "\t" << elem_name << "(" << elem_conf << ")" << def << std::endl;

			Colour& colour = visited[endpoint];

			// This should never happen here because vertex has in degree 0
			assert (colour == White);

			// Not visited, go DFS
			TrafficBuilder::traffic_class_builder_dfs(this->nf_dag, nf_position, endpoint, elem_conf, colour, visited);

			log << "" << def << std::endl;
		}

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

	// Check if the created graph has cycles
	try {
		nf_graph->topological_sort();
	}
	catch (const std::exception& e) {
		log << error << "\t|--> " << e.what() << def << std::endl;
		return NF_CHAIN_NOT_ACYCLIC;
	}
	log << info << "\tClick Graph is acyclic" << def << std::endl;

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
			//log << "\t Element  Name: " << el_name       << def << std::endl;
			//log << "\t Element Class: " << el_class      << def << std::endl;
			//log << "\t Element  Type: " << type_str      << def << std::endl;
			//log << "\t Configuration: " << configuration << def << std::endl;
			//log << "\t     Interface: " << interface     << def << std::endl;

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
				log << error << "Undeclared interface " << interface << def << std::endl;
				return CLICK_PARSING_PROBLEM;
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
 * Recursive DFS function to visit all vertices from 'vertex'.
 * The vertices can also belong to different graph, so in reality,
 * this is a recursive graph composition function.
 */
void TrafficBuilder::traffic_class_builder_dfs(	NF_Map<NFGraph*> nf_chain, unsigned short nf_position,
												ElementVertex* nf_vertex, std::string nf_conf,
												Colour& nf_colour, Graph::VertexMap<Colour>& nf_visited) {

	Logger log(__FILE__);

	// Retrieve the appropriate adjacency list
	Graph::AdjacencyList adjacency_list = nf_chain[nf_position]->get_adjacency_list();

	// We reached an Output vertex and need to find for a conneciton with a following NF
	if ( adjacency_list.at(nf_vertex).size() == 0 ) {
		// We are looking for an endpoint Outpout element with different configuration (aka interface)
		// Otherwise a loop will be created
		if ( (nf_vertex->is_endpoint()) && (nf_vertex->get_configuration() != nf_conf) ) {
			log << "\t\t ----->  ENDPOINT " << nf_vertex->get_name() << "(" << nf_vertex->get_configuration() << ")" << def << std::endl;
			return;
		}
		// A way to continue in the chain
		else if ( (!nf_vertex->is_endpoint()) && (nf_vertex->get_configuration() != nf_conf) ) {
			// We don't care about drops
			if ( (nf_vertex->get_class() != "Discard") ) {
				unsigned short next_nf_position = nf_vertex->get_glue_nf_position();
				std::string next_nf_iface = nf_vertex->get_glue_iface();

				log << "\t\t -----> JUMP FROM " << nf_vertex->get_name() << "(" << nf_vertex->get_configuration() << ")" << def << std::endl;

				// Change context, move to next graph
				// 1. Change adjacency list 
				adjacency_list = nf_chain[next_nf_position]->get_adjacency_list();

				// 2. Change vertex pointer to the first element of the next NF
				for ( ElementVertex* input_elem : nf_chain[next_nf_position]->get_vertices_by_stage(VertexType::Input) ) {
					if ( input_elem->get_configuration() == next_nf_iface ) {
						nf_vertex = input_elem;
						log << "\t\t ----->        TO " << nf_vertex->get_class() <<  "(" << nf_vertex->get_configuration() << ")" << def << std::endl;
						break;
					}
				}

				// 3. Change origin interface using the interface of the new vertex
				nf_conf = next_nf_iface;
				
				// 4. Change NF postion in the Chain DAG
				nf_position = next_nf_position;
			}
		}
		// Do not chain because a loop will be created
		else if ( nf_vertex->get_configuration() == nf_conf ) {
			log << "\t\t ----->      LOOP " << nf_vertex->get_name() << "(" << nf_vertex->get_configuration() << ")" << def << std::endl;
			return;
		}
	}

	nf_colour = Grey;

	for ( auto& neighbour : adjacency_list.at(nf_vertex) ) {
		ElementVertex* ev = (ElementVertex*) neighbour;
		Colour& neighbour_colour = nf_visited[ev];

		//log << "\t\t Child: " << ev->get_name() << def << std::endl;

		// Unvisited node --> recursion
		if (neighbour_colour == White) {
			traffic_class_builder_dfs(nf_chain, nf_position, ev, nf_conf, neighbour_colour, nf_visited);
		}
		// Ambiguous color denotes a cycle!
		else if (neighbour_colour == Grey) {
			throw std::logic_error("Cycle in graph");
		}
	}

	// Visited nodes are in black list :p
	nf_colour = Black;
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

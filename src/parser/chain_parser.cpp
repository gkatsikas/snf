// -*- c-basic-offset: 4 -*-
/* chain_parser.cpp
 * 
 * Read a Click configuration and load it into a Graph.
 * Then compose multiple graphs to form a chain.
 *
 * Copyright (c) 2015-2016 KTH Royal Institute of Technology
 * Copyright (c) 2015-2016 Georgios Katsikas, Marcel Enguehard
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>
 */

#include "../shared/helpers.hpp"
#include "../traffic_class_builder/element_type.hpp"
#include "chain_parser.hpp"

#include <click/routervisitor.hh>

ChainParser::ChainParser(ParserConfiguration *pc) : chain_graph(pc) {
	this->log.set_logger_file(__FILE__);
	this->chain_length = this->chain_graph->get_chain()->get_vertices_no();

	if ( this->chain_length <= 0 ) {
		this->chain_graph = NULL;
		error_chatter(this->log, "ChainParser: Invalid chain length");
		exit(CHAIN_PARSING_PROBLEM);
	}
	def_chatter(this->log, "\tChain Parser constructed");
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

	def_chatter(this->log, "\tChain Parser deleted");
}

/*
 * PUBLIC API
 * A.
 * Reads, verifies and loads the input Click configurations one-by-one.
 * It belongs to the public API.
 * It calls the private load_nf_configuration as many times an the number
 * of input NFs that compose the chain.
 */
bool
ChainParser::load_nf_configurations(void) {
	
	info_chatter(this->log, "");

	// For each NF
	for ( Vertex *v : this->chain_graph->get_chain()->get_vertex_order() ) {
		ChainVertex *cv = static_cast<ChainVertex*> (v);

		info_chatter(this->log, "==============================================================================");
		info_chatter(this->log, "Network Function: " << cv->get_name());

		// 1. Load its elements into a Click Router object
		bool exit_status = this->load_nf(cv->get_name(), cv->get_source_code_path(), cv->get_position());
		if ( !exit_status )
			return exit_status;

		// 2. Visit all the Click elements of the NF and build the synthesizer's graph
		exit_status = this->build_nf_dag(cv->get_name(), cv->get_position());
		if ( !exit_status )
			return exit_status;

		info_chatter(this->log, "==============================================================================");
	}

	// Now we have the Click DAGs per NF
	info_chatter(this->log, "");

	return DONE;
}

/*
 * PUBLIC API
 * B.
 * After passing the loading step above, we are ready to chain these configurations
 * into one big Click graph so as to start the synthesis.
 */
bool
ChainParser::chain_nf_configurations(void) {

	info_chatter(this->log, "");
	info_chatter(this->log, "==============================================================================");
	info_chatter(this->log, "Chaining all Click Configurations...");

	// For each NF
	for ( Vertex *v : this->chain_graph->get_chain()->get_vertex_order() ) {
		ChainVertex *cv = static_cast<ChainVertex*> (v);

		def_chatter(this->log, "Network Function: " << cv->get_name());

		// Verify the NF chain against the property file and create connections between NFs
		short exit_status = this->verify_and_connect_nfs(cv->get_name(), cv->get_position());
		if ( !exit_status )
			return exit_status;

		info_chatter(this->log, "");
	}
	info_chatter(this->log, "==============================================================================");

	return DONE;
}

/*
 * Reads and loads one input Click configuration.
 * It uses built-in Click methods and data structures linked with this file.
 */
bool
ChainParser::load_nf(const std::string &nf_name, const std::string &nf_source, const unsigned short &position) {

	info_chatter(this->log, "Loading Click Configuration for " << nf_name << ": " << nf_source);

	Router *router = input_a_click_configuration(nf_source.c_str());
	if ( !router ) {
		error_chatter(this->log, "\tProblem while parsing Network Function " << position);
		return TO_BOOL(CLICK_PARSING_PROBLEM);
	}
	def_chatter(this->log, "\tNetwork Function " << position << " has " << router->nelements() 
		<< " elements: Status --> Parsed successfully");

	// Insert this Router object into parser's memory
	this->nf_configuration[position] = std::move(router);

	return DONE;
}

/*
 * After loading all the NFs into the parser's memory, run a DFS visit per DAG
 * to build the NF Synthesizer's graph.
 */
bool
ChainParser::build_nf_dag(const std::string &nf_name, const unsigned short &position) {

	Router *router = this->nf_configuration[position];

	if ( !router ) {
		error_chatter(this->log, "Network Function object is invalid");
		return TO_BOOL(NO_MEM_AVAILABLE);
	}

	// Create an empty Graph if does not exist
	if ( !this->nf_dag[position] )
		this->nf_dag[position] = new NFGraph();
	NFGraph *nf_graph = this->nf_dag[position];

	info_chatter(this->log, "");
	info_chatter(this->log, "Building Click Graph for " << nf_name);

	unsigned short total_elements = router->nelements();
	std::unordered_map< short, std::vector<std::string> > implicit_conf_mappings;
	std::unordered_map< short, short > implicit_port_mappings;

	for ( int i=0 ; i < router->nelements() ; i++ ) {
		Element *e = Router::element(router, i);

		//def_chatter(this->log, "Element " << e->class_name() << " " << e->eindex() << ": " << e->configuration().c_str());

		// This is an exceptional element! It has no inputs and outputs but serves as input to IPRewriter
		// We need to hand its configuration over the corresponding IPRewriter.
		if( SUPPORTED_MAPPER_ELEMENTS.find(e->class_name()) != SUPPORTED_MAPPER_ELEMENTS.end() ){
			std::string lb_variable = e->name().c_str();
			std::string lb_patterns = e->configuration().c_str();

			short implicit_port = -1;
			std::vector<std::string> implicit_conf;

			// Find the IPRewriter that uses this IP Mapper, parse the Mapper's configuration and
			// return it along with the position of the IPRewriter.
			int receiver_pos = this->associate_ip_mapper_to_rewriter(router, lb_variable, lb_patterns, implicit_conf, implicit_port);

			// Now the Mapper's configuration is available in the map where the IPRewriter's position is the key.
			if ( receiver_pos >= 0 ) {
				implicit_conf_mappings[receiver_pos] = implicit_conf;
				implicit_port_mappings[receiver_pos] = implicit_port;
			}
			// This is definitely a bug!
			else {
				error_chatter(this->log, "\tERROR while retrieving IPMapper's patterns");
				delete nf_graph;
				return TO_BOOL(CLICK_PARSING_PROBLEM);
			}

			// IPMapper elements do not have any ports so there is no point to proceed!
			continue;
		}

		ElementVertex *u = NULL;

		// Turn this Click element into a Vertex for our DAG
		if ( !nf_graph->contains(e->eindex()) )
			u = new ElementVertex(e, e->class_name(), e->eindex());
		else
			u = static_cast<ElementVertex*> ( nf_graph->get_vertex_by_position(e->eindex()) );

		// This element has some implicit configuration arguments coming from auxiliary elements.
		if ( implicit_conf_mappings.find(e->eindex()) != implicit_conf_mappings.end() ) {
			// Only an IPRewriter can be such an element
			assert(e->class_name() == std::string("IPRewriter"));
			u->set_implicit_configuration(implicit_port_mappings[e->eindex()], implicit_conf_mappings[e->eindex()]);
		}

		//u->print_info();
		//def_chatter(this->log, "Element " << u->get_name() << " " << u->get_position() << ": " << u->get_configuration());

		// Add this vertex to the NF DAG along with its neighbouring connections (vertices)
		try {
			nf_graph->add_vertex_and_neighbours(std::move(u));
		}
		catch (const std::exception& e) {
			error_chatter(this->log, "|--> " << e.what());
			return TO_BOOL(CLICK_PARSING_PROBLEM);
		}
	}

	// The generated DAG should not contain more vertices than the original one.
	// It can contain less though because we may have AddressInfo elements that are used only
	// as configuration elements.
	if ( nf_graph->get_vertices_no() > total_elements ) {
		delete nf_graph;
		return TO_BOOL(CLICK_PARSING_PROBLEM);
	}

	// Check if the created graph has cycles
	try {
		nf_graph->topological_sort();
	}
	catch (const std::exception& e) {
		error_chatter(this->log, "\t|--> " << e.what());
		return TO_BOOL(NF_CHAIN_NOT_ACYCLIC);
	}
	def_chatter(this->log, "\tClick Graph is acyclic");

	// If acyclic, print the adjacency list
	nf_graph->print_adjacency_list();

	return DONE;
}

/*
 * Assign IPMapper element to the appropriate IPRewriter.
 * IPMapper elements are exceptional. They have no inputs and outputs but serve as inputs to IPRewriters.
 */
int
ChainParser::associate_ip_mapper_to_rewriter(
		Router *router, const std::string &mapper_variable, const std::string &mapper_conf,
		std::vector<std::string> &implicit_conf, short &implicit_port) {

	std::size_t pos = mapper_variable.find_last_of("/");
	std::string short_variable = mapper_variable.substr(pos+1);

	// We want to return the posiiton of the element that uses this IPMapper,
	// along with a vector with the patterns of this IPMapper (see last argument of this function)
	int position = -1;

	for ( int i=0 ; i < router->nelements() ; i++ ) {
		Element *e = Router::element(router, i);
		std::string elem_conf = e->configuration().c_str();

		// We found an IPRewriter with this IPMapper as argument!
		if ( ((e->class_name() == std::string("IPRewriter"))) &&  (elem_conf.find(short_variable) != std::string::npos) ) {

			// Keep the position
			position = i;

			// Tokenize the IPRewriter's configuration to find the port that corresponds to the IPMapper
			short port  = 0;
			bool  found = false;
			for ( auto& tok : split(elem_conf, ",\t\n") ) {
				if ( tok == short_variable ) {
					// This port is returned by reference
					implicit_port = port;
					found = true;
					break;
				}
				port++;
			}

			if ( !found ) {
				error_chatter(this->log, "\tCannot map IPMapper " << mapper_variable 
					<< " to any port of element IPRewriter:" << e->eindex());
				return CHAIN_PARSING_PROBLEM;
			}

			// Target found. We need to tokenize and store the IPMapper's patterns
			// The tokenized configuration of the IPMapper is returned by reference
			for ( auto &tok : split(mapper_conf, ",\t\n") ) {
				implicit_conf.push_back(tok);
			}

			break;
		}
	}

	return position;
}

/*
 * After loading the Click elements into the DAG, we go back to the loaded topology and NFs (from property file)
 * and verify whether the interfaces are correct. The property file interfaces must be included int the actual
 * Click configuration, otherwise the synthesizer cannot assess the connectivity between two NFs.
 */
bool
ChainParser::verify_and_connect_nfs(const std::string &nf_name, const unsigned short &position) {
	Router *router = this->nf_configuration[position];

	if ( !router ) {
		error_chatter(this->log, "Network Function object is invalid");
		return TO_BOOL(NO_MEM_AVAILABLE);
	}

	// Get the references of the two graphs:
	//  1. The Chain graph that comprises of connected NFs.
	//     From this graph we need the vertex of this particular NF.
	//  2. The NF graph that comprises of Click elements
	Graph *chain_graph = this->chain_graph->get_chain();
	if ( !chain_graph )
		return TO_BOOL(NO_MEM_AVAILABLE);

	ChainVertex *this_nf = static_cast<ChainVertex*> (chain_graph->get_vertex_by_position(position));
	if ( !this_nf )
		return TO_BOOL(NO_MEM_AVAILABLE);

	NFGraph *nf_graph = this->nf_dag[position];
	if ( !nf_graph )
		return TO_BOOL(NO_MEM_AVAILABLE);

	Vector<ElementVertex*> input_elements  = nf_graph->get_vertices_by_stage(VertexType::Input);
	Vector<ElementVertex*> output_elements = nf_graph->get_vertices_by_stage(VertexType::Output);

	// A vector with both I and O elements
	Vector<ElementVertex*> io_elements(input_elements);
	for ( auto &el : output_elements )
		io_elements.push_back(el);

	unsigned short seen_entry_ifaces = 0;
	unsigned short seen_chain_ifaces = 0;

	// Parse input elements' configuration and cross check with the inputs from the property file.
	// --> Currently supported input elements: e.g., FromDevice()
	for ( auto &element : io_elements ) {
		std::string el_name  = element->get_name();
		std::string el_class = element->get_class();
		VertexType  type     = element->get_type();
		//std::string type_str = element->get_type_str();
		std::string configuration = element->get_configuration();

		// Configuration might contain e.g. BURST burst_size after the interface.
		// We don't want it.
		std::string interface = configuration.substr(0, configuration.find(","));

		// Supported I/O elements (Standard Click, ClickOS, Click-DPDK)
		if ( (el_class == "FromDevice")     || (el_class == "PollDevice") || (el_class == "ToDevice") ||
			 (el_class == "FromDPDKDevice") || (el_class == "ToDPDKDevice") ||
			 (el_class == "FromNetFront")   || (el_class == "ToNetFront") ) {

			debug_chatter(this->log, "");
			debug_chatter(this->log, "\tElement  Name: " << el_name);
			debug_chatter(this->log, "\tElement Class: " << el_class);
			debug_chatter(this->log, "\tElement  Type: " << type_str);
			debug_chatter(this->log, "\tConfiguration: " << configuration);
			debug_chatter(this->log, "\t    Interface: " << interface);

			// This is an entry interface that connects the chain to a domain
			if ( this_nf->has_entry_interface(interface) ) {
				//def_chatter(this->log, "\tInterface Type: ENTRY");
				element->set_endpoint(true);

				// Count only this side of the interface (not the ToDevice counterpart).
				if ( type == VertexType::Input )
					seen_entry_ifaces++;
			}
			// This is an internal interface that connects the NF with a subsequent NF
			else if ( this_nf->has_chain_interface(interface) ) {
				//def_chatter(this->log, "\tInterface Type: CHAIN");

				// Count only this side of the interface (not the ToDevice counterpart).
				if ( type == VertexType::Input )
					seen_chain_ifaces++;

				// ---> IMPORNTANT
				// For Output chain inerfaces (e.g. ToDevice(eth1) in NF_1[eth1] -> NF_2)
				// set a pointer to the first input element of the next NF.
				if ( type == VertexType::Output ) {

					def_chatter(this->log, "\t" << nf_name << " --> " << el_name << "(" << interface << ")");

					std::string next_nf_name = this_nf->get_nf_from_chain_interface(interface);
					ChainVertex *next_nf = static_cast<ChainVertex*> (chain_graph->get_vertex_by_name(next_nf_name));
					unsigned short next_nf_position = next_nf->get_position();
					std::string next_nf_iface = next_nf->get_iface_from_chain_nf(nf_name);
					//def_chatter(this->log, "\tNext NF is " << next_nf_name << " at position: " << next_nf_position 
					//		<< " and iface: " << next_nf_iface);

					NFGraph *next_nf_graph = this->nf_dag[next_nf_position];

					ElementVertex* next_jump = this->find_input_element_of_nf(next_nf_graph, next_nf_iface);
					if ( next_jump == NULL ) {
						error_chatter(this->log, "There is no connection between " << nf_name << " and " 
							<< next_nf_name << ". Element not found");
						return TO_BOOL(NO_MEM_AVAILABLE);
					}
					def_chatter(this->log, "\t\t Goes to " << next_nf_name << " --> " << next_jump->get_class() 
						<< "(" << next_nf_iface << ")");

					// Create the link between the Output vertex of this NF and the Input vertex of the next one
					element->set_glue_info(next_nf_position, next_nf_iface);
				}
			}
			// It can happen for chain interfaces that are attached to the inputs of the NFs
			// If you check property file, section [NF_TOPO], you will see that we do not specify
			// the input interfaces if these are not entry interfaces.
			else {
				debug_chatter(this->log, "\tUndeclared interface " << interface);
				element->set_endpoint(true);
			}
		}
	}

	unsigned short all_ifaces_no = this_nf->get_interfaces_no();

	// This means that here is an error in the definition of the chain in the property file.
	// TO FIX !=
	if ( seen_entry_ifaces + seen_chain_ifaces > all_ifaces_no ) {
		error_chatter(this->log,  
			"Number of parsed entry+chain interfaces is greater than the respective number specified in the property file");
		error_chatter(this->log, 
			"Click configuration for NF " << position << " is incompatible with the chain setup in the property file.");
		error_chatter(this->log, "Please check the interfaces.");
		return TO_BOOL(CLICK_PARSING_PROBLEM);
	}

	// I must be able to see all the entry interfaces of the property file in my Click configuration.
	if ( seen_entry_ifaces != this_nf->get_entry_interfaces_no() ) {
		error_chatter(this->log, 
			"Number of parsed entry interfaces is different than the respective number specified in the property file");
		error_chatter(this->log, 
			"Click configuration for NF " << position << " is incompatible with the chain setup in the property file.");
		error_chatter(this->log, 
			"Please check the entry interfaces -> [ENTRY_POINTS] in the property file.");
		return TO_BOOL(CLICK_PARSING_PROBLEM);
	}

	// If I see fewer chain interfaces than exist in the property file, there is a problem
	// TO FIX !=
	if ( seen_chain_ifaces > this_nf->get_chain_interfaces_no() ) {
		error_chatter(this->log, 
			"Number of parsed chain interfaces is greater than the number of chain interfaces declated in the property file");
		error_chatter(this->log, 
			"Click configuration for NF " << position << " is incompatible with the chain setup in the property file.");
		error_chatter(this->log, 
			"Please check the chain interfaces -> [NF_TOPO] in the property file.");
		return TO_BOOL(CLICK_PARSING_PROBLEM);
	}

	def_chatter(this->log, "\tNetwork Function " << nf_name << " is successfully verified against the property file");

	return DONE;
}

/*
 * Given a position in the chain and an output interface, we want to find the Click element of the next NF in
 * the chain. Essentially this function is a glue between two connected NFs.
 */
ElementVertex*
ChainParser::find_input_element_of_nf(NFGraph *next_nf_graph, const std::string &target_interface) {

	if ( !next_nf_graph )
		return NULL;

	// Get all the input elements of this NF
	Vector<ElementVertex*> input_elements = next_nf_graph->get_vertices_by_stage(VertexType::Input);

	// Search for the Input element with this interface
	for ( auto &element : input_elements ) {
		//std::string name = element->get_name();
		//std::string el_class = element->get_class();
		std::string configuration = element->get_configuration();

		// Configuration might contain e.g. BURST burst_size after the interface.
		// We don't want it.
		std::string interface = configuration.substr(0, configuration.find(","));

		if ( interface == target_interface )
			return element;
	}

	return NULL;
}

Vector<Element*>
ChainParser::visit_dag(const unsigned short &position) {

	// Storage to put the visited elements
	Vector<Element*> path_elements;

	Router *router = this->nf_configuration[position];
	if ( !router )
		return path_elements;

	// When set to -1, it means that all ports will be searched
	int port = -1;

	// Start from the first element of the graph
	Element *first = Router::element(router, 0);

	if ( !first ) {
		error_chatter(this->log, "\tError while traversing NF no " << position << " configuration");
		return path_elements;
	}
	path_elements.push_back(first);
	debug_chatter(this->log, "\tFirst element is " << std::string(first->class_name()));

	// DEPRECATED
	if ( router->downstream_elements(first, port, NULL, path_elements) != SUCCESS ) {
		error_chatter(this->log, "\tError while traversing NF no " << position << " configuration");
		return path_elements;
	}
	info_chatter(this->log, "\tNetwork Function is successfully traversed");
	info_chatter(this->log, "\tFound " << path_elements.size() << " elements");

	for ( Vector<Element*>::const_iterator i=path_elements.begin(); i!=path_elements.end(); ++i)
		debug_chatter(this->log, "\t\tElement Found: " << (*i)->class_name());

	return path_elements;
}

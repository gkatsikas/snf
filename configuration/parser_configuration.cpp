//============================================================================
//        Name: parser_configuration.cpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: Implements the parsing mechanisms that feed the NF Synthesizer.
//              Implements a NF chain as a digraph of interconnected NFs while
//              another digraph shows the connectivity of this chain with
//              external NFV domains.
//============================================================================

#include "../helpers.hpp"
#include <boost/tokenizer.hpp>
#include "parser_configuration.hpp"

/*
 * Construct an empty parser configuration
 */
ParserConfiguration::ParserConfiguration(const std::string& config_file) : GenericConfiguration(config_file) {
	this->nf_chain   = new Graph();
	this->nf_domains = new Graph();
}

/*
 * Destruct a parser configuration
 */
ParserConfiguration::~ParserConfiguration() {
	if ( this->nf_chain != NULL )
		delete this->nf_chain;
	if ( this->nf_domains != NULL )
		delete this->nf_domains;
}

/*
 * Read the topology of the NF chain and encode it into a graph structure.
 * The topology is represented as a Click configuration, e.g. NF_1[eth0] -> NF2;
 */
void ParserConfiguration::load_property_file(void) {
	unsigned short exit_status = 0;
	std::string nf_topo, nf_domains;

	try {
		// Read the topology
		nf_topo    = (std::string&) get_value("NF_TOPO",      "TOPOLOGY");

		// Read the domains interconnected to that topology
		nf_domains = (std::string&) get_value("ENTRY_POINTS", "DOMAINS");
	}
	catch (const std::exception& e) {
		log << error << "|--> " << e.what() << def << std::endl;
		exit(NF_CHAIN_NOT_ACYCLIC);
	}

	log << "\tNF Topology = " << nf_topo << def << std::endl;
	// Parse the chain of NFs form the property file
	if ( (exit_status=this->parse_topology(nf_topo)) != SUCCESS )
		exit(exit_status);

	//log << "" << def << std::endl;

	log << "\tNFV Domains = " << nf_domains << def << std::endl;
	// Parse the connection points of the chain with the outside world (e.g. operator's domains)
	if ( (exit_status=this->parse_domains(nf_domains)) != SUCCESS )
		exit(exit_status);

	log << "" << def << std::endl;

	// Check if the graph is acyclic
	this->check_for_loops();

	log << "" << def << std::endl;

	return;
}

/*
 * Parse the internal NF chain connections
 */
short ParserConfiguration::parse_topology(const std::string& nf_topo) {

	if ( this->nf_chain == NULL ) {
		this->usage("The graph of he chain does not exist.", "Badly instantiated ParserConfiguration.");
		return NO_MEM_AVAILABLE;
	}

	// Count the number of NFs in the property file
	unsigned short elements_in_property = count_section_elements("NF_MODULES");
	//log << "\tNumber of chained NFs = " << elements_in_property << def << std::endl;

	// The token used to separate rows in the input topology map
	boost::char_separator<char> con_sep(";");

	// Split the map into rows
	boost::tokenizer<boost::char_separator<char>> connections(nf_topo, con_sep);

	for (boost::tokenizer<boost::char_separator<char>>::iterator line=connections.begin(); line!=connections.end(); ++line) {
		// Each statement is in the form NF_X[interface] -> [interface]NF_Y
		boost::char_separator<char> element_sep(" -> ");
		boost::tokenizer<boost::char_separator<char>> connections(*line, element_sep);

		// Operator -> must split the statement into exactly two parts.
		if ( std::distance(connections.begin(), connections.end()) > 2 ) {
			this->usage("Each connection statement must have two parts separated by ->.", "Syntax: NF_1[iface]->[iface]NF_2;");
			return CHAIN_PARSING_PROBLEM;
		}

		unsigned short tokens = 0;
		std::vector<ChainVertex*> vertices;
		for (boost::tokenizer<boost::char_separator<char>>::iterator elem=connections.begin(); elem!=connections.end (); ++elem) {
			// One more check does not harm
			if ( tokens > 1 ) {
				this->usage("Invalid interface specification.", "Syntax: NF_1[iface]->NF_2;");
				return CHAIN_PARSING_PROBLEM;
			}

			std::string nf;
			std::string interface;

			// [
			std::size_t left_bracket = elem->find("[");
			if ( left_bracket == std::string::npos ) {
				this->usage("An interface must be specified in []", "Syntax: NF_1[iface]->[iface]NF_2;");
				return CHAIN_PARSING_PROBLEM;
			}

			// ]
			std::size_t right_bracket = elem->find("]");
			if ( right_bracket == std::string::npos ) {
				this->usage("An interface must be specified in []", "Syntax: NF_1[iface]->[iface]NF_2;");
				return CHAIN_PARSING_PROBLEM;
			}

			// Extract the interface from the brackets
			interface = elem->substr (left_bracket+1, right_bracket-left_bracket-1);

			// LEFT-side element parsing
			if ( tokens == 0 ) {
				// Left-side element is before the output interface
				nf = elem->substr(0, left_bracket);
				//log << info << "\t" << nf << "[" << interface << "] -> " << def;
			}
			// RIGHT-side element parsing
			else if ( tokens == 1 ) {
				// Right-side element is after the input interface
				nf = elem->substr(right_bracket+1);
				//log << info << "[" << interface << "]" << nf << def << std::endl;
			}
			else {
				this->usage("Invalid interface specification.", "Syntax: NF_1[iface]->[iface]NF_2;");
				return CHAIN_PARSING_PROBLEM;
			}

			int position = atoi(this->get_number_from_string(nf).c_str());

			// Check if this NF is already inserted
			ChainVertex* v = (ChainVertex*) this->nf_chain->get_vertex_by_position(position);

			// Create one
			if ( v == NULL ) {
				// Read the path of the Click configuration for this element
				std::string nf_path;
				try {
					nf_path = (std::string&) get_value("NF_MODULES", nf);
				}
				catch (const std::exception& e) {
					log << error << "|-> " << e.what() << def << std::endl;
					exit(NF_CHAIN_NOT_ACYCLIC);
				}

				// Check what's being read
				if ( nf_path.empty() ) {
					this->usage("Invalid interface specification.", "Syntax: NF_1[iface]->[iface]NF_2;");
					return CHAIN_PARSING_PROBLEM;
				}
				//log << "Source Path: " << nf_path << std::endl;

				v = new ChainVertex(nf_path, nf, position, VertexType::NF);
			}
			// If it exists, check if the interface to be inserted already exists.
			// One interface maps to only one NF
			else {
				if ( v->get_chain_interface(interface) != "NULL" ) {
					this->usage("Invalid interface specification.", v->get_name() + " has already set interface " + interface);
					return CHAIN_PARSING_PROBLEM;
				}
			}

			// Set also its interface
			v->add_chain_interface_key(interface);

			// Add it to the vector
			vertices.push_back(std::move(v));

			tokens++;
		}

		// The vector must contain exactly two vertices (either new or existing) after this for loop.
		if ( vertices.size() != 2 ) {
			this->usage("Unbalanced connection.", "Syntax: NF_1[iface]->[iface]NF_2;");
			return CHAIN_PARSING_PROBLEM;
		}
		this->nf_chain->add_edge(std::move(vertices.at(0)), std::move(vertices.at(1)));

		//log << "\t" << *line << std::endl;
	}

	// Check if the elements given in the [NF] section of the property file, correspond to the
	// elements that form the chain in the [NF_TOPO] section.
	// If no error has occured by now and there are unloaded NFs, they are simply ignored because the formulated chain
	// is valid.
	unsigned short graph_elements = this->nf_chain->get_vertices_no();

	if ( elements_in_property > graph_elements ) {
		log << warn << "There are " << elements_in_property - graph_elements << " unloaded NFs" << def << std::endl;
	}
	else if ( elements_in_property < graph_elements ) {
		log << error << "There are " << graph_elements - elements_in_property << " missing elements in [NF] section of the property file." << def << std::endl;
		return CHAIN_PARSING_PROBLEM;
	}

	return SUCCESS;
}

/*
 * Parse the external NF chain connections with various domains
 */
short ParserConfiguration::parse_domains(const std::string& nf_domains) {
	unsigned short domain = 0;

	if ( this->nf_chain == NULL ) {
		this->usage("The graph of he chain does not exist.", "Badly instantiated ParserConfiguration.");
		return NO_MEM_AVAILABLE;
	}

	// The token used to separate rows in the input topology map
	boost::char_separator<char> con_sep(", ");

	// Split the map into rows
	boost::tokenizer<boost::char_separator<char>> connections(nf_domains, con_sep);

	for (boost::tokenizer<boost::char_separator<char>>::iterator point=connections.begin(); point!=connections.end(); ++point) {

		std::string nf;
		std::string interface;

		std::size_t left_bracket = point->find("[");
		if ( left_bracket == std::string::npos ) {
			this->usage("Entry NF must have interface.", "Syntax: [iface]NF_X,");
			return CHAIN_PARSING_PROBLEM;
		}
		std::size_t right_bracket = point->find("]");

		// Extract what is in bracket
		if ( right_bracket == std::string::npos ) {
			this->usage("Entry NF must have interface.", "Syntax: [iface]NF_X,");
			return CHAIN_PARSING_PROBLEM;
		}

		nf = point->substr(right_bracket+1);
		interface = point->substr (left_bracket+1, right_bracket-left_bracket-1);
		int position = atoi(this->get_number_from_string(nf).c_str());

		// This NF must already exist
		ChainVertex* v = (ChainVertex*) this->nf_chain->get_vertex_by_position(position);

		// If not, something is wrong..
		if ( v == NULL ) {
			this->usage(nf + " does not exist in the topology", "Please cross check NF_MODULES and NF_TOPO sections");
			return CHAIN_PARSING_PROBLEM;
		}
		// If it exists, check if the interface to be inserted already exists in the list of chain interfaces.
		// One interface maps to only one NF
		else {
			// Check if this interface exists in the set chain interfaces. It must not!
			if ( v->get_chain_interface(interface) != "NULL") {
				this->usage("Invalid interface specification.", v->get_name() + " has already set interface " + interface);
				return CHAIN_PARSING_PROBLEM;
			}

			// Now check if it exists in the list of entry interfaces (inserted previously)
			if ( v->get_entry_interface(interface) != "NULL") {
				this->usage("Invalid interface specification.", v->get_name() + " has already set interface " + interface);
				return CHAIN_PARSING_PROBLEM;
			}
		}

		// Add the interface as entry one
		v->add_entry_interface_key(interface);

		// Create also a node that represents the domain to which the NF is connected.
		ChainVertex* d = new ChainVertex("", "Dom_"+std::to_string(domain), -1, VertexType::Domain);
		// Create a copy of the chain's vertex to facilitate the memory clean-up at the end.
		ChainVertex* f = new ChainVertex(*v);

		// Add a link
		this->nf_domains->add_edge(std::move(d), std::move(f));

		domain++;
	}

	return SUCCESS;
}

/*
 * Check whether the formulated graph of the chain is acyclic
 */
void ParserConfiguration::check_for_loops(void) {
	if ( (this->nf_chain == NULL) || (this->nf_domains == NULL) ) {
		log << warn << "\tGraph(s) do(es) not exist" << def << std::endl;
		return;
	}

	if ( this->nf_chain->is_empty() || this->nf_domains->is_empty() ) {
		log << warn << "\tGraph(s) is(are) empty" << def << std::endl;
		return;
	}

	try {
		log << "\tTopological sort ... " << def << std::endl;
		this->nf_chain->topological_sort();
		log << "\t|---> NF Chain  graph is acyclic" << def << std::endl;
		this->nf_domains->topological_sort();
		log << "\t|---> NF Domain graph is acyclic" << def << std::endl;
	}
	catch (const std::exception& e) {
		log << error << "|--> " << e.what() << def << std::endl;
		exit(NF_CHAIN_NOT_ACYCLIC);
	}

	return;
}

/*
 * Extract numbers from strings
 */
std::string ParserConfiguration::get_number_from_string(std::string const& str) {
	std::size_t const n = str.find_first_of("0123456789");
	if ( n != std::string::npos ) {
		std::size_t const m = str.find_first_not_of("0123456789", n);
		return str.substr(n, m != std::string::npos ? m-n : m);
	}
	return std::string();
}

/*
 * Print error messages regarding the property file
 */
void ParserConfiguration::usage(const std::string& message, const std::string& usage) {
	log << error << message << def << std::endl;
	log << error << "|-> " << usage << def << std::endl;
}

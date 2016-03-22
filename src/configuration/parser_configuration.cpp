//============================================================================
//        Name: parser_configuration.cpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: Implements the parsing mechanisms that feed the NF Synthesizer.
//              Implements a NF chain as a digraph of interconnected NFs while
//              another digraph shows the connectivity of this chain with
//              external NFV domains.
//============================================================================

#include <boost/tokenizer.hpp>
#include "parser_configuration.hpp"
#include "../shared/helpers.hpp"

/*
 * Construct an empty parser configuration
 */
ParserConfiguration::ParserConfiguration(const std::string &config_file)
										: GenericConfiguration(config_file) {
	this->nf_chain   = new Graph();
	this->nf_domains = new Graph();
	this->properties = NULL;
	note_chatter(this->log, "\tParserConfiguration constructed");
}

/*
 * Destruct a parser configuration
 */
ParserConfiguration::~ParserConfiguration() {
	if ( this->nf_chain != NULL ) {
		delete this->nf_chain;
	}
	if ( this->nf_domains != NULL ) {
		delete this->nf_domains;
	}
	if ( this->properties != NULL ) {
		delete this->properties;
	}
	note_chatter(this->log, "\tParserConfiguration deleted");
}

/*
 * Read the topology of the NF chain and encode it into a graph structure.
 * The topology is represented as a Click configuration, e.g. NF_1[eth0] -> NF2;
 */
short
ParserConfiguration::load_property_file(void) {
	unsigned short exit_status = 0;
	std::string nf_topo, nf_domains;

	// First, parse the generic properties of the chain
	if ( (exit_status=this->parse_generic_properties()) != SUCCESS ) {
		return exit_status;
	}

	try {
		// Read the topology
		nf_topo    = (std::string&) get_value("NF_TOPO",      "TOPOLOGY");

		// Read the domains interconnected to that topology
		nf_domains = (std::string&) get_value("ENTRY_POINTS", "DOMAINS");
	}
	catch (const std::exception& e) {
		error_chatter(this->log, "|--> " << e.what());
		return NF_CHAIN_NOT_ACYCLIC;
	}

	debug_chatter(this->log, "\tNF Topology = " << nf_topo);
	// Parse the chain of NFs form the property file
	if ( (exit_status=this->parse_topology(nf_topo)) != SUCCESS ) {
		return exit_status;
	}

	debug_chatter(this->log, "\tNFV Domains = " << nf_domains);
	// Parse the connection points of the chain with the outside world (e.g. operator's domains)
	if ( (exit_status=this->parse_domains(nf_domains)) != SUCCESS ) {
		return exit_status;
	}

	def_chatter(this->log, "\tThe property file is successfully parsed");
	log << "" << def << std::endl;

	// Check if the graph is acyclic
	if ( (exit_status=this->check_for_loops())  != SUCCESS ) {
		return exit_status;
	}

	log << "" << def << std::endl;

	// Print the configuration details
	this->print_loaded_property_status();

	log << "" << def << std::endl;

	return SUCCESS;
}

/*
 * Read the generic parameters of the Chain Configurator
 */
short
ParserConfiguration::parse_generic_properties(void) {

	// Apply the default configuration in case something goes wrong.
	std::string output_folder(DEFAULT_HYPER_NF_OUT_FOLDER);
	std::string output_filename(output_folder + DEFAULT_HYPER_NF_CONF_NAME);
	bool hw_classification = false;
	std::string hardware_classification_label;
	TrafficClassFormat traffic_class_format = DEFAULT_TC_FORMAT;
	bool numa = true;
	unsigned short cpu_cores_no   = DEFAULT_CPU_CORES_NO;
	unsigned short cpu_sockets_no = DEFAULT_CPU_SOCKETS_NO;
	// Modern NICs have a lot of queues but it makes sence
	// to adapt this number to the available CPU cores.
	unsigned short nic_hw_queues_no = cpu_cores_no;

	// Read the output folder
	// If not given, use the default
	try {
		output_folder = (std::string&) get_value("GENERIC", "OUTPUT_FOLDER");

		if ( ! directory_exists(output_folder) ) {
			if ( ! create_directory(output_folder) ) {
				return FAILURE;
			}
		}
	}
	catch (const std::exception& e) {

	}

	// Read the desired filename of the generated code
	// If not given, use the default (constructor)
	try {
		output_filename = (std::string&) get_value("GENERIC", "OUTPUT_FILE");

		// Careful, you might lose your previously synthesized chain!
		if ( file_exists(output_filename) ) {
			warn_chatter(this->log, "\tOutput file " << output_filename << " exists and will be overwritten");
		}

		// Remove the extension because we might generate files different extensions.
		// We handle the new extensions in the synthesizer class.
		if ( get_string_extension(output_filename, '.') == "click" ) {
			output_filename = get_substr_before(output_filename, ".click");
		}

		// Place the output file into the output folder
		if ( get_string_extension(output_folder, '/') != "" ) {
			// Folder should end with /
			output_folder += "/";
		}
		output_filename = output_folder + output_filename;
	}
	catch (const std::exception& e) {
		output_filename = output_folder + DEFAULT_HYPER_NF_CONF_NAME;
	}

	// If Hardware classification option is true, the generated code
	// will consist of two parts. One Intel RSS file with the expressions to
	// be given to the NIC and one .click file. The Click file will assume 
	// that DPDK is supported and encode multiple FromDPDKDevice elements that
	// read packets from the same NIC but different hardware queue. A thread
	// scheduler then will assign queues to cores and output the rest Click 
	// elements to different cores.
	// If not given, use the default (constructor)
	try {
		hw_classification = (bool) get_value("GENERIC", "HARDWARE_CLASSIFICATION", true);
	}
	catch (const std::exception& e) {

	}

	// If Hardware classification option is true, we want to know certain properties
	// of the targte system.
	if ( hw_classification ) {

		// A. Method to classify traffic in hardware.
		try {
			hardware_classification_label = (std::string&) get_value(
				"GENERIC", "HARDWARE_CLASSIFICATION_FORMAT"
			);
		}
		catch (const std::exception& e) {
			hardware_classification_label = static_cast<std::string>("Unknown");
		}

		// Check the given method against a dictionary of supported methods.
		try {
			traffic_class_format = TCLabelToFormat.at(hardware_classification_label);

			if ( traffic_class_format == Click ) {
				error_chatter(this->log, 
					"Click is not hardware based traffic class format. Choose [RSS-Hashing, Flow-Director, OpenFlow]"
				);
				exit(WRONG_INPUT_ARGS);
			}
		}
		catch (const std::exception& e) {
			error_chatter(this->log, 
				"Unknown Traffic Class format. Choose [RSS-Hashing, Flow-Director, OpenFlow]"
			);
			exit(WRONG_INPUT_ARGS);
		}

		// B. Non-Uniform Memory Access
		try {
			numa = (bool) get_value("GENERIC", "NUMA", true);
		}
		catch (const std::exception& e) {

		}

		// C. # of CPU sockets
		try {
			cpu_sockets_no = (unsigned short) get_value("GENERIC", "CPU_SOCKETS");
		}
		catch (const std::exception& e) {

		}

		// D. # of CPU cores
		try {
			cpu_cores_no = (unsigned short) get_value("GENERIC", "CPU_CORES");
		}
		catch (const std::exception& e) {
			
		}

		// You cannot have more sockets than cores, be serious
		assert (cpu_sockets_no <= cpu_cores_no);
		// Each socket contains an even number of cores and number of sockets is even too.
		assert (cpu_cores_no % cpu_sockets_no == 0);

		// E. # of hardware queues in the NIC
		try {
			nic_hw_queues_no = (unsigned short) get_value("GENERIC", "NIC_HW_QUEUES");
		}
		catch (const std::exception& e) {
			
		}
	}

	// Allocate the properties object after all the configuration is applied.
	this->properties = new Properties(
		output_folder, output_filename, hw_classification,
		traffic_class_format, numa, cpu_sockets_no,
		cpu_cores_no, nic_hw_queues_no
	);

	return SUCCESS;
}

/*
 * Parse the internal NF chain connections
 */
short
ParserConfiguration::parse_topology(const std::string &nf_topo) {

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
		// The delimiter is a string. If I don't find '->' I quit!
		if ( line->find("->") == std::string::npos ) {
			this->usage("Each connection statement must have two parts separated by ->.", "Syntax: NF_1[iface]->[iface]NF_2;");
			return CHAIN_PARSING_PROBLEM;
		}

		// Now split
		boost::char_separator<char> element_sep("->");
		boost::tokenizer<boost::char_separator<char>> connections(*line, element_sep);

		// Operator -> must split the statement into exactly two parts.
		if ( std::distance(connections.begin(), connections.end()) > 2 ) {
			this->usage("Each connection statement must have two parts separated by ->.", "Syntax: NF_1[iface]->[iface]NF_2;");
			return CHAIN_PARSING_PROBLEM;
		}

		unsigned short tokens = 0;
		std::vector<std::string> ifaces;
		std::vector<ChainVertex*> vertices;
		for (boost::tokenizer<boost::char_separator<char>>::iterator elem=connections.begin(); elem!=connections.end (); ++elem) {
			// One more check does not harm
			if ( tokens > 1 ) {
				this->usage("Invalid interface specification.", "Syntax: NF_1[iface]->[iface]NF_2;");
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

			int position = atoi(get_number_from_string(nf).c_str());

			// Check if this NF is already inserted
			ChainVertex *v = static_cast<ChainVertex*> (this->nf_chain->get_vertex_by_position(position));

			// Create one
			if ( v == NULL ) {
				// Read the path of the Click configuration for this element
				std::string nf_path;
				try {
					nf_path = (std::string&) get_value("NF_MODULES", nf);
				}
				catch (const std::exception& e) {
					error_chatter(this->log, "|-> " << e.what());
					return NF_CHAIN_NOT_ACYCLIC;
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
				if ( v->has_chain_interface(interface) ) {
					this->usage("Invalid interface specification.", v->get_name() + " has already set interface " + interface);
					return CHAIN_PARSING_PROBLEM;
				}
			}

			// Set also its interface
			v->add_chain_interface_key(interface);

			// Add them to the vector
			ifaces.push_back(interface);
			vertices.push_back(std::move(v));

			tokens++;
		}

		// The vector must contain exactly two vertices (either new or existing) after this for loop.
		if ( vertices.size() != 2 ) {
			this->usage("Unbalanced connection.", "Syntax: NF_1[iface]->[iface]NF_2;");
			return CHAIN_PARSING_PROBLEM;
		}

		// Now that eveything is read properly, associate the interface names with the NF names in the InterfaceMap
		vertices.at(0)->add_chain_interface_pair(ifaces[0], "", vertices.at(1)->get_name());
		vertices.at(1)->add_chain_interface_pair(ifaces[1], "", vertices.at(0)->get_name());

		// Finally, add the edge to the graph
		this->nf_chain->add_edge( std::move(vertices.at(0)), std::move(vertices.at(1)), 0 );
	}

	// Check if the elements given in the [NF] section of the property file, correspond to the
	// elements that form the chain in the [NF_TOPO] section.
	// If no error has occured by now and there are unloaded NFs, they are simply ignored because the formulated chain
	// is valid.
	unsigned short graph_elements = this->nf_chain->get_vertices_no();

	if ( elements_in_property > graph_elements ) {
		warn_chatter(this->log, "There are " << elements_in_property - graph_elements << " unloaded NFs");
	}
	else if ( elements_in_property < graph_elements ) {
		error_chatter(this->log, "There are " << graph_elements - elements_in_property << 
						" missing elements in [NF] section of the property file.");
		return CHAIN_PARSING_PROBLEM;
	}

	return SUCCESS;
}

/*
 * Parse the external NF chain connections with various domains
 */
short
ParserConfiguration::parse_domains(const std::string &nf_domains) {
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
		int position = atoi(get_number_from_string(nf).c_str());

		// This NF must already exist
		ChainVertex *v = static_cast<ChainVertex*> (this->nf_chain->get_vertex_by_position(position));

		// If not, something is wrong..
		if ( v == NULL ) {
			this->usage(nf + " does not exist in the topology", "Please cross check NF_MODULES and NF_TOPO sections");
			return CHAIN_PARSING_PROBLEM;
		}
		// If it exists, check if the interface to be inserted already exists in the list of chain interfaces.
		// One interface maps to only one NF
		else {
			// Check if this interface exists in the set chain interfaces. It must not!
			if ( v->has_chain_interface(interface) ) {
				this->usage("Invalid interface specification.", v->get_name() + " has already set interface " + interface);
				return CHAIN_PARSING_PROBLEM;
			}

			// Now check if it exists in the list of entry interfaces (inserted previously)
			if ( v->has_entry_interface(interface) ) {
				this->usage("Invalid interface specification.", v->get_name() + " has already set interface " + interface);
				return CHAIN_PARSING_PROBLEM;
			}
		}

		std::string domain_name = "Dom_"+std::to_string(domain);

		// Add the interface as entry one
		v->add_entry_interface_pair(interface, "", domain_name);

		// Create also a node that represents the domain to which the NF is connected.
		ChainVertex* d = new ChainVertex("", domain_name, 0, VertexType::Domain);
		// Create a copy of the chain's vertex to facilitate the memory clean-up at the end.
		ChainVertex* f = new ChainVertex(*v);

		// Add a link
		this->nf_domains->add_edge( std::move(d), std::move(f), 0 );

		domain++;
	}

	#ifdef  DEBUG_MODE
		this->nf_domains->print_adjacency_list();
	#endif

	return SUCCESS;
}

/*
 * Check whether the formulated graph of the chain is acyclic
 */
short
ParserConfiguration::check_for_loops(void) {
	if ( this->nf_chain == NULL ) {
		warn_chatter(this->log, "\tGraph(s) do(es) not exist");
		return NO_MEM_AVAILABLE;
	}

	if ( this->nf_chain->is_empty() ) {
		warn_chatter(this->log, "\tGraph(s) is(are) empty");
		return NO_MEM_AVAILABLE;
	}

	try {
		def_chatter(this->log, "\tTopological sort ... ");
		this->nf_chain->topological_sort();
		def_chatter(this->log, "\t|---> NF Chain graph is acyclic");
	}
	catch (const std::exception& e) {
		error_chatter(this->log, "|--> " << e.what());
		return NF_CHAIN_NOT_ACYCLIC;
	}

	return SUCCESS;
}

/*
 * Print error messages regarding the property file
 */
void
ParserConfiguration::usage(const std::string &message, const std::string &usage) {
	error_chatter(this->log, message);
	error_chatter(this->log, "|-> " << usage);
}

/*
 * Print the loaded configuration
 */
void
ParserConfiguration::print_loaded_property_status(void) {
	def_chatter(this->log, "\t++++++++++++++ Generic Configuration ++++++++++++++");
	info_chatter(this->log, "\t" << "                Output Folder: " <<
		this->get_properties()->get_output_folder());
	info_chatter(this->log, "\t" << "              Output Filename: " <<
		this->get_properties()->get_output_filename());
	info_chatter(this->log, "\t" << "      Hardware Classification: " <<
		bool_to_str(this->get_properties()->has_hardware_classification()));

	// Only if HW Classification is requested
	if ( this->get_properties()->has_hardware_classification() ) {
		info_chatter(this->log, "\t" << "Traffic Classification Format: " <<
			tc_to_label(this->get_properties()->get_traffic_classification_format()));
		info_chatter(this->log, "\t" << "    Non-Uniform Memory Access: " <<
			bool_to_str(this->get_properties()->has_numa()));
		info_chatter(this->log, "\t" << "             # of CPU Sockets: " <<
			this->get_properties()->get_cpu_sockets_no());
		info_chatter(this->log, "\t" << "             # of CPU   Cores: " <<
			this->get_properties()->get_cpu_cores_no());
		info_chatter(this->log, "\t" << "             # of NIC  Queues: " <<
			this->get_properties()->get_nic_hw_queues_no());
	}
	def_chatter(this->log, "\t+++++++++++++++++++++++++++++++++++++++++++++++++++");

	def_chatter(this->log, "\t+++++++++++++++ Chain Interface Map +++++++++++++++");
	for (auto& pair : this->nf_chain->get_adjacency_list()) {
		ChainVertex* v = static_cast<ChainVertex*> (pair.first);
		v->print_chain_interface_map();
	}
	def_chatter(this->log, "\t+++++++++++++++++++++++++++++++++++++++++++++++++++");

	def_chatter(this->log, "\t+++++++++++++++ Entry Interface Map +++++++++++++++");
	for (auto& pair : this->nf_chain->get_adjacency_list()) {
		ChainVertex* v = static_cast<ChainVertex*> (pair.first);
		v->print_entry_interface_map();
	}
	def_chatter(this->log, "\t+++++++++++++++++++++++++++++++++++++++++++++++++++");
}

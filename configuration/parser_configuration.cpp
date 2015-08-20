//============================================================================
// Name        : parser_configuration.cpp
// Copyright   : KTH ICT CoS Network Systems Lab
// Description : Defines a NF chain as a graph of interconnected NFs
//============================================================================

#include <memory>

#include "../helpers.hpp"
#include <boost/tokenizer.hpp>
#include "parser_configuration.hpp"

/*
 * Construct an empty parser configuration
 */
ParserConfiguration::ParserConfiguration(const std::string& config_file) : GenericConfiguration(config_file) {
	this->nf_chain = NULL;
}

/*
 * Destruct a parser configuration
 */
ParserConfiguration::~ParserConfiguration() {
	if ( this->nf_chain != NULL )
		delete this->nf_chain;
}

/*
 * Read the topology of the NF chain and encode it into a graph structure.
 * The topology is represented as an NxN array, where N is the number of NFs.
 * Each row shows the connections of a NF with the rest NFs.
 * --> 0 corresponds to NO CONNECTION
 * --> 1 corresponds to CONNECTION
 * BE CAREFUL: The graph is directed thus each edge is an arrow (one-way)
 */
void ParserConfiguration::load_property_file(void) {
	unsigned short i = 0;
	unsigned short exit_status = 0;

	// Count the number of NFs in the property file
	unsigned short nfs_no = count_section_elements("NF_CHAIN");
	log << info << "\tNumber of chained NFs = " << nfs_no << def << std::endl;

	std::string nf_topo = (std::string&) get_value("NF_TOPO", "TOPOLOGY");
	//log << info << "\tTopology of NFs = " << nf_topo << def << std::endl;

	// The token used to separate rows in the input topology map
	boost::char_separator<char> row_sep(";");

	// Split the map into rows
	boost::tokenizer<boost::char_separator<char>> rows(nf_topo, row_sep);

	// Check if the number of rows equals the number of NFs
	if ( (exit_status=this->check_topology_correctness(rows, nfs_no, "row")) != SUCCESS )
		exit(exit_status);

	for (const auto& row : rows) {
		// Each row is a space-separated string to discriminate the NFs
		boost::char_separator<char> col_sep(" ");
		boost::tokenizer<boost::char_separator<char>> cols(row, col_sep);

		// Check if the number of columns equals the number of NFs
		if ( (exit_status=this->check_topology_correctness(cols, nfs_no, "column")) != SUCCESS )
			exit(exit_status);
	}

	// Create an empty graph
	this->nf_chain = new Graph();

	// Create as many vertices as the number of NFs
	std::vector<std::shared_ptr<Vertex>> nf_array;
	// Pre-allocate for better performance
	nf_array.reserve(nfs_no);
	for (i=0 ; i<nfs_no ; i++) {
		std::stringstream sstr;
		sstr << i+1;
		std::string nf_pos_str  = sstr.str();
		std::string nf_path = (std::string&) get_value("NF_CHAIN", "NF_"+nf_pos_str);

		// Use smart pointers to avoid duplicate objects
		std::shared_ptr<Vertex> sp(new Vertex("NF_"+nf_pos_str, nf_path, i));
		nf_array.push_back(std::move(sp));
	}

	// Check that the vector is populated
	//for (auto& v : nf_array) {
	//	v->print_info();
	//}

	// Interconnect the created nodes to form a graph that represents the NF chain
	unsigned short src_element = 0;
	for (const auto& row : rows) {
		Vertex& src_vertex = *nf_array[src_element];

		boost::char_separator<char> col_sep(" ");
		boost::tokenizer<boost::char_separator<char>> cols(row, col_sep);

		unsigned short dst_element = 0;
		for (boost::tokenizer<boost::char_separator<char>>::iterator iter=cols.begin(); iter!=cols.end (); ++iter) {
			// There is a connection --> Create a graph edge
			if ( (*iter == "1") && (src_element != dst_element) ) {
				Vertex& dst_vertex = *nf_array[dst_element];

				// Add connection
				this->nf_chain->add_edge(&src_vertex, &dst_vertex);
			}
			dst_element++;
		}

		src_element++;
	}

	// Check if the graph is acyclic
	this->check_for_loops();

	return;
}

short int ParserConfiguration::check_topology_correctness(const boost::tokenizer<boost::char_separator<char>>& array,
								const unsigned short& correct_elements_no,
								const std::string& type) {

	unsigned short elements = 0;

	for (boost::tokenizer<boost::char_separator<char>>::iterator iter=array.begin(); iter!=array.end (); ++iter) {
		// Check if all the cells (columns) of a row have correct values
		if ( type.compare("column") == 0 ) {
			if ( (*iter != "0") && (*iter != "1") ) {
				log << error << "Topology map cells should have binary (0/1) values" << def << std::endl;
				return INVALID_TOPOLOGY;
			}
		}
		elements++;
	}

	if ( elements != correct_elements_no) {
		log << error << "Topology map " << type << " elements (" << elements << ") do not comply with the inputs NFs (" \
			<< correct_elements_no << ")" << def << std::endl;
		return INVALID_TOPOLOGY;
	}

	return SUCCESS;
}

void ParserConfiguration::check_for_loops(void) {
	if ( this->nf_chain == NULL ) {
		log << warn << "\tGraph does not exist" << def << std::endl;
		return;
	}

	if ( this->nf_chain->is_empty() ) {
		log << warn << "\tGraph is empty" << def << std::endl;
		return;
	}

	try {
		log << info << "Topological sort ... " << def << std::endl;
		this->nf_chain->topological_sort();
		log << info << "|---> Graph is acyclic" << def << std::endl;
	}
	catch (const std::exception& e) {
		log << error << e.what() << def << std::endl;
	}

	return;
}

//============================================================================
//        Name: parser_configuration.hpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: Defines a NF chain as a digraph of interconnected NFs
//============================================================================

#ifndef _PARSER_CONFIG_HPP_
#define _PARSER_CONFIG_HPP_

#include "../graph/graph.hpp"
#include "generic_configuration.hpp"

/*
 * The Chain graph contains an associated source code filename per vertex
 */
class ChainVertex : public Vertex
{
	private:
		/*
		 * The path of the NF implementation file of this node
		 */
		std::string source_code_path;

	public:
		ChainVertex(std::string path, std::string name, unsigned short pos, unsigned short weight = 1) :
			Vertex(std::move(name), pos, weight), source_code_path(std::move(path)) {};
		~ChainVertex() {};

		ChainVertex& operator=(ChainVertex& cv) {
			if ( this != &cv ) {
				Vertex::operator=(cv);
				this->source_code_path = cv.get_source_code_path();
			}
			return *this;
		}

		inline std::string get_source_code_path(void) const { return this->source_code_path; };

		inline void print_info(void) {
			log << info << "===============================================" << def << std::endl;
			Vertex::print_info();
			log << info << "=== Source Code: " << this->source_code_path     << def << std::endl;
			log << info << "===============================================" << def << std::endl;
		}
};

/*
 * Class loads the NF chain configuration from a property file and builds the graph of the chain
 */

class ParserConfiguration : public GenericConfiguration
{
	private:
		/*
		 * A Directed Acyclic Graph of chained NFs
		 */
		Graph* nf_chain;

	public:
		/*
		 * Constructor that loads the property file by calling the super class
		 */
		ParserConfiguration(const std::string& config_file);
		~ParserConfiguration();

		/*
		 * Setters & Getters
		 */
		inline Graph* get_graph(void) { return this->nf_chain; };

		/*
		 * Implements load_property_file (abstract methid in the super class)
		 */
		virtual void load_property_file(void);

	private:
		/*
		 * Check the loaded properties for errors
		 */
		short check_topology_correctness(const boost::tokenizer<boost::char_separator<char>>& array,
						 const unsigned short& nfs_no, const std::string& type);
		void check_for_loops(void);
};

#endif

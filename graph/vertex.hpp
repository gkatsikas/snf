//============================================================================
//        Name: vertex.hpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: Defines a graph vertex
//============================================================================

#ifndef _VERTEX_HPP_
#define _VERTEX_HPP_

#include <string>
#include <iostream>

#include <memory>
#include <unordered_map>
#include "../logger/logger.hpp"

enum VertexType {
	/*
	* CASE 1: The vertex composes a graph that represents a NF as a graph of Click elements.
	* The following are Click elements' labels that correspond to the Stage where this element is applied to.
	* None is an initial default value before we classify this element.
	*/
	Input, Processing, Output, None,

	/*
	 * CASE 1: The vertex composes a graph that represents a chain of NFs.
	 * Some of these NFs can be also connected to the outside world
	 * (e.g. a network domain that sends traffic to the chain). We include
	 * these domains in the DAG with NodeType=Domain. NFs have type NF.
	 */
	Domain, NF
};

/*
 * Map Enum categories (integers) to names
 */
const std::string VertexTypeStrings[] = { "Input", "Processing", "Output", "None", "Domain", "NF" };

class Vertex {
	protected:
		/*
		 * A label for this vertex
		 */
		std::string name;

		/*
		 * The distance from the root (or the position in the chain)
		 */
		unsigned short position;

		/*
		 * If this vertex represents a NF --> VertexType becomes NodeType
		 * If this vertex represents an element --> VertexType becomes Stage
		 */
		VertexType type;

		/*
		 * Logger
		 */
		Logger log;

	public:
		Vertex(std::string name, unsigned short pos, VertexType type);
		virtual ~Vertex();

		/*
		 * Copy constructor
		 */
		Vertex(const Vertex& v);

		/*
		 * Overload = for vertex operations
		 */
		Vertex& operator=(Vertex& v);

		/*
		 * Getters
		 */
		inline std::string    get_name    (void) const { return this->name;     };
		inline unsigned short get_position(void) const { return this->position; };
		inline VertexType     get_type    (void) const { return this->type;     };
		inline std::string    get_type_str(void) const { return VertexTypeStrings[this->get_type()]; };

		/*
		 * Print status
		 */
		void print_info(void);
};

/*
 * A map between Interface names and MAC addresses
 */
using InterfaceMap = std::unordered_map<std::string, std::string>;

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

		/*
		 * Stores the interfaces of a NF that connect it to the outside world.
		 */
		InterfaceMap entry_interfaces;

		/*
		 * Stores the interfaces of a NF that connect it to the rest of the chain.
		 */
		InterfaceMap chain_interfaces;

	public:
		ChainVertex(std::string path, std::string name, unsigned short pos, VertexType type) :
					Vertex(std::move(name), pos, type), source_code_path(std::move(path)) {};
		~ChainVertex() {};

		ChainVertex(const ChainVertex& cv) : Vertex(cv) {
			this->source_code_path = cv.source_code_path;
		};

		ChainVertex& operator=(ChainVertex& cv) {
			if ( this != &cv ) {
				Vertex::operator=(cv);
				this->source_code_path = cv.source_code_path;
			}
			return *this;
		}

		/*
		 * Setters & Getters
		 */
		inline unsigned short get_interfaces_no() {
			return ( this->entry_interfaces.size() + this->chain_interfaces.size() );
		}

		inline unsigned short get_entry_interfaces_no() {
			return this->entry_interfaces.size();
		}

		inline unsigned short get_chain_interfaces_no() {
			return this->chain_interfaces.size();
		}

		inline void add_entry_interface_key(std::string iface) {
			if ( this->entry_interfaces.find(iface) == this->entry_interfaces.end() )
				this->entry_interfaces[iface] = "";
			return;
		};

		inline void add_entry_interface_pair(std::string iface, std::string mac) {
			if ( iface.empty() || mac.empty() ) {
				log << error << "Interface or MAC address are empty" << def << std::endl;
				return;
			}
			this->entry_interfaces[iface] = mac;
		};

		inline void add_chain_interface_key(std::string iface) {
			if ( this->chain_interfaces.find(iface) == this->chain_interfaces.end() )
				this->chain_interfaces[iface] = "";
			return;
		};

		inline void add_chain_interface_pair(std::string iface, std::string mac) {
			if ( iface.empty() || mac.empty() ) {
				log << error << "Interface or MAC address are empty" << def << std::endl;
				return;
			}
			this->chain_interfaces[iface] = mac;
		};

		inline std::string get_chain_interface(std::string iface) {
			// If it does not exist
			if ( this->chain_interfaces.find(iface) == this->chain_interfaces.end() )
				return std::string("NULL");
			// Otherwise, return its value
			return this->chain_interfaces[iface];
		}

		inline std::string get_entry_interface(std::string iface) {
			// If it does not exist
			if ( this->entry_interfaces.find(iface) == this->entry_interfaces.end() )
				return std::string("NULL");
			// Otherwise, return its value
			return this->entry_interfaces[iface];
		}

		inline std::string get_source_code_path(void) const { return this->source_code_path; };

		/*
		 * Debugging
		 */
		inline void print_info(void) {
			log << info << "===============================================" << def << std::endl;
			Vertex::print_info();
			log << info << "=== Source Code: " << this->source_code_path     << def << std::endl;
			log << info << "===============================================" << def << std::endl;
		}
};

#endif

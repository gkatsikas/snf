//============================================================================
//        Name: vertex.hpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: Defines a graph vertex
//============================================================================

#ifndef _VERTEX_HPP_
#define _VERTEX_HPP_

//#include <string>
//#include <iostream>

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
using InterfaceMap = std::unordered_map<std::string, std::pair<std::string, std::string>>;

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
		ChainVertex(const ChainVertex& cv);
		ChainVertex& operator=(ChainVertex& cv);

		/*
		 * Setters & Getters
		 */
		unsigned short get_interfaces_no(void);
		unsigned short get_entry_interfaces_no(void);
		unsigned short get_chain_interfaces_no(void);

		bool has_entry_interface(std::string iface);
		bool has_chain_interface(std::string iface);

		void add_entry_interface_key(std::string iface);
		void add_entry_interface_pair(std::string iface, std::string mac, std::string domain);
		void add_chain_interface_key(std::string iface);
		void add_chain_interface_pair(std::string iface, std::string mac, std::string nf);

		std::string get_mac_from_entry_interface(std::string iface);
		std::string get_domain_from_entry_interface(std::string iface);
		std::string get_iface_from_entry_domain(std::string domain);

		std::string get_mac_from_chain_interface(std::string iface);
		std::string get_nf_from_chain_interface(std::string iface);
		std::string get_iface_from_chain_nf(std::string nf);

		std::string get_source_code_path(void) const;

		/*
		 * Debugging
		 */
		void print_info(void);
		void print_chain_interface_map(void);
		void print_entry_interface_map(void);
};

#endif

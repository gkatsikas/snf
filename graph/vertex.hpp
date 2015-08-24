//============================================================================
//        Name: vertex.hpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: Defines a simple graph vertex
//============================================================================

#ifndef _VERTEX_HPP_
#define _VERTEX_HPP_

#include <string>
#include <iostream>
#include "../logger/logger.hpp"

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
		 * A relative weight for this vertex
		 */
		unsigned short weight;

		/*
		 * Logger
		 */
		Logger log;

	public:
		Vertex(std::string name, unsigned short pos, unsigned short weight = 1);
		virtual ~Vertex();

		/*
		 * Overload = for vertex operations
		 */
		Vertex& operator=(Vertex& v);

		/*
		 * Getters
		 */
		inline std::string    get_name(void)     const { return this->name;     };
		inline unsigned short get_position(void) const { return this->position; };
		inline unsigned short get_weight(void)   const { return this->weight;   };

		/*
		 * Print status
		 */
		void print_info(void);
};

#endif

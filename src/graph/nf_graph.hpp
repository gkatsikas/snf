#ifndef _NF_GRAPH_HPP_
#define _NF_GRAPH_HPP_

/*
 * nf_graph.hpp
 * 
 * Extensions of basic Vertex and Graph classes to represent a NF 
 * as a DAG of Click elements.
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

#include <memory>

#include "graph.hpp"
#include "../shared/helpers.hpp"
#include "../click/click_parse_configuration.hpp"

/*
 * The Parser's graph contains Click Elements as vertices
 */
class ElementVertex : public Vertex
{
	protected:
		/*
		 * A shared pointer that maps this vertex with the corresponding Click element
		 */
		std::shared_ptr<Element> click_element;

		/*
		 * If true, we mark the elements that serve as interfaces between the NF Chain
		 * and the NFV domains (outside world). It can only be assigned to elements that
		 * belong to Input or Output VertexType.
		 * If false and the element is an Input/Output, then this element serves as glue
		 * between two consecutive NFs.
		 */
		bool _is_endpoint;

		/*
		 * In case that this is an Output vertex and it is not an endpoint (which means that
		 * there is a successive NF connected to this one), then keep the NF's position in the
		 * chain and the interface that is bound to this one. With this information we can fetch
		 * the next element in the graph when doing DFS.
		 */
		std::pair<unsigned short, std::string> glue;

		/*
		 * This member is valid only for elements that use other elements as information source.
		 * For example an IPRewriter that uses an IPMapper
		 */
		std::unordered_map<short, std::vector<std::string>> implicit_configuration;

	public:
		ElementVertex (Element *element, const std::string &name, const unsigned short &pos);
		~ElementVertex() {};
		ElementVertex& operator=(ElementVertex &ev);

		/*
		 * Setters
		 */
		void set_endpoint              (const bool &ep);
		void set_glue_info             (const unsigned short &next_nf_pos, const std::string &next_nf_iface);
		void set_implicit_configuration(const short &port, const std::vector<std::string> &implicit_conf);

		/*
		 * Getters
		 */
		bool is_endpoint (void) const;

		const std::string              get_class         (void) const;
		const std::string              get_interface     (void) const;
		const std::string              get_configuration (void) const;
		const std::shared_ptr<Element> get_click_element (void) const;
		std::unordered_map<short, std::vector<std::string>>* get_implicit_configuration(void);

		inline std::string    get_glue_iface      (void) const { return this->glue.second; };
		inline unsigned short get_glue_nf_position(void) const { return this->glue.first;  };

		/*
		 * Debugging
		 */
		void print_info (void);
};

class NFGraph : public Graph
{
	protected:
		// Nothing really different from a normal graph

	public:
		NFGraph () {};
		~NFGraph() {};

		/*
		 * Add u into graph along with all its discovered neighbours
		 */
		void add_vertex_and_neighbours(ElementVertex *u);

		/*
		 * Get subset of vertices based on several characteristics.
		 */
		Vector<ElementVertex*> get_vertices_by_stage      (const VertexType &t) const;
		ElementVertex*         get_vertex_by_click_element(const Element    *e) const;
		Vector<ElementVertex*> get_all_endpoint_vertices  (void)                const;
		Vector<ElementVertex*> get_endpoint_vertices      (const VertexType &t) const;
};

#endif

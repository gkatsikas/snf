//============================================================================
//        Name: chain_parser.hpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: Class declaration for parsing Click configurations.
//============================================================================

#ifndef _NF_GRAPH_HPP_
#define _NF_GRAPH_HPP_

#include <memory>

#include "../helpers.hpp"
#include "../graph/graph.hpp"
#include "../click/click_parse_configuration.hpp"

/*
 * Click element labels that correspond to the Stage where this element is applied
 */
enum Stage { Input, Processing, Output };

/*
 * The Parser's graph contains Click Elements as vertices together with some extra information
 */
class ElementVertex : public Vertex
{
	private:
		/*
		 * Label to characterize the stage of this Element (I, P, O)
		 */
		Stage stage;

		/*
		 * A shared pointer that maps this vertex with the corresponding Click element
		 */
		std::shared_ptr<Element> click_element;

	public:
		ElementVertex(Element* element, std::string name, unsigned short pos, unsigned short weight = 1);
		~ElementVertex() {};
		ElementVertex& operator=(ElementVertex& ev);

		inline Stage                    get_stage        (void) const { return this->stage;         };
		inline std::shared_ptr<Element> get_click_element(void) const { return this->click_element; };

		void print_info(void);
};

class NFGraph : public Graph
{
	//private:

	public:
		NFGraph()  {};
		~NFGraph() {};

		void                   add_vertex_and_neighbours(ElementVertex* u);
		Vector<ElementVertex*> get_vertices_by_stage(Stage st);
		ElementVertex*         get_vertex_by_click_element(Element* e);
};

#endif

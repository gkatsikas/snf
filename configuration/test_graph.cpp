#include <iostream>
#include "graph.hpp"

int main()
{
	Graph g;
	Vertex v2  ( std::string("2"), std::string("k"), (unsigned short)1 );
	Vertex v3  ( std::string("3"), std::string("k"), (unsigned short)1 );
	Vertex v5  ( std::string("5"), std::string("k"), (unsigned short)1 );
	Vertex v7  ( std::string("7"), std::string("k"), (unsigned short)1 );
	Vertex v8  ( std::string("8"), std::string("k"), (unsigned short)1 );
	Vertex v9  ( std::string("9"), std::string("k"), (unsigned short)1 );
	Vertex v10 ( std::string("10"), std::string("k"), (unsigned short)1 );
	Vertex v11 ( std::string("11"), std::string("k"), (unsigned short)1 );

	g.add_edge(&v7,  &v11);
	g.add_edge(&v7,  &v8);
	g.add_edge(&v5,  &v11);
	g.add_edge(&v3,  &v8);
	g.add_edge(&v3,  &v10);
	g.add_edge(&v8,  &v9);
	g.add_edge(&v11, &v9);
	g.add_edge(&v9,  &v2);

	/*
	 *    3   7    5
	 *   / \ / \  /
	 * 10   8   11
	 *       \ /
	 *        9
	 *        |
	 *        2
	 */

	g.print_adjacency_list();

	g.print_in_degrees();

	g.print_topological_sort();

	// add cycle
	g.add_edge(&v9, &v3);
	std::cout << "A cycle inserted" << std::endl;
	try {
		std::cout << "Topo sort again... " << std::endl;
		// Cycle must be detected
		g.topological_sort();
		std::cout << "Graph has no cycles --> BUG" << std::endl;
	}
	catch (const std::exception& e) {
		std::cerr << e.what() << std::endl;
	}
}

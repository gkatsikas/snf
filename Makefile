CC = g++
CFLAGS = -O3 -Wall -c -std=c++11 -Wextra -g
LFLAGS = -Wall -std=c++11 -g

#LIBS = -lefence

OBJS  = main.o click_tree.o filter.o operation.o click_element.o \
	output_class.o helpers.o segment_list.o ip_filter_parser.o \
	chameleon.o vertex.o graph.o generic_configuration.o \
	parser_configuration.o chain_parser.o

NFSynthetizer: $(OBJS)
	$(CC) $(LFLAGS) $(OBJS) -o nf_synthetizer $(LIBS)

helpers.o: helpers.cpp helpers.hpp
	$(CC) $(CFLAGS) helpers.cpp

main.o: main.cpp click_tree.cpp click_tree.hpp output_class.hpp operation.hpp element_type.hpp \
	filter.hpp logger.hpp ./configuration/file.hpp
	$(CC) $(CFLAGS) main.cpp

click_tree.o: click_tree.cpp click_tree.hpp output_class.hpp operation.hpp element_type.hpp filter.hpp logger.hpp
	$(CC) $(CFLAGS) click_tree.cpp

filter.o: filter.cpp filter.hpp header_fields.hpp element_type.hpp output_class.hpp operation.hpp
	$(CC) $(CFLAGS) filter.cpp

operation.o: operation.cpp operation.hpp header_fields.hpp
	$(CC) $(CFLAGS) operation.cpp

click_element.o: click_element.cpp click_element.hpp header_fields.hpp operation.hpp\
	filter.hpp element_type.hpp helpers.hpp ip_filter_parser.hpp
	$(CC) $(CFLAGS) click_element.cpp

output_class.o: output_class.cpp output_class.hpp filter.hpp click_element.hpp helpers.hpp
	$(CC) $(CFLAGS) output_class.cpp

segment_list.o: segment_list.cpp segment_list.hpp
	$(CC) $(CFLAGS) segment_list.cpp

ip_filter_parser.o: ip_filter_parser.cpp ip_filter_parser.hpp filter.hpp
	$(CC) $(CFLAGS) ip_filter_parser.cpp

chameleon.o: ./configuration/chameleon.cpp ./configuration/chameleon.hpp
	$(CC) $(CFLAGS) ./configuration/chameleon.cpp

vertex.o: ./configuration/vertex.cpp ./configuration/vertex.hpp ./configuration/file.hpp
	$(CC) $(CFLAGS) ./configuration/vertex.cpp

graph.o: ./configuration/graph.cpp ./configuration/graph.hpp ./configuration/vertex.hpp ./configuration/file.hpp
	$(CC) $(CFLAGS) ./configuration/graph.cpp

generic_configuration.o: ./configuration/generic_configuration.cpp ./configuration/generic_configuration.hpp \
			 ./configuration/chameleon.hpp
	$(CC) $(CFLAGS) ./configuration/generic_configuration.cpp

parser_configuration.o: ./configuration/parser_configuration.cpp ./configuration/parser_configuration.hpp \
			./configuration/generic_configuration.hpp ./configuration/chameleon.hpp \
			./configuration/graph.hpp ./configuration/file.hpp
	$(CC) $(CFLAGS) ./configuration/parser_configuration.cpp

chain_parser.o: ./parser/chain_parser.cpp ./parser/chain_parser.hpp ./configuration/parser_configuration.hpp \
		 click_element.hpp logger.hpp
	$(CC) $(CFLAGS) ./parser/chain_parser.cpp

clean:
	\rm -f *.o *.plist *.gch

clean-dist: clean
	\rm -f nf_synthetizer

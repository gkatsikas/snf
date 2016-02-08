### System
CC     = g++
CFLAGS = -O3 -Wall -c -std=c++1y -pedantic -Wextra -g
LFLAGS = -Wall -std=c++1y -pedantic -g

### The Click library
LIBS = -L/usr/local/lib/ -lclick -ldl -lpthread -lpcap

### Object files of NF Synthesizer
OBJS =  helpers.o chameleon.o vertex.o segment_list.o operation.o \
		generic_configuration.o graph.o filter.o ip_filter_parser.o \
		click_parse_configuration.o nf_graph.o click_element.o \
		output_class.o click_tree.o parser_configuration.o chain_parser.o \
		synthesizer.o synth_nat.o

EXECUTABLE = hyper-nf

CLASS_TEST = class_test

### Object files of Click
### -----> Give a variable with the Click home path instead of a fixed path
CLICK_ELEMENT_OBJS = $(shell find /opt/click/userlevel/ ! -name "click.o" ! -name "exportstub.o" -name "*.o")

### Object files of DPDK
### -----> Give a variable with the DPDK home path instead of a fixed path
DPDK_OBJS = $(shell find /opt/dpdk/x86_64-native-linuxapp-gcc/lib/ -name "*.a")

### Final compilation rule
hyper_nf: $(OBJS) main.o
	$(CC) $(LFLAGS) $(OBJS) main.o  $(CLICK_ELEMENT_OBJS) -o $(EXECUTABLE) $(LIBS)

dpdk: $(OBJS) main.o
	$(CC) $(LFLAGS) $(OBJS) main.o  $(CLICK_ELEMENT_OBJS) $(DPDK_OBJS) -o $(EXECUTABLE) $(LIBS)
	
class_test: $(OBJS) classifier_test.o
	$(CC) $(LFLAGS) $(OBJS) $(CLICK_ELEMENT_OBJS) classifier_test.o -o $(CLASS_TEST) $(LIBS)

### Individual modules' rules
classifier_test.o: ./tests/classifier_test.cpp filter.o helpers.o
	$(CC) $(CFLAGS) ./tests/classifier_test.cpp
	
main.o: main.cpp ./synthesizer/synthesizer.hpp ./logger/logger.hpp
	$(CC) $(CFLAGS) main.cpp

helpers.o: ./shared/helpers.cpp ./shared/helpers.hpp
	$(CC) $(CFLAGS) ./shared/helpers.cpp

chameleon.o: ./configuration/chameleon.cpp ./configuration/chameleon.hpp
	$(CC) $(CFLAGS) ./configuration/chameleon.cpp

vertex.o: ./graph/vertex.cpp ./graph/vertex.hpp
	$(CC) $(CFLAGS) ./graph/vertex.cpp

segment_list.o: ./traffic_class_builder/segment_list.cpp ./traffic_class_builder/segment_list.hpp
	$(CC) $(CFLAGS) ./traffic_class_builder/segment_list.cpp

operation.o: ./traffic_class_builder/operation.cpp ./traffic_class_builder/operation.hpp \
				./traffic_class_builder/header_fields.hpp
	$(CC) $(CFLAGS) ./traffic_class_builder/operation.cpp

generic_configuration.o: ./configuration/generic_configuration.cpp ./configuration/generic_configuration.hpp \
						 ./configuration/chameleon.hpp ./logger/logger.hpp
	$(CC) $(CFLAGS) ./configuration/generic_configuration.cpp

graph.o: ./graph/graph.cpp ./graph/graph.hpp ./graph/vertex.hpp ./logger/logger.hpp
	$(CC) $(CFLAGS) ./graph/graph.cpp

filter.o: ./traffic_class_builder/filter.cpp ./traffic_class_builder/filter.hpp \
			./traffic_class_builder/header_fields.hpp ./traffic_class_builder/element_type.hpp \
			./traffic_class_builder/output_class.hpp ./traffic_class_builder/operation.hpp
	$(CC) $(CFLAGS) ./traffic_class_builder/filter.cpp

ip_filter_parser.o: ./traffic_class_builder/ip_filter_parser.cpp ./traffic_class_builder/ip_filter_parser.hpp \
					./traffic_class_builder/filter.hpp
	$(CC) $(CFLAGS) ./traffic_class_builder/ip_filter_parser.cpp

click_parse_configuration.o: ./click/click_parse_configuration.cpp ./click/click_parse_configuration.hpp \
							 ./logger/logger.hpp ./shared/helpers.hpp
	$(CC) $(CFLAGS) ./click/click_parse_configuration.cpp

nf_graph.o: ./graph/nf_graph.cpp ./graph/nf_graph.hpp ./graph/graph.hpp ./click/click_parse_configuration.hpp \
			./shared/helpers.hpp
	$(CC) $(CFLAGS) ./graph/nf_graph.cpp

click_element.o: ./traffic_class_builder/click_element.cpp ./traffic_class_builder/click_element.hpp \
					./traffic_class_builder/header_fields.hpp ./traffic_class_builder/operation.hpp \
					./traffic_class_builder/filter.hpp ./traffic_class_builder/element_type.hpp \
					./shared/helpers.hpp ./traffic_class_builder/ip_filter_parser.hpp
	$(CC) $(CFLAGS) ./traffic_class_builder/click_element.cpp

output_class.o: ./traffic_class_builder/output_class.cpp ./traffic_class_builder/output_class.hpp \
				./traffic_class_builder/filter.hpp ./traffic_class_builder/click_element.hpp \
				./shared/helpers.hpp
	$(CC) $(CFLAGS) ./traffic_class_builder/output_class.cpp

click_tree.o: ./traffic_class_builder/click_tree.cpp ./traffic_class_builder/click_tree.hpp \
				./traffic_class_builder/output_class.hpp ./traffic_class_builder/operation.hpp \
				./traffic_class_builder/element_type.hpp ./traffic_class_builder/filter.hpp
	$(CC) $(CFLAGS) ./traffic_class_builder/click_tree.cpp

parser_configuration.o: ./configuration/parser_configuration.cpp ./configuration/parser_configuration.hpp \
						./configuration/properties.hpp ./configuration/generic_configuration.hpp \
						./graph/graph.hpp
	$(CC) $(CFLAGS) ./configuration/parser_configuration.cpp

chain_parser.o: ./parser/chain_parser.cpp ./parser/chain_parser.hpp ./configuration/parser_configuration.hpp \
				./graph/nf_graph.hpp
	$(CC) $(CFLAGS) ./parser/chain_parser.cpp

synthesizer.o: ./synthesizer/synthesizer.cpp ./synthesizer/synthesizer.hpp ./parser/chain_parser.hpp \
				./traffic_class_builder/click_tree.cpp ./traffic_class_builder/click_tree.hpp \
				./traffic_class_builder/output_class.hpp ./traffic_class_builder/operation.hpp \
				./traffic_class_builder/element_type.hpp ./traffic_class_builder/filter.hpp \
				./synthesizer/synth_nat.hpp
	$(CC) $(CFLAGS) ./synthesizer/synthesizer.cpp
	
synth_nat.o: ./synthesizer/synth_nat.hpp ./synthesizer/synth_nat.cpp ./traffic_class_builder/filter.hpp
	$(CC) $(CFLAGS) ./synthesizer/synth_nat.cpp
	
### House keeping
clean:
	\rm -f *.o *.plist *.gch *.log *.click *.rss

clean-dist: clean
	\rm -f $(EXECUTABLE) $(CLASS_TEST)

CC = g++
CFLAGS = -Wall -c -std=c++11 -Wextra -g
LFLAGS = -Wall -std=c++11 -g

#LIBS = -lefence

OBJS = click_tree.o filter.o operation.o click_element.o output_class.o helpers.o\
segment_list.o ip_filter_parser.o
	
NFSynthetizer: $(OBJS)
	$(CC) $(LFLAGS) $(OBJS) -o nf_synthetizer $(LIBS)
	
helpers.o: helpers.cpp helpers.hpp
	$(CC) $(CFLAGS) helpers.cpp
	
click_tree.o : click_tree.cpp click_tree.hpp output_class.hpp operation.hpp element_type.hpp filter.hpp
	$(CC) $(CFLAGS) click_tree.cpp
	
filter.o : filter.cpp filter.hpp header_fields.hpp element_type.hpp output_class.hpp operation.hpp
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
	
clean:
	\rm -f *.o *.plist *.gch
	
clean-dist: clean
	\rm -f nf_synthetizer

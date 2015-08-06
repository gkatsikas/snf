CC = g++
CFLAGS = -Wall -c -std=c++11 -Wextra -g
LFLAGS = -Wall -std=c++11 -g

#LIBS = -lefence

OBJS = click_tree.o filter.o operation.o click_element.o output_port.o helpers.o
	
NFSynthetizer: $(OBJS)
	$(CC) $(LFLAGS) $(OBJS) -o nf_synthetizer $(LIBS)
	
helpers.o: helpers.cpp helpers.hpp
	$(CC) $(CFLAGS) helpers.cpp
	
click_tree.o : click_tree.cpp click_tree.hpp output_port.hpp operation.hpp element_type.hpp filter.hpp
	$(CC) $(CFLAGS) click_tree.cpp
	
filter.o : filter.cpp filter.hpp headerFields.hpp element_type.hpp output_port.hpp operation.hpp
	$(CC) $(CFLAGS) filter.cpp
	
operation.o: operation.cpp operation.hpp headerFields.hpp
	$(CC) $(CFLAGS) operation.cpp
	
click_element.o: click_element.cpp click_element.hpp headerFields.hpp operation.hpp\
filter.hpp element_type.hpp helpers.hpp
	$(CC) $(CFLAGS) click_element.cpp
	
output_port.o: output_port.cpp output_port.hpp filter.hpp click_element.hpp helpers.hpp
	$(CC) $(CFLAGS) output_port.cpp
		
clean:
	\rm -f *.o *.plist *.gch
	
clean-dist: clean
	\rm -f nf_synthetizer

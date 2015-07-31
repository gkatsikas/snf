CC = g++
CFLAGS = -Wall -c -std=c++11
LFLAGS = -Wall -std=c++11

#LIBS = 

OBJS = click_tree.o filter.o operation.o

NFSynthetizer: $(OBJS)
	$(CC) $(LFLAGS) $(OBJS) -o nf_synthetizer $(LIBS)

click_tree.o : click_tree.cpp click_tree.hpp output_port.hpp operation.hpp element_type.hpp filter.hpp
	$(CC) $(CFLAGS) click_tree.cpp
	
filter.o : filter.cpp filter.hpp headerFields.hpp element_type.hpp output_port.hpp
	$(CC) $(CFLAGS) filter.cpp

operation.o: operation.cpp operation.hpp headerFields.hpp
	$(CC) $(CFLAGS) operation.cpp
	
clean:
	\rm -f *.o
	
clean-dist: clean
	\rm nf_synthetizer

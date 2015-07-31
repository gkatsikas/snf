CC = g++
CFLAGS = -Wall -c -std=c++11
LFLAGS = -Wall -std=c++11

#LIBS = 

OBJS = click_tree.o filter.o

NFSynthetizer: $(OBJS)
	$(CC) $(LFLAGS) $(OBJS) -o nf_synthetizer $(LIBS)

click_tree.o : click_tree.cpp click_tree.hpp click_element.hpp filter.hpp
	$(CC) $(CFLAGS) click_tree.cpp
	
filter.o : filter.cpp filter.hpp headerFields.hpp click_element.hpp
	$(CC) $(CFLAGS) filter.cpp
	
clean:
	\rm -f *.o
	
clean_dist: clean
	\rm nf_synthetizer

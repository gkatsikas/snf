# 3 libraries comprise this folder
noinst_LIBRARIES = libvertex.a libgraph.a libnfgraph.a

#####################################################################################
# A vertex definition
libvertex_a_SOURCES  = 	vertex.cpp \
						vertex.hpp
#####################################################################################

#####################################################################################
# Generic Graph
libgraph_a_SOURCES  = 	graph.cpp \
						graph.hpp \
						$(top_builddir)/src/logger/logger.hpp
# Linked with
libgraph_a_LIBADD   = 	libvertex.a \
						$(top_builddir)/src/shared/libhelpers.a
#####################################################################################

#####################################################################################
# NF Graph
libnfgraph_a_SOURCES  = nf_graph.cpp \
						nf_graph.hpp

# Linked with
libnfgraph_a_LIBADD   = libgraph.a \
						$(top_builddir)/src/shared/libhelpers.a \
						$(top_builddir)/src/click/libclickparser.a
#####################################################################################
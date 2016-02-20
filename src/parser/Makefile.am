# 1 library comprises this folder
noinst_LIBRARIES = libchainparser.a

#####################################################################################
# Chain Parser (Hyper-DAG)
libchainparser_a_CPPFLAGS = $(AM_CXXFLAGS)
libchainparser_a_SOURCES  = chain_parser.cpp \
							chain_parser.hpp
# Linked with
libchainparser_a_LIBADD   = $(top_builddir)/src/configuration/libconf.a \
							$(top_builddir)/src/graph/libnfgraph.a
#####################################################################################
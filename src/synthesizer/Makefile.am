# 2 libraries comprise this folder
noinst_LIBRARIES = libstateful_synthesizer.a libsynthesizer.a

#####################################################################################
# NAT operations' Synthesis
libstateful_synthesizer_a_SOURCES = stateful_synthesizer.cpp \
									stateful_synthesizer.hpp

# Linked with
libstateful_synthesizer_a_LIBADD  = $(top_builddir)/src/traffic_class_builder/libfilter.a
#####################################################################################

#####################################################################################
# Generic Synthesis
libsynthesizer_a_SOURCES  = synthesizer.cpp \
							synthesizer.hpp \
							stateful_synthesizer.hpp

# Linked with
libsynthesizer_a_LIBADD   = $(top_builddir)/src/graph/libgraph.a \
							$(top_builddir)/src/parser/libchainparser.a \
							$(top_builddir)/src/traffic_class_builder/libfilter.a \
							$(top_builddir)/src/traffic_class_builder/libclickelement.a \
							$(top_builddir)/src/traffic_class_builder/libclicktree.a
#####################################################################################
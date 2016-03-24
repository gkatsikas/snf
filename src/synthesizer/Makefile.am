# 2 libraries comprise this folder
noinst_LIBRARIES = libsynth_nat.a libsynthesizer.a

#####################################################################################
# NAT operations' Synthesis
libsynth_nat_a_SOURCES  = 	synth_nat.cpp \
							synth_nat.hpp

# Linked with
libsynth_nat_a_LIBADD   = 	$(top_builddir)/src/traffic_class_builder/libfilter.a
#####################################################################################

#####################################################################################
# Generic Synthesis
libsynthesizer_a_SOURCES  = synthesizer.cpp \
							synthesizer.hpp \
							synth_nat.hpp

# Linked with
libsynthesizer_a_LIBADD   = $(top_builddir)/src/graph/libgraph.a \
							$(top_builddir)/src/parser/libchainparser.a \
							$(top_builddir)/src/traffic_class_builder/libfilter.a \
							$(top_builddir)/src/traffic_class_builder/libclickelement.a \
							$(top_builddir)/src/traffic_class_builder/libclicktree.a
#####################################################################################
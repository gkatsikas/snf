# 1 library comprises this folder
noinst_LIBRARIES = libgenerator.a

#####################################################################################
# Hyper-NF Code Generation
libgenerator_a_CPPFLAGS = 	$(AM_CXXFLAGS)
libgenerator_a_SOURCES  = 	generator.cpp \
							generator.hpp

# Linked with
libgenerator_a_LIBADD   =	$(top_builddir)/src/parser/libchainparser.a \
							$(top_builddir)/src/synthesizer/libsynthesizer.a
#####################################################################################
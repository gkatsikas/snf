# 3 libraries comprise this folder
noinst_LIBRARIES = libchameleon.a libgenconf.a libconf.a

#####################################################################################
# Basic property file parsing
libchameleon_a_SOURCES  = 	chameleon.cpp \
				chameleon.hpp
#####################################################################################

#####################################################################################
# Generic configuration
libgenconf_a_SOURCES  = generic_config.cpp \
			generic_config.hpp \
			$(top_builddir)/src/logger/logger.hpp

# Linked with
libgenconf_a_LIBADD   = libchameleon.a \
			$(top_builddir)/src/shared/libhelpers.a
#####################################################################################

#####################################################################################
# Parser's configuration
libconf_a_SOURCES  = 	parser_config.cpp \
			parser_config.hpp \
			properties.hpp

# Linked with
libconf_a_LIBADD   = 	libgenconf.a \
			$(top_builddir)/src/graph/libgraph.a
#####################################################################################

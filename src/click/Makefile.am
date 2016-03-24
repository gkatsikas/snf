# 1 library comprises this folder
noinst_LIBRARIES = libclickparser.a

#####################################################################################
# The Click wrapper of Hyper-NF
libclickparser_a_SOURCES  = click_parse_configuration.cpp \
							click_parse_configuration.hpp \
							$(top_builddir)/src/logger/logger.hpp
# Linked with
libclickparser_a_LIBADD   = ../shared/libhelpers.a
#####################################################################################
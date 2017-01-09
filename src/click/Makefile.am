# 1 library comprises this folder
noinst_LIBRARIES = libclickparser.a

#####################################################################################
# The Click wrapper of SNF
libclickparser_a_SOURCES  = click_parser.cpp \
							click_parser.hpp \
							$(top_builddir)/src/logger/logger.hpp
# Linked with
libclickparser_a_LIBADD   = ../shared/libhelpers.a
#####################################################################################
# 7 libraries comprise this folder
noinst_LIBRARIES = 	libseglist.a \
			libop.a \
			libfilter.a \
			libhexfilterparser.a \
			libipfilterparser.a \
			liboutputclass.a \
			libclickelement.a \
			libclicktree.a

#####################################################################################
# Segment list
libseglist_a_SOURCES  = segment_list.cpp \
			segment_list.hpp
#####################################################################################

#####################################################################################
# Packet Header Operation
libop_a_SOURCES  = 	operation.cpp \
			operation.hpp \
			header_fields.hpp
#####################################################################################

#####################################################################################
# Header Fields' Filter
libfilter_a_SOURCES  = 	filter.cpp \
			filter.hpp \
			header_fields.hpp \
			element_type.hpp \
			output_class.hpp

# Linked with
libfilter_a_LIBADD   = 	libop.a
#####################################################################################

#####################################################################################
# Hex Filter Parser
libhexfilterparser_a_SOURCES = 	hex_filter_parser.cpp \
				hex_filter_parser.hpp

# Linked with
libhexfilterparser_a_LIBADD  = 	libfilter.a
#####################################################################################

#####################################################################################
# IP Filter Parser
libipfilterparser_a_SOURCES  = 	ip_filter_parser.cpp \
				ip_filter_parser.hpp

# Linked with
libipfilterparser_a_LIBADD   = 	libfilter.a
#####################################################################################

#####################################################################################
# Output Traffic Class
liboutputclass_a_SOURCES  = 	output_class.cpp \
				output_class.hpp \
				filter.hpp \
				click_element.hpp

# Linked with
liboutputclass_a_LIBADD   = $(top_builddir)/src/shared/libhelpers.a
#####################################################################################

#####################################################################################
# Click Traffic Class Element
libclickelement_a_SOURCES  = 	click_element.cpp \
				click_element.hpp \
				header_fields.hpp \
				element_type.hpp

# Linked with
libclickelement_a_LIBADD   = 	libipfilterparser.a
				$(top_builddir)/src/shared/libhelpers.a

#####################################################################################

#####################################################################################
# Click Traffic Class Tree
libclicktree_a_SOURCES  = 	click_tree.cpp \
				click_tree.hpp \
				element_type.hpp

# Linked with
libclicktree_a_LIBADD   = 	libfilter.a \
				liboutputclass.a
#####################################################################################

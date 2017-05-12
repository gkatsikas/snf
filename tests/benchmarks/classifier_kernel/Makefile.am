# The program to build (the name of the final binary)
bin_PROGRAMS =				classifier_kernel_test

# The test
classifier_kernel_test_SOURCES =	classifier_kernel_test.cpp

# Linked with
classifier_kernel_test_LDADD =		$(top_builddir)/src/traffic_class_builder/libfilter.a \
					$(top_builddir)/src/traffic_class_builder/libseglist.a \
					$(top_builddir)/src/traffic_class_builder/libclickelement.a \
					$(top_builddir)/src/traffic_class_builder/libipfilterparser.a \
					$(top_builddir)/src/traffic_class_builder/libhexfilterparser.a \
					$(top_builddir)/src/traffic_class_builder/liboutputclass.a \
					$(top_builddir)/src/traffic_class_builder/libop.a \
					$(top_builddir)/src/graph/libnfgraph.a \
					$(top_builddir)/src/graph/libgraph.a \
					$(top_builddir)/src/graph/libvertex.a \
					$(top_builddir)/src/shared/libhelpers.a

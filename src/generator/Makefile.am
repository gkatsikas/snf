# 1 library comprises this folder
noinst_LIBRARIES = 	libgenerator.a

#####################################################################################
# Abstract SNF Code Generator
libgenerator_a_SOURCES      = 	generator.cpp \
								generator.hpp \
								soft_generator.cpp \
								soft_generator.hpp \
								rss_generator.cpp \
								rss_generator.hpp \
								openflow_generator.cpp \
								openflow_generator.hpp \
								flow_director_generator.cpp \
								flow_director_generator.hpp

# Linked with
libgenerator_a_LIBADD       =	$(top_builddir)/src/synthesizer/libsynthesizer.a
#####################################################################################

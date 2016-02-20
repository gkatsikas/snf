SUBDIRS = 	\
			shared \
			click \
			graph \
			configuration \
			parser \
			traffic_class_builder \
			synthesizer

# The program to build (the name of the final binary)
bin_PROGRAMS = hypernf

# The main file of Hyper-NF
hypernf_SOURCES = 	hyper-nf.cpp \
					logger/logger.hpp

# Linked with
hypernf_LDADD =  	graph/libgraph.a \
					configuration/libconf.a \
					parser/libchainparser.a \
					synthesizer/libsynthesizer.a

if DPDK
hypernf_LDFLAGS = 	$(shell find @FULL_DPDK_PATH@/lib/ -name "*.a")
else
hypernf_LDFLAGS = 
endif

# And object files from Hyper-NF subdirectories, Click, and (optionally) DPDK
hypernf_LDFLAGS += 	$(shell find . ! -name "hyper-nf.o" -name "*.o") \
					$(shell find @CLICK_PATH@/userlevel/ ! -name "click.o" ! -name "exportstub.o" -name "*.o")
SUBDIRS = 	\
			shared \
			click \
			graph \
			configuration \
			parser \
			traffic_class_builder \
			synthesizer \
			generator

# The program to build (the name of the final binary)
bin_PROGRAMS = snf

# The main file of SNF
snf_SOURCES = 	snf.cpp \
					logger/logger.hpp

# Linked with
snf_LDADD =  	graph/libgraph.a \
					configuration/libconf.a \
					parser/libchainparser.a \
					synthesizer/libsynthesizer.a \
					generator/libgenerator.a

if DPDK
snf_LDFLAGS = 	@DOLLAR_SIGN@(shell find @FULL_DPDK_PATH@/lib/ -name "*.a")
else
snf_LDFLAGS = 
endif

# And object files from SNF subdirectories, Click, and (optionally) DPDK
snf_LDFLAGS += 	@DOLLAR_SIGN@(shell find . ! -name "snf.o" -name "*.o") \
					@DOLLAR_SIGN@(shell find @CLICK_PATH@/userlevel/ ! -name "click.o" ! -name "exportstub.o" -name "*.o")
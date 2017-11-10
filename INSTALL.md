SNF INSTALLATION INSTRUCTIONS
===============================

Basic Installation
==================

    To compile any version of SNF, you will need the GNU C compiler;
a recent version of the GNU C++ compiler with C++11; and GNU Make. The
'./configure' script should complain if it cannot find the software it
needs.

CONFIGURE
-----------

Change to the SNF source directory and run:
	./bootstrap
This will initialize the required autotools to support the build process.

To build SNF with basic Click support run:
	./configure --with-click=<path-to-your-click-folder>
Example:
	./configure --with-click=~/nfv/click/

To build SNF with Click-DPDK support run:
	./configure \
			RTE_SDK=<path-to-your-dpdk-folder> \
			RTE_TARGET=<your-dpdk-target> \
			--with-click=<path-to-your-click-folder> \
			--enable-dpdk=yes

Example for Standard Click (with more verbosity but no debug messages):
	./configure \
			--with-click=~/nfv/click \
			--enable-dpdk=no --enable-debug=no --enable-verbose=yes

Example for Click-DPDK (with more verbosity but no debug messages):
	./configure \
			RTE_SDK=~/nfv/dpdk \
			RTE_TARGET=x86_64-native-linuxapp-gcc \
			--with-click=~/nfv/click \
			--enable-dpdk=yes --enable-debug=no --enable-verbose=yes

INSTALL
---------
After `configure` stay at the SNF source directory and run:
	./install <your preferred destination for the SNF binaries, libraries, headers>
	If no argument is given, the local bin directory will be used.

RUN
---------
One can execute the following synthesis examples:
	./run bin/usr/local/bin/snf input/tests/tests.prop

UN-INSTALL
---------
To un-install SNF change to the SNF source directory and run:
	./uninstall <your existing folder that contains the SNF binaries, libraries, headers>
	If no argument is given, the local bin directory will be used.

CLEAN
---------
To clean the repository change to the SNF source directory and run:
	./clean

REPORT
---------
Please report bugs, issues, comments, suggestions for improvements at: katsikas at kth dot se

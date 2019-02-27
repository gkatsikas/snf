SNF INSTALLATION INSTRUCTIONS
===============================

To compile any version of SNF, you will need the GNU C compiler, a recent version of the GNU C++ compiler with C++11, and GNU Make.
The 'configure' script will complain if it cannot find the required software.

CONFIGURE
-----------

Change to SNF's root directory and run:

	./bootstrap

This will initialize the required autotools for the build process.

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
			RTE_SDK=/home/user/nfv/dpdk \
			RTE_TARGET=x86_64-native-linuxapp-gcc \
			--with-click=/home/user/nfv/click \
			--enable-dpdk=yes --enable-debug=no --enable-verbose=yes

INSTALL
---------
After `configure` stay at SNF's root directory and run:

	./install <your preferred destination for the SNF binaries, libraries, headers>

If no argument is given, the local bin directory will be used.

RUN
---------
One can execute the following synthesis examples:

	./run bin/usr/local/bin/snf input/tests/tests.prop

UNINSTALL
---------
To uninstall SNF, run:

	./uninstall <your existing folder that contains the SNF binaries, libraries, headers>

If no argument is given, the local bin directory will be used.

CLEAN
---------
To clean the repository, run:

	./clean

REPORT
---------
Please report bugs, issues, comments, and suggestions for improvements at: katsikas at kth dot se

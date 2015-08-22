Network Functions'(NFs) Chain Synthesis
======

A framework to turn a chain of Click-based network functions (NFs) into a sythesized NF.

## Requirements
  * C++11 (e.g. apt-get install build-essential)
  * apt-get install libboost-all-dev (or libboost-dev)

## Profile
  * apt-get install valgrind

## Steps
#### Click
  * cd /opt/
  * git clone https://github.com/kohler/click.git
  * cd ./click
  * ./configure --enable-user-multithread --enable-multithread --enable-ip6 --enable-nanotimestamp
		--enable-intel-cpu --enable-analysis --enable-ipsec --enable-local --enable-simple
		--enable-all-elements #(This is an indicative list of parameters)
  * make elemlist
  * make install (uses default prefix=/usr/local/)

#### NF Synthesis  
  * cd /opt/
  * git clone git@bitbucket.org:nslab/nf-synthesis.git
  * cd ./nf-synthesis
  * make
    * It uses the click libraries built under /usr/local/lib/ (-lclick) and the object files
      of the Click elements generated under /opt/click/<driver> (userlevel, linuxmodule, etc.)
    * NF Synthesizer currently supports only the userlevel driver.
    * You have to modify the Makefile accordingly if you do not follow the steps above.

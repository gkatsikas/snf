#!/bin/bash

##============================================================================
##        Name: bootstrap.sh
##      Author: Georgios Katsikas (katsikas@kth.se)
## Description: Bootstraps SNF's autotools (Execute before ./configure)
##============================================================================

if [[ -z $SNF_HOME ]]; then
	printf "Need to set env. variable SNF_HOME\n"
	exit 1
fi

# Use the common library to access useful functions
source $SNF_HOME/scripts/commons.sh

# Need to reconfigure
file_exists "config.h.in" && : || (autoreconf -i)

libtoolize
aclocal
autoconf
automake -a -c

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

cd $SNF_HOME

# Need to reconfigure
conf_file=$SNF_HOME/"config.h.in"
file_exists $conf_file && : || (autoreconf -i)

libtoolize
aclocal
autoconf
automake -a -c

cd - > /dev/null

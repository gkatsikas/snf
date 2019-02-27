#!/bin/bash

##============================================================================
##        Name: remove.sh
##      Author: Georgios Katsikas (katsikas@kth.se)
## Description: Removes installation leftovers from the SNF repository.
##============================================================================

cd $SNF_HOME

find . -name Makefile -exec rm {} \;
find . -name "Makefile.in" -exec rm {} \;
find . -name "*.in" -exec rm {} \;
find . -name "*.in~" -exec rm {} \;
find . -name "*.log" -exec rm {} \;

rm -f configure libtool config.status

cd - > /dev/null

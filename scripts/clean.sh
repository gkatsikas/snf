#!/bin/bash

##============================================================================
##        Name: clean
##      Author: Georgios Katsikas (katsikas@kth.se)
## Description: Cleans SNF repository
##============================================================================

make clean

find . -name Makefile -exec rm {} \;
find . -name "Makefile.in" -exec rm {} \;
find . -name "*.in" -exec rm {} \;
find . -name "*.in~" -exec rm {} \;
find . -name "*.log" -exec rm {} \;

rm -f configure libtool

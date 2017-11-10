#!/bin/bash

##============================================================================
##        Name: clean.sh
##      Author: Georgios Katsikas (katsikas@kth.se)
## Description: Cleans the SNF repository.
##============================================================================

cd $SNF_HOME

make clean

cd - > /dev/null

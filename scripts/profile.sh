#!/bin/bash

##============================================================================
##        Name: profile.sh
##      Author: Georgios Katsikas (katsikas@kth.se)
## Description: Starts GNU Debugger to profile the SNF
##       Usage: In conjunction with valgrind.sh
##============================================================================

if [[ -z $SNF_HOME ]]; then
	printf "Need to set env. variable SNF_HOME\n"
	exit 1
fi

source $SNF_HOME/scripts/commons.sh

program=$0
# Argument 1: Path to the SNF executable
executable=$1

usage()
{
	printf "Usage: %s <executable>\n" $program
	exit $ERROR
}

main()
{
	# Check whether the SNF executable exists or not
	file_exists $executable && : || usage
	executable=$(get_abs_path $executable)

	### 1. Valgrind
	# Start ./valgrind.sh <executable> <input_property_file> in another shell

	### 2. Invoke program through GDB
	cd $SNF_HOME

	printf "Press q + Enter after gdb is launched\n"
	gdb --args $executable target remote | vgdb

	cd -

	### 3. Press q (quit) + Enter
}

# Check input arguments
[[ ($# != 1) ]] && usage || main

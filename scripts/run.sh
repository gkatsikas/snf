#!/bin/bash

##============================================================================
##        Name: run.sh
##   Copyright: KTH ICT CoS Network Systems Lab
## Description: Starts Hyper-NF with or without the GNU Debugger.
##============================================================================

ERROR=1
SUCCESS=0

program=$0

function usage {
	printf "Usage: %s <executable> <input_property_file> [OPTIONAL -d]\n"
	exit $ERROR
}

function file_exists {
	input_file=$1

	if [[ ! -e $input_file ]]; then
		printf "%s does not exist\n" "$input_file"
		usage
	fi

	if [[ ! -f $input_file ]]; then
		printf "%s is not a regular file\n" "$input_file"
		usage
	fi
}

# We accept the paths to the executable and input property file
# and optionally a debug flag
if [[ ($# != 2) && ($# != 3) ]]; then
	usage
fi

# The Hyper-NF executable
executable=$1
file_exists $executable

# Check if property file exists
input_property_file=$2
file_exists $input_property_file

# Both property file and debug option are given
if [[ $# == 3 ]]; then
	debug_mode=1
fi

### Execution through GDB (Press r (run) and then q (quit))
if [[ ! -z $debug_mode ]]; then
	gdb --args $executable -p $input_property_file -v
### Normal execution
else
	$executable -p $input_property_file -v
fi

exit $SUCCESS

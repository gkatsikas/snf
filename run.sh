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
	printf "Usage: %s <input_property_file> [OPTIONAL -d]\n" "$program"
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

# The Hyper-NF executable
executable=./hyper-nf
file_exists $executable

# We accept the path to the input property file and
# optionally a debug flag
if [[ ($# != 1) && ($# != 2) ]]; then
	usage
fi

# Check if property file exists
input_property_file=$1
file_exists $input_property_file

# Both property file and debug option are given
if [[ $# == 2 ]]; then
	debug_mode=1
fi

### Execution through GDB (Press r (run) and then q (quit))
if [[ ! -z $debug_mode ]]; then
	gdb --args $executable -p $input_property_file
### Normal execution
else
	$executable -p $input_property_file
fi

exit $SUCCESS
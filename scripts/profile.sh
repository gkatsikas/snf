#!/bin/bash
##============================================================================
##        Name: profile.sh
##   Copyright: KTH ICT CoS Network Systems Lab
## Description: Starts GNU Debugger to profile the SNF
##       Usage: In conjunction with valgrind.sh
##============================================================================

ERROR=1
SUCCESS=0

program=$0

function usage {
	printf "Usage: %s <input_property_file>\n" "$program"
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

# We only accept the path to the input property file
if [[ $# != 1 ]]; then
	usage
fi

# The SNF executable
executable=$1
file_exists $executable

### 1. Valgrind
# Start ./valgrind.sh <input_property_file> in another shell

### 2. Invoke program through GDB
gdb --args $executable target remote | vgdb

### 3. Press q (quit) + Enter

#!/bin/bash

##============================================================================
##        Name: valgrind.sh
##   Copyright: KTH ICT CoS Network Systems Lab
## Description: Starts valgring to profile the NF Synthesizer
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

# The Hyper-NF executable
executable=./hyper-nf
file_exists $executable

# We only accept the path to the input property file
if [[ $# != 1 ]]; then
	usage
fi

# Check if property file exists
input_property_file=$1
file_exists $input_property_file

### Blocks here..
### --log-file=nf_valgrind.log 
valgrind --leak-check=full --show-leak-kinds=all \
	--tool=memcheck --vgdb=yes --vgdb-error=0 -v \
	$executable -p $input_property_file

exit $SUCCESS
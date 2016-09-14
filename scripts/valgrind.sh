#!/bin/bash

##============================================================================
##        Name: valgrind.sh
##   Copyright: KTH ICT CoS Network Systems Lab
## Description: Starts valgring to profile the SNF
##============================================================================

ERROR=1
SUCCESS=0

program=$0

function usage {
	printf "Usage: %s <executable> <input_property_file>\n" "$program"
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

# We only accept the paths to the executable and input property file
if [[ $# != 2 ]]; then
	usage
fi

# The SNF executable
executable=$1
file_exists $executable

# Check if property file exists
input_property_file=$2
file_exists $input_property_file

### Blocks here..
### --log-file=nf_valgrind.log
valgrind --leak-check=full --show-leak-kinds=all \
	--tool=memcheck --vgdb=yes --vgdb-error=0 -v \
	$executable -p $input_property_file

exit $SUCCESS

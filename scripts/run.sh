#!/bin/bash

##============================================================================
##        Name: run
##      Author: Georgios Katsikas (katsikas@kth.se)
## Description: Starts SNF with or without the GNU Debugger.
##============================================================================

ERROR=1
SUCCESS=0

program=$0
# Argument 1: Path to the SNF executable
executable=$1
# Argument 2: Input property file
input_property_file=$2
# Argument 3: Debug flag for gdb [Optional]
debug_mode=$3

usage()
{
	printf "Usage: %s <executable> <input_property_file> [OPTIONAL -d]\n" $program
	exit $ERROR
}

file_exists()
{
	input_file=$1

	if [[ ! -e $input_file ]]; then
		printf "%s does not exist\n" $input_file
		usage
	fi

	if [[ ! -f $input_file ]]; then
		printf "%s is not a regular file\n" $input_file
		usage
	fi
}

main()
{
	# Check if the SNF executable exists
	file_exists $executable
	printf "SNF Executable: %s\n" $executable

	# Check if the input property file exists
	file_exists $input_property_file
	printf "SNF      Input: %s\n" $input_property_file

	# Debug option is given
	[[ $debug_mode == "-d" ]] && debug_mode="true" || debug_mode="false"
	printf "    Debug Mode: %s\n" $debug_mode

	### Execution through GDB (Press r (run) and then q (quit))
	if [[ $debug_mode == "true" ]]; then
		printf "Execution through GDB: Press r to run and then q to quit\n"
		gdb --args $executable -p $input_property_file -v
	### Normal execution
	else
		$executable -p $input_property_file -v
	fi

	exit $SUCCESS
}

# Check input arguments
[[ ($# != 2) && ($# != 3) ]] && usage || main

#!/bin/bash

##============================================================================
##        Name: run.sh
##      Author: Georgios Katsikas (katsikas@kth.se)
## Description: Runs SNF with or without the GNU Debugger.
##============================================================================

if [[ -z $SNF_HOME ]]; then
	printf "Need to set env. variable SNF_HOME\n"
	exit 1
fi

source $SNF_HOME/scripts/commons.sh

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

main()
{
	# Check if the SNF executable exists
	file_exists $executable && : || usage
	executable=$(get_abs_path $executable)
	printf "SNF Executable: %s\n" $executable

	# Check if the input property file exists
	file_exists $input_property_file && : || usage
	input_property_file=$(get_abs_path $input_property_file)
	printf "SNF      Input: %s\n" $input_property_file

	# Debug option is given
	[[ $debug_mode == "-d" ]] && debug_mode="true" || debug_mode="false"
	printf "    Debug Mode: %s\n" $debug_mode

	cd $SNF_HOME

	### Execution through GDB (Press r (run) and then q (quit))
	if [[ $debug_mode == "true" ]]; then
		printf "Execution through GDB: Press r to run and then q to quit\n"
		gdb --args $executable -p $input_property_file -v
	### Normal execution
	else
		$executable -p $input_property_file -v
	fi

	cd - > /dev/null

	exit $SUCCESS
}

# Check input arguments
[[ ($# != 2) && ($# != 3) ]] && usage || main

#!/bin/bash

##============================================================================
##        Name: valgrind.sh
##      Author: Georgios Katsikas (katsikas@kth.se)
## Description: Starts valgring to profile SNF.
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

usage()
{
	printf "Usage: %s <executable> <input_property_file>\n" $program
	exit $ERROR
}

main()
{
	# The SNF executable
	file_exists $executable && : || usage
	executable=$(get_abs_path $executable)
	echo $executable

	# Check if property file exists
	file_exists $input_property_file && : || usage
	input_property_file=$(get_abs_path $input_property_file)
	echo $input_property_file

	cd $SNF_HOME

	### Blocks here..
	### Redirect output to logger: --log-file=nf_valgrind.log
	valgrind 	--leak-check=full --show-leak-kinds=all \
			--tool=memcheck --vgdb=yes --vgdb-error=0 -v \
			$executable -p $input_property_file

	cd -
}

# Check input arguments
[[ ($# != 2) ]] && usage || main

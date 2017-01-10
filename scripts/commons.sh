#!/bin/bash

##============================================================================
##        Name: commons.sh
##      Author: Georgios Katsikas (katsikas@kth.se)
## Description: Common functions and variables shared among all SNF scripts
##============================================================================

ERROR=1
SUCCESS=0

path_exists()
{
	input_path=$1

	result="$(readlink -e $input_path)"
	[[ -z $result ]] && return $ERROR || return $SUCCESS
}

file_exists()
{
	input_file=$1
	[[ (! -e $input_file) || (! -f $input_file) ]] && return $ERROR || return $SUCCESS
}

get_abs_path()
{
	echo $(realpath $1)
}

check_env()
{
	if [[ -z $SNF_HOME ]]; then
		printf "Need to set SNF_HOME\n"
		exit $ERROR
	fi
	return $SUCCESS
}

#check_env

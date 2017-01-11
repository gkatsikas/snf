#!/bin/bash

##============================================================================
##        Name: install.sh
##      Author: Georgios Katsikas (katsikas@kth.se)
## Description: Installs SNF at a designated (or default) path
##============================================================================

if [[ -z $SNF_HOME ]]; then
	printf "Need to set env. variable SNF_HOME\n"
	exit 1
fi

source $SNF_HOME/scripts/commons.sh

program=$0
build_path=$1

usage()
{
	printf "Usage: %s <path-to-install-snf> [Defaull path is bin/]\n" $program
	exit $ERROR
}

main()
{
	# If no argument is given, use default
	[[ -z $build_path ]] && build_path="$SNF_HOME/bin" || :

	# Check if the path exists
	path_exists $build_path  && : || usage
	build_path=$(get_abs_path $build_path)
	printf "SNF binaries at: %s\n" $build_path

	# Install
	cd $SNF_HOME
	DESTDIR="$build_path" make install -j 16
	cd - > /dev/null
}

[ "$#" -gt 1 ] && usage || main

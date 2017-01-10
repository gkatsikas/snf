#!/bin/bash

##============================================================================
##        Name: uninstall.sh
##      Author: Georgios Katsikas (katsikas@kth.se)
## Description: Uninstalls SNF from a designated (or default) path
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

	# Uninstall
	cd $SNF_HOME
	DESTDIR="$build_path" make uninstall
	cd - > /dev/null

	# Also, remove parent folder
	rm -rf $build_path/usr
}

[ "$#" -gt 1 ] && usage || main

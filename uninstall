#!/bin/bash

##============================================================================
##        Name: uninstall
##      Author: Georgios Katsikas (katsikas@kth.se)
## Description: Uninstalls SNF from a designated (or default) path
##============================================================================

program=$0
build_path=$1

usage()
{
	printf "Usage: %s <path-to-install-snf> [Defaull path is bin/]\n" $program
	exit 1
}

main()
{
	# If no argument is given, use default
	[[ -z $build_path ]] && build_path="$(pwd)/bin" || :
	DESTDIR="$build_path" make uninstall

	# Remove parent folder
	rm -rf $build_path/usr
}

[ "$#" -gt 1 ] && usage || main

#!/bin/bash

##============================================================================
##        Name: install
##      Author: Georgios Katsikas (katsikas@kth.se)
## Description: Installs SNF at a designated (or default) path
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
	printf "SNF binaries at: %s\n" $build_path
	DESTDIR="$build_path" make install -j 16
}

[ "$#" -gt 1 ] && usage || main

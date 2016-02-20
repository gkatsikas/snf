#!/bin/bash

if [[ ! -f "config.h.in" ]]; then
	autoreconf -i
fi

libtoolize
aclocal
autoconf
automake -a -c

#autoreconf -i

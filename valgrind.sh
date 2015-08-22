#!/bin/bash

### Log in a file
#valgrind --log-file=nf_valgrind.log ...

### Log in stdout
valgrind --leak-check=full --show-leak-kinds=all --tool=memcheck --vgdb=yes --vgdb-error=0 -v ./nf_synthesizer -p configuration/property_file

#!/bin/bash

### Log in a file
#valgrind --log-file=nf_valgrind.log --leak-check=yes --tool=memcheck --vgdb=yes --vgdb-error=0 -v ./nf_synthetizer -p configuration/property_file

### Log in stdout
valgrind --leak-check=yes --tool=memcheck --vgdb=yes --vgdb-error=0 -v ./nf_synthetizer -p configuration/property_file

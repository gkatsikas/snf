#!/bin/bash
##============================================================================
##        Name: valgrind.sh
##   Copyright: KTH ICT CoS Network Systems Lab
## Description: Starts valgring to profile the NF Synthesizer
##============================================================================

### Log in a file
#valgrind --log-file=nf_valgrind.log ...

### Log in stdout
valgrind --leak-check=full --show-leak-kinds=all --tool=memcheck --vgdb=yes --vgdb-error=0 -v ./nf_synthesizer -p configuration/property_file

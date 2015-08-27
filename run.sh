#!/bin/bash
##============================================================================
##        Name: run.sh
##   Copyright: KTH ICT CoS Network Systems Lab
## Description: Starts GNU Debugger to debug the NF Synthesizer
##============================================================================

#### Normal execution
./nf_synthesizer -p configuration/property_file

### Execution through GDB (Press r (run) and then q (quit))
#gdb --args nf_synthesizer -p configuration/property_file

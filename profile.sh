#!/bin/bash
##============================================================================
##        Name: profile.sh
##   Copyright: KTH ICT CoS Network Systems Lab
## Description: Starts GNU Debugger to profile the NF Synthesizer
##       Usage: In conjunction with valgrind.sh
##============================================================================

### 1. Valgrind
# Start ./valgrind.sh in another shell

### 2. Invoke program through GDB
gdb --args nf_synthesizer target remote | vgdb

### 3. Press q (quit) + Enter

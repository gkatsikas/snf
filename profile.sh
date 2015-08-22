#!/bin/bash

### 1. Valgrind
# Start ./valgrind.sh in another shell

### 2. Invoke program through GDB
gdb --args nf_synthesizer target remote | vgdb

### 3. Press q (quit)

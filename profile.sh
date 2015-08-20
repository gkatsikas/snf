#!/bin/bash

### Valgrind
# Start ./valgrind.sh in another shell

### GDB
gdb --args nf_synthetizer target remote | vgdb

### Press q (quit)

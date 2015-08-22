#!/bin/bash

#### Normal execution
#./nf_synthetizer -p configuration/property_file

### Execution through GDB (Press r (run) and then q (quit))
gdb --args nf_synthesizer -p configuration/property_file

#!/bin/bash

# Capture command-line arguments
arg1="$1"
arg2="$2"

# Call MATLAB with the arguments
module load matlab
matlab -nodesktop -nosplash -r "myscript('$arg1', '$arg2'); exit;"
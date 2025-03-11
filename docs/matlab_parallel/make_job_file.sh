#!/bin/bash

arg1=$1
arg2=$2

OutFolder="outfiles"

if [ ! -d $OutFolder ]; then
    mkdir -p $OutFolder
fi

echo \#\!/bin/bash
echo 
echo \#Submit this script with: sbatch thefilename
echo
echo \#SBATCH -t 24:00:00   # walltime
echo \#SBATCH -N 1    # number of nodes in this job
echo \#SBATCH -n 32   # total number of processor cores in this job
echo \#SBATCH --job-name=Main-arg1$arg1-arg2$arg2
echo \#SBATCH --output=$OutFolder/arg1$arg1-arg2$arg2.out
echo \#SBATCH --mail-user=XXXX@XX.XXX # email address
echo \#SBATCH --mail-type=BEGIN
echo \#SBATCH --mail-type=END
echo \#SBATCH --mail-type=FAIL

echo 
echo \# LOAD MODULES, INSERT CODE, AND RUN YOUR PROGRAMS HERE
echo module purge
echo module load matlab
echo matlab -nodisplay -nodesktop -nosplash -r \"myscript\(\'$arg1\',\'$arg2\'\)\"
echo

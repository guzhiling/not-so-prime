#!/bin/bash

arg1=$1
arg2=$2


CodeFolder="."
OutFolder="outfiles"

if [ ! -d $OutFolder ]; then
    mkdir -p $OutFolder
fi

echo \#\!/bin/bash
echo 
echo \#Submit this script with: sbatch thefilename
echo
echo \#SBATCH --mem-per-cpu=8G # memory per cpu-core (4G is default)
echo \#SBATCH --time=24:00:00          # total run time limit (HH:MM:SS)
echo \#SBATCH --nodes=1                # node count
echo \#SBATCH --ntasks=1               # total number of tasks across all nodes
echo \#SBATCH --cpus-per-task=16       # cpu-cores per task (>1 if multi-threaded tasks)
echo \#SBATCH --job-name=arg1$arg1-arg2$arg2 
echo \#SBATCH --output=$OutFolder/arg1$arg1-arg2$arg2.out
echo \#SBATCH --mail-user=XXXXX@gmail.com  # email address
echo \#SBATCH --mail-type=BEGIN
echo \#SBATCH --mail-type=END
echo \#SBATCH --mail-type=FAIL

echo 
echo \# LOAD MODULES, INSERT CODE, AND RUN YOUR PROGRAMS HERE
echo 
echo module load r
echo srun Rscript $CodeFolder/main.R $arg1 $arg2
echo


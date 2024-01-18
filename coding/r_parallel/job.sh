#!/bin/bash

# Submit this script with: sbatch thefilename

#SBATCH --mem-per-cpu=8G
#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --job-name=jobname
#SBATCH --mail-user=XXXX@gmail.com
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --error=job.%J.err # tell it to store the error messages to a file
#SBATCH --output=job.%J.out # tell it to store the console text output to a file

# LOAD MODULES, INSERT CODE, AND RUN YOUR PROGRAMS HERE

module load r
srun Rscript ./main.R $arg1 $arg2



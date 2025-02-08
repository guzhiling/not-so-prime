#!/bin/bash
#SBATCH --job-name=med_rest
#SBATCH --partition=scavenge,day
#SBATCH --requeue
#SBATCH --time=6:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=10G
#SBATCH --mail-type=ALL
#SBATCH --array=1-1980%50  # 1980 = 36 * 55, with 50 jobs simultaneously
module load R/4.3.0-foss-2020b
# Total ranges
arg1_max=36
arg2_max=55
# Calculate i and m based on SLURM_ARRAY_TASK_ID
task_id=$SLURM_ARRAY_TASK_ID
i=$(( (task_id - 1) / arg1_max + 1 ))
m=$(( (task_id - 1) % arg2_max + 1 ))
echo “Running R script with i=$i and m=$m”
Rscript main.R $i $m
# Reference: https://docs.ycrc.yale.edu/clusters-at-yale/job-scheduling/dsq/


# STEP 1: create a list of sbatch scripts and save it in job_list.txt

#!/bin/bash

# Define output job list file
job_list="job_list.txt"

# Clear existing file
> "$job_list"

# Generate job list
family="binomial"
for arg1 in {1..3}; do 
        for iter in {1..100}; do
            echo "module load R/4.4.1-foss-2022b; Rscript main.R $arg1 $iter" >> "$job_list"
        done
done
echo "Job list file '$job_list' created successfully."


# STEP 2: RUN this to create sbatch file
dsq --job-file job_list.txt --mem-per-cpu 32g -t 06:00:00 --mail-type ALL


# STEP 3: submit joblist
# sbatch dsq-joblist-yyyy-mm-dd.sh
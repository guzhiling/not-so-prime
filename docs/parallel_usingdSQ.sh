# Reference: https://docs.ycrc.yale.edu/clusters-at-yale/job-scheduling/dsq/
#!/bin/bash


# STEP 1: create a list of sbatch scripts and save it in job_list.txt
module load dSQ 

# Define output job list file
job_list="job_list.txt"

# Clear existing file
> "$job_list"

# Generate job list
for iter in {0..1193}; do
    echo "module load miniconda; conda activate py3_env; python main.py --iter $iter"  >> $job_list
    # OR
    # echo "module load R/4.4.1-foss-2022b; Rscript main.R $arg1 $iter" >> "$job_list"
done
echo "Job list file '$job_list' created successfully."


# STEP 2: RUN this to create sbatch file
dsq --job-file job_list.txt --mem-per-cpu 32g -t 02:00:00 --mail-type ALL --status-dir dir_status  --output dir_output/dsq-joblist-%A_%3a-%N.out


# STEP 3: submit joblist
# sbatch dsq-joblist-yyyy-mm-dd.sh

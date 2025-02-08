# How to use shell command to submit r jobs



## Single job submission
1. Use `main.R` to define a main function that takes in different setting arguments, and perform simulation/computation
2. Use `job.sh` to set up the arguments that you want to pass to the function
3. On shell terminal, type `sbatch job.sh` to submit the file


## Multiple jobs submission
### Method 1: using [dSQ](https://docs.ycrc.yale.edu/clusters-at-yale/job-scheduling/dsq/), see [parallel_usingdSQ.sh](parallel_usingdSQ.sh)

### Method 2: using job array, see [parallel_usingarray.sh](parallel_usingarray.sh)

### Method 3
1. Use `main.R` to define a main function that takes in different setting arguments, and perform simulation/computation
2. Edit `make_all_job_file.sh` to set up all combinations of setting you need
3. Edit `make_job_file` to set up the email address, and the number of nodes you need
4. Edit `submit_all_job_file.sh` to set up the settings you want to compute
5. On shell terminal, type `bash make_all_job_file.sh` to make all the job files
6. On shell terminal, type `bash submit_all_job_file.sh` to submit all the jobs

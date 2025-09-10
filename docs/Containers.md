Containers are helpful in streamlining the environment for coding, espcially python environment. 

Yale resource for [Apptainer (previousely singularity)](https://docs.ycrc.yale.edu/clusters-at-yale/guides/containers/) to execute codes under environments of apptainer or docker. 

## 1. Install apptainer and check version
```apptainer --version```

## 2a. Directaly pull an environement from Docker Hub (https://hub.docker.com/)
To pull the environment from the docker, use `apptainer pull [docker_dir]` as follows:

```apptainer pull docker://zhengwustat/concon_ax_env```


In shell you would see output as follows:
```
INFO:    Converting OCI blobs to SIF format
INFO:    Starting build...
Writing manifest to image destination
INFO:    Creating SIF file...
```


## 2b. Build docker image from Docker Hub
As an alternative to pulling, you could also build a new environment from the docker, use `apptainer build [container_name.sif] [docker_dir]`:

```
apptainer build container_name.sif docker://zhengwustat/concon_ax_env
```


| Feature           | `apptainer pull` | `apptainer build` |
|------------------|----------------|------------------|
| **Purpose**       | Download existing image | Create a new or modified image |
| **Customization** | ❌ No (prebuilt only) | ✅ Yes (with `.def` file) |
| **Requires a definition file (`.def`)?** | ❌ No | ✅ Yes (for custom builds) |
| **Speed**        | 🚀 Fast | 🏗 Slower (but customizable) |


## 3. Run code within the container
```
apptainer exec --nv container_name.sif python main.py 
```


## 4. Related shell scripts

Note that the option `--nv` is important to enable GPU 
```
apptainer exec --nv container_name.sif python main.py --device_num 1 --lambda_2 0.001 --max_degree 10 --rank 256 --depth 6 --cyclic --cp --viz
```


In summary, the job.sh file contains the following lines for jobs in https://github.com/Will-Consagra/NeuroPMD/tree/main:
```
#!/bin/bash

#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=32G
#SBATCH --partition=gpu
#SBATCH --gpus=1
#SBATCH --partition=scavenge_gpu
# SBATCH --constraint=a5000
#SBATCH --time=24:00:00 --mail-type ALL


# Install apptainer env
cd dir_to/NeuroPMD-main
module load apptainer
apptainer pull concon_ax_env_latest.sif docker://zhengwustat/concon_ax_env

# Run code
cd dir_to/NeuroPMD-main
apptainer exec --nv concon_ax_env_latest.sif python simulations/MC_sim_study_T2.py 1 --data_dir simulations/T2_data --out_dir simulations/T2_data/T2_results
apptainer exec --nv concon_ax_env_latest.sif python simulations/MC_sim_study_T4.py 1 --data_dir simulations/T4_data --out_dir simulations/T4_data/T4_results


cd dir_to/NeuroPMD-main/realdata
apptainer exec --nv ../concon_ax_env_latest.sif python fitSC.py --device_num 0 --lambda_2 0.0001 --max_degree 10 --rank 256 --depth 6 --cyclic --viz --cp
```

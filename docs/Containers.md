Containers are helpful in streamlining the environment for coding, espcially python environment. 

Yale resource for [Apptainer (previousely singularity)](https://docs.ycrc.yale.edu/clusters-at-yale/guides/containers/) to execute codes under environments of apptainer or docker. 

## 0. Check apptainer `apptainer --version`

## 1. Directaly pull a container and use it `apptainer pull container_dir_on_docker`, e.g.
`apptainer pull docker://zhengwustat/concon_ax_env`


In shell you would see output as follows:
```
INFO:    Converting OCI blobs to SIF format
INFO:    Starting build...
Writing manifest to image destination
INFO:    Creating SIF file...
```


## 2. Build docker image from Docker Hub (https://hub.docker.com/) by `apptainer build container_name container_dir_on_docker`:

```
apptainer build tensorflow-10.0-py3.sif docker://tensorflow/tensorflow:1.10.0-py3
```


| Feature           | `apptainer pull` | `apptainer build` |
|------------------|----------------|------------------|
| **Purpose**       | Download existing image | Create a new or modified image |
| **Customization** | ❌ No (prebuilt only) | ✅ Yes (with `.def` file) |
| **Requires a definition file (`.def`)?** | ❌ No | ✅ Yes (for custom builds) |
| **Speed**        | 🚀 Fast | 🏗 Slower (but customizable) |
| **Example**      | `apptainer pull ubuntu.sif docker://ubuntu:latest` | `apptainer build my_container.sif my_container.def` |


## 3. Run code within the container
```
apptainer exec --nv container_name.sif python main.py 
```


## 4. Related shell scripts

Note that the option `--nv` is important to enable GPU 
```
apptainer exec --nv ../concon_ax_env_latest.sif python fitSC.py --device_num 1 --lambda_2 0.001 --max_degree 10 --rank 256 --depth 6 --cyclic --cp --viz
```


## 5. Select the free GPU in `main.py`
```
def get_free_gpu():
  free_memory = []
  for i in range(torch.cuda.device_count()):
    properties = torch.cuda.get_device_properties(i)
    free_memory.append((torch.cuda.memory_allocated(i), i))
  free_memory.sort()
  return free_memory[0][1]

if torch.cuda.is_available():
  available_gpu = get_free_gpu()
  device = torch.device(f'cuda:{available_gpu}')
else:
  device = torch.device('cpu')
```

## 6. Interactive Session with GPU
`salloc --mem=32G --cpus-per-gpu=1 --gpus=1 --time=2:00:00 --partition gpu_devel`


## 7. Planning the jobs for GPU on server

In order to shorten the wait time and plan the gpu jobs, the following are the advice by YCRC:

- First, you can check the estimated start time of a "sbatch" job via the command:
`sbatch --test-only my_job_script.sh`
This will give you a time that the slurm scheduler thinks your job will begin running, given the resources it is requesting. This can be useful to check the queue impact of reducing or changing resources in your job.

- Second, you can increase the types of GPUs you will accept for your job.  If you are currently requesting an A5000 but any GPU with >24GB VRAM will work, you can instead use this constraint in your job script:
`#SBATCH --constraint="a5000|a100|rtx3090"`

- Third, you can use the "gpu_scavenge" partition to have access to more GPU nodes with shorter queues. This comes with the drawback that your job can be preempted by any job that wants to use that node on a non-scavenge partition. This means that you should write your job code to be able to stop and resume at any point: typically by saving intermediate results. You can read more about the scavenge partitions here: https://docs.ycrc.yale.edu/clusters-at-yale/job-scheduling/scavenge/


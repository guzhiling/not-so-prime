Containers are helpful in streamlining the environment for coding, espcially python environment. 

This is a file for logging my use of dokcer.

Yale resource: [Apptainer](https://docs.ycrc.yale.edu/clusters-at-yale/guides/containers/)

1. Build docker image from Docker Hub (https://hub.docker.com/) by `apptainer build container_name container_dir_on_docker`:

```
apptainer build tensorflow-10.0-py3.sif docker://tensorflow/tensorflow:1.10.0-py3
```

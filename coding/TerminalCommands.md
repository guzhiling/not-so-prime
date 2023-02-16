---
Title: Command Line
Author: Ling
---



## Sources & References
- [Official Ububtu Tutorials](https://ubuntu.com/tutorials/command-line-for-beginners)
- [Linux Shell Commands](https://docs.cs.cf.ac.uk/notes/linux-shell-commands/)
- [Cheat Sheet by Tahul Saigal](https://www.makeuseof.com/tag/mac-terminal-commands-cheat-sheet/)
- [Mac Homebrew](https://pastebin.com/jV9XzPrs)



## Remote Connection Environment
[Official Instructions](https://www.hpc.iastate.edu/guides/condo-2017/access-and-login)

|Commands| Results|
| --- | --------- |
| `ssh username@condo2017.its.iastate.edu`|Connect to remote server
| `ssh username@pronto.las.iastate.edu`|Connect to remote server
| `module load r/3.5.0-py2-x335hrh`| Load a specific environment

## File transfer 

[File transfer](https://researchit.las.iastate.edu/data-transfer-node-condo)
 `scp -r username@hpc-class.its.iastate.edu:mydir ./mydir`
 - Pronto's hpc-class:`prontodtn.las.iastate.edu`
 - Condo's hpc-class:`condodtn.its.iastate.edu`

## Editing using terminal editor

|Commands| Results|
| --- | --------- |
|   `nano <file>` | Open the terminal editor to write file
|  control + x | Exit the terminal editor 


## Pronto
[How to use Pronto](https://researchit.las.iastate.edu/general-guide-how-use-pronto)
[Use Julia GPU docker containers with singularity](https://researchit.las.iastate.edu/use-julia-gpu-docker-containers-singularity)

```
srun --nodes 1 --ntasks 1 --cpus-per-task 2 --gres gpu:1 --pty bash
```


## condo2017


### Python Environment
- Q&A: https://www.hpc.iastate.edu/faq#python-package
```
  module avail pip
  module load py-pip/9.0.1-py3-dpds55c
  pip install --user <packagename>
```

### Julia environment
- Find the version to download on https://julialang.org/downloads/
- use 'tar xvzf your_tar_file' to unpack *.tar.gz
- cd to the unpacked directory, and run './configure --prefix=/your_work_directory' (software will be installed in this directory)
- issue 'make' to compile software
- issue 'make install' to install compiled code in the directory specified in the --prefix option on the configure command

- Invoke julia executable by using its full path: <Julia directory>/bin/julia (https://julialang.org/downloads/platform/) 
```
  wget https://julialang-s3.julialang.org/bin/linux/x64/1.0/julia-1.0.5-linux-x86_64.tar.gz 
  tar –tzf documents.tar.gz # https://phoenixnap.com/kb/extract-tar-gz-files-linux-command-line
   <Julia directory>/bin/julia
```

### R environment

1. Load R module: `$ module load r`
2. Enter R environment:  `$ R`
3. Exit: `q()`

### Create job files using SLURM workload manager
- Introduction: https://www.hpc.iastate.edu/guides/condo-2017/managing-jobs-using-slurm-workload-manager
- Job file generator: https://www.hpc.iastate.edu/guides/condo-2017/slurm-job-script-generator-for-condo
- Steps:
  1. Create a sbatch job file `jobname.sh` using either texteditor locally or vim, change the postfix to `sh` manually
  2. In the terminal, under the directory where `programName.R` locates in, type `sbatch jobname.sh`
  3. Check if your job has been submitted by `qstat -u NetID` or `qstat -a`

- The job file look like this:
```
    #!/bin/bash

    # Copy/paste this job script into a text file and submit with the command:
    #    sbatch thefilename
    # job standard output will go to the file slurm-%j.out (where %j is the job ID)

    #SBATCH --time=1:00:00   # walltime limit (HH:MM:SS)
    #SBATCH --nodes=1   # number of nodes
    #SBATCH --ntasks-per-node=16   # 16 processor core(s) per node 

    # LOAD MODULES, INSERT CODE, AND RUN YOUR PROGRAMS HERE
    module load r
    R CMD BATCH programName.R
```

- Commands for checking job status

  |Commands| Results|
  | ------ | --------- |
  | `qstat -a`| All jobs
  | `qstat -u username`| Jobs submitted by user
  | `qsub` | Execute the jobfile
  | `qdel` | Terminate one job
  | `export LC_ALL="en_US.UTF-8" `|Set language

  
## Basic Commands

|Commands| Results|
| ------ | --------- |
|  `/ (Forward Slash)`|	Top level directory
|  `. (Single Period)` |	Current directory
|  `.. (Double Period)`|	Parent directory
|  `~ (Tilde)`	        | Home directory
|  `sudo [command]`	   | Run command with the security privileges of the super user
|  `nano [file]`	      | Opens the Terminal editor
|  `open [file]`	      | Opens a file
|  `[command] -h`	     | Get help about a command



## Change Directory (cd)

|Commands| Results|
| ------ | --------- |
|`cd` |	Home directory
|`cd [folder]`|	Change directory, e.g. cd Documents
|`cd ~	` | Home directory
|`cd /`|	Root of the drive
|`cd -`|	Previous directory or folder you last browsed
|`pwd` |Show your working directory
|`cd ..` |Move up to the parent directory
|`cd ../..`|	Move up two levels


## List (ls)

|Commands| Results|
| ------ | --------- |
|  `ls`|	Display the name of files and subdirectories in the directory
|  `ls -C`	|Force multi-column output of the listing
|  `ls -a`	|List all entries including those with .(period) and ..(double period)
|  `ls -l <dir/file>`	|List the sizes of the files in the dir / files, use * to list all the file sizes in the current dir
|  `du -sh .`	|Calculate the whole size of the current dir


## File and Directory Management

|Commands| Results|
| ------ | --------- |
| `mkdir <dir>`	| Create new folder named <dir>
| `mkdir -p <dir>/<dir>`	| Create nested folders
| `mkdir <dir1> <dir2> <dir3>`| 	Create several folders at once
| `mkdir "<dir>"`| Create a folder with a space in the filename
| `rmdir <dir>`	| Delete a folder (only works on empty folders)
| `rm -R <dir>`	| Delete a folder and its contents, equivalent to `rm -r`
| `rm <file>`	| Delete a file (This deletes the file permanently; use with caution.)
| `rm -i <file>`	| Delete a file only when you give confirmation
| `rm -f <file>`	| Force removal without confirmation
| `rm <file1> <file2> <file3>`	| Delete multiple files without any confirmation
| `mv <file> <newfilename>`	| Move/rename
| `mv <file> <dir>`	| Move a file to the folder, possibly by overwriting an existing file
| `mv -i <file> <dir>`	| Optional -i flag to warn you before overwriting the file
| `mv *.png ~/<dir>`	| Move all PNG files from current folder to a different folder
| `touch <file>`	| Create a new file without any extension
| `cp <file> <dir>`	| Copy a file to the folder
| `cp <file> <newfile>`	| Copy a file to the current folder
| `cp <file>~/<dir>/<newfile>`	| Copy a file to the folder and rename the copied file
| `cp -R <dir> <"new dir">`	| Copy a folder to a new folder with spaces in the filename
| `cp -i <file><dir>`	| Prompts you before copying a file with a warning overwrite message
| `cp <file1> <file2> <file3>/Users/<dir>`	| Copy multiple files to a folder

## Short Cuts

|Commands| Results|
| ------ | --------- |
|    Ctrl + A	| Go to the beginning of the line you're currently typing on
|    Ctrl + E	| Go to the end of the line you're currently typing on
|    Ctrl + U	| Clear the line before the cursor
|    Ctrl + K	| Clear the line after the cursor
|    Ctrl + C	| Kill whatever you're running
|    Ctrl + D	| Exit the current shell


## Homebrew & Cask
Useful to install and version control softwares.

|Commands| Results|
| ------ | --------- |
|` xcode-select —install`|Install Xcode Tools
|`ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`|  Install Homebrew
|`brew install cask`| Install Cask
| `brew search --casks`| List apps
|  `brew search (discord)  `|  Search apps
| `brew cask install (discord)`|Install
|` brew cask upgrade`|Update all softwares downloaed through cask
|` brew cask help`|Help



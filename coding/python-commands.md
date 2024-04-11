## Workflow
1. Open terminal
2. Set up python environment: `conda activate myenv`
3. Coding using your favorate editor/ using jupyter notebook: `jupyter notebook`
4. Run python code in terminal: `python code.py`

## Environment management in conda
- create a blank conda environment: `conda create --name myenv python=3.9.16`
- create a conda environment from yml file: `conda create myenv —-file myenv.yml`
- update the current environment using yml file: `conda env update --name myenv --file myenv.yml --prune`
- list all conda environments on the machine: `conda env list`
- copy an exisiting environment myenv 1, name it as myenv2: `conda create --clone myenv1 --name myenv2`
- display active conda channels: `conda config --show channels`
- update conda: `conda update --all`
- activate a conda environemnt: `conda activate myenv`
- check conda version: `conda --version`
- check python version: `python --version`


## More to come...

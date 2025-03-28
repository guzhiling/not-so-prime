## Workflow
1. Open terminal
2. Set up python environment: `conda activate myenv`
3. Coding using your favorate editor/ using jupyter notebook: `jupyter notebook`
4. Run python code in terminal: `python code.py`
5. In visual studio code: select compiler to be the environment name you need

## Environment management in conda
- create a blank conda environment: `conda create --name myenv python=3.9.16`
- create a conda environment from yml file: `conda create myenv —-file environment.yml` or `conda env create -f environment.yml`
- update the current environment using yml file: `conda env update --name myenv --file myenv.yml --prune`
- list all conda environments on the machine: `conda env list`
- copy an exisiting environment myenv 1, name it as myenv2: `conda create --clone myenv1 --name myenv2`
- display active conda channels: `conda config --show channels`
- update conda: `conda update --all`
- activate a conda environemnt: `conda activate myenv`
- check conda version: `conda --version`
- check python version: `python --version`
- export environment: `conda list --explicit > environment.txt`
- create environment from explicit environment: `conda create --name new_env --file environment.txt`
- update environment on ycrc server `ycrc_conda_env.sh update`




## Argument Parser

In shell/terminal:
```
python main.py --arg1 2 --arg2 "arg2_alt"
```

In main.py:
```
import argparse
parser = argparse.ArgumentParser()
parser.add_argument("--arg1", type=int, help="integer argument 1", default = 1)
parser.add_argument("--arg2", type=str, help="string argument 2", default = "arg2_default")
args = parser.parse_args()
arg1 = args.arg1
arg2 = args.arg2
```

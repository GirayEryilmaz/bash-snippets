#!/usr/bin/env bash
### SLURM HEADER
#SBATCH --job-name=jupyter
#SBATCH --output=/path/to/jupyterlogs/jupyter.log
#SBATCH --mail-type=FAIL
#SBATCH --qos=batch
#SBATCH --time=2:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH	--cpus-per-task=4
#SBATCH --mem=32000
### SLURM HEADER

cd /my/jupyter/dir

export PATH=/home/${USER}/miniconda/bin:$PATH

# Activate an environment here if you want. 
# Check the python version in the environment
python -c 'import sys; print("Running python version:", ".".join(map(str, sys.version_info[:3])))'

PORT=11111
echo "The ip is http://`hostname -i`:$PORT/lab"
jupyter-lab --no-browser --port=$PORT --ip=`hostname -i` --LabApp.token='somepassword'

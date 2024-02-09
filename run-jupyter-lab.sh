#!/usr/bin/env bash

#SBATCH --job-name=jupyter
#SBATCH --output=/home/me/logs.log  #Set up your log file
#SBATCH --error=/home/me/errors.log
##SBATCH --partition=dev
##SBATCH --qos=dev
#SBATCH --time=8:30:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH	--cpus-per-task=16
#SBATCH --mem=200GB

eval "$(conda shell.bash hook)"
conda activate jupyter_env

cd /the/path/

python -c 'import sys; print("Running python version:", ".".join(map(str, sys.version_info[:3])))'

PORT=1111
echo -e "The ip is \nhttp://`hostname -i`:$PORT/lab"
jupyter-lab --no-browser --port="$PORT" --ip=`hostname -i` --LabApp.token='somepassword'

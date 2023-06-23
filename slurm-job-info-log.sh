#!/usr/bin/env bash


#SBATCH --time=0:05:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH	--cpus-per-task=1
#SBATCH --mem=1GB

scontrol show job $SLURM_JOB_ID
scontrol write batch_script $SLURM_JOB_ID -

#!/bin/bash

#SBATCH --job-name=examplejob
#SBATCH --output=test1.txt
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=3
#SBATCH	--cpus-per-task=1
#SBATCH --mem=1GB
#SBATCH --time=0-00:10:00  ## time for analysis (day-hour:min:sec)

# Execute job steps
srun --overlap --ntasks=1 --nodes=1 --cpus-per-task=1 bash -c "sleep 10; echo 'hello 1'" &
srun --overlap --ntasks=1 --nodes=1 --cpus-per-task=1 bash -c "sleep 20; echo 'hello 2'" &
srun --overlap --ntasks=1 --nodes=1 --cpus-per-task=1 bash -c "sleep 30; echo 'hello 3'" &
wait

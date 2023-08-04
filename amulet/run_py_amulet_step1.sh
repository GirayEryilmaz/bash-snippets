#!/usr/bin/bash

#SBATCH --job-name=py_alt_1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --time=1:00:00
#SBATCH --mem=16GB

source /home/${USER}/.bashrc
source activate base

echo "Running Overlap Counter..."

OUTS="/path/outs"
AMULET="/path/AMULET-v1.1"

python "$AMULET"/FragmentFileOverlapCounter.py \
	"$OUTS"/atac_fragments.tsv.gz \
	"$OUTS"/singlecell_atac.csv \
	"$AMULET"/human_autosomes.txt \
	"$OUTS"/amulet

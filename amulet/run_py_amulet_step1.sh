#!/usr/bin/bash

#SBATCH --job-name=py_alt_1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --time=1:00:00
#SBATCH --mem=16GB


# Amulet needs some data from per_barcode_metrics, I copied the needed columns (barcode and is_cell) to singlecell_atac.csv. 
# is_cell needs to be renamed to is__cell_barcode. Amulet as of now requires this. 
# We use the python version because java version can not handle too many cells (integer overflows).
# Before starting Amulet, we need to remove known doublets and negatives found by demux step. That is why we also keep the barcode column which we will use for that. 

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

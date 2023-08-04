#!/usr/bin/bash

#SBATCH --job-name=py_alt_1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --time=1:00:00
#SBATCH --mem=16GB


# Amulet needs some data from per_barcode_metrics, I copied the needed columns (barcode and is_cell) to singlecell_atac.csv. 
# The original amulet script needed is_cell to be renamed to is__cell_barcode. You can change the one occurence of is__cell_barcode to is_cell in FragmentFileOverlapCounter.py
# or rename that column to is__cell_barcode
# We use the python version because java version can not handle too many cells (integer overflows).
# Before starting Amulet, we need to remove known doublets and negatives found by demux step. That is why we also keep the barcode column which we will use for that. 

source /home/${USER}/.bashrc
source activate base

echo "Running Overlap Counter..."

OUTS="/projects/ucar-lab/giray/DOGMA-seq/out-S-2-100kcells/outs"
AMULET="/projects/ucar-lab/giray/AMULET-v1.1"


cut -d, -f1,4 "$OUTS"/per_barcode_metrics.csv > "$OUTS"/singlecell_atac.csv

mkdir "$OUTS"/amulet

python "$AMULET"/FragmentFileOverlapCounter.py \
	"$OUTS"/atac_fragments.tsv.gz \
	"$OUTS"/singlecell_atac.csv \
	"$AMULET"/human_autosomes.txt \
	"$OUTS"/amulet

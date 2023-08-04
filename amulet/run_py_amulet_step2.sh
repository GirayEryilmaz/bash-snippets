#!/usr/bin/bash

#SBATCH --job-name=py_alt_2
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --time=12:00:00
#SBATCH --mem=64GB

source /home/${USER}/.bashrc
source activate base

echo "Running Multiplet Detection (Python)..."

OUTS="/path/outs"
AMULET="path/AMULET-v1.1"

python "$AMULET"/AMULET.py --rfilter "/path/RestrictionRepeatLists/restrictionlist_repeats_segdups_rmsk_hg38.bed" \
		"$OUTS"/amulet/Overlaps.txt \
		"$OUTS"/amulet/OverlapSummary.txt \
		"$OUTS"/amulet

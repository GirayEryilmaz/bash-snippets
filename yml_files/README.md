Might need to start an interactive job on an hpc system with slurm.  
`srun --pty -q dev  -p dev --mem=50G -c 4 -t 4:00:00 bash -i`

How to make a new conda environment with mamba:  
`mamba env create --name muon --file muon.yml`

#!/bin/bash
#Request 10 hours
#SBATCH -t 10:00:00
#Request 100 GiB per CPU-core
#SBATCH --mem-per-cpu=100096
#Request 5 cores
#SBATCH -n 5

#Load required modules
module load r

#Make sure OpenMP is not "on"
OMP_NUM_THREADS=1
export OMP_NUM_THREADS

# make changes to R script before submission
export R_LIBS='/scratch/zt1/project/fisher-lab/shared/HPC_trimmed_Fastq.gz/Trimmomatic_trimmed/HBA_DEALS/R_LIBS'
Rscript --no-save --no-restore /scratch/zt1/project/fisher-lab/shared/HPC_trimmed_Fastq.gz/Trimmomatic_trimmed/HBA_DEALS/HBA_DEALS_sim.R

#!/bin/bash
#Request 72 hours
#SBATCH -t 72:00:00
#Request 200 GiB per CPU-core
#SBATCH --mem=200gb
#Request 20 cores
#SBATCH -n 20

#Load required modules
module load r

#Make sure OpenMP is not "on"
OMP_NUM_THREADS=1
export OMP_NUM_THREADS

# make changes to R script before submission
export R_LIBS='/scratch/zt1/project/fisher-lab/shared/HPC_trimmed_Fastq.gz/Trimmomatic_trimmed/HBA_DEALS/R_LIBS'
Rscript --no-save --no-restore /scratch/zt1/project/fisher-lab/shared/HPC_trimmed_Fastq.gz/Trimmomatic_trimmed/HBA_DEALS/HBA_DEALS_f_nf_2.R


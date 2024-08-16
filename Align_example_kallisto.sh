#!/bin/bash
#SBATCH --job-name=Kallisto_2
#SBATCH --nodes=1
#SBATCH --time=168:00:00
#SBATCH --mem=100000
#SBATCH --mail-type=BEGIN,END

cd /scratch/zt1/project/fisher-lab/shared/HPC_trimmed_Fastq.gz/Trimmomatic_trimmed/Kallisto

/scratch/zt1/project/fisher-lab/shared/HPC_trimmed_Fastq.gz/Trimmomatic_trimmed/Kallisto/kallisto/kallisto quant --index=Pcal_kallisto_index_GCF --output-dir=IL63-A10_2_quant.output IL63-A10_2_R1_trimmed2.fastq IL63-A10_2_R2_trimmed2.fastq


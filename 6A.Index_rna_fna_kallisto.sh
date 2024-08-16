#!/bin/bash
#SBATCH --job-name=Kallisto_index
#SBATCH --nodes=1
#SBATCH --time=168:00:00
#SBATCH --mem-per-cpu=100000
#SBATCH --cpus-per-task=1
#SBATCH --mail-type=BEGIN,END

cd /scratch/zt1/project/fisher-lab/shared/HPC_trimmed_Fastq.gz/Trimmomatic_trimmed/Kallisto

/scratch/zt1/project/fisher-lab/shared/HPC_trimmed_Fastq.gz/Trimmomatic_trimmed/Kallisto/kallisto/kallisto index --index=Pcal_kallisto_index_GCF GCF_007827085.1_ASM782708v3_rna.fasta


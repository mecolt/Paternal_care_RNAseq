#!/bin/bash

#Indexing genome, aligning RNA-seq reads, and sorting and converting to .bam file using Hisat2 and Samtools 

#SBATCH --nodes=1
#SBATCH --time=16:00:00
#SBATCH --mem-per-cpu=409600
#SBATCH --mail-type=BEGIN,END

. ~/.profile

#This is an example script for a single individual ("IL72-B11_14")

cd /scratch/zt1/project/fisher-lab/shared/HPC_trimmed_Fastq.gz/Trimmomatic_trimmed

module load samtools

hisat2-2.2.1/hisat2-build GCF_007827085.1_ASM782708v3_genomic.fa P_cal_index_ref #Indexing genome

hisat2-2.2.1/hisat2 -x P_cal_index_ref -1 IL72-B11_14_R1_trimmed2.fastq \
-2 IL72-B11_14_R2_trimmed2.fastq -S IL72-B11_14_GCF.sam --phred33 --rna-strandness RF #Aligning reads

for i in *.sam;  do samtools view -Sb $i | samtools sort -o $i.sorted.bam -O BAM; done
for i in *.sorted.bam; do samtools index $i; done #Sorting and converting to .bam file


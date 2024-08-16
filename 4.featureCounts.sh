#!/bin/bash

#Counting RNA-seq reads aligning to the genome using featureCounts

#SBATCH --output=Counts_mb_%A_%a.out
#SBATCH --error=Counts_mb_%A_%a.err
#SBATCH --job-name=featureCounts
#SBATCH --nodes=1
#SBATCH --time=16:00:00
#SBATCH --mem-per-cpu=409600
#SBATCH --mail-type=BEGIN,END

cd /scratch/zt1/project/fisher-lab/shared/HPC_trimmed_Fastq.gz/Trimmomatic_trimmed/FeatureCounts

subread-2.0.3-Linux-x86_64/bin/featureCounts -p --countReadPairs -a GCF_007827085.1_ASM782708v3_genomic.gtf -o IL63-A10_2_NCBI IL63-A10_2_GCF.sam.sorted.bam

subread-2.0.3-Linux-x86_64/bin/featureCounts -p --countReadPairs -a GCF_007827085.1_ASM782708v3_genomic.gtf -o IL64-B10_4_NCBI IL64-B10_4_GCF.sam.sorted.bam

subread-2.0.3-Linux-x86_64/bin/featureCounts -p --countReadPairs -a GCF_007827085.1_ASM782708v3_genomic.gtf -o IL65-C10_5_NCBI IL65-C10_5_GCF.sam.sorted.bam

subread-2.0.3-Linux-x86_64/bin/featureCounts -p --countReadPairs -a GCF_007827085.1_ASM782708v3_genomic.gtf -o IL66-D10_6_NCBI IL66-D10_6_GCF.sam.sorted.bam

subread-2.0.3-Linux-x86_64/bin/featureCounts -p --countReadPairs -a GCF_007827085.1_ASM782708v3_genomic.gtf -o IL67-E10_7_NCBI IL67-E10_7_GCF.sam.sorted.bam

subread-2.0.3-Linux-x86_64/bin/featureCounts -p --countReadPairs -a GCF_007827085.1_ASM782708v3_genomic.gtf -o IL68-F10_9_NCBI IL68-F10_9_GCF.sam.sorted.bam

subread-2.0.3-Linux-x86_64/bin/featureCounts -p --countReadPairs -a GCF_007827085.1_ASM782708v3_genomic.gtf -o IL69-G10_10_NCBI IL69-G10_10_GCF.sam.sorted.bam

subread-2.0.3-Linux-x86_64/bin/featureCounts -p --countReadPairs -a GCF_007827085.1_ASM782708v3_genomic.gtf -o IL70-H10_11_NCBI IL70-H10_11_GCF.sam.sorted.bam

subread-2.0.3-Linux-x86_64/bin/featureCounts -p --countReadPairs -a GCF_007827085.1_ASM782708v3_genomic.gtf -o IL71-A11_12_NCBI IL71-A11_12_GCF.sam.sorted.bam

subread-2.0.3-Linux-x86_64/bin/featureCounts -p --countReadPairs -a GCF_007827085.1_ASM782708v3_genomic.gtf -o IL72-B11_14_NCBI IL72-B11_14_GCF.sam.sorted.bam

subread-2.0.3-Linux-x86_64/bin/featureCounts -p --countReadPairs -a GCF_007827085.1_ASM782708v3_genomic.gtf -o IL73-C11_16_NCBI IL73-C11_16_GCF.sam.sorted.bam

subread-2.0.3-Linux-x86_64/bin/featureCounts -p --countReadPairs -a GCF_007827085.1_ASM782708v3_genomic.gtf -o IL74-D11_18_NCBI IL74-D11_18_GCF.sam.sorted.bam

subread-2.0.3-Linux-x86_64/bin/featureCounts -p --countReadPairs -a GCF_007827085.1_ASM782708v3_genomic.gtf -o IL75-E11_19_NCBI IL75-E11_19_GCF.sam.sorted.bam

subread-2.0.3-Linux-x86_64/bin/featureCounts -p --countReadPairs -a GCF_007827085.1_ASM782708v3_genomic.gtf -o IL76-F11_20_NCBI IL76-F11_20_GCF.sam.sorted.bam

subread-2.0.3-Linux-x86_64/bin/featureCounts -p --countReadPairs -a GCF_007827085.1_ASM782708v3_genomic.gtf -o IL77-G11_21_NCBI IL77-G11_21_GCF.sam.sorted.bam

subread-2.0.3-Linux-x86_64/bin/featureCounts -p --countReadPairs -a GCF_007827085.1_ASM782708v3_genomic.gtf -o IL78-H11_22_NCBI IL78-H11_22_GCF.sam.sorted.bam

subread-2.0.3-Linux-x86_64/bin/featureCounts -p --countReadPairs -a GCF_007827085.1_ASM782708v3_genomic.gtf -o IL79-A12_23_NCBI IL79-A12_23_GCF.sam.sorted.bam

subread-2.0.3-Linux-x86_64/bin/featureCounts -p --countReadPairs -a GCF_007827085.1_ASM782708v3_genomic.gtf -o IL80-B12_25_NCBI IL80-B12_25_GCF.sam.sorted.bam

subread-2.0.3-Linux-x86_64/bin/featureCounts -p --countReadPairs -a GCF_007827085.1_ASM782708v3_genomic.gtf -o IL81-C12_26_NCBI IL81-C12_26_GCF.sam.sorted.bam

subread-2.0.3-Linux-x86_64/bin/featureCounts -p --countReadPairs -a GCF_007827085.1_ASM782708v3_genomic.gtf -o IL82-D12_27_NCBI IL82-D12_27_GCF.sam.sorted.bam

subread-2.0.3-Linux-x86_64/bin/featureCounts -p --countReadPairs -a GCF_007827085.1_ASM782708v3_genomic.gtf -o IL83-E12_29_NCBI IL83-E12_29_GCF.sam.sorted.bam

subread-2.0.3-Linux-x86_64/bin/featureCounts -p --countReadPairs -a GCF_007827085.1_ASM782708v3_genomic.gtf -o IL84-F12_32_NCBI IL84-F12_32_GCF.sam.sorted.bam

subread-2.0.3-Linux-x86_64/bin/featureCounts -p --countReadPairs -a GCF_007827085.1_ASM782708v3_genomic.gtf -o IL85-G12_33_NCBI IL85-G12_33_GCF.sam.sorted.bam

subread-2.0.3-Linux-x86_64/bin/featureCounts -p --countReadPairs -a GCF_007827085.1_ASM782708v3_genomic.gtf -o IL86-H12_35_NCBI IL86-H12_35_GCF.sam.sorted.bam

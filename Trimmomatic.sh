#!/bin/bash

#Trimming low-quality bases from Illumina trimmed reads with Trimmomatic

#SBATCH --nodes=1
#SBATCH --time=18:00:00
#SBATCH --mem-per-cpu=409600

. ~/.profile


java -jar /scratch/zt1/project/fisher-lab/shared/trimmomatic-0.39.jar PE -phred33 \
IL63-A10_2_R1_trimmed.fastq.gz IL63-A10_2_R2_trimmed.fastq.gz \
./Trimmomatic_trimmed/IL63-A10_2_R1_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL63-A10_2_R1_trimmed2_orphan.fastq.gz \
./Trimmomatic_trimmed/IL63-A10_2_R2_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL63-A10_2_R2_trimmed2_orphan.fastq.gz \
SLIDINGWINDOW:4:20 LEADING:20 TRAILING:20 MINLEN:80


java -jar /scratch/zt1/project/fisher-lab/shared/trimmomatic-0.39.jar PE -phred33 \
IL64-B10_4_R1_trimmed.fastq.gz IL64-B10_4_R2_trimmed.fastq.gz \
./Trimmomatic_trimmed/IL64-B10_4_R1_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL64-B10_4_R1_trimmed2_orphan.fastq.gz \
./Trimmomatic_trimmed/IL64-B10_4_R2_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL64-B10_4_R2_trimmed2_orphan.fastq.gz \
SLIDINGWINDOW:4:20 LEADING:20 TRAILING:20 MINLEN:80


java -jar /scratch/zt1/project/fisher-lab/shared/trimmomatic-0.39.jar PE -phred33 \
IL65-C10_5_R1_trimmed.fastq.gz IL65-C10_5_R2_trimmed.fastq.gz \
./Trimmomatic_trimmed/IL65-C10_5_R1_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL65-C10_5_R1_trimmed2_orphan.fastq.gz \
./Trimmomatic_trimmed/IL65-C10_5_R2_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL65-C10_5_R2_trimmed2_orphan.fastq.gz \
SLIDINGWINDOW:4:20 LEADING:20 TRAILING:20 MINLEN:80


java -jar /scratch/zt1/project/fisher-lab/shared/trimmomatic-0.39.jar PE -phred33 \
IL66-D10_6_R1_trimmed.fastq.gz IL66-D10_6_R2_trimmed.fastq.gz \
./Trimmomatic_trimmed/IL66-D10_6_R1_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL66-D10_6_R1_trimmed2_orphan.fastq.gz \
./Trimmomatic_trimmed/IL66-D10_6_R2_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL66-D10_6_R2_trimmed2_orphan.fastq.gz \
SLIDINGWINDOW:4:20 LEADING:20 TRAILING:20 MINLEN:80


java -jar /scratch/zt1/project/fisher-lab/shared/trimmomatic-0.39.jar PE -phred33 \
IL67-E10_7_R1_trimmed.fastq.gz IL67-E10_7_R2_trimmed.fastq.gz \
./Trimmomatic_trimmed/IL67-E10_7_R1_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL67-E10_7_R1_trimmed2_orphan.fastq.gz \
./Trimmomatic_trimmed/IL67-E10_7_R2_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL67-E10_7_R2_trimmed2_orphan.fastq.gz \
SLIDINGWINDOW:4:20 LEADING:20 TRAILING:20 MINLEN:80


java -jar /scratch/zt1/project/fisher-lab/shared/trimmomatic-0.39.jar PE -phred33 \
IL68-F10_9_R1_trimmed.fastq.gz IL68-F10_9_R2_trimmed.fastq.gz \
./Trimmomatic_trimmed/IL68-F10_9_R1_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL68-F10_9_R1_trimmed2_orphan.fastq.gz \
./Trimmomatic_trimmed/IL68-F10_9_R2_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL68-F10_9_R2_trimmed2_orphan.fastq.gz \
SLIDINGWINDOW:4:20 LEADING:20 TRAILING:20 MINLEN:80


java -jar /scratch/zt1/project/fisher-lab/shared/trimmomatic-0.39.jar PE -phred33 \
IL69-G10_10_R1_trimmed.fastq.gz IL69-G10_10_R2_trimmed.fastq.gz \
./Trimmomatic_trimmed/IL69-G10_10_R1_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL69-G10_10_R1_trimmed2_orphan.fastq.gz \
./Trimmomatic_trimmed/IL69-G10_10_R2_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL69-G10_10_R2_trimmed2_orphan.fastq.gz \
SLIDINGWINDOW:4:20 LEADING:20 TRAILING:20 MINLEN:80


java -jar /scratch/zt1/project/fisher-lab/shared/trimmomatic-0.39.jar PE -phred33 \
IL70-H10_11_R1_trimmed.fastq.gz IL70-H10_11_R2_trimmed.fastq.gz \
./Trimmomatic_trimmed/IL70-H10_11_R1_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL70-H10_11_R1_trimmed2_orphan.fastq.gz \
./Trimmomatic_trimmed/IL70-H10_11_R2_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL70-H10_11_R2_trimmed2_orphan.fastq.gz \
SLIDINGWINDOW:4:20 LEADING:20 TRAILING:20 MINLEN:80


java -jar /scratch/zt1/project/fisher-lab/shared/trimmomatic-0.39.jar PE -phred33 \
IL71-A11_12_R1_trimmed.fastq.gz IL71-A11_12_R2_trimmed.fastq.gz \
./Trimmomatic_trimmed/IL71-A11_12_R1_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL71-A11_12_R1_trimmed2_orphan.fastq.gz \
./Trimmomatic_trimmed/IL71-A11_12_R2_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL71-A11_12_R2_trimmed2_orphan.fastq.gz \
SLIDINGWINDOW:4:20 LEADING:20 TRAILING:20 MINLEN:80


java -jar /scratch/zt1/project/fisher-lab/shared/trimmomatic-0.39.jar PE -phred33 \
IL72-B11_14_R1_trimmed.fastq.gz IL72-B11_14_R2_trimmed.fastq.gz \
./Trimmomatic_trimmed/IL72-B11_14_R1_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL72-B11_14_R1_trimmed2_orphan.fastq.gz \
./Trimmomatic_trimmed/IL72-B11_14_R2_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL72-B11_14_R2_trimmed2_orphan.fastq.gz \
SLIDINGWINDOW:4:20 LEADING:20 TRAILING:20 MINLEN:80


java -jar /scratch/zt1/project/fisher-lab/shared/trimmomatic-0.39.jar PE -phred33 \
IL73-C11_16_R1_trimmed.fastq.gz IL73-C11_16_R2_trimmed.fastq.gz \
./Trimmomatic_trimmed/IL73-C11_16_R1_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL73-C11_16_R1_trimmed2_orphan.fastq.gz \
./Trimmomatic_trimmed/IL73-C11_16_R2_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL73-C11_16_R2_trimmed2_orphan.fastq.gz \
SLIDINGWINDOW:4:20 LEADING:20 TRAILING:20 MINLEN:80


java -jar /scratch/zt1/project/fisher-lab/shared/trimmomatic-0.39.jar PE -phred33 \
IL74-D11_18_R1_trimmed.fastq.gz IL74-D11_18_R2_trimmed.fastq.gz \
./Trimmomatic_trimmed/IL74-D11_18_R1_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL74-D11_18_R1_trimmed2_orphan.fastq.gz \
./Trimmomatic_trimmed/IL74-D11_18_R2_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL74-D11_18_R2_trimmed2_orphan.fastq.gz \
SLIDINGWINDOW:4:20 LEADING:20 TRAILING:20 MINLEN:80


java -jar /scratch/zt1/project/fisher-lab/shared/trimmomatic-0.39.jar PE -phred33 \
IL75-E11_19_R1_trimmed.fastq.gz IL75-E11_19_R2_trimmed.fastq.gz \
./Trimmomatic_trimmed/IL75-E11_19_R1_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL75-E11_19_R1_trimmed2_orphan.fastq.gz \
./Trimmomatic_trimmed/IL75-E11_19_R2_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL75-E11_19_R2_trimmed2_orphan.fastq.gz \
SLIDINGWINDOW:4:20 LEADING:20 TRAILING:20 MINLEN:80


java -jar /scratch/zt1/project/fisher-lab/shared/trimmomatic-0.39.jar PE -phred33 \
IL76-F11_20_R1_trimmed.fastq.gz IL76-F11_20_R2_trimmed.fastq.gz \
./Trimmomatic_trimmed/IL76-F11_20_R1_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL76-F11_20_R1_trimmed2_orphan.fastq.gz \
./Trimmomatic_trimmed/IL76-F11_20_R2_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL76-F11_20_R2_trimmed2_orphan.fastq.gz \
SLIDINGWINDOW:4:20 LEADING:20 TRAILING:20 MINLEN:80


java -jar /scratch/zt1/project/fisher-lab/shared/trimmomatic-0.39.jar PE -phred33 \
IL77-G11_21_R1_trimmed.fastq.gz IL77-G11_21_R2_trimmed.fastq.gz \
./Trimmomatic_trimmed/IL77-G11_21_R1_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL77-G11_21_R1_trimmed2_orphan.fastq.gz \
./Trimmomatic_trimmed/IL77-G11_21_R2_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL77-G11_21_R2_trimmed2_orphan.fastq.gz \
SLIDINGWINDOW:4:20 LEADING:20 TRAILING:20 MINLEN:80


java -jar /scratch/zt1/project/fisher-lab/shared/trimmomatic-0.39.jar PE -phred33 \
IL78-H11_22_R1_trimmed.fastq.gz IL78-H11_22_R2_trimmed.fastq.gz \
./Trimmomatic_trimmed/IL78-H11_22_R1_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL78-H11_22_R1_trimmed2_orphan.fastq.gz \
./Trimmomatic_trimmed/IL78-H11_22_R2_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL78-H11_22_R2_trimmed2_orphan.fastq.gz \
SLIDINGWINDOW:4:20 LEADING:20 TRAILING:20 MINLEN:80


java -jar /scratch/zt1/project/fisher-lab/shared/trimmomatic-0.39.jar PE -phred33 \
IL79-A12_23_R1_trimmed.fastq.gz IL79-A12_23_R2_trimmed.fastq.gz \
./Trimmomatic_trimmed/IL79-A12_23_R1_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL79-A12_23_R1_trimmed2_orphan.fastq.gz \
./Trimmomatic_trimmed/IL79-A12_23_R2_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL79-A12_23_R2_trimmed2_orphan.fastq.gz \
SLIDINGWINDOW:4:20 LEADING:20 TRAILING:20 MINLEN:80


java -jar /scratch/zt1/project/fisher-lab/shared/trimmomatic-0.39.jar PE -phred33 \
IL80-B12_25_R1_trimmed.fastq.gz IL80-B12_25_R2_trimmed.fastq.gz \
./Trimmomatic_trimmed/IL80-B12_25_R1_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL80-B12_25_R1_trimmed2_orphan.fastq.gz \
./Trimmomatic_trimmed/IL80-B12_25_R2_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL80-B12_25_R2_trimmed2_orphan.fastq.gz \
SLIDINGWINDOW:4:20 LEADING:20 TRAILING:20 MINLEN:80


java -jar /scratch/zt1/project/fisher-lab/shared/trimmomatic-0.39.jar PE -phred33 \
IL81-C12_26_R1_trimmed.fastq.gz IL81-C12_26_R2_trimmed.fastq.gz \
./Trimmomatic_trimmed/IL81-C12_26_R1_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL81-C12_26_R1_trimmed2_orphan.fastq.gz \
./Trimmomatic_trimmed/IL81-C12_26_R2_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL81-C12_26_R2_trimmed2_orphan.fastq.gz \
SLIDINGWINDOW:4:20 LEADING:20 TRAILING:20 MINLEN:80


java -jar /scratch/zt1/project/fisher-lab/shared/trimmomatic-0.39.jar PE -phred33 \
IL82-D12_27_R1_trimmed.fastq.gz IL82-D12_27_R2_trimmed.fastq.gz \
./Trimmomatic_trimmed/IL82-D12_27_R1_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL82-D12_27_R1_trimmed2_orphan.fastq.gz \
./Trimmomatic_trimmed/IL82-D12_27_R2_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL82-D12_27_R2_trimmed2_orphan.fastq.gz \
SLIDINGWINDOW:4:20 LEADING:20 TRAILING:20 MINLEN:80


java -jar /scratch/zt1/project/fisher-lab/shared/trimmomatic-0.39.jar PE -phred33 \
IL83-E12_29_R1_trimmed.fastq.gz IL83-E12_29_R2_trimmed.fastq.gz \
./Trimmomatic_trimmed/IL83-E12_29_R1_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL83-E12_29_R1_trimmed2_orphan.fastq.gz \
./Trimmomatic_trimmed/IL83-E12_29_R2_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL83-E12_29_R2_trimmed2_orphan.fastq.gz \
SLIDINGWINDOW:4:20 LEADING:20 TRAILING:20 MINLEN:80


java -jar /scratch/zt1/project/fisher-lab/shared/trimmomatic-0.39.jar PE -phred33 \
IL84-F12_32_R1_trimmed.fastq.gz IL84-F12_32_R2_trimmed.fastq.gz \
./Trimmomatic_trimmed/IL84-F12_32_R1_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL84-F12_32_R1_trimmed2_orphan.fastq.gz \
./Trimmomatic_trimmed/IL84-F12_32_R2_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL84-F12_32_R2_trimmed2_orphan.fastq.gz \
SLIDINGWINDOW:4:20 LEADING:20 TRAILING:20 MINLEN:80


java -jar /scratch/zt1/project/fisher-lab/shared/trimmomatic-0.39.jar PE -phred33 \
IL85-G12_33_R1_trimmed.fastq.gz IL85-G12_33_R2_trimmed.fastq.gz \
./Trimmomatic_trimmed/IL85-G12_33_R1_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL85-G12_33_R1_trimmed2_orphan.fastq.gz \
./Trimmomatic_trimmed/IL85-G12_33_R2_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL85-G12_33_R2_trimmed2_orphan.fastq.gz \
SLIDINGWINDOW:4:20 LEADING:20 TRAILING:20 MINLEN:80


java -jar /scratch/zt1/project/fisher-lab/shared/trimmomatic-0.39.jar PE -phred33 \
IL86-H12_35_R1_trimmed.fastq.gz IL86-H12_35_R2_trimmed.fastq.gz \
./Trimmomatic_trimmed/IL86-H12_35_R1_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL86-H12_35_R1_trimmed2_orphan.fastq.gz \
./Trimmomatic_trimmed/IL86-H12_35_R2_trimmed2.fastq.gz ./Trimmomatic_trimmed/Orphans/IL86-H12_35_R2_trimmed2_orphan.fastq.gz \
SLIDINGWINDOW:4:20 LEADING:20 TRAILING:20 MINLEN:80


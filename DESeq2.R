###########################################################################################
###################### DESeq2 Differential Gene Expression Analysis #######################
###########################################################################################

# This script was used to detect differentially expressed genes between non-father, pup-sensitized non-father, 
# and father treatment groups.

# STEP 1: Manipulating FeatureCounts output files manually for input into DESeq2

##Load FeatureCount output files
IL63_2 <- read.table(file = 'IL63-A10_2_NCBI', header = TRUE)
IL64_4 <- read.table(file = 'IL64-B10_4_NCBI', header = TRUE)
IL65_5 <- read.table(file = 'IL65-C10_5_NCBI', header = TRUE)
IL66_6 <- read.table(file = 'IL66-D10_6_NCBI', header = TRUE)
IL67_7 <- read.table(file = 'IL67-E10_7_NCBI', header = TRUE)
IL68_9 <- read.table(file = 'IL68-F10_9_NCBI', header = TRUE)
IL69_10 <- read.table(file = 'IL69-G10_10_NCBI', header = TRUE)
IL70_11 <- read.table(file = 'IL70-H10_11_NCBI', header = TRUE)
IL71_12 <- read.table(file = 'IL71-A11_12_NCBI', header = TRUE)
IL72_14 <- read.table(file = 'IL72-B11_14_NCBI', header = TRUE)
IL73_16 <- read.table(file = 'IL73-C11_16_NCBI', header = TRUE)
IL74_18 <- read.table(file = 'IL74-D11_18_NCBI', header = TRUE)
IL75_19 <- read.table(file = 'IL75-E11_19_NCBI', header = TRUE)
IL76_20 <- read.table(file = 'IL76-F11_20_NCBI', header = TRUE)
IL77_21 <- read.table(file = 'IL77-G11_21_NCBI', header = TRUE)
IL78_22 <- read.table(file = 'IL78-H11_22_NCBI', header = TRUE)
IL79_23 <- read.table(file = 'IL79-A12_23_NCBI', header = TRUE)
IL80_25 <- read.table(file = 'IL80-B12_25_NCBI', header = TRUE)
IL81_26 <- read.table(file = 'IL81-C12_26_NCBI', header = TRUE)
IL82_27 <- read.table(file = 'IL82-D12_27_NCBI', header = TRUE)
IL83_29 <- read.table(file = 'IL83-E12_29_NCBI', header = TRUE)
IL84_32 <- read.table(file = 'IL84-F12_32_NCBI', header = TRUE)
IL85_33 <- read.table(file = 'IL85-G12_33_NCBI', header = TRUE)
IL86_35 <- read.table(file = 'IL86-H12_35_NCBI', header = TRUE)

##Delete every column besides Geneid and counts (last column)
IL63_2 <- IL63_2[,-c(2,3,4,5,6)]
IL64_4 <- IL64_4[,-c(2,3,4,5,6)]
IL65_5 <- IL65_5[,-c(2,3,4,5,6)]
IL66_6 <- IL66_6[,-c(2,3,4,5,6)]
IL67_7 <- IL67_7[,-c(2,3,4,5,6)]
IL68_9 <- IL68_9[,-c(2,3,4,5,6)]
IL69_10 <- IL69_10[,-c(2,3,4,5,6)]
IL70_11 <- IL70_11[,-c(2,3,4,5,6)]
IL71_12 <- IL71_12[,-c(2,3,4,5,6)]
IL72_14 <- IL72_14[,-c(2,3,4,5,6)]
IL73_16 <- IL73_16[,-c(2,3,4,5,6)]
IL74_18 <- IL74_18[,-c(2,3,4,5,6)]
IL75_19 <- IL75_19[,-c(2,3,4,5,6)]
IL76_20 <- IL76_20[,-c(2,3,4,5,6)]
IL77_21 <- IL77_21[,-c(2,3,4,5,6)]
IL78_22 <- IL78_22[,-c(2,3,4,5,6)]
IL79_23 <- IL79_23[,-c(2,3,4,5,6)]
IL80_25 <- IL80_25[,-c(2,3,4,5,6)]
IL81_26 <- IL81_26[,-c(2,3,4,5,6)]
IL82_27 <- IL82_27[,-c(2,3,4,5,6)]
IL83_29 <- IL83_29[,-c(2,3,4,5,6)]
IL84_32 <- IL84_32[,-c(2,3,4,5,6)]
IL85_33 <- IL85_33[,-c(2,3,4,5,6)]
IL86_35 <- IL86_35[,-c(2,3,4,5,6)]

##This makes the raw count table that we need for DESeq2 analysis
combined_counts <- data.frame(cbind(IL63_2$IL63.A10_2_GCF.sam.sorted.bam,IL64_4$IL64.B10_4_GCF.sam.sorted.bam,
                                  IL65_5$IL65.C10_5_GCF.sam.sorted.bam,IL66_6$IL66.D10_6_GCF.sam.sorted.bam,
                                  IL67_7$IL67.E10_7_GCF.sam.sorted.bam,IL68_9$IL68.F10_9_GCF.sam.sorted.bam, 
                                  IL69_10$IL69.G10_10_GCF.sam.sorted.bam,IL70_11$IL70.H10_11_GCF.sam.sorted.bam,
                                  IL71_12$IL71.A11_12_GCF.sam.sorted.bam,IL72_14$IL72.B11_14_GCF.sam.sorted.bam,
                                  IL73_16$IL73.C11_16_GCF.sam.sorted.bam,IL74_18$IL74.D11_18_GCF.sam.sorted.bam,
                                  IL75_19$IL75.E11_19_GCF.sam.sorted.bam,IL76_20$IL76.F11_20_GCF.sam.sorted.bam,
                                  IL77_21$IL77.G11_21_GCF.sam.sorted.bam,IL78_22$IL78.H11_22_GCF.sam.sorted.bam,
                                  IL79_23$IL79.A12_23_GCF.sam.sorted.bam,IL80_25$IL80.B12_25_GCF.sam.sorted.bam,
                                  IL81_26$IL81.C12_26_GCF.sam.sorted.bam,IL82_27$IL82.D12_27_GCF.sam.sorted.bam,
                                  IL83_29$IL83.E12_29_GCF.sam.sorted.bam,IL84_32$IL84.F12_32_GCF.sam.sorted.bam,
                                  IL85_33$IL85.G12_33_GCF.sam.sorted.bam,IL86_35$IL86.H12_35_GCF.sam.sorted.bam))

##Giving the count table row and column names
rownames(combined_counts) <- IL63_2$Geneid
colnames(combined_counts) <- c("IL63_2","IL64_4","IL65_5","IL66_6","IL67_7","IL68_9","IL69_10","IL70_11",
                             "IL71_12","IL72_14","IL73_16","IL74_18","IL75_19","IL76_20","IL77_21",
                             "IL78_22","IL79_23","IL80_25","IL81_26","IL82_27","IL83_29","IL84_32",
                             "IL85_33","IL86_35")


# STEP 2: DESeq2 to detect differentially expressed genes between groups 

##Install packages and load libraries 
install.packages("htmltools")
library(htmltools)

if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install(version = "3.16")

library( "DESeq2")

##Load in meta data
metaData <- read.csv('Meta_data.csv', header = TRUE, sep = ",")
head(metaData)

##Construct DESEQDataSet Object
dds <- DESeqDataSetFromMatrix(countData=combined_counts, 
                              colData=metaData, 
                             design=~Treatment, tidy=FALSE)
dds #see what object looks like 

dds <- DESeq(dds) #now run DESeq function 
?DESeq #see what we just did

#estimateSizeFactors
#This calculates the relative library depth of each sample 

#estimateDispersions
#estimates the dispersion of counts for each gene 

#nbinomWaldTest
#calculates the significance of coefficients in a Negative Binomial GLM using the size and dispersion outputs

##Perform pairwise comparisons 
results_f_psnf <- results(dds, contrast=c("Treatment", "Father", "Pup_sensitized_non_father"))
results_f_psnf
summary(results_f_psnf) 

results_f_nf <- results(dds, contrast=c("Treatment", "Father", "Non_father"))
results_f_nf
summary(results_f_nf) 

results_nf_psnf <- results(dds, contrast=c("Treatment", "Non_father", "Pup_sensitized_non_father"))
results_nf_psnf
summary(results_nf_psnf) 

##Sort pairwise comparison results lists by adjusted p-value
sorted_padj_f_psnf <-results_f_psnf[order(results_f_psnf$padj),]
head(sorted_padj_f_psnf)

sorted_padj_f_nf <-results_f_nf[order(results_f_nf$padj),]
head(sorted_padj_f_nf)

sorted_padj_nf_psnf <-results_nf_psnf[order(results_nf_psnf$padj),]
head(sorted_padj_nf_psnf)

##Make dataframes of sorted adjusted p-values 
sorted_padj_f_psnf_df <- as.data.frame(sorted_padj_f_psnf)
sorted_padj_f_nf_df <- as.data.frame(sorted_padj_f_nf)
sorted_padj_nf_psnf_df <- as.data.frame(sorted_padj_nf_psnf)

###########################################################
########################## WGCNA ########################## 
###########################################################

#Goal: To predict networks of gene interactions and to identify RNA expression modules associated with caregiving in an unbiased approach. 


#Prerequisites
install.packages(c("matrixStats", "Hmisc", "splines", "foreach", "doParallel", "fastcluster", "dynamicTreeCut", "survival", "BiocManager"))
BiocManager::install(c("GO.db", "preprocessCore", "impute"))

orgCodes = c("Hs", "Mm", "Rn", "Pf", "Sc", "Dm", "Bt", "Ce", "Cf", "Dr", "Gg");
orgExtensions = c(rep(".eg", 4), ".sgd", rep(".eg", 6));
packageNames = paste("org.", orgCodes, orgExtensions, ".db", sep="");

BiocManager::install(c("GO.db", "KEGG.db", "topGO", packageNames, "hgu133a.db", "hgu95av2.db", "annotate", "hgu133plus2.db", "SNPlocs.Hsapiens.dbSNP.20100427", "minet", "OrderedList")) 

#Install WGCNA package and load
install.packages("BiocManager")
BiocManager::install("WGCNA") 
library(WGCNA)

#Setting string not as factor
options(stringsAsFactors = FALSE)

#Enable multithread
enableWGCNAThreads()

#Install and load necessary packages
install.packages("remotes")
remotes::install_github("kevinblighe/CorLevelPlot")

library(DESeq2)
library(tidyverse)
library(CorLevelPlot)
library(gridExtra)

#Load in data by manipulating FeatureCounts output files

# load FeatureCount output files
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

# delete every column besides Geneid and counts (last column)
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

# this is the raw count table that we need for DESeq2 analysis
data <- data.frame(cbind(IL63_2$IL63.A10_2_GCF.sam.sorted.bam,IL64_4$IL64.B10_4_GCF.sam.sorted.bam,
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

# giving the count table row and column names
rownames(data) <- IL63_2$Geneid
colnames(data) <- c("IL63_2","IL64_4","IL65_5","IL66_6","IL67_7","IL68_9","IL69_10","IL70_11",
                    "IL71_12","IL72_14","IL73_16","IL74_18","IL75_19","IL76_20","IL77_21",
                    "IL78_22","IL79_23","IL80_25","IL81_26","IL82_27","IL83_29","IL84_32",
                    "IL85_33","IL86_35")

#Load in meta data
metaData <- read.csv('Meta_data.csv', header = TRUE, sep = ",")
head(metaData)

#QC - outlier detection 

# detect outlier genes
gsg <- goodSamplesGenes(t(data))
summary(gsg)
gsg$allOK
table(gsg$goodGenes)
table(gsg$goodSamples)

# remove genes that are detected as outliers 
data <- data[gsg$goodGenes == TRUE,]

# detect outlier samples - hierarchical clustering (method 1)
htree <- hclust(dist(t(data)), method="average")
plot(htree)

# detect outlier samples - pca (method 2)
pca <- prcomp(t(data))
pca.dat <- pca$x

pca.var <- pca$sdev^2
pca.var.percent <- round(pca.var/sum(pca.var)*100, digits = 2)

pca.dat <- as.data.frame(pca.dat)

library(ggplot2)
ggplot(pca.dat, aes(PC1, PC2)) + 
  geom_point() + 
  geom_text(label = rownames(pca.dat)) +
  labs(x = paste0('PC1: ', pca.var.percent[1], ' %'),
       y = paste0('PC2: ', pca.var.percent[2], ' %'))

# from these, can remove samples distant from others because including them might skew results
# chose to remove IL85_33

# exclude outlier samples 
samples.to.be.excluded <- 'IL85_33'
data.subset <- data[,!(colnames(data) %in% samples.to.be.excluded)]

#Normalization 

# any normalized counts work as long as all are processed the same way because it's fundamentally based on correlation

# create a deseq2 dataset
metaData %>% remove_rownames %>% column_to_rownames(var="ID")
colData <- metaData[-23,] 
rownames(colData) <- colData$ID

# check that row names and column names are identical 
all(rownames(colData) %in% colnames(data.subset))
all(rownames(colData) == colnames(data.subset))

# create DESeq dataset (dds)
dds <- DESeqDataSetFromMatrix(countData = data.subset,
                              colData = colData,
                              design = ~1) # not specifying model because need dataset to perform variance stabilization 

# remove all genes with counts < 15 in more than 75% of samples (23*0.75=17.25)
# suggested by WGCNA on RNAseq FAQ
dds75 <- dds[rowSums(counts(dds) >= 15) >= 18,]
nrow(dds75) # 16,070 genes

# perform variance stabilization 
dds_norm <- vst(dds75)

# get normalized counts 
norm.counts <- assay(dds_norm) %>%
  t()

#Network construction 
# choose a set of soft-thresholding powers

power <- c(c(1:10), seq(from = 12, to = 50, by = 2))

# call the network topology analysis function 
sft <- pickSoftThreshold(norm.counts,
                         powerVector = power,
                         networkType = "signed",
                         verbose = 5)
sft.dat <- sft$fitIndices

# visualization to pick power
a1 <- ggplot(sft.dat, aes(Power, SFT.R.sq, label = Power)) +
  geom_point() +
  geom_text(nudge_y = 0.1) +
  geom_hline(yintercept = 0.8, color = 'red') +
  labs(x = 'Power', y = 'Scale free topology model fit, signed R^2') +
  theme_classic()

a2 <- ggplot(sft.dat, aes(Power, mean.k., label = Power)) +
  geom_point() +
  geom_text(nudge_y = 0.1) +
  labs(x = 'Power', y = 'Mean Connectivity') +
  theme_classic()

grid.arrange(a1, a2, nrow = 2)
# chose power of 7 for soft-threshold

# convert matrix to numeric 
norm.counts[] <- sapply(norm.counts, as.numeric)

soft_power <- 7
temp_cor <- cor
cor <- WGCNA::cor

# memory estimate w.r.t blocksize 
small_mod_bwnet <- blockwiseModules(norm.counts,
                                    maxBlockSize = 17000,
                                    TOMType = "signed",
                                    power = soft_power,
                                    mergeCutHeight = 0.15,
                                    numericLabels = FALSE,
                                    randomSeed = 1234,
                                    verbose = 3)

cor <- temp_cor

#Module Eigengenes
small_module_eigengenes <- small_mod_bwnet$MEs

# print out a preview
head(small_module_eigengenes)

# get number of genes for each module
table(small_mod_bwnet$colors)

#Plot the dendrogram and the module colors before and after merging
plotDendroAndColors(small_mod_bwnet$dendrograms[[1]], cbind(small_mod_bwnet$unmergedColors, small_mod_bwnet$colors),
                    c("unmerged", "merged"),
                    dendroLabels = FALSE,
                    addGuide = TRUE,
                    hang = 0.03,
                    guideHang = 0.05)

# binarize categorical variables for doing pairwise comparisons
traits2 <- colData %>%
  select(2)

colData$Treatment <- factor(colData$Treatment, levels = c("Non_father", "Pup_sensitized_non_father", "Father"))

treatment2.out <- binarizeCategoricalColumns(colData$Treatment,
                                             includePairwise = TRUE,
                                             includeLevelVsAll = FALSE,
                                             minCount = 1)

traits2 <- cbind(traits2, treatment2.out)

# define number of genes and samples
nSamples <- nrow(norm.counts)
nGenes <- ncol(norm.counts)

small_module.trait2.corr <- WGCNA::cor(small_module_eigengenes, traits2, use = 'p')
small_module.trait2.corr.pvals <- corPvalueStudent(small_module.trait2.corr, nSamples)

#Visualize module-trait association as a heatmap 
#Pairwise comparisons
small_heatmap2.dat <- merge(small_module_eigengenes, traits2, by = 'row.names')
head(small_heatmap2.dat)
small_heatmap2.dat <- small_heatmap2.dat %>%
  column_to_rownames(var = 'Row.names')

CorLevelPlot(small_heatmap2.dat,
             x = names(small_heatmap2.dat)[54:56],
             y = names(small_heatmap2.dat)[1:52],
             col = c("blue1", "skyblue", "white", "pink", "red"))

# determine what genes belong to specific modules
small_module.gene.mapping <- as.data.frame(small_mod_bwnet$colors)
small_module.gene.mapping %>%
  filter(small_mod_bwnet$colors == 'yellow') %>%
  rownames()

small_module.gene.mapping <- as.data.frame(small_mod_bwnet$colors)
small_module.gene.mapping %>%
  filter(small_mod_bwnet$colors == 'red') %>%
  rownames()

small_module.gene.mapping <- as.data.frame(small_mod_bwnet$colors)
small_module.gene.mapping %>%
  filter(small_mod_bwnet$colors == 'plum2') %>%
  rownames()

small_module.gene.mapping <- as.data.frame(small_mod_bwnet$colors)
small_module.gene.mapping %>%
  filter(small_mod_bwnet$colors == 'lightcyan1') %>%
  rownames()

small_module.gene.mapping <- as.data.frame(small_mod_bwnet$colors)
small_module.gene.mapping %>%
  filter(small_mod_bwnet$colors == 'steelblue') %>%
  rownames()

small_module.gene.mapping <- as.data.frame(small_mod_bwnet$colors)
small_module.gene.mapping %>%
  filter(small_mod_bwnet$colors == 'yellowgreen') %>%
  rownames()

small_module.gene.mapping <- as.data.frame(small_mod_bwnet$colors)
small_module.gene.mapping %>%
  filter(small_mod_bwnet$colors == 'grey60') %>%
  rownames()

small_module.gene.mapping <- as.data.frame(small_mod_bwnet$colors)
small_module.gene.mapping %>%
  filter(small_mod_bwnet$colors == 'black') %>%
  rownames()

small_module.gene.mapping <- as.data.frame(small_mod_bwnet$colors)
small_module.gene.mapping %>%
  filter(small_mod_bwnet$colors == 'purple') %>%
  rownames()

small_module.gene.mapping <- as.data.frame(small_mod_bwnet$colors)
small_module.gene.mapping %>%
  filter(small_mod_bwnet$colors == 'skyblue3') %>%
  rownames()

small_module.gene.mapping <- as.data.frame(small_mod_bwnet$colors)
small_module.gene.mapping %>%
  filter(small_mod_bwnet$colors == 'lightgreen') %>%
  rownames()

small_module.gene.mapping <- as.data.frame(small_mod_bwnet$colors)
small_module.gene.mapping %>%
  filter(small_mod_bwnet$colors == 'floralwhite') %>%
  rownames()

#correlation between gene modules and behavioral and neurophysiologic continuous data 
#cont_traits <- read.csv([change_to_appropriate_directory]/Pat_beh_den_spine.csv', header = TRUE)
cont_traits <- cont_traits[,-c(1,3)]
rownames(cont_traits) <- cont_traits[,1]
cont_traits <- cont_traits[, -1]

small_module.cont_trait.corr <- WGCNA::cor(small_module_eigengenes, cont_traits, use = 'p')
small_module.cont_trait.corr.pvals <- corPvalueStudent(small_module.cont_trait.corr, nSamples)

#Visualize module-trait association as a heatmap 
cont_heatmap.dat <- merge(small_module_eigengenes, cont_traits, by = 'row.names')
head(cont_heatmap.dat)
cont_heatmap.dat <- cont_heatmap.dat %>%
  column_to_rownames(var = 'Row.names')

CorLevelPlot(cont_heatmap.dat,
             x = names(cont_heatmap.dat)[53:57],
             y = names(cont_heatmap.dat)[1:52],
             col = c("blue1", "skyblue", "white", "pink", "red"))

# determine what genes belong to modules of interest
module.gene.mapping <- as.data.frame(small_mod_bwnet$colors)
module.gene.mapping %>%
  filter(small_mod_bwnet$colors == 'royalblue') %>%
  rownames()

module.gene.mapping <- as.data.frame(small_mod_bwnet$colors)
module.gene.mapping %>%
  filter(small_mod_bwnet$colors == 'white') %>%
  rownames()

module.gene.mapping <- as.data.frame(small_mod_bwnet$colors)
module.gene.mapping %>%
  filter(small_mod_bwnet$colors == 'plum2') %>%
  rownames()

module.gene.mapping <- as.data.frame(small_mod_bwnet$colors)
module.gene.mapping %>%
  filter(small_mod_bwnet$colors == 'grey60') %>%
  rownames()

module.gene.mapping <- as.data.frame(small_mod_bwnet$colors)
module.gene.mapping %>%
  filter(small_mod_bwnet$colors == 'black') %>%
  rownames()

**Paternal Care RNAseq Analysis**

This repository contains scripts and resources used for the RNAseq analysis related to paternal care in _Peromyscus californicus_ (California mouse). The pipeline includes steps for quality control, trimming, alignment, read counting, differential gene expression, and alternative splicing analysis.



**Repository Structure**
The repository is organized into the following scripts, which should be run sequentially to reproduce the analysis:



**Quality Control and Trimming:**

•	FastQC.sh: This script runs FastQC (version 0.11.9) to assess the quality of the raw RNAseq reads.

•	Trimmomatic.sh: This script uses Trimmomatic (version 0.39) to remove low-quality bases from the RNAseq reads.



**Alignment and Counting:**

•	Hisat2_Samtools.sh: This script aligns the reads to the Peromyscus californicus genome using HISAT2 (version 2.2.1) and processes the alignments with SAMtools.

•	FeatureCounts.sh: This script uses FeatureCounts (part of the Subread package, version 2.0.3) to count the number of reads that map to genomic features.



**Differential Gene Expression Analysis:**

•	DESeq2.R: An R script for differential expression analysis using DESeq2 (version 1.38.3). It constructs the DESeqDataSet object and performs pairwise comparisons between treatment groups.



**Alternative Splicing and Additional Analysis:**

•	6A.Index_rna_fna_kallisto.sh: Builds a kallisto index from the _P. californicus_ transcriptome.

•	6B.Align_example_kallisto.sh: Pseudoaligns RNAseq reads to the transcriptome using kallisto (version 0.46.2).

•	6C.HBA_DEALS_sim.R: Simulates data for the HBA-DEALS package.

•	6D.R_script_sim.sh: Runs the simulation R script for HBA-DEALS.

•	6E.HBA_DEALS_f_nf_example.R: Performs differential gene expression and alternative splicing analysis between specific treatment groups using the HBA-DEALS package (version 1.0).

•	6F.R_script_f_nf_example.sh: Executes the corresponding R script for analyzing father (f) and non-father (nf) datasets.



**Weighted Gene Co-expression Network Analysis:**

•	WGCNA.R: An R script for Weighted Gene Co-expression Network Analysis (WGCNA).



**Usage**

Execute the scripts in the order mentioned above. Make sure to adjust file paths and parameters as needed for your specific setup.



**Contact**

For any questions or issues with the repository, please contact mcolt@umd.edu.


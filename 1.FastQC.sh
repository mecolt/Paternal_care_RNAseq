#FastQC on raw RNA-seq reads in login node

module load fastqc
fastqc *.fastq.gz #Executed command on all .fastq.gz files in directory
mkdir FastQC_html_out #Directory to place FastQC .html files
cp *.html ./FastQC_html_out
zip -r FastQC_html_out.zip FastQC_html_out #Copied .html files into new directory and zipped files


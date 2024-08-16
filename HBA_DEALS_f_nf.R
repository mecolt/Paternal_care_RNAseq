library(hbadeals)

combined_tpm_variant_f_nf_ordered_nosingles=read.table('/scratch/zt1/project/fisher-lab/shared/HPC_trimmed_Fastq.gz/Trimmomatic_trimmed/HBA_DEALS/combined_tpm_variant_f_nf_ordered_nosingles.tsv',sep='\t',header=T)

labels=c(1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2)

res_f_nf=hbadeals(combined_tpm_variant_f_nf_ordered_nosingles,labels,parallel::detectCores(),mtc=TRUE)

saveRDS(res_f_nf, "res_f_nf.rds")
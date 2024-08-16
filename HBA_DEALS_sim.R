library(hbadeals)

simulate(rseed=1,fc=2,equal = TRUE)

n.samples=4

countsData=read.table('counts.txt',sep='\t',header=F)

labels=c(rep(1,n.samples),rep(2,n.samples))

res=hbadeals(countsData,labels,parallel::detectCores(),mtc=TRUE)

saveRDS(res, "res.rds")
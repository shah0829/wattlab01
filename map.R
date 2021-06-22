#import packages
library(dplyr)
library(tidyverse)
#input data
bed <- as.data.frame(read.table("HMM2.bed",header = FALSE, sep="\t",stringsAsFactors=FALSE, quote=""))
query <- as.data.frame(read.table("LD.txt", header = FALSE, sep = "\t", stringsAsFactors = FALSE, quote = ""))

#dplyr::between()
query$V1 <- factor(query$V1, levels = c("chr1", "chr2", "chr3", "chr4", "chr5", "chr6", "chr8", "chr18"))
#check wheather the values in coloumn are unique or not
table(duplicated(query$V3)) 
# if lenght of unique is equal to the no. of rows then no duplicated values.
length(unique(query$V3))

common = data.frame()
tem = data.frame()
for (i in 1:nrow(query)) {
  for (j in 1:nrow(bed)) {
    if(between(query$V3[i], left = bed$V2[j], right = bed$V3[j]) && query$V1[i]==bed$V1[j]){
      tem = cbind(query1[i,],bed[j,])
      common = rbind(common,tem)
    }
  }
}

write.csv(common, "common.csv", row.names = F, quote = F)

# --- extra info
#source("https://bioconductor.org/biocLite.R")
#biocLite("rtracklayer")
#library(rtracklayer)
#import("example.txt", format="bed")
# The import() function can be used to read most common bioinformatics format: bed, gtf, wig, bigwig, etc..
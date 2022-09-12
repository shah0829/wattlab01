#### checkMD5sum.R ####
setwd("~/Documents/megeil/data/miguel_P220195/wound/bsg-ftp.well.ox.ac.uk")
path = "~/Documents/megeil/data/miguel_P220195/wound/bsg-ftp.well.ox.ac.uk/"

datamd5sum <- read.delim(paste0(path, "datamd5sum.txt"), header=FALSE)
P220195.HKFTMDSX3.md5sum <- read.delim(paste0(path, "P220195-HKFTMDSX3-md5sum.txt"), header=FALSE)

md5_merge <- merge(P220195.HKFTMDSX3.md5sum, datamd5sum, by= "V1", all=TRUE, suffixes = c('.orignal', '.download'))

#to get how many files were not present/downloaded correctly
#sum(md5_merge$V2.orignal != md5_merge$V2.download, na.rm = TRUE)
length(setdiff(md5_merge$V2.orignal, md5_merge$V2.download))
# print the missing file info
md5_merge[which(md5_merge$V1 %in% setdiff(P220195.HKFTMDSX3.md5sum$V1, datamd5sum$V1)),]
missing_data <- md5_merge[is.na(md5_merge$V2.download), ]
# remove those files and check the md5 values for both downloadeda nd orignal samples.
filesdown <- list.files(path = '220822_A00711_0597_AHKFTMDSX3', pattern = "*.*")
filesdown <- list.files(path = '220822_A00711_0597_AHKFTMDSX3', pattern = "*.*")
filesdown <- filesdown[-1]# remove .sh
filesdown <- filesdown[-1] #remove .zip
#filesdown1<- filesdown[!which(filesdown %in% setdiff(P220195.HKFTMDSX3.md5sum$V1, datamd5sum$V1))]
#setdiff(filesdown$V2.orignal, filesdown$V2.download)
#function to check the files integrity.
checkFileIntegrity <- function (fn, omd5){
  # Calculate md5 of downloaded file
  file_path = paste0(path, '220822_A00711_0597_AHKFTMDSX3/', fq)
  download_md5 <- tools::md5sum(file_path)
  if (omd5 == download_md5)
    msg <- paste0("-","-")
  else
    message("File:", fq, "is not good \n")
  return(msg)
}

for (fq in filesdown) {
  # Confirm that file checksums match
  orignal_md5 <- md5_merge[which(md5_merge$V1 == fq),]$V2.orignal
  msg <- checkFileIntegrity(fq, orignal_md5)
  print(msg)
}

####-----coming soon part ----###

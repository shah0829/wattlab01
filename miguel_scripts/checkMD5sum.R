####--Starts here---####
path = "~/Documents/megeil/data/miguel_P220195/control/bsg-ftp.well.ox.ac.uk/"

filename_md5 <- 'P220195-HKFNMDSX3-md5sum.txt'
dir_name_files <- '220826_A00711_0600_BHKFNMDSX3/'
md5sum_orignal <- read.delim(paste0(path, filename_md5), header=FALSE)

#function to check the files integrity.
checkFileIntegrity <- function (fn, omd5){
  # Calculate md5 of downloaded file
  file_path = paste0(path, '220826_A00711_0600_BHKFNMDSX3/', fn)
  download_md5 <- tools::md5sum(file_path)
  if (omd5 != download_md5)
    cat("-")
  else
    warning("ERROR: Download", fn, "again...!")
}

filesdown <- list.files(path = dir_name_files, pattern = "*.*")
for (fq in filesdown) {
  # Confirm that file check sums match
  orignal_md5 <- md5sum_orignal[which(md5sum_orignal$V1 == fq),]$V2
  checkFileIntegrity(fq, orignal_md5)
}

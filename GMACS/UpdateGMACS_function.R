
UpdateGMACS <- function(){
  dirSrc <- paste0(getwd(), "/Dvpt_Version/")
  dirNew <- paste0(getwd(), "/Latest_Version/")
  
  # Copy all files from the Dvpt_Version to the Latest_Version
  
  cop.files <- list.files(dirSrc)[!list.files(dirSrc)%in%("build")]
  file.copy(from = file.path(dirSrc, c(cop.files)), to = dirNew, overwrite = TRUE, recursive = TRUE, copy.date = TRUE)
  
  stock.files <- list.files(paste(dirSrc, "build", sep=""))
  stock.files <- stock.files[!stock.files%in%c("debug","release")]
  
  if(!is.null(which(stock.files=="AIGKC")))
    stock.files <- c(stock.files[!stock.files%in%"AIGKC"], paste("AIGKC", list.files(paste(dirSrc, "build/AIGKC", sep="")), sep="/"))
  
  
  for (nm in 1:length(stock.files)){
    # delNew <- list.files(paste(dirNew, "build/", stock.files[nm], sep=""))
    # 
    # for(f in 1:length(delNew))
    #   unlink(paste(dirSrc, "build/", stock.files[nm],delNew[f], sep=""),recursive = TRUE, force = TRUE)
    # 
    
    
    tmp <- paste(dirSrc, "build/", stock.files[nm], sep="")
    nam <- read_GMACS.dat(path = paste(tmp, "/gmacs.dat", sep=""))
    file.copy(from = file.path(tmp, c(nam,"gmacs.dat" )), 
              to = paste(dirNew, "build/", stock.files[nm], sep=""), overwrite = TRUE, recursive = TRUE, copy.date = TRUE)
    
    
  }
}







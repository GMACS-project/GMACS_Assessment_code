
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
    
    # Clean the Latest_Version directory
    tmp <- paste(dirNew, "build/", stock.files[nm], sep="")
    term <- .CallTerm(command = "clean.bat", .Dir = tmp, verbose = FALSE)
    rstudioapi::terminalKill(id = term)
    
    # Clean the Dvpt_Version directory
    tmp <- paste(dirSrc, "build/", stock.files[nm], sep="")
    term <- .CallTerm(command = "clean.bat", .Dir = tmp, verbose = FALSE)
    rstudioapi::terminalKill(id = term)
    nam <- list.files(path = tmp)
    
    
    file.copy(from = file.path(tmp, nam), 
              to = paste(dirNew, "build/", stock.files[nm], sep=""), 
              overwrite = TRUE, recursive = TRUE, copy.date = TRUE)
  }
}







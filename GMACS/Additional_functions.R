#' @title MatchTable
#'
#' @description This function finds the lines in a table that matches strings
#'
#' @param Table Name of the table
#' @param Char1 First character string to matrix
#' @param Char2 Second character string to matrix
#' @param Char3 Third character string to matrix
#' @param Char4 Fourth character string to matrix
#' @param Char5 Fifth character string to matrix
#' @param Char6 Fifth character string to matrix
#'
#' @return vector of matching line indices
#' @export
#'
#' @examples
#' \dontrun{
#' }
#' 
MatchTable<-function(Table,Char1=NULL,Char2=NULL,Char3=NULL,Char4=NULL,Char5=NULL,Char6=NULL)
{
  ii <- rep(T,length(Table[,1]))
  if (!is.null(Char1)) ii <- ii & (Table[,1]==Char1)
  if (!is.null(Char2)) ii <- ii & (Table[,2]==Char2)
  if (!is.null(Char3)) ii <- ii & (Table[,3]==Char3)
  if (!is.null(Char4)) ii <- ii & (Table[,4]==Char4)
  if (!is.null(Char5)) ii <- ii & (Table[,5]==Char5)
  if (!is.null(Char6)) ii <- ii & (Table[,6]==Char6)
  ii <- seq(1:length(Table[,1]))[ii]
  if (length(ii) == 0) { cat("failed",Char1,Char2,Char3,Char4,Char5,Char6,"\n"); AAA }
  return(ii)
}


# Function to read specific values from gmacsallout
# Need to modify it to allow a vector of character to seach all variables
read.OUT <- function(file){
  D <-  read.table(file,comment.char = "#",fill=T,blank.lines.skip=T,stringsAsFactors=F,col.names=1:100)
  Out <- NULL
  
  MMB <- MatchTable(D,Char1="ssb"); MMB <- as.numeric(D[MMB+1,])
  Out$MMB <- MMB[which(is.na(MMB))[1]-1]
  spr_bmsy <- MatchTable(D,Char1="spr_bmsy"); spr_bmsy <- as.numeric(D[spr_bmsy+1,])
  Out$B35 <- spr_bmsy[!is.na(spr_bmsy)]
  sd_fmsy <- MatchTable(D,Char1="sd_fmsy"); sd_fmsy <- as.numeric(D[sd_fmsy+1,])
  Out$F35 <- sd_fmsy[!is.na(sd_fmsy)][1]
  sd_fofl <- MatchTable(D,Char1="sd_fofl"); sd_fofl <- as.numeric(D[sd_fofl+1,])
  Out$FOFL <- sd_fofl[!is.na(sd_fofl)][1]
  spr_cofl <- MatchTable(D,Char1="spr_cofl"); spr_cofl <- as.numeric(D[spr_cofl+1,])
  Out$OFL <- spr_cofl[!is.na(spr_cofl)]
  Nat.M <- MatchTable(D,Char1="M"); Nat.M <- as.numeric(D[Nat.M+1,])
  Out$M <- mean(Nat.M[!is.na(Nat.M)])
  Out$Status <- Out$MMB/Out$B35
  
  
  recruits <- MatchTable(D,Char1="recruits"); recruits <- as.numeric(D[recruits+1,])
  Out$recruits <- recruits[!is.na(recruits)]
  Out$Av_Recr <- mean(Out$recruits)/10000
  return(Out)
}






# Get file names without extension
get_nam <- function(filenames){
  tmp <- c()
  for(i in 1:length(filenames))
    tmp <- c(tmp, unlist(strsplit(filenames,"\\.")[[i]][1]))
  return(tmp)
}

# as.numeric()
an <- function(x){
  return(as.numeric(x))
}



# Editing documents using R
# This function adds specific text within a given document
addText <- function(path=NULL, add.text=NULL, spec.loc=NULL,
                    start.range=NULL, row.pos=NULL, col.pos=NULL, end.doc=NULL, id = NULL){
  
  if(spec.loc==TRUE && is.null(spec.loc)==FALSE){
    
    if(is.null(start.range)==FALSE){
      if(is.null(col.pos)==TRUE) {col.pos=1}
      end.range = c((start.range+length(add.text)-1),col.pos)
      range <- rstudioapi::document_range(start = start.range, end = end.range)
      rstudioapi::modifyRange(location = range, text = add.text,id = id)
    }
    
    if(is.null(row.pos)==FALSE  && is.null(col.pos)==FALSE){
      pos <- Map(c, row.pos:(row.pos+length(add.text)-1), col.pos)
      rstudioapi::insertText(pos, add.text,id = id)
    }
    
    if(is.null(end.doc)==FALSE && isTRUE(end.doc)){
      
      res <- tryCatch(length(readLines(path))+1, warning=function(w)w)
      if(inherits(res,"warning")) rstudioapi::insertText(c(Inf,2), text = " \n",id = id)
      
      
      pos1 <- length(readLines(path))+1
      pos <- Map(c, pos1:(pos1+length(add.text)-1), 1)
      rstudioapi::insertText(pos, add.text, id = id)
    }
    
    rstudioapi::documentClose(save = TRUE, id = id)
  }else{
    rstudioapi::insertText(text = paste0(add.text, "\n"), id = id)
    rstudioapi::documentClose(save = TRUE, id = id)
  }
}


# Insert Time and Date in the new gmacs.tpl compiled
insertTime <- function(object=NULL, pattern=NULL, update = NULL){
  header <- which(stringr::str_detect(object, pattern =pattern))
  object1 <- object[1:(header-1)]
  txt.header <- object[header]
  
  if(!update){
  txt.header <- sub("Compiled", "Previous compilation on: ", txt.header)
  txt.header <- sub('");', paste("; Last compilation on:  ", Sys.time(), '");' ,sep=""), txt.header)
  object <- c(object1, txt.header, object[(header+1):length(object)])
  } else {
    txt.header <- getVerGMACS()
    object <- list(header, txt.header)
  }
  return(object)
}


# Function to indicate the Version and compilation date of gmacbase.TPL when updating
getVerGMACS <- function (){
  New.ver <- NA
  
  while(is.na(New.ver)){
    text = "You've been modifying GMACS. Please, provide a name for the new version.\nIt should be similar to: 'Verison 2.01.A'"
    New.ver <- dlgInput(text, Sys.info())$res
    Sys.sleep(0.1)
  }
  # New.ver <- paste("'",New.ver,"'",sep = "")
  New.ver <- paste('!! TheHeader =  adstring("## GMACS ', New.ver, '; Compiled ',Sys.time(),'");', sep="")
  return(New.ver)
} 






# Function to write gmacs.TPL from gmacsbase.TPL and personal.TPL
write_TPL <- function(vv = vv, Dir = Dir, update = FALSE){
  
  gmacsbase <- paste0(Dir[vv], "gmacsbase.tpl")
  if(file.exists(gmacsbase)==FALSE) stop(cat("\ngmacsbase.tpl does not exist\n"))
  personal <- paste0(Dir[vv], "personal.tpl")
  if(file.exists(personal)==FALSE) stop(cat("\npersonal.tpl does not exist\n"))
  gmacs <- paste0(Dir[vv], "gmacs.tpl")
  fs::file_create(gmacs)

  if(update){
    add.text <- readLines(gmacsbase)
    unlink(gmacsbase, recursive = FALSE, force = FALSE)
    fs::file_create(gmacsbase)
    
    Insert <- insertTime(object = add.text, pattern = ' !! TheHeader', update = update)
    header <- Insert[[1]]
    txt.header <- Insert[[2]]

    fileConn<-file(gmacsbase)
    writeLines(text = paste0(c(add.text[1:(header-1)],txt.header, add.text[(header+1):length(add.text)]), collapse = "\n"), fileConn)
    close(fileConn)    
  }
  
  add.text <- readLines(gmacsbase)
  if(!update) add.text <- insertTime(object = add.text, pattern = ' !! TheHeader', update = update)
  add.text <- paste0(add.text, collapse = "\n")
  add.text <- c(add.text, "\n", "")

  add.text2 <- readLines(personal)
  add.text2 <- paste0(add.text2, collapse = "\n")
  add.text2 <- c(add.text2, "\n", "")

  fileConn<-file(gmacs)
  writeLines(text = paste0(c(add.text, add.text2), collapse = "\n"), fileConn)
  close(fileConn)

  cat("gmacs.tpl was created\n")
}






buildGMACS <- function (prefix, raneff = NULL, safe = NULL, dll = NULL, debug = NULL, 
                        logfile = NULL, add = NULL, verbose = NULL, pathfile = NULL, args = NULL)
{
  if (missing(prefix)) 
    stop("argument 'prefix' is missing, with no default")
  old_path <- Sys.getenv("PATH")
  on.exit(Sys.setenv(PATH = old_path))
  admbpath <- getOptions(atcall(.PBSadmb), "admbpath")
  ext <- ifelse(.Platform$OS.type == "windows", ifelse(file.exists(paste(admbpath, 
                                                                         "/bin/adlink.cmd", sep = "")), ".cmd", 
                                                       ".bat"), "")
  prog <- paste("adlink", ext, sep = "")
  if (is.null(getOptions(atcall(.PBSadmb), "admbver"))) 
    setADver(gccver = NULL)
  admbvernum = .version(getOptions(atcall(.PBSadmb), "admbver"))
  flags <- c()
  if (dll) 
    flags[length(flags) + 1] <- "-d"
  if (debug) 
    flags[length(flags) + 1] <- "-g"
  if (safe && admbvernum < 11) 
    flags[length(flags) + 1] <- "-s"
  if (!safe && admbvernum >= 11) 
    flags[length(flags) + 1] <- "-f"
  if (raneff) 
    flags[length(flags) + 1] <- "-r"
  flags <- paste(flags, collapse = " ")
  prefix <- paste(prefix, paste0(args, " ", collapse = ""), sep=" ") 
  cmd <- paste(prog, flags, prefix, sep = " ")
  if (.Platform$OS.type == "windows") 
    cmd = shQuote(cmd)
  .setPath(pathfile)
  if (logfile & !add) 
    startLog(prefix)
  if (verbose) 
    cat(cmd, "\n")
  
  out <- .callSys(cmd, wait = TRUE)
  out2 <- c(cmd, out)
  if (logfile) {
    appendLog(prefix, out2)
  }
  if (verbose) 
    cat(out, sep = "\n")
  invisible(out2)
  
  if(out2[6]=="Successfully built 'gmacs.exe'.")
    del <- c(dir(pattern= ".obj"), dir(pattern = ".cpp"), dir(pattern = ".htp"))
  file.remove(del)
  if(logfile==TRUE)
    file.remove(dir(pattern = ".txt"))
}





read_GMACS.dat <- function(path){
  tmp <- readLines(path)
  Inddat <- which(stringr::str_detect(tmp, "datafile"))
  namdat <- tmp[Inddat+1]
  Indctl <- which(stringr::str_detect(tmp, "controlfile"))
  namctl <- tmp[Indctl+1]
  Indprj <- which(stringr::str_detect(tmp, "projectionfile"))
  namprj <- tmp[Indprj+1]
  return(list(namdat, namctl, namprj))
}






GMACS_term <- function(command = "gmacs.exe", .Dir = NULL, verbose = NULL){
  termId <- rstudioapi::terminalExecute(command = command, workingDir = .Dir, show = verbose)
  return(termId)
}



Do_GMACS <- function(Spc = NULL,
                     GMACS_version = NULL,
                     ASS = NULL,
                     AssMod_names  = NULL,
                     Dir = NULL,
                     compile = NULL,
                     run = NULL,
                     LastAssDat = NULL,
                     ADMBpaths = NULL,
                     make.comp = NULL,
                     verbose = NULL){
  
  for(vv in 1:length(Dir)){
    
    cat("\n# ------------------------------------------------------------------- #\n")
    cat("# ------------------------------------------------------------------- #\n")
    cat("        Now building GMACS for the ", GMACS_version[vv]," \n")
    cat("# ------------------------------------------------------------------- #\n")
    cat("# ------------------------------------------------------------------- #\n")
    
    # vv <- 1
    
    # 1.Get an executable for GMACS ---- 
    
    # Check directories for ADMB
    suppressWarnings(PBSadmb::readADpaths(paste(dirname(Dir[vv]),ADMBpaths, sep="/")))
    if(!PBSadmb::checkADopts()) stop("The definition for the ADMB directories are wrong. Please check.")
    
    if(compile[vv]==1){
      # Clean directory from previous version
      setwd(Dir[vv])
      .callSys("clean_root.bat", wait = TRUE)
      
      #  Create gmacs.tpl from gmacsbase.tpl and personal.tpl
      cat("Now writing gmacs.tpl\n")
      write_TPL(vv, Dir = Dir, update = FALSE)
      # cat("\n")
      
      # Copy files from lib\
      libFiles <- dir(paste0(Dir[vv], "/lib/"), "*.cpp", ignore.case = TRUE, all.files = TRUE)
      file.copy(file.path(paste0(Dir[vv], "/lib/"), libFiles), Dir[vv], overwrite = TRUE)
      args <- get_nam(libFiles)
      
      # .tpl to .cpp
      cat("\nNow converting gmacs.tpl to gmacs.cpp ...\n")
      PBSadmb::convAD(prefix = "gmacs", pathfile = ADMBpaths, debug = TRUE, safe = TRUE, logfile = FALSE, verbose = FALSE)
      cat("OK after convertion from .tpl to .cpp ...\n")
      cat("\n")
      
      # Compile files
      compFiles <- c("gmacs", libFiles)
      for(nm in 1:length(compFiles)){
        cat("Now compiling ", compFiles[nm], "...\n")
        PBSadmb::compAD(prefix = compFiles[nm], pathfile = ADMBpaths, safe = TRUE, debug = TRUE, logfile = FALSE, verbose = FALSE)
      }
      cat("OK after compilation ...\n")
      
      # Build GMACS
      cat("\nNow building gmacs executable ...\n")
      buildGMACS(prefix = "gmacs", raneff = FALSE, safe = TRUE, dll = FALSE,
                 debug = TRUE, logfile = FALSE, add = FALSE, verbose = FALSE,
                 pathfile = NULL, args = args)
      cat("OK after building gmacs executable ...\n")
      setwd(dirname(Dir[vv])) 
      
    } else {
      if(!file.exists(paste0(Dir[vv], "gmacs.exe"))){
        stop(paste("no gmacs executable exists in the source directory:", Dir[vv],sep=" "),
             cat("\nPlease provide this repertory with an executable or allow for compilation
                                                                    (i.e. turn on 'compile')\n"))
      } else {
        cat("!!! GMACS has not been recompiled. !!! ")
        cat("\n")
        } 
      
      }

    # 2. Check directory existence, data availability and run GMACS----
    
    cat("\n# ------------------------------------------------------------------- #\n")
    cat("# ------------------------------------------------------------------- #\n")
    cat("#   Now realizing assessments for the ", GMACS_version[vv], "of GMACS \n")
    cat("# ------------------------------------------------------------------- #\n")
    cat("# ------------------------------------------------------------------- #\n")
    
    # build directory
    dirbuild <- paste(Dir[vv], "build/", sep="")
    if(!dir.exists(dirbuild)) dir.create(file.path(dirbuild), recursive = TRUE)
    if(!dir.exists(paste0(dirbuild, 'debug/'))) dir.create(file.path(paste0(dirbuild, 'debug/')), recursive = TRUE)
    if(!dir.exists(paste0(dirbuild, 'release/'))) dir.create(file.path(paste0(dirbuild, 'release/')), recursive = TRUE)
    
    id_term <- matrix(NA, nrow = length(Spc), ncol = 5)
    
    for(nm in 1:length(Spc)){
      # nm=1
      srcdir <- paste(dirname(getwd()), "/Assessment_data/", Spc[nm], sep = "")
      todir <- paste(Dir[vv], "build/", paste0(Spc[nm],"/"), sep="")    
      
      # Check if directory already exist
      if(!dir.exists(todir)){
        dir.create(file.path(todir), recursive = TRUE)
        cat("\nBuilding the following directory :\n",todir, "\nIt will hold data and run outputs for the assessment of :",Spc[nm],".\n", sep="")
      }
      
      if(LastAssDat){
        Filescop <- list.files(srcdir, full.names = TRUE)
        for(i in 1:length(Filescop)) file.copy(Filescop[i], to = todir, overwrite = TRUE)
        cat("Data for ", Spc[nm], " have been copied.\n")
      } else {
        if(file.exists(paste(todir, "gmacs.dat", sep=""))){
          nam <- read_GMACS.dat(path = paste(todir, "gmacs.dat", sep=""))
          tmp <- NULL
          for(f in 1:length(nam)){
           if(!file.exists(paste(todir, nam[f], sep=""))) tmp <- c(tmp,f)
         }
          if(!is.null(tmp))
            stop("The following file(s): ",paste0(unlist(nam[tmp]), sep = " "),"is/are missing in the ", todir, " directory.",sep="")
        } else {stop("There is no 'gmacs.dat' in the following directory :\n",
                     todir,"\nPlease provide this file and check for other files (.ctl, .dat, .prj) or allow data copy from the following directory:\n",srcdir)}
      }
      
      # Copy clean.bat and gmacs.exe to the repertories to run GMACS
      Excop <- paste0(Dir[vv], c("clean.bat", 'gmacs.exe'))
      file.copy(Excop, to = paste(Dir[vv], "build/", Spc[nm], sep=""), copy.date = TRUE, overwrite = TRUE, recursive = TRUE)
      
      if(nm == length(Spc)) cat("\nOK after copying all files ...\n")
    }
    
    # Run GMACS
    cat("\nNow entering assesments:\n")
    cat("\n")
      for(nm in 1:length(Spc)){
        cat("Starting assessment for:",Spc[nm], "\n")
        id <- GMACS_term(.Dir = paste(Dir[vv], "build/", Spc[nm], sep=""), verbose = verbose)
        id_term[nm,c(1:3)] <- c(Spc[nm], paste("Terminal", nm, sep="_"), id)
    } # end loop on Spc

    end_term <- "run"
    ct <- rep(NA, length(Spc))
    GMACS_OUT <- NULL
    
    while(end_term == "run"){
      
      Sys.sleep(0.1)
      
      for(nm in 1:length(Spc)){
        if(!is.null(rstudioapi::terminalExitCode(id_term[nm,3]))){
          id_term[nm,4] <- rstudioapi::terminalExitCode(id_term[nm,3])
          id_term[nm,5] <- "Done"
          if(id_term[nm,5] == "Done" && is.na(ct[nm])){
            ct[nm] <- nm
            cat("\nAssessment completed for :", Spc[nm],"\n")
            if(length(which(is.na(id_term[,4])))>0) cat("\n", length(which(is.na(id_term[,4])))," runs still in progress\n")
          }
        }
      }

      if(length(which(!is.na(id_term[,5])))>0 && length(which(id_term[,5]=="Done"))==length(Spc)){
        
        if(unique(id_term[,4]==0)){
          cat("\nAll assessment have been carried out.\n")
        } else {
          for(nm in 1:length(Spc)){
              eval(parse(text = paste(Spc[nm],'list()',sep="")))
              eval(parse(text = paste(Spc[nm],'_out<-terminalBuffer(id_term[',nm,',3], stripAnsi = FALSE)',sep="")))
              cat("\nSomething was wrong for : ", Spc[nm],". Please Check the output of the terminal in : GMACS_OUT$", Dir[vv], "$", 
                  Spc[nm],'_out', sep = "")
              # rstudioapi::terminalKill(id_term[nm,3])
          }
        }
        end_term <- "Done"
      }
    }
    
    if(!verbose){
      for(nm in 1:length(Spc)) rstudioapi::terminalKill(id_term[nm,3])
    } else {
      cat("\nTerminals are still open. Please take a look at them if necessary or close them.\n")
    }
    
    cat("\n# ----------------------------------------------------------------- #\n")
    cat("# ----------------------------------------------------------------- #\n")
    cat("              Version ", GMACS_version[vv], "done.\n")
    cat("# ----------------------------------------------------------------- #\n")
    cat("# ----------------------------------------------------------------- #\n")
    
    
    }# end loop on GMACS version
  
  if(!is.null(GMACS_OUT)) return(GMACS_OUT)
  
  if(make.comp) Do_Comp(Spc = Spc, GMACS_version = GMACS_version, ASS = ASS, AssMod_names  = AssMod_names,
                        Dir = Dir, compile = compile, run = run, LastAssDat = LastAssDat,
                        ADMBpaths = ADMBpaths, make.comp = make.comp, verbose = verbose)
  
}






Do_Comp <- function(Spc = NULL, GMACS_version = NULL, ASS = NULL, AssMod_names  = NULL,
                    Dir = NULL, compile = NULL, run = NULL, LastAssDat = NULL,
                    ADMBpaths = NULL, make.comp = NULL, verbose = NULL){
  
  # .MODELDIR <- Dir
  addDir <- matrix(data ="", nrow = length(Dir), ncol = length(Spc))
  base.file <- matrix(data ="", nrow = length(Dir), ncol = length(Spc))
  if(ASS){
    pat <- Dir[which(grep(pattern = "Assessments", x = Dir)==1)]
    Dir[!Dir==pat] <- paste(Dir[!Dir==pat], "build/", sep="")
    for(vv in 1:length(Dir)) if(Dir[vv]==pat) {addDir[vv,] <- paste("/", AssMod_names, sep="")}
  } else {
      Dir <- paste(Dir, "build/", sep="")
      # addDir <- rep("", length(Spc))
  }
  
  ScenarioNames <- GMACS_version
  
  # Check existence files
  ex.rep <- matrix(NA, nrow = length(Dir), ncol = length(Spc))
  Need.run <- 0
  for(vv in 1:length(Dir))
    for(nm in 1:length(Spc)){
      if(!file.exists(paste0(Dir[vv], Spc[nm], addDir[vv,nm],"/gmacs.rep")) && !file.exists(paste0(Dir[vv], Spc[nm], addDir[vv,nm], "/Gmacsall.OUT"))){
        ex.rep[vv,nm] <- 0
        Need.run <- 1
      }
      if(file.exists(paste0(Dir[vv], Spc[nm], addDir[vv,nm], "/Gmacsall.OUT"))) base.file[vv,nm] <- 0
      if(file.exists(paste0(Dir[vv], Spc[nm], addDir[vv,nm], "/gmacs.rep"))) base.file[vv,nm] <- 1
    }
  
  if(Need.run == 1 && !ASS){
    for(vv in 1:length(Dir))
      if(length(which(ex.rep[vv,]==0))>0) cat("gmacs.rep is missing for ", paste0(Spc[which(ex.rep[vv,]==0)], collapse = ", "), " for the ",GMACS_version[vv]," of GMACS.\n")
    do.run <- NA

    while(is.na(do.run)){
      text = "gmacs.rep is missing one or serveral version of GMACS for one or several species.
      \nPlease consider running GMACS for this/these version(s) and species so you can make a comparison.
      \nDo you want to run it now? (Y/N)\n"
      do.run <- dlgInput(text, Sys.info())$res
      # do.run <-readline(prompt="gmacs.rep is missing one or serveral vaersion of GMACS for one or several species.\n 
      #          Please consider running GMACS for this/these version(s) and species so you can make a comparison.\n
      #         Do you want to run it now? (Y/N)\n")
      Sys.sleep(0.1)
    }
    
    if(do.run == "Y"){
      
      GMACS_OUT <- Do_GMACS(Spc = Spc, GMACS_version = GMACS_version, ASS = FALSE, AssMod_names  = NULL, 
                            Dir = Dir, compile = compile, run = run, LastAssDat = LastAssDat,
                            ADMBpaths = ADMBpaths, make.comp = make.comp, verbose = verbose)
      Do_Comp(Spc = Spc, GMACS_version = GMACS_version, ASS = ASS, AssMod_names  = NULL,
              Dir = Dir, compile = compile, run = run, LastAssDat = LastAssDat,
              ADMBpaths = ADMBpaths, make.comp = make.comp, verbose = verbose)
      if(!is.null(GMACS_OUT)) return(GMACS_OUT)
      break()
    }
    stop("No comparison is made. The execution has been halted")
  }
  
  
  if(Need.run == 1 && ASS){
    for(vv in 1:length(Dir))
      if(length(which(ex.rep[vv,]==0))>0) cat("gmacs.rep is missing for ", paste0(Spc[which(ex.rep[vv,]==0)], collapse = ", "), " for the ",GMACS_version[vv]," of GMACS.\n")
    stop("No comparison is possible. ")
  }
  
  
  
  
  
  
  
  for(nm in 1:length(Spc)){
    # nm = 1
    
    cat("\n\n\\pagebreak\n")
    cat("\n\n\\#Comparaison of ", Spc[nm]," for ",length(Dir)," version of GMACS. \n")
    cat("\n\n\\                                                                 \n")
    cat("\n\n\\                                                                 \n")

        
    # cat("\n\n\\# This is the summary of management quantities for: ",Spc,"\n")
    

    Mfile <- unique(an(base.file))
    PlotTab <- data.frame(Model=ScenarioNames,
                          MMB=rep(0,length(ScenarioNames)),
                          B35=rep(0,length(ScenarioNames)),
                          F35=rep(0,length(ScenarioNames)),
                          FOFL=rep(0,length(ScenarioNames)),
                          OFL=rep(0,length(ScenarioNames)), 
                          Status=rep(0,length(ScenarioNames)),
                          M=rep(0,length(ScenarioNames)),
                          Av_Recr=rep(0,length(ScenarioNames)))
    
    
    
    
    
    if(Mfile==0 || length(Mfile)>1){
      
      # fn       <- ifelse(test = base.file[,nm]==0, paste0(Dir, Spc[nm], addDir[,nm], "/gmacsall.OUT"), paste0(Dir, Spc[nm], addDir[,nm],"/gmacs"))
      
      for(vv in 1:length(Dir)){
        
        M <- NULL
        
        if(base.file[vv,nm]==0){
          fn       <- paste0(Dir[vv], Spc[nm], addDir[vv,nm], "/gmacsall.out")
          M[[vv]] <- read.OUT(fn)
        } else {
          tmp <- NULL
          fn <- paste0(Dir[vv], Spc[nm], addDir[vv,nm],"/gmacs")
          tmp[[vv]] <- read_admb(fn)
          M[[vv]]$MMB <- tmp[[vv]]$ssb[length(tmp[[vv]]$ssb)]
          M[[vv]]$B35 <- tmp[[vv]]$spr_bmsy
          M[[vv]]$F35 <- tmp[[vv]]$sd_fmsy[1]
          M[[vv]]$FOFL <- tmp[[vv]]$sd_fofl[1]
          M[[vv]]$OFL <- tmp[[vv]]$spr_cofl
          M[[vv]]$Status <- M[[vv]]$MMB/M[[vv]]$B35
          M[[vv]]$M <- mean(tmp[[vv]]$M)
          M[[vv]]$Av_Recr <- mean(tmp[[vv]]$recruits)/10000

        }
        
        
        
        
        PlotTab$MMB[vv]<-M[[vv]]$MMB
        PlotTab$B35[vv]<-M[[vv]]$B35
        PlotTab$F35[vv]<-M[[vv]]$F35
        PlotTab$FOFL[vv]<-M[[vv]]$FOFL
        PlotTab$OFL[vv]<-M[[vv]]$OFL
        PlotTab$Status[vv]<- M[[vv]]$Status
        PlotTab$M[vv]<- M[[vv]]$M
        PlotTab$Av_Recr[vv]<-M[[vv]]$Av_Recr
      }
    }
    
    if(unique(an(base.file))==1){
      fn       <- paste0(Dir, Spc[nm], "/gmacs")
      M        <- lapply(fn, read_admb) #need .prj file to run gmacs and need .rep file here
      names(M) <- ScenarioNames
      for(x in 1:length(M))
      {
        PlotTab$MMB[x]<-M[[x]]$ssb[length(M[[x]]$ssb)]
        PlotTab$B35[x]<-M[[x]]$spr_bmsy
        PlotTab$F35[x]<-M[[x]]$sd_fmsy[1]
        PlotTab$FOFL[x]<-M[[x]]$sd_fofl[1]
        PlotTab$OFL[x]<-M[[x]]$spr_cofl
        PlotTab$Status[x]<- PlotTab$MMB[x]/PlotTab$B35[x]
        PlotTab$Nat.M[x]<- mean(M[[x]]$M)
        PlotTab$Av_Recr[x]<- mean(M[[x]]$recruits)/10000
      }
    }
    
    rownames(PlotTab)<- NULL
    PlotTab[,c(2:dim(PlotTab)[2])]<-round(PlotTab[,c(2:dim(PlotTab)[2])],3)
    print(kable(PlotTab[,1:dim(PlotTab)[2]],split.cells=c(25,rep(7,5)),justify=c("left",rep("center",5)),
          caption="\\label{stepchange}Changes in management quantities for each scenario considered.
        Reported management quantities are derived from maximum likelihood estimates."))
    # if(length(Spc)>1) cat("\n\n\\pagebreak\n")
  }
  return("Comparison done.")
}








GMACS <- function(Spc = "",
                  GMACS_version = '',
                  Dir = '',
                  ASS = FALSE,
                  AssMod_names  = "",
                  compile = FALSE,
                  run = FALSE,
                  LastAssDat = NULL,
                  ADMBpaths = "",
                  make.comp = FALSE,
                  verbose = FALSE){
  

  # Check consistency
  if(length(GMACS_version)!=length(Dir)) {
    cat("The number of directory does not match the number of version you specified\n");
    stop("Please give a directory for each version of GMACS you defined.")
  }
  
  if(make.comp && length(GMACS_version)==1){
    cat("You have specified only one version of GMACS - no comparison can be made.")
    stop("Provide several versions of GMACS that you wish to compare")
  }
  
  if(run && ASS){
    cat("You're attempting to run the last assessment and then make comparison. We suppose here that you don't need to run the\n
        last assessment.")
    stop("Please turn off the consideration of the last assessment if you want to run either old, current or new version of GMACS.\n
         You can use this script to make comparisons afterwords with the last evaluation but without running GMACS for the latter.")
  }
  
  
  # Set specific directories
  if(length(Spc)==1 && Spc=="all"){
    Spc <- grep(list.files(paste(dirname(getwd()), "/Assessment_data/", sep = "")),
                pattern='.bat', invert=TRUE, value=TRUE)
    nam.Spc <- sort(Spc)
    Spc <- Spc[order(match(Spc,nam.Spc))]
    
    if(which(Spc=="AIGKC")>0){
      # Spc[length(Spc)+1] <- paste(Spc[which(Spc=="AIGKC")],"/EAG",sep="")
      # Spc[which(Spc=="AIGKC")] <- paste(Spc[which(Spc=="AIGKC")],"/WAG",sep="")
      Spc <- c(paste(Spc[which(Spc=="AIGKC")],c("/EAG", "/WAG"),sep=""), Spc[-1])  
    }
  } 
  
  for(nm in 1:length(Spc)){
    if(Spc[nm] == "WAG" || Spc[nm]=="EAG") Spc[nm] <- paste0("AIGKC/", Spc[nm])
  }
  
  cat("\nThis analysis includes the following species:", paste0(Spc, collapse = ", "),"\n")
  cat("\n")
  
 if(run && !ASS){
   Do_GMACS(Spc = Spc, GMACS_version = GMACS_version, ASS = FALSE,
            AssMod_names  = NULL, Dir = Dir, compile = compile,
            run = run, LastAssDat = LastAssDat, ADMBpaths = ADMBpaths,
            make.comp = make.comp, verbose = verbose)
 } else {
   if(make.comp && !run)
     tables <- Do_Comp(Spc = Spc, GMACS_version = GMACS_version, ASS = ASS, 
                       AssMod_names  = AssMod_names, Dir = Dir, compile = compile, 
                       run = run, LastAssDat = LastAssDat, ADMBpaths = ADMBpaths,
                       make.comp = make.comp, verbose = verbose)
   # print(tables)
 }
}


















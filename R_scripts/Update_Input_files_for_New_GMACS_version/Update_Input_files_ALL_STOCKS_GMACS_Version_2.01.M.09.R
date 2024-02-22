# Script to re-write the GMACS input files used during the January 2023 CPT meeting
# We read the old input file format and set up the new one which explicitly 
# indicates options and terminology in those inout files.
# Author: Matthieu VERON
# Last update: February 2024

rm(list = ls(all.names = TRUE)) 

# 1. set up ----

fsep <- .Platform$file.sep

# Load packages
library(gmr)
library(magrittr)

# Set directories
dir_Base <- file.path(dirname(here::here()), "Assessment_data", fsep = fsep)
dir_TPL <- file.path(dirname(here::here()), "GMACS_versions", "Dvpt_Version", fsep = fsep)
Dir_Dvpt_Vers <- file.path(here::here(), "Dvpt_Version", fsep = fsep)

# 2. local functions ----
.an <- function(x){return(as.numeric(x))}
.ac <- function(x){return(as.character(x))}
.af <- function(x){return(as.factor(x))}

write_NewInputFiles <- function(stock = NULL, Ass_year = 2021){
  
  # Stock of interest and specification of model names ----
  if (stock == "EAG") {
    datfileName <- "EAG_21_1.dat"
    ctlfileName <- "EAG_21_1.ctl"
    prjfileName <- "EAG_21_1.prj"
    
    datfileName_New <- "EAG_21_1_M09.dat"
    ctlfileName_New <- "EAG_21_1_M09.ctl"
    prjfileName_New <- "EAG_21_1_M09.prj"
    
    model_name <- "model_21_1e"
    
  } else if (stock == "WAG") {
    datfileName <- "WAG_21_1.dat"
    ctlfileName <- "WAG_21_1.ctl"
    prjfileName <- "WAG_21_1.prj"
    
    datfileName_New <- "WAG_21_1_M09.dat"
    ctlfileName_New <- "WAG_21_1_M09.ctl"
    prjfileName_New <- "WAG_21_1_M09.prj"
    
    model_name <- "model_21_1e"
    
  } else if (stock == "SNOW_crab") {
    datfileName <- "snow_21.dat"
    ctlfileName <- "snow_21.ctl"
    prjfileName <- "snow_21.prj"
    
    datfileName_New <- "snow_21_M09.dat"
    ctlfileName_New <- "snow_21_M09.ctl"
    prjfileName_New <- "snow_21_M09.prj"
    
    model_name <- "model_21_g"
    
  } else if (stock == "BBRKC") {
    datfileName <- "bbrkc_21_1.dat"
    ctlfileName <- "bbrkc_21_1.ctl"
    prjfileName <- "bbrkc_21_1.prj"
    
    datfileName_New <- "bbrkc_21_1_M09.dat"
    ctlfileName_New <- "bbrkc_21_1_M09.ctl"
    prjfileName_New <- "bbrkc_21_1_M09.prj"
    
    model_name <- "model_21_1"
    
  } else if (stock == "SMBKC") {
    datfileName <- "sm_22.dat"
    ctlfileName <- "sm_22.ctl"
    prjfileName <- "sm_22.prj"

    datfileName_New <- "sm_22_M09.dat"
    ctlfileName_New <- "sm_22_M09.ctl"
    prjfileName_New <- "sm_22_M09.prj"

    model_name <- "model_16_0"

  }

  # gmacs.dat file ----
  # read gmacs.dat
  fileName <- "gmacs.dat"
  fileName <- file.path(dir_Base, stock, fileName, fsep = fsep)
  GMACSdat <- readGMACS.dat(path = fileName, verbose = TRUE)
  
  # Data file ----
  # Read the data file
  datFile <- file.path(dir_Base, stock, datfileName, fsep = fsep)
  datFile <- readGMACSdat(FileName = datFile, verbose = T)
  
  # Write the data file
  writeGmacsdatfile(Dir = file.path(dir_Base, stock, fsep = fsep),
                    FileName = datfileName_New, 
                    overwrite = TRUE, 
                    DatFile = datFile, 
                    stock = stock,
                    model_name = model_name, 
                    Ass_Year = Ass_year,
                    DirTPL = dir_TPL)
  # Check for reading the new data file
  # datFile <- readGMACSdat(FileName = file.path(dir_Base, stock, datfileName_New, fsep = fsep), verbose = T)
  
  # Control file ----
  # Read the control file
  ctlFile <- file.path(dir_Base, stock, ctlfileName, fsep = fsep)
  ctlFile <- readGMACSctl(FileName = ctlFile,
                          verbose = T, 
                          DatFile = datFile, 
                          nyrRetro = GMACSdat$N_Year_Retro)
  
  # Write the control file
  writeGmacsctlfile(Dir = file.path(dir_Base, stock, fsep = fsep),
                    FileName = ctlfileName_New, 
                    CtlFile = ctlFile, 
                    DatFile = datFile, 
                    stock = stock, 
                    model_name = model_name, 
                    Ass_Year = Ass_year,
                    DirTPL = dir_TPL)
  
  
  # Projection file ----
  # Read the projection file
  fileName <- file.path(dir_Base, stock, prjfileName, fsep = fsep)
  prjfile <-  readGMACSprj(FileName = fileName,verbose = TRUE)
  
  # Write the projection file
  writeGmacsprjfile(Dir = file.path(dir_Base, stock, fsep = fsep),
                    FileName = prjfileName_New,
                    PrjFile = prjfile,
                    stock = stock,
                    model_name = model_name, 
                    Ass_Year = Ass_year,
                    DirTPL = dir_TPL)
  
  # Write the new gmacs.dat file
  if(!file.exists(file.path(dir_Base, stock, "gmacs_old.dat", fsep = fsep))){
    # Rename the old file
    file.rename(from = file.path(dir_Base, stock, "gmacs.dat", fsep = fsep), 
                to = file.path(dir_Base, stock, "gmacs_old.dat", fsep = fsep))
    # Update the name of the input files
    GMACSdat$DatFileName <- datfileName_New
    GMACSdat$CtlFileName <- ctlfileName_New
    GMACSdat$PrjFileName <- prjfileName_New
    # Write the new file
    writeGmacs.dat(Dir = file.path(dir_Base, stock, fsep = fsep),
                   FileName = "gmacs.dat",
                   gmacsDat = GMACSdat,
                   stock = stock,
                   model_name = model_name,
                   Ass_Year = Ass_year,
                   DirTPL = dir_TPL)
  }
  
  return(paste0(stock, ": All the input files have been updated"))
}

# 3. Loop on stock to create the new files ---
stock_names <- c("EAG", "WAG", "SMBKC", "BBRKC", "SNOW_crab")
sapply(X = stock_names, FUN = write_NewInputFiles)

# 4. Copy the gmacs input files for each stock to the development version folder
for(nam in stock_names){
  copy_GMACSinputs(
    fromDir <- file.path(dir_Base, nam, fsep = fsep),
    toDir <- file.path(Dir_Dvpt_Vers, "build", nam, fsep = fsep),
    GMACS_files <- "all",
    overwrite <- TRUE
  )
}





# Script to run Gmacs in a specific folder

# Author: Matthieu VERON
# Last update: October 2024

rm(list = ls(all.names = TRUE))

# 1. set up ----

fsep <- .Platform$file.sep

# Load packages ----
library(gmr)
library(magrittr)

# Set directories ----
dir_test <- file.path(here::here(), "Testing_Versions")
dir_ADMBpath_Files <- here::here()

# Update the gmacs exe
Update_Exe <- FALSE

# Specify the version of Gmacs
Gmacs_Ver <- "Gmacs_2_10_05"

# Specify the stocks to be run
# Stocks <- c("Snow_crab")
# Stocks <- c("BBRKC")
# Stocks <- c("WAG")
Stocks <- c("all")

# Build the exe
gmacs_exe <- ifelse(isWindowsOS(), "gmacs.exe", "gmacs")
ADMBfile <- ifelse(isWindowsOS(),
                    "ADpaths_Windows.txt",
                    "ADpaths_MacOS.txt")
if(Update_Exe) {
  createGmacsExe(
    vv = 1,
    Dir = file.path(dir_test, Gmacs_Ver, fsep = fsep),
    ADMBpaths = file.path(dir_test, Gmacs_Ver, ADMBfile, fsep = fsep),
    verbose = TRUE
  )
}

# Run Gmacs
# Check the Maximum number of function calls and re write the file if applicable
# Gmacsdat <- readGMACS.dat(path = file.path(dir_test, Gmacs_Ver, "build", Stocks, "gmacs.dat"))
# Gmacsdat$StopAfterFnCall <- -1
# writeGmacs.dat(Dir = file.path(dir_test, Gmacs_Ver, "build", Stocks, fsep = fsep),
#                FileName = "gmacs.dat", gmacsDat = Gmacsdat,
#                stock = "SNOW_crab",
#                model_name = "model_21_g",
#                Ass_Year = "2021",
#                Ver_number = Gmacs_Ver)

clean_bat(path = file.path(dir_test, Gmacs_Ver, "build", Stocks, fsep = fsep))

res <- GMACS(
  Spc = Stocks,
  GMACS_version = "Gmacs_V2_10_05",
  Dir = file.path(dir_test, Gmacs_Ver, fsep = fsep),
  ASS = FALSE,
  compile = FALSE,
  run = TRUE,
  LastAssDat = FALSE,
  ADMBpaths = file.path(dir_test, Gmacs_Ver, fsep = fsep),
  make.comp = FALSE,
  cleanOut = FALSE,
  verbose = TRUE
)

# Read in all the output files
Gmacs_Snow <- getInpOutFiles(Dir = file.path(dir_test, Gmacs_Ver, "build", Stocks, fsep = fsep),
               verbose = TRUE)

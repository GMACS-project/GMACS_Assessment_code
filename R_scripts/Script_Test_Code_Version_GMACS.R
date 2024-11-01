# Script to compare different code version of Gmacs.

# Author: Matthieu VERON
# Last update: October 2024

rm(list = ls(all.names = TRUE))

# 1. set up ----

fsep <- .Platform$file.sep

# Load packages ----
library(gmr)
library(magrittr)

# Name of the folder in the Testing_Version folder of the version being developed
# Gmacs_Ver <-"Gmacs_2_10_01"
Gmacs_Ver <-"Gmacs_2_10_01"


# Set directories ----
Dir_Dvpt_Vers <- file.path(here::here(), "Dvpt_Version", "build", fsep = fsep)
dir_test <- file.path(here::here(), "Testing_Versions", Gmacs_Ver)
dir_InputFiles <- file.path(dirname(dir_test), "Stock_Input_files", Gmacs_Ver, fsep = fsep)
dir_Gmacs_Exe <- NULL

# 2. local functions ----

# 3. Write the new input files ----
# If Gmacs code implementations imply modifying the input files, then run the 
# write_Gmacs_InputFiles function to write the new input files. This probably 
# implies that you made the applicable modifications in the gmr package.

# Specify the stock input files names
# This also includes the model name (\code{model_name}) and the year of
# assessment (\code{Ass_year})
EAG <- list(
  datfileName_New = "EAG_21_1.dat",
  ctlfileName_New = "EAG_21_1.ctl",
  prjfileName_New = "EAG_21_1.prj",
  model_name = "model_21_1e",
  Ass_year = 2021
)
WAG <- list(
  datfileName_New = "WAG_21_1.dat",
  ctlfileName_New = "WAG_21_1.ctl",
  prjfileName_New = "WAG_21_1.prj",
  model_name = "model_21_1e",
  Ass_year = 2021
)
SNOW_crab <- list(
  datfileName_New = "snow_21.dat",
  ctlfileName_New = "snow_21.ctl",
  prjfileName_New = "snow_21.prj",
  model_name = "model_21_g",
  Ass_year = 2021
)
BBRKC <- list(
  datfileName_New = "bbrkc_21_1.dat",
  ctlfileName_New = "bbrkc_21_1.ctl",
  prjfileName_New = "bbrkc_21_1.prj",
  model_name = "model_21_1",
  Ass_year = 2021
)
SMBKC <- list(
  datfileName_New = "sm_22.dat",
  ctlfileName_New = "sm_22.ctl",
  prjfileName_New = "sm_22.prj",
  model_name = "model_16_0",
  Ass_year = 2021
)
# Make a list of these stock-specific lists
Stock_models <- list(
  EAG = EAG,
  WAG = WAG,
  SNOW_crab = SNOW_crab,
  BBRKC = BBRKC,
  SMBKC = SMBKC
)
# Write the stock input files ----
write_Gmacs_InputFiles(
  stock = c("EAG", "WAG", "SMBKC", "BBRKC", "SNOW_crab"),
  Stock_NameFiles = Stock_models,
  verbose = FALSE,
  dir_InputFiles = dir_InputFiles,
  dir_WriteFiles = NULL,
  CatchDF_format = NULL,
  SurveyDF_format = NULL,
  SizeFreqDF_format = NULL,
  cleanup = TRUE,
  dir_TPL = NULL,
  Gmacs_Version = Gmacs_Ver
)

# 4. Compare versions of Gmacs ----
Res <- CompareCodeVersion(
  stock = "all",
  dir_test = dir_test,
  dir_old_version = Dir_Dvpt_Vers,
  dir_Gmacs_Exe = dir_Gmacs_Exe,
  dir_InputFiles = dir_InputFiles,
  dir_OLD_Gmacs_Exe = NULL,
  Run_old_version = TRUE,
  usePin = TRUE,
  compareWithPin = FALSE,
  verbose = TRUE,
  Threshold = 1.0e-5,
  Clean_Files = TRUE
)

# 5. Update the stock input files ----
# This is needed to update the Gmacs version name and specifiy the date of last 
# compilation
write_Gmacs_InputFiles(
   stock = c("EAG", "WAG", "SMBKC", "BBRKC", "SNOW_crab"),
   Stock_NameFiles = Stock_models,
   verbose = FALSE,
   dir_InputFiles = dir_InputFiles,
   dir_WriteFiles = c(dir_InputFiles, dir_test),
   CatchDF_format = NULL,
   SurveyDF_format = NULL,
   SizeFreqDF_format = NULL,
   cleanup = TRUE,
   dir_TPL = NULL,
   Gmacs_Version = Gmacs_Ver
  )

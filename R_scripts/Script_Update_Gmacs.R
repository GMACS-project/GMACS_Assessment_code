# Script to update/upgrade Gmacs AFTER comparison of different code version.

# Author: Matthieu VERON
# Last update: October 2024

rm(list = ls(all.names = TRUE))

# 1. set up ----
fsep <- .Platform$file.sep

# Load packages ----
library(gmr)
library(magrittr)

# Name of the Testing_Version folder of the version being developed
Gmacs_Ver <- "Gmacs_2_10_01"

# Set directories ----
dir_test <- file.path(here::here(), "Testing_Versions", Gmacs_Ver)
dir_Last_Ver <- file.path(here::here(), "Latest_Version", "build", fsep = fsep)
dir_Ass_data <- file.path(dirname(here::here()), "Assessment_data", fsep = fsep)

# 2. local functions ----

# 3. Specify the stock input files names ----
# This also includes the model name ($model_name) and the year of
# assessment ($Ass_year)
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
# Make a list of these stock-specific lists ----
Stock_models <- list(
  EAG = EAG,
  WAG = WAG,
  SNOW_crab = SNOW_crab,
  BBRKC = BBRKC,
  SMBKC = SMBKC
)

# 4. Run the UpdateGMACS function ----
UpdateGMACS(
  stock = "all",
  dirSrc = dir_test,
  dirNew = dir_Last_Ver,
  dir_Assdata = dir_Ass_data,
  dir_Supp = file.path(here::here(), "Dvpt_Version", "build", fsep = fsep),
  ADMBpaths = NULL,
  UpdateInputFiles = TRUE,
  Stock_models_names = Stock_models,
  Update_LastAss_file = TRUE,
  UpdateLast_GmacsVer = TRUE,
  verbose = TRUE,
  cleanStockFolder = TRUE,
  cleanInputFiles = TRUE,
  cleanTest = TRUE
)

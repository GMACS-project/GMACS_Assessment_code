# Script to build the folder structure to develop a new version of Gmacs.
# This has to be used by developers when updating/upgrading Gmacs.
# This script builds the folders to develop a new version of Gmacs and provide 
# the input files that will be used to develop this new version. Input files can 
# be modified according to the implementation made in the Gmacs code.

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
dir_old_version <- file.path(here::here(), "Dvpt_Version", fsep = fsep)
dir_LastAss_Files <- file.path(dirname(here::here()), "Assessment_data", fsep = fsep)
dir_Version_Files <- file.path(here::here(), "Testing_Versions", "Stock_Input_files","Gmacs_2_10_01", fsep = fsep)
dir_ADMBpath_Files <- here::here()

# 2. local functions ----

# Specification for building the structure
stock <-  "all"
use_LastAss_Files <- TRUE
use_Version_Files <- FALSE
new_Ver_ID <- NULL
verbose <- TRUE

# Run the function to set up the folder structure
set_DevStruct(
  stock = stock,
  ADMBpaths = dir_ADMBpath_Files,
  dir_test = dir_test,
  dir_old_version = dir_old_version,
  use_LastAss_Files = use_LastAss_Files,
  dir_LastAss_Files = dir_LastAss_Files,
  use_Version_Files = use_Version_Files,
  dir_Version_Files = dir_Version_Files,
  new_Ver_ID = new_Ver_ID,
  verbose = verbose
)

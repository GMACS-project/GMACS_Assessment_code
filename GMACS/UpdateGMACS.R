

# Set your credential----
# ------------------------------------------------------------------- #
.pack <- "gmr"
.DirSrc <- "GMACS-project/gmr"
.Username <- ""                     # the name of your Github
.UserEmail<- ""        # Your email address associated to your Github account

# Remove the package if you already got it installed on your computer
remove.packages(.pack, lib="~/R/win-library/4.1")

# Set config
usethis::use_git_config(user.name = .Username, user.email = .UserEmail)

# Go to github page to generate token
usethis::create_github_token() 

# Paste your PAT into pop-up that follows...
credentials::set_github_pat()

# Now remotes::install_github() will work
devtools::install_github(.DirSrc)
# ------------------------------------------------------------------- #

rm(list=ls())     # Clean your R session

# Set the working directory as the directory of this document----
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
# check your directory
getwd()

# Install and load the packages----
# Get installed devtools to be able to install the gmr package----
install.packages("devtools")                      # install devtools
devtools::install_github("GMACS-project/gmr")       # install devtools

# Install and load the packages----

library(gmr)
# install.packages("miceadds")                      # install miceadds
library(miceadds)
# install.packages("PBSadmb")
library(PBSadmb)
# install.packages("knitr")                         # install knitr
library(knitr)
# install.packages("svDialogs")                     # install svDialogs
library(svDialogs)

# Source additionnal functions
source("Additional_functions.R")
source("GetGmacsExe.R")


# compile and build GMACS----
# Define the name of the file containing the different pathways needed to build
# the GMACS executable 
.ADMBpaths <- "ADpaths.txt"

# Run the GetGmacsExe function
GetGmacsExe()

# Run the development version----

# Species of interest
.Spc <-c(
  "SNOW_M_time_varying"
)

# Names of the GMACS version to consider
.GMACS_version <- c(
  "Dvpt_Version"
)

# Define directories
.VERSIONDIR <- c(
  paste0(getwd(), "/Dvpt_Version/")
)

# Need to conpile the model?
# vector of length(.GMACS_version)
# 0: GMACS is not compiled. This assumes that an executable exists in the directory of the concerned version.
# 1: GMACS is compiles
.COMPILE <- 0       # You already compile and build the executable

# Run GMACS
.RUN_GMACS <- TRUE

# Use latest available data for the assessment?
.LastAssDat <- TRUE

# Define the directories for ADMB
.ADMBpaths <- "ADpaths.txt"

# Show Rterminal
.VERBOSE <- TRUE

# Compare the development version and the latest assessment----

# Names of the GMACS version to consider for run
.GMACS_version <- c(
  "Last_Assessment",
  "Latest_Version"
)

# Define directory
.VERSIONDIR <- c(
  paste0(dirname(getwd()), "/Assessments/"),
  paste0(getwd(), "/Latest_Version/")
)

# Run GMACS
.RUN_GMACS <- FALSE

# Use Last Assessment for comparison?
# If yes, you must provide the names of the model for each species in the variable .ASSMOD_NAMES
# Those model folder must have to be hold in the folder Assessments
.ASS <- TRUE

# names of the model for the last assessment - Only useful if comparison is made.
# if all stocks are considered they have to be ordered as follow:
# "AIGKC/EAG" / "AIGKC/WAG" / "BBRKC" / "SMBKC" / "SNOW"
.ASSMOD_NAMES <- "model_21_g"

# Do comparison?
.MAKE_Comp <- TRUE



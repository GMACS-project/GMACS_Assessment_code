# I- Install/Update gmr and load packages ----

rm(list = ls())     # Clean your R session

# Set the working directory as the directory of this document
# setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# check your directory
getwd()

# Install and load the packages

# 1.Install devtools and gdata on your machine
if (!require("devtools")) {
  # install devtools
  install.packages("devtools")
}

if (!require("gdata")) {
  # needed to manipulate data
  install.packages("gdata")
}

# 2. Install / update gmr package
Src <- "GMACS-project/gmr"
# Get the latest version of gmr? (0: no; 1: install for the first time; 2: update the package)
Update <-
  0
# the library directory to remove the gmr package from
mylib <-
  "~/R/win-library/4.1"

#  remotes::install_github() will work to install gmr on your machine
if (Update == 1)
  devtools::install_github(Src)

# Updating to the latest version of gmr
if (Update == 2) {
  remove.packages("gmr", lib = mylib)
  devtools::install_github(Src)
}

# Load the gmr package
library(gmr)
# -----------------------------------------------------------


# II- Compile and build GMACS ----

# Define the name of the file containing the different pathways needed to build
# the GMACS executable - (here we are working with windows)
ADMBpaths <- "ADpaths_Windows.txt"

# Run the GetGmacsExe function
.GetGmacsExe(ADMBpaths = ADMBpaths)
# -----------------------------------------------------------


# III- Run the development version ----

# Define the working directories
# Set the working directories:
Dir_Dvpt_Vers <- file.path(getwd(), "Dvpt_Version")
# Dir_Last_Vers <- file.path(getwd(), "Latest_Version")

# Stock of interest - Here we are going to test all stocks
Spc <-c(
  "all"
)

# Names of the GMACS version to consider - Here we simply call it "Dvpt_Version"
GMACS_version <- c(
  "Dvpt_Version"
)

# Define directories
VERSIONDIR <- Dir_Dvpt_Vers

# Use Last Assessment for comparison?
# If yes, you must provide the names of the model(s) you want to consider for 
# comparison for each stock in the variable .ASSMOD_NAMES. 
# Those models folders must have to be hold in the "Assessments" folder of 
# the GMACS_Assessment_code repository.
ASS <- FALSE

# Do ou need to compile GMACS?
# vector of length(.GMACS_version)
# 0: GMACS does not need to be compiled. This assumes that an executable exists in the directory of the concerned version.
# 1: GMACS needs to be compiled
COMPILE <- 0       # You already compile and build the executable

# Run GMACS - Yes we want to get an assessment for each stock
RUN_GMACS <- TRUE

# Use latest available data for the assessment?
# If TRUE, the model will be using the input files available in the "Assessment_data"
# folder of the GMACS_Assessment_code repository. 
# Remind that if you implemented a version in which you made modifications on the
# input files (either the .ctl, .dat, or .prj files) you don't want to use the 
# original files because it won't work.
LastAssDat <- FALSE

# Define the directories for ADMB (if not already declared before)
ADMBpaths <- "ADpaths_Windows.txt"

# Show Rterminal - Do you want to see what is going on? (similar to verbose <- TRUE)
VERBOSE <- TRUE

# Do comparison? - This is not the topic right now
MAKE_Comp <- FALSE

#  ===================================== #
#  ===================================== #
res <- GMACS(
  Spc = Spc,
  GMACS_version = GMACS_version,
  Dir = VERSIONDIR,
  ASS = ASS,
  compile = COMPILE,
  run = RUN_GMACS,
  LastAssDat = LastAssDat,
  ADMBpaths = ADMBpaths,
  make.comp = MAKE_Comp,
  verbose = VERBOSE
)
# -----------------------------------------------------------


# IV- Compare the development version and the latest assessment ----

# Names of the GMACS version to consider for run
GMACS_version <- c(
  "Last_Assessment",
  "Dvpt_Version"
)

# Define directory
Dir_Assess <- file.path(dirname(getwd()), "Assessments")
VERSIONDIR <- c(
  Dir_Assess,
  Dir_Dvpt_Vers
)


# Need to conpile the model?
# vector of length(.GMACS_version)
# 0: GMACS is not compiled. This assumes that an executable exists in the directory of the concerned version.
# 1: GMACS is compiles
COMPILE <- c(0,0)       # You already compile and build the executable

# Run GMACS - Runs have already been done
RUN_GMACS <- FALSE

# Species
Spc <- c('EAG', 'WAG',
         'BBRKC',
         'SMBKC',
         'SNOW_crab')



# Use Last Assessment for comparison?
# If yes, you must provide the names of the model for each species in the variable .ASSMOD_NAMES
# Those model folder must have to be hold in the folder Assessments
ASS <- TRUE

# names of the model for the last assessment - Only useful if comparison is made.
# if all stocks are considered they have to be ordered as follow:
# "AIGKC/EAG" / "AIGKC/WAG" / "BBRKC" / "SMBKC" / "SNOW"
ASSMOD_NAMES <- c('model_21_1e', 'model_21_1e',
                  'model_21_1',
                  'model_16_0',
                  'model_21_g')

# Do comparison?
MAKE_Comp <- TRUE

#  ===================================== #
#  ===================================== #
tables <- GMACS(Spc = Spc, 
                GMACS_version = GMACS_version,
                Dir = VERSIONDIR,
                compile = COMPILE,
                ASS = ASS,
                AssMod_names = ASSMOD_NAMES,
                run = RUN_GMACS,
                make.comp = MAKE_Comp)
# -----------------------------------------------------------


# V- Update GMACS ----
# Use the UpdateGMACS function to copy and paste the last files in the Latest_Version
# directory
UpdateGMACS()
# -----------------------------------------------------------

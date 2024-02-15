# Script to run the stock assessment models using gmr.
# Author: Matthieu VERON
# Last update: February 2024

rm(list = ls(all.names = TRUE)) 

# 1. set up ----

fsep <- .Platform$file.sep

# Load packages
library(gmr)
library(magrittr)

# Set directories
Dir_Dvpt_Vers <- file.path(here::here(), "Dvpt_Version")
Dir_Last_Vers <- file.path(here::here(), "Latest_Version")


# 2. Compile and build GMACS ----

# Define the name of the file containing the different pathways needed to build
# the GMACS executable - The ADpaths_Windows.txt file has to be used for windows
# machine and the ADpaths_MacOS.txt for Linux-like machine (including MacOS)
# /!\ his file need to be modified so the paths will fit to your machine
ADMBpaths <- ifelse(.Platform$OS.type == "windows",
                    "ADpaths_Windows.txt",
                    "ADpaths_MacOS.txt")

# Now run the createGmacsExe() function to get the executable for the
# latest version (if applicable)
createGmacsExe(
  vv = 1,
  Dir = c(Dir_Dvpt_Vers, Dir_Last_Vers),
  verbose = FALSE,
  ADMBpaths = ADMBpaths
)

# 3. Run the development version ----

# Define the working directories

# Stock of interest - Here we are going to test all stocks
# Vector of character string
# For one stock in particular (e.g., EAG), use the following command:

# Stock <-"all"
Stock <-"EAG"
# Stock <-"BBRKC"
# Stock <-"SMBKC"
# Stock <-"WAG"
# Stock <-"SNOW_crab"


# Names of the GMACS version to consider
# Character string
# Here we focus on the development version ("Dvpt_Version")
GMACS_version <- c(
  "Dvpt_Version"
)

# Define directories (path to the version you are working on)
# Character string 
VERSIONDIR <- Dir_Dvpt_Vers

# Use Last Assessment for comparison?
# Logical
# If yes, you must provide the names of the model(s) you want to consider for 
# comparison for each stock in the variable named ASSMOD_NAMES. 
# Those models folders must have to be hold in the "Assessments" folder of 
# the GMACS_Assessment_code repository.
ASS <- FALSE

# Do ou need to compile GMACS?
# vector of interger of length(.GMACS_version)
# 0: GMACS does not need to be compiled. This assumes that an executable exists in the directory of the concerned version.
# 1: GMACS needs to be compiled
COMPILE <- 0       # You already compile and build the executable

# Run GMACS
# Logical
# Here, we want to get an assessment for each stock
RUN_GMACS <- TRUE

# Use latest available data for the assessment?
# Logical
# If TRUE, the model will be using the input files available in the "Assessment_data"
# folder of the GMACS_Assessment_code repository. 
# Remind that if you implemented a version in which you made modifications on the
# input files (either the .ctl, .dat, or .prj files) you don't want to use the 
# original files because it won't work.
LastAssDat <- FALSE

# Show Rterminal
# Do you want to see what is going on? (similar to verbose <- TRUE)
# Logical
VERBOSE <- TRUE

# Do comparisons?
# Logical
# This is not the topic right now
MAKE_Comp <- FALSE

# Do you want to clean the repertory after the run 
# This remove most of the output files from ADMB
# cleanPath <- TRUE

#  ===================================== #
#  ===================================== #
res <- GMACS(
  Spc = Stock,
  GMACS_version = GMACS_version,
  Dir = VERSIONDIR,
  ASS = ASS,
  compile = COMPILE,
  run = RUN_GMACS,
  LastAssDat = LastAssDat,
  ADMBpaths = ADMBpaths,
  make.comp = MAKE_Comp,
  verbose = VERBOSE,
  cleanOut = TRUE
)

# 4. Compare the development version and the latest assessment ----

# Names of the GMACS version to consider for run
# Here we want comparison between the development version and the latest version of GMACS

# Name the GMACS version you want to consider for the comparison
# Vector of character string
GMACS_version <- c(
  # "Last_Assessment",
  "Dvpt_Version",
  "Latest_Version")

# Define directory
# Vector of path directory
VERSIONDIR <- c(
  # Dir_Assess,
  Dir_Dvpt_Vers,
  Dir_Last_Vers)


# Need to conpile the model?
# vector of interger of length(.GMACS_version)
# 0: GMACS is not compiled. This assumes that an executable exists in the directory of the concerned version.
# 1: GMACS is compiles
# COMPILE <- c(0,0,0)       # You already compile and build the executable
COMPILE <- c(0,0) 

# Run GMACS - Runs have already been done
# Logical
# Here, we already have assessment outputs for each stock
RUN_GMACS <- FALSE


# Stock of interest - Here we are going to test all stocks
# Vector of character string
# For one stock in particular (e.g., EAG), use the following command:
# Stock <-c(
#   "EAG"
# )
Stock <-c(
  "SNOW_crab"
)

# Use Last Assessment for comparison?
# Logical
# If yes, you must provide the names of the model(s) you want to consider for 
# comparison for each stock in the variable named ASSMOD_NAMES. 
# Those models folders must have to be hold in the "Assessments" folder of 
# the GMACS_Assessment_code repository.
ASS <- FALSE

# names of the model for the last assessment
# Only useful if comparison is made.
# Vector of character string
# If all stocks are considered they have to be ordered as follow:
# "AIGKC/EAG" / "AIGKC/WAG" / "BBRKC" / "SMBKC" / "SNOW"
ASSMOD_NAMES <- c(#'model_21_1e',
                  # 'model_21_1e',
                  # 'model_21_1',
                  # 'model_16_0',
                  'model_21_g'
                  )

# Do comparisons?
# Logical
MAKE_Comp <- TRUE

#  ===================================== #
#  ===================================== #

# The results of the comparisons are in a list form and stored in the
# "tables" object
# ----------------------------------------------------- #

tables <- GMACS(Spc = Stock, 
                GMACS_version = GMACS_version,
                Dir = VERSIONDIR,
                compile = COMPILE,
                ADMBpaths = ADMBpaths,
                ASS = ASS,
                AssMod_names = ASSMOD_NAMES,
                run = RUN_GMACS,
                make.comp = MAKE_Comp)

# The table variable is a named list where the first argument of this
# list is the name of each stock:
names(tables)

# Then the second level of arguments corresponds to each 
# version of GMCAS / model you want to compare:
names(tables$EAG)

# Finally the last level of this list is the values of management 
# quantities that are used for comparison.
# MMB | B35 | F35 | FOFL | OFL | Status | M | Av_Recr
names(tables$EAG$Dvpt_Version)

# -----------------------------------------------------------



# 5. Plot the outputs from different versions/models----

# Stock of interest
# Stock <- c("EAG","WAG")
Stock <- "EAG"


# Names of the version(s) to consider
model_name <- c(
  "Version 2.01.L04", # LATEST VERSION
  "Version 2.01.M" # Development version
)

# Directory of this(ese) version(s)
Dir = c(Dir_Last_Vers, Dir_Dvpt_Vers)


# Options to save the outputs
# If Stock="all', provide the directory where to save plots for each stock
# in the same order as they appear when using the list.files() function
# in the "build" directory
# list.files(file.path(Dir_Dvpt_Vers,"build"))

# Dir.out <- file.path(Dir_Dvpt_Vers, "build", Stock)
Dir.out <- c(file.path(Dir_Dvpt_Vers, "build", "BBRKC"),
             file.path(Dir_Dvpt_Vers, "build", "EAG"),
             file.path(Dir_Dvpt_Vers, "build", "SMBKC"),
             file.path(Dir_Dvpt_Vers, "build", "SNOW_crab"),
             file.path(Dir_Dvpt_Vers, "build", "WAG")
)

# Save the plot? 
save <- TRUE
# Which format ?
out.format <- 'pdf'

plot_basicOutput(Stock = Stock,
                 Dir = Dir,
                 model_name = model_name,
                 save.out = save,
                 Dir.out = Dir.out,
                 out.format = out.format)
Mgt_table


# If you are satisfied with the results of the comparison between these two 
# versions of GMACS, you are now ready to formalize and submit this new version 
# to spread it to the community.

# The first step before submitting your new version on GitHub is to update the 
# [Latest_Version] folder with the new code of GMACS.
# Luckily and for the sake of efficiency and transparency, you don't have to 
# do anything by hand. 

# The `UpdateGMACS()` function allows you to:

# i) Copy and paste all the files you used for the GMACS development version to the [Latest_Version] folder
# ii) Compile this new release version in the [Latest_Version] folder and get everything ready to use it
UpdateGMACS(dirSrc = Dir_Dvpt_Vers,
            dirNew = Dir_Last_Vers)





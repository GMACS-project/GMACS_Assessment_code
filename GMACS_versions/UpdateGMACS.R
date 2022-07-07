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

# 1.Install devtools and gdata on your machine ----
if (!require("devtools")) {                        # install devtools
  install.packages("devtools")
}

if (!require("gdata")) {                        # needed to manipulate data
  install.packages("gdata")
}

# 2. Install / update gmr package ----
.Src <- "GMACS-project/gmr"
.Update <- 0                            # Get the latest version of gmr? (0: no; 1: install for the first time;
                                        # 2: update the package)
mylib <- "~/R/win-library/4.1"          # the library directory to remove the 
# gmr package from

#  remotes::install_github() will work to install gmr on your machine
if(.Update == 1) devtools::install_github(.Src)


# Updating to the latest version of gmr
if(.Update == 2){
  remove.packages("gmr", lib=mylib)
  devtools::install_github(.Src)
} 


# Load the gmr package
library(gmr)


# I- compile and build GMACS----

# Define the name of the file containing the different pathways needed to build
# the GMACS executable 
.ADMBpaths <- "ADpaths.txt"

# Run the GetGmacsExe function
.GetGmacsExe()



# II- Run the development version----

# Species of interest
.Spc <-c(
  "SNOW_crab"
)

# Names of the GMACS version to consider
.GMACS_version <- c(
  "Dvpt_Version"
)

# Define directories
.VERSIONDIR <- c(
  paste0(getwd(), "/Dvpt_Version/")
)

# Use Last Assessment for comparison?
# If yes, you must provide the names of the model for each species in the variable .ASSMOD_NAMES
# Those model folder must have to be hold in the folder Assessments
.ASS <- FALSE

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
.VERBOSE <- FALSE

# Do comparison?
.MAKE_Comp <- FALSE


# Run GMCS dvpt_version
res <- GMACS(
  Spc = .Spc,
  GMACS_version = .GMACS_version,
  Dir = .VERSIONDIR,
  ASS = .ASS,
  compile = .COMPILE,
  run = .RUN_GMACS,
  LastAssDat = .LastAssDat,
  ADMBpaths = .ADMBpaths,
  make.comp = .MAKE_Comp,
  verbose = .VERBOSE
)





# III- Compare the development version and the latest assessment----

# Names of the GMACS version to consider for run
.GMACS_version <- c(
  "Last_Assessment",
  "Dvpt_Version"
)

# Define directory
.VERSIONDIR <- c(
  paste0(dirname(getwd()), "/Assessments/"),
  paste0(getwd(), "/Dvpt_Version/")
)

# Need to conpile the model?
# vector of length(.GMACS_version)
# 0: GMACS is not compiled. This assumes that an executable exists in the directory of the concerned version.
# 1: GMACS is compiles
.COMPILE <- c(0,0)       # You already compile and build the executable

# Run GMACS
.RUN_GMACS <- FALSE

# Species
.Spc <- c('EAG', 'WAG',
          'BBRKC',
          'SMBKC',
          'SNOW_M_time_varying')

# Use Last Assessment for comparison?
# If yes, you must provide the names of the model for each species in the variable .ASSMOD_NAMES
# Those model folder must have to be hold in the folder Assessments
.ASS <- TRUE

# names of the model for the last assessment - Only useful if comparison is made.
# if all stocks are considered they have to be ordered as follow:
# "AIGKC/EAG" / "AIGKC/WAG" / "BBRKC" / "SMBKC" / "SNOW"
.ASSMOD_NAMES <- c('model_21_1e', 'model_21_1e',
                   'model_21_1',
                   'model_16_0',
                   'model_21_g')

# Do comparison?
.MAKE_Comp <- TRUE

# Call the GMACS() function:

tables <- GMACS(Spc = .Spc, GMACS_version = .GMACS_version,
                Dir = .VERSIONDIR,
                compile = .COMPILE,
                ASS = .ASS,
                AssMod_names = .ASSMOD_NAMES,
                run = .RUN_GMACS,
                make.comp = .MAKE_Comp)


# Use the UpdateGMACS function to copy and paste the last files in the Latest_Version
# directory
UpdateGMACS()

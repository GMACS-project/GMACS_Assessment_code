# Clean your environment
rm(list=ls())

# Set the working directory as the directory of this document----
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
# check your directory
getwd()





# Species of interest
.Spc <- 'SMBKC'

# Names of the GMACS version to consider for run
.GMACS_version <- c(
  "Dvpt_Version",
  "Latest_Version"
)

# Define directory
# /!\ If the last assessment is used here, the directory for this 
# folder will be: paste0(dirname(getwd()), "/Assessments/")

.VERSIONDIR <- c(
  paste0(getwd(), "/Dvpt_Version/")
  # paste0(getwd(), "/Latest_Version/")
)

# Use Last Assessment for comparison?
# If yes, you must provide the names of the model for each species in the variable .ASSMOD_NAMES
# Those model folder must have to be hold in the folder Assessments
.ASS <- FALSE

# names of the model for the last assessment - Only useful if comparison is made.
# if all stocks are considered they have to be ordered as follow:
# "AIGKC/EAG" / "AIGKC/WAG" / "BBRKC" / "SMBKC" / "SNOW"
.ASSMOD_NAMES <- NULL
# c("model_21_1e",
#   "model_21_1e",
#   "model_21_1",
#   "model_16_0",
#   "model_21_g")

# Need to conpile the model?
# vector of length(.GMACS_version)
# 0: GMACS is not compiled. This assumes that an executable exists in the directory of the concerned version.
# 1: GMACS is compiles
.COMPILE <- c(1)

# Run GMACS
.RUN_GMACS <- TRUE

# Use latest available data for the assessment?
.LastAssDat <- TRUE

# Define the directories for ADMB
.ADMBpaths <- "ADpaths.txt"


# Do comparison?
.MAKE_Comp <- FALSE

# Show Rterminal
.VERBOSE <- TRUE


render_SAFE()

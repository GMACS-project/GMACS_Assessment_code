# II- set up the development version----

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
  file.path(getwd(), "Dvpt_Version")
)

# Use Last Assessment for comparison?
# If yes, you must provide the names of the model for each species in the variable .ASSMOD_NAMES
# Those model folder must have to be hold in the folder Assessments
.ASS <- FALSE

# Need to conpile the model?
# vector of length(.GMACS_version)
# 0: GMACS is not compiled. This assumes that an executable exists in the directory of the concerned version.
# 1: GMACS is compiles
.COMPILE <- 0       # You already compiled and built the executable

# Run GMACS
.RUN_GMACS <- TRUE

# Use latest available data for the assessment?
.LastAssDat <- TRUE

# Define the directories for ADMB
.ADMBpaths <- "ADpaths.txt"

# Show Rterminal
.VERBOSE <- TRUE

# Do comparison?
.MAKE_Comp <- FALSE

#--run Gmacs
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

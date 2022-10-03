# Names of the GMACS version to consider for run
GMACS_version_ <- c(
  "Last_Assessment",
  "Dvpt_Version"
);

# Define directory
VERSIONDIR_ <- c(
  file.path(dirname(getwd()), "Assessments"),
  file.path(getwd(), "Dvpt_Version")
)

# Need to cmnpile the model?
# vector of length(.GMACS_version)
# 0: GMACS is not compiled. This assumes that an executable exists in the directory of the concerned version.
# 1: GMACS is compiles
COMPILE_ <- c(0,0)       # You already compiled and built the executable

# Run GMACS
RUN_GMACS_ <- FALSE

# Species
Spc_ <- c(
          'SNOW_crab'
          )

# Use Last Assessment for comparison?
# If yes, you must provide the names of the model for each species in the variable .ASSMOD_NAMES
# Those model folder must have to be hold in the folder Assessments
ASS_ <- TRUE

# names of the model for the last assessment - Only useful if comparison is made.
# if all stocks are considered they have to be ordered as follow:
# "AIGKC/EAG" / "AIGKC/WAG" / "BBRKC" / "SMBKC" / "SNOW"
ASSMOD_NAMES_ <- c(
                   'model_21_g'
                   )

# Do comparison?
MAKE_Comp_ <- TRUE

#--run the comparison
res <- GMACS(
  Spc = Spc_,
  GMACS_version = GMACS_version_,
  Dir = VERSIONDIR_,
  ASS = ASS_,
  AssMod_names = ASSMOD_NAMES_,
  compile = COMPILE_,
  run = RUN_GMACS_,
  make.comp = MAKE_Comp_,
  verbose = TRUE
)

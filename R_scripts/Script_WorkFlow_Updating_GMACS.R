# Workflow to update/upgrade Gmacs

# 1. Set the folder structure for development
# Script: "Script_Set_Development_Structure.R"
# Set the folders, copy the input files from the last available assessment
# or from a given version of development.

# 2. Modify the .TPL and input files accordingly and compile Gmacs.
# If the input files are modified, then some modifications will probably have to 
# happen in gmr as well.

# 3. Re write the input files and make comparisons between code versions
# script: "Script_Test_Code_Version_GMACS.R"

# 4. Update Gmacs 
# Script: "Script_Update_Gmacs.R"
# This implies: 
#   1. updating the .TPL with specifications of the implementation
#   2. updating the input files
#   3. Update the last_Version folder with Gmacs codes, input files and run Gmacs. 

# 5. Push on github 
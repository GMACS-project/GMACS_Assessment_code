
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Some functions used to run admb in R
# install.packages("PBSadmb")
library(PBSadmb)
library(knitr)
library(svDialogs)

library(miceadds)
#install.packages("szuwalski/gmr")
library(gmr)
in_path<-"C:/gmacs-develop/gmr/R/"
source.all( path=in_path, grepstring="\\.R",  print.source=TRUE, file_sep="__"  )




source("Additional_functions.R")
source("UpdateGMACS_function.R")



# Define the directories for ADMB
.ADMBpaths <- "ADpaths.txt"

UpdateGMACS()
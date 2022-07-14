# A generalized size-structured stock assessment modelling framework for Crustaceans !

This repository contains all you need to access the data and the outputs of the last stock assessment for some crustaceans stocks, to run GMACS and build your SAFE documents. 

Currently, five stocks are assessed using GMACS
  * the Golden king crab, _Lithodes aequispinus_, Aleutian Islands stocks (EAG and WAG),
  * the Bristol Bay Red King, _Paralithodes camtschaticus_, crab stock (BBRKC),
  * the Saint Matthew Island Blue King crab, _Paralithodes platypus_, stock (SMBKC), and
  * the snow crab, _Chionoecetes opilio_, stock (SNOW_crab).

The following describes what you can find in each of the sub-folders of this repository.

### Table of Contents

[Assessment data](#assessment-data)

[Assessments](#assessments)

[GMACS versions](#gmacs-versions)

[R scripts](#r-scripts)

[Rmarkdown templates](#rmarkdown-templates)

[SAFE documents](#safe-documents)

## Assessment data

For each stock, [this folder](https://github.com/GMACS-project/GMACS_Assessment_code/tree/main/Assessment_data) contains the most recent files needed to run GMACS. This includes the gmacs.dat file and the .ctl, .dat and .prj files.

You will also find a [batch command](https://github.com/GMACS-project/GMACS_Assessment_code/blob/main/Assessment_data/get_data.bat) allowing you to copy and paste these files in the folder of GMACS version you want to work with.

This "Assessment data" folder is intended to be used by authors of stock assessments to upload their own files as soon as they modify them.

## Assessments

The [Assessments](https://github.com/GMACS-project/GMACS_Assessment_code/tree/main/Assessments) folder is intended to contain all historical assessments. For each stock you will find the history of the models used past stock assessment with the .ctl, .dat and .prj files as well as the result file GMACSall.OUT.

## GMACS versions

The [GMACS_versions](https://github.com/GMACS-project/GMACS_Assessment_code/tree/main/GMACS) folder is the key folder of this repository.
You will find the following :
  * the current version of GMACS [in development](https://github.com/GMACS-project/GMACS_Assessment_code/tree/main/GMACS_versions/Dvpt_Version),
  * the most [recent and "validated"](https://github.com/GMACS-project/GMACS_Assessment_code/tree/main/GMACS_versions/Latest_Version) version of GMACS,
  * the past development versions of GMACS without the terminally molting life history ([GMACS_Orig](https://github.com/GMACS-project/GMACS_Assessment_code/tree/main/GMACS_versions/GMACS_Orig)). For more details about differences between these development versions, please see this [document](https://github.com/GMACS-project/GMACS_Assessment_code/blob/main/GMACS_versions/GMACS_Orig/VERSIONS_GMACS_Orig.docx),
  * the past development versions of GMACS with the terminally molting life history incorporated ([GMACS_Terminal_molt](https://github.com/GMACS-project/GMACS_Assessment_code/tree/main/GMACS_versions/GMACS_Terminal_molt)). You can find further details about differences between these versions in this [document](https://github.com/GMACS-project/GMACS_Assessment_code/blob/main/GMACS_versions/GMACS_Terminal_molt/VERSIONS_GMACS_Terminal_molt.docx), and
  * a texte file named "ADpaths.txt" that is used to run GMACS with the [`gmr`](gmacs-project.github.io/gmr/) package.

## R scripts

The [R_scripts](https://github.com/GMACS-project/GMACS_Assessment_code/tree/main/R_scripts) folder contains R scripts that are intended to be routines to help you run GMACS, make comparisons between multiple versions of GMACS and edit your SAFE documents.

## Rmarkdown templates

In this [folder](https://github.com/GMACS-project/GMACS_Assessment_code/tree/main/Rmarkdown_templates) you'll find Rmardown documents that allow you to produce pdf files when running GMACS, making comparisons between multiple versions of GMACS and editing your SAFE documents.

## SAFE documents

The [SAFE_documents](https://github.com/GMACS-project/GMACS_Assessment_code/tree/main/SAFE_documents) folder contains for each stock a *SAFE_stock* .Rmd file that can be used to produce comparisons between different versions of your assessment.

The most recent version of GMACS (_version 2.01.L_) is a UNIFIED code and can therefore be used for all stocks (see ["GMACS V 2.01.L"](https://github.com/GMACS-project/GMACS_Assessment_code/releases/tag/GMACS_Version) release).

Other developments are currently in progress and will be uploaded as soon as possible.

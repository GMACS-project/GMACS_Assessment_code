# The Generalized Model for Assessing Crustacean Stocks

The Generalized Model for Assessing Crustacean Stocks (GMACS) is a statistical size-structured population modeling framework designed to be flexible, scalable, and useful for both data-limited and data-rich situations. GMACS is an open source program coded in C++ and implemented in Automatic Differentiation Model Builder ([ADMB](http://www.admb-project.org/)). It allows to assess the impact of fishing on both the historical and the current abundance of the population and to evaluate sustainable rate of removals (i.e., catches).

### Table of Contents

 -  [Content of this repository](#content-of-this-repository)
    * [Assessment data](#assessment-data)
    * [Assessments](#assessments)
    * [GMACS versions](#gmacs-versions)
    * [R scripts](#r-scripts)
    * [Rmarkdown templates](#rmarkdown-templates)
    * [SAFE documents](#safe-documents)
 -  [Installation](#installation)
 -  [Learning GMACS](#learning-gmacs)
 -  [GMACS lifecycle](#gmacs-lifecycle)
 -  [How can I contribute to GMACS](how-can-i-contribute-to-gmacs)
 -  [Which tools are available for working with GMACS](which-tools-are-available-for-working-with-gmacs)

## Content of this repository

This repository contains all you need to access the data and the outputs of the last stock assessment for some crustaceans stocks, to run GMACS and build your SAFE documents. 

Currently, five stocks are assessed using GMACS
  * the Golden king crab, _Lithodes aequispinus_, Aleutian Islands stocks (EAG and WAG),
  * the Bristol Bay Red King, _Paralithodes camtschaticus_, crab stock (BBRKC),
  * the Saint Matthew Island Blue King crab, _Paralithodes platypus_, stock (SMBKC), and
  * the snow crab, _Chionoecetes opilio_, stock (SNOW_crab).

The following describes what you can find in each of the sub-folders of this repository.

### Assessment data

For each stock, [this folder](https://github.com/GMACS-project/GMACS_Assessment_code/tree/main/Assessment_data) contains the most recent files needed to run GMACS. This includes the gmacs.dat file and the .ctl, .dat and .prj files.

You will also find a [batch command](https://github.com/GMACS-project/GMACS_Assessment_code/blob/main/Assessment_data/get_data.bat) allowing you to copy and paste these files in the folder of GMACS version you want to work with.

This "Assessment data" folder is intended to be used by authors of stock assessments to upload their own files as soon as they modify them.

### Assessments

The [Assessments](https://github.com/GMACS-project/GMACS_Assessment_code/tree/main/Assessments) folder is intended to contain all historical assessments. For each stock you will find the history of the models used past stock assessment with the .ctl, .dat and .prj files as well as the result file GMACSall.OUT.

### GMACS versions

The [GMACS_versions](https://github.com/GMACS-project/GMACS_Assessment_code/tree/main/GMACS_versions) folder is the key folder of this repository.
You will find the following :
  * the current version of GMACS [in development](https://github.com/GMACS-project/GMACS_Assessment_code/tree/main/GMACS_versions/Dvpt_Version),
  * the most [recent and "validated"](https://github.com/GMACS-project/GMACS_Assessment_code/tree/main/GMACS_versions/Latest_Version) version of GMACS,
  * the past development versions of GMACS without the terminally molting life history ([GMACS_Orig](https://github.com/GMACS-project/GMACS_Assessment_code/tree/main/GMACS_versions/GMACS_Orig)). For more details about differences between these development versions, please see this [document](https://github.com/GMACS-project/GMACS_Assessment_code/blob/main/GMACS_versions/GMACS_Orig/VERSIONS_GMACS_Orig.docx),
  * the past development versions of GMACS with the terminally molting life history incorporated ([GMACS_Terminal_molt](https://github.com/GMACS-project/GMACS_Assessment_code/tree/main/GMACS_versions/GMACS_Terminal_molt)). You can find further details about differences between these versions in this [document](https://github.com/GMACS-project/GMACS_Assessment_code/blob/main/GMACS_versions/GMACS_Terminal_molt/VERSIONS_GMACS_Terminal_molt.docx), and
  * a texte file named "ADpaths.txt" that is used to run GMACS with the [`gmr`](gmacs-project.github.io/gmr/) package.

### R scripts

The [R_scripts](https://github.com/GMACS-project/GMACS_Assessment_code/tree/main/R_scripts) folder contains R scripts that are intended to be routines to help you run GMACS, make comparisons between multiple versions of GMACS and edit your SAFE documents.

### Rmarkdown templates

In this [folder](https://github.com/GMACS-project/GMACS_Assessment_code/tree/main/Rmarkdown_templates) you'll find Rmardown documents that allow you to produce pdf files when running GMACS, making comparisons between multiple versions of GMACS and editing your SAFE documents.

### SAFE documents

The [SAFE_documents](https://github.com/GMACS-project/GMACS_Assessment_code/tree/main/SAFE_documents) folder contains for each stock a *SAFE_stock* .Rmd file that can be used to produce comparisons between different versions of your assessment.

## Installation

The most recent version of GMACS is a UNIFIED code and can therefore be used for all stocks (see ["GMACS V 2.01.L"](https://github.com/GMACS-project/GMACS_Assessment_code/releases/tag/GMACS_Version) release). Other developments are currently in progress and will be uploaded as soon as possible.

You can download the latest compiled version from GMACS-project [Github release](https://github.com/GMACS-project/GMACS_Assessment_code/releases/tag/GMACS_Version)

## Learning GMACS

If you are new to the Generalized Model for Assessing Crustacean Stocks you should start with the general introduction rather than trying to learn from reading individual documentation pages.
Currently, there are two great places to start:
 1. The [GMACS user manual](https://gmacs-project.github.io/User-manual/) which is currently in development. This manual is intended to provide the complete documentation of GMACS.
 2. You can also learn more about how to use GMACS walking through the vignettes of the [gmr](https://gmacs-project.github.io/gmr/index.html) package. You can access these vignettes through the following link: https://gmacs-project.github.io/gmr/articles/

## GMACS lifecycle

GMACS is a modeling framework that has been continuously evolving over the last decade. These evolutions are mainly due to the involvement of several researchers with specific ideas on new GMACS functionalities related to stock assessment and management issues for crustacean stocks. In recent years, these developments have also focused on the issue of being able to take into account the different changes observed at sea. This led for example to incorporate more flexibility in GMACS to consider time-varying parameters in order to catch the potential changes in life history traits. 

Today and for the years to come, the development perspectives of GMACS cover a very wide range of possibilities. The latter only make sense if you, as a user of GMACS, are involved in its development to ensure its flexibility and its ability to respond to your demands and needs.

## How can I contribute to GMACS?

You want to report issues, you know of new features that you would like to see implemented in the next release of GMACS or just want to create new example and/or documentation, please consider to share it with us. Currently, you can contribute in GMACS in two ways: 
 * by openning an [issue](https://github.com/GMACS-project/GMACS_Assessment_code/issues) on this repo, or 
 * by submitting a pull request.

For complete details about how to contribute to GMACS, please see the Contributing to GMACS document.

## Which tools are available for working with GMACS?

Currently GMACS is linked to [`gmr`](gmacs-project.github.io/gmr/), an R package to work with GMACS in R, create plots of GMACS output, compare different models and prepare SAFE documents.









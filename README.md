# A A generalized size-structured stock assessment modelling framework for Crustaceans !

In this repository, you will find all you need to run the latest version of GMACS and help in its developpement. Here is a description of each folder
holded in this repo: 


   * [Assessment data](https://github.com/GMACS-project/GMACS_Assessment_code/tree/main/Assessment_data): this folder contains the latest files 
     (for each stock) that GMACS needs to run an evaluation.

   1. In this folder you'll find a batch command allowing you to copy and paste these files in the Version of GMACS you want to work with (Development or most recent version)
   
   2.  This folder is intended to be used by authors to upload their own files as soon as they modify them.


   * the [GMACS](https://github.com/GMACS-project/GMACS_Assessment_code/tree/main/GMACS) folder contains:
	i) the current version of GMACS [in development](https://github.com/GMACS-project/GMACS_Assessment_code/tree/main/GMACS/Dvpt_Version),
	ii) the most recent and ["validated"](https://github.com/GMACS-project/GMACS_Assessment_code/tree/main/GMACS/Latest_Version) version of GMACS,
	iii) a *SAFE_stock* .Rmd file for each stock that can be used to produce comparison between different version of your assessment. It uses the 
	[gmr](https://github.com/szuwalski/gmr) package that you will need to make plots and some modified functions called from the 
	[Modif_functions](https://github.com/GMACS-project/GMACS_Assessment_code/blob/main/GMACS/Modif_functions.R) R script.


  * the [GMACS_Orig](https://github.com/GMACS-project/GMACS_Assessment_code/tree/main/GMACS_Orig) folder contains the development versions of GMACS without the terminally molting life 
    history. For more details about differences between these development versions, please see this [document](https://github.com/GMACS-project/GMACS_Assessment_code/blob/main/GMACS_Orig/VERSIONS_GMACS_Orig.docx)


  * the [GMACS_Terminal_molt](https://github.com/GMACS-project/GMACS_Assessment_code/tree/main/GMACS_Terminal_molt) folders holds the development versions of GMACS for the code 
    with the terminally molting life history incorporated. Similarly, you can find further details about differences between these version in this [document](https://github.com/GMACS-project/GMACS_Assessment_code/blob/main/GMACS_Terminal_molt/VERSIONS_GMACS_Terminal_molt.docx).


The most recent version of GMACS is a UNIFIED code and can therefore be used for all stocks. 

Other developments are currently in progress and will be uploaded as soon as possible.

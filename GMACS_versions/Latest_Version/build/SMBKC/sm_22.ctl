# ============================================================ #
#                  GMACS main control file 
# 
#_*** 
#_GMACS Version 2.10.01 
#_Last GMACS mofification made by: ** MV ** 
#_Date of writing the control file:2024-11-01 01:39:59 
#_*** 
# 
#_Stock of interest: SMBKC 
#_Model name: model_16_0 
#_Year of assessment: 2021 
# ============================================================ #

# -------------------------------------- #
##_Key parameter controls
# -------------------------------------- #
#_ntheta - Number of leading parameters (guestimated)
12 
#
#_Core parameters
# ************************************** #
#_For each parameter columns are:
#_Init_val: Initial value for the parameter (must lie between lower and upper bounds)
#_Lower_Bd & Upper_Bd: Range for the parameter
#_Phase: Set equal to a negative number not to estimate
#_Available prior types:
#_-> 0 = Uniform   - parameters are the range of the uniform prior
#_-> 1 = Normal    - parameters are the mean and sd
#_-> 2 = Lognormal - parameters are the mean and sd of the log
#_-> 3 = Beta      - parameters are the two beta parameters [see dbeta]
#_-> 4 = Gamma     - parameters are the two gamma parameters [see dgamma]
#_p1; p2: priors
# ************************************** #
# 
#_Init_val_| Lower_Bd_| Upper_Bd_| Phase_| Prior_type_| p1_| p2
0.18 0.01 1 -4 2 0.18 0.02 			# M-base
14.3 -7 30 -2 0 -7 30 			# Log_R0
10 -7 20 -1 1 -10 20 			# Log_Rinitial
13.39 -7 20 1 0 -7 20 			# Log_Rbar
80 30 310 -2 1 72.5 7.25 			# Recruitment_ra-males
0.25 0.1 7 -4 0 0.1 9 			# Recruitment_rb-males
0.2 -10 0.75 -4 0 -10 0.75 			# log_SigmaR
0.75 0.2 1 -2 3 3 2 			# Steepness
0.01 0 1 -3 3 1.01 1.01 			# Rho
14.5 5 20 1 0 5 20 			# Initial_logN_for_Male_mature_1_shell_1_class_1
14 5 20 1 0 5 20 			# Initial_logN_for_Male_mature_1_shell_1_class_2
13.5 5 20 1 0 5 20 			# Initial_logN_for_Male_mature_1_shell_1_class_3
# -------------------------------------- #

# -------------------------------------- #
##_Allometry
# -------------------------------------- #
#_Length-weight type/method
#_1 = Length-weight relationship parameters (w_l = a[s]*l^b[s]): vector of sex specific parameters for each maturity type:
#_(i.e., immature males, mature males, immature females, mature females).
#_2 = Input vector of mean weight-at-size by sex (dim=[1:nclass]) and maturity type (i.e., matrix of dim=[nsex*nmature,nclass]) 
#_3 = Input matrix of mean weight-at-size by sex and year for each maturity type (dim=[nsex*nmature*Nyear; nclass])
3 
#_Matrix of male mean weight-at-size
#_size_Class_1 size_Class_2 size_Class_3 
0.000748427 0.001165731 0.00193051 			# 1978 - Male - BothMature
0.000748427 0.001165731 0.001688886 			# 1979 - Male - BothMature
0.000748427 0.001165731 0.001922246 			# 1980 - Male - BothMature
0.000748427 0.001165731 0.001877957 			# 1981 - Male - BothMature
0.000748427 0.001165731 0.001938634 			# 1982 - Male - BothMature
0.000748427 0.001165731 0.002076413 			# 1983 - Male - BothMature
0.000748427 0.001165731 0.00189933 			# 1984 - Male - BothMature
0.000748427 0.001165731 0.002116687 			# 1985 - Male - BothMature
0.000748427 0.001165731 0.001938784 			# 1986 - Male - BothMature
0.000748427 0.001165731 0.001939764 			# 1987 - Male - BothMature
0.000748427 0.001165731 0.001871067 			# 1988 - Male - BothMature
0.000748427 0.001165731 0.001998295 			# 1989 - Male - BothMature
0.000748427 0.001165731 0.001870418 			# 1990 - Male - BothMature
0.000748427 0.001165731 0.001969415 			# 1991 - Male - BothMature
0.000748427 0.001165731 0.001926859 			# 1992 - Male - BothMature
0.000748427 0.001165731 0.002021492 			# 1993 - Male - BothMature
0.000748427 0.001165731 0.001931318 			# 1994 - Male - BothMature
0.000748427 0.001165731 0.002014407 			# 1995 - Male - BothMature
0.000748427 0.001165731 0.001977471 			# 1996 - Male - BothMature
0.000748427 0.001165731 0.002099246 			# 1997 - Male - BothMature
0.000748427 0.001165731 0.001982478 			# 1998 - Male - BothMature
0.000748427 0.001165731 0.001930932 			# 1999 - Male - BothMature
0.000748427 0.001165731 0.001930932 			# 2000 - Male - BothMature
0.000748427 0.001165731 0.001930932 			# 2001 - Male - BothMature
0.000748427 0.001165731 0.001930932 			# 2002 - Male - BothMature
0.000748427 0.001165731 0.001930932 			# 2003 - Male - BothMature
0.000748427 0.001165731 0.001930932 			# 2004 - Male - BothMature
0.000748427 0.001165731 0.001930932 			# 2005 - Male - BothMature
0.000748427 0.001165731 0.001930932 			# 2006 - Male - BothMature
0.000748427 0.001165731 0.001930932 			# 2007 - Male - BothMature
0.000748427 0.001165731 0.001930932 			# 2008 - Male - BothMature
0.000748427 0.001165731 0.001891628 			# 2009 - Male - BothMature
0.000748427 0.001165731 0.001795721 			# 2010 - Male - BothMature
0.000748427 0.001165731 0.001823113 			# 2011 - Male - BothMature
0.000748427 0.001165731 0.001807433 			# 2012 - Male - BothMature
0.000748427 0.001165731 0.001930932 			# 2013 - Male - BothMature
0.000748427 0.001165731 0.001894627 			# 2014 - Male - BothMature
0.000748427 0.001165731 0.001850611 			# 2015 - Male - BothMature
0.000748427 0.001165731 0.001930932 			# 2016 - Male - BothMature
0.000748427 0.001165731 0.001930932 			# 2017 - Male - BothMature
0.000748427 0.001165731 0.001930932 			# 2018 - Male - BothMature
0.000748427 0.001165731 0.001930932 			# 2019 - Male - BothMature
0.000748427 0.001165731 0.001930932 			# 2020 - Male - BothMature
0.000748427 0.001165731 0.001930932 			# 2021 - Male - BothMature
# -------------------------------------- #

# -------------------------------------- #
##_Fecundity for MMB/MMA calculation
# -------------------------------------- #
#_Maturity definition: Proportion of mature at size by sex
#_size_Class_1 size_Class_2 size_Class_3 
0 1 1 
#_Legal definition of the proportion of mature at size by sex
#_size_Class_1 size_Class_2 size_Class_3 
0 0 1 
#_Use functional maturity for terminally molting animals? (0 = No; 1 = Yes)
0 
# -------------------------------------- #

# -------------------------------------- #
##_Growth parameter controls
# -------------------------------------- #
 
#_Two lines for each parameter are required if the model considers two sexes, one line is not
 
#_Growth transition matrix definition
# ************************************** #
#_1 = Fixed growth transition matrix (requires molt probability)
#_2 = Fixed size transition matrix (molt probability is ignored)
#_3 = Growth increment is gamma distributed
#_4 = Size after growth is gamma distributed
#_5 = kappa varies among individuals
#_6 = Linf varies among individuals
#_7 = kappa and Ling varies among individuals
#_8 = Growth increment is normally distributed
# ************************************** #
1 
 
#_Growth increment model matrix
# ************************************** #
#_0 = Pre-specified growth increment
#_1 = linear (alpha; beta parameters)
#_2 = Estimated by size-class
#_3 = Pre-specified by size-class (empirical approach)
# ************************************** #
0 
 
#_Molt probability function
# ************************************** #
#_0 = Pre-specified probability of molting
#_1 = Constant probability of molting (flat approach)
#_2 = Logistic function
#_3 = Free estimated parameters
# ************************************** #
#_If the custom growth model option = 1 then the molt probability function must be 1 
2 
 
#_Maximum of size-classes to which recruitment must occur (males then females)
1 
#_Number of blocks of growth matrix parameters (i.e., number of size-increment period)
1 
#_Year(s) with changes in the growth matrix
#_-> 1 line per sex - blank if no change (i.e., if the number of blocks of growth matrix parameters = 1)
 
#_Number of blocks of molt probability
1 
#_Year(s) with changes in molt probability
#_-> 1 line per sex - blank if no change (i.e., if the number of blocks of growth matrix parameters = 1)

#_Are the beta parameters relative to a base level?
1 

#_Growth increment model controls
# ************************************** #
#_For each parameter columns are:
#_Init_val: Initial value for the parameter (must lie between lower and upper bounds)
#_Lower_Bd & Upper_Bd: Range for the parameter
#_Phase: Set equal to a negative number not to estimate
#_Available prior types:
#_-> 0 = Uniform   - parameters are the range of the uniform prior
#_-> 1 = Normal    - parameters are the mean and sd
#_-> 2 = Lognormal - parameters are the mean and sd of the log
#_-> 3 = Beta      - parameters are the two beta parameters [see dbeta]
#_-> 4 = Gamma     - parameters are the two gamma parameters [see dgamma]
#_p1; p2: priors
# ************************************** #
# 
#_Init_val_| Lower_Bd_| Upper_Bd_| Phase_| Prior_type_| p1_| p2

#_Molt probability controls
# ************************************** #
#_For each parameter columns are:
#_Init_val: Initial value for the parameter (must lie between lower and upper bounds)
#_Lower_Bd & Upper_Bd: Range for the parameter
#_Phase: Set equal to a negative number not to estimate
#_Available prior types:
#_-> 0 = Uniform   - parameters are the range of the uniform prior
#_-> 1 = Normal    - parameters are the mean and sd
#_-> 2 = Lognormal - parameters are the mean and sd of the log
#_-> 3 = Beta      - parameters are the two beta parameters [see dbeta]
#_-> 4 = Gamma     - parameters are the two gamma parameters [see dgamma]
#_p1; p2: priors
# ************************************** #
 
#_Init_val_| Lower_Bd_| Upper_Bd_| Phase_| Prior_type_| p1_| p2
121.5 65 145 -4 0 0 999 			# Molt_probability_mu_Male_period_1
0.06 0 1 -3 0 0 999 			# Molt_probability_CV_Male_period_1

#_Mature probability controls
# ************************************** #
#_For each parameter columns are:
#_Init_val: Initial value for the parameter (must lie between lower and upper bounds)
#_Lower_Bd & Upper_Bd: Range for the parameter
#_Phase: Set equal to a negative number not to estimate
#_Available prior types:
#_-> 0 = Uniform   - parameters are the range of the uniform prior
#_-> 1 = Normal    - parameters are the mean and sd
#_-> 2 = Lognormal - parameters are the mean and sd of the log
#_-> 3 = Beta      - parameters are the two beta parameters [see dbeta]
#_-> 4 = Gamma     - parameters are the two gamma parameters [see dgamma]
#_p1; p2: priors
# ************************************** #
 
#_Init_val_| Lower_Bd_| Upper_Bd_| Phase_| Prior_type_| p1_| p2

#_Custom growth-increment matrix or size-transition matrix (if any)
0.1761 0 0
0.7052 0.2206 0
0.1187 0.7794 1

#_Custom molt probability matrix  (if any)
# 

#_Custom maturity probability matrix  (if any)
# 
# -------------------------------------- #

# -------------------------------------- #
##_Vulnerability parameter controls
# 
#_Vulnerability is the combination of selectivity and retention selectivity.
#_Gmacs requires that each gear has a vulnerability.
# 
# -------------------------------------- #
# 
#_For each of the vulnerability component (selectivity and retention), the following need to be specified:
# ************************************** #
#_Component periods: Number of component time periods
#_Sex specific component: 0 = No; 1 = Yes
#_Vulnerability types
#_-> <0 = Mirror vulnerability component
#_-> 0 = Nonparameric component (one parameter per class)
#_-> 1 = Nonparameric component (one parameter per class, constant from last specified class)
#_-> 2 = Logistic component (inflection point and slope)
#_-> 3 = Logistic component (50% and 95% selection)
#_-> 4 = Double normal component (3 parameters)
#_-> 5 = Flat equal to one (1 parameter; phase must be negative)
#_-> 6 = Flat equal to zero (1 parameter; phase must be negative) 
#_-> 7 = Flat-topped double normal component (4 parameters) 
#_-> 8 = Declining logistic component with initial values (50% and 95% selection plus extra) 
#_-> 9 = Cubic-spline (specified with knots and values at knots) 
#_-> 10 = One parameter logistic component (inflection point and slope) 
#_Is the fleet within another? (0 = No; 1 = Yes)
#_Extra parameters for each pattern - 1 line per sex
# 
#_Is the maximum selectivity at size forced to equal 1 or not ?
# ************************************** #
 
#_The number of columns corresponds to the number of fleets (fisheries and surveys)
# Selectivity
#  Gear-1 | Gear-2 | Gear-3 | Gear-4 | Gear-5#  Pot_Fishery | Trawl_Bycatch | Fixed_bycatch | NMFS_Trawl | ADFG_Pot 
2 1 1 1 1 #_Number of selectivity time period per fleet
0 0 0 0 0 #_Sex specific selectivity
0 3 3 0 0 #_Selectivity type
0 0 0 0 0 #_Insertion of fleet in another
0 0 0 0 0 #_Extra parameter for each pattern
# 
#_Retention
#_Gear-1 | Gear-2 | Gear-3 | Gear-4 | Gear-5#_Pot_Fishery_| Trawl_Bycatch_| Fixed_bycatch_| NMFS_Trawl_| ADFG_Pot
1 1 1 1 1 #_Number of Retention time period per fleet
0 0 0 0 0 #_Sex specific Retention
3 6 6 6 6 #_Selectivity type
1 0 0 0 0 #_retention flag (0 = No, 1 = Yes)
0 0 0 0 0 #_Extra parameter for each pattern
1 1 1 1 1 #_Selectivity for the maximum size class if forced to be 1?
 
# ====================================== #
# ====================================== #

#_Selectivity parameter controls
# ************************************** #
#_For each parameter (for each gear) columns are:
#_Fleet: The index of the fleet (positive for capture selectivity)
#_Index: Parameter count
#_Par_no: Parameter count within the current pattern
#_Sex: 0 = both; 1 = male; 2 = female
#_Init_val: Initial value for the parameter (must lie between lower and upper bounds)
#_Lower_Bd & Upper_Bd: Range for the parameter
#_Available prior types:
#_-> 0 = Uniform   - parameters are the range of the uniform prior
#_-> 1 = Normal    - parameters are the mean and sd
#_-> 2 = Lognormal - parameters are the mean and sd of the log
#_-> 3 = Beta      - parameters are the two beta parameters [see dbeta]
#_-> 4 = Gamma     - parameters are the two gamma parameters [see dgamma]
#_p1; p2: priors
#_Phase: Set equal to a negative number not to estimate
#_Start / End block: years to define the current block structure
#_Env_Link: Is there any environmental link for this parameter (0 = no; 1 = yes)
#_Link_Par: If 'Env_Link'=1; indicate the link to the environmental parameter
#_(i.e., which parameter (column) in the Envdata matrix)
#_Rand_Walk: Is there a random walk (0/1/2)- If so (1/2), which type :
#_1 = First order autoregressive process; 2 = gaussian white noise
#_Start_RdWalk / End_RdWalk: years (start/end) to define the period for random walk deviations
#_Sigma_RdWalk: sigma for the random walk
# ************************************** #
 
#_Fleet_| Index_| Par_no_| Sex_| Init_val_| Lower_Bd_| Upper_Bd_| Prior_type_| p1_| p2_| Phase_| Start_Block_| End_Block_| Env_Link_| Link_Par_| Rand_Walk_| Start_RdWalk_| End_RdWalk_| Sigma_RdWalk
# Pot_Fishery  
1 1 1 0 0.4 0.001 1 0 0 1 3 1978 2008 0 0 0 1978 1978 0 			# Sel_Pot_Fishery_Male_period_1_par_1
1 2 2 0 0.7 0.001 1 0 0 1 3 1978 2008 0 0 0 1978 1978 0 			# Sel_Pot_Fishery_Male_period_1_par_2
1 3 3 0 1 0.001 2 0 0 1 -2 1978 2008 0 0 0 1978 1978 0 			# Sel_Pot_Fishery_Male_period_1_par_3
1 1 1 0 0.4 0.001 1 0 0 1 3 2009 2020 0 0 0 1978 1978 0 			# Sel_Pot_Fishery_Male_period_2_par_1
1 2 2 0 1 0.001 1 0 0 1 3 2009 2020 0 0 0 1978 1978 0 			# Sel_Pot_Fishery_Male_period_2_par_2
1 3 3 0 1 0.001 2 0 0 1 -2 2009 2020 0 0 0 1978 1978 0 			# Sel_Pot_Fishery_Male_period_2_par_3
# Trawl_Bycatch  
2 7 1 0 40 10 200 0 10 200 -3 1978 2020 0 0 0 1978 1978 0 			# Sel_Trawl_Bycatch_Male_period_1_par_1
2 8 2 0 60 10 200 0 10 200 -3 1978 2020 0 0 0 1978 1978 0 			# Sel_Trawl_Bycatch_Male_period_1_par_2
# Fixed_bycatch  
3 9 1 0 40 10 200 0 10 200 -3 1978 2020 0 0 0 1978 1978 0 			# Sel_Fixed_bycatch_Male_period_1_par_1
3 10 2 0 60 10 200 0 10 200 -3 1978 2020 0 0 0 1978 1978 0 			# Sel_Fixed_bycatch_Male_period_1_par_2
# NMFS_Trawl  
4 11 1 0 0.7 0.001 1 0 0 1 4 1978 2021 0 0 0 1978 1978 0 			# Sel_NMFS_Trawl_Male_period_1_par_1
4 12 2 0 1 0.001 1 0 0 1 4 1978 2021 0 0 0 1978 1978 0 			# Sel_NMFS_Trawl_Male_period_1_par_2
4 13 3 0 0.9 0.001 1 0 0 1 -5 1978 2021 0 0 0 1978 1978 0 			# Sel_NMFS_Trawl_Male_period_1_par_3
# ADFG_Pot  
5 14 1 0 0.4 0.001 1 0 0 1 4 1978 2021 0 0 0 1978 1978 0 			# Sel_ADFG_Pot_Male_period_1_par_1
5 15 2 0 1 0.001 1 0 0 1 4 1978 2021 0 0 0 1978 1978 0 			# Sel_ADFG_Pot_Male_period_1_par_2
5 16 3 0 1 0.001 2 0 0 1 -2 1978 2021 0 0 0 1978 1978 0 			# Sel_ADFG_Pot_Male_period_1_par_3

#_Retention parameter controls
# ************************************** #
#_For each parameter (for each gear) columns are:
#_Fleet: The index of the fleet (negative for retention)
#_Index: Parameter count
#_Par_no: Parameter count within the current pattern
#_Sex: 0 = both; 1 = male; 2 = female
#_Init_val: Initial value for the parameter (must lie between lower and upper bounds)
#_Lower_Bd & Upper_Bd: Range for the parameter
#_Available prior types:
#_-> 0 = Uniform   - parameters are the range of the uniform prior
#_-> 1 = Normal    - parameters are the mean and sd
#_-> 2 = Lognormal - parameters are the mean and sd of the log
#_-> 3 = Beta      - parameters are the two beta parameters [see dbeta]
#_-> 4 = Gamma     - parameters are the two gamma parameters [see dgamma]
#_p1; p2: priors
#_Phase: Set equal to a negative number not to estimate
#_Start / End block: years to define the current block structure
#_Env_Link: Is there any environmental link for this parameter (0 = no; 1 = yes)
#_Link_Par: If 'Env_Link'=1; indicate the link to the environmental parameter
#_(i.e., which parameter (column) in the Envdata matrix)
#_Rand_Walk: Is there a random walk (0/1/2)- If so (1/2), which type :
#_1 = First order autoregressive process; 2 = gaussian white noise
#_Start_RdWalk / End_RdWalk: years (start/end) to define the period for random walk deviations
#_Sigma_RdWalk: sigma for the random walk
# ************************************** #
 
#_Fleet_| Index_| Par_no_| Sex_| Init_val_| Lower_Bd_| Upper_Bd_| Prior_type_| p1_| p2_| Phase_| Start_Block_| End_Block_| Env_Link_| Link_Par_| Rand_Walk_| Start_RdWalk_| End_RdWalk_| Sigma_RdWalk
# Pot_Fishery  
-1 17 1 0 120 50 200 0 1 900 -7 1978 2020 0 0 0 1978 1978 0 			# Ret_Pot_Fishery_Male_period_1_par_1
-1 18 2 0 123 110 200 0 1 900 -7 1978 2020 0 0 0 1978 1978 0 			# Ret_Pot_Fishery_Male_period_1_par_2
# Trawl_Bycatch  
-2 19 1 0 595 1 999 0 1 999 -3 1978 2020 0 0 0 1978 1978 0 			# Ret_Trawl_Bycatch_Male_period_1_par_1
# Fixed_bycatch  
-3 20 1 0 595 1 999 0 1 999 -3 1978 2020 0 0 0 1978 1978 0 			# Ret_Fixed_bycatch_Male_period_1_par_1
# NMFS_Trawl  
-4 21 1 0 595 1 999 0 1 999 -3 1978 2021 0 0 0 1978 1978 0 			# Ret_NMFS_Trawl_Male_period_1_par_1
# ADFG_Pot  
-5 22 1 0 595 1 999 0 1 999 -3 1978 2021 0 0 0 1978 1978 0 			# Ret_ADFG_Pot_Male_period_1_par_1

#_Number of asymptotic retention parameter
1 
#_Asymptotic parameter controls
# ************************************** #
#_Fleet: The index of the fleet (negative for retention)
#_Sex: 0 = both; 1 = male; 2 = female
#_Year: year of interest 
#_Init_val: Initial value for the parameter (must lie between lower and upper bounds)
#_Lower_Bd & Upper_Bd: Range for the parameter
#_Phase: Set equal to a negative number not to estimate
# ************************************** #
#_Fleet_| Sex_| Year_| Init_val_| Lower_Bd_| Upper_Bd_| Phase 
1 1 1978 1e-06 0 1 -3 			# AsympRet_fleet_Pot_Fishery_sex_Male_year_1978
# -------------------------------------- #


#_Environmental parameters Control
# ************************************** #
#_Init_val: Initial value for the parameter (must lie between lower and upper bounds)
#_Lower_Bd & Upper_Bd: Range for the parameter
#_Phase: Set equal to a negative number not to estimate
#_Init_val_| Lower_Bd_| Upper_Bd_| Phase 
# 
#_One line for each parameter ordered as the parameters are in the
#_control matrices
# ************************************** #

#_Vulnerability impact#_Init_val_| Lower_Bd_| Upper_Bd_| Phase 
# -------------------------------------- #

#_Deviation parameter phase for the random walk in vulnerability parameters
#_Need to be defined
-1 	#  Dummy_sel_dev_par 

# -------------------------------------- #
## Priors for catchability
# -------------------------------------- #
 
# ************************************** #
# Init_val: Initial value for the parameter (must lie between lower and upper bounds)
# Lower_Bd & Upper_Bd: Range for the parameter
# Phase: Set equal to a negative number not to estimate
# Available prior types:
# -> 0 = Uniform   - parameters are the range of the uniform prior
# -> 1 = Normal    - parameters are the mean and sd
# -> 2 = Lognormal - parameters are the mean and sd of the log
# -> 3 = Beta      - parameters are the two beta parameters [see dbeta]
# -> 4 = Gamma     - parameters are the two gamma parameters [see dgamma]
# p1; p2: priors
# Q_anal: Do we need to solve analytically Q? (0 = No; 1 = Yes)
# CV_mult: multiplier ofr the input survey CV
# Loglik_mult: weight for the likelihood
# ************************************** #
# Init_val | Lower_Bd | Upper_Bd | Phase | Prior_type | p1 | p2 | Q_anal | CV_mult | Loglik_mult
1 0.5 1.2 -4 0 0 9 0 1 1 			# Log_vn_comp_1
0.003 0 5 3 0 0 9 0 1 1 			# Log_vn_comp_2
# -------------------------------------- #

# -------------------------------------- #
## Additional CV controls
# -------------------------------------- #
 
# ************************************** #
# Init_val: Initial value for the parameter (must lie between lower and upper bounds)
# Lower_Bd & Upper_Bd: Range for the parameter
# Phase: Set equal to a negative number not to estimate
# Available prior types:
# -> 0 = Uniform   - parameters are the range of the uniform prior
# -> 1 = Normal    - parameters are the mean and sd
# -> 2 = Lognormal - parameters are the mean and sd of the log
# -> 3 = Beta      - parameters are the two beta parameters [see dbeta]
# -> 4 = Gamma     - parameters are the two gamma parameters [see dgamma]
# p1; p2: priors
# ************************************** #
# Init_val | Lower_Bd | Upper_Bd | Phase | Prior_type| p1 | p2
1e-07 1e-09 10 -4 4 1 100 			# Log_add_cvt_survey_1
1e-07 1e-09 10 -4 4 1 100 			# Log_add_cvt_survey_2
 
# Additional variance control for each survey (0 = ignore; >0 = use)
0 0 
# -------------------------------------- #

# -------------------------------------- #
## Penalties for the average fishing mortality rate
# -------------------------------------- #
 
# ************************************** #
# Fishing mortality controls
# ************************************** #
# Mean_F_male: mean male fishing mortality (base value for the fully-selected F) #
# Female_Offset: Offset between female and male fully-selected F  #
# Pen_std_Ph1 & Pen_std_Ph2: penalties on the fully-selected F during the early and later phase, respectively  #
# Ph_Mean_F_male & Ph_Mean_F_female: Phases to estimate the fishing mortality for males and females, respectively #
# Low_bd_mean_F & Up_bd_mean_F: Range for the mean fishing mortality (lower and upper bounds, respectivly) #
# Low_bd_Y_male_F & Up_bd_Y_male_F: Range for the male fishing mortality (lower and upper bounds, respectivly) #
# Low_bd_Y_female_F & Up_bd_Y_female_F: Range for the female fishing mortality (lower and upper bounds, respectivly)#
# ************************************** #
#  Mean_F_male | Female_Offset | Pen_std_Ph1 | Pen_std_Ph2 | Ph_Mean_F_male | Ph_Mean_F_female | Low_bd_mean_F | Up_bd_mean_F | Low_bd_Y_male_F | Up_bd_Y_male_F | Low_bd_Y_female_F | Up_bd_Y_female_F 
0.2 0 3 50 1 -1 -12 4 -10 10 -10 10 			# log_fbar_Pot_Fishery
1e-04 0 4 50 1 -1 -12 4 -10 10 -10 10 			# log_fbar_Trawl_Bycatch
1e-04 0 4 50 1 -1 -12 4 -10 10 -10 10 			# log_fbar_Fixed_bycatch
0 0 2 20 -1 -1 -12 4 -10 10 -10 10 			# log_fbar_NMFS_Trawl
0 0 2 20 -1 -1 -12 4 -10 10 -10 10 			# log_fbar_ADFG_Pot
# -------------------------------------- #

# -------------------------------------- #
## Size composition data control
# -------------------------------------- #
 
# ************************************** #
# Available types of likelihood:
# -> 0 = Ignore size-composition data in model fitting
# -> 1 = Multinomial with estimated/fixed sample size
# -> 2 = Robust approximation to multinomial
# -> 5 = Dirichlet
# Auto tail compression (pmin):
# -> pmin is the cumulative proportion used in tail compression
# Type-like prediction (1 = catch-like predictions; 2 = survey-like predictions)
# Lambda: multiplier for the effective sample size
# Emphasis: multiplier for weighting the overall likelihood
# ************************************** #
 
# The number of columns corresponds to the number size-composition data frames
2 2 2 # Type of likelihood for the size-composition
0 0 0 # Option for the auto tail compression
1 1 1 # Initial value for effective sample size multiplier
-4 -4 -4 # Phase for estimating the effective sample size
1 2 3 # Composition appender (Should data be aggregated?)
1 2 2 # Type-like predictions
1 1 1 # Lambda: multiplier for the effective sample size
1 1 1 # Emphasis: multiplier for weighting the overall likelihood
# -------------------------------------- #

# -------------------------------------- #
## Time-varying Natural mortality controls
# -------------------------------------- #
 
# ************************************** #
# Available types of M specification:
# -> 0 = Constant natural mortality
# -> 1 = Random walk (deviates constrained by variance in M)
# -> 2 = Cubic Spline (deviates constrained by nodes & node-placement)
# -> 3 = Blocked changes (deviates constrained by variance at specific knots)
# -> 4 = Natural mortality is estimated as an annual deviation
# -> 5 = Deviations in M are estimated for specific periods relatively to the M estimated in the first year of the assessment
# -> 6 = Deviation in M are estimated for specific periods relatively to M during the current year
# ************************************** #
# Type of natural mortality
6 
# Is female M relative to M male?
# 0: No (absolute); 1: Yes (relative) 

# Phase of estimation
3 
# Standard deviation in M deviations
10 
# Number of nodes for cubic spline or number of step-changes for option 3
# -> One line per sex
2
# Year position of the knots for each sex (vector must be equal to the number of nodes)
# -> One line per sex
1998 1999 
# number of breakpoints in M by size
0 
# Size positions of breakpoints in M by size class
 
# Specific initial value for natural mortality deviations
1 
# Natural mortality deviation controls
# ************************************** #
# Init_val: Initial value for the parameter (must lie between lower and upper bounds)
# Lower_Bd & Upper_Bd: Range for the parameter
# Phase: Set equal to a negative number not to estimate
# Size_spec: Are the deviations size-specific ? (integer that specifies which size-class (negative to be considered))
# ************************************** #
# Init_val | Lower_Bd | Upper_Bd | Phase | Size_spec
1.6 0 2 3 0 			# M_dev_est_par_1
0 -2 2 -99 0 			# M_dev_est_par_2
# -------------------------------------- #

# -------------------------------------- #
## Tagging controls
# -------------------------------------- #
# Emphasis (likelihood weight) on tagging
0 
# -------------------------------------- #

# -------------------------------------- #
##  Immature/mature natural mortality 
# -------------------------------------- #
# maturity specific natural mortality? ( 0 = No; 1 = Yes - only for use if nmature > 1)
0 
# immature/mature natural mortality controls
# ************************************** #
# Init_val: Initial value for the parameter (must lie between lower and upper bounds)
# Lower_Bd & Upper_Bd: Range for the parameter
# Phase: Set equal to a negative number not to estimate
# Available prior types:
# -> 0 = Uniform   - parameters are the range of the uniform prior
# -> 1 = Normal    - parameters are the mean and sd
# -> 2 = Lognormal - parameters are the mean and sd of the log
# -> 3 = Beta      - parameters are the two beta parameters [see dbeta]
# -> 4 = Gamma     - parameters are the two gamma parameters [see dgamma]
# p1; p2: priors
# ************************************** #
# Init_val | Lower_Bd | Upper_Bd | Phase | Prior_type| p1 | p2
0 -1 1 -1 0 1 1 			# m_mat_mult_Male
# -------------------------------------- #

# -------------------------------------- #
## Other (additional) controls
# -------------------------------------- #
# First year of recruitment estimation deviations
1978 
# Last year of recruitment estimation deviations
2020 
# Consider terminal molting? (0 = No; 1 = Yes
0 
# Phase for recruitment estimation
3 
# Phase for recruitment sex-ratio estimation
-3 
# Initial value for expected sex-ratio
0.5 
# Phase for initial recruitment estimation
-3 
# Initial conditions (1 = unfished, 2 = steady-state, 3 = free params, 4 = free params revised)
2 
# Proportion of mature male biomass for SPR reference points
1 
# Stock-Recruit-Relationship (0 = none, 1 = Beverton-Holt) 
0 
# Use years specified to computed average sex ratio in the calculation of average recruitment for reference points
# -> 0 = No, i.e. Rec based on End year; 1 = Yes 
1 
# Years to compute equilibrium
200 
# -------------------------------------- #

# -------------------------------------- #
## Emphasis factor (weights for likelihood) controls
# -------------------------------------- #
# Weights on catches for the likelihood component
1 1 1 1 

# Penalties on deviations
# ************************************** #
#  Fdev_total | Fdov_total | Fdev_year | Fdov_year 
1 0 0 0 			# Pot_Fishery
1 0 0 0 			# Trawl_Bycatch
1 0 0 0 			# Fixed_bycatch
1 0 0 0 			# NMFS_Trawl
1 0 0 0 			# ADFG_Pot

# Account for priors (penalties)
# ************************************** #
10000 	#_ Log_fdevs 
0 	#_ meanF 
1 	#_ Mdevs 
1 	#_ Rec_devs 
0 	#_ Initial_devs 
0 	#_ Fst_dif_dev 
1 	#_ Mean_sex-Ratio 
0 	#_ Molt_prob 
0 	#_ Free_selectivity 
0 	#_ Init_n_at_len 
0 	#_ Fvecs 
0 	#_ Fdovs 
0 	#_ Vul_devs 

# -------------------------------------- #

# -------------------------------------- #
## End of control file
# -------------------------------------- #
9999

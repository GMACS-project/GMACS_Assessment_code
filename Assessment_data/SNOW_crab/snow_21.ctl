# ============================================================ #
#                  GMACS main control file 
# 
#_*** 
#_  GMACS Version 2.01.M.01 
#_Last GMACS mofification made by:   ** MV ** 
#_Date of writing the control file: 2024-02-17 16:44:17 
#_*** 
# 
#_Stock of interest:  SNOW_crab 
#_Model name:  model_21_g 
#_Year of assessment:  2021 
# ============================================================ #

# -------------------------------------- #
##_Key parameter controls
# -------------------------------------- #
#_ntheta - Number of leading parameters (guestimated)
99 
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
0.271 0.15 0.7 4 1 0.271 0.0154
0.271 0.15 0.7 4 1 0.271 0.0154
16.5 -10 20 -2 0 -10 20
15 -10 30 1 0 10 20
13.26245375 -10 30 1 0 10 20
32.5 7.5 42.5 -4 0 32.5 2.25
1 0.1 10 -4 0 0.1 5
0 -10 10 -4 0 0 20
0 -10 10 -3 0 0 20
-0.9 -10 0.75 -4 0 -10 0.75
0.75 0.2 1 -2 3 3 2
0.01 1e-04 1 -3 3 1.01 1.01
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
0 -20 25 1 0 10 20
# -------------------------------------- #

# -------------------------------------- #
##_Allometry
# -------------------------------------- #
#_Length-weight type/method
#_1 = Length-weight relationship (vector of sex specific parameters: w_l = a[s]*l^b[s])
#_2 = Input vector of mean weight-at-size by sex (dim=[1:nclass])
#_3 = Input matrix of mean weight-at-size by sex and year (dim=[nsex*Nyear; nclass])
2 
#_vector of male mean weight-at-size
7.66e-06 1.29e-05 2e-05 2.95e-05 4.17e-05 5.68e-05 7.53e-05 9.7455e-05 0.000123688 0.000154329 0.000189739 0.000230279 0.000276313 0.000328208 0.000386333 0.000451057 0.000522754 0.000601796 0.000688561 0.000783424 0.000886766 0.000998966
7.66E-06	1.29E-05	2.00E-05	2.95E-05	4.17E-05	5.68E-05	7.53E-05	0.000097455	0.000123688	0.000154329	0.000189739	0.000230279	0.000276313	0.000328208	0.000386333	0.000451057	0.000522754	0.000601796	0.000688561	0.000783424	0.000886766	0.000998966
#_vector of female mean weight-at-size
9.17e-06 1.44e-05 2.13e-05 2.98e-05 4.03e-05 5.29e-05 6.77e-05 8.4796e-05 0.000104451 0.000126759 0.000151857 0.000179881 0.000210963 0.000245233 0.00028282 0.00032385 0.000368446 0.000416731 0.000468827 0.000524852 0.000584924 0.00064916
9.17E-06	1.44E-05	2.13E-05	2.98E-05	4.03E-05	5.29E-05	6.77E-05	0.000084796	0.000104451	0.000126759	0.000151857	0.000179881	0.000210963	0.000245233	0.00028282	0.00032385	0.000368446	0.000416731	0.000468827	0.000524852	0.000584924	0.00064916
# -------------------------------------- #

# -------------------------------------- #
##_Fecundity for MMB/MMA calculation
# -------------------------------------- #
#_Maturity definition: Proportion of mature at size by sex
0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1
0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
#_Legal definition of the proportion of mature at size by sex
0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# use functional maturity for terminally molting animals?
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
4 
 
#_Growth increment model matrix
# ************************************** #
#_0 = Pre-specified growth increment
#_1 = linear (alpha; beta parameters)
#_2 = Estimated by size-class
#_3 = Pre-specified by size-class (empirical approach)
# ************************************** #
1 
 
#_Molt probability function
# ************************************** #
#_0 = Pre-specified probability of molting
#_1 = Constant probability of molting (flat approach)
#_2 = Logistic function
#_3 = Free estimated parameters
# ************************************** #
#_If the custom growth model option = 1 then the molt probability function must be 1 
3 
#_Maximum of size-classes to which recruitment must occur (males then females)
6 6 
#_Number of blocks of growth matrix parameters (i.e., number of size-increment period)
1 1 
#_Year(s) with changes in the growth matrix
#_-> 1 line per sex - blank if no change (i.e., if the number of blocks of growth matrix parameters = 1)
 
#_Number of blocks of molt probability
1 1 
#_Year(s) with changes in molt probability
#_-> 1 line per sex - blank if no change (i.e., if the number of blocks of growth matrix parameters = 1)
#_Are the beta parameters relative to a base level?
0 

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
2.049 -5 20 3 1 2.049 1
-0.2258 -1 0 3 1 -0.2258 0.5
0.25 0.001 5 -3 0 0 999
-1.1539 -5 10 3 1 -1.1539 1
-0.3389 -1 0 3 1 -0.3389 0.5
0.25 0.001 5 -3 0 0 999

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
0.006403424 0 1 -3 0 0 999
0.011119145 0 1 -3 0 0 999
0.019307699 0 1 -3 0 0 999
0.033479613 0 1 3 0 0 999
0.056979776 0 1 3 0 0 999
0.091341706 0 1 3 0 0 999
0.133152508 0 1 3 0 0 999
0.174876288 0 1 3 0 0 999
0.205801001 0 1 3 0 0 999
0.227682785 0 1 3 0 0 999
0.236598423 0 1 3 0 0 999
0.227719622 0 1 3 0 0 999
0.224199196 0 1 3 0 0 999
0.254471869 0 1 3 0 0 999
0.358087789 0 1 3 0 0 999
0.622512066 0 1 3 0 0 999
0.999999989 0 1 -3 0 0 999
0.999999989 0 1 -3 0 0 999
0.999999989 0 1 -3 0 0 999
0.999999989 0 1 -3 0 0 999
0.999999989 0 1 -3 0 0 999
0.999999989 0 1 -3 0 0 999
0.006167864 0 1 -3 0 0 999
0.018983452 0 1 3 0 0 999
0.058427231 0 1 3 0 0 999
0.17756809 0 1 3 0 0 999
0.466787211 0 1 3 0 0 999
0.77616875 0 1 3 0 0 999
0.811983413 0 1 3 0 0 999
0.999999999 0 1 -3 0 0 999
0.999999999 0 1 -3 0 0 999
0.999999999 0 1 -3 0 0 999
0.999999999 0 1 -3 0 0 999
0.999999989 0 1 -3 0 0 999
0.999999989 0 1 -3 0 0 999
0.999999989 0 1 -3 0 0 999
0.999999989 0 1 -3 0 0 999
0.999999989 0 1 -3 0 0 999
0.999999989 0 1 -3 0 0 999
0.999999989 0 1 -3 0 0 999
0.999999989 0 1 -3 0 0 999
0.999999989 0 1 -3 0 0 999
0.999999989 0 1 -3 0 0 999
0.999999989 0 1 -3 0 0 999

#_Custom growth-increment matrix or size-transition matrix (if any)
# 

#_Custom molt probability matrix  (if any)
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
#  Gear-1 | Gear-2 | Gear-3 | Gear-4 | Gear-5 | Gear-6 | Gear-7 | Gear-8#  Pot_Fishery | Trawl_Bycatch | NMFS_Trawl_1982 | NMFS_Trawl_1989 | BSFRF_2009 | NMFS_2009 | BSFRF_2010 | NMFS_2010 
1 1 1 1 1 1 1 1 #_Number of selectivity time period per fleet
1 0 1 1 1 1 1 1 #_Sex specific selectivity
2 2 2 2 0 -4 0 -4 #_Male selectivity type
2 2 2 2 0 -4 0 -4 #_Female selectivity type
0 0 0 0 0 5 0 7 #_Insertion of fleet in another
0 0 0 0 0 0 0 0 #_Extra parameters for each pattern by fleet (males)
0 0 0 0 0 0 0 0 #_Extra parameters for each pattern by fleet (females)
# 
#_Retention
#_Gear-1 | Gear-2 | Gear-3 | Gear-4 | Gear-5 | Gear-6 | Gear-7 | Gear-8#_Pot_Fishery_| Trawl_Bycatch_| NMFS_Trawl_1982_| NMFS_Trawl_1989_| BSFRF_2009_| NMFS_2009_| BSFRF_2010_| NMFS_2010
1 1 1 1 1 1 1 1 #_Number of Retention time period per fleet
1 0 0 0 0 0 0 0 #_Sex specific Retention
2 6 6 6 6 6 6 6 #_Male Retention type
6 6 6 6 6 6 6 6 #_Female Retention type
1 0 0 0 0 0 0 0 #_Male retention flag (0 = No, 1 = Yes)
0 0 0 0 0 0 0 0 #_Female retention flag (0 = No, 1 = Yes)
0 0 0 0 0 0 0 0 #_Extra parameters for each pattern by fleet (males)
0 0 0 0 0 0 0 0 #_Extra parameters for each pattern by fleet (females)
1 1 1 1 0 0 0 0 #_Selectivity for the maximum size class if forced to be 1?
 
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
1 1 1 1 105.7114 5 186 0 1 999 4 1982 2020 0 0 0 0 0 0  
1 2 2 1 4.997241 0.01 20 0 1 999 4 1982 2020 0 0 0 0 0 0  
1 3 1 2 74.85672 5 150 0 1 999 4 1982 2020 0 0 0 0 0 0  
1 4 2 2 4.187324 0.01 20 0 1 999 4 1982 2020 0 0 0 0 0 0  
# Trawl_Bycatch  
2 5 1 0 109.931 5 185 0 1 999 4 1982 2020 0 0 0 0 0 0  
2 6 2 0 11.86826 0.01 20 0 1 999 4 1982 2020 0 0 0 0 0 0  
# NMFS_Trawl_1982  
3 7 1 1 42.19018 5 300 0 1 999 4 1982 2020 0 0 0 0 0 0  
3 8 2 1 4.997241 0.01 20 0 1 999 4 1982 2020 0 0 0 0 0 0  
3 9 1 2 42.19018 5 300 0 1 999 4 1982 2020 0 0 0 0 0 0  
3 10 2 2 4.997241 0.01 20 0 1 999 4 1982 2020 0 0 0 0 0 0  
# NMFS_Trawl_1989  
4 11 1 1 36.25999 5 300 0 1 999 4 1982 2020 0 0 0 0 0 0  
4 12 2 1 4.997241 0.01 20 0 1 999 4 1982 2020 0 0 0 0 0 0  
4 13 1 2 36.29074 5 100 0 1 999 4 1982 2020 0 0 0 0 0 0  
4 14 2 2 4.997241 0.01 20 0 1 999 4 1982 2020 0 0 0 0 0 0  
# BSFRF_2009  
5 15 1 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
5 16 2 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
5 17 3 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
5 18 4 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
5 19 5 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
5 20 6 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
5 21 7 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
5 22 8 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
5 23 9 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
5 24 10 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
5 25 11 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
5 26 12 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
5 27 13 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
5 28 14 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
5 29 15 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
5 30 16 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
5 31 17 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
5 32 18 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
5 33 19 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
5 34 20 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
5 35 21 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
5 36 22 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
5 37 1 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
5 38 2 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
5 39 3 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
5 40 4 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
5 41 5 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
5 42 6 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
5 43 7 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
5 44 8 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
5 45 9 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
5 46 10 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
5 47 11 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
5 48 12 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
5 49 13 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
5 50 14 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
5 51 15 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
5 52 16 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
5 53 17 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
5 54 18 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
5 55 19 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
5 56 20 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
5 57 21 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
5 58 22 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
# NMFS_2009  
6 59 1 1 0.01 1e-05 100 0 1 999 -6 1982 2020 0 0 0 0 0 0  
6 60 1 2 0.01 1e-05 100 0 1 999 -6 1982 2020 0 0 0 0 0 0  
# BSFRF_2010  
7 61 1 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
7 62 2 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
7 63 3 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
7 64 4 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
7 65 5 1 0.999999 1e-05 1 0 0 999 -1 1982 2020 0 0 0 0 0 0  
7 66 6 1 0.999999 1e-05 1 0 0 999 -1 1982 2020 0 0 0 0 0 0  
7 67 7 1 0.999999 1e-05 1 0 0 999 -1 1982 2020 0 0 0 0 0 0  
7 68 8 1 0.999999 1e-05 1 0 0 999 -1 1982 2020 0 0 0 0 0 0  
7 69 9 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
7 70 10 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
7 71 11 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
7 72 12 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
7 73 13 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
7 74 14 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
7 75 15 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
7 76 16 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
7 77 17 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
7 78 18 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
7 79 19 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
7 80 20 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
7 35 21 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
7 36 22 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
7 37 1 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
7 38 2 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
7 39 3 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
7 40 4 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
7 41 5 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
7 42 6 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
7 43 7 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
7 44 8 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
7 45 9 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
7 46 10 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
7 47 11 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
7 48 12 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
7 49 13 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
7 50 14 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
7 51 15 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
7 52 16 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
7 53 17 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
7 54 18 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
7 55 19 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
7 56 20 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
7 57 21 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
7 58 22 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0  
# NMFS_2010  
8 59 1 1 0.01 1e-05 100 0 1 999 -6 1982 2020 0 0 0 0 0 0  
8 59 1 2 0.01 1e-05 100 0 1 999 -6 1982 2020 0 0 0 0 0 0  

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
-1 61 1 1 96.03919 1 190 1 96 10 4 1982 2020 0 0 0 0 0 0  
-1 62 2 1 2.197131 0.001 20 0 1 999 4 1982 2020 0 0 0 0 0 0  
-1 63 1 2 595 1 999 0 1 999 -3 1982 2020 0 0 0 0 0 0  
# Trawl_Bycatch  
-2 64 1 0 595 1 999 0 1 999 -3 1982 2020 0 0 0 0 0 0  
# NMFS_Trawl_1982  
-3 65 1 0 595 1 999 0 1 999 -3 1982 2020 0 0 0 0 0 0  
# NMFS_Trawl_1989  
-4 66 1 0 595 1 999 0 1 999 -3 1982 2020 0 0 0 0 0 0  
# BSFRF_2009  
-5 67 1 0 595 1 999 0 1 999 -3 1982 2020 0 0 0 0 0 0  
# NMFS_2009  
-6 68 1 0 595 1 999 0 1 999 -3 1982 2020 0 0 0 0 0 0  
# BSFRF_2010  
-7 67 1 0 595 1 999 0 1 999 -3 1982 2020 0 0 0 0 0 0  
# NMFS_2010  
-8 68 1 0 595 1 999 0 1 999 -3 1982 2020 0 0 0 0 0 0  

#_Number of asymptotic retention parameter
0 
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
-1 

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
0.6 0.01 1 5 0 0.843136 0.03 0 1 1
0.6 0.01 1 5 0 0.843136 0.03 0 1 1
0.6 0.01 1 5 0 0.45136 0.5 0 1 1
0.6 0.01 1 5 0 0.453136 0.5 0 1 1
0.9999 0.01 1 -5 0 0.843136 0.03 0 1 1
0.9999 0.01 1 -5 0 0.843136 0.03 0 1 1
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
1e-04 1e-05 10 -4 0 1 100
1e-04 1e-05 10 -4 0 1 100
1e-04 1e-05 10 -4 0 1 100
1e-04 1e-05 10 -4 0 1 100
1e-04 1e-05 10 -4 0 1 100
1e-04 1e-05 10 -4 0 1 100
 
# Additional variance control for each survey (0 = ignore; >0 = use)
0 0 0 0 0 0 
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
1 0.0505 0.5 45.5 1 1 -12 4 -10 10 -10 10
0.018 1 0.5 45.5 1 -1 -12 4 -10 10 -10 10
0 0 2 20 -1 -1 -12 4 -10 10 -10 10
0 0 2 20 -1 -1 -12 4 -10 10 -10 10
0 0 2 20 -1 -1 -12 4 -10 10 -10 10
0 0 2 20 -1 -1 -12 4 -10 10 -10 10
0 0 2 20 -1 -1 -12 4 -10 10 -10 10
0 0 2 20 -1 -1 -12 4 -10 10 -10 10
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
2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 # Type of likelihood for the size-composition
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 # Option for the auto tail compression
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 # Initial value for effective sample size multiplier
-4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 # Phase for estimating the effective sample size
1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 # Composition appender (Should data be aggregated?)
1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 # Type-like predictions
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 # Lambda: multiplier for the effective sample size
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 # Emphasis: multiplier for weighting the overall likelihood
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
0 
# Phase of estimation
4 
# Standard deviation in M deviations
2 
# Number of nodes for cubic spline or number of step-changes for option 3
# -> One line per sex
3
3
# Year position of the knots for each sex (vector must be equal to the number of nodes)
# -> One line per sex
2018 2019 2020 
2018 2019 2020 
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
2 0 3 4 0
2 0 3 4 0
2 0 3 4 0
1 0 3 4 0
1 0 3 4 0
1 0 3 4 0
2 0 3 4 0
2 0 3 4 0
2 0 3 4 0
3 0 3 4 0
3 0 3 4 0
3 0 3 4 0
# -------------------------------------- #

# -------------------------------------- #
## Tagging controls
# -------------------------------------- #
# Emphasis (likelihood weight) on tagging
1 
# -------------------------------------- #

# -------------------------------------- #
##  Immature/mature natural mortality 
# -------------------------------------- #
# maturity specific natural mortality? ( 0 = No; 1 = Yes - only for use if nmature > 1)
1 
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
0 -4 4 4 1 0 0.05
0 -4 4 4 1 0 0.05
# -------------------------------------- #

# -------------------------------------- #
## Other (additional) controls
# -------------------------------------- #
# First year of recruitment estimation deviations
1982 
# Last year of recruitment estimation deviations
2020 
# Consider terminal molting? (0 = No; 1 = Yes
1 
# Phase for recruitment estimation
1 
# Phase for recruitment sex-ratio estimation
2 
# Initial value for expected sex-ratio
0.5 
# Phase for initial recruitment estimation
-3 
# Initial conditions (1 = unfished, 2 = steady-state, 3 = free params, 4 = free params revised)
3 
# Proportion of mature male biomass for SPR reference points
1 
# Stock-Recruit-Relationship (0 = none, 1 = Beverton-Holt) 
0 
# Use years specified to computed average sex ratio in the calculation of average recruitment for reference points
# -> 0 = No, i.e. Rec based on End year; 1 = Yes 
0 
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
1 1 0 0
1 0 0 0
0 0 0 0
0 0 0 0
0 0 0 0
0 0 0 0
0 0 0 0
0 0 0 0

# Account for priors (penalties)
# ************************************** #
10000 	#_ Log_fdevs 
0 	#_ meanF 
1 	#_ Mdevs 
1 	#_ Rec_devs 
15 	#_ Initial_devs 
1 	#_ Fst_dif_dev 
3 	#_ Mean_sex-Ratio 
60 	#_ Molt_prob 
3 	#_ Free_selectivity 
5 	#_ Init_n_at_len 
0 	#_ Fvecs 
0 	#_ Fdovs 
0 	#_ Vul_devs 

# -------------------------------------- #

# -------------------------------------- #
## End of control file
# -------------------------------------- #
9999

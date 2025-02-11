# ============================================================ #
#                  GMACS main control file 
# 
#_*** 
#_GMACS Version 2.10.05 
#_Last GMACS mofification made by: ** MV ** 
#_Date of writing the control file: 2025-02-11 05:44:36 
#_*** 
# 
#_Stock of interest: WAG 
#_Model name: model_21_1e 
#_Year of assessment: 2021 
# ============================================================ #

# -------------------------------------- #
##_Time blocks set up
# -------------------------------------- #
#_Number of blocks to be used in the model
#_if set to 0: this means 1 block corresponding to the year range
0 
#_Number of sub-blocks per group (i.e., within each block)
#_This occurs after the first block, i.e. 1 means two sub-blocks

#_Block definition - set the limits of each sub-block
#_The first block always start with the start year

# -------------------------------------- #

# -------------------------------------- #
## Other (additional) controls
# -------------------------------------- #
# First year of recruitment estimation deviations
1960 
# Last year of recruitment estimation deviations
2021 
# Consider terminal molting? (0 = No; 1 = Yes
0 
# Phase for recruitment estimation
1 
# Phase for recruitment sex-ratio estimation
-2 
# Initial value for expected sex-ratio
0.5 
# Initial conditions (1 = unfished, 2 = steady-state, 3 = free params, 4 = free params revised)
0 
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
##_Key parameter controls
# -------------------------------------- #
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
0.21 0.01 1 -3 2 0.18 0.04 			# M-base
7.569556 -10 20 1 0 -10 20 			# Log_R0
12 -10 20 -3 0 -10 20 			# Log_Rinitial
8 -10 20 -1 0 -10 20 			# Log_Rbar
110 103 165 -2 1 72.5 7.25 			# Recruitment_ra-males
0.9613186 0.001 20 3 0 0.1 5 			# Recruitment_rb-males
-0.6931472 -10 0.75 -1 0 -10 0.75 			# log_SigmaR
0.73 0.2 1 -2 3 3 2 			# Steepness
0.001 0 1 -3 3 1.01 1.01 			# Rho
# -------------------------------------- #

# -------------------------------------- #
##_Allometry
# -------------------------------------- #
#_Length-weight type/method
#_1 = Length-weight relationship parameters (w_l = a[s]*l^b[s]): vector of sex specific parameters for each maturity type:
#_(i.e., immature males, mature males, immature females, mature females).
#_2 = Input vector of mean weight-at-size by sex (dim=[1:nclass]) and maturity type (i.e., matrix of dim=[nsex*nmature,nclass]) 
#_3 = Input matrix of mean weight-at-size by sex and year for each maturity type (dim=[nsex*nmature*Nyear; nclass])
2 
#_vector of male mean weight-at-size for each maturity type.
#_size_Class_1 size_Class_2 size_Class_3 size_Class_4 size_Class_5 size_Class_6 size_Class_7 size_Class_8 size_Class_9 size_Class_10 size_Class_11 size_Class_12 size_Class_13 size_Class_14 size_Class_15 size_Class_16 size_Class_17 
0.5815157 0.6793282 0.7880323 0.9082783 1.040724 1.186036 1.344888 1.517961 1.705944 1.909531 2.129426 2.366337 2.62098 2.894077 3.186357 3.498554 3.993658 
# -------------------------------------- #

# -------------------------------------- #
##_Fecundity for MMB/MMA calculation
# -------------------------------------- #
#_Maturity definition: Proportion of mature at size by sex
#_size_Class_1 size_Class_2 size_Class_3 size_Class_4 size_Class_5 size_Class_6 size_Class_7 size_Class_8 size_Class_9 size_Class_10 size_Class_11 size_Class_12 size_Class_13 size_Class_14 size_Class_15 size_Class_16 size_Class_17 
0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
#_Legal definition of the proportion of mature at size by sex
#_size_Class_1 size_Class_2 size_Class_3 size_Class_4 size_Class_5 size_Class_6 size_Class_7 size_Class_8 size_Class_9 size_Class_10 size_Class_11 size_Class_12 size_Class_13 size_Class_14 size_Class_15 size_Class_16 size_Class_17 
0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 
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
#_4 = Post-molt size is gamma distributed
#_5 = Von-Bertalanffy: kappa varies among individuals
#_6 = Von-Bertalanffy: Linf varies among individuals
#_7 = Von-Bertalanffy: kappa and Ling varies among individuals
#_8 = Growth increment is normally distributed
# ************************************** #
8 
 
#_Growth increment model matrix
# ************************************** #
#_0 = Pre-specified growth increment
#_1 = linear (alpha; beta parameters)
#_2 = Estimated by size-class (i.e., individual)
#_3 = Pre-specified by size-class (i.e., individual - empirical approach)
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
2 
 
#_Maximum of size-classes to which recruitment must occur (males then females)
5 
#_Use functional maturity for terminally molting animals? (0 = No; 1 = Yes)
0 
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
25.19667 10 50 7 0 0 20 			# Alpha_Male_period_1
0.09028771 -0.4 20 7 0 0 10 			# Beta_Male_period_1
3.667971 0.01 5 7 0 0 3 			# Gscale_Male_period_1

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
141.1001 65 165 7 0 0 999 			# Molt_probability_mu_Male_period_1
0.1029206 -0.1 2 7 0 0 2 			# Molt_probability_CV_Male_period_1

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
# 

#_Custom molt probability matrix  (if any)
# 

#_Custom maturity probability matrix  (if any)
# 
# -------------------------------------- #

# -------------------------------------- #
##_Natural mortality rates controls
# -------------------------------------- #
 
#_Natural mortality rates definition
# ************************************** #
#_For each combination sex*mature state, the set up line columns are:
#_Relative:
#_-> 0 = absolute values
#_-> 1+ = based on another (subsequent) M-at-size vector (indexed by the combination sex*mature)
#_Natural mortality rate type:
#_-> 0 = standard
#_-> 1 = Spline (implies to provide the number of knots for each combination sex*mature - see Extra)
#_Extra: specification of the number of knots when the type is a spline
#_M_size_breakpnts: number of changes in M by size
#_Mirror: Mirror M-at-size over to that for another partition (indexed by the combination sex*mature)
#_Block: Refers to the block number for time-varying M-at-size
#_Block_fn:
#_-> 0 = absolute values
#_-> 1 = exponential
#_Env_Link: Environmental link:
#_-> 1 = additive
#_-> 2 = multiplicative
#_-> 3 = exponential
#_EnvL_var: Environmental variable
#_Rand_Walk:
#_-> 0 = no random walk changes
#_-> 1 = otherwise
#_RW_block: Refer to the block number for random walks
#_Sigma_RW: Sigma for the random walk parameters
#_Mirror_RW: Should time-varying aspects be mirrows (Indexed by the combination sex*mature)
# ************************************** #

#_Relative?_| Type_| Extra_| size_breakpnts_| Mirror_| Block_| Block_fn_| Env_Link_| EnvL_var_| Rand_Walk_| RW_block_| Sigma_RW_| Mirror_RW
0 0 0 0 0 0 0 0 0 0 0 0 0 			# Male ; BothMature
 
#_Natural mortality rates parameters
# ************************************** #
#_For each parameter columns are:
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
# ************************************** #
 
#_Init_val_| Lower_Bd_| Upper_Bd_| Prior_type_| p1_| p2_| Phase
0.21 0.01 1 2 0.18 0.04 -3 			# Male (BothMature)
# -------------------------------------- #

# -------------------------------------- #
##_Vulnerability parameter controls
# 
#_Vulnerability is the combination of selectivity and retention selectivity.
#_Gmacs requires that each gear has a vulnerability.
# -------------------------------------- #

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
#_Pot_Fishery_| Trawl_Bycatch_|  

# Selectivity
#_ Gear-1 | Gear-2 
#_ Pot_Fishery | Trawl_Bycatch |  
2 1 #_Number of selectivity time period per fleet
0 0 #_Sex specific selectivity
2 5 #_Selectivity type
0 0 #_Insertion of fleet in another
0 0 #_Extra parameter for each pattern

#_Retention
#_Gear-1 | Gear-2#_Pot_Fishery_| Trawl_Bycatch_| 
1 1 #_Number of Retention time period per fleet
0 0 #_Sex specific Retention
2 6 #_Selectivity type
1 0 #_retention flag (0 = No, 1 = Yes)
0 0 #_Extra parameter for each pattern
1 1 #_Selectivity for the maximum size class if forced to be 1?
 
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
#_Pot_Fishery  
1 1 1 0 134.9011 105 180 0 100 190 3 1960 2004 0 0 0 0 0 0 			# Sel_Pot_Fishery_Male_period_1_par_1
1 2 2 0 18.43161 0.01 20 0 0.1 50 3 1960 2004 0 0 0 0 0 0 			# Sel_Pot_Fishery_Male_period_1_par_2
1 3 1 0 134.4369 105 180 0 100 190 3 2005 2021 0 0 0 0 0 0 			# Sel_Pot_Fishery_Male_period_2_par_1
1 4 2 0 7.435699 0.01 20 0 0.1 50 3 2005 2021 0 0 0 0 0 0 			# Sel_Pot_Fishery_Male_period_2_par_2
#_Trawl_Bycatch  
2 5 1 0 1 0.99 1.02 0 10 200 -3 1960 2021 0 0 0 0 0 0 			# Sel_Trawl_Bycatch_Male_period_1_par_1

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
#_Pot_Fishery  
-1 6 1 0 136.0095 105 180 0 100 190 3 1960 2021 0 0 0 0 0 0 			# Ret_Pot_Fishery_Male_period_1_par_1
-1 7 2 0 1.869278 1e-04 20 0 0.1 50 3 1960 2021 0 0 0 0 0 0 			# Ret_Pot_Fishery_Male_period_1_par_2
#_Trawl_Bycatch  
-2 8 1 0 1 0.99 1.01 0 10 200 -3 1960 2021 0 0 0 0 0 0 			# Ret_Trawl_Bycatch_Male_period_1_par_1

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
1 1 1960 1e-06 0 1 -3 			# AsympRet_fleet_Pot_Fishery_sex_Male_year_1960

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
##_Catchability controls
# -------------------------------------- #
 
#_Catchability definition
# ************************************** #
#_For each survey index, the set up line columns fro catchability parameters are:
#_Q_analytic: Do we need to solve analytically Q? (0 = No; 1 = Yes)
#_CV_mult: multiplier for the input survey CV
#_Loglik_mult: weight for the likelihood (emphasis)
#_Mirror: Mirror survey catchability over to that for another partition (indexed by the combination survey*sex)
#_Block: Refers to the block number for time-varying catchability
#_Env_Link: Environmental link:
#_-> 1 = additive
#_-> 2 = multiplicative
#_-> 3 = exponential
#_EnvL_var: Environmental variable
#_Rand_Walk:
#_-> 0 = no random walk changes
#_-> 1 = otherwise
#_RW_block: Refer to the block number for random walks
#_Sigma_RW: Sigma for the random walk parameters
# ************************************** #

#_Q_analytic_| CV_mult_| Loglik_mult_| Mirror_| Block_| Env_Link_| EnvL_var_| Rand_Walk_| RW_block_| Sigma_RW
0 1 1 0 0 0 0 0 0 0 			# Survey_q 1 Pot_Fishery Male
0 1 1 0 0 0 0 0 0 0 			# Survey_q 2 Pot_Fishery Male
0 1 1 0 0 0 0 0 0 0 			# Survey_q 3 Pot_Fishery Male
 
#_Catchability priors
# ************************************** #
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
# ************************************** #

#_Init_val_| Lower_Bd_| Upper_Bd_| Prior_type_| p1_| p2_| Phase
0.001038534 1e-07 0.01 0 0 1 1 			# Log_vn_comp_1_Pot_Fishery_Male
0.001080062 1e-07 0.01 0 0 1 1 			# Log_vn_comp_2_Pot_Fishery_Male
0.000674553 1e-07 0.01 0 0 1 1 			# Log_vn_comp_3_Pot_Fishery_Male
# -------------------------------------- #

# -------------------------------------- #
##_Additional CV controls for surveys/indices
# -------------------------------------- #
 
#_Additional CV definition
# ************************************** #
#_For each survey index, the set up line columns fro catchability parameters are:
# ************************************** #
#_Mirror: Mirror survey catchability over to that for another partition (indexed by the combination survey*sex)
#_Block: Refers to the block number for time-varying catchability
#_Env_Link: Environmental link:
#_-> 1 = additive
#_-> 2 = multiplicative
#_-> 3 = exponential
#_EnvL_var: Environmental variable
#_Rand_Walk:
#_-> 0 = no random walk changes
#_-> 1 = otherwise
#_RW_block: Refer to the block number for random walks
#_Sigma_RW: Sigma for the random walk parameters
# ************************************** #

#_Mirror_| Block_| Env_Link_| EnvL_var_| Rand_Walk_| RW_block_| Sigma_RW
0 0 0 0 0 0 0 			# era 1 Pot_Fishery Male
0 0 0 0 0 0 0 			# era 2 Pot_Fishery Male
0 0 0 0 0 0 0 			# era 3 Pot_Fishery Male
 
#_Parameter definition
# ************************************** #
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
# ************************************** #

#_Init_val_| Lower_Bd_| Upper_Bd_| Prior_type_| p1_| p2_| Phase_|
0.00017292 1e-07 0.5 0 0.5 100 6 			# Log_add_cvt_survey_1
8.2029e-05 1e-07 0.5 0 0.5 100 6 			# Log_add_cvt_survey_2
0.000140039 1e-07 0.5 0 0.5 100 6 			# Log_add_cvt_survey_3
 
# -------------------------------------- #

# -------------------------------------- #
##_Penalties for the average fishing mortality rate
# -------------------------------------- #
 
# ************************************** #
#_Fishing mortality controls
# ************************************** #
#_Mean_F_male: mean male fishing mortality (base value for the fully-selected F) #
#_Female_Offset: Offset between female and male fully-selected F  #
#_Pen_std_Ph1 & Pen_std_Ph2: penalties on the fully-selected F during the early and later phase, respectively  #
#_Ph_Mean_F_male & Ph_Mean_F_female: Phases to estimate the fishing mortality for males and females, respectively #
#_Low_bd_mean_F & Up_bd_mean_F: Range for the mean fishing mortality (lower and upper bounds, respectivly) #
#_Low_bd_Y_male_F & Up_bd_Y_male_F: Range for the male fishing mortality (lower and upper bounds, respectivly) #
#_Low_bd_Y_female_F & Up_bd_Y_female_F: Range for the female fishing mortality (lower and upper bounds, respectivly)#
# ************************************** #
#_Mean_F_male_| Female_Offset_| Pen_std_Ph1_| Pen_std_Ph2_| Ph_Mean_F_male_| Ph_Mean_F_female_| Low_bd_mean_F_| Up_bd_mean_F_| Low_bd_Y_male_F_| Up_bd_Y_male_F_| Low_bd_Y_female_F_| Up_bd_Y_female_F 
0.4878267 0 3 15 2 -1 -12 5 -10 10 -10 10 			# log_fbar_Pot_Fishery
0.00027863 0 4 15 2 -1 -12 5 -10 10 -10 10 			# log_fbar_Trawl_Bycatch
# -------------------------------------- #

# -------------------------------------- #
###_Size composition data control
# -------------------------------------- #
 
# ************************************** #
#_Available types of likelihood:
#_-> 0 = Ignore size-composition data in model fitting
#_-> 1 = Multinomial with estimated/fixed sample size
#_-> 2 = Robust approximation to multinomial
#_-> 5 = Dirichlet
#_Auto tail compression (pmin):
#_-> pmin is the cumulative proportion used in tail compression
#_Type-like prediction (1 = catch-like predictions; 2 = survey-like predictions)
#_Lambda: multiplier for the effective sample size
#_Emphasis: multiplier for weighting the overall likelihood
# ************************************** #
 
#_The number of columns corresponds to the number size-composition data frames
1 1 #_Type of likelihood for the size-composition
0 0 #_Option for the auto tail compression
1 1 #_Initial value for effective sample size multiplier
-4 -4 #_Phase for estimating the effective sample size
1 2 #_Composition appender (Should data be aggregated?)
1 1 #_Type-like predictions
0.4122851 0.5453008 #_Lambda: multiplier for the effective sample size
1 1 #_Emphasis: multiplier for weighting the overall likelihood
# -------------------------------------- #

# -------------------------------------- #
##_Time-varying Natural mortality controls
# -------------------------------------- #
 
# ************************************** #
#_Available types of M specification:
#_-> 0 = Constant natural mortality
#_-> 1 = Random walk (deviates constrained by variance in M)
#_-> 2 = Cubic Spline (deviates constrained by nodes & node-placement)
#_-> 3 = Blocked changes (deviates constrained by variance at specific knots)
#_-> 4 = Natural mortality is estimated as an annual deviation
#_-> 5 = Deviations in M are estimated for specific periods relatively to the M estimated in the first year of the assessment
#_-> 6 = Deviation in M are estimated for specific periods relatively to M during the current year
# ************************************** #
#_Type of natural mortality
0 
#_Is female M relative to M male?
#_0: No (absolute); 1: Yes (relative) 

#_Phase of estimation
3 
#_Standard deviation in M deviations
0.25 
#_Number of nodes for cubic spline or number of step-changes for option 3
#_-> One line per sex
1
#_Year position of the knots for each sex (vector must be equal to the number of nodes)
#_-> One line per sex
1960 
#_number of breakpoints in M by size
0 
#_Size positions of breakpoints in M by size class
 
#_Specific initial value for natural mortality deviations
0 
#_Natural mortality deviation controls
# ************************************** #
#_Init_val: Initial value for the parameter (must lie between lower and upper bounds)
#_Lower_Bd & Upper_Bd: Range for the parameter
#_Phase: Set equal to a negative number not to estimate
#_Size_spec: Are the deviations size-specific ? (integer that specifies which size-class (negative to be considered))
# ************************************** #
#_Init_val_| Lower_Bd_| Upper_Bd_| Phase_| Size_spec

# -------------------------------------- #

# -------------------------------------- #
##_Tagging controls
# -------------------------------------- #
#_Emphasis (likelihood weight) on tagging
1 
# -------------------------------------- #

# -------------------------------------- #
##_Immature/mature natural mortality 
# -------------------------------------- #
#_maturity specific natural mortality? ( 0 = No; 1 = Yes - only for use if nmature > 1)
0 
#_immature/mature natural mortality controls
# ************************************** #
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
0 -1 1 -1 0 1 1 			# m_mat_mult_Male
# -------------------------------------- #

# -------------------------------------- #
##_Emphasis factor (weights for likelihood) controls
# -------------------------------------- #
#_Weights on catches for the likelihood component
4 2 1 

#_Penalties on deviations
# ************************************** #
#_Fdev_total_| Fdov_total_| Fdev_year_| Fdov_year 
0 0 0.001 0 			# Pot_Fishery
0 0 0.001 0 			# Trawl_Bycatch

#_Account for priors (penalties)
# ************************************** #
0 	#_Log_fdevs 
0 	#_meanF 
0 	#_Mdevs 
2 	#_Rec_devs 
0 	#_Initial_devs 
0 	#_Fst_dif_dev 
0 	#_Mean_sex-Ratio 
0 	#_Molt_prob 
0 	#_Free_selectivity 
0 	#_Init_n_at_len 
1 	#_Fvecs 
0 	#_Fdovs 
0 	#_Vul_devs 

# -------------------------------------- #

# -------------------------------------- #
##_End of control file
# -------------------------------------- #
9999

# TheHeader
## GMACS Version  2.01.L04; ** AEP **; Compiled 2023-02-04 11:48:34
# ntheta
9
# Core parameters
## Initial: Initial value for the parameter (must lie between lower and upper)
## Lower & Upper: Range for the parameter
## Phase: Set equal to a negative number not to estimate
## Prior type:
## 0: Uniform   - parameters are the range of the uniform prior
## 1: Normal    - parameters are the mean and sd
## 2: Lognormal - parameters are the mean and sd of the log
## 3: Beta      - parameters are the two beta parameters [see dbeta]
## 4: Gamma     - parameters are the two gamma parameters [see dgamma]
# Initial_value Lower_bound Upper_bound Phase Prior_type Prior_1 Prior_2
0.21 0.01 1 -3 2 0.18 0.04
7.79381 -10 20 1 0 -10 20
12 -10 20 -3 0 -10 20
8 -10 20 -1 0 -10 20
110 103 165 -2 1 72.5 7.25
15.1831 0.001 20 3 0 0.1 5
-0.693147 -10 0.75 -1 0 -10 0.75
0.73 0.2 1 -2 3 3 2
0.001 0 1 -3 3 1.01 1.01
# lw_type
2
# maturity
 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# legal
 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1
## Options for the growth matrix
## 1: Fixed growth transition matrix (requires molt probability)
## 2: Fixed size transition matrix (molt probability is ignored)
## 3: Growth increment is gamma distributed
## 4: Post-molt size is gamma distributed
## 5: Von Bert.: kappa varies among individuals
## 6: Von Bert.: Linf varies among individuals
## 7: Von Bert.: kappa and Linf varies among individuals
## 8: Growth increment is normally distributed
# bUseCustomGrowthMatrix
8
## Options for the growth increment model matrix
## 1: Linear
## 2: Individual
## 3: Individual (Same as 2)
# bUseGrowthIncrementModel
1
# bUseCustomMoltProbability
2
# nSizeClassRec
 5
# nSizeIncVaries
 1
# Start of the blocks in which molt increment changes (one row for each sex) - the first block starts in 1960
# Note: there is one less year than there are blocks
 # male
# nMoltVaries
 1
# Start of the blocks in which molt probability changes (one row for each sex) - the first block starts in 1960
# Note: there is one less year than there are blocks
# iYrsMoltChanges:
 # male
# BetaParRelative
1
# Growth parameters
# Initial_value Lower_bound Upper_bound Phase Prior_type Prior_1 Prior_2
 26.5306 10 50 7 0 0 20
 0.0994392 -0.4 20 7 0 0 10
 3.704 0.01 5 7 0 0 3
 141.03 65 165 7 0 0 999
 0.0750563 -0.1 2 7 0 0 2
#  * Selectivity parameter controls
# 
## Selectivity parameter controls
# ## Selectivity (and retention) types
# ##  <0: Mirror selectivity
# ##   0: Nonparametric selectivity (one parameter per class)
# ##   1: Nonparametric selectivity (one parameter per class, constant from last specified class)
# ##   2: Logistic selectivity (inflection point and slope)
# ##   3: Logistic selectivity (50% and 95% selection)
# ##   4: Double normal selectivity (3 parameters)
# ##   5: Flat equal to zero (1 parameter; phase must be negative)
# ##   6: Flat equal to one (1 parameter; phase must be negative)
# ##   7: Flat-topped double normal selectivity (4 parameters)
# ##   8: Declining logistic selectivity with initial values (50% and 95% selection plus extra)
# ##   9: Cubic-spline (specified with knots and values at knots)
# ##  10: One parameter logistic selectivity (inflection point and slope)
# ## Extra (type 1): number of selectivity parameters to estimated
# #  Pot_Fishery Trawl_Bycatch
#  # selectivity periods
# slx_nsel_period_in
 2 1
#  # sex specific selectivity (1=Yes, 0=No)
# slx_bsex_in
 0 0
#  # selectivity type (by sex)
# slx_type_in
 2 5
#  # selectivity within another gear
# slx_include_in
 0 0
#  # extra parameters for each pattern
# slx_extra_in
 0 0
#  # retention periods 
# ret_nret_period_in
 1 1
#  # sex specific retention (1=Yes, 0=No)
# ret_bsex_in
 0 0
#  # retention type (by sex)
# ret_type_in
 2 6
#  # retention flag
# slx_nret
 1 0
#  # extra parameters for each pattern
# ret_extra_in
 0 0
#  # Is maximum selectivity at size is forced to equal 1 or not
# slx_max_at_1_in
 1 1
#  
# Selectivity parameters
## Fleet: The index of the fleet  (positive for capture selectivity; negative for retention)
## Index: Parameter count (not used)
## Parameter_no: Parameter count within the current pattern (not used)
## Sex: Sex (not used)
## Initial: Initial value for the parameter (must lie between lower and upper)
## Lower & Upper: Range for the parameter
## Phase: Set equal to a negative number not to estimate
## Prior type:
## 0: Uniform   - parameters are the range of the uniform prior
## 1: Normal    - parameters are the mean and sd
## 2: Lognormal - parameters are the mean and sd of the log
## 3: Beta      - parameters are the two beta parameters [see dbeta]
## 4: Gamma     - parameters are the two gamma parameters [see dgamma]
## Start / End block: years to define the current block structure
# Fleet Index Parameter_no Sex Initial Lower_bound Upper_bound Phase Prior_type Prior_1 Prior_2 Start_block End_block
 1 1 1 0 82.0515 105 180 0 100 190 3 1960 2004
 1 2 2 0 0.91689 0.01 40 0 0.1 50 3 1960 2004
 1 3 1 0 133.718 105 180 0 100 190 3 2005 2021
 1 4 2 0 8.12689 0.01 20 0 0.1 50 3 2005 2021
 2 5 1 0 1 0.99 1.02 0 10 200 -3 1960 2021
 -1 6 1 0 136.203 105 180 0 100 190 3 1960 2021
 -1 7 2 0 2.12154 0.0001 20 0 0.1 50 3 1960 2021
 -2 8 1 0 1 0.99 1.01 0 10 200 -3 1960 2021
#Number of asymptotic selectivity parameters
1
# Fleet Sex Year Initial lower_bound upper_bound phase
 1 1 1960 1e-06 0 1 -3
#Catchability
# Initial Lower_bound Upper_bound Phase Prior_type Prior_1 Prior_2 Index_lambda Index_lambda
 0.000393337 1e-07 0.01 1 0 0 1 0 1 1
 0.000313924 1e-07 0.01 1 0 0 1 0 1 1
 0.000369687 1e-07 0.01 1 0 0 1 0 1 1
# Index CV
# Initial Lower_bound Upper_bound Phase Prior_type Prior_1 Prior_2
 0.000162542 1e-07 0.5 6 0 0.5 100
 0.000152979 1e-07 0.5 6 0 0.5 100
 0.000230704 1e-07 0.5 6 0 0.5 100
# Additional variance controls
# 0 ignore; >0 use
 1 2 3
# Controls on F
# Initial_male_f Initial_female_F Penalty_SD (early phase) Penalty_SD (later Phase) Phase_mean_F_male Phase_mean_F_female Lower_bound_mean_F Upper_bound_mean_F Lower_bound_annual_male_F Upper_bound_annual_male_F Lower_bound_annual_female_F Upper_bound_annual_female_F
 0.262545 0 3 15 2 -1 -12 5 -10 10 -10 10
 0.000202008 0 4 15 2 -1 -12 5 -10 10 -10 10
# Options when fitting size-composition data
## Likelihood types: 
##  1:Multinomial with estimated/fixed sample size
##  2:Robust approximation to multinomial
##  3:logistic normal
##  4:multivariate-t
##  5:Dirichlet

#  Pot_Fishery Pot_Fishery
#  male male
#  retained total
#  all_shell all_shell
#  immature+mature immature+mature
 1 1 # Type of likelihood
 0 0 # Auto tail compression (pmin)
 1 1 # Initial value for effective sample size multiplier
 -4 -4 # Phz for estimating effective sample size (if appl.)
 1 2 # Composition aggregator codes
 1 1 # Set to 1 for catch-based predictions; 2 for survey or total catch predictions
 0.592644 0.469458 # Lambda for effective sample size
 1 1 # Lambda for overall likelihood
# Type of M specification
## 1: Time-invariant M
## 2: Default random walk M
## 3: Cubic spline with time M
## 4: Blocked changes in  M
## 5: Blocked changes in  M (type 2)
## 6: Blocked changes in  M (returns to default)
# m_type
0
# Mdev_phz_def
3
# m_stdev
0.25
# m_nNode_sex
1 # male
# Start of the blocks in which M changes (one row for each sex) - the first block starts in 1960
# Note: there is one less year than there are blocks
 1960 # male
# nSizeDevs
0
# Start of the size-class blocks in which M changes (one row for each sex) - the first block start at size-class 1
# Note: there is one less size-class than there are blocks (no input implies M is independent of size
# m_size_nodeyear

# Init_Mdev
8
# # Init_MDev==NO
1 # tag_emphasis
# # maturity specific natural mortality? (yes = 1; no = 0; only for use if nmature > 1)
# m_maturity
0
# # Initial Lower_bound Upper_bound Phase Prior_type Prior_1 Prior_2
 0 -1 1 -1 0 1 1

# Extra controls
1960 # First year of recruitment estimation
2021 # Last year of recruitment estimation
0 # Consider terminal molting (0 = off, 1 = on). If on, the calc_stock_recruitment_relationship() isn't called in the procedure
1 # Phase for recruitment estimation
-2 # Phase for recruitment sex-ratio estimation
0.5 # Initial value for recruitment sex-ratio
-3 # Phase for initial recruitment estimation
1 # VERBOSE FLAG (0 = off, 1 = on, 2 = objective func; 3 diagnostics)
0 # Initial conditions (0 = Unfished, 1 = Steady-state fished, 2 = Free parameters, 3 = Free parameters (revised))
1 # Lambda (proportion of mature male biomass for SPR reference points)
0 # Stock-Recruit-Relationship (0 = none, 1 = Beverton-Holt)
10 # Maximum phase (stop the estimation after this phase)
-1 # Maximum number of function calls
1 # Calculate reference points (0=no)
1 # Use years specified to computed average sex ratio in the calculation of average recruitment for reference points (0 = off -i.e. Rec based on End year, 1 = on)
200 # Years to compute equilibria

# ## Emphasis Factors (Catch: number of catch dataframes) ##
# nCatchDF
3
# catch_emphasis
 4 2 1
# ## Emphasis Factors (Fdev Penalties; number of fleets) ##
# nfleet
2
# Penalty_fdevs
 0 0 0.001 0
 0 0 0.001 0
# ## Emphasis Factors (Priors/Penalties: 12 values) ##
0	#--Log_fdevs
0	#--MeanF
0	#--Mdevs
2	#--Rec_devs
0	#--Initial_devs
0	#--Fst_dif_dev
0	#--Mean_sex_ratio
0	#--Molt_prob
0	#--free selectivity
0	#--Init_n_at_len
1	#--Fvecs
0	#--Fdovss
# eof_ctl
9999

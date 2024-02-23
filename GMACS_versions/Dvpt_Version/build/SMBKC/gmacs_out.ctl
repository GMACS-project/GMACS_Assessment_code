# Number of theta parameters
12
# Initial_value Lower_bound Upper_bound Phase Prior_type Prior_1 Prior_2
0.18 0.01 1 -4 2 0.18 0.02 
14.3 -7 30 -2 0 -7 30 
10 -7 20 -1 1 -10 20 
13.8677 -7 20 1 0 -7 20 
80 30 310 -2 1 72.5 7.25 
0.25 0.1 7 -4 0 0.1 9 
0.2 -10 0.75 -4 0 -10 0.75 
0.75 0.2 1 -2 3 3 2 
0.01 0 1 -3 3 1.01 1.01 
14.9543 5 20 1 0 5 20 
14.5109 5 20 1 0 5 20 
14.3269 5 20 1 0 5 20 

 ##Allometry
# weight-at-length input  method  (1 = allometry  [w_l = a*l^b],  2 = vector by sex; 3= matrix by sex)
3
 0.000748427 0.00116573 0.00193051
 0.000748427 0.00116573 0.00168889
 0.000748427 0.00116573 0.00192225
 0.000748427 0.00116573 0.00187796
 0.000748427 0.00116573 0.00193863
 0.000748427 0.00116573 0.00207641
 0.000748427 0.00116573 0.00189933
 0.000748427 0.00116573 0.00211669
 0.000748427 0.00116573 0.00193878
 0.000748427 0.00116573 0.00193976
 0.000748427 0.00116573 0.00187107
 0.000748427 0.00116573 0.0019983
 0.000748427 0.00116573 0.00187042
 0.000748427 0.00116573 0.00196941
 0.000748427 0.00116573 0.00192686
 0.000748427 0.00116573 0.00202149
 0.000748427 0.00116573 0.00193132
 0.000748427 0.00116573 0.00201441
 0.000748427 0.00116573 0.00197747
 0.000748427 0.00116573 0.00209925
 0.000748427 0.00116573 0.00198248
 0.000748427 0.00116573 0.00193093
 0.000748427 0.00116573 0.00193093
 0.000748427 0.00116573 0.00193093
 0.000748427 0.00116573 0.00193093
 0.000748427 0.00116573 0.00193093
 0.000748427 0.00116573 0.00193093
 0.000748427 0.00116573 0.00193093
 0.000748427 0.00116573 0.00193093
 0.000748427 0.00116573 0.00193093
 0.000748427 0.00116573 0.00193093
 0.000748427 0.00116573 0.00189163
 0.000748427 0.00116573 0.00179572
 0.000748427 0.00116573 0.00182311
 0.000748427 0.00116573 0.00180743
 0.000748427 0.00116573 0.00193093
 0.000748427 0.00116573 0.00189463
 0.000748427 0.00116573 0.00185061
 0.000748427 0.00116573 0.00193093
 0.000748427 0.00116573 0.00193093
 0.000748427 0.00116573 0.00193093
 0.000748427 0.00116573 0.00193093
 0.000748427 0.00116573 0.00193093
 0.000748427 0.00116573 0.00193093
# Proportion mature by sex
 0 1 1
# Proportion legal by sex
 0 0 1
# Use functional maturity (0=no)
0

 ##Growth
## Options for the growth matrix
## 1: Fixed growth transition matrix (requires molt probability)
## 2: Fixed size transition matrix (molt probability is ignored)
## 3: Growth increment is gamma distributed
## 4: Post-molt size is gamma distributed
## 5: Von Bert.: kappa varies among individuals
## 6: Von Bert.: Linf varies among individuals
## 7: Von Bert.: kappa and Linf varies among individuals
## 8: Growth increment is normally distributed
# Growth/size transition matrix option
1
## Options for the growth increment model matrix
## 1: Linear
## 2: Individual
## 3: Individual (Same as 2)
# Growth increment model matrix option
0
# molt probability function (0=pre-specified; 1=flat;2=declining logistic)
2
# Maximum size-class for recruitment(males then females)
 1
# number of size-increment periods
 1
# Start of the blocks in which molt increment changes (one row for each sex) - the first block starts in 1978
# Note: there is one less year than there are blocks

# number of molt periods
 1
# Start of the blocks in which molt probability changes (one row for each sex) - the first block starts in 1978
# Note: there is one less year than there are blocks
 # male
# Beta parameters are relative (1=Yes;0=no)
1
# Growth parameters
# Initial_value Lower_bound Upper_bound Phase Prior_type Prior_1 Prior_2
121.5 65 145 -4 0 0 999 
0.06 0 1 -3 0 0 999 
# Custom growth-increment matrices
 0.1761 0 0
 0.7052 0.2206 0
 0.1187 0.7794 1
# Custom molt probability matrices

## Selectivity parameter controls
## Selectivity (and retention) types
##  <0: Mirror selectivity
##   0: Nonparametric selectivity (one parameter per class)
##   1: Nonparametric selectivity (one parameter per class, constant from last specified class)
##   2: Logistic selectivity (inflection point and slope)
##   3: Logistic selectivity (50% and 95% selection)
##   4: Double normal selectivity (3 parameters)
##   5: Flat equal to zero (1 parameter; phase must be negative)
##   6: Flat equal to one (1 parameter; phase must be negative)
##   7: Flat-topped double normal selectivity (4 parameters)
##   8: Declining logistic selectivity with initial values (50% and 95% selection plus extra)
##   9: Cubic-spline (specified with knots and values at knots)
##  10: One parameter logistic selectivity (inflection point and slope)
## Extra (type 1): number of selectivity parameters to estimated

# Selectivity specifications
#  Pot_Fishery Trawl_Bycatch Fixed_bycatch NMFS_Trawl ADFG_Pot
 2 1 1 1 1 # selectivity periods
 0 0 0 0 0 # sex specific selectivity (1=Yes, 0=No)
 0 3 3 0 0 # selectivity type (by sex)
 0 0 0 0 0 # selectivity within another gear
 0 0 0 0 0 # extra parameters for each pattern

# Retention specifications
#  Pot_Fishery Trawl_Bycatch Fixed_bycatch NMFS_Trawl ADFG_Pot
 1 1 1 1 1 # retention periods 
 0 0 0 0 0 # sex specific retention (1=Yes, 0=No)
 3 6 6 6 6 # retention type (by sex)
 1 0 0 0 0 # retention flag
 0 0 0 0 0 # extra parameters for each pattern
 1 1 1 1 1 # Is maximum selectivity at size is forced to equal 1 or not
 
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
## Env_Link: Do environmental impact ? (0/1)
## Env_Link_Var: Which environmental variable to consider for tihs parameter ? (column of Env data)
## Rand_Walk: Do a random walk? (0/1)
## Start_year_RW: Start year of the random walk
## End_year_RW: End year of the random walk
## Sigma_RW: Sigma used for the random walk
# Fleet Index Parameter_no Sex Initial Lower_bound Upper_bound Prior_type Prior_1 Prior_2 Phase Start_block End_block Env_Link Env_Link_Var Rand_Walk Start_year_RW End_year_RW Sigma_RW
1 1 1 0 0.398683 0.001 1 0 0 1 3 1978 2008 0 0 0 1978 1978 0  # Sel_Pot_Fishery_male_period_1_par_1
1 2 2 0 0.570887 0.001 1 0 0 1 3 1978 2008 0 0 0 1978 1978 0  # Sel_Pot_Fishery_male_period_1_par_2
1 3 3 0 1 0.001 2 0 0 1 -2 1978 2008 0 0 0 1978 1978 0  # Sel_Pot_Fishery_male_period_1_par_3
1 1 1 0 0.581371 0.001 1 0 0 1 3 2009 2020 0 0 0 1978 1978 0  # Sel_Pot_Fishery_male_period_2_par_1
1 2 2 0 1 0.001 1 0 0 1 3 2009 2020 0 0 0 1978 1978 0  # Sel_Pot_Fishery_male_period_2_par_2
1 3 3 0 1 0.001 2 0 0 1 -2 2009 2020 0 0 0 1978 1978 0  # Sel_Pot_Fishery_male_period_2_par_3
2 7 1 0 40 10 200 0 10 200 -3 1978 2020 0 0 0 1978 1978 0  # Sel_Trawl_Bycatch_male_period_1_par_1
2 8 2 0 60 10 200 0 10 200 -3 1978 2020 0 0 0 1978 1978 0  # Sel_Trawl_Bycatch_male_period_1_par_2
3 9 1 0 40 10 200 0 10 200 -3 1978 2020 0 0 0 1978 1978 0  # Sel_Fixed_bycatch_male_period_1_par_1
3 10 2 0 60 10 200 0 10 200 -3 1978 2020 0 0 0 1978 1978 0  # Sel_Fixed_bycatch_male_period_1_par_2
4 11 1 0 0.729199 0.001 1 0 0 1 4 1978 2021 0 0 0 1978 1978 0  # Sel_NMFS_Trawl_male_period_1_par_1
4 12 2 0 1 0.001 1 0 0 1 4 1978 2021 0 0 0 1978 1978 0  # Sel_NMFS_Trawl_male_period_1_par_2
4 13 3 0 0.9 0.001 1 0 0 1 -5 1978 2021 0 0 0 1978 1978 0  # Sel_NMFS_Trawl_male_period_1_par_3
5 14 1 0 0.486857 0.001 1 0 0 1 4 1978 2021 0 0 0 1978 1978 0  # Sel_ADFG_Pot_male_period_1_par_1
5 15 2 0 1 0.001 1 0 0 1 4 1978 2021 0 0 0 1978 1978 0  # Sel_ADFG_Pot_male_period_1_par_2
5 16 3 0 1 0.001 2 0 0 1 -2 1978 2021 0 0 0 1978 1978 0  # Sel_ADFG_Pot_male_period_1_par_3
-1 17 1 0 120 50 200 0 1 900 -7 1978 2020 0 0 0 1978 1978 0  # Ret_Pot_Fishery_male_period_1_par_1
-1 18 2 0 123 110 200 0 1 900 -7 1978 2020 0 0 0 1978 1978 0  # Ret_Pot_Fishery_male_period_1_par_2
-2 19 1 0 595 1 999 0 1 999 -3 1978 2020 0 0 0 1978 1978 0  # Ret_Trawl_Bycatch_male_period_1_par_1
-3 20 1 0 595 1 999 0 1 999 -3 1978 2020 0 0 0 1978 1978 0  # Ret_Fixed_bycatch_male_period_1_par_1
-4 21 1 0 595 1 999 0 1 999 -3 1978 2021 0 0 0 1978 1978 0  # Ret_NMFS_Trawl_male_period_1_par_1
-5 22 1 0 595 1 999 0 1 999 -3 1978 2021 0 0 0 1978 1978 0  # Ret_ADFG_Pot_male_period_1_par_1

#Number of asymptotic selectivity parameters
1
# Fleet   Sex     Year       ival   lb   ub    phz
1 1 1978 1e-06 0 1 -3  # AsympRet_fleet_Pot_Fishery_sex_male_year_1978

# Environmental link parameters

# Deviation parameter phase
-1

# Catchability parameter controls
## ------------------------------------------------------------------------------------ ##
## PRIORS FOR CATCHABILITY
##     If a uniform prior is selected for a parameter then the lb and ub are used (p1   ##
##     and p2 are ignored). ival must be > 0                                            ##
## LEGEND                                                                               ##
##     prior: 0 = uniform, 1 = normal, 2 = lognormal, 3 = beta, 4 = gamma               ##
## ------------------------------------------------------------------------------------ ##
## ival     lb       ub    phz   prior  p1        p2     Analytic?   LAMBDA   Emphasis
1 0.5	 1.2	 -4	 0	 0	 9	 0	 1	 1	 # Survey_q_survey_1
0.00378585 0	 5	 3	 0	 0	 9	 0	 1	 1	 # Survey_q_survey_2

# Additional varianace controls
## ------------------------------------------------------------------------------------ ##
## ADDITIONAL CV FOR SURVEYS/INDICES
##     If a uniform prior is selected for a parameter then the lb and ub are used (p1   ##
##     and p2 are ignored). ival must be > 0                                            ##
## LEGEND                                                                               ##
##     prior type: 0 = uniform, 1 = normal, 2 = lognormal, 3 = beta, 4 = gamma          ##
## ------------------------------------------------------------------------------------ ##
## ival                lb        ub        phz   prior     p1      p2
1e-07 1e-09	 10	 -4	 4	 1	 100	 # Log_add_cvt_survey_1
1e-07 1e-09	 10	 -4	 4	 1	 100	 # Log_add_cvt_survey_2

## ------------------------------------------------------------------------------------ ##
### Pointers to how the the additional CVs are used (0 ignore; >0 link to one of the parameters
 0 0
##  PENALTIES  FOR  AVERAGE  FISHING  MORTALITY  RATE  FOR  EACH  GEAR
##  ------------------------------------------------------------------------------------ ##
## Mean_F   Fema-Offset STD_PHZ1 STD_PHZ2 PHZ_M PHZ_F   Lb    Ub     Lb     Ub      Lb     Ub
 0.2 0 3 50 1 -1 -12 4 -10 10 -10 10 # Pot_Fishery
 0.0001 0 4 50 1 -1 -12 4 -10 10 -10 10 # Trawl_Bycatch
 0.0001 0 4 50 1 -1 -12 4 -10 10 -10 10 # Fixed_bycatch
 0 0 2 20 -1 -1 -12 4 -10 10 -10 10 # NMFS_Trawl
 0 0 2 20 -1 -1 -12 4 -10 10 -10 10 # ADFG_Pot

##  ------------------------------------------------------------------------------------ ##
## OPTIONS FOR SIZE COMPOSTION DATA                                                     ##
##     One column for each data matrix                                                  ##
## LEGEND                                                                               ##
##     Likelihood: 1 = Multinomial with estimated/fixed sample size                     ##
##                 2 = Robust approximation to multinomial                              ##
##                 3 = logistic normal (NIY)                                            ##
##                 4 = multivariate-t (NIY)                                             ##
##                 5 = Dirichlet                                                        ##
## AUTO TAIL COMPRESSION                                                                ##
##     pmin is the cumulative proportion used in tail compression                       ##
##  ----------------------------------------------------------------------------------  ##
 2 2 2 # Type of likelihood
 0 0 0 # Auto tail compression (pmin)
 1 1 1 # Initial value for effective sample size multiplier
 -4 -4 -4 # Phz for estimating effective sample size (if appl.)
 1 2 3 # Composition splicer
 1 2 2 # Set to 2 for survey-like predictions; 1 for catch-like predictions
 1 1 1 # LAMBDA
 1 1 1 # Emphasis AEP

## ------------------------------------------------------------------------------------ ##
##  TIME  VARYING  NATURAL  MORTALIIY  RATES  ##
##  ----------------------------------------------------------------------------------- ##
## Type: 0 = constant natural mortality                                                 ##
##       1 = Random walk (deviates constrained by variance in M)                        ##
##       2 = Cubic Spline (deviates constrained by nodes & node-placement)              ##
##       3 = Blocked changes (deviates constrained by variance at specific knots)       ##
##       4 = Changes in pre-specified blocks                                            ##
##       5 = Changes in some knots                                                      ##
##       6 = Changes in Time blocks                                                     ##
# type of time-varying M
6
# Phase of estimation
3
# STDEV in m_dev for Random walk
10
# Number of nodes for cubic spline or number of step-changes for option 3
 2
# Year position of the knots (vector must be equal to the number of nodes)
 1998 1999
# number of breakpoints in M by size
0
# Start of the size-class blocks in which M changes (one row for each sex) - the first block start at size-class 1
# Note: there is one less size-class than there are blocks (no input implies M is independent of size

# Specific initial values for the natural mortality devs (0-no, 1=yes)
1
# ival        lb        ub        phz    extra
# Init_MDev==YES
1.58057	 0	 2	 3	 0	 # M_dev_est_par_1
0	 -2	 2	 -99	 0	 # M_dev_est_par_2

# Emphasis on tagging data
0

# maturity specific natural mortality? (yes = 1; no = 0; only for use if nmature > 1)
0
# ival        lb        ub        phz      prior     p1      p2 
0	 -1	 1	 -1	 0	 1	 1	 #male

##  ------------------------------------------------------------------------------------ ##
##  OTHER  CONTROLS
##  ------------------------------------------------------------------------------------ ##
1978	 # First year of recruitment estimation
2020	 # Last year of recruitment estimation
0	 # Consider terminal molting (0 = off, 1 = on). If on, the calc_stock_recruitment_relationship() isn't called in the procedure
3	 # Phase for recruitment estimation
-3	 # Phase for recruitment sex-ratio estimation
0.5	 # Initial value for recruitment sex-ratio
-3	 # Phase for initial recruitment estimation
2	 # Initial conditions (0 = Unfished, 1 = Steady-state fished, 2 = Free parameters, 3 = Free parameters (revised))
1	 # Lambda (proportion of mature male biomass for SPR reference points)
0	 # Stock-Recruit-Relationship (0 = none, 1 = Beverton-Holt)
1	 # Use years specified to computed average sex ratio in the calculation of average recruitment for reference points (0 = off -i.e. Rec based on End year, 1 = on)
200	 # Years to compute equilibria

## EMPHASIS FACTORS (CATCH)
 1 1 1 1

## EMPHASIS FACTORS (Priors) by fleet: fdev_total, Fdov_total, Fdev_year, Fdov_year
 1 0 0 0 # Pot_Fishery
 1 0 0 0 # Trawl_Bycatch
 1 0 0 0 # Fixed_bycatch
 1 0 0 0 # NMFS_Trawl
 1 0 0 0 # ADFG_Pot

## EMPHASIS FACTORS (Priors)
10000	#--Log_fdevs
0	#--MeanF
1	#--Mdevs
1	#--Rec_devs
0	#--Initial_devs
0	#--Fst_dif_dev
1	#--Mean_sex_ratio
0	#--Molt_prob
0	#--free selectivity
0	#--Init_n_at_len
0	#--Fvecs
0	#--Fdovss
0	#--Random walk in selectivity

# EOF
9999

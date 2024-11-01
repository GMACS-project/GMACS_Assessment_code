# ============================================================ #
#                  GMACS main control file 
# 
#_*** 
#_GMACS Version 2.10.01 
#_Last GMACS mofification made by: ** MV ** 
#_Date of writing the control file:2024-11-01 01:40:00 
#_*** 
# 
#_Stock of interest: SNOW_crab 
#_Model name: model_21_g 
#_Year of assessment: 2021 
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
0.271 0.15 0.7 4 1 0.271 0.0154 			# M-base
0.271 0.15 0.7 4 1 0.271 0.0154 			# M-female
16.5 -10 20 -2 0 -10 20 			# Log_R0
15 -10 30 1 0 10 20 			# Log_Rinitial
13.26245 -10 30 1 0 10 20 			# Log_Rbar
32.5 7.5 42.5 -4 0 32.5 2.25 			# Recruitment_ra-males
1 0.1 10 -4 0 0.1 5 			# Recruitment_rb-males
0 -10 10 -4 0 0 20 			# Recruitment_ra-females
0 -10 10 -3 0 0 20 			# Recruitment_rb-females
-0.9 -10 0.75 -4 0 -10 0.75 			# log_SigmaR
0.75 0.2 1 -2 3 3 2 			# Steepness
0.01 1e-04 1 -3 3 1.01 1.01 			# Rho
0 -20 25 1 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_1_class_2
0 -20 25 1 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_1_class_3
0 -20 25 1 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_1_class_4
0 -20 25 1 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_1_class_5
0 -20 25 1 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_1_class_6
0 -20 25 1 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_1_class_7
0 -20 25 1 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_1_class_8
0 -20 25 1 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_1_class_9
0 -20 25 1 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_1_class_10
0 -20 25 1 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_1_class_11
0 -20 25 1 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_1_class_12
0 -20 25 1 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_1_class_13
0 -20 25 1 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_1_class_14
0 -20 25 1 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_1_class_15
0 -20 25 1 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_1_class_16
0 -20 25 1 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_1_class_17
0 -20 25 1 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_1_class_18
0 -20 25 1 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_1_class_19
0 -20 25 1 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_1_class_20
0 -20 25 1 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_1_class_21
0 -20 25 1 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_1_class_22
0 -20 25 1 0 10 20 			# Scaled_logN_for_Male_mature_2_shell_1_class_1
0 -20 25 1 0 10 20 			# Scaled_logN_for_Male_mature_2_shell_1_class_2
0 -20 25 1 0 10 20 			# Scaled_logN_for_Male_mature_2_shell_1_class_3
0 -20 25 1 0 10 20 			# Scaled_logN_for_Male_mature_2_shell_1_class_4
0 -20 25 1 0 10 20 			# Scaled_logN_for_Male_mature_2_shell_1_class_5
0 -20 25 1 0 10 20 			# Scaled_logN_for_Male_mature_2_shell_1_class_6
0 -20 25 1 0 10 20 			# Scaled_logN_for_Male_mature_2_shell_1_class_7
0 -20 25 1 0 10 20 			# Scaled_logN_for_Male_mature_2_shell_1_class_8
0 -20 25 1 0 10 20 			# Scaled_logN_for_Male_mature_2_shell_1_class_9
0 -20 25 1 0 10 20 			# Scaled_logN_for_Male_mature_2_shell_1_class_10
0 -20 25 1 0 10 20 			# Scaled_logN_for_Male_mature_2_shell_1_class_11
0 -20 25 1 0 10 20 			# Scaled_logN_for_Male_mature_2_shell_1_class_12
0 -20 25 1 0 10 20 			# Scaled_logN_for_Male_mature_2_shell_1_class_13
0 -20 25 1 0 10 20 			# Scaled_logN_for_Male_mature_2_shell_1_class_14
0 -20 25 1 0 10 20 			# Scaled_logN_for_Male_mature_2_shell_1_class_15
0 -20 25 1 0 10 20 			# Scaled_logN_for_Male_mature_2_shell_1_class_16
0 -20 25 1 0 10 20 			# Scaled_logN_for_Male_mature_2_shell_1_class_17
0 -20 25 1 0 10 20 			# Scaled_logN_for_Male_mature_2_shell_1_class_18
0 -20 25 1 0 10 20 			# Scaled_logN_for_Male_mature_2_shell_1_class_19
0 -20 25 1 0 10 20 			# Scaled_logN_for_Male_mature_2_shell_1_class_20
0 -20 25 1 0 10 20 			# Scaled_logN_for_Male_mature_2_shell_1_class_21
0 -20 25 1 0 10 20 			# Scaled_logN_for_Male_mature_2_shell_1_class_22
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_1_class_1
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_1_class_2
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_1_class_3
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_1_class_4
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_1_class_5
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_1_class_6
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_1_class_7
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_1_class_8
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_1_class_9
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_1_class_10
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_1_class_11
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_1_class_12
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_1_class_13
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_1_class_14
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_1_class_15
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_1_class_16
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_1_class_17
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_1_class_18
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_1_class_19
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_1_class_20
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_1_class_21
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_1_class_22
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_2_shell_1_class_1
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_2_shell_1_class_2
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_2_shell_1_class_3
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_2_shell_1_class_4
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_2_shell_1_class_5
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_2_shell_1_class_6
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_2_shell_1_class_7
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_2_shell_1_class_8
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_2_shell_1_class_9
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_2_shell_1_class_10
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_2_shell_1_class_11
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_2_shell_1_class_12
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_2_shell_1_class_13
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_2_shell_1_class_14
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_2_shell_1_class_15
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_2_shell_1_class_16
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_2_shell_1_class_17
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_2_shell_1_class_18
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_2_shell_1_class_19
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_2_shell_1_class_20
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_2_shell_1_class_21
0 -20 25 1 0 10 20 			# Scaled_logN_for_Female_mature_2_shell_1_class_22
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
#_vectors of Male mean weight-at-size for immature and mature individuals
7.66e-06 1.29e-05 2e-05 2.95e-05 4.17e-05 5.68e-05 7.53e-05 9.7455e-05 0.000123688 0.000154329 0.000189739 0.000230279 0.000276313 0.000328208 0.000386333 0.000451057 0.000522754 0.000601796 0.000688561 0.000783424 0.000886766 0.000998966
7.66e-06 1.29e-05 2e-05 2.95e-05 4.17e-05 5.68e-05 7.53e-05 9.7455e-05 0.000123688 0.000154329 0.000189739 0.000230279 0.000276313 0.000328208 0.000386333 0.000451057 0.000522754 0.000601796 0.000688561 0.000783424 0.000886766 0.000998966
#_vectors of Female mean weight-at-size for immature and mature individuals
9.17e-06 1.44e-05 2.13e-05 2.98e-05 4.03e-05 5.29e-05 6.77e-05 8.4796e-05 0.000104451 0.000126759 0.000151857 0.000179881 0.000210963 0.000245233 0.00028282 0.00032385 0.000368446 0.000416731 0.000468827 0.000524852 0.000584924 0.00064916
9.17e-06 1.44e-05 2.13e-05 2.98e-05 4.03e-05 5.29e-05 6.77e-05 8.4796e-05 0.000104451 0.000126759 0.000151857 0.000179881 0.000210963 0.000245233 0.00028282 0.00032385 0.000368446 0.000416731 0.000468827 0.000524852 0.000584924 0.00064916
# -------------------------------------- #

# -------------------------------------- #
##_Fecundity for MMB/MMA calculation
# -------------------------------------- #
#_Maturity definition: Proportion of mature at size by sex
#_size_Class_1 size_Class_2 size_Class_3 size_Class_4 size_Class_5 size_Class_6 size_Class_7 size_Class_8 size_Class_9 size_Class_10 size_Class_11 size_Class_12 size_Class_13 size_Class_14 size_Class_15 size_Class_16 size_Class_17 size_Class_18 size_Class_19 size_Class_20 size_Class_21 size_Class_22 
0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1
0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
#_Legal definition of the proportion of mature at size by sex
#_size_Class_1 size_Class_2 size_Class_3 size_Class_4 size_Class_5 size_Class_6 size_Class_7 size_Class_8 size_Class_9 size_Class_10 size_Class_11 size_Class_12 size_Class_13 size_Class_14 size_Class_15 size_Class_16 size_Class_17 size_Class_18 size_Class_19 size_Class_20 size_Class_21 size_Class_22 
0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
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

#_Maturity probability function
# ************************************** #
#_0 = Pre-specified maturity probqbility
#_1 = Constant probability of molting (flat approach)
#_2 = Logistic function
#_3 = Free estimated parameters
# ************************************** #
0 
#_Number of blocks of maturity probability
42 42 
#_Year(s) with changes in maturity probability
#_-> 1 line per sex - blank if no change
1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022 2023
1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022 2023

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
2.049 -5 20 3 1 2.049 1 			# Alpha_Male_period_1
-0.2258 -1 0 3 1 -0.2258 0.5 			# Beta_Male_period_1
0.25 0.001 5 -3 0 0 999 			# Gscale_Male_period_1
-1.1539 -5 10 3 1 -1.1539 1 			# Alpha_Female_period_1
-0.3389 -1 0 3 1 -0.3389 0.5 			# Beta_Female_period_1
0.25 0.001 5 -3 0 0 999 			# Gscale_Female_period_1

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
0.006403424 0 1 -3 0 0 999 			# Molt_probability_Male_period_1_class_1
0.01111915 0 1 -3 0 0 999 			# Molt_probability_Male_period_1_class_2
0.0193077 0 1 -3 0 0 999 			# Molt_probability_Male_period_1_class_3
0.03347961 0 1 3 0 0 999 			# Molt_probability_Male_period_1_class_4
0.05697978 0 1 3 0 0 999 			# Molt_probability_Male_period_1_class_5
0.09134171 0 1 3 0 0 999 			# Molt_probability_Male_period_1_class_6
0.1331525 0 1 3 0 0 999 			# Molt_probability_Male_period_1_class_7
0.1748763 0 1 3 0 0 999 			# Molt_probability_Male_period_1_class_8
0.205801 0 1 3 0 0 999 			# Molt_probability_Male_period_1_class_9
0.2276828 0 1 3 0 0 999 			# Molt_probability_Male_period_1_class_10
0.2365984 0 1 3 0 0 999 			# Molt_probability_Male_period_1_class_11
0.2277196 0 1 3 0 0 999 			# Molt_probability_Male_period_1_class_12
0.2241992 0 1 3 0 0 999 			# Molt_probability_Male_period_1_class_13
0.2544719 0 1 3 0 0 999 			# Molt_probability_Male_period_1_class_14
0.3580878 0 1 3 0 0 999 			# Molt_probability_Male_period_1_class_15
0.6225121 0 1 3 0 0 999 			# Molt_probability_Male_period_1_class_16
1 0 1 -3 0 0 999 			# Molt_probability_Male_period_1_class_17
1 0 1 -3 0 0 999 			# Molt_probability_Male_period_1_class_18
1 0 1 -3 0 0 999 			# Molt_probability_Male_period_1_class_19
1 0 1 -3 0 0 999 			# Molt_probability_Male_period_1_class_20
1 0 1 -3 0 0 999 			# Molt_probability_Male_period_1_class_21
1 0 1 -3 0 0 999 			# Molt_probability_Male_period_1_class_22
0.006167864 0 1 -3 0 0 999 			# Molt_probability_Female_period_1_class_1
0.01898345 0 1 3 0 0 999 			# Molt_probability_Female_period_1_class_2
0.05842723 0 1 3 0 0 999 			# Molt_probability_Female_period_1_class_3
0.1775681 0 1 3 0 0 999 			# Molt_probability_Female_period_1_class_4
0.4667872 0 1 3 0 0 999 			# Molt_probability_Female_period_1_class_5
0.7761687 0 1 3 0 0 999 			# Molt_probability_Female_period_1_class_6
0.8119834 0 1 3 0 0 999 			# Molt_probability_Female_period_1_class_7
1 0 1 -3 0 0 999 			# Molt_probability_Female_period_1_class_8
1 0 1 -3 0 0 999 			# Molt_probability_Female_period_1_class_9
1 0 1 -3 0 0 999 			# Molt_probability_Female_period_1_class_10
1 0 1 -3 0 0 999 			# Molt_probability_Female_period_1_class_11
1 0 1 -3 0 0 999 			# Molt_probability_Female_period_1_class_12
1 0 1 -3 0 0 999 			# Molt_probability_Female_period_1_class_13
1 0 1 -3 0 0 999 			# Molt_probability_Female_period_1_class_14
1 0 1 -3 0 0 999 			# Molt_probability_Female_period_1_class_15
1 0 1 -3 0 0 999 			# Molt_probability_Female_period_1_class_16
1 0 1 -3 0 0 999 			# Molt_probability_Female_period_1_class_17
1 0 1 -3 0 0 999 			# Molt_probability_Female_period_1_class_18
1 0 1 -3 0 0 999 			# Molt_probability_Female_period_1_class_19
1 0 1 -3 0 0 999 			# Molt_probability_Female_period_1_class_20
1 0 1 -3 0 0 999 			# Molt_probability_Female_period_1_class_21
1 0 1 -3 0 0 999 			# Molt_probability_Female_period_1_class_22

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
0 0 0.01 0.029 0.067 0.123 0.184 0.25 0.321 0.396 0.445 0.467 0.503 0.551 0.648 0.795 0.893 0.945 0.973 0.977 0.984 0.995
0 0 0.01 0.029 0.067 0.123 0.184 0.25 0.321 0.396 0.445 0.467 0.503 0.551 0.648 0.795 0.893 0.945 0.973 0.977 0.984 0.995
0 0 0.01 0.029 0.067 0.123 0.184 0.25 0.321 0.396 0.445 0.467 0.503 0.551 0.648 0.795 0.893 0.945 0.973 0.977 0.984 0.995
0 0 0.01 0.029 0.067 0.123 0.184 0.25 0.321 0.396 0.445 0.467 0.503 0.551 0.648 0.795 0.893 0.945 0.973 0.977 0.984 0.995
0 0 0.01 0.029 0.067 0.123 0.184 0.25 0.321 0.396 0.445 0.467 0.503 0.551 0.648 0.795 0.893 0.945 0.973 0.977 0.984 0.995
0 0 0.01 0.029 0.067 0.123 0.184 0.25 0.321 0.396 0.445 0.467 0.503 0.551 0.648 0.795 0.893 0.945 0.973 0.977 0.984 0.995
0 0 0.01 0.029 0.067 0.123 0.184 0.25 0.321 0.396 0.445 0.467 0.503 0.551 0.648 0.795 0.893 0.945 0.973 0.977 0.984 0.995
0 0 0.006 0.017 0.051 0.106 0.149 0.178 0.181 0.156 0.193 0.293 0.406 0.532 0.669 0.815 0.914 0.968 0.993 0.987 0.989 0.996
0 0 0.001 0.003 0.022 0.058 0.092 0.124 0.191 0.295 0.355 0.371 0.379 0.377 0.436 0.557 0.693 0.844 0.94 0.98 1 1
0 0 0.001 0.002 0.017 0.045 0.091 0.154 0.204 0.239 0.268 0.291 0.302 0.3 0.409 0.63 0.8 0.918 0.977 0.976 0.982 0.994
0 0 0.004 0.011 0.058 0.144 0.203 0.236 0.299 0.391 0.452 0.482 0.519 0.565 0.662 0.812 0.913 0.967 0.995 0.998 1 1
0 0 0.005 0.014 0.037 0.074 0.144 0.247 0.388 0.564 0.663 0.685 0.708 0.732 0.796 0.9 0.96 0.976 0.988 0.996 1 1
0 0 0.01 0.029 0.058 0.098 0.151 0.217 0.301 0.404 0.477 0.519 0.534 0.522 0.6 0.767 0.883 0.949 0.986 0.995 1 1
0 0 0.005 0.014 0.041 0.084 0.127 0.168 0.237 0.332 0.424 0.511 0.588 0.655 0.725 0.797 0.871 0.945 0.98 0.974 0.979 0.993
0 0 0 0 0.035 0.105 0.152 0.175 0.228 0.311 0.373 0.414 0.45 0.481 0.595 0.794 0.908 0.94 0.967 0.989 1 1
0 0 0.002 0.006 0.034 0.084 0.129 0.17 0.209 0.248 0.265 0.261 0.293 0.362 0.485 0.663 0.807 0.919 0.981 0.994 1 1
0 0 0.005 0.015 0.046 0.099 0.149 0.194 0.267 0.367 0.408 0.389 0.406 0.46 0.579 0.762 0.882 0.939 0.973 0.986 0.994 0.998
0 0 0.023 0.068 0.117 0.17 0.223 0.276 0.349 0.445 0.469 0.422 0.456 0.572 0.699 0.835 0.917 0.944 0.968 0.989 1 1
0 0 0.004 0.011 0.028 0.055 0.126 0.242 0.324 0.374 0.401 0.406 0.453 0.545 0.677 0.851 0.946 0.963 0.978 0.993 1 1
0 0 0 0 0.033 0.099 0.142 0.161 0.2 0.26 0.332 0.416 0.492 0.559 0.672 0.832 0.923 0.945 0.967 0.989 1 1
0 0 0 0 0.007 0.021 0.087 0.203 0.288 0.341 0.359 0.342 0.37 0.443 0.58 0.782 0.913 0.971 1 1 1 1
0 0 0.013 0.04 0.072 0.11 0.149 0.189 0.222 0.251 0.291 0.344 0.369 0.366 0.468 0.677 0.82 0.898 0.926 0.904 0.919 0.973
0 0 0 0 0.037 0.112 0.19 0.27 0.351 0.431 0.533 0.656 0.684 0.617 0.633 0.734 0.828 0.914 0.968 0.989 1 1
0 0 0.014 0.043 0.078 0.119 0.165 0.216 0.295 0.401 0.485 0.547 0.555 0.508 0.594 0.813 0.933 0.952 0.968 0.981 0.99 0.997
0 0 0.019 0.057 0.095 0.133 0.222 0.36 0.434 0.443 0.442 0.43 0.478 0.588 0.672 0.731 0.808 0.902 0.962 0.987 1 1
0 0 0 0 0.032 0.097 0.204 0.355 0.459 0.514 0.531 0.507 0.485 0.465 0.555 0.754 0.868 0.897 0.867 0.779 0.801 0.934
0 0 0.01 0.029 0.067 0.123 0.184 0.25 0.321 0.396 0.445 0.467 0.503 0.551 0.648 0.795 0.893 0.945 0.973 0.977 0.984 0.995
0 0 0 0 0.1 0.3 0.388 0.363 0.359 0.376 0.348 0.275 0.208 0.149 0.245 0.496 0.716 0.905 1 1 1 1
0 0 0.001 0.002 0.025 0.071 0.176 0.342 0.476 0.579 0.624 0.611 0.68 0.833 0.925 0.956 0.964 0.949 0.957 0.986 1 1
0 0 0 0 0.031 0.094 0.133 0.146 0.256 0.461 0.544 0.505 0.483 0.481 0.61 0.87 1 1 0.964 0.893 0.893 0.964
0 0 0.01 0.029 0.067 0.123 0.184 0.25 0.321 0.396 0.445 0.467 0.503 0.551 0.648 0.795 0.893 0.945 0.973 0.977 0.984 0.995
0 0 0 0 0.016 0.049 0.124 0.243 0.357 0.466 0.53 0.55 0.6 0.68 0.77 0.871 0.932 0.953 0.972 0.991 1 1
0 0 0.01 0.029 0.067 0.123 0.184 0.25 0.321 0.396 0.445 0.467 0.503 0.551 0.648 0.795 0.893 0.945 0.973 0.977 0.984 0.995
0 0 0 0 0.031 0.093 0.19 0.321 0.42 0.488 0.534 0.556 0.572 0.581 0.683 0.877 0.981 0.994 1 1 1 1
0 0 0.01 0.029 0.067 0.123 0.184 0.25 0.321 0.396 0.445 0.467 0.503 0.551 0.648 0.795 0.893 0.945 0.973 0.977 0.984 0.995
0 0 0.009 0.028 0.104 0.237 0.309 0.321 0.355 0.41 0.48 0.563 0.662 0.778 0.865 0.922 0.961 0.98 0.992 0.997 1 1
0 0 0.008 0.023 0.066 0.136 0.232 0.354 0.442 0.497 0.572 0.665 0.757 0.849 0.918 0.965 0.991 0.997 1 1 1 1
0 0 0.042 0.125 0.162 0.154 0.17 0.209 0.244 0.273 0.32 0.386 0.519 0.718 0.835 0.87 0.909 0.952 0.98 0.993 1 1
0 0 0.01 0.029 0.067 0.123 0.184 0.25 0.321 0.396 0.445 0.467 0.503 0.551 0.648 0.795 0.893 0.945 0.973 0.977 0.984 0.995
0 0 0.111 0.334 0.477 0.54 0.574 0.579 0.574 0.56 0.561 0.577 0.612 0.664 0.757 0.893 0.971 0.99 1 1 1 1
0 0 0.003 0.008 0.037 0.09 0.159 0.245 0.392 0.598 0.663 0.585 0.565 0.603 0.687 0.815 0.9 0.941 0.972 0.991 1 1
0 0.005 0.022 0.047 0.081 0.126 0.182 0.248 0.32 0.396 0.471 0.544 0.619 0.695 0.77 0.838 0.896 0.941 0.973 0.994 1 1
0.0061 0.0189 0.0584 0.1775 0.4667 0.7761 0.8119 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999
0.0061 0.0189 0.0584 0.1775 0.4667 0.7761 0.8119 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999
0.0061 0.0189 0.0584 0.1775 0.4667 0.7761 0.8119 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999
0.0061 0.0189 0.0584 0.1775 0.4667 0.7761 0.8119 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999
0.0061 0.0189 0.0584 0.1775 0.4667 0.7761 0.8119 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999
0.0061 0.0189 0.0584 0.1775 0.4667 0.7761 0.8119 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999
0.0061 0.0189 0.0584 0.1775 0.4667 0.7761 0.8119 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999
0.0061 0.0189 0.0584 0.1775 0.4667 0.7761 0.8119 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999
0.0061 0.0189 0.0584 0.1775 0.4667 0.7761 0.8119 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999
0.0061 0.0189 0.0584 0.1775 0.4667 0.7761 0.8119 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999
0.0061 0.0189 0.0584 0.1775 0.4667 0.7761 0.8119 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999
0.0061 0.0189 0.0584 0.1775 0.4667 0.7761 0.8119 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999
0.0061 0.0189 0.0584 0.1775 0.4667 0.7761 0.8119 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999
0.0061 0.0189 0.0584 0.1775 0.4667 0.7761 0.8119 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999
0.0061 0.0189 0.0584 0.1775 0.4667 0.7761 0.8119 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999
0.0061 0.0189 0.0584 0.1775 0.4667 0.7761 0.8119 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999
0.0061 0.0189 0.0584 0.1775 0.4667 0.7761 0.8119 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999
0.0061 0.0189 0.0584 0.1775 0.4667 0.7761 0.8119 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999
0.0061 0.0189 0.0584 0.1775 0.4667 0.7761 0.8119 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999
0.0061 0.0189 0.0584 0.1775 0.4667 0.7761 0.8119 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999
0.0061 0.0189 0.0584 0.1775 0.4667 0.7761 0.8119 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999
0.0061 0.0189 0.0584 0.1775 0.4667 0.7761 0.8119 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999
0.0061 0.0189 0.0584 0.1775 0.4667 0.7761 0.8119 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999
0.0061 0.0189 0.0584 0.1775 0.4667 0.7761 0.8119 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999
0.0061 0.0189 0.0584 0.1775 0.4667 0.7761 0.8119 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999
0.0061 0.0189 0.0584 0.1775 0.4667 0.7761 0.8119 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999
0.0061 0.0189 0.0584 0.1775 0.4667 0.7761 0.8119 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999
0.0061 0.0189 0.0584 0.1775 0.4667 0.7761 0.8119 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999
0.0061 0.0189 0.0584 0.1775 0.4667 0.7761 0.8119 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999
0.0061 0.0189 0.0584 0.1775 0.4667 0.7761 0.8119 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999
0.0061 0.0189 0.0584 0.1775 0.4667 0.7761 0.8119 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999
0.0061 0.0189 0.0584 0.1775 0.4667 0.7761 0.8119 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999
0.0061 0.0189 0.0584 0.1775 0.4667 0.7761 0.8119 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999
0.0061 0.0189 0.0584 0.1775 0.4667 0.7761 0.8119 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999
0.0061 0.0189 0.0584 0.1775 0.4667 0.7761 0.8119 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999
0.0061 0.0189 0.0584 0.1775 0.4667 0.7761 0.8119 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999
0.0061 0.0189 0.0584 0.1775 0.4667 0.7761 0.8119 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999
0.0061 0.0189 0.0584 0.1775 0.4667 0.7761 0.8119 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999
0.0061 0.0189 0.0584 0.1775 0.4667 0.7761 0.8119 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999
0.0061 0.0189 0.0584 0.1775 0.4667 0.7761 0.8119 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999
0.0061 0.0189 0.0584 0.1775 0.4667 0.7761 0.8119 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999
0.0061 0.0189 0.0584 0.1775 0.4667 0.7761 0.8119 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999
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
1 1 1 1 105.7114 5 186 0 1 999 4 1982 2020 0 0 0 0 0 0 			# Sel_Pot_Fishery_Male_period_1_par_1
1 2 2 1 4.997241 0.01 20 0 1 999 4 1982 2020 0 0 0 0 0 0 			# Sel_Pot_Fishery_Male_period_1_par_2
1 3 1 2 74.85672 5 150 0 1 999 4 1982 2020 0 0 0 0 0 0 			# Sel_Pot_Fishery_Female_period_1_par_1
1 4 2 2 4.187324 0.01 20 0 1 999 4 1982 2020 0 0 0 0 0 0 			# Sel_Pot_Fishery_Female_period_1_par_2
# Trawl_Bycatch  
2 5 1 0 109.931 5 185 0 1 999 4 1982 2020 0 0 0 0 0 0 			# Sel_Trawl_Bycatch_Male_period_1_par_1
2 6 2 0 11.86826 0.01 20 0 1 999 4 1982 2020 0 0 0 0 0 0 			# Sel_Trawl_Bycatch_Male_period_1_par_2
# NMFS_Trawl_1982  
3 7 1 1 42.19018 5 300 0 1 999 4 1982 2020 0 0 0 0 0 0 			# Sel_NMFS_Trawl_1982_Male_period_1_par_1
3 8 2 1 4.997241 0.01 20 0 1 999 4 1982 2020 0 0 0 0 0 0 			# Sel_NMFS_Trawl_1982_Male_period_1_par_2
3 9 1 2 42.19018 5 300 0 1 999 4 1982 2020 0 0 0 0 0 0 			# Sel_NMFS_Trawl_1982_Female_period_1_par_1
3 10 2 2 4.997241 0.01 20 0 1 999 4 1982 2020 0 0 0 0 0 0 			# Sel_NMFS_Trawl_1982_Female_period_1_par_2
# NMFS_Trawl_1989  
4 11 1 1 36.25999 5 300 0 1 999 4 1982 2020 0 0 0 0 0 0 			# Sel_NMFS_Trawl_1989_Male_period_1_par_1
4 12 2 1 4.997241 0.01 20 0 1 999 4 1982 2020 0 0 0 0 0 0 			# Sel_NMFS_Trawl_1989_Male_period_1_par_2
4 13 1 2 36.29074 5 100 0 1 999 4 1982 2020 0 0 0 0 0 0 			# Sel_NMFS_Trawl_1989_Female_period_1_par_1
4 14 2 2 4.997241 0.01 20 0 1 999 4 1982 2020 0 0 0 0 0 0 			# Sel_NMFS_Trawl_1989_Female_period_1_par_2
# BSFRF_2009  
5 15 1 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Male_period_1_par_1
5 16 2 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Male_period_1_par_2
5 17 3 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Male_period_1_par_3
5 18 4 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Male_period_1_par_4
5 19 5 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Male_period_1_par_5
5 20 6 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Male_period_1_par_6
5 21 7 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Male_period_1_par_7
5 22 8 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Male_period_1_par_8
5 23 9 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Male_period_1_par_9
5 24 10 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Male_period_1_par_10
5 25 11 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Male_period_1_par_11
5 26 12 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Male_period_1_par_12
5 27 13 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Male_period_1_par_13
5 28 14 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Male_period_1_par_14
5 29 15 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Male_period_1_par_15
5 30 16 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Male_period_1_par_16
5 31 17 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Male_period_1_par_17
5 32 18 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Male_period_1_par_18
5 33 19 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Male_period_1_par_19
5 34 20 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Male_period_1_par_20
5 35 21 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Male_period_1_par_21
5 36 22 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Male_period_1_par_22
5 37 1 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Female_period_1_par_1
5 38 2 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Female_period_1_par_2
5 39 3 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Female_period_1_par_3
5 40 4 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Female_period_1_par_4
5 41 5 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Female_period_1_par_5
5 42 6 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Female_period_1_par_6
5 43 7 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Female_period_1_par_7
5 44 8 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Female_period_1_par_8
5 45 9 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Female_period_1_par_9
5 46 10 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Female_period_1_par_10
5 47 11 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Female_period_1_par_11
5 48 12 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Female_period_1_par_12
5 49 13 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Female_period_1_par_13
5 50 14 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Female_period_1_par_14
5 51 15 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Female_period_1_par_15
5 52 16 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Female_period_1_par_16
5 53 17 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Female_period_1_par_17
5 54 18 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Female_period_1_par_18
5 55 19 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Female_period_1_par_19
5 56 20 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Female_period_1_par_20
5 57 21 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Female_period_1_par_21
5 58 22 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2009_Female_period_1_par_22
# NMFS_2009  
6 59 1 1 0.01 1e-05 100 0 1 999 -6 1982 2020 0 0 0 0 0 0 			# Sel_NMFS_2009_Male_period_1_par_1
6 60 1 2 0.01 1e-05 100 0 1 999 -6 1982 2020 0 0 0 0 0 0 			# Sel_NMFS_2009_Female_period_1_par_1
# BSFRF_2010  
7 61 1 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Male_period_1_par_1
7 62 2 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Male_period_1_par_2
7 63 3 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Male_period_1_par_3
7 64 4 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Male_period_1_par_4
7 65 5 1 0.999999 1e-05 1 0 0 999 -1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Male_period_1_par_5
7 66 6 1 0.999999 1e-05 1 0 0 999 -1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Male_period_1_par_6
7 67 7 1 0.999999 1e-05 1 0 0 999 -1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Male_period_1_par_7
7 68 8 1 0.999999 1e-05 1 0 0 999 -1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Male_period_1_par_8
7 69 9 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Male_period_1_par_9
7 70 10 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Male_period_1_par_10
7 71 11 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Male_period_1_par_11
7 72 12 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Male_period_1_par_12
7 73 13 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Male_period_1_par_13
7 74 14 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Male_period_1_par_14
7 75 15 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Male_period_1_par_15
7 76 16 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Male_period_1_par_16
7 77 17 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Male_period_1_par_17
7 78 18 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Male_period_1_par_18
7 79 19 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Male_period_1_par_19
7 80 20 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Male_period_1_par_20
7 35 21 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Male_period_1_par_21
7 36 22 1 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Male_period_1_par_22
7 37 1 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Female_period_1_par_1
7 38 2 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Female_period_1_par_2
7 39 3 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Female_period_1_par_3
7 40 4 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Female_period_1_par_4
7 41 5 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Female_period_1_par_5
7 42 6 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Female_period_1_par_6
7 43 7 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Female_period_1_par_7
7 44 8 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Female_period_1_par_8
7 45 9 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Female_period_1_par_9
7 46 10 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Female_period_1_par_10
7 47 11 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Female_period_1_par_11
7 48 12 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Female_period_1_par_12
7 49 13 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Female_period_1_par_13
7 50 14 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Female_period_1_par_14
7 51 15 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Female_period_1_par_15
7 52 16 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Female_period_1_par_16
7 53 17 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Female_period_1_par_17
7 54 18 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Female_period_1_par_18
7 55 19 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Female_period_1_par_19
7 56 20 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Female_period_1_par_20
7 57 21 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Female_period_1_par_21
7 58 22 2 0.5 1e-05 1 0 0 999 1 1982 2020 0 0 0 0 0 0 			# Sel_BSFRF_2010_Female_period_1_par_22
# NMFS_2010  
8 59 1 1 0.01 1e-05 100 0 1 999 -6 1982 2020 0 0 0 0 0 0 			# Sel_NMFS_2010_Male_period_1_par_1
8 59 1 2 0.01 1e-05 100 0 1 999 -6 1982 2020 0 0 0 0 0 0 			# Sel_NMFS_2010_Female_period_1_par_1

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
-1 61 1 1 96.03919 1 190 1 96 10 4 1982 2020 0 0 0 0 0 0 			# Ret_Pot_Fishery_Male_period_1_par_1
-1 62 2 1 2.197131 0.001 20 0 1 999 4 1982 2020 0 0 0 0 0 0 			# Ret_Pot_Fishery_Male_period_1_par_2
-1 63 1 2 595 1 999 0 1 999 -3 1982 2020 0 0 0 0 0 0 			# Ret_Pot_Fishery_Female_period_1_par_1
# Trawl_Bycatch  
-2 64 1 0 595 1 999 0 1 999 -3 1982 2020 0 0 0 0 0 0 			# Ret_Trawl_Bycatch_Male_period_1_par_1
# NMFS_Trawl_1982  
-3 65 1 0 595 1 999 0 1 999 -3 1982 2020 0 0 0 0 0 0 			# Ret_NMFS_Trawl_1982_Male_period_1_par_1
# NMFS_Trawl_1989  
-4 66 1 0 595 1 999 0 1 999 -3 1982 2020 0 0 0 0 0 0 			# Ret_NMFS_Trawl_1989_Male_period_1_par_1
# BSFRF_2009  
-5 67 1 0 595 1 999 0 1 999 -3 1982 2020 0 0 0 0 0 0 			# Ret_BSFRF_2009_Male_period_1_par_1
# NMFS_2009  
-6 68 1 0 595 1 999 0 1 999 -3 1982 2020 0 0 0 0 0 0 			# Ret_NMFS_2009_Male_period_1_par_1
# BSFRF_2010  
-7 67 1 0 595 1 999 0 1 999 -3 1982 2020 0 0 0 0 0 0 			# Ret_BSFRF_2010_Male_period_1_par_1
# NMFS_2010  
-8 68 1 0 595 1 999 0 1 999 -3 1982 2020 0 0 0 0 0 0 			# Ret_NMFS_2010_Male_period_1_par_1

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
0.6 0.01 1 5 0 0.843136 0.03 0 1 1 			# Log_vn_comp_1
0.6 0.01 1 5 0 0.843136 0.03 0 1 1 			# Log_vn_comp_2
0.6 0.01 1 5 0 0.45136 0.5 0 1 1 			# Log_vn_comp_3
0.6 0.01 1 5 0 0.453136 0.5 0 1 1 			# Log_vn_comp_4
0.9999 0.01 1 -5 0 0.843136 0.03 0 1 1 			# Log_vn_comp_5
0.9999 0.01 1 -5 0 0.843136 0.03 0 1 1 			# Log_vn_comp_6
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
1e-04 1e-05 10 -4 0 1 100 			# Log_add_cvt_survey_1
1e-04 1e-05 10 -4 0 1 100 			# Log_add_cvt_survey_2
1e-04 1e-05 10 -4 0 1 100 			# Log_add_cvt_survey_3
1e-04 1e-05 10 -4 0 1 100 			# Log_add_cvt_survey_4
1e-04 1e-05 10 -4 0 1 100 			# Log_add_cvt_survey_5
1e-04 1e-05 10 -4 0 1 100 			# Log_add_cvt_survey_6
 
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
1 0.0505 0.5 45.5 1 1 -12 4 -10 10 -10 10 			# log_fbar_Pot_Fishery
0.018 1 0.5 45.5 1 -1 -12 4 -10 10 -10 10 			# log_fbar_Trawl_Bycatch
0 0 2 20 -1 -1 -12 4 -10 10 -10 10 			# log_fbar_NMFS_Trawl_1982
0 0 2 20 -1 -1 -12 4 -10 10 -10 10 			# log_fbar_NMFS_Trawl_1989
0 0 2 20 -1 -1 -12 4 -10 10 -10 10 			# log_fbar_BSFRF_2009
0 0 2 20 -1 -1 -12 4 -10 10 -10 10 			# log_fbar_NMFS_2009
0 0 2 20 -1 -1 -12 4 -10 10 -10 10 			# log_fbar_BSFRF_2010
0 0 2 20 -1 -1 -12 4 -10 10 -10 10 			# log_fbar_NMFS_2010
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
2 0 3 4 0 			# M_dev_est_par_1
2 0 3 4 0 			# M_dev_est_par_2
2 0 3 4 0 			# M_dev_est_par_3
1 0 3 4 0 			# M_dev_est_par_4
1 0 3 4 0 			# M_dev_est_par_5
1 0 3 4 0 			# M_dev_est_par_6
2 0 3 4 0 			# M_dev_est_par_7
2 0 3 4 0 			# M_dev_est_par_8
2 0 3 4 0 			# M_dev_est_par_9
3 0 3 4 0 			# M_dev_est_par_10
3 0 3 4 0 			# M_dev_est_par_11
3 0 3 4 0 			# M_dev_est_par_12
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
0 -4 4 4 1 0 0.05 			# m_mat_mult_Male
0 -4 4 4 1 0 0.05 			# m_mat_mult_Female
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
1 1 0 0 			# Pot_Fishery
1 0 0 0 			# Trawl_Bycatch
0 0 0 0 			# NMFS_Trawl_1982
0 0 0 0 			# NMFS_Trawl_1989
0 0 0 0 			# BSFRF_2009
0 0 0 0 			# NMFS_2009
0 0 0 0 			# BSFRF_2010
0 0 0 0 			# NMFS_2010

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

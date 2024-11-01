# ============================================================ #
#                  GMACS main control file 
# 
#_*** 
#_GMACS Version 2.10.01 
#_Last GMACS mofification made by: ** MV ** 
#_Date of writing the control file:2024-11-01 01:39:59 
#_*** 
# 
#_Stock of interest: BBRKC 
#_Model name: model_21_1 
#_Year of assessment: 2021 
# ============================================================ #

# -------------------------------------- #
##_Key parameter controls
# -------------------------------------- #
#_ntheta - Number of leading parameters (guestimated)
91 
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
0.18 0.15 0.2 -4 2 0.18 0.04 			# M-base
0 -0.4 0.4 4 1 0 0.03 			# M-fem-offset
16.5 -10 18 -2 0 -10 20 			# Log_R0
19.5 -10 25 3 0 10 25 			# Log_Rinitial
16.5 -10 25 1 0 10 20 			# Log_Rbar
72.5 55 100 -4 1 72.5 7.25 			# Recruitment_ra-males
0.726149 0.32 1.64 3 0 0.1 5 			# Recruitment_rb-males
0 -5 5 -4 0 0 20 			# Recruitment_ra-females
0 -1.69 0.4 3 0 0 20 			# Recruitment_rb-females
-0.10536 -10 0.75 -4 0 -10 0.75 			# log_SigmaR
0.75 0.2 1 -2 3 3 2 			# Steepness
0.01 0 1 -3 3 1.01 1.01 			# Rho
1.107963 -10 4 9 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_1_class_2
0.5632292 -10 4 9 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_1_class_3
0.6819283 -10 4 9 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_1_class_4
0.4910574 -10 4 9 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_1_class_5
0.4079118 -10 4 9 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_1_class_6
0.4365161 -10 4 9 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_1_class_7
0.4061268 -10 4 9 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_1_class_8
0.436146 -10 4 9 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_1_class_9
0.4049452 -10 4 9 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_1_class_10
0.3040197 -10 4 9 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_1_class_11
0.2973753 -10 4 9 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_1_class_12
0.1746801 -10 4 9 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_1_class_13
0.08452985 -10 4 9 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_1_class_14
0.01074624 -10 4 9 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_1_class_15
-0.1904683 -10 4 9 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_1_class_16
-0.3763125 -10 4 9 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_1_class_17
-0.6991629 -10 4 9 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_1_class_18
-1.158818 -10 4 9 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_1_class_19
-1.173116 -10 4 9 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_1_class_20
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_2_class_1
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_2_class_2
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_2_class_3
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_2_class_4
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_2_class_5
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_2_class_6
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_2_class_7
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_2_class_8
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_2_class_9
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_2_class_10
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_2_class_11
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_2_class_12
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_2_class_13
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_2_class_14
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_2_class_15
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_2_class_16
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_2_class_17
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_2_class_18
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_2_class_19
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Male_mature_1_shell_2_class_20
0.4257042 -10 4 9 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_1_class_1
2.268409 -10 4 9 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_1_class_2
1.810451 -10 4 9 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_1_class_3
1.370357 -10 4 9 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_1_class_4
1.158258 -10 4 9 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_1_class_5
0.5961968 -10 4 9 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_1_class_6
0.2257568 -10 4 9 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_1_class_7
-0.02478576 -10 4 9 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_1_class_8
-0.2140459 -10 4 9 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_1_class_9
-0.5605396 -10 4 9 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_1_class_10
-0.9742183 -10 4 9 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_1_class_11
-1.245801 -10 4 9 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_1_class_12
-1.492929 -10 4 9 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_1_class_13
-1.941358 -10 4 9 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_1_class_14
-2.051016 -10 4 9 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_1_class_15
-1.949566 -10 4 9 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_1_class_16
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_1_class_17
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_1_class_18
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_1_class_19
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_1_class_20
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_2_class_1
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_2_class_2
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_2_class_3
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_2_class_4
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_2_class_5
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_2_class_6
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_2_class_7
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_2_class_8
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_2_class_9
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_2_class_10
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_2_class_11
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_2_class_12
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_2_class_13
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_2_class_14
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_2_class_15
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_2_class_16
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_2_class_17
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_2_class_18
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_2_class_19
-100 -101 5 -2 0 10 20 			# Scaled_logN_for_Female_mature_1_shell_2_class_20
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
0.000224781 0.000281351 0.000346923 0.000422209 0.000507927 0.000604802 0.000713564 0.00083495 0.0009697 0.00111856 0.00128229 0.00146163 0.00165736 0.00187023 0.00210101 0.00235048 0.00261942 0.00290861 0.00321882 0.0039059
#_vectors of Female mean weight-at-size for immature and mature individuals
0.0002151 0.00026898 0.00033137 0.00040294 0.00048437 0.00062711 0.0007216 0.00082452 0.00093615 0.00105678 0.00118669 0.00132613 0.00147539 0.00163473 0.00180441 0.00218315 0.00218315 0.00218315 0.00218315 0.0021831
# -------------------------------------- #

# -------------------------------------- #
##_Fecundity for MMB/MMA calculation
# -------------------------------------- #
#_Maturity definition: Proportion of mature at size by sex
#_size_Class_1 size_Class_2 size_Class_3 size_Class_4 size_Class_5 size_Class_6 size_Class_7 size_Class_8 size_Class_9 size_Class_10 size_Class_11 size_Class_12 size_Class_13 size_Class_14 size_Class_15 size_Class_16 size_Class_17 size_Class_18 size_Class_19 size_Class_20 
0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1
0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
#_Legal definition of the proportion of mature at size by sex
#_size_Class_1 size_Class_2 size_Class_3 size_Class_4 size_Class_5 size_Class_6 size_Class_7 size_Class_8 size_Class_9 size_Class_10 size_Class_11 size_Class_12 size_Class_13 size_Class_14 size_Class_15 size_Class_16 size_Class_17 size_Class_18 size_Class_19 size_Class_20 
0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
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
3 
 
#_Growth increment model matrix
# ************************************** #
#_0 = Pre-specified growth increment
#_1 = linear (alpha; beta parameters)
#_2 = Estimated by size-class
#_3 = Pre-specified by size-class (empirical approach)
# ************************************** #
3 
 
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
7 5 
#_Number of blocks of growth matrix parameters (i.e., number of size-increment period)
1 3 
#_Year(s) with changes in the growth matrix
#_-> 1 line per sex - blank if no change (i.e., if the number of blocks of growth matrix parameters = 1)
1983 1994 
#_Number of blocks of molt probability
2 2 
#_Year(s) with changes in molt probability
#_-> 1 line per sex - blank if no change (i.e., if the number of blocks of growth matrix parameters = 1)
1980
1980

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
16.5 0 20 -33 0 0 999 			# Molt_increment_Male_period_1_class_1
16.5 0 20 -33 0 0 999 			# Molt_increment_Male_period_1_class_2
16.4 0 20 -33 0 0 999 			# Molt_increment_Male_period_1_class_3
16.3 0 20 -33 0 0 999 			# Molt_increment_Male_period_1_class_4
16.3 0 20 -33 0 0 999 			# Molt_increment_Male_period_1_class_5
16.2 0 20 -33 0 0 999 			# Molt_increment_Male_period_1_class_6
16.2 0 20 -33 0 0 999 			# Molt_increment_Male_period_1_class_7
16.1 0 20 -33 0 0 999 			# Molt_increment_Male_period_1_class_8
16.1 0 20 -33 0 0 999 			# Molt_increment_Male_period_1_class_9
16 0 20 -33 0 0 999 			# Molt_increment_Male_period_1_class_10
16 0 20 -33 0 0 999 			# Molt_increment_Male_period_1_class_11
15.9 0 20 -33 0 0 999 			# Molt_increment_Male_period_1_class_12
15.8 0 20 -33 0 0 999 			# Molt_increment_Male_period_1_class_13
15.8 0 20 -33 0 0 999 			# Molt_increment_Male_period_1_class_14
15.7 0 20 -33 0 0 999 			# Molt_increment_Male_period_1_class_15
15.7 0 20 -33 0 0 999 			# Molt_increment_Male_period_1_class_16
15.6 0 20 -33 0 0 999 			# Molt_increment_Male_period_1_class_17
15.6 0 20 -33 0 0 999 			# Molt_increment_Male_period_1_class_18
15.5 0 20 -33 0 0 999 			# Molt_increment_Male_period_1_class_19
15.5 0 20 -33 0 0 999 			# Molt_increment_Male_period_1_class_20
1 0.5 3 6 0 0 999 			# Gscale_Male_period_1
13.8 0 20 -33 0 0 999 			# Molt_increment_Female_period_1_class_1
12.2 0 20 -33 0 0 999 			# Molt_increment_Female_period_1_class_2
10.5 0 20 -33 0 0 999 			# Molt_increment_Female_period_1_class_3
8.4 0 20 -33 0 0 999 			# Molt_increment_Female_period_1_class_4
7.5 0 20 -33 0 0 999 			# Molt_increment_Female_period_1_class_5
7 0 20 -33 0 0 999 			# Molt_increment_Female_period_1_class_6
6.6 0 20 -33 0 0 999 			# Molt_increment_Female_period_1_class_7
6.1 0 20 -33 0 0 999 			# Molt_increment_Female_period_1_class_8
5.6 0 20 -33 0 0 999 			# Molt_increment_Female_period_1_class_9
5.1 0 20 -33 0 0 999 			# Molt_increment_Female_period_1_class_10
4.6 0 20 -33 0 0 999 			# Molt_increment_Female_period_1_class_11
4.1 0 20 -33 0 0 999 			# Molt_increment_Female_period_1_class_12
3.6 0 20 -33 0 0 999 			# Molt_increment_Female_period_1_class_13
3.2 0 20 -33 0 0 999 			# Molt_increment_Female_period_1_class_14
2.7 0 20 -33 0 0 999 			# Molt_increment_Female_period_1_class_15
2.2 0 20 -33 0 0 999 			# Molt_increment_Female_period_1_class_16
1.7 0 20 -33 0 0 999 			# Molt_increment_Female_period_1_class_17
1.2 0 20 -33 0 0 999 			# Molt_increment_Female_period_1_class_18
0.7 0 20 -33 0 0 999 			# Molt_increment_Female_period_1_class_19
0.4 0 20 -33 0 0 999 			# Molt_increment_Female_period_1_class_20
1.5 0.5 3 6 0 0 999 			# Gscale_Female_period_1
15.4 0 20 -33 0 0 999 			# Molt_increment_Female_period_2_class_1
13.8 0 20 -33 0 0 999 			# Molt_increment_Female_period_2_class_2
12.2 0 20 -33 0 0 999 			# Molt_increment_Female_period_2_class_3
10.5 0 20 -33 0 0 999 			# Molt_increment_Female_period_2_class_4
8.9 0 20 -33 0 0 999 			# Molt_increment_Female_period_2_class_5
7.9 0 20 -33 0 0 999 			# Molt_increment_Female_period_2_class_6
7.2 0 20 -33 0 0 999 			# Molt_increment_Female_period_2_class_7
6.6 0 20 -33 0 0 999 			# Molt_increment_Female_period_2_class_8
6.1 0 20 -33 0 0 999 			# Molt_increment_Female_period_2_class_9
5.6 0 20 -33 0 0 999 			# Molt_increment_Female_period_2_class_10
5.1 0 20 -33 0 0 999 			# Molt_increment_Female_period_2_class_11
4.6 0 20 -33 0 0 999 			# Molt_increment_Female_period_2_class_12
4.1 0 20 -33 0 0 999 			# Molt_increment_Female_period_2_class_13
3.6 0 20 -33 0 0 999 			# Molt_increment_Female_period_2_class_14
3.2 0 20 -33 0 0 999 			# Molt_increment_Female_period_2_class_15
2.7 0 20 -33 0 0 999 			# Molt_increment_Female_period_2_class_16
2.2 0 20 -33 0 0 999 			# Molt_increment_Female_period_2_class_17
1.7 0 20 -33 0 0 999 			# Molt_increment_Female_period_2_class_18
1.2 0 20 -33 0 0 999 			# Molt_increment_Female_period_2_class_19
0.7 0 20 -33 0 0 999 			# Molt_increment_Female_period_2_class_20
0 -1 1 -7 0 0 999 			# Gscale_Female_period_2
15.1 0 20 -33 0 0 999 			# Molt_increment_Female_period_3_class_1
14 0 20 -33 0 0 999 			# Molt_increment_Female_period_3_class_2
12.9 0 20 -33 0 0 999 			# Molt_increment_Female_period_3_class_3
11.8 0 20 -33 0 0 999 			# Molt_increment_Female_period_3_class_4
10.6 0 20 -33 0 0 999 			# Molt_increment_Female_period_3_class_5
8.7 0 20 -33 0 0 999 			# Molt_increment_Female_period_3_class_6
7.4 0 20 -33 0 0 999 			# Molt_increment_Female_period_3_class_7
6.6 0 20 -33 0 0 999 			# Molt_increment_Female_period_3_class_8
6.1 0 20 -33 0 0 999 			# Molt_increment_Female_period_3_class_9
5.6 0 20 -33 0 0 999 			# Molt_increment_Female_period_3_class_10
5.1 0 20 -33 0 0 999 			# Molt_increment_Female_period_3_class_11
4.6 0 20 -33 0 0 999 			# Molt_increment_Female_period_3_class_12
4.1 0 20 -33 0 0 999 			# Molt_increment_Female_period_3_class_13
3.6 0 20 -33 0 0 999 			# Molt_increment_Female_period_3_class_14
3.2 0 20 -33 0 0 999 			# Molt_increment_Female_period_3_class_15
2.7 0 20 -33 0 0 999 			# Molt_increment_Female_period_3_class_16
2.2 0 20 -33 0 0 999 			# Molt_increment_Female_period_3_class_17
1.7 0 20 -33 0 0 999 			# Molt_increment_Female_period_3_class_18
1.2 0 20 -33 0 0 999 			# Molt_increment_Female_period_3_class_19
0.7 0 20 -33 0 0 999 			# Molt_increment_Female_period_3_class_20
0 -1 1 -7 0 0 999 			# Gscale_Female_period_3

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
145.0386 100 500 3 0 0 999 			# Molt_probability_mu_Male_period_1
0.053036 0.02 2 3 0 0 999 			# Molt_probability_CV_Male_period_1
145.0386 100 500 3 0 0 999 			# Molt_probability_mu_Male_period_2
0.053036 0.02 2 3 0 0 999 			# Molt_probability_CV_Male_period_2
300 5 500 -4 0 0 999 			# Molt_probability_mu_Female_period_1
0.01 0.001 9 -4 0 0 999 			# Molt_probability_CV_Female_period_1
300 5 500 -4 0 0 999 			# Molt_probability_mu_Female_period_2
0.01 0.001 9 -4 0 0 999 			# Molt_probability_CV_Female_period_2

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
#  Gear-1 | Gear-2 | Gear-3 | Gear-4 | Gear-5 | Gear-6#  Pot_Fishery | Trawl_Bycatch | Bairdi_Fishery_Bycatch | Fixed_Gear | NMFS_Trawl | BSFRF 
1 1 1 1 2 1 #_Number of selectivity time period per fleet
1 0 1 0 0 0 #_Sex specific selectivity
2 2 2 2 2 2 #_Male selectivity type
2 2 2 2 2 2 #_Female selectivity type
0 0 0 0 6 0 #_Insertion of fleet in another
0 0 0 0 0 0 #_Extra parameters for each pattern by fleet (males)
0 0 0 0 0 0 #_Extra parameters for each pattern by fleet (females)
# 
#_Retention
#_Gear-1 | Gear-2 | Gear-3 | Gear-4 | Gear-5 | Gear-6#_Pot_Fishery_| Trawl_Bycatch_| Bairdi_Fishery_Bycatch_| Fixed_Gear_| NMFS_Trawl_| BSFRF
2 1 1 1 1 1 #_Number of Retention time period per fleet
1 0 0 0 0 0 #_Sex specific Retention
2 6 6 6 6 6 #_Male Retention type
6 6 6 6 6 6 #_Female Retention type
1 0 0 0 0 0 #_Male retention flag (0 = No, 1 = Yes)
0 0 0 0 0 0 #_Female retention flag (0 = No, 1 = Yes)
0 0 0 0 0 0 #_Extra parameters for each pattern by fleet (males)
0 0 0 0 0 0 #_Extra parameters for each pattern by fleet (females)
1 1 1 1 1 1 #_Selectivity for the maximum size class if forced to be 1?
 
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
1 1 1 1 125 5 190 0 1 999 4 1975 2020 0 0 0 1978 1978 0 			# Sel_Pot_Fishery_Male_period_1_par_1
1 2 2 1 8 0.1 20 0 1 999 4 1975 2020 0 0 0 1978 1978 0 			# Sel_Pot_Fishery_Male_period_1_par_2
1 3 1 2 84 5 150 0 1 999 4 1975 2020 0 0 0 1978 1978 0 			# Sel_Pot_Fishery_Female_period_1_par_1
1 4 2 2 4 0.1 20 0 1 999 4 1975 2020 0 0 0 1978 1978 0 			# Sel_Pot_Fishery_Female_period_1_par_2
# Trawl_Bycatch  
2 5 1 0 165 5 190 0 1 999 4 1975 2020 0 0 0 1978 1978 0 			# Sel_Trawl_Bycatch_Male_period_1_par_1
2 6 2 0 15 0.1 25 0 1 999 4 1975 2020 0 0 0 1978 1978 0 			# Sel_Trawl_Bycatch_Male_period_1_par_2
# Bairdi_Fishery_Bycatch  
3 7 1 1 103.275 5 190 1 103.275 30.98 4 1975 2020 0 0 0 1978 1978 0 			# Sel_Bairdi_Fishery_Bycatch_Male_period_1_par_1
3 8 2 1 8.834 0.1 25 1 8.834 2.65 4 1975 2020 0 0 0 1978 1978 0 			# Sel_Bairdi_Fishery_Bycatch_Male_period_1_par_2
3 9 1 2 91.178 5 190 1 91.178 27.35 4 1975 2020 0 0 0 1978 1978 0 			# Sel_Bairdi_Fishery_Bycatch_Female_period_1_par_1
3 10 2 2 2.5 0.1 25 1 2.5 0.75 4 1975 2020 0 0 0 1978 1978 0 			# Sel_Bairdi_Fishery_Bycatch_Female_period_1_par_2
# Fixed_Gear  
4 11 1 0 115 5 190 0 1 999 4 1975 2020 0 0 0 1978 1978 0 			# Sel_Fixed_Gear_Male_period_1_par_1
4 12 2 0 9 0.1 25 0 1 999 4 1975 2020 0 0 0 1978 1978 0 			# Sel_Fixed_Gear_Male_period_1_par_2
# NMFS_Trawl  
5 13 1 0 75 30 190 0 1 999 5 1975 1981 0 0 0 1978 1978 0 			# Sel_NMFS_Trawl_Male_period_1_par_1
5 14 2 0 5 1 50 0 1 999 5 1975 1981 0 0 0 1978 1978 0 			# Sel_NMFS_Trawl_Male_period_1_par_2
5 15 1 0 80 30 190 0 1 999 5 1982 2021 0 0 0 1978 1978 0 			# Sel_NMFS_Trawl_Male_period_2_par_1
5 16 2 0 10 1 50 0 1 999 5 1982 2021 0 0 0 1978 1978 0 			# Sel_NMFS_Trawl_Male_period_2_par_2
# BSFRF  
6 17 1 0 75 1 180 0 1 999 5 1975 2021 0 0 0 1978 1978 0 			# Sel_BSFRF_Male_period_1_par_1
6 18 2 0 8.5 1 50 0 1 999 5 1975 2021 0 0 0 1978 1978 0 			# Sel_BSFRF_Male_period_1_par_2

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
-1 25 1 1 135 1 999 0 1 999 4 1975 2004 0 0 0 1978 1978 0 			# Ret_Pot_Fishery_Male_period_1_par_1
-1 26 2 1 2 1 20 0 1 999 4 1975 2004 0 0 0 1978 1978 0 			# Ret_Pot_Fishery_Male_period_1_par_2
-1 27 1 1 140 1 999 0 1 999 4 2005 2020 0 0 0 1978 1978 0 			# Ret_Pot_Fishery_Male_period_2_par_1
-1 28 2 1 2.5 1 20 0 1 999 4 2005 2020 0 0 0 1978 1978 0 			# Ret_Pot_Fishery_Male_period_2_par_2
-1 29 1 2 591 1 999 0 1 999 -3 1975 2004 0 0 0 1978 1978 0 			# Ret_Pot_Fishery_Female_period_1_par_1
-1 30 1 2 591 1 999 0 1 999 -3 2005 2020 0 0 0 1978 1978 0 			# Ret_Pot_Fishery_Female_period_2_par_1
# Trawl_Bycatch  
-2 31 1 0 595 1 999 0 1 999 -3 1975 2020 0 0 0 1978 1978 0 			# Ret_Trawl_Bycatch_Male_period_1_par_1
# Bairdi_Fishery_Bycatch  
-3 32 1 0 595 1 999 0 1 999 -3 1975 2020 0 0 0 1978 1978 0 			# Ret_Bairdi_Fishery_Bycatch_Male_period_1_par_1
# Fixed_Gear  
-4 33 1 0 595 1 999 0 1 999 -3 1975 2020 0 0 0 1978 1978 0 			# Ret_Fixed_Gear_Male_period_1_par_1
# NMFS_Trawl  
-5 34 1 0 590 1 999 0 1 999 -3 1975 2021 0 0 0 1978 1978 0 			# Ret_NMFS_Trawl_Male_period_1_par_1
# BSFRF  
-6 35 1 0 580 1 999 0 1 999 -3 1975 2021 0 0 0 1978 1978 0 			# Ret_BSFRF_Male_period_1_par_1

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
1 1 1975 1e-06 0 1 -3 			# AsympRet_fleet_Pot_Fishery_sex_Male_year_1975
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
0.896 0 2 6 1 0.896 0.03 0 1 1 			# Log_vn_comp_1
1 0 5 -6 0 0.001 5 0 1 1 			# Log_vn_comp_2
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
1e-04 1e-05 10 -4 4 1 100 			# Log_add_cvt_survey_1
0.25 1e-05 10 10 0 0.001 1 			# Log_add_cvt_survey_2
 
# Additional variance control for each survey (0 = ignore; >0 = use)
1 2 
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
0.22313 0.0505 0.5 45.5 1 1 -12 4 -10 2.95 -10 10 			# log_fbar_Pot_Fishery
0.0183156 1 0.5 45.5 1 -1 -12 4 -10 10 -10 10 			# log_fbar_Trawl_Bycatch
0.011109 1 0.5 45.5 1 1 -12 4 -10 10 -10 10 			# log_fbar_Bairdi_Fishery_Bycatch
0.011109 1 0.5 45.5 1 -1 -12 4 -10 10 -10 10 			# log_fbar_Fixed_Gear
0 0 2 20 -1 -1 -12 4 -10 10 -10 10 			# log_fbar_NMFS_Trawl
0 0 2 20 -1 -1 -12 4 -10 10 -10 10 			# log_fbar_BSFRF
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
2 2 2 2 2 2 2 2 2 2 2 2 2 # Type of likelihood for the size-composition
0 0 0 0 0 0 0 0 0 0 0 0 0 # Option for the auto tail compression
1 1 1 1 1 1 1 1 1 1 1 1 1 # Initial value for effective sample size multiplier
-4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 # Phase for estimating the effective sample size
1 2 3 4 4 5 5 6 6 7 7 8 8 # Composition appender (Should data be aggregated?)
1 1 1 1 1 1 1 1 1 2 2 2 2 # Type-like predictions
1 1 1 1 1 1 1 1 1 1 1 1 1 # Lambda: multiplier for the effective sample size
1 1 1 1 1 1 1 1 1 1 1 1 1 # Emphasis: multiplier for weighting the overall likelihood
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
1 
# Phase of estimation
3 
# Standard deviation in M deviations
0.25 
# Number of nodes for cubic spline or number of step-changes for option 3
# -> One line per sex
2
2
# Year position of the knots for each sex (vector must be equal to the number of nodes)
# -> One line per sex
1980 1985 
1980 1985 
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
1.734258 0 2 8 0 			# M_dev_est_par_1
0 -2 2 -99 0 			# M_dev_est_par_2
1.780586 0 2 8 -1 			# M_dev_est_par_3
0 -2 2 -99 0 			# M_dev_est_par_4
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
0 -1 1 -1 0 1 1 			# m_mat_mult_Female
# -------------------------------------- #

# -------------------------------------- #
## Other (additional) controls
# -------------------------------------- #
# First year of recruitment estimation deviations
1975 
# Last year of recruitment estimation deviations
2020 
# Consider terminal molting? (0 = No; 1 = Yes
0 
# Phase for recruitment estimation
2 
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
1 
# Years to compute equilibrium
200 
# -------------------------------------- #

# -------------------------------------- #
## Emphasis factor (weights for likelihood) controls
# -------------------------------------- #
# Weights on catches for the likelihood component
1 1 1 1 1 1 1 

# Penalties on deviations
# ************************************** #
#  Fdev_total | Fdov_total | Fdev_year | Fdov_year 
1 1 0 0 			# Pot_Fishery
1 1 0 0 			# Trawl_Bycatch
1 1 0 0 			# Bairdi_Fishery_Bycatch
1 1 0 0 			# Fixed_Gear
1 1 0 0 			# NMFS_Trawl
1 1 0 0 			# BSFRF

# Account for priors (penalties)
# ************************************** #
10000 	#_ Log_fdevs 
0 	#_ meanF 
1 	#_ Mdevs 
2 	#_ Rec_devs 
0 	#_ Initial_devs 
0 	#_ Fst_dif_dev 
10 	#_ Mean_sex-Ratio 
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

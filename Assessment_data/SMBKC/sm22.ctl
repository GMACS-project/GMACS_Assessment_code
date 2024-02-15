## May 2022 smbkc base model 16.0 version 
## =============================================== updated for may 2022 base model     ##
## LEADING PARAMETER CONTROLS                                                           ##
#  Controls  for  leading  parameter  vector  theta
#  LEGEND  FOR  PRIOR:
#  0 = uniform, 1 = normal, 2 = lognormal, 3 =  beta, 4 =  gamma
#  ——————————————————————————————————————————————————————————————————————————————————————  #
#  ntheta
  12
## ==================================================================================== ##
# ival        lb        ub        phz   prior     p1      p2         # parameter         #
  0.18      0.01         1        -4       2   0.18    0.02          # M
  14.3      -7.0        30        -2       0    -7       30          # log(R0)
  10.0      -7.0        20        -1       1   -10.0     20          # log(Rini)
  13.39     -7.0        20         1       0    -7       20          # log(Rbar) (MUST be PHASE 1)
  80.0      30.0       310        -2       1    72.5    7.25         # Recruitment size distribution expected value
  0.25       0.1         7        -4       0    0.1     9.0          # Recruitment size scale (variance component)
  0.2      -10.0      0.75        -4       0  -10.0    0.75          # log(sigma_R)
  0.75      0.20      1.00        -2       3    3.0    2.00          # steepness
  0.01      0.00      1.00        -3       3    1.01   1.01          # recruitment autocorrelation
 14.5       5.00     20.00         1       0    5.00  20.00          # logN0 vector of initial numbers at length
 14.0       5.00     20.00         1       0    5.00  20.00          # logN0 vector of initial numbers at length
 13.5       5.00     20.00         1       0    5.00  20.00          # logN0 vector of initial numbers at length

# weight-at-length input method (1 = allometry i.e. w_l = a*l^b, 2 = vector by sex, 3 = matrix by sex)
3
# Male weight-at-length
0.000748427    0.001165731    0.001930510
0.000748427    0.001165731    0.001688886
0.000748427    0.001165731    0.001922246
0.000748427    0.001165731    0.001877957
0.000748427    0.001165731    0.001938634
0.000748427    0.001165731    0.002076413
0.000748427    0.001165731    0.001899330
0.000748427    0.001165731    0.002116687
0.000748427    0.001165731    0.001938784
0.000748427    0.001165731    0.001939764
0.000748427    0.001165731    0.001871067
0.000748427    0.001165731    0.001998295
0.000748427    0.001165731    0.001870418
0.000748427    0.001165731    0.001969415
0.000748427    0.001165731    0.001926859
0.000748427    0.001165731    0.002021492
0.000748427    0.001165731    0.001931318
0.000748427    0.001165731    0.002014407
0.000748427    0.001165731    0.001977471
0.000748427    0.001165731    0.002099246
0.000748427    0.001165731    0.001982478
0.000748427    0.001165731    0.001930932
0.000748427    0.001165731    0.001930932
0.000748427    0.001165731    0.001930932
0.000748427    0.001165731    0.001930932
0.000748427    0.001165731    0.001930932
0.000748427    0.001165731    0.001930932
0.000748427    0.001165731    0.001930932
0.000748427    0.001165731    0.001930932
0.000748427    0.001165731    0.001930932
0.000748427    0.001165731    0.001930932
0.000748427    0.001165731    0.001891628
0.000748427    0.001165731    0.001795721
0.000748427    0.001165731    0.001823113
0.000748427    0.001165731    0.001807433
0.000748427    0.001165731    0.001930932
0.000748427    0.001165731    0.001894627
0.000748427    0.001165731    0.001850611
0.000748427    0.001165731    0.001930932
0.000748427    0.001165731    0.001930932
0.000748427    0.001165731    0.001930932
0.000748427    0.001165731    0.001930932
0.000748427    0.001165731    0.001930932 # (updated - should this change?)
0.000748427    0.001165731    0.001930932 # (add line here each year - 4-14-22)
# Proportion mature by sex
0 1 1
# Proportion legal by sex
0 0 1
## ———————————————————————————————————————————————————————————————————————————————————— ##
## GROWTH PARAM CONTROLS                                                                ##
##     Two lines for each parameter if split sex, one line if not                       ##
## ———————————————————————————————————————————————————————————————————————————————————— ##         
# Use custom transition matrix (0=no, 1=growth matrix, 2=transition matrix, i.e. growth and molting)
# Use growth transition matrix option (1=read in growth-increment matrix; 2=read in size-transition; 3=gamma distribution for size-increment; 4=gamma distribution for size after increment) (1 to 8 options available)
# option 8 is normal distributed growth incrment, size after incrment is normal 
1
# growth increment model (0=prespecified;1=alpha/beta; 2=estimated by size-class;3=pre-specified/emprical)
0
# molt probability function (0=pre-specified; 1=flat;2=declining logistic)
2
# Maximum size-class for recruitment(males then females)
1
## number of size-increment periods
1
## Year(s) molt period changes (blank if no change)

## Two lines for each parameter if split sex, one line if not                           ##
## number of molt periods
1
## Year(s) molt period changes (blank if no changes)

## Beta parameters are relative (1=Yes;0=no)
1   
# AEP Growth parameters
## ———————————————————————————————————————————————————————————————————————————————————— ##
# ival        lb        ub     phz   prior      p1      p2         # parameter         #
# —————————————————————————————————————————————————————————————————————————————————————— #
#  14.1      10.0      30.0         -3       0    0.0   999.0         # alpha males or combined
#   0.0001    0.0       0.01        -3       0    0.0   999.0         # beta males or combined
#   0.45      0.01      1.0         -3       0    0.0   999.0         # gscale males or combined
 121.5      65.0     145.0         -4       0    0.0   999.0         # molt_mu males or combined
   0.060     0.0       1.0         -3       0    0.0   999.0         # molt_cv males or combined

# The custom growth matrix (if not using just fill with zeros)
# Alternative TM (loosely) based on Otto and Cummiskey (1990)
   0.1761   0.0000   0.0000
   0.7052   0.2206   0.0000
   0.1187   0.7794   1.0000
#   0.1761   0.7052   0.1187
#   0.0000   0.2206   0.7794
#   0.0000   0.0000   1.0000

# custom molt probability matrix


## ==================================================================================== ##
## SELECTIVITY CONTROLS                                                                 ##
##     Selectivity P(capture of all sizes). Each gear must have a selectivity and a     ##
##     retention selectivity. If a uniform prior is selected for a parameter then the   ##
##     lb and ub are used (p1 and p2 are ignored)                                       ##
## LEGEND                                                                               ##
##     sel type: 0 = parametric (nclass), 1 = individual parameter for each class(nclass), ##
##               2 = logistic (2, inflection point and slope), 3 = logistic95 (2, 50% and 95% selection), ##
##               4 = double normal (3 parameters, NIY)                                  ##
##    5: Flat equal to zero (1 parameter; phase must be negative), UNIFORM1             ##
##    6: Flat equal to one (1 parameter; phase must be negative), UNIFORM0              ##
##    7: Flat-topped double normal selectivity (4 parameters)                           ##
##    8: Declining logistic selectivity with initial values (50% and 95% selection plus extra)  ##
##  Extra (type 1): number of selectivity parameters to be estimated                    ##
##     gear index: use +ve for selectivity, -ve for retention                           ##
##     sex dep: 0 for sex-independent, 1 for sex-dependent                              ##
## ==================================================================================== ##
## ivector for number of year periods or nodes                                          ##
## POT       TBycatch FBycatch  NMFS_S   ADFG_pot
## Gear-1    Gear-2   Gear-3    Gear-4   Gear-5
   2         1        1         1        1         # Selectivity periods
   0         0        0         0        0         # sex specific selectivity, 0 male only fishery
   0         3        3         0        0         # male selectivity type (0=flat, or logistic or double normal)
   0         0        0         0        0         # within another gear insertion of fleet in another
   0         0        0         0        0         # extra parameters
## Gear-1    Gear-2   Gear-3    Gear-4   Gear-5
   1         1        1         1        1         # Retention time periods
   0         0        0         0        0         # sex specific retention, 0 for male only fishery
   3         6        6         6        6         # male retention type (flat equal to one, 1 parameter)
   1         0        0         0        0         # male retention flag (0 -> no, 1 -> yes)
   0         0        0         0        0         # extra parameters
   1         1        1         1        1         # determines fi maximum selectivity at size if forced to equal 1 or not
##  ————————————————————————————————————————————————————————————————————————————————————##
##  Selectivity  P(capture  of  all  sizes)
## ——————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————— ##
## gear  par   sel                                                phz     start  end    Env  Link Rand  Start_Y	End_Y	 Sigma ##
# index index par sex  ival      lb    ub   prior    p1     p2    mirror period period  Link Par  Walk  period	period 	 ##
## ——————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————— ##
# Gear-1
   1     1     1   0    0.4    0.001 1.0    0       0      1    3     1978   2008 		0    0   0	  1978	1978	 0.0
   1     2     2   0    0.7    0.001 1.0    0       0      1    3     1978   2008 		0    0   0	  1978	1978	 0.0
   1     3     3   0    1.0    0.001 2.0    0       0      1    -2     1978   2008 		0    0   0	  1978	1978	 0.0
   1     1     1   0    0.4    0.001 1.0    0       0      1    3     2009   2020 		0    0   0	  1978	1978	 0.0 # update end yr
   1     2     2   0    1.0    0.001 1.0    0       0      1    3     2009   2020 		0    0   0	  1978	1978	 0.0 # update end yr
   1     3     3   0    1.0    0.001 2.0    0       0      1    -2     2009   2020 		0    0   0	  1978	1978	 0.0 # update end yr
# Gear-2
   2     7     1   0    40      10.0  200    0      10    200   -3     1978   2020 		0    0   0	  1978	1978	 0.0 # update end yr
   2     8     2   0    60      10.0  200    0      10    200   -3     1978   2020 		0    0   0	  1978	1978	 0.0 # update end yr
# Gear-3
   3     9     1   0    40      10.0  200    0      10    200   -3     1978   2020 		0    0   0	  1978	1978	 0.0 # update end yr
   3    10     2   0    60      10.0  200    0      10    200   -3     1978   2020 		0    0   0	  1978	1978	 0.0 # update end yr
# Gear-4
   4     11    1   0    0.7     0.001 1.0    0       0      1   4     1978   2021 		0    0   0	  1978	1978	 0.0 # update end yr
   4     12    2   0    1.0     0.001 1.0    0       0      1   4     1978   2021 		0    0   0	  1978	1978	 0.0 # update end yr
   4     13    3   0    0.9     0.001 1.0    0       0      1   -5     1978   2021 		0    0   0	  1978	1978	 0.0 # update end yr
# Gear-5
   5     14    1   0    0.4     0.001 1.0    0       0      1   4     1978   2021 		0    0   0	  1978	1978	 0.0 # update end yr
   5     15    2   0    1.0     0.001 1.0    0       0      1   4     1978   2021 		0    0   0	  1978	1978	 0.0 # update end yr
   5     16    3   0    1.0     0.001 2.0    0       0      1   -2     1978   2021 		0    0   0	  1978	1978	 0.0 # update end yr
## Retained
# Gear-1
  -1     17    1   0    120        50 200    0      1    900    -7     1978   2020 		0    0   0	  1978	1978	 0.0 # update end yr
  -1     18    2   0    123       110 200    0      1    900    -7     1978   2020 		0    0   0	  1978	1978	 0.0 # update end yr
# Gear-2
  -2     19    1   0   595    1    999    0      1    999   -3     1978   2020 		0    0   0	  1978	1978	 0.0 # update end yr
# Gear-3
  -3     20    1   0   595    1    999    0      1    999   -3     1978   2020 		0    0   0	  1978	1978	 0.0 # update end yr
# Gear-4
  -4     21    1   0   595    1    999    0      1    999   -3     1978   2021 		0    0   0	  1978	1978	 0.0 # update end yr
# Gear-5
  -5     22    1   0   595    1    999    0      1    999   -3     1978   2021 		0    0   0	  1978	1978	 0.0 # update end yr

# Number of asymptotic parameters
1
# Fleet   Sex     Year       ival  lb   ub    phz  
       1     1     1978   0.000001   0    1     -3


# Environmental parameters
# Initial lower upper phase

# Deviation parameter phase
-1

## ==================================================================================== ##
## PRIORS FOR CATCHABILITY
##     If a uniform prior is selected for a parameter then the lb and ub are used (p1   ##
##     and p2 are ignored). ival must be > 0                                            ##
## only allowed to use uniform or lognormal prior                                       ##
## if analytic q estimation step is chosen, turn off estimating q by changing the estimation phase to be -ve ##
## LEGEND                                                                               ##
##     prior: 0 = uniform, 1 = normal, 2 = lognormal, 3 = beta, 4 = gamma               ##
## ==================================================================================== ##
##  LAMBDA: Arbitrary relative weights for each series, 0 = do not fit.
## SURVEYS/INDICES ONLY
## Analytic (0 = not analytically solved q, use uniform or lognormal prior; 1 = anaylytic) ##
## Lambda = multiplier for input CV, Emphasis = multiplier for likelihood                  ##
## ival    lb       ub    phz   prior   p1       p2    Analytic?   LAMBDA Emphasis
   1.0     0.5      1.2   -4    0       0        9.0   0           1             1 # NMFS trawl
 0.003      0        5     3    0       0        9.0   0           1             1 # ADF&G pot
## ==================================================================================== ##
## if uniform prior is specified then use lb and ub rather than p1 and p2
## ==================================================================================== ##
## ADDITIONAL CV FOR SURVEYS/INDICES                                                    ##
##     If a uniform prior is selected for a parameter then the lb and ub are used (p1   ##
##     and p2 are ignored). ival must be > 0                                            ##
## LEGEND                                                                               ##
##     prior: 0 = uniform, 1 = normal, 2 = lognormal, 3 = beta, 4 = gamma               ##
## ==================================================================================== ##
## ival                   lb     ub     phz    prior     p1      p2
   0.0000001      0.000000001   10.0      -4    4         1.0     100   # NMFS (PHASE -4)
   0.0000001      0.000000001   10.0      -4    4         1.0     100   # ADF&G
## ==================================================================================== ##
### Pointers to how the additional CVs are used (0 ignore; >0 link to one of the paramters)
0 0 
## ==================================================================================== ##
## PENALTIES FOR AVERAGE FISHING MORTALITY RATE FOR EACH GEAR
## ==================================================================================== ##
## Mean_F   Female Offset STD_PHZ1   STD_PHZ2   PHZ_M   PHZ_F Fbar_l Fbar_h Fdev_L Fdev_h Foff_l Foff_h
   0.2              0.0     3.0      50.0        1       -1     -12     4     -10     10    -10     10  # Pot
   0.0001           0.0     4.0      50.0        1       -1     -12     4     -10     10    -10     10  # Trawl
   0.0001           0.0     4.0      50.0        1       -1     -12     4     -10     10    -10     10  # Fixed
   0.00             0.0     2.00     20.00       -1      -1     -12     4     -10     10    -10     10  # NMFS
   0.00             0.0     2.00     20.00       -1      -1     -12     4     -10     10    -10     10  # ADF&G
## ==================================================================================== ##

## ==================================================================================== ##
## OPTIONS FOR SIZE COMPOSTION DATA (COLUMN FOR EACH MATRIX)
## ==================================================================================== ##
## LIKELIHOOD OPTIONS
##   -1) Multinomial with estimated/fixed sample size
##   -2) Robust approximation to multinomial
##   -3) logistic normal (NIY)
##   -4) multivariate-t (NIY)
##   -5) Dirichlet
## AUTOTAIL COMPRESSION
##   pmin is the cumulative proportion used in tail compression.
## ==================================================================================== ##
#  1   1   1  # Type of likelihood
  2   2   2  # Type of likelihood
#  5   5   5   # Type of likelihood
  0   0   0   # Auto tail compression (pmin)
  1   1   1   # Initial value for effective sample size multiplier
 -4  -4  -4   # Phz for estimating effective sample size (if appl.)
  1   2   3   # Composition aggregator
  1   2   2   # set to 2 for survey-like predictions; 1 for catch like predictions #AEP
  1   1   1   # LAMBDA
  1   1   1   # Emphasis
## ==================================================================================== ##

## ==================================================================================== ##
## TIME VARYING NATURAL MORTALIIY RATES                                                 ##
## ==================================================================================== ##
## TYPE: 
##      0 = constant natural mortality
##      1 = Random walk (deviates constrained by variance in M)
##      2 = Cubic Spline (deviates constrained by nodes & node-placement)
##      3 = Blocked changes (deviates constrained by variance at specific knots)
##       4 = Changes in pre-specified blocks                                            ##
##       5 = Changes in some knots                                                      ##
##       6 = Changes in Time blocks                                                     ##
## ==================================================================================== ##
## M Type
6
## M is relative (YES = 1; NO = 0)

## Phase of estimation (only use if parameters are default)
3
## STDEV in m_dev for Random walk
10.0
## Number of nodes for cubic spline or number of step-changes for option 3
2
## Year position of the knots (vector must be equal to the number of nodes)
1998 1999
## Number of Breakpoints in M by size
0
## Size-class of breakpoint
#3
## Specific initial values for the natural mortality devs (0-no, 1=yes)
1
## =========================================================================================== ##
## ival        lb        ub        phz   extra    prior     p1      p2         # parameter     ##
## =========================================================================================== ##
 1.600000       0          2          3      0                        # Males
 0.000000      -2          2        -99      0                        # Dummy to retun to base value
# 2.000000       0          4         -1      0                        # Size-specific M                       
## ==================================================================================== ##

##  ———————————————————————————————————————————————————————————————————————————————————— ##
##  TAGGING controls  CONTROLS
##  ———————————————————————————————————————————————————————————————————————————————————— ##
0          # emphasis on tagging data

# maturity specific natural mortality? (yes = 1; no = 0; only for use if nmature > 1) # NEW april 22?
0                                       
## ——————————————————————————————————————————————————————————————————————————————————————————— ##                                         
##  ival        lb    ub    phz   prior p1    p2         # parameter     ##                                         
## ——————————————————————————————————————————————————————————————————————————————————————————— ##                                         
  0     -1    1   -1    0  1    1   
#  0     -1    1   -1    0  1    1   

## ==================================================================================== ##
## OTHER CONTROLS
## ==================================================================================== ##
1978       # First rec_dev
2020       # last rec_dev (updated annually, should be last completed crab year?)
   0	   # Terminal molting (0 = off, 1 = on). If on, the calc_stock_recruitment_relationship() isn't called in the procedure
   3       # Estimated rec_dev phase
  -3       # Estimated sex_ratio
 0.5       # initial sex-ratio  
  -3       # Estimated rec_ini phase
   1       # VERBOSE FLAG (0 = off, 1 = on, 2 = objective func)
   2       # Initial conditions (0 = Unfished, 1 = Steady-state fished, 2 = Free parameters)
   1       # Lambda (proportion of mature male biomass for SPR reference points)
   0       # Stock-Recruit-Relationship (0 = None, 1 = Beverton-Holt)
  10       # Maximum phase (stop the estimation after this phase).
  -1       # Maximum number of function calls, if 1, stop at fn1 call; if -1 run as long as it takes
  1        # Calculate referene point (0=no)
  1	   # Use years specified to computed average sex ratio in the calculation of average recruitment for reference points (0 = off -i.e. Rec based on End year, 1 = on)
  200      # Years to compute equilibria
## ==================================================================================== ##
## EMPHASIS FACTORS (CATCH)
## ==================================================================================== ##
#Ret_POT Disc_POT Disc_trawl Disc_fixed
       1        1          1          1

## EMPHASIS FACTORS (Priors) by fleet: Fdev_total, Fdov_total, Fdev_year, Fdov_year
1 0 0.000 0 # Pot fishery
1 0 0.000 0 # Trawl bycatch
1 0 0.000 0 # fixed gear bycatch
1 0 0.000 0 # NMFS survey
1 0 0.000 0 # ADF&G survey 

## ==================================================================================== ##
## EMPHASIS FACTORS (Priors)
## ==================================================================================== ##
# Log_fdevs   meanF   Mdevs  Rec_devs Initial_devs Fst_dif_dev Mean_sex-Ratio    Molt_prob  Free_selectivity  Init_n_at_len Fvecs Fdovs  Sel_devs
#  10000       0       1.0    1        0            0           1             	   0          0                 0     	    0     0      0
10000	# Log_fdevs
0		# meanF	
1.0		# Mdevs
1		# Rec_devs 
0		# Initial_devs
0		# Fst_dif_dev
1		# Mean_sex-Ratio
0		# Molt_prob
0		# Free selectivi
0		# Init_n_at_len
0		# Fdevs
0		# Fdovs
0       # Sel_devs		
## EOF
9999

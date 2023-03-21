#  EAG21_1e Update2
#                                                                                          #
#  Controls  for  leading  parameter  vector  theta
#  LEGEND  FOR  PRIOR:
#  0 = uniform, 1 = normal, 2 = lognormal, 3 =  beta, 4 =  gamma
#                                                                                          #
#  ntheta
 9
#                                                                                        #
# ival      lb     ub       phz   prior   p1      p2      # parameter         #
#                                                                                        #
  0.21      0.01   1.0      -3     2     0.18    0.04      # M
 7.793810659  -10.0 20.0   1    0    -10.0    20.0      # ln R0, logarithm of unfished recruits, from my model
 
 12.0       -10.0   20.0     -3    0    -10.0    20.0      # ln Rini, logarithm of initial recruitment(syr)

   8.0       -10.0  20.0     -1    0    -10.0    20.0       # One par freed, ln Rbar, logarithm of average recruits(syr+1,nyr)

 110.0      103.0  165.0     -2    1     72.5    7.25      # (earlier estimated)recruitment expected value, ra, Expected value of recruitment distribution 
 
 15.183067602  0.001  20.0    3    0     0.1     5.0    ##1 ( any run change after first gmacs run0 recruitment scale (variance component), rbeta, rate parameter for recruitment distribution
 
  -0.693147181 -10.0   0.75   -1    0   -10.0     0.75      # ln (SigmaR), where sigmaR is 0.5,standard deviation of recruitment deviations, used in the LH of rec_dev
 
 0.73       0.2    1.0       -2    3     3.0     2.0       # steepness (only used if R is constrained by a S-R relationship)
  0.001      0.0    1.0      -3    3     1.01    1.01      # recruitment autocorrelation (only used if R is constrained by a S-R relationship)
#                                                                                      

# weight-at-length input  method  (1 = allometry  [w_l = a*l^b],  2 = vector by sex)
2
#a, in kg
# 1.445E-07
#b
# 3.281126995
# Male weight-at-length
 0.581515707	0.679328169	0.788032347	0.908278308	1.040724257	1.186036294	1.344888179	1.517961114	1.705943543	1.90953096	2.129425732	2.366336933	2.620980182	2.894077494	3.186357141	3.498553516	3.993657581
#  
# Proportion mature by sex, males
  0.  0.  1.  1.  1.  1.  1.  1.  1.  1.  1.  1.  1.  1.  1.  1.  1.
# Proportion legal by sex, males
  0.  0.  0.  0.  0.  0.  0.  1.  1.  1.  1.  1.  1.  1.  1.  1.  1.
##                                                                                      ##
## GROWTH PARAM CONTROLS                                                                ##
##     Two lines for each parameter if split sex, one line if not                       ##
##                                                                                      ##
# Use growth transition matrix option (1=read in growth-increment matrix; 2=read in size-transition; 3=gamma distribution for size-increment; 4=gamma distribution for size after increment) (1 to 8 options available)
# option 8 is normal distributed growth incrment, size after incrment is normal 
8   
# growth increment model (0=prespecified; 1=alpha/beta; 2=estimated by size-class;3=pre-specified/emprical)
1  
# molt probability function (0=pre-specified; 1=flat;2=declining logistic)
2
# maximum size-class (males then females) 
#17
# Maximum size-class for recruitment(males then females)
5
## number of size-increment periods
1
## Year(s) size-increment period changes (blank if no changes)

## number of molt periods
1
## Year(s) molt period changes (blank if no changes)

## Beta parameters are relative to a base level (1=Yes;0=no)
1  # earlier 0 for 4 selection fo gamma; for normal election 1, BBRKC 1, oldEAG19_1a 1

# AEP Growth parameters
##                                                                                      ##
# ival        lb        ub     phz   prior      p1      p2         # parameter         #
#                                                                                        #
    26.530599454   10.0    50.0    7       0       0.0    20.0   # alpha, a-b, converted from my base par result, from my model 
   0.099439238   -0.4    20.0     7       0       0.0    10.0   # beta, b/meanL, converted from my base par result, from my model 
   3.704001935   0.01    5.0      7       0       0.0     3.0   # growth scale, standard deviation of the normal distribution, from my model 
   141.030388205  65.0   165.0    7       0       0.0    999.0  #  moult mu, my base par L50, from my model 
   0.075056320  -0.1      2.0     7       0       0.0     2.0   # moult cv, moultL50 cv 1/(a*L50), from my model 
 #                                                                                      ##

# The custom growth-increment matrix

# custom molt probability matrix

##                                                                                        ##
## SELECTIVITY CONTROLS                                                                   ##
##     Selectivity P(capture of all sizes). Each gear must have a selectivity and a       ##
##     retention selectivity. If a uniform prior is selected for a parameter then the     ##
##     lb and ub are used (p1 and p2 are ignored)                                         ##
## LEGEND                                                                                 ##
##     sel type: 0 = parametric (nclass), 1 = indiviudal parameter for each class(nclass),##
##               2 = logistic (2, inflection point and slope), 3 = logistic95 (2, 50% and 95% selection), 4 = double normal (3 parameters),             ##
##             
##    5: Flat equal to zero (1 parameter; phase must be negative), UNIFORM1
##    6: Flat equal to one (1 parameter; phase must be negative), UNIFORM0                                    ##
##    7: Flat-topped double normal selectivity (4 parameters)
##    8: Declining logistic selectivity with initial values (50% and 95% selection plus extra) 
##  Extra (type 1): number of selectivity parameters to be estimated
##     gear index: use +ve for selectivity, -ve for retention                             ##
##     sex dep: 0 for sex-independent, 1 for sex-dependent                                ##
##                                                                                        ##
##  ivector  for  number  of  year  blocks  or  nodes  ##
##    Gear-1   Gear-2   
## PotFishery    Trawl Byc
        2         1                     # selectivity time periods
        0         0                     # set 0 for male only fishery, sex specific selectivity, 0 for sex independent selectivity
        2         5                     # male selectivity type model (flat equal to zero, 1 parameter) or logistic or  double normal etc.
        0         0                     # within another gear insertion of fleet in another
        0         0                     # extra paramters for each pattern
## Gear-1    Gear-2   
       1         1                      # retention time periods
       0         0                      # set 0 for male only fishery, sex specific retention
       2         6                      # male retention type model (flat equal to one, 1 parameter)
       1         0                      # male retention flag (0 = no, 1 = yes)
       0         0                      # extra
# AEPAEP
       1         1 	      		# determines if maximum selectivity at size is forced to equal 1 or not
##                                                                                      ##
##  Selectivity  P(capture  of  all  sizes)
##                                                                                                                             ##
## gear  par   sel                                                phz     start  end    Env  Link Rand  Start_Y	End_Y	 Sigma ##
# index index par sex  ival      lb    ub   prior    p1     p2    mirror period period  Link Par  Walk  period	period 	 ##
##                                                                                                                             ##
## Gear-1
   1     1     1   0  82.051523026 105.0 180.0   0   100.0  190.0     3   1960   2004 	0    0   2	  1985	2004	 0.1	 # set sex 0 for male only fishery, from my model  
   1     2     2   0  0.916889514  0.01   40.0   0     0.1   50.0     3   1960   2004	0    0   2	  1985	2004	 0.1	 # ub increased from 20. to 40.from my model 
   1     3     1   0  133.718440941 105.0 180.0   0   100.0  190.0     3  2005   2021	1    1   0	  1985	2004	 0.1	 # from my model  
   1     4     2   0   8.126894567  0.01   20.0   0     0.1   50.0     3  2005   2021	1    2   0	  1985	2004	 0.1	 # from my model 
                      
# Gear-2  
   2     5     1   0    1.00      0.99  1.02   0     10.0  200.0   -3     1960   2021	0    1   0	  1960	2020	 0.0	 #

## =========================================================================================================================== ##
## =========================================================================================================================== ##
## Retained
##                                                                                                                             ##
## gear  par   sel                                                phz     start  end    Env  Link Rand  Start_Y	End_Y	 Sigma ##
# index index par sex  ival      lb    ub   prior    p1     p2    mirror period period  Link Par  Walk  period	period 	 ##
##                                                                                                                             ##
  
# Gear-1
 -1      6    1   0   136.203128755  105.0  180.0  0      100.0  190.0  3  1960  2021 0    0   0    1960 2020 0.0  # from my model 
 -1      7    2   0    2.121540047   0.0001  20.0  0      0.1    50.0   3  1960  2021 0    0   0    1960 2020 0.0  # from my model 
                                          
# Gear-2
 -2      8    1   0    1.00         0.99   1.01  0       10.0   200.0   -3 1960  2021 0    0   0    1960 2020 0.0 
##                                                                                                                             ##

# Number of asyptotic parameters
1
# Fleet   Sex     Year       ival   lb   ub    phz
       1     1     1960   0.000001   0    1     -3


# Environmental parameters
# Initial lower upper phase
-0.5         -1        1     4
 0.5         -1        1     4
#0         -1        1     4

# Deviation parameter phase
-1





##                                                                                      ##
## PRIORS FOR CATCHABILITY
##     If a uniform prior is selected for a parameter then the lb and ub are used (p1   ##
##     and p2 are ignored). ival must be > 0                                            ##
## only allowed to use uniform or lognormal prior
## if anlytic q estimation step is chosen, turn off estimating q by changing the estimation phase to be -ve
## LEGEND                                                                               ##
##     prior: 0 = uniform, 1 = normal, 2 = lognormal, 3 = beta, 4 = gamma               ##
##                                                                                      ##
# 
## SURVEYS/INDICES ONLY    
## fishery and observer CPUE 
## Analytic (0=not analytically solved q, use uniform or lognormal prior; 
## 1= analytic), 
## Lambda =multilier for iput CV, Emphasis = multiplier for likelihood 
##  ival       lb         ub    phz    prior   p1         p2     Analytic?   LAMBDA   Emphasis
 0.000393337  0.0000001   0.01   1      0      0.0     1.0      0           1       1   # observer cpue index 1995-2004
 0.000313924  0.0000001   0.01   1      0      0.0     1.0      0           1       1   # observer cpue index 2005-2021 
 0.000369687   0.0000001  0.01   1      0      0.0     1.0      0           1       1   # fishery cpue index 1985-1998
    
## if a uniform prior is specified then use lb and ub rather than p1 and p2
##                                                                                      ##
## ADDITIONAL CV FOR SURVEYS/INDICES
##     If a uniform prior is selected for a parameter then the lb and ub are used (p1   ##
##     and p2 are ignored). ival must be > 0, lb should be>0                                            ##
## LEGEND                                                                               ##
##     prior type: 0 = uniform, 1 = normal, 2 = lognormal, 3 = beta, 4 = gamma          ##
##                                                                                      ##
##  ival          lb        ub    phz   prior   p1    p2
 0.000162542   0.0000001    0.5     6     0      0.5   100  # obs CPUE additional CV adjusted for abundance in 1000s
 0.000152979   0.0000001    0.5    6     0      0.5   100  # obs CPUE additional CV adjusted for abundance in 1000s
 0.000230704   0.0000001    0.5      6     0      0.5   100  # fishery CPUE additional CV adjusted for abundance in 1000s

### Pointers to how the the additional CVs are used (0 ignore; >0 link to one of the parameters
1 2 3
####
## if a uniform prior is specified then use lb and ub rather than p1 and p2
##                                                                                      ##
##                                                                                      ##
##PENALTIES  FOR  AVERAGE  FISHING  MORTALITY  RATE  FOR  EACH  GEAR
##
##                                                                                      ##
##  Trap  Trawl  
## Male F, Female F, early_phasepenalty_sd, later_phasepenalty_sd, meanmaleF_phase, meanfemaleF_phase,
## lb meanF, ub meanF,lbannualmaleF(F_dev), ubannual maleF(F_dev),lbannualfemaleF(F_dev), ubannual femaleF(F_dev)
## BBRKC uses STD_PHZ1=0.5 STD_PHZ2=45.5
## Mean_F    Fema-Offset   STD_PHZ1 STD_PHZ2 PHZ_M PHZ_F    Lb      Ub     Lb     Ub      Lb    Ub
#    0.262545356       0.0        3.0    15.0     2    -1     -12      4    -10     10     -10    10   # 
#    0.000202008       0.0        4.0    15.0     2    -1     -12      4    -10     10     -10    10   # 
    0.262545356       0.0        3.0    15.0     2    -1     -12      5    -10     10     -10    10   # 
    0.000202008       0.0        4.0    15.0     2    -1     -12      5    -10     10     -10    10   # 
##                                                                                      ##
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
##                                                                                      ##
##                                                                                      ##
#  ret tot    
# 
   1   1          # Type of likelihood
   0   0          # Auto tail compression (pmin)
   1   1          # Initial value for effective sample size multiplier
  -4  -4        # Phz for estimating effective sample size (if appl.)
   1   2         # Composition aggregator if you put 1 for each it will merge, do not merge (why merge)
   # AEPAEP
   1   1          # Set to 2 for survey-like predictions; 1 for catch-like predictions
   # AEPAEP
   0.59264415625  0.4694576875  # Emphasis AEP for Dritchlet (Ret, Tot, multiplier of stage1 ESS)
    1   1         # LAMBDA 0 to ignore the length comp
  ##                                                                                      ##

##  TIME  VARYING  NATURAL  MORTALIIY  RATES  ##
##                                                                                     E##
## Type: 0 = constant natural mortality                                                 ##
##       1 = Random walk (deviates constrained by variance in M)                        ##
##       2 = Cubic Spline (deviates constrained by nodes & node-placement)              ##
##       3 = Blocked changes (deviates constrained by variance at specific knots)       ##
##       4 = Changes in pre-specified blocks                                            ##
##       5 = Changes in some knots                                                      ##
##       6 = Changes in Time blocks                                                     ##
 0    # M type
## M is relative (YES=1; NO=0)

## Phase of estimation
3
## STDEV in m_dev for Random walk
0.25
## Number of nodes for cubic spline or number of step-changes for option 3
1
#0
## Year position of the knots (vector must be equal to the number of nodes)
1960
## number of breakpoints in M by size (keep it at 0) 
0
# line groups for breakpoint
#0
## Specific initial values for the natural mortality devs (0-no, 1=yes)
0
## ival        lb        ub        phz    extra
##    3.0        0.5       5.0       4        0

##                                                                                       ##
##  TAGGING controls  CONTROLS
##                                                                                       ##
 1          # emphasis on tagging data (1 =use tag LH, 0=ignore)
##                                                                                      ##	
## Maturity specific natural mortality  
### AEP
##                                                                                      ##	
# maturity specific natural mortality? (yes = 1; no = 0; only for use if nmature > 1)
 0																				
##                                                                                            E##																					
## 	ival        lb		ub		phz		prior	p1		p2         # parameter     ##																					
##                                                                                            E##																					
	0	    -1		1		-1		0	 1		1		
##                                                                                       ##
##                                                                                       ##
##  OTHER  CONTROLS
##                                                                                       ##
# 
1960       # First year of recruitment estimation,rec_dev. There is a difference in timing between Gmacs and my model, EAG 21_1a first rec_dev is 1961 and last rec_dev 2021
2021       # last year of recruitment estimation, rec_dev
   0	   # Terminal molting (0 = off, 1 = on). If on, the calc_stock_recruitment_relationship() isn't called in the procedure
   1       # phase for recruitment estimation,earlier -1. rec_dev estimation phase, BBRKC uses 2
  -2       # phase for recruitment sex-ratio estimation
  0.5      # Initial value for Expected sex-ratio
  -3       # Phase for initial recruitment estimation, rec_ini phase
   1       # VERBOSE FLAG (0 = off, 1 = on, 2 = objective func; 3 diagnostics)
   0       # Initial conditions (0 = Unfished, 1 = Steady-state fished, 2 = Free parameters, 3 = Free parameters (revised))
   1       # Lambda (proportion of mature male biomass for SPR reference points).
   0       # Stock-Recruit-Relationship (0 = none, 1 = Beverton-Holt)
   10      # Maximum phase (stop the estimation after this phase), 10  Maximum phase. If you put 1 it  will stop after phase 1
   -1      # Maximum number of function calls, if 1, stop at fn 1 call; if -1, run as long as it takes 
   1       # Calculate reference points (0=no)
   1	   # Use years specified to computed average sex ratio in the calculation of average recruitment for reference points (0 = off -i.e. Rec based on End year, 1 = on)
   200     ### Year to compute equilibria
## EMPHASIS FACTORS (CATCH)
#ret_male  tot_male   Groundfish 
        4       2          1
## EMPHASIS FACTORS (Priors) by fleet: fdev_total, Fdov_total, Fdev_year, Fdov_year
0 0 0.001 0 # Pot fishery
0 0 0.001 0 # Groundfish


## EMPHASIS FACTORS (Priors)
##                                                             
# Log_fdevs   meanF       Mdevs  Rec_devs Initial_devs Fst_dif_dev Mean_sex-Ratio  Fvecs Fdovs
#         0       0         0.0         2            0         0           0          1     0       #
# AEP
# Log_fdevs   meanF  Mdevs  Rec_devs Initial_devs Fst_dif_dev Mean_sex-Ratio  Molt_prob	Free_selectivity  Init_n_at_len Fvecs Fdovs  Sel_devs
#  0       	  0      0.0    2        0             0          0               0           0                 0     	  1     0      1
0   # Log_F
0   # Mean F
0.0 # Mdevs
2   # Rec_devs
0   #Initial Devs
0   #Fst_dif_dev
0   # Mean sex ratios
0   # Molt prob
0   # Free selectivity
0   # Initial_n_at_length
1   # F devs
0   # Fdovs
1   # Sel_devs
##  EOF
9999


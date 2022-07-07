/**
 * @file spr.cpp
 * @author Steve Martell, D'Arcy N. Webber
**/

#include <admodel.h>
#if defined __APPLE__ || defined __linux
	#include "../include/spr.h"
#endif
#if defined _WIN32 || defined _WIN64
	#include "include\spr.h"
#endif


/**
 * @brief constructor for SPR class
 * @details Constructor for SRR class
 * 
 * @param _r equilibrium recruitment
 * @param _lambda fraction of females that contribute to the spawning potential ratio
 * @param _rx size distribution of new recruits
 * @param _M natural mortality at size by sex
 * @param _wa weight-at-length interval
 * @param _A size-transition matrix
**/
spr::spr(const double& _r, 
         const double& _lambda,
         const dvector& _rx, 
         const dmatrix& _wa, 
         const d3_array& _M, 
         const d3_array& _A)
:m_rbar(_r),m_lambda(_lambda),m_rx(_rx),m_wa(_wa),m_M(_M),m_A(_A)
{
	m_nshell = 1;
	m_nsex   = m_M.slicemax();
	m_nclass = m_rx.indexmax();
	dmatrix S(1,m_nclass,1,m_nclass);
	S.initialize();

	// get unfished mature male biomass per recruit.
	m_ssb0 = 0.0;
	for ( int h = 1; h <= m_nsex; h++ )
	{
		for ( int l = 1; l <= m_nclass; ++l )
		{
			S(l,l) = exp(-m_M(h)(l,l));
		}
		dvector x = calc_equilibrium(S,h);
		double lam;
		h <= 1 ? lam=m_lambda: lam=(1.-m_lambda);
		m_ssb0 += lam * x * m_wa(h);
	}
}


/**
 * @brief constructor for SPR class
 * @details Constructor for SRR class
 * 
 * @param _r equilibrium recruitment
 * @param _lambda fraction of females that contribute to the Spawning potential ratio
 * @param _rx size distribution of new recruits
 * @param _M natural mortality at size by sex
 * @param _wa weight-at-length interval
 * @param _A size-transition matrix
**/
spr::spr(const double& _r, 
         const double& _lambda,
         const dvector& _rx, 
         const dmatrix& _wa, 
         const d3_array& _M, 
         const d3_array& _P,
         const d3_array& _A)
:m_rbar(_r),m_lambda(_lambda),m_rx(_rx),m_wa(_wa),m_M(_M),m_A(_A),m_P(_P)
{
	m_nshell   = 2;
	m_nsex     = m_M.slicemax();
	m_nclass   = m_rx.indexmax();
	dvector n(1,m_nclass);
	dvector o(1,m_nclass);
	dmatrix S(1,m_nclass,1,m_nclass);
	S.initialize();

	cout << "inside Constructor" << endl;
	
	// get unfished mature male biomass per recruit.
	m_ssb0 = 0.0;
	for(int h = 1; h <= m_nsex; h++ )
	{
		for (int l = 1; l <= m_nclass; ++l)
		{
			S(l,l) = exp(-m_M(h)(l,l));
		}
		dmatrix P = m_P(h);
		dmatrix A = m_A(h);
		dvector r = m_rbar/m_nsex * m_rx;

		calc_equilibrium(n,o,A,S,P,r);
		double lam;
		h <= 1 ? lam=m_lambda: lam=(1.-m_lambda);
		m_ssb0 += lam * (n+o) * m_wa(h);
		
	}
	COUT(m_ssb0);
}

spr::~spr()
{}


/**
 * @brief equilibrium vector of numbers at length
 * @details Solve for the equilibrium numbers at length for a single shell condition.
 * 
 * @param S diagonal matrix of survival rates at length
 * @param sex index for which sex
 * @return vector of numbers at length.
**/
dvector spr::calc_equilibrium(const dmatrix& S, const int& sex)
{
	int h = sex;
	dmatrix Id = identity_matrix(1,m_nclass);
	// use copy constructor for At.
	dmatrix At(1,m_nclass,1,m_nclass);
	At.initialize();
	At = trans(m_A(h)*S);
	
	dvector r = m_rbar/m_nsex * m_rx;
	dvector x = -solve(At-Id,r);
	
	return(x);
}


/**
 * @brief Calculate numbers at length in new and old shell categories
 * @details Equlibrium number of new and old shell crabs at each length interval.
 * 
 * @param n vector of new shell crabs
 * @param o vector of old shell crabs
 * @param A size-transition matrix
 * @param S diagonal matrix of survival at length
 * @param P diagonal matrix of molting probability at length
 * @param r vector of new shell recruits
**/
void spr::calc_equilibrium(dvector& n,
                      	   dvector& o,
                      	   const dmatrix& A,
                      	   const dmatrix& S,
                      	   const dmatrix& P,
                      	   const dvector& r)
{
	n.initialize();
	o.initialize();
	int nclass = m_nclass;
	dmatrix Id = identity_matrix(1,nclass);
	dmatrix B(1,nclass,1,nclass);
	dmatrix C(1,nclass,1,nclass);
	dmatrix D(1,nclass,1,nclass);

	B = inv(Id - (Id-P)*S);
	C = P * S * A;
	D = trans(Id - C - (Id-P)*S*B*C);

	n = solve(D,r);     // newshell
	o = n*((Id-P)*S*B); // oldshell
}


/**
 * @brief Calculate f_spr reference point.
 * @details Uses bisection method to determine the fishing mortality rate that will reduce the spawning potential ratio to the spr_target.
 * 
 * @param ifleet [description]
 * @param spr_target [description]
 * @param _fhk [description]
 * @param _sel [description]
 * @param _ret [description]
 * @return [description]
**/
double spr::get_fspr(const int& ifleet, 
                     const double& spr_target, 
                     const dmatrix& _fhk,
                     const d3_array _sel, 
                     const d3_array _ret,
                     const dvector _dmr)
{
	m_nfleet  = _fhk.colmax();
	m_ifleet  = ifleet;
	m_fref    = _fhk;
	m_dmr     = _dmr;
	int iter  = 0;
	double fa = 0.00;
	double fb = 2.00;
	double fc = 0.5*(fa+fb);
	dmatrix F = _fhk;
	dvector fratio(1,m_nfleet);
	int k,h;
	m_sel.allocate(_sel);
	m_ret.allocate(_ret);
	m_sel = _sel;
	m_ret = _ret;
	dvector n(1,m_nclass);
	dvector o(1,m_nclass);
	dmatrix S(1,m_nclass,1,m_nclass);
	dmatrix Z(1,m_nclass,1,m_nclass);
	Z.initialize();
	S.initialize();
	dmatrix Id = identity_matrix(1,m_nclass);
	
	do
	{
		m_ssb = 0;
		for ( h = 1; h <= m_nsex; h++ )
		{
			F(h)(ifleet) = fc;
			for ( k = 1; k <= m_nfleet; k++ )
			{
				fratio(k) = F(h)(k)/F(h)(ifleet);
			}
			dmatrix sel = _sel(h);
			dmatrix ret = _ret(h);
			
			Z = m_M(h);
			for ( k = 1; k <= m_nfleet; k++ )
			{
				dvector vul = elem_prod(sel(k),ret(k)+(1.0-ret(k))*m_dmr(k));
				for (int l = 1; l <= m_nclass; ++l)
				{
					Z(l,l) += (fc * fratio(k)) * vul(l);
				}

			}
			
			for (int l = 1; l <= m_nclass; ++l)
			{
				S(l,l) = exp(-diagonal(Z)(l));
			}

			if (m_nshell == 1)
			{
				dvector x = calc_equilibrium(S,h);
				
				double lam;
				h <= 1 ? lam=m_lambda: lam=(1.-m_lambda);
				m_ssb += lam * x * m_wa(h);
			}
			
			if (m_nshell == 2)
			{
				dvector r = m_rbar/m_nsex * m_rx;
				calc_equilibrium(n,o,m_A(h),S,m_P(h),r);
				double lam;
				h <= 1 ? lam=m_lambda: lam=(1.-m_lambda);
				m_ssb += lam * (n+o) * m_wa(h);
			}
		}	
		// spawning potential ratio
		m_spr = m_ssb/m_ssb0;
		
		// test for convergence
		double t1 = m_spr - spr_target;
		if ( t1==0 || 0.5*(fb-fa) < TOL )
		{
			m_fspr = fc;
			m_bspr = m_ssb;
			cout << "SPR calculations have converged. :)" << endl;
			break;
		}

		// bisection update
		if(t1 > 0)
		{
			fa = fc;
		} else {
			fb = fc;
		}
		cout<<"iter = "<<iter<<"\tfc = "<<fc<<"\t(spr-spr_target)="<<m_spr<<" - "<<spr_target<<" "<<t1<<endl;
		fc = 0.5*(fa+fb);
	} while (iter++ < MAXIT);

	return m_fspr;
}


/**
 * @brief Calculate fishing mortality rate for OFL
 * @details Use harvest control rule to calculate Fofl
 * @param alpha is the depletion level at 0 fishing.
 * @param limit Depletion level where Fofl = 0
 * @param ssb projected spawning stock biomass
 * @return [description]
**/
double spr::get_fofl(const double& alpha, const double& limit, const double& ssb)
{
	double depletion = ssb/m_bspr;
	m_fofl = 0;
	if ( depletion > 1.0 )
	{
		m_fofl = m_fspr;
	}
	if ( limit < depletion && depletion <= 1.0 )
	{
		m_fofl = m_fspr * (depletion - alpha)/(1.0 - alpha);
	}
	return m_fofl;
}


/**
 * @brief Calculate OFL
 * @details Calculates the OFL based on harvest control rule and estimate of Fspr%
 * 
 * @param N [description]
 * @return [description]
**/
double spr::get_cofl(const dmatrix& N)
{
	cout << "Get OFL" << endl;
	double ctmp = 0;
	// double dmr  = 0.8;
	double ftmp;
	for ( int h = 1; h <= m_nsex; h++ )
	{
		for ( int k = 1; k <= m_nfleet; k++ )
		{	
			ftmp = m_fref(h)(k);
			if (k == m_ifleet) ftmp = m_fofl;
			dvector vul = elem_prod(m_sel(h)(k),m_ret(h)(k)+(1.0-m_ret(h)(k))*m_dmr(k));
			dvector f = ftmp * vul;
			dvector z = diagonal(m_M(h)) + f;
			dvector o = 1.0-exp(-z);
			ctmp += elem_prod(N(h),m_wa(h)) * elem_div(elem_prod(f,o),z);
		}
	}
	m_cofl = ctmp;
	return(m_cofl);
}

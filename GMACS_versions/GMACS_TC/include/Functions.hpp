/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/cppFiles/file.h to edit this template
 */

/* 
 * File:   Functions.hpp
 * Author: William Stockhausen
 *
 * Created on January 3, 2023, 7:44 AM
 */

#pragma once
#ifndef FUNCTIONS_HPP
#define FUNCTIONS_HPP

#include <admodel.h>

typedef dvariable   (*FcnPtr)(const dvar_vector&, const dvar_vector&);
typedef dvar_vector (*VecFcnPtr)(const dvar_vector&, const dvar_vector&);

namespace gmacs{
  dvariable fcn_constant(const dvar_vector& vars,const dvar_vector& params){return params(1);}
  dvariable fcn_allometry(const dvar_vector& vars,const dvar_vector& params){return params(1)*pow(vars(1),params(2));}
  /**
   * Calculate a mean post-molt size given a pre-molt size
   * 
   * @param vars - pre-molt size
   * @param params - {grA,grB} 
   * @return - dvariable with mean post-molt size
   * 
   * @details Post-molt sizes are calculated using
   *   mnZs = mfexp(grA+grB*log(zBs));
   * where 
   *   grA - ln-scale mean post-molt size intercept
   *   grB - ln-scale mean post-molt size slope
   *   zB  - pre-molt size
   */
  dvariable fcn_MnPMZ1(const dvar_vector& vars,const dvar_vector& params);
/**
 * Calculate a mean post-molt size given a pre-molt size
 * 
 * @param vars - dvar_vector of pre-molt sizes
 * @param params - {grA,zA,grB,zB}  (zA and zB are fixed)
 * @return - vector of mean post-molt sizes
 * 
 * @details Post-molt sizes are calculated using
 *   mnZs = grA*mfexp(log(grB/grA)/log(zGrB/zGrA)*log(zBs/zGrA));
 * where 
 *   grA - mean post-molt size at pre-molt size zA
 *   grB - mean post-molt size at pre-molt size zB
 *   zBs - vector of pre-molt sizes
 */
  dvariable fcn_MnPMZ2(const dvar_vector& vars,const dvar_vector& params);
  //////////////////////////////////////////////////////////////////////////////
  /**
   * Return a vector with the value of all elements the same
   * 
   * @param vars - dvar_vector
   * @param params - {c}
   * @return - dvar_vector for dependent variable
   * 
   * The constant value is calculated as 
   *   d[i] = c + 0*v[i];
   * where
   *   v[i] - the value of the independent variable
   *   d[i] - the value of the dependent variable
   */
  dvar_vector vecfcn_constant(const dvar_vector& vars,const dvar_vector& params){return params(1)+0*vars;}
  /**
   * Calculate allometry is based on a power law model.
   * @param vars - vector of values for the independent variable (z's}
   * @param params - {a, b}
   * @return - dvar_vector for dependent variable
   * 
   * The allometric relationship is calculated as
   *   w[i] = a*z[i]^b
   * where
   *   z[i] - i-th value of the independent variable
   *   w[i] - corresponding value of the dependent variable 
   */
  dvar_vector vecfcn_allometry(const dvar_vector& vars,const dvar_vector& params){return params(1)*pow(vars,params(2));}
  /**
   * Calculate a vector of mean post-molt sizes given pre-molt sizes
   * 
   * @param vars - dvar_vector of pre-molt sizes
   * @param params - {grA,grB} (
   * @return - vector of mean post-molt sizes
   * 
   * @details Post-molt sizes are calculated using
   *   mnZs[i] = mfexp(grA+grB*log(zBs[i]));
   * where 
   *   grA - ln-scale mean post-molt size intercept
   *   grB - ln-scale mean post-molt size slope
   *   zBs - vector of pre-molt sizes
   */
  dvar_vector vecfcn_MnPMZ1(const dvar_vector& vars,const dvar_vector& params);
  /**
   * Calculate a vector of mean post-molt sizes given pre-molt sizes
   * 
   * @param vars - dvar_vector of pre-molt sizes
   * @param params - {grA,zA,grB,zB} (zA and zB are fixed)
   * @return - vector of mean post-molt sizes
   * 
   * @details Post-molt sizes are calculated using
   *   mnZs[i] = grA*mfexp(log(grB/grA)/log(zGrB/zGrA)*log(zBs[i]/zGrA));
   * where 
   *   grA - mean post-molt size at pre-molt size zA
   *   grB - mean post-molt size at pre-molt size zB
   *   zBs - vector of pre-molt sizes
   */
  dvar_vector vecfcn_MnPMZ2(const dvar_vector& vars,const dvar_vector& params);
}

class Function {
public: 
  /* names identifying functions */
  /** function is same across all indep vars */
  static const adstring CONSTANT  = "constant";
  /** function is same across all indep vars (alias for CONSTANT) */
  static const adstring NONE      = "none";
  /** function is same across all indep vars (alias for CONSTANT) */
  static const adstring FLAT      = "flat";
  
  /** power-law function d = a*I^b */
  static const adstring ALLOMETRY = "allometry";
  /** d = exp(a+b*ln(I)) */
  static const adstring MnPMZ1 = "mnpmz1";
  /** d = a*mfexp(log(b/a)/log(zB/zA)*log(I/zA)); */
  static const adstring MnPMZ2 = "mnpmz2";
public:
  /**
   * Return a pointer to a scalar function.
   * 
   * @param name - name of scalar function
   * @return - pointer to the function
   */
  static FcnPtr getFcnPtr(adstring name);
  /**
   * Return a pointer to a vector function.
   * 
   * @param name - name of vector function
   * @return - pointer to the function
   */
  static VecFcnPtr getVectorFcnPtr(adstring name);
protected:
  Function(){}  //constructor protected, static access only
  ~Function(){}
};
#endif /* FUNCTIONS_HPP */


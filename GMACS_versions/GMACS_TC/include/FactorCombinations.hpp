/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/cppFiles/file.h to edit this template
 */

/* 
 * File:   FactorCombinations.hpp
 * Author: williamstockhausen
 *
 * Created on December 1, 2022, 11:26 AM
 */

#pragma once
#ifndef FACTORCOMBINATIONS_HPP
#define FACTORCOMBINATIONS_HPP

#include <map>
#include <admodel.h>
#include "ModelConfiguration.hpp"

///////////////////////////////////FactorCombination///////////////////////////
class FactorCombination{
public:
  /* flag to print debugging info */
  static int debug;
  
  /* factor combination index */
  int fc;
  /* factor combination mirror */
  int fcm;
  /* string indicating region */
  adstring s_r;
  /* string indicating sex */
  adstring s_x;
  /* string indicating maturity state */
  adstring s_m;
  /* string indicating shell condition */
  adstring s_s;
  /* string indicating time block */
  adstring s_tb;
  /* string indicating size range */
  adstring s_zb;
  /* string indicating input type */
  adstring s_type;
  /* string indicating input units */
  adstring s_units;
  /* label for factor combination */
  adstring label;
  /* integer index indicating applicable region */
  int r;
  /* integer index indicating applicable sex */
  int x;
  /* integer index indicating applicable shell condition */
  int s;
  /* integer index indicating applicable maturity state */
  int m;
  
  /**
   * Class constructor
   */
  FactorCombination(int fc_);
  
  /**
   * Class destructor
   */
  ~FactorCombination();
  
  /**
   * Read object from input stream in ADMB format.
   * 
   * @param is - file input stream
   */
  void read(cifstream & is);
  /**
   * Write object to output stream in ADMB format.
   * 
   * @param os - output stream
   */
  void write(std::ostream & os);
  /**
   * Operator to read from input filestream in ADMB format
   */
  friend cifstream&    operator >>(cifstream & is, FactorCombination & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   FactorCombination & obj){obj.write(os);return os;}
};


///////////////////////////////////FactorCombinations///////////////////////////
class FactorCombinations{
public:
  /* flag to print debugging info */
  static int debug;
  /* max number of factor combinations to read before throwing an error */
  static const int maxNumFCs = 100;
  
  /* number of factor combinations */
  int nFCs;
  /* map to factor combinations, with the factor combination as the key */
  std::map<int,FactorCombination*> mapFCs;
  
  /**
   * Class constructor
   */
  FactorCombinations();
  
  /**
   * Class destructor
   */
  ~FactorCombinations();
  
  /**
   * Count number of factor combinations specifying a particular type
   * 
   * @param type_ - (adstring) the type to count instances of
   * @return the number of factor combinations specifying type = type_
   */
  int countType(adstring type_);
  
  /**
   * Read object from input stream in ADMB format.
   * 
   * @param is - file input stream
   */
  void read(cifstream & is);
  /**
   * Write object to output stream in ADMB format.
   * 
   * @param os - output stream
   */
  void write(std::ostream & os);
  /**
   * Operator to read from input filestream in ADMB format
   */
  friend cifstream&    operator >>(cifstream & is, FactorCombinations & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   FactorCombinations & obj){obj.write(os);return os;}
};

/////////////////////////////////////AllParamsInfo////////////////////////////
//class AllParamsInfo{
//public:
//  /* flag to print debugging info */
//  static int debug;
//  
//  /* pointer to FactorCombinations object */
//  FactorCombinations* ptrFCs;
//  
//  /* number of factor combinations using the std param function type */
//  int nStdParamFunctionTypes;
//  /* pointer to StdParamFunctionsInfo object */
//  StdParamFunctionsInfo* ptrFIs;
//  /* number of factor combinations using the param matrix type */
//  int nParamMatrixFunctionTypes;
//  /* pointer to ParamMatrixsInfo object */
//  ParamMatrixFunctionsInfo* ptrPMIs;
//  
//  /* number of factor combinations using the fixed vector type */
//  int nFixedVectorTypes;
//  /* pointer to FixedVectorsInfo object */
//  FixedVectorsInfo* ptrFVIs;
//  /* number of factor combinations using the fixed matrix type */
//  int nFixedMatrixTypes;
//  /* pointer to FixedMatrixsInfo object */
//  FixedMatrixsInfo* ptrFMIs;
//  
//  /* number of factor combinations using the var_function type */
//  int nVarParamFunctionTypes;
//  /* pointer to VarParamFunctionsInfo object */
//  VarParamFunctionsInfo* ptrVPFIs;
//  /* pointer to AllVarParamsInfo object */
//  AllVarParamsVariationInfo* ptrVPVIs;
//  
//  /* number of parameters */
//  int numParams;
//  /* matrix with init val, lower bound, upper bound, phase, and jitter flag for all params */
//  dmatrix matILUPJs;
//  
//  
//  /** 
//   * Class constructor
//   */
//  AllParamsInfo();
//  /** 
//   * Class destructor
//   */
//  virtual ~AllParamsInfo();
//  /**
//   * Calculate number of parameters
//   * 
//   * @return - (int) number of parameters
//   */
//  int calcNumParams();
//  /**
//   * Create a matrix with initial value, lower bound, upper bound, phase, and jitter flag 
//   * for all parameters.
//   * 
//   * @return - dmatrix with initial value, lower bound, upper bound, phase, 
//   * and jitter flag for all parameters
//   */
//  dmatrix calcILUPJs();
//   /**
//   * Read object from input stream in ADMB format.
//   * 
//   * @param is - file input stream
//   */
//  virtual void read(cifstream & is)=0;//=0 makes this class abstract!
//  /**
//   * Write object to output stream in ADMB format.
//   * 
//   * @param os - output stream
//   */
//  virtual void write(std::ostream & os)=0;//=0 makes this class abstract!
//  /**
//   * Operator to read from input filestream in ADMB format
//   */
//  friend cifstream&    operator >>(cifstream & is, AllParamsInfo & obj){obj.read(is);return is;}
//  /**
//   * Operator to write to output stream in ADMB format
//   */
//  friend std::ostream& operator <<(std::ostream & os,   AllParamsInfo & obj){obj.write(os);return os;}
//  
//};//--AllParamsInfo
//
#endif /* FACTORCOMBINATIONS_HPP */


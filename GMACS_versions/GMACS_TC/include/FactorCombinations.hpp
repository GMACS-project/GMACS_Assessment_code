/* 
 * File:   FactorCombinations.hpp
 * Author: William Stockhausen
 *
 * Created on December 1, 2022, 11:26 AM
 */

#pragma once
#ifndef FACTORCOMBINATIONS_HPP
#define FACTORCOMBINATIONS_HPP

#include <map>
#include <admodel.h>
#include "ParamInfo.hpp"
#include "VarParamInfo.hpp"
#include "FixedQuantitiesInfo.hpp"
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
  /* string indicating function name */
  adstring s_fcn;
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

#endif /* FACTORCOMBINATIONS_HPP */


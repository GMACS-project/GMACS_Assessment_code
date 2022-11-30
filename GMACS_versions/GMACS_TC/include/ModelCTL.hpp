/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/cppFiles/file.h to edit this template
 */

/* 
 * File:   ModelCTL.hpp
 * Author: williamstockhausen
 *
 * Created on November 21, 2022, 4:07 PM
 */

#pragma once
#ifndef MODELCTL_HPP
#define MODELCTL_HPP
#include <admodel.h>

class ModelConfiguration;//--forward definition

///////////////////////////////////BasicParamInfo////////////////////////////
class BasicParamInfo{
public:
  /* flag to print debugging info */
  static int debug;
  /* initial value */
  double init_val;
  /* lower bound */
  double lwr_bnd;
  /* upper bound */
  double upr_bnd;
  /* estimation phase */
  int phase;
  /* flag to jitter initial value */
  int jitter;
  /* name of prior pdf */
  adstring s_prior;
  /* leading parameter for prior */
  double p1;
  /* secondary parameter for prior */
  double p2;
  
  BasicParamInfo();
  ~BasicParamInfo();
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
  friend cifstream&    operator >>(cifstream & is, BasicParamInfo & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   BasicParamInfo & obj){obj.write(os);;return os;}
  
};
///////////////////////////////////StdParamInfo////////////////////////////
class StdParamInfo: BasicParamInfo {
public:
  /* flag to print debugging info */
  static int debug;
  /* parameter name */
  adstring s_param;
  /* factor combination mirror index */
  int mirror;
  
  StdParamInfo();
  ~StdParamInfo();
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
  friend cifstream&    operator >>(cifstream & is, StdParamInfo & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   StdParamInfo & obj){obj.write(os);;return os;}
  
};
/////////////////////////////////////FunctionInfo////////////////////////////
//class FunctionInfo{
//public:
//  /* flag to print debugging info */
//  static int debug;
//  /* factor combination index */
//  int fc;
//  /* function name */
//  adstring s_function;
//  /* parameter name */
//  adstring s_param;
//  /* index of factor combination mirror */
//  int mirror;
//  /* initial value */
//  double init_val;
//  /* lower bound */
//  double lwr_bnd;
//  /* upper bound */
//  double upr_bnd;
//  /* estimation phase */
//  int phase;
//  /* flag to jitter initial value */
//  int jitter;
//  /* name of prior pdf */
//  adstring s_prior;
//  /* leading parameter for prior */
//  double p1;
//  /* secondary parameter for prior */
//  double p2;
//  /* parameter label */
//  adstring s_label;
//  
//  FunctionInfo(){}
//  ~FunctionInfo(){}
//   /**
//   * Read object from input stream in ADMB format.
//   * 
//   * @param is - file input stream
//   */
//  void read(cifstream & is);
//  /**
//   * Write object to output stream in ADMB format.
//   * 
//   * @param os - output stream
//   */
//  void write(std::ostream & os);
//  /**
//   * Operator to read from input filestream in ADMB format
//   */
//  friend cifstream&    operator >>(cifstream & is, FunctionInfo & obj){obj.read(is);return is;}
//  /**
//   * Operator to write to output stream in ADMB format
//   */
//  friend std::ostream& operator <<(std::ostream & os,   FunctionInfo & obj){obj.write(os);;return os;}
//  
//};
/////////////////////////////////////FunctionsInfo////////////////////////////
//class FunctionsInfo{
//public:
//  /* flag to print debugging info */
//  static int debug;
//  /* array of pointers to FunctionInfo objects */
//  FunctionInfo** ppFPI;
//  
//  /** 
//   * Class constructor
//   */
//  FunctionsInfo();
//  /** 
//   * Class destructor
//   */
//  ~FunctionsInfo();
//   /**
//   * Read object from input stream in ADMB format.
//   * 
//   * @param is - file input stream
//   */
//  void read(cifstream & is);
//  /**
//   * Write object to output stream in ADMB format.
//   * 
//   * @param os - output stream
//   */
//  void write(std::ostream & os);
//  /**
//   * Operator to read from input filestream in ADMB format
//   */
//  friend cifstream&    operator >>(cifstream & is, FunctionsInfo & obj){obj.read(is);return is;}
//  /**
//   * Operator to write to output stream in ADMB format
//   */
//  friend std::ostream& operator <<(std::ostream & os,   FunctionsInfo & obj){obj.write(os);;return os;}
//  
//};
///////////////////////////////////FactorCombination///////////////////////////
class FactorCombination{
public:
  /* flag to print debugging info */
  static int debug;
  /* ModelConfiguration object */
  static ModelConfiguration* ptrMC;
  
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
  /* integer indicating applicable time block */
  int tb;
  /* integer indicating applicable size block */
  int zb;
  
  /**
   * Class constructor
   * 
   * @param ptrMC_ - pointer to ModelConfiguration object
   */
  FactorCombination(ModelConfiguration* ptrMC_);
  
  /**
   * Class constructor
   * 
   * @param ptrMC_ - pointer to ModelConfiguration object
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
  friend std::ostream& operator <<(std::ostream & os,   FactorCombination & obj){obj.write(os);;return os;}
};


///////////////////////////////////FactorCombinations///////////////////////////
class FactorCombinations{
public:
  /* flag to print debugging info */
  static int debug;
  /* pointer to ModelConfiguration object */
  static ModelConfiguration* ptrMC;
  /* number of factor combinations */
  int nFCs;
  /* pointer to array of factor combinations */
  FactorCombination** ppFCs;
  
  /**
   * Class constructor
   * 
   * @param ptrMC_ - pointer to ModelConfiguration object
   */
  FactorCombinations(ModelConfiguration* ptrMC_);
  
  /**
   * Class constructor
   * 
   * @param ptrMC_ - pointer to ModelConfiguration object
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
  friend std::ostream& operator <<(std::ostream & os,   FactorCombinations & obj){obj.write(os);;return os;}
};

///////////////////////////////////WeightAtSize/////////////////////////////////
class WeightAtSize{
public:
  /* flag to print debugging info */
  static int debug;
  /* keyword */
  static const adstring keyword;
  /* pointer to ModelConfiguration object */
  static ModelConfiguration* ptrMC;
  /* pointer to FactorCombinations object*/
  FactorCombinations* ptrFCs;
  /* number of factor combinations using the allometry type*/
  int nAllometryTypes;
  /* number of factor combinations using the vector type*/
  int nVectorTypes;
  
  /**
   * Class constructor
   * 
   * @param ptrMC_ - pointer to ModelConfiguration object
   */
  WeightAtSize(ModelConfiguration* ptrMC_);
  
  /**
   * Class constructor
   * 
   * @param ptrMC_ - pointer to ModelConfiguration object
   */
  ~WeightAtSize();
  
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
  friend cifstream&    operator >>(cifstream & is, WeightAtSize & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   WeightAtSize & obj){obj.write(os);;return os;}
};

class ModelCTL{
public:
  /* flag to print debugging info */
  static int debug;
  /* ctl file version */
  static const adstring version;
  /* pointer to ModelConfiguration object */
  static ModelConfiguration* ptrMC;
  
  /* pointer to WeightAtSize object */
  WeightAtSize* ptrWatZ;
  
  /**
   * Class constructor
   * 
   * @param ptrMC_ - pointer to ModelConfiguration object
   */
  ModelCTL(ModelConfiguration* ptrMC_);
  
  /**
   * Class constructor
   * 
   * @param ptrMC_ - pointer to ModelConfiguration object
   */
  ~ModelCTL();
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
  friend cifstream&    operator >>(cifstream & is, ModelCTL & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   ModelCTL & obj){obj.write(os);;return os;}
};

#endif /* MODELCTL_HPP */


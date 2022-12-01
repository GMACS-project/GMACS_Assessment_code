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
#include <map>
#include <admodel.h>
#include "../include/ModelConfiguration.hpp"

/**
 * Class defining a "multi-key" for a map with int, adstring, and adstring keys 
 */
class ParamMultiKey_IAA {
  public:
    /* factor combination */
    int fc;
    /* function name */
    adstring fcn;
    /* parameter name */
    adstring par;
    /* adstring comparator */
    gmacs::compare_strings cs;
    
    ParamMultiKey_IAA(int fc_, adstring fcn_, adstring par_){
      fc  = fc_;
      fcn = fcn_;
      par = par_;
      cs = gmacs::compare_strings();
    }  

    bool operator<(const ParamMultiKey_IAA &right) const 
    {
        if ( fc == right.fc ) {
            if ( fcn == right.fcn ) {
                return cs(par,right.par);
            } else {
                return cs(fcn,right.fcn);
            }
        } else {
            return fc < right.fc;
        }
    }    
};
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
  friend std::ostream& operator <<(std::ostream & os,   BasicParamInfo & obj){obj.write(os);return os;}
  
};
///////////////////////////////////StdParamInfo////////////////////////////
class StdParamInfo: public BasicParamInfo {
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
  friend std::ostream& operator <<(std::ostream & os,   StdParamInfo & obj){obj.write(os);return os;}
  
};
///////////////////////////////////WatZFunctionInfo////////////////////////////
class WatZFunctionInfo{
public:
  /* flag to print debugging info */
  static int debug;
  /* factor combination index */
  int fc;
  /* function name */
  adstring s_function;
  /* pointer to StdParamInfo object */
  StdParamInfo* ptrStdPI;
  
  WatZFunctionInfo(int fc_,adstring& function_);
  ~WatZFunctionInfo();
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
  friend cifstream&    operator >>(cifstream & is, WatZFunctionInfo & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   WatZFunctionInfo & obj){obj.write(os);return os;}
  
};
///////////////////////////////////FunctionsInfo////////////////////////////
class WatZFunctionsInfo{
public:
  /* flag to print debugging info */
  static int debug;
  static const adstring KEYWORD;
  /* map to WatZFunctionInfo* objects */
  std::map<ParamMultiKey_IAA,WatZFunctionInfo*> mapFIs;
  
  /** 
   * Class constructor
   */
  WatZFunctionsInfo();
  /** 
   * Class destructor
   */
  ~WatZFunctionsInfo();
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
  friend cifstream&    operator >>(cifstream & is, WatZFunctionsInfo & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   WatZFunctionsInfo & obj){obj.write(os);return os;}
  
};
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
  FactorCombination();
  
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

///////////////////////////////////WatZVectorInfo////////////////////////////
class WatZVectorInfo{
public:
  /* flag to print debugging info */
  static int debug;
  /* factor combination index */
  int fc;
  /* alias for SizeBlock defining bins for values */
  adstring alsZB;
  /* dvector */
  dvector values;
  
  WatZVectorInfo(int fc_,adstring& alsZB_);
  ~WatZVectorInfo();
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
  friend cifstream&    operator >>(cifstream & is, WatZVectorInfo & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   WatZVectorInfo & obj){obj.write(os);return os;}
  
};
///////////////////////////////////WatZVectorsInfo////////////////////////////
class WatZVectorsInfo{
public:
  /* flag to print debugging info */
  static int debug;
  static const adstring KEYWORD;
  /* map to WatZVectorInfo* objects */
  std::map<int,WatZVectorInfo*> mapVIs;
  
  /** 
   * Class constructor
   */
  WatZVectorsInfo();
  /** 
   * Class destructor
   */
  ~WatZVectorsInfo();
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
  friend cifstream&    operator >>(cifstream & is, WatZVectorsInfo & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   WatZVectorsInfo & obj){obj.write(os);return os;}
  
};
///////////////////////////////////WeightAtSize/////////////////////////////////
class WeightAtSize{
public:
  /* flag to print debugging info */
  static int debug;
  /* keyword */
  static const adstring keyword;
  /* pointer to FactorCombinations object */
  FactorCombinations* ptrFCs;
  /* number of factor combinations using the allometry type*/
  int nFunctionTypes;
  /* pointer to WatZFunctionsInfo object */
  WatZFunctionsInfo* ptrFIs;
  /* number of factor combinations using the vector type*/
  int nVectorTypes;
  /* pointer to WatZVectorsInfo object */
  WatZVectorsInfo* ptrVIs;
  
  /**
   * Class constructor
   */
  WeightAtSize();
  
  /**
   * Class destructor
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
  friend std::ostream& operator <<(std::ostream & os,   WeightAtSize & obj){obj.write(os);return os;}
};
////////////////////////////////////--ModeCTL--/////////////////////////////////
class ModelCTL{
public:
  /* flag to print debugging info */
  static int debug;
  /* ctl file version */
  static const adstring version;
  
  /* pointer to WeightAtSize object */
  WeightAtSize* ptrWatZ;
  
  /**
   * Class constructor
   */
  ModelCTL();
  
  /**
   * Class destructor
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
  friend std::ostream& operator <<(std::ostream & os,   ModelCTL & obj){obj.write(os);return os;}
};

#endif /* MODELCTL_HPP */


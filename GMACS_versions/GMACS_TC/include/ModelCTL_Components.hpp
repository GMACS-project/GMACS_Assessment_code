/* 
 * File:   ModelCTL_Components.hpp
 * Author: William Stockhausen
 *
 * Created on December 22, 2022, 3:17 PM
 */

#pragma once
#ifndef MODELCTL_COMPONENTS_HPP
#define MODELCTL_COMPONENTS_HPP

#include <map>
#include <admodel.h>
#include "ParamInfo.hpp"
#include "VarParamInfo.hpp"
#include "FixedQuantitiesInfo.hpp"
#include "ModelConfiguration.hpp"
#include "FactorCombinations.hpp"

///////////////////////////////////AllParamsInfo////////////////////////////
class AllParamsInfo{
public:
  /* flag to print debugging info */
  static int debug;
  
  /* pointer to FactorCombinations object */
  FactorCombinations* ptrFCs;
  
  /* number of factor combinations using the std param function type */
  int nParamStdFunctionTypes;
  /* pointer to StdParamFunctionsInfo object */
  ParamStdFunctionsInfo* ptrPSFIs;
  /* number of factor combinations using the param vector type */
  int nParamVectorFunctionTypes;
  /* pointer to ParamVectorsInfo object */
  ParamVectorFunctionsInfo* ptrPVFIs;
  /* number of factor combinations using the param matrix type */
  int nParamMatrixFunctionTypes;
  /* pointer to ParamMatrixsInfo object */
  ParamMatrixFunctionsInfo* ptrPMFIs;
  
  /* number of factor combinations using the fixed vector type */
  int nFixedVectorTypes;
  /* pointer to FixedVectorsInfo object */
  FixedVectorsInfo* ptrFVIs;
  /* number of factor combinations using the fixed matrix type */
  int nFixedMatrixTypes;
  /* pointer to FixedMatrixsInfo object */
  FixedMatrixsInfo* ptrFMIs;
  
  /* number of factor combinations using the var_function type */
  int nVarParamFunctionTypes;
  /* pointer to VarParamFunctionsInfo object */
  VarParamFunctionsInfo* ptrVPFIs;
  /* pointer to VarParamsVariationInfo object */
  VarParamsVariationInfo* ptrVPVIs;
    
protected:  
  /** 
   * Class constructor
   */
  AllParamsInfo();
  
public:
  /** 
   * Class destructor
   */
  virtual ~AllParamsInfo();
  /**
   * Calculate number of factor combinations
   * 
   * @return - (int) number of factor combinations
   */
  int getNumFCs();  
  /**
   * Calculate number of non-mirrored parameters
   * 
   * @return - (int) number of parameters
   */
  int calcNumParams();
  /**
   * For each parameter, set the index of the corresponding gmacs 
   * parameter, including mirrored parameters
   * 
   * @param idx - (int) the index of the last gmacs parameter (start with 0)
   * 
   * @return (int) the index associated with the last parameter in mapFIs
   */
  int setParamIndices(int idx);
  /**
   * Create a matrix with initial value, lower bound, upper bound, phase, and jitter flag 
   * for all non-mirrored parameters.
   * 
   * @return - dmatrix with initial value, lower bound, upper bound, phase, 
   * and jitter flag for all parameters
   */
  dmatrix calcILUPJs();
   /**
   * Read object from input stream in ADMB format.
   * 
   * @param is - file input stream
   */
  virtual void read(cifstream & is)=0;//=0 makes this class abstract!
  /**
   * Write object to output stream in ADMB format.
   * 
   * @param os - output stream
   */
  virtual void write(std::ostream & os)=0;//=0 makes this class abstract!
  /**
   * Operator to read from input filestream in ADMB format
   */
  friend cifstream&    operator >>(cifstream & is, AllParamsInfo & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   AllParamsInfo & obj){obj.write(os);return os;}
  
};//--AllParamsInfo

///////////////////////////////////WeightAtSize/////////////////////////////////
class WeightAtSize: public AllParamsInfo {
public:
  /* flag to print debugging info */
  static int debug;
  /* keyword */
  static const adstring KEYWORD;
  
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

///////////////////////////////////NatMort/////////////////////////////////
class NatMort{
public:
  /* flag to print debugging info */
  static int debug;
  /* keyword */
  static const adstring KEYWORD;
  
  /* pointer to FactorCombinations object */
  FactorCombinations* ptrFCs;
  /* number of factor combinations using the var_function type */
  int nFunctionTypes;
  /* pointer to VarParamFunctionsInfo object */
  VarParamFunctionsInfo* ptrVPFIs;
  /* pointer to AllVarParamsInfo object */
  VarParamsVariationInfo* ptrVPVIs;
  
  /**
   * Class constructor
   */
  NatMort();
  
  /**
   * Class destructor
   */
  ~NatMort();
  
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
  friend cifstream&    operator >>(cifstream & is, NatMort & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   NatMort & obj){obj.write(os);return os;}
};

///////////////////////////////////MoltProbability/////////////////////////////////
class MoltProbability: public AllParamsInfo {
public:
  /* flag to print debugging info */
  static int debug;
  /* keyword */
  static const adstring KEYWORD;
  
  /**
   * Class constructor
   */
  MoltProbability();
  
  /**
   * Class destructor
   */
  ~MoltProbability();
  
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
  friend cifstream&    operator >>(cifstream & is, MoltProbability & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   MoltProbability & obj){obj.write(os);return os;}
};

///////////////////////////////////MoltToMaturity///////////////////////////////
class MoltToMaturity: public AllParamsInfo{
public:
  /* flag to print debugging info */
  static int debug;
  /* keyword */
  static const adstring KEYWORD;
  /* integer flag indicating whether or not terminal molt occurs */
  int hasTM; 
  
  /**
   * Class constructor
   */
  MoltToMaturity();
  
  /**
   * Class destructor
   */
  ~MoltToMaturity();
  
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
  friend cifstream&    operator >>(cifstream & is, MoltToMaturity & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   MoltToMaturity & obj){obj.write(os);return os;}
};

///////////////////////////////////Growth/////////////////////////////////
class Growth: public AllParamsInfo{
public:
  /* flag to print debugging info */
  static int debug;
  /* keyword */
  static const adstring KEYWORD;
  
  /**
   * Class constructor
   */
  Growth();
  
  /**
   * Class destructor
   */
  ~Growth();
  
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
  friend cifstream&    operator >>(cifstream & is, Growth & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   Growth & obj){obj.write(os);return os;}
};

///////////////////////////////////AnnualRecruitment/////////////////////////////////
class AnnualRecruitment{
public:
  /* flag to print debugging info */
  static int debug;
  /* keyword */
  static const adstring KEYWORD;
  
  /* pointer to FactorCombinations object */
  FactorCombinations* ptrFCs;
  /* number of factor combinations using the var_function type */
  int nFunctionTypes;
  /* pointer to VarParamFunctionsInfo object */
  VarParamFunctionsInfo* ptrVPFIs;
  /* pointer to AllVarParamsInfo object */
  VarParamsVariationInfo* ptrVPVIs;
  
  /**
   * Class constructor
   */
  AnnualRecruitment();
  
  /**
   * Class destructor
   */
  ~AnnualRecruitment();
  
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
  friend cifstream&    operator >>(cifstream & is, AnnualRecruitment & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   AnnualRecruitment & obj){obj.write(os);return os;}
};

///////////////////////////////////RecruitmentAtSize/////////////////////////////////
class RecruitmentAtSize{
public:
  /* flag to print debugging info */
  static int debug;
  /* keyword */
  static const adstring KEYWORD;
  
  /* pointer to FactorCombinations object */
  FactorCombinations* ptrFCs;
  /* number of factor combinations using the var_function type */
  int nFunctionTypes;
  /* pointer to VarParamFunctionsInfo object */
  VarParamFunctionsInfo* ptrVPFIs;
  /* pointer to AllVarParamsInfo object */
  VarParamsVariationInfo* ptrVPVIs;
  
  /**
   * Class constructor
   */
  RecruitmentAtSize();
  
  /**
   * Class destructor
   */
  ~RecruitmentAtSize();
  
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
  friend cifstream&    operator >>(cifstream & is, RecruitmentAtSize & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   RecruitmentAtSize & obj){obj.write(os);return os;}
};


#endif /* MODELCTL_COMPONENTS_HPP */


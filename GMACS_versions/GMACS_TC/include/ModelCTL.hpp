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
#include "ModelConfiguration.hpp"
#include "FactorCombinations.hpp"
#include "ParamInfo.hpp"
#include "VarParamInfo.hpp"
#include "FixedQuantitiesInfo.hpp"

///////////////////////////////////WeightAtSize/////////////////////////////////
class WeightAtSize{
public:
  /* flag to print debugging info */
  static int debug;
  /* keyword */
  static const adstring KEYWORD;
  
  /* pointer to FactorCombinations object */
  FactorCombinations* ptrFCs;
  /* number of factor combinations using the function type */
  int nFunctionTypes;
  /* pointer to StdParamFunctionsInfo object */
  StdParamFunctionsInfo* ptrFIs;
  /* number of factor combinations using the vector type */
  int nVectorTypes;
  /* pointer to FixedVectorsInfo object */
  FixedVectorsInfo* ptrVIs;
  
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
  AllVarParamsVariationInfo* ptrVPVIs;
  
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
class MoltProbability{
public:
  /* flag to print debugging info */
  static int debug;
  /* keyword */
  static const adstring KEYWORD;
  /* pointer to FactorCombinations object */
  FactorCombinations* ptrFCs;
  /* number of factor combinations using the function type */
  int nFunctionTypes;
  /* pointer to StdParamFunctionsInfo object */
  StdParamFunctionsInfo* ptrFIs;
  /* number of factor combinations using the vector type*/
  int nVectorTypes;
  /* pointer to FixedVectorsInfo object */
  FixedVectorsInfo* ptrVIs;
  
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
class MoltToMaturity{
public:
  /* flag to print debugging info */
  static int debug;
  /* keyword */
  static const adstring KEYWORD;
  /* integer flag indicating whether or not terminal molt occurs */
  int hasTM; 
  /* pointer to FactorCombinations object */
  FactorCombinations* ptrFCs;
  /* number of factor combinations using the function type */
  int nFunctionTypes;
  /* pointer to StdParamFunctionsInfo object */
  StdParamFunctionsInfo* ptrFIs;
  /* number of factor combinations using the vector type*/
  int nVectorTypes;
  /* pointer to FixedVectorsInfo object */
  FixedVectorsInfo* ptrVIs;
  
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
class Growth{
public:
  /* flag to print debugging info */
  static int debug;
  /* keyword */
  static const adstring KEYWORD;
  /* pointer to FactorCombinations object */
  FactorCombinations* ptrFCs;
  /* number of factor combinations using the function type */
  int nFunctionTypes;
  /* pointer to StdParamFunctionsInfo object */
  StdParamFunctionsInfo* ptrFIs;
  /* number of factor combinations using the param matrix type */
  int nParamMatrixFunctionTypes;
  /* pointer to ParamMatrixsInfo object */
  ParamMatrixFunctionsInfo* ptrPMIs;
  /* number of factor combinations using the fixed matrix type */
  int nFixedMatrixTypes;
  /* pointer to FixedMatrixsInfo object */
  FixedMatrixsInfo* ptrFMIs;
  
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
  AllVarParamsVariationInfo* ptrVPVIs;
  
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
  AllVarParamsVariationInfo* ptrVPVIs;
  
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

////////////////////////////////////--ModeCTL--/////////////////////////////////
class ModelCTL{
public:
  /* flag to print debugging info */
  static int debug;
  /* ctl file version */
  static const adstring version;
  
  /* pointer to WeightAtSize object */
  WeightAtSize* ptrWatZ;
  /* pointer to NatMort object */
  NatMort* ptrNM;
  /* pointer to MoltProbability object */
  MoltProbability* ptrMP;
  /* pointer to MoltToMaturity object */
  MoltToMaturity* ptrM2M;
  /* pointer to Growth object */
  Growth* ptrGrw;
  /* pointer to AnnualRecruitment object */
  AnnualRecruitment* ptrAnnRec;
  /* pointer to RecruitmentAtSize object */
  RecruitmentAtSize* ptrRecAtZ;
  
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


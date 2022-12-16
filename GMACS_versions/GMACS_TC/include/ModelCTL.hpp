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
#include "ModelConfiguration.hpp"
#include "ParamInfo.hpp"
#include "FixedQuantitiesInfo.hpp"
#include "FactorCombinations.hpp"

///////////////////////////////////WeightAtSize/////////////////////////////////
class WeightAtSize{
public:
  /* flag to print debugging info */
  static int debug;
  /* keyword */
  static const adstring KEYWORD;
  /* pointer to FactorCombinations object */
  FactorCombinations* ptrFCs;
  /* number of factor combinations using the allometry type*/
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
///////////////////////////////////TerminalMolt/////////////////////////////////
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
////////////////////////////////////--ModeCTL--/////////////////////////////////
class ModelCTL{
public:
  /* flag to print debugging info */
  static int debug;
  /* ctl file version */
  static const adstring version;
  
  /* pointer to WeightAtSize object */
  WeightAtSize* ptrWatZ;
  /* pointer to MoltProbability object */
  MoltProbability* ptrMP;
  /* pointer to MoltToMaturity object */
  MoltToMaturity* ptrM2M;
  
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


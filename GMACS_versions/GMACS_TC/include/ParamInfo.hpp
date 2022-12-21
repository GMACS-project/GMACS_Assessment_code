/* 
 * File:   ParamInfo.hpp
 * Author: William Stockhausen
 *
 * Created on December 1, 2022, 11:15 AM
 */

#pragma once
#ifndef PARAMINFO_HPP
#define PARAMINFO_HPP
#include <map>
#include <admodel.h>
#include "ModelConfiguration.hpp"


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
  
};//--BasicParamInfo

///////////////////////////////////StdParamInfo////////////////////////////
class StdParamInfo: public BasicParamInfo {
public:
  /* flag to print debugging info */
  static int debug;
  /* parameter name */
  adstring s_param;
  /* parameter mirror index */
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
  
};//--StdParamInfo

///////////////////////////////////VectorParamInfo////////////////////////////
class VectorParamInfo: public StdParamInfo {
public:
  /* flag to print debugging info */
  static int debug;
  /* vector index name */
  adstring s_vi;
  
  VectorParamInfo();
  ~VectorParamInfo();
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
  friend cifstream&    operator >>(cifstream & is, VectorParamInfo & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   VectorParamInfo & obj){obj.write(os);return os;}
  
};//--VectorParamInfo

///////////////////////////////////MatrixParamInfo////////////////////////////
class MatrixParamInfo: public VectorParamInfo {
public:
  /* flag to print debugging info */
  static int debug;
  /* parameter name */
  adstring s_ri;
  
  MatrixParamInfo();
  ~MatrixParamInfo();
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
  friend cifstream&    operator >>(cifstream & is, MatrixParamInfo & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   MatrixParamInfo & obj){obj.write(os);return os;}
  
};//--MatrixParamInfo

///////////////////////////////////StdFunctionInfo////////////////////////////
class StdParamFunctionInfo{
public:
  /* flag to print debugging info */
  static int debug;
  /* factor combination index */
  int fc;
  /* function name */
  adstring s_function;
  /* pointer to StdParamInfo object */
  StdParamInfo* ptrPI;
  
  StdParamFunctionInfo(int fc_,adstring& function_);
  ~StdParamFunctionInfo();
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
  friend cifstream&    operator >>(cifstream & is, StdParamFunctionInfo & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   StdParamFunctionInfo & obj){obj.write(os);return os;}
  
};//--StdParamFunctionInfo

///////////////////////////////////StdParamFunctionsInfo////////////////////////////
class StdParamFunctionsInfo{
public:
  /* flag to print debugging info */
  static int debug;
  static const adstring KEYWORD;
  /* map to StdFunctionInfo* objects */
  std::map<MultiKey,StdParamFunctionInfo*> mapFIs;
  
  /** 
   * Class constructor
   */
  StdParamFunctionsInfo();
  /** 
   * Class destructor
   */
  ~StdParamFunctionsInfo();
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
  friend cifstream&    operator >>(cifstream & is, StdParamFunctionsInfo & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   StdParamFunctionsInfo & obj){obj.write(os);return os;}
  
};//--StdParamFunctionsInfo

///////////////////////////////////ParamVectorFunctionInfo////////////////////////////
class ParamVectorFunctionInfo{
public:
  /* flag to print debugging info */
  static int debug;
  /* factor combination index */
  int fc;
  /* function name */
  adstring s_function;
  /* pointer to VectorParamInfo object */
  VectorParamInfo* ptrPI;
  
  ParamVectorFunctionInfo(int fc_,adstring& function_);
  ~ParamVectorFunctionInfo();
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
  friend cifstream&    operator >>(cifstream & is, ParamVectorFunctionInfo & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   ParamVectorFunctionInfo & obj){obj.write(os);return os;}
  
};//--ParamVectorFunctionInfo

///////////////////////////////////ParamVectorFunctionsInfo////////////////////////////
class ParamVectorFunctionsInfo{
public:
  /* flag to print debugging info */
  static int debug;
  static const adstring KEYWORD;
  /* map to StdFunctionInfo* objects */
  std::map<MultiKey,ParamVectorFunctionInfo*> mapFIs;
  
  /** 
   * Class constructor
   */
  ParamVectorFunctionsInfo();
  /** 
   * Class destructor
   */
  ~ParamVectorFunctionsInfo();
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
  friend cifstream&    operator >>(cifstream & is, ParamVectorFunctionsInfo & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   ParamVectorFunctionsInfo & obj){obj.write(os);return os;}
};//--ParamVectorFunctionsInfo

///////////////////////////////////ParamMatrixFunctionInfo////////////////////////////
class ParamMatrixFunctionInfo{
public:
  /* flag to print debugging info */
  static int debug;
  /* factor combination index */
  int fc;
  /* function name */
  adstring s_function;
  /* pointer to MatrixParamInfo object */
  MatrixParamInfo* ptrPI;
  
  ParamMatrixFunctionInfo(int fc_,adstring& function_);
  ~ParamMatrixFunctionInfo();
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
  friend cifstream&    operator >>(cifstream & is, ParamMatrixFunctionInfo & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   ParamMatrixFunctionInfo & obj){obj.write(os);return os;}
  
};//--ParamMatrixFunctionInfo

///////////////////////////////////ParamMatrixFunctionsInfo////////////////////////////
class ParamMatrixFunctionsInfo{
public:
  /* flag to print debugging info */
  static int debug;
  static const adstring KEYWORD;
  /* map to StdFunctionInfo* objects */
  std::map<MultiKey,ParamMatrixFunctionInfo*> mapFIs;
  
  /** 
   * Class constructor
   */
  ParamMatrixFunctionsInfo();
  /** 
   * Class destructor
   */
  ~ParamMatrixFunctionsInfo();
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
  friend cifstream&    operator >>(cifstream & is, ParamMatrixFunctionsInfo & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   ParamMatrixFunctionsInfo & obj){obj.write(os);return os;}
  
};//--ParamMatrixFunctionsInfo
#endif /* PARAMINFO_HPP */



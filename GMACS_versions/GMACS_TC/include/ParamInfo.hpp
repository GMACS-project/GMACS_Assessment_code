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
#include "gmacs_utils.hpp"
#include "ModelConfiguration.hpp"

class MultiKey;
namespace gmacs {
  /**
   * Calculate number of non-mirrored parameters
   * 
   * @param mapFIs - (std::map<MultiKey,T>&) map of pointers to FunctionInfo objects
   * 
   * @return (int) the number of non-mirrored parameters
   */
  template <typename T>
  int calcNumParams(std::map<MultiKey,T>& mapFIs){
    int debug = 1;
    if (debug) cout<<"starting calcNumParams"<<endl;
    int n = 0;
    for (auto it=mapFIs.begin(); it!=mapFIs.end(); ++it) {
      if (debug) cout<<(it->first)<<endl;
      T p = it->second;
      if (p->ptrPI->mir==0) n++;
    }
    if (debug) cout<<"n = "<<n<<endl;
    if (debug) cout<<"finished calcNumParams"<<endl;
    return n;
  }
  /**
   * For each parameter, set the index of the corresponding gmacs 
   * parameter, including mirrored parameters
   * 
   * @param idx - (int) the index of the last gmacs parameter (start with 0)
   * @param mapFIs - (std::map<MultiKey,T>&) map of pointers to FunctionInfo objects
   * 
   * @return (int) the index associated with the last parameter in mapFIs
   */
  template <typename T>
  int setParamIndices(int idx,std::map<MultiKey,T>& mapFIs){
    int debug = 1;
    if (debug) ECHOOBJ("starting setParamIndices with idx = ",idx);
    for (auto it=mapFIs.begin(); it!=mapFIs.end(); ++it) {
      if (debug) ECHOSTR((it->first));
      T p = it->second;
      if (p->ptrPI->mir==0) {
        p->ptrPI->idx = ++idx;//increment before assigning
      } else {
        //parameter is mirrored: get idx from mirror
        int      fc  = p->ptrPI->mir;
        adstring par = p->ptrPI->s_param;
        MultiKey mk  = gmacs::asa2(fc,par);
        T m = mapFIs[mk];
        p->ptrPI->idx = m->ptrPI->idx;//idx in m should have already been filled in (otherwise need 2 loops through mapFIs)
      }
    }
    if (debug) ECHOOBJ("last = ",idx);
    if (debug) ECHOSTR("finished calcNumParams");
    return idx;
  }
  /**
   * Create a matrix with initial value, lower bound, upper bound, phase, and jitter flag 
   * for all non-mirrored parameters.
   * 
   * @param mapFIs
   * 
   * @return - dmatrix with initial value, lower bound, upper bound, phase, 
   * and jitter flag for all parameters
   */
  template <typename T>
  dmatrix calcILUPJs(std::map<MultiKey,T>& mapFIs){
    int debug = 1;
    if (debug) cout<<"starting calcILUPJs"<<endl;
    int n = gmacs::calcNumParams<T>(mapFIs);
    dmatrix mat(1,n,1,5); int ctr = 0;
    for (auto it=mapFIs.begin(); it!=mapFIs.end(); ++it) {
      if (debug) cout<<(it->first)<<endl;
      T p = it->second;
      if (p->ptrPI->mir==0) {
        ctr++;
        mat(ctr,1) = p->ptrPI->init_val;
        mat(ctr,2) = p->ptrPI->lwr_bnd;
        mat(ctr,3) = p->ptrPI->upr_bnd;
        mat(ctr,4) = p->ptrPI->phase;
        mat(ctr,5) = p->ptrPI->jitter;
      }
    }
    if (debug) cout<<"mat = "<<endl<<mat<<endl;
    if (debug) cout<<"finished calcILUPJs"<<endl;
    return mat;
  }
}//--gmacs namespace
///////////////////////////////////BasicParamInfo////////////////////////////
class ParamBasicInfo{
public:
  /* flag to print debugging info */
  static int debug;
  /* mirror index */
  int mir;
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
  /* index into gmacs parameter vector */
  int pv_idx;
  
  ParamBasicInfo();
  ~ParamBasicInfo();
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
  friend cifstream&    operator >>(cifstream & is, ParamBasicInfo & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   ParamBasicInfo & obj){obj.write(os);return os;}
  
};//--BasicParamInfo

///////////////////////////////////StdParamInfo////////////////////////////
class ParamStdInfo: public ParamBasicInfo {
public:
  /* flag to print debugging info */
  static int debug;
  /* parameter name */
  adstring s_param;
  
  ParamStdInfo();
  ~ParamStdInfo();
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
  friend cifstream&    operator >>(cifstream & is, ParamStdInfo & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   ParamStdInfo & obj){obj.write(os);return os;}
  
};//--StdParamInfo

///////////////////////////////////VectorParamInfo////////////////////////////
class ParamVectorInfo: public ParamBasicInfo {
public:
  /* flag to print debugging info */
  static int debug;
  /* parameter name */
  adstring s_param;
  /* vector index name */
  adstring s_vi;
  
  ParamVectorInfo();
  ~ParamVectorInfo();
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
  friend cifstream&    operator >>(cifstream & is, ParamVectorInfo & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   ParamVectorInfo & obj){obj.write(os);return os;}
  
};//--VectorParamInfo

///////////////////////////////////MatrixParamInfo////////////////////////////
class ParamMatrixInfo: public ParamBasicInfo {
public:
  /* flag to print debugging info */
  static int debug;
  /* parameter name */
  adstring s_param;
  /* row index name */
  adstring s_ri;
  /* col index name */
  adstring s_ci;
  
  ParamMatrixInfo();
  ~ParamMatrixInfo();
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
  friend cifstream&    operator >>(cifstream & is, ParamMatrixInfo & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   ParamMatrixInfo & obj){obj.write(os);return os;}
  
};//--MatrixParamInfo

///////////////////////////////////StdFunctionInfo////////////////////////////
class ParamStdFunctionInfo{
public:
  /* flag to print debugging info */
  static int debug;
  /* factor combination index */
  int fc;
  /* pointer to StdParamInfo object */
  ParamStdInfo* ptrPI;
  
  ParamStdFunctionInfo(int fc_);
  ~ParamStdFunctionInfo();
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
  friend cifstream&    operator >>(cifstream & is, ParamStdFunctionInfo & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   ParamStdFunctionInfo & obj){obj.write(os);return os;}
  
};//--StdParamFunctionInfo

///////////////////////////////////StdParamFunctionsInfo////////////////////////////
class ParamStdFunctionsInfo{
public:
  /* flag to print debugging info */
  static int debug;
  static const adstring KEYWORD;
  /* map to StdFunctionInfo* objects */
  std::map<MultiKey,ParamStdFunctionInfo*> mapFIs;
  
  /** 
   * Class constructor
   */
  ParamStdFunctionsInfo();
  /** 
   * Class destructor
   */
  ~ParamStdFunctionsInfo();
  /**
   * Calculate number of parameters
   * 
   * @return - (int) number of parameters
   */
  int calcNumParams();
  /**
   * Create a matrix with initial value, lower bound, upper bound, phase, and jitter flag 
   * for all parameters.
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
  friend cifstream&    operator >>(cifstream & is, ParamStdFunctionsInfo & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   ParamStdFunctionsInfo & obj){obj.write(os);return os;}
  
};//--StdParamFunctionsInfo

///////////////////////////////////ParamVectorFunctionInfo////////////////////////////
class ParamVectorFunctionInfo{
public:
  /* flag to print debugging info */
  static int debug;
  /* factor combination index */
  int fc;
  /* pointer to VectorParamInfo object */
  ParamVectorInfo* ptrPI;
  
  /**
   * Class constructor
   * 
   * @param fc_ - (int) factor combination
   * @param function_ - (adstring) function to be used
   */
  ParamVectorFunctionInfo(int fc_);
  /**
   * Class destructor
   */
  ~ParamVectorFunctionInfo();
  /**
   * Calculate number of parameters
   * 
   * @return - (int) number of parameters
   */
  int calcNumParams();
  /**
   * Create a matrix with initial value, lower bound, upper bound, phase, and jitter flag 
   * for all parameters.
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
   * Calculate number of parameters
   * 
   * @return - (int) number of parameters
   */
  int calcNumParams();
  /**
   * Create a matrix with initial value, lower bound, upper bound, phase, and jitter flag 
   * for all parameters.
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
  /* pointer to MatrixParamInfo object */
  ParamMatrixInfo* ptrPI;
  
  /**
   * Class constructor
   * 
   * @param fc_ - (int) factor combination id
   * @param function_ - (adstring) name of function to be used
   */
  ParamMatrixFunctionInfo(int fc_);
  /**
   * Class destructor
   */
  ~ParamMatrixFunctionInfo();
  /**
   * Calculate number of parameters
   * 
   * @return - (int) number of parameters
   */
  int calcNumParams();
  /**
   * Create a matrix with initial value, lower bound, upper bound, phase, and jitter flag 
   * for all parameters.
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
   * Calculate number of parameters
   * 
   * @return - (int) number of parameters
   */
  int calcNumParams();
  /**
   * Create a matrix with initial value, lower bound, upper bound, phase, and jitter flag 
   * for all parameters.
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



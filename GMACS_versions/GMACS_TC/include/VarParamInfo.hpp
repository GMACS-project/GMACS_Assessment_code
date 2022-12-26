/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/cppFiles/file.h to edit this template
 */

/* 
 * File:   VarParamInfo.hpp
 * Author: williamstockhausen
 *
 * Created on December 20, 2022, 5:44 AM
 */

#pragma once
#ifndef VARPARAMINFO_HPP
#define VARPARAMINFO_HPP
#include <map>
#include <admodel.h>
#include "ModelConfiguration.hpp"

///////////////////////////////////BasicVarParamInfo////////////////////////////
class BasicVarParamInfo{
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
  /* index into gmacs parameter vector */
  int idx;
  
  BasicVarParamInfo();
  ~BasicVarParamInfo();
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
  friend cifstream&    operator >>(cifstream & is, BasicVarParamInfo & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   BasicVarParamInfo & obj){obj.write(os);return os;}
  
};//--BasicVarParamInfo

///////////////////////////////////VarPAramFunctionInfo////////////////////////////
class VarParamFunctionInfo: BasicVarParamInfo {
public:
  /* flag to print debugging info */
  static int debug;
  /* factor combination index */
  int fc;
  /* parameter name */
  adstring s_param;
  /* id of mirror for parameter */
  int mir;
  /* id for regional variation */
  adstring s_RV;
  /* id for temporal variation */
  adstring s_TV;
  /* id for size variation */
  adstring s_ZV;
  /* number of environmental covariates */
  int nECs;
  /* environmental covariate names */
  adstring_array sa_ECs;
  
  VarParamFunctionInfo(int fc_,adstring& param_);
  ~VarParamFunctionInfo();
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
  friend cifstream&    operator >>(cifstream & is, VarParamFunctionInfo & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   VarParamFunctionInfo & obj){obj.write(os);return os;}
  
};//--VarParamFunctionInfo

///////////////////////////////////VarParamFunctionsInfo////////////////////////////
class VarParamFunctionsInfo{
public:
  /* flag to print debugging info */
  static int debug;
  /* key word identifying start of input for this class*/
  static const adstring KEYWORD;
  /* map to VarFunctionInfo* objects */
  std::map<MultiKey,VarParamFunctionInfo*> mapFIs;
  
  /** 
   * Class constructor
   */
  VarParamFunctionsInfo();
  /** 
   * Class destructor
   */
  ~VarParamFunctionsInfo();
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
  friend cifstream&    operator >>(cifstream & is, VarParamFunctionsInfo & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   VarParamFunctionsInfo & obj){obj.write(os);return os;}
  
};//--VarParamFunctionsInfo

///////////////////////////////////VarParamTypeInfo////////////////////////////
class VarParamTypeInfo {
public:
  /* flag to print debugging info */
  static int debug;
  
  int var_id;
  adstring s_param;
  adstring s_var_type;
  adstring constraint;
  double value;
  
  /**
   * Class constructor
   * 
   * @param id_ - variation id
   * @param param_ - parameter name
   */
  VarParamTypeInfo(int id_,adstring param_);
  /** 
   * Class destructor
   */
  ~VarParamTypeInfo();
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
  friend cifstream&    operator >>(cifstream & is, VarParamTypeInfo & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   VarParamTypeInfo & obj){obj.write(os);return os;}
  
};//--VarParamTypeInfo

///////////////////////////////////VarParamTypesInfo////////////////////////////
class VarParamTypesInfo{
public:
  /* flag to print debugging info */
  static int debug;
  
  /* variation type */
  adstring type;
  /* map to VarParamInfo* objects */
  std::map<MultiKey,VarParamTypeInfo*> mapPTIs;
  
  /** 
   * Class constructor
   */
  VarParamTypesInfo(adstring& type_);
  /** 
   * Class destructor
   */
  ~VarParamTypesInfo();
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
  friend cifstream&    operator >>(cifstream & is, VarParamTypesInfo & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   VarParamTypesInfo & obj){obj.write(os);return os;}
  
};//--VarParamTypesInfo

///////////////////////////////////VarParamInfo////////////////////////////
class VarParamInfo: public BasicVarParamInfo {
public:
  /* flag to print debugging info */
  static int debug;
  
  /* id associated with variable parameter */
  int var_id;
  /* parameter name */
  adstring s_param;
  /* value of index */
  adstring s_var_idx;
  
  /**
   * Class constructor
   * 
   * @param id_ - variation id
   * @param s_param - parameter name
   * @param var_idx_ - variation index value
   */
  VarParamInfo(int id_,adstring& param_,adstring& var_idx_);
  /**
   * Class destructor
   */
  ~VarParamInfo();
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
  friend cifstream& operator >>(cifstream & is, VarParamInfo & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os, VarParamInfo & obj){obj.write(os);return os;}
  
};//--VarParamInfo

///////////////////////////////////VarParamsInfo////////////////////////////
class VarParamsInfo{
public:
  /* flag to print debugging info */
  static int debug;
  
  /* variation type */
  adstring type;
  /* map to VarParamInfo* objects */
  std::map<MultiKey,VarParamInfo*> mapPIs;
  
  /**
   * Class constructor
   * @param type_ - variation type
   */
  VarParamsInfo(adstring& type_);
  /** 
   * Class destructor
   */
  ~VarParamsInfo();
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
  friend cifstream& operator >>(cifstream & is, VarParamsInfo & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os, VarParamsInfo & obj){obj.write(os);return os;}
  
};//--VarParamsInfo

//////////////////////////////VarParamsCombinedInfo//////////////////////////
class VarParamsCombinedInfo{
public:
  /* flag to print debugging info */
  static int debug;
  /* key word identifying start of input for this class*/
  static const adstring KEYWORD;
  /* label for instance */
  adstring label;
  /* pointer to VarParamTypesInfo object */
  VarParamTypesInfo* ptrPTIs;
  /* pointer to VarParamsInfo object */
  VarParamsInfo* ptrPIs;
  
  /** 
   * Class constructor
   */
 VarParamsCombinedInfo(adstring& label_);
  /** 
   * Class destructor
   */
  ~VarParamsCombinedInfo();
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
  friend cifstream&    operator >>(cifstream & is, VarParamsCombinedInfo & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   VarParamsCombinedInfo & obj){obj.write(os);return os;}
  
};//--VarParamsCombinedInfo

//////////////////////////////VarParamsVariationInfo//////////////////////////
class VarParamsVariationInfo{
public:
  /* flag to print debugging info */
  static int debug;
  /* key word identifying start of input for this class*/
  static const adstring KEYWORD;
  /* pointer to object with combined parameter information for regional variation */
  VarParamsCombinedInfo* ptrRVs;
  /* pointer to object with combined parameter information for temporal variation */
  VarParamsCombinedInfo* ptrTVs;
  /* pointer to object with combined parameter information for size variation */
  VarParamsCombinedInfo* ptrZVs;
  /* pointer to object with combined parameter information for variation with an environmental covariate */
  VarParamsCombinedInfo* ptrECs;
  
  /** 
   * Class constructor
   */
  VarParamsVariationInfo();
  /** 
   * Class destructor
   */
  ~VarParamsVariationInfo();
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
  friend cifstream&    operator >>(cifstream & is, VarParamsVariationInfo & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   VarParamsVariationInfo & obj){obj.write(os);return os;}
  
};//--VarParamsVariationInfo


#endif /* VARPARAMINFO_HPP */


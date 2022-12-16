/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/cppFiles/file.h to edit this template
 */

/* 
 * File:   FixedQuantitiesInfo.hpp
 * Author: williamstockhausen
 *
 * Created on December 1, 2022, 11:40 AM
 */

#pragma once
#ifndef FIXEDQUANTITIESINFO_HPP
#define FIXEDQUANTITIESINFO_HPP

#include <map>
#include <admodel.h>
#include "gmacs_utils.hpp"
#include "IndexBlocks.hpp"
#include "ModelConfiguration.hpp"

///////////////////////////////////FixedVectorInfo////////////////////////////
class FixedVectorInfo{
public:
  /* flag to print debugging info */
  static int debug;
  /* factor combination index */
  int fc;
  /* alias for SizeBlock defining bins for values */
  adstring alsZB;
  /* dvector */
  dvector values;
  
  FixedVectorInfo(int fc_,adstring& alsZB_);
  ~FixedVectorInfo();
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
  friend cifstream&    operator >>(cifstream & is, FixedVectorInfo & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   FixedVectorInfo & obj){obj.write(os);return os;}
  
};
///////////////////////////////////FixedVectorsInfo////////////////////////////
class FixedVectorsInfo{
public:
  /* flag to print debugging info */
  static int debug;
  static const adstring KEYWORD;
  /* map to WatZVectorInfo* objects */
  std::map<int,FixedVectorInfo*> mapVIs;
  
  /** 
   * Class constructor
   */
  FixedVectorsInfo();
  /** 
   * Class destructor
   */
  ~FixedVectorsInfo();
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
  friend cifstream&    operator >>(cifstream & is, FixedVectorsInfo & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   FixedVectorsInfo & obj){obj.write(os);return os;}
  
};

///////////////////////////////////FixedMatrixInfo////////////////////////////
class FixedMatrixInfo{
public:
  /* flag to print debugging info */
  static int debug;
  /* factor combination index */
  int fc;
  /* size bin midpoint corresponding to the matrix row */
  double zB;
  /* alias for SizeBlock defining bins for values */
  adstring alsZB;
  /* dvector */
  dvector values;
  
  FixedMatrixInfo(int fc_,double zB_,adstring& alsZB_);
  ~FixedMatrixInfo();
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
  friend cifstream&    operator >>(cifstream & is, FixedMatrixInfo & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   FixedMatrixInfo & obj){obj.write(os);return os;}
  
};
///////////////////////////////////FixedMatrixsInfo////////////////////////////
class FixedMatrixsInfo{
public:
  /* flag to print debugging info */
  static int debug;
  static const adstring KEYWORD;
  /* map to WatZVectorInfo* objects */
  std::map<int,FixedMatrixInfo*> mapMIs;
  
  /** 
   * Class constructor
   */
  FixedMatrixsInfo();
  /** 
   * Class destructor
   */
  ~FixedMatrixsInfo();
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
  friend cifstream&    operator >>(cifstream & is, FixedMatrixsInfo & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   FixedMatrixsInfo & obj){obj.write(os);return os;}
  
};

#endif /* FIXEDQUANTITIESINFO_HPP */


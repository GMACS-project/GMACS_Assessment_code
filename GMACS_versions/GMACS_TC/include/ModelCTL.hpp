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

class FactorCombination{
public:
  static int debug;
  /* number of factor combinations */
  int id;
  
  FactorCombination();
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


class FactorCombinations{
public:
  static int debug;
  /* number of factor combinations */
  int nFCs;
  
  FactorCombinations();
  ~FactorCombinations();
  
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

class WeightAtSize{
public:
  
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

class ModelCTL{
public:
  static const adstring version = "2022.11.23";
  
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


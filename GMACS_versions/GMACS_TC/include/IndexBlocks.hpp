/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/cppFiles/file.h to edit this template
 */

/* 
 * File:   IndexBlocks.hpp
 * Author: williamstockhausen
 *
 * Created on November 22, 2022, 8:32 AM
 */

#pragma once
#ifndef INDEXBLOCKS_HPP
#define INDEXBLOCKS_HPP
#include <admodel.h>

namespace gmacs{
  /**
   * Convert adstring to double value
   * 
   * _str - adstring to convert to double value
   */
  double str_to_dbl(const adstring & _str);
  /**
   * Convert double to string value
   * 
   * _dbl - double to convert to double value
   */
  adstring dbl_to_str(const double & _dbl);
  /**
   * Parse an integer range string
   * 
   * @param str - adstring representing the range
   * @param dummy - integer value provided to allow function overloading
   * @return - ivector representing the range
   * 
   * @details The input adstring should have the form "x:y" or "x",
   * where x and y represent the min and max values for the range or, in 
   * the latter case, where x represents the single (degenerate) value of
   * the range.
   */
  ivector parseRangeStr(adstring& str,int dummy);
  /**
   * Parse an integer range string
   * 
   * @param str - adstring representing the range
   * @param dummy - double value provided to allow function overloading
   * @return - ivector representing the range
   * 
   * @details The input adstring should have the form "x:y" or "x",
   * where x and y represent the min and max values for the range or, in 
   * the latter case, where x represents the single (degenerate) value of
   * the range.
   */
  dvector parseRangeStr(adstring& str, double dummy);
  /**
   * Determine index range corresponding to an input string, 
   * based upon an integer-based dimension
   * 
   * @param str - adstring representing the range
   * @param dmv - ivector summarizing the model dimension (mdv: model dimension vector)
   * @return - ivector. See @details
   * 
   * @details If str is of the form "x:y", (x and y integers) a 2-element ivector indicating the 
   *          min and max indices in mdv corresponding to the range x to y is returned. 
   *          If str is of the form "x", a 1-element ivector indicating the index of the value
   *          of x is returned. In the special case where str is of the form "x:y" and 
   *          x is -1, then the minimum index is set equal to mdv.indexmin(). If y is -1,
   *          then the maximum index is set equal to mdv.indexmax(). In the case where str
   *          is of the form "x" and x is -1, the returned ivector is -1 (whether to assign 
   *          it to the min or max index is undetermined).
   */
  ivector parseIndexRange(adstring str,ivector& mdv,int debug=0,ostream& cout=std::cout);
  
  /**
   * Determine index range corresponding to an input string, 
   * based upon a decimal-based dimension
   * 
   * @param str - adstring representing the range
   * @param mdv - dvector providing cutpoints for the model dimension (mdv: model dimension vector)
   * @return - ivector. See @details
   * 
   * @details If str is of the form "x:y", (x and y integers) a 2-element ivector indicating the 
   *          min and max indices in mdv corresponding to the range x to y is returned. 
   *          If str is of the form "x", a 1-element ivector indicating the index of the value
   *          of x is returned. In the special case where str is of the form "x:y" and 
   *          x is -1, then the minimum index is set equal to mdv.indexmin(). If y is -1,
   *          then the maximum index is set equal to mdv.indexmax(). In the case where str
   *          is of the form "x" and x is -1, the returned ivector is -1 (whether to assign 
   *          it to the min or max index is undetermined).
   */
  ivector parseIndexRange(adstring str,dvector& mdv,int debug=0,ostream& cout=std::cout);
  ivector parseIndexBlock(adstring str,ivector& mdv,int debug=0,ostream& cout=std::cout);
  ivector parseIndexBlock(adstring str,dvector& mdv,int debug=0,ostream& cout=std::cout);
  adstring toIndexBlockString(ivector& iv,ivector& mdv,int debug=0,ostream& cout=std::cout);
  adstring toIndexBlockString(ivector& iv,dvector& mdv,int debug=0,ostream& cout=std::cout);
}

template <typename Tdim, typename Tval> class IndexBlock{
  public:
    static int debug;
    Tdim mdv;
    ivector iv;
    IndexBlock(Tdim& dimVec){mdv = dimVec;}
    ~IndexBlock(){}
    ivector getIndexVector(){return iv;}
    Tdim getValues(){return mdv(iv);}
    Tval getValue(int i){return mdv[iv[i]];}
    void parseString(adstring& str){
      if (debug) cout<<"starting IndexBlock::parseString()"<<endl;
      if (iv.allocated()) iv.deallocate();
      iv = gmacs::parseIndexBlock(str,mdv);
      if (debug) cout<<"finished IndexBlock::parseString()"<<endl;
    }
    void read(cifstream & is){
      if (debug) cout<<"starting IndexBlock::read()"<<endl;
      adstring str;
      is>>str;
      iv = gmacs::parseIndexBlock(str,mdv);
      if (debug) cout<<"finished IndexBlock::read()"<<endl;
    }
    void write(ostream & os){
      if (debug) cout<<"starting IndexBlock::write()"<<endl;
      os<<gmacs::toIndexBlockString(iv,mdv);
      if (debug) cout<<"finished IndexBlock::write()"<<endl;
    }
    friend cifstream&    operator >>(cifstream & is,   IndexBlock & obj){obj.read(is); return is;}
    friend std::ostream& operator <<(std::ostream & os,IndexBlock & obj){obj.write(os);return os;}
};

//--static definitions for templates
template<typename Tdim,typename Tval> 
int IndexBlock<Tdim,Tval>::debug = 0;

////////////////////////////////////--TimeBlock--///////////////////////////////
class TimeBlock{
public:
  /* model time dimension vector */
  ivector modDim;
  /* block id */
  int id;
  /* block alias */
  adstring alias;
  /* string defining block */
  adstring indxBlkStr;
  /* block description */
  adstring description;
  /* pointer to the IndexBlock defining this block */
  IndexBlock<ivector,int>* pIB;
  /**
   * Class constructor
   * 
   * @dimTime - model time dimension ivector
   */
  TimeBlock(ivector dimTime);
  /** 
   * Class destructor
   */
  ~TimeBlock();  
  void setID(int id_){id=id_;}
  void setAlias(adstring str){alias=str;}
  void setIndexBlockString(adstring str);
  void setDescription(adstring str){description=str;}
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
  friend cifstream&    operator >>(cifstream & is, TimeBlock & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   TimeBlock & obj){obj.write(os);;return os;}
};//--TimeBlock

////////////////////////////////////--TimeBlocks--//////////////////////////////
class TimeBlocks{
public:
  /* keyword for input/output*/
  static adstring KEYWORD;
  /* flag to print debugging info */
  static int debug;
  /* model time dimension vector */
  ivector modDim;
  /* number of time blocks */
  int nBs;
  /* map from aliases to pointers to TimeBlocks */
  std::map<const char*, TimeBlock*> mapAtoBs;
  /**
   * Class constructor
   * 
   * @param dimTime - (ivector) 0-based model dimension for model years
   */
  TimeBlocks(ivector dimTime);
  /** 
   * Class destructor
   */
  ~TimeBlocks();
  
  /**
   * Return pointer to TimeBlock identified by alias_
   * @param alias_ - adstring used to identify TimeBlock
   * @return pointer to TimeBlock (or nullptr)
   */
  TimeBlock* getBlock(adstring& alias_){return mapAtoBs[alias_];}
  
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
  friend cifstream&    operator >>(cifstream & is, TimeBlocks & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   TimeBlocks & obj){obj.write(os);;return os;}
};//--TimeBlocks
////////////////////////////////////--SizeBlock--///////////////////////////////
class SizeBlock{
public:
  /* model size dimension vector */
  dvector modDim;
  /* block id */
  int id;
  /* block alias */
  adstring alias;
  /* string defining block */
  adstring indxBlkStr;
  /* block description */
  adstring description;
  /* pointer to the IndexBlock defining this block */
  IndexBlock<dvector,double>* pIB;
  /**
   * Class constructor
   * 
   * @dimSize - model size cutpoints dimension dvector
   */
  SizeBlock(dvector dimTime);
  /** 
   * Class destructor
   */
  ~SizeBlock();  
  void setID(int id_){id=id_;}
  void setAlias(adstring alias_){alias=alias_;}
  void setIndexBlockString(adstring str);
  void setDescription(adstring str){description=str;}
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
  friend cifstream&    operator >>(cifstream & is, SizeBlock & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   SizeBlock & obj){obj.write(os);;return os;}
};//--SizeBlock
////////////////////////////////////--SizeBlocks--//////////////////////////////
class SizeBlocks{
public:
  /* keyword for input/output*/
  static adstring KEYWORD;
  /* flag to print debugging info */
  static int debug;
  /* model time dimension vector */
  dvector modDim;
  /* number of time blocks */
  int nBs;
  /* map of aliases to SizeBlocks */
  std::map<const char*, SizeBlock*> mapAtoBs;
  /**
   * Class constructor
   * 
   * @param dimSize - (ivector) 0-based model dimension for model years
   */
  SizeBlocks(ivector dimSize);
  /** 
   * Class destructor
   */
  ~SizeBlocks();
  
  /**
   * Return pointer to SizeBlock identified by alias_
   * @param alias_ - adstring used to identify SizeBlock
   * @return pointer to SizeBlock (or nullptr)
   */
  SizeBlock* getBlock(adstring& alias_){return mapAtoBs[alias_];}
  
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
  friend cifstream&    operator >>(cifstream & is, SizeBlocks & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   SizeBlocks & obj){obj.write(os);;return os;}
};//--SizeBlocks


#endif /* INDEXBLOCKS_HPP */


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
#include "ModelCTL_Components.hpp"

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
   * Calculate number of parameters
   * 
   * @return - (int) number of parameters
   */
  int calcNumParams();
  /**
   * For each parameter, set the index of the corresponding gmacs 
   * parameter, including mirrored parameters
   * 
   * @return (int) the index associated with the last parameter
   * 
   * @details The returned value should be equal to the number of 
   * non-mirrored parameters.
   */
  int setParamIndices();
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
  friend cifstream&    operator >>(cifstream & is, ModelCTL & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os,   ModelCTL & obj){obj.write(os);return os;}
  
private:
  /**
   * Utility function to copy matrix of initial value, lower bound, upper bound, phase, 
   * and jitter flag for all parameters in an object to a summary matrix
   * 
   * @param ctr - row counter for summary matrix
   * @param ptr - pointer to object to extract ILUJPs matrix from
   * @param dm - matrix to copy the extracted matrix into
   * 
   * @return - (int) the last row of dm written to
   */
  int extractILUPJs(int ctr,AllParamsInfo* ptr,dmatrix& dm);
};

#endif /* MODELCTL_HPP */


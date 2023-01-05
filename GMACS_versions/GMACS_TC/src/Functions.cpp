/*
 * Functions.cpp
 * @author William Stockhausen
 */

#include "../include/gmacs_utils.hpp"
#include "../include/Functions.hpp"

/**
 * Calculate a mean post-molt size given a pre-molt size
 * 
 * @param vars - pre-molt size
 * @param params - {grA,grB} 
 * @return - dvariable with mean post-molt size
 * 
 * @details Post-molt sizes are calculated using
 *   mnZs = mfexp(grA+grB*log(zBs));
 * where 
 *   grA - ln-scale mean post-molt size intercept
 *   grB - ln-scale mean post-molt size slope
 *   zB  - pre-molt size
 */
dvariable gmacs::fcn_MnPMZ1(const dvar_vector& vars,const dvar_vector& params){
  RETURN_ARRAYS_INCREMENT();
  dvariable mnZ = mfexp(params(1)+params(2)*log(vars(1)));
  RETURN_ARRAYS_DECREMENT();
  return mnZ;
}
/**
 * Calculate a mean post-molt size given a pre-molt size
 * 
 * @param vars - dvariable with pre-molt size
 * @param params - {grA,zA,grB,zB}  (zA and zB are fixed)
 * @return - dvariable with mean post-molt size
 * 
 * @details Post-molt sizes are calculated using
 *   mnZ = grA*mfexp(log(grB/grA)/log(zGrB/zGrA)*log(zB/zGrA));
 * where 
 *   grA - mean post-molt size at pre-molt size zA
 *   grB - mean post-molt size at pre-molt size zB
 *   zB  - pre-molt size
 */
dvariable gmacs::fcn_MnPMZ2(const dvar_vector& vars,const dvar_vector& params){
  RETURN_ARRAYS_INCREMENT();
  dvariable mnZ = params(1)*mfexp(log(params(3)/params(1))/log(params(4)/params(2))*log(vars(1)/params(2)));
  RETURN_ARRAYS_DECREMENT();
  return mnZ;
}
/**
 * Calculate a vector of mean post-molt sizes given pre-molt sizes
 * 
 * @param vars - dvar_vector of pre-molt sizes
 * @param params - {grA,grB}  (zA and zB are fixed)
 * @return - vector of mean post-molt sizes
 * 
 * @details Post-molt sizes are calculated using
 *   mnZs = mfexp(grA+grB*log(zBs));
 * where 
 *   grA - ln-scale mean post-molt size intercept
 *   grB - ln-scale mean post-molt size slope
 *   zBs - vector of pre-molt sizes
 */
dvar_vector gmacs::vecfcn_MnPMZ1(const dvar_vector& vars,const dvar_vector& params){
  RETURN_ARRAYS_INCREMENT();
  dvar_vector mnZs = mfexp(params(1)+params(2)*log(vars));
  RETURN_ARRAYS_DECREMENT();
  return mnZs;
}
/**
 * Calculate a vector of mean post-molt sizes given pre-molt sizes
 * 
 * @param vars - dvar_vector of pre-molt sizes
 * @param params - {grA,zA,grB,zB} (
 * @return - vector of mean post-molt sizes
 * 
 * @details Post-molt sizes are calculated using
 *   mnZs = grA*mfexp(log(grB/grA)/log(zGrB/zGrA)*log(zBs/zGrA));
 * where 
 *   grA - mean post-molt size at pre-molt size zA
 *   grB - mean post-molt size at pre-molt size zB
 *   zBs - vector of pre-molt sizes
 */
dvar_vector gmacs::vecfcn_MnPMZ2(const dvar_vector& vars,const dvar_vector& params){
  RETURN_ARRAYS_INCREMENT();
  dvar_vector mnZs = params(1)*mfexp(log(params(3)/params(1))/log(params(4)/params(2))*log(vars/params(2)));
  RETURN_ARRAYS_DECREMENT();
  return mnZs;
}

/**
 * Return a pointer to a scalar function.
 * 
 * @param name - name of scalar function
 * @return - pointer to the function
 */
FcnPtr* Function::getFcnPtr(adstring name){
  adstring n = name.to_lower();
  if ((n==CONSTANT)||(n==NONE)||(n==FLAT)) {
    return gmacs::fcn_constant;
  } else 
  if (n==ALLOMETRY) {
    return gmacs::fcn_allometry;
  } else 
  if (n==MnPMZ1) {
    return gmacs::fcn_MnPMZ1;
  } else 
  if (n==MnPMZ2) {
    return gmacs::fcn_MnPMZ2;
  } else {
    adstring str = "Error in Function::getFcnPtr. '"+name+"' not recognized";
    ECHOSTR(str);
  }
  return nullptr;
}

/**
 * Return a pointer to a vector function.
 * 
 * @param name - name of vector function
 * @return - pointer to the function
 */
VecFcnPtr* Function::getVectorFcnPtr(adstring name){
  if (name.to_lower()==CONSTANT) {
    return gmacs::vecfcn_constant;
  } else 
  if (name.to_lower()==ALLOMETRY) {
    return gmacs::vecfcn_allometry;
  } else 
  if (name.to_lower()==MnPMZ1) {
    return gmacs::vecfcn_MnPMZ1;
  } else 
  if (name.to_lower()==MnPMZ2) {
    return gmacs::vecfcn_MnPMZ2;
  } else {
    adstring str = "Error in Function::getVectorFcnPtr. '"+name+"' not recognized";
    ECHOSTR(str);
  }
  return nullptr;
}

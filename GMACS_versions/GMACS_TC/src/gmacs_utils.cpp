/**
* macros.cpp
*/

#include <cstring>
#include <admodel.h>
#include "../include/gmacs_utils.hpp"

std::ofstream echo::out("Echo.dat",std::ios::trunc);

/**
 * Check to see that string is "TRUE"
 * @param str - adstring to test
 * @return 1 if TRUE, 0 if not
 * 
 * @details The test does not depend on the case of the input string. 
 * Will also return 1 if ::atoi(str) evaluates to an integer that != 0.
 */
int gmacs::isTrue(const adstring& str_){
  adstring str=""+str_;
  if ((to_upper(str)==adstring("TRUE"))||(::atoi(str)!=0)) return 1;
  return 0;
}

/**
 * Convert int to "TRUE" or "FALSE"
 * @param i - int to convert
 * @return "FALSE" if i==0, "TRUE" otherwise
 * 
 * @details The test does not depend on the case of the input string. 
 * Will also return 1 if ::atoi(str) evaluates to an integer that != 0.
 */
adstring gmacs::isTrue(int i){if (i) return "TRUE"; return "FALSE";}
  
/**
 * Check that a string equals a keyword
 * 
 * @param str_ - string (adstring) to be tested against keyword
 * @param kw_ - keyword (adstring)
 * @param mess - message (adstring) to be included as "Error in mess\\n"
 * @return int (program exits if the string does not equal the keyword)
 */
int gmacs::checkKeyWord(const adstring& str_,const adstring& kw_,const adstring& mess){
  adstring str = adstring("")+str_;
  adstring kw  = adstring("")+kw_;
  if (to_upper(str)!=to_upper(kw)){
      adstring strp = "Error in "+mess+"\n";
      strp += "Expected keyword '"+kw_ +"' but got '"+str_+"'.\n";
      strp += "Please fix!\n";
      ECHOSTR(strp);
      exit(-1);
  }
  return 1;
}

/**
 * Determine ordering of two (convertible to) adstring objects
 * 
 * @param lhs - "lefthand side" of comparison
 * @param rhs - "righthand side" of comparison
 * @return -1 if lhs< rhs, 0 if lhs==rhs, and 1 if lhs> rhs
 * 
 * @details Also works with const char* inputs.
 * 
 * @usage (pseudocode)\n
 *   gmacs::compare_strings cs();//instantiate struct
 *   int res = cs(lhs,rhs);      //make comparison
 *   //do something with res
 */
bool gmacs::compare_strings::operator()(const adstring& lhs, const adstring& rhs) const {
  int res = strcmp(lhs,rhs);
  return (res<0);
}

/**
 * Get the midpoints of a vector of cutpoints as a dvector
 * 
 * @param cutpts - dvector of "bin" cutpoints
 * @return - dvector of midpoints
 * 
 * @details The returned vector will have the same minimum index as cutpts.
 */
dvector gmacs::getMidpoints(const dvector& _cutpts) {
  ADUNCONST(dvector,cutpts);
  // cout<<"cutpts imin = "<<cutpts.indexmin()<<". imax = "<<cutpts.indexmax()<<endl;
  dvector midpts(cutpts.indexmin(),cutpts.indexmax()-1);
  // cout<<"midpts imin = "<<midpts.indexmin()<<". imax = "<<midpts.indexmax()<<endl;
  midpts = 0.5*(cutpts(cutpts.indexmin()+1,cutpts.indexmax()).shift(cutpts.indexmin())+
                cutpts(cutpts.indexmin(),  cutpts.indexmax()-1));
  return midpts;
}

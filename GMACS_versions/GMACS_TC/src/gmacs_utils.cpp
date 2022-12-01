/**
* macros.cpp
*/

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

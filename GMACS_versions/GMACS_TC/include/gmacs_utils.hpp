/**
 * gmacs_utils.hpp
 */
#pragma once
#ifndef GMACS_UTILS_HPP
    #define GMACS_UTILS_HPP
class echo {
  public:
    /* Global output filestream */
    static std::ofstream out;
};
  /**
  \def ECHOSTR(str)
  Prints character string to echo and std::cout ofstreams.
  */
  #undef ECHOSTR
  #define ECHOSTR(str) echo::out<<(str)<<endl; std::cout<<(str)<<std::endl;

  /**
  \def ECHOVALS(obj)
  Prints values of obj to echo and std::cout ofstreams.
  */
//  #undef ECHOVALS
//  #define ECHOVALS(obj) writeObj(#obj,obj,echo::out); writeObj(#obj,obj,std::cout);

namespace gmacs {
  /**
   * Check to see that string is "TRUE"
   * @param str - adstring to test
   * @return 1 if TRUE, 0 if not
   * 
   * @details The test does not depend on the case of the input string. 
   * Will also return 1 if ::atoi(str) evaluates to an integer that != 0.
   */
  int isTrue(const adstring& str);
  /**
   * Convert int to "TRUE" or "FALSE"
   * @param i - int to convert
   * @return "FALSE" if i==0, "TRUE" otherwise
   * 
   * @details The test does not depend on the case of the input string. 
   * Will also return 1 if ::atoi(str) evaluates to an integer that != 0.
   */
  adstring isTrue(int i){if (i) return "TRUE"; return "FALSE";}

  /**
   * Check that a string equals a keyword
   * 
   * @param str_ - string (adstring) to be tested against keyword
   * @param kw_ - keyword (adstring)
   * @param mess - message (adstring) to be included as "Error in mess\\n"
   * @return int (program exits if the string does not equal the keyword)
   */
  int checkKeyWord(const adstring& str_,const adstring& kw_,const adstring& mess);
}

#endif /* GMACS_UTILS_HPP */
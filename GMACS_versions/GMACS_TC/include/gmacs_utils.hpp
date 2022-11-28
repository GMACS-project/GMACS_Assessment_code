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
  int isTrue(const adstring& str);

  int checkKeyWord(const adstring& str_,const adstring& kw_,const adstring& mess);
}

#endif /* GMACS_UTILS_HPP */
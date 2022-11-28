/**
* macros.cpp
*/

#include <admodel.h>
#include "../include/gmacs_utils.hpp"

std::ofstream echo::out("Echo.dat",std::ios::trunc);

int gmacs::isTrue(const adstring& str_){
  adstring str=""+str_;
  if ((to_upper(str)==adstring("FALSE"))||(str=="0")) return 0;
  return 1;
}

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

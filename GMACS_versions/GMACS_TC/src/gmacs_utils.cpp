/**
* macros.cpp
*/

#include <cstring>
#include <admodel.h>
#include "../include/gmacs_utils.hpp"

std::ofstream echo::out("Echo.dat",std::ios::trunc);

/**
 * Convert adstring to double value
 * 
 * _str - adstring to convert to double value
 */
double gmacs::str_to_dbl(const adstring & _str){
  ADUNCONST(adstring,str);//converts from const _str to non-const str
  istringstream is((char*)str);
  double d = 0;
  is >> d;
  return d;
}
/**
 * Convert double to string value
 * 
 * _dbl - double to convert to double value
 */
adstring gmacs::dbl_to_str(const double & _dbl){
  int debug = 0;
  ADUNCONST(double,dbl);//converts from const _dbl to non-const dbl
  if (debug) cout<<"_dbl = "<<_dbl<<endl;
  char buffer[50];
  int n = sprintf(buffer,"%g",dbl);
  if (debug) cout<<"buffer = "<<buffer<<". n = "<<n<<endl;
  
  adstring str = "";
  for (int i=0;i<n;i++) str += buffer[i];
  if (debug) cout<<"str = "<<str<<endl;
  return str;
}

/**
 * Check if adstring can be converted to a double
 * @param str_ - adstring to convert 
 * @return 0 if false, 1 if true
 */
bool gmacs::isDouble(const adstring& str_){
  int debug = 0;
  double d = gmacs::str_to_dbl(str_);
  adstring str = gmacs::dbl_to_str(d);
  if (debug) cout<<"d = "<<str<<"; str_ = "<<str_<<"; =? "<<(str==str_)<<endl;
  return (str==str_);
}
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
 * @return bool (program exits if the string does not equal the keyword)
 */
bool gmacs::checkKeyWord(const adstring& str_,const adstring& kw_,const adstring& mess){
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

adstring_array gmacs::asa1(const adstring& a1){
  adstring_array aa(1,1); int k=1;
  aa[k++] = a1;
  return(aa);
}
adstring_array gmacs::asa2(const adstring& a1,const adstring& a2){
  adstring_array aa(1,2); int k=1;
  aa[k++] = a1;
  aa[k++] = a2;
  return(aa);
}

adstring_array gmacs::asa3(const adstring& a1,const adstring& a2,const adstring& a3){
  adstring_array aa(1,3); int k=1;
  aa[k++] = a1;
  aa[k++] = a2;
  aa[k++] = a3;
  return(aa);
}

adstring_array gmacs::asa4(const adstring& a1,const adstring& a2,const adstring& a3,const adstring& a4){
  adstring_array aa(1,4); int k=1;
  aa[k++] = a1;
  aa[k++] = a2;
  aa[k++] = a3;
  aa[k++] = a4;
  return(aa);
}

adstring_array gmacs::asa5(const adstring& a1,const adstring& a2,const adstring& a3,const adstring& a4,const adstring& a5){
  adstring_array aa(1,5); int k=1;
  aa[k++] = a1;
  aa[k++] = a2;
  aa[k++] = a3;
  aa[k++] = a4;
  aa[k++] = a5;
  return(aa);
}


///////////////////////////////--compare--//////////////////////////////////////
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
 *   int res = compsre::(lhs,rhs);      //make comparison
 *   //do something with res
 */
int compare::operator()(const adstring& lhs, const adstring& rhs) const {
  bool blhs = gmacs::isDouble(lhs);
  bool brhs = gmacs::isDouble(rhs);
  if (blhs&brhs){
    double dlhs = gmacs::str_to_dbl(lhs);
    double drhs = gmacs::str_to_dbl(rhs);
    return this->operator()(dlhs,drhs);
  }
  if (blhs){
    double dlhs = gmacs::str_to_dbl(lhs);
    return this->operator()(dlhs,rhs);
  }
  if (brhs){
    double drhs = gmacs::str_to_dbl(rhs);
    return this->operator()(lhs,drhs);
  }
  int res = strcmp(lhs,rhs);
  return res;
}

/**
 * Determine ordering of a double and a (convertible to) adstring object
 * 
 * @param lhs - "lefthand side" of comparison
 * @param rhs - "righthand side" of comparison
 * @return -1: doubles are always less than adstrings
 * 
 * @details Also works if rhs is a const char*.
 * 
 * @usage (pseudocode)\n
 *   int res = compare::(lhs,rhs);      //make comparison
 *   //do something with res
 */
int compare::operator()(const double& lhs, const adstring& rhs) const {
  return -1;
}

/**
 * Determine ordering of a double and a (convertible to) adstring object
 * 
 * @param lhs - "lefthand side" of comparison
 * @param rhs - "righthand side" of comparison
 * @return 1: adstrings are always greater than doubles
 * 
 * @details Also works if lhs is a const char*.
 * 
 * @usage (pseudocode)\n
 *   int res = compare::(lhs,rhs);      //make comparison
 *   //do something with res
 */
int compare::operator()(const adstring& lhs, const double& rhs) const {
  return 1;
}

/**
 * Determine ordering of two doubles
 * 
 * @param lhs - "lefthand side" of comparison
 * @param rhs - "righthand side" of comparison
 * @return  -1 if lhs< rhs, 0 if lhs==rhs, and 1 if lhs> rhs
 * 
 * @details Also works if lhs is a const char*.
 * 
 * @usage (pseudocode)\n
 *   int res = compare::(lhs,rhs);      //make comparison
 *   //do something with res
 */
int compare::operator()(const double& lhs, const double& rhs) const {
  if (lhs<rhs) return -1;
  if (lhs>rhs) return  1;
  return 0;
}

///////////////////////////////--ParamMultiKey_IAA--////////////////////////////
ParamMultiKey_IAA::ParamMultiKey_IAA(int id_, adstring str1_, adstring str2_){
  id  = id_;
  str1 = str1_;
  str2 = str2_;
}  

/**
 * Comparison operator to determine order of this and another multi-key
 * @param right - the other multi-key
 * @return - true if this is less than other multi-key
 */
bool ParamMultiKey_IAA::operator<(const ParamMultiKey_IAA &right) const 
{
    if ( id == right.id ) {
        if ( str1 == right.str1 ) {
            return cmpr(str2,right.str2);
        } else {
            return cmpr(str1,right.str1);
        }
    } else {
        return id < right.id;
    }
}    
///////////////////////////////--MultiKey--////////////////////////////
/**
 * Class constructor
 * @param keys_ - adstring_array from which to create the MultiKey
 */
MultiKey::MultiKey(const adstring_array& keys_){
  isrt.allocate(0,keys_.size()-1);
  keys.allocate(0,keys_.size()-1);
  for (int i=0;i<keys_.size();i++){
    isrt[i] = i;//default sorting
    keys[i] = keys_[i+keys_.indexmin()];
  }
}  

/**
 * Class constructor
 * @param id_ - integer key
 * @param keys_ - adstring_array from which to create the MultiKey
 * @details id_ will be converted to an adstring and prepended to keys_ 
 * to form the multi-key.
 */
MultiKey::MultiKey(int id_, const adstring_array& keys_){
  isrt.allocate(0,keys_.size());
  keys.allocate(0,keys_.size());
  isrt[0] = 0;
  keys[0] = str(id_);
  for (int i=1;i<=keys_.size();i++){
    isrt[i] = i;//default sorting
    keys[i] = keys_[i-1+keys_.indexmin()];
  }
}

/**
 * Comparison operator to determine order of this and another multi-key
 * @param right - the other multi-key
 * @return - true if this is less than the other multi-key
 * @details The order of comparison of keys is determined by the values 
 * of isrt for each multi-key.
 */
bool MultiKey::operator<(const MultiKey &right) const 
{
  int mxl = keys.indexmax(); int mxr = right.keys.indexmax();
  int ctr = 0;
  bool res = (keys[isrt[ctr]]==right.keys[right.isrt[ctr]]);
  while (res&&(ctr<mxl)&&(ctr<mxr)){
    ctr++;
    res = (keys[isrt[ctr]]==right.keys[right.isrt[ctr]]);
  }
  if (!res) return (cmpr(keys[isrt[ctr]],right.keys[right.isrt[ctr]])<0);
  if (mxl<mxr) return true;
  return false;
}    
/**
  * Read object from input stream in ADMB format.
  * 
  * @param is - file input stream
  */
 void MultiKey::read(cifstream & is){
   for (int i=isrt.indexmin();i<=isrt.indexmax();i++)
     is>>keys[isrt[i]];
 }
 /**
  * Write object to output stream in ADMB format.
  * 
  * @param os - output stream
  */
 void MultiKey::write(std::ostream & os) const {
   for (int i=isrt.indexmin();i<=isrt.indexmax();i++)
     os<<keys[isrt[i]]<<"  ";
 }


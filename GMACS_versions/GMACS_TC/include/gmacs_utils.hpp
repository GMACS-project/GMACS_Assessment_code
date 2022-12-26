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
Prints character string to echo and std::cout ostreams.
*/
#undef ECHOSTR
#define ECHOSTR(str) echo::out<<(str)<<endl; \
                     std::cout<<(str)<<std::endl;

/**
\def ECHOOBJ(obj)
Prints value of obj to echo and std::cout ostreams.
*/
#undef ECHOOBJ
#define ECHOOBJ(str,obj) echo::out<<(str)<<(obj)<<endl; \
                         std::cout<<(str)<<(obj)<<endl;

/**
\def ECHOPTR(str,ptr)
Prints value of *ptr to echo and std::cout ostreams.
*/
#undef ECHOPTR
#define ECHOPTR(str,ptr) if ((ptr)){echo::out<<(str)<<(*(ptr))<<endl;} else {echo::out<<(str)<<"nullptr"<<endl;} \
                         if ((ptr)){std::cout<<(str)<<(*(ptr))<<endl;} else {std::cout<<(str)<<"nullptr"<<endl;}

/**
\def ECHOITER(str,itr)
Prints value of std::map iterator (itr) to echo and std::cout ostreams.
*/
#undef ECHOITER
#define ECHOITER(str,itr) echo::out<<(str)<<((itr)->first)<<":"<<endl<<"\t"<<(*((it)->second))<<endl;\
                          std::cout<<(str)<<((itr)->first)<<":"<<endl<<"\t"<<(*((it)->second))<<endl;

#undef EOF
#define EOF -999

namespace gmacs {
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
   * Check if adstring can be converted to a double
   * @param str_ - adstring to convert 
   * @return 0 if false, 1 if true
   */
  bool isDouble(const adstring& str_);

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
  adstring isTrue(int i);

  /**
   * Check that a string equals a keyword
   * 
   * @param str_ - string (adstring) to be tested against keyword
   * @param kw_ - keyword (adstring)
   * @param mess - message (adstring) to be included as "Error in mess\\n"
   * @return int (program exits if the string does not equal the keyword)
   */
  bool checkKeyWord(const adstring& str_,const adstring& kw_,const adstring& mess);
  
  /**
   * Get the midpoints of a vector of cutpoints as a dvector
   * 
   * @param cutpts - dvector of "bin" cutpoints
   * @return - dvector of midpoints
   */
  dvector getMidpoints(const dvector& _cutpts);
  
  adstring_array asa1(const adstring& a1);
  adstring_array asa2(const adstring& a1,const adstring& a2);
  adstring_array asa3(const adstring& a1,const adstring& a2,const adstring& a3);
  adstring_array asa4(const adstring& a1,const adstring& a2,const adstring& a3,const adstring& a4);
  adstring_array asa5(const adstring& a1,const adstring& a2,const adstring& a3,const adstring& a4,const adstring& a5);
}//--end of gmacs namespace

/**
 * Class to provide order comparison between objects 
 */
class compare{    
public:
  /**
   * Determine ordering of two (convertible to) adstring objects
   * 
   * @param lhs - "lefthand side" of comparison
   * @param rhs - "righthand side" of comparison
   * @return   \< 0 if lhs \< rhs, 0 if lhs==rhs, and \> 0 if lhs \> rhs
   * 
   * @details Also works with const char* inputs.
   * 
   * @usage (pseudocode)\n
   *   gmacs::compare_strings cs();//instantiate struct
   *   int res = cs(lhs,rhs);      //make comparison
   *   //do something with res
   */
  int operator()(const adstring& lhs, const adstring& rhs) const;
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
  int operator()(const double& lhs, const adstring& rhs) const;
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
  int operator()(const adstring& lhs, const double& rhs) const;
  /**
   * Determine ordering of two doubles
   * 
   * @param lhs - "lefthand side" of comparison
   * @param rhs - "righthand side" of comparison
   * @return  \< 0 if lhs \< rhs, 0 if lhs==rhs, and \> 0 if lhs \> rhs
   * 
   * @details Also works if lhs is a const char*.
   * 
   * @usage (pseudocode)\n
   *   int res = compare::(lhs,rhs);      //make comparison
   *   //do something with res
   */
   int operator()(const double& lhs, const double& rhs) const;
};//--compare
  
///////////////////////////////--ParamMultiKey_IAA--////////////////////////////
/**
 * Class defining a "multi-key" for a map with int, adstring, and adstring keys 
 */
class ParamMultiKey_IAA {
  public:
    /* integer key */
    int id;
    /* function name */
    adstring str1;
    /* parameter name */
    adstring str2;
    /* comparator */
    compare cmpr;
    
    ParamMultiKey_IAA(int id_, adstring str1_, adstring str2_);  

    bool operator<(const ParamMultiKey_IAA &right) const;    
};//--ParamMultiKey_IAA
///////////////////////////////--ParamMultiKey_IAA--////////////////////////////
/**
 * Class defining a "multi-key" for a map using an array of adstrings as a set of keys 
 */
class MultiKey {
  public:
    /* key vector */
    adstring_array keys;
    /* sorting order */
    ivector isrt;
    /* comparator */
    compare cmpr;
    
    /**
     * Class constructor
     * @param keys_ - adstring_array from which to create the MultiKey
     */
    MultiKey(const adstring_array& keys_);  

    /**
     * Class constructor
     * @param id_ - integer key
     * @param keys_ - adstring_array from which to create the MultiKey
     * @details id_ will be converted to an adstring and prepended to keys_ 
     * to form the multi-key.
     */
    MultiKey(int id_, const adstring_array& keys_);  

  /**
   * Comparison operator to determine order of this and another multi-key
   * @param right - the other multi-key
   * @return - true if this is less than the other multi-key
   */
    bool operator<(const MultiKey &right) const;    
    
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
  void write(std::ostream & os) const;
  /**
   * Operator to read from input filestream in ADMB format
   */
  friend cifstream&    operator >>(cifstream & is, MultiKey & obj){obj.read(is);return is;}
  /**
   * Operator to write to output stream in ADMB format
   */
  friend std::ostream& operator <<(std::ostream & os, const MultiKey & obj) {obj.write(os);return os;}
};//--MultiKey
#endif /* GMACS_UTILS_HPP */
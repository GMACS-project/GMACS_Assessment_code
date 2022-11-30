//ModelConfiguration.cpp

#include <admodel.h>
#include "../include/gmacs_utils.hpp"
#include "../include/ModelConfiguration.hpp"
using namespace std;

//static (class) variables
const adstring ModelConfiguration::VERSION = "2022.11.16";
int ModelConfiguration::debug=1;

/**
 * Get the index for the categorical dimension indicated by the input string
 * 
 * @param als - alias (adstring) indicating categorical dimension index
 * @param pCD - pointer to appropriate categorical dimension info
 * @return - dimension index as an int (0=any/all values; -1: not found)
 */
int ModelConfiguration::getCatIndex(adstring als,CatDim* pCD){
  if (debug) cout<<"starting ModelConfiguration::getCatIndex("<<als<<","<<pCD->getDimName()<<")"<<endl;
  int idx = -1;
  if (::str(::atoi(als))==als) //als is not an integer as a string
    idx = pCD->getIndex(als);
  else 
    idx = ::atoi(als);
  if (debug) cout<<"finished ModelConfiguration::getCatIndex("<<als<<","<<pCD->getDimName()<<")"<<endl;
  return idx;
}
/**
 * Get time block id corresponding to input string 
 * 
 * @param als - alias (adstring) indicating time block
 * @return time block integer idex
 */
int ModelConfiguration::getTimeBlockIndex(adstring als){
  if (debug) cout<<"starting ModelConfiguration::getTimeBlockIndex("<<als<<")"<<endl;
  int idx = -1;
  if (::str(::atoi(als))==als) //als is not an integer as a string
    idx = pTBlks->getBlockIndex(als);
  if (debug) cout<<"starting ModelConfiguration::getTimeBlockIndex("<<als<<")"<<endl;
  return idx;
}
/**
 * Get size block id corresponding to input string 
 * 
 * @param als - alias (adstring) indicating size block
 * @return size block integer index
 */
int ModelConfiguration::getSizeBlockIndex(adstring als){
  if (debug) cout<<"starting ModelConfiguration::getSizeBlockIndex("<<als<<")"<<endl;
  int idx = -1;
  if (::str(::atoi(als))==als) //als is not an integer as a string
    idx = pZBlks->getBlockIndex(als);
  if (debug) cout<<"finished ModelConfiguration::getSizeBlockIndex("<<als<<")"<<endl;
  return idx;
}


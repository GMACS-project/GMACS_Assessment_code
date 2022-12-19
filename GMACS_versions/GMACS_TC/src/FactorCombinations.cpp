/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/cppFiles/file.cc to edit this template
 */

#include <admodel.h>
#include "../include/FactorCombinations.hpp"

///////////////////////////////////FactorCombination////////////////////////////
int FactorCombination::debug = 0;

/** 
 * Class constructor.
 */
FactorCombination::FactorCombination(){
  if (debug) cout<<"Starting FactorCombination::FactorCombination"<<endl;
  if (debug) cout<<"Finished FactorCombination::FactorCombination"<<endl;
}
/** 
 * Class destructor.
 */
FactorCombination::~FactorCombination(){
  
}

/**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void FactorCombination::read(cifstream & is){
  if (debug) cout<<"Starting FactorCombination::read for '"<<is.get_file_name()<<"'"<<endl;
  ModelConfiguration* ptrMC = ModelConfiguration::getInstance();
  is>>fc;  //--factor combination
  is>>fcm; //--factor combination mirror
  is>>s_r;  r  = ptrMC->getRegionIndex(s_r);    //--region info
  is>>s_x;  x  = ptrMC->getSexIndex(s_x);       //--sex info
  is>>s_m;  m  = ptrMC->getMatStateIndex(s_m);  //--maturity state info
  is>>s_s;  s  = ptrMC->getShellCondIndex(s_s); //--shell condition info
  is>>s_tb;
  is>>s_zb;
  is>>s_type;
  is>>s_units;
  is>>label;
  if (debug) cout<<"Finished FactorCombination::read for '"<<is.get_file_name()<<"'"<<endl;
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void FactorCombination::write(std::ostream & os){
  if (debug) cout<<"Starting FactorCombination::write"<<endl;
  os<<fc  <<"\t";  //--factor combination index
  os<<fcm <<"\t";  //--factor combination mirror
  os<<s_r <<"\t";  //--region alias
  os<<s_x <<"\t";  //--sex alias
  os<<s_m <<"\t";  //--maturity state alias
  os<<s_s <<"\t";  //--shell condition alias
  os<<s_tb<<"\t";  //--time block alias
  os<<s_zb<<"\t";  //--size block alias
  os<<s_type<<"\t";  //process type for factor combination
  os<<s_units<<"\t"; //units for process type
  os<<label; //factor combination label 
  if (debug) cout<<endl<<"Finished FactorCombination::write"<<endl;
}
///////////////////////////////////FactorCombinations///////////////////////////
int FactorCombinations::debug = 0;

/**
 * Class constructor
 */
FactorCombinations::FactorCombinations(){
  if (debug) cout<<"Starting FactorCombinations::FactorCombinations"<<endl;
  if (debug) cout<<"Finished FactorCombinations::FactorCombinations"<<endl;
}

/**
 * Class destructor
 */
FactorCombinations::~FactorCombinations(){
  if (!mapFCs.empty()) {
    for (std::map<int,FactorCombination*>::iterator it=mapFCs.begin(); it!=mapFCs.end(); ++it) 
      delete it->second;//delete pointer
  }
}

/**
 * Count number of factor combinations specifying a particular type
 * 
 * @param type_ - (adstring) the type to count instances of
 * @return the number of (non-mirrored) factor combinations specifying type = type_
 */
int FactorCombinations::countType(adstring type_){
  if (debug) cout<<"Starting FactorCombinations::countType("<<type_<<")"<<endl;
  int n = 0;
  for (std::map<int,FactorCombination*>::iterator it=mapFCs.begin(); it!=mapFCs.end(); ++it) 
    if ((type_==it->second->s_type)&&(0==it->second->fcm)) 
      n++;//don't count mirrored factor combinations
  if (debug) cout<<"Finished FactorCombinations::countType("<<type_<<")"<<endl;
  return n;
}

/**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void FactorCombinations::read(cifstream & is){
  if (debug) cout<<"Starting FactorCombinations::read"<<endl;
  is>>nFCs;
  if (debug) cout<<"nFCs = "<<nFCs<<endl;
  mapFCs.clear();
  for (int i=0;i<nFCs;i++) {
    FactorCombination* pFC = new FactorCombination();
    is>>(*pFC);
    int fc = pFC->fc; mapFCs[fc] = pFC;
    if (debug) cout<<"\ti = "<<i<<endl<<(*mapFCs[fc])<<endl;
  }
  if (debug) cout<<"Finished FactorCombinations::read"<<endl;
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void FactorCombinations::write(std::ostream & os){
  if (debug) cout<<"Starting FactorCombinations::write"<<endl;
  os<<nFCs<<"    #--number of factor combinations"<<endl;
  os<<"fc mir  region sex   mat shell time_block  size_block   type     units  label"<<endl;
  for (std::map<int,FactorCombination*>::iterator it=mapFCs.begin(); it!=mapFCs.end(); ++it) 
    os<<(*(it->second))<<endl;
  if (debug) cout<<"Finished FactorCombinations::write"<<endl;
}

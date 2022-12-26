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
FactorCombination::FactorCombination(int fc_){
  if (debug) cout<<"Starting FactorCombination::FactorCombination"<<endl;
  fc = fc_;
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
  is>>fcm; //--factor combination mirror
  is>>s_r;  r  = ptrMC->getRegionIndex(s_r);    //--region info
  is>>s_x;  x  = ptrMC->getSexIndex(s_x);       //--sex info
  is>>s_m;  m  = ptrMC->getMatStateIndex(s_m);  //--maturity state info
  is>>s_s;  s  = ptrMC->getShellCondIndex(s_s); //--shell condition info
  is>>s_tb;
  is>>s_zb;
  is>>s_type;
  is>>s_fcn;
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
  os<<s_fcn<<"\t";   //function name for factor combination
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
      delete it->second;//delete pointer to FactorCombination instance
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
  nFCs = 0;
  mapFCs.clear();
  int fc_;
  is>>fc_; if (debug) cout<<"fc_ = "<<fc_<<endl;
  while (fc_>0) {
    nFCs++;
    FactorCombination* pFC = new FactorCombination(fc_);
    is>>(*pFC);
    mapFCs[fc_] = pFC;
    if (debug) cout<<"\tctr = "<<nFCs<<endl<<(*mapFCs[fc_])<<endl;
    if (nFCs>100) {
      cout<<"#---------------------#"<<endl;
      cout<<"Number of factor combinations read exceeds "<<FactorCombinations::maxNumFCs<<"."<<endl;
      cout<<"This probably indicates an error in the ctl file, possibly a missing EOF"<<endl;
      cout<<"after the set of factor combinations."<<endl;
      cout<<"If this is NOT an error, increase FactorCombinations::maxNumFCs in FactorCombinations.hpp."<<endl;
      cout<<"#---------------------#"<<endl;
      exit(-1);
    }
    is>>fc_;  if (debug) cout<<"fc = "<<fc_<<endl;
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
  os<<"#----number of factor combinations: "<<nFCs<<endl;
  os<<"fc mir  region sex   mat shell time_block  size_block   type    function   units  label"<<endl;
  for (std::map<int,FactorCombination*>::iterator it=mapFCs.begin(); it!=mapFCs.end(); ++it) 
    os<<(*(it->second))<<endl;
  os<<EOF<<"  #--EOI for factor combinations";
  if (debug) cout<<endl<<"Finished FactorCombinations::write"<<endl;
}


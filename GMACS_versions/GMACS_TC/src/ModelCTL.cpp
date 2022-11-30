/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/cppFiles/file.cc to edit this template
 */
#include <admodel.h>
#include "../include/ModelCTL.hpp"
#include "../include/ModelConfiguration.hpp"

///////////////////////////////////BasicParamInfo////////////////////////////
/* flag to print debugging info */
int BasicParamInfo::debug = 1;

/**
 * Constructor
 */
BasicParamInfo::BasicParamInfo(){}
/**
 * Destructor
 */
BasicParamInfo::~BasicParamInfo(){}
 /**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void BasicParamInfo::read(cifstream & is){
  if (debug) cout<<"starting BasicParamInfo::read"<<endl;
  adstring str;
  is>>init_val;
  is>>lwr_bnd;
  is>>upr_bnd;
  is>>phase;
  is>>str; jitter = gmacs::isTrue(str);
  is>>s_prior;
  is>>p1;
  is>>p2;
  if (debug) cout<<"finished BasicParamInfo::read"<<endl;
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void BasicParamInfo::write(std::ostream & os){
  if (debug) cout<<"starting BasicParamInfo::write"<<endl;
  os<<init_val<<"  ";
  os<<lwr_bnd<<"  ";
  os<<upr_bnd<<"  ";
  os<<phase<<"  ";
  os<<gmacs::isTrue(jitter)<<"  ";
  os<<s_prior<<"  ";
  os<<p1<<"  ";
  os<<p2<<"  ";
  if (debug) cout<<"finished BasicParamInfo::write"<<endl;
}
///////////////////////////////////StdParamInfo////////////////////////////
/* flag to print debugging info */
int StdParamInfo::debug = 1;

/**
 * Constructor
 */
StdParamInfo::StdParamInfo():BasicParamInfo(){}
/**
 * Destructor
 */
StdParamInfo::~StdParamInfo(){}
 /**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void StdParamInfo::read(cifstream & is){
  if (debug) cout<<"starting StdParamInfo::read"<<endl;
  is>>s_param;
  is>>mirror;
  is>>(BasicParamInfo& (*this));//read BasicParamInfo elements
  if (debug) cout<<"finished StdParamInfo::read"<<endl;
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void StdParamInfo::write(std::ostream & os){
  if (debug) cout<<"starting StdParamInfo::write"<<endl;
  os<<s_param<<"  ";
  os<<(BasicParamInfo& (*this));//write BasicParamInfo elements;
  if (debug) cout<<"finished StdParamInfo::write"<<endl;
}
/////////////////////////////////////FunctionInfo////////////////////////////
///* flag to print debugging info */
//int FunctionInfo::debug = 1;;
//
///**
// * Constructor
// */
//FunctionInfo::FunctionInfo(){}
///**
// * Destructor
// */
//FunctionInfo::~FunctionInfo(){}
// /**
// * Read object from input stream in ADMB format.
// * 
// * @param is - file input stream
// */
//void FunctionInfo::read(cifstream & is){
//  
//}
///**
// * Write object to output stream in ADMB format.
// * 
// * @param os - output stream
// */
//void FunctionInfo::write(std::ostream & os){
//  
//}
/////////////////////////////////////FunctionsInfo////////////////////////////
///* flag to print debugging info */
//static int debug;
//
///** 
// * Class constructor
// */
//FunctionsInfo::FunctionsInfo(){
//  
//}
///** 
// * Class destructor
// */
//FunctionsInfo::~FunctionsInfo(){
//  
//}
// /**
// * Read object from input stream in ADMB format.
// * 
// * @param is - file input stream
// */
//void FunctionsInfo::read(cifstream & is){
//  
//}
///**
// * Write object to output stream in ADMB format.
// * 
// * @param os - output stream
// */
//void FunctionsInfo::write(std::ostream & os){
//  
//}
///////////////////////////////////FactorCombination////////////////////////////
int FactorCombination::debug = 1;
ModelConfiguration* FactorCombination::ptrMC = nullptr;

/** 
 * Class constructor.
 */
FactorCombination::FactorCombination(ModelConfiguration* ptrMC_){
  ptrMC = ptrMC_;
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
  is>>fc;  //--factor combination
  is>>fcm; //--factor combination mirror
  is>>s_r;  r  = ptrMC->getRegionIndex(s_r);    //--region info
  is>>s_x;  x  = ptrMC->getSexIndex(s_x);       //--sex info
  is>>s_m;  m  = ptrMC->getMatStateIndex(s_m);  //--maturity state info
  is>>s_s;  s  = ptrMC->getShellCondIndex(s_s); //--shell condition info
  is>>s_tb; tb = ptrMC->getTimeBlockIndex(s_tb);//--time block info
  is>>s_zb; zb = ptrMC->getSizeBlockIndex(s_zb);//--size block info
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
  os<<fc  <<"\t";  //--factor combination
  os<<fcm <<"\t"; //--factor combination mirror
  os<<s_r <<"\t"; //--region info
  os<<s_x <<"\t"; //--sex info
  os<<s_m <<"\t"; //--maturity state info
  os<<s_s <<"\t"; //--shell condition info
  os<<s_tb<<"\t"; //--time block info
  os<<s_zb<<"\t"; //--size block info
  os<<s_type<<"\t";  //process type for factor combination
  os<<s_units<<"\t"; //units for process type
  os<<label; //factor combination label 
  if (debug) cout<<"Finished FactorCombination::write"<<endl;
}
///////////////////////////////////FactorCombinations///////////////////////////
int FactorCombinations::debug = 1;
ModelConfiguration* FactorCombinations::ptrMC = nullptr;

/**
 * Class constructor
 * 
 * @param ptrMC_ - pointer to ModelConfiguration object
 */
FactorCombinations::FactorCombinations(ModelConfiguration* ptrMC_){
  if (debug) cout<<"Starting FactorCombinations::FactorCombinations"<<endl;
  ptrMC = ptrMC_;
  ppFCs = nullptr;
  if (debug) cout<<"Finished FactorCombinations::FactorCombinations"<<endl;
}

/**
 * Class constructor
 * 
 * @param ptrMC_ - pointer to ModelConfiguration object
 */
FactorCombinations::~FactorCombinations(){
  if (ppFCs) {
    for (int i=0;i<nFCs;i++) delete ppFCs[i];
    delete[] ppFCs; ppFCs = nullptr;
  }
}

/**
 * Count number of factor combinations specifying a particular type
 * 
 * @param type_ - (adstring) the type to count instances of
 * @return the number of factor combinations specifying type = type_
 */
int FactorCombinations::countType(adstring type_){
  if (debug) cout<<"Starting FactorCombinations::countType("<<type_<<")"<<endl;
  int n = 0;
  for (int i=0;i<nFCs;i++) 
    if ((type_==ppFCs[i]->s_type)&&(!ppFCs[i]->fcm)) 
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
  ppFCs = new FactorCombination*[nFCs];
  for (int i=0;i<nFCs;i++) {
    ppFCs[i] = new FactorCombination(ptrMC);
    is>>(*ppFCs[i]);
    if (debug) cout<<"\ti = "<<i<<endl<<ppFCs[i]<<endl;
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
  for (int i=0;i<nFCs;i++) {os<<(*ppFCs[i]); if (i<nFCs-1) os<<endl;}
  if (debug) cout<<"Finished FactorCombinations::write"<<endl;
}
///////////////////////////////////WeightAtSize/////////////////////////////////
int WeightAtSize::debug=1;
const adstring WeightAtSize::keyword="WatZ";
ModelConfiguration* WeightAtSize::ptrMC=nullptr;

/**
 * Class constructor
 * 
 * @param ptrMC_ - pointer to ModelConfiguration object
 */
WeightAtSize::WeightAtSize(ModelConfiguration* ptrMC_){
  if (debug) cout<<"starting WeightAtSize::WeightAtSize"<<endl;
  ptrMC = ptrMC_;
  ptrFCs = nullptr;
  nAllometryTypes = 0;
  nVectorTypes = 0;
  if (debug) cout<<"finished WeightAtSize::WeightAtSize"<<endl;
}

/**
 * Class constructor
 * 
 * @param ptrMC_ - pointer to ModelConfiguration object
 */
WeightAtSize::~WeightAtSize(){
  if (ptrFCs) delete ptrFCs;
}

/**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void WeightAtSize::read(cifstream & is){
  if (debug) cout<<"starting WeightAtSize::read from '"<<is.get_file_name()<<"'"<<endl;
  adstring str;
  is>>str; gmacs::checkKeyWord(str,keyword,"WeightAtSize::read");
  if (debug) FactorCombinations::debug=1;
  ptrFCs = new FactorCombinations(ptrMC);
  is>>(*ptrFCs);
  nAllometryTypes = ptrFCs->countType("allometry"); 
  if (debug) cout<<"nAllometryTypes = "<<nAllometryTypes<<endl;
  nVectorTypes = ptrFCs->countType("vector");
  if (debug) cout<<"nVectorTypes = "<<nVectorTypes<<endl;
  if (debug) FactorCombinations::debug=0;
  if (debug) cout<<"finished WeightAtSize::read from '"<<is.get_file_name()<<"'"<<endl;
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void WeightAtSize::write(std::ostream & os){
  if (debug) cout<<"starting WeightAtSize::write"<<endl;
  os<<"WatZ       #keyword-----------------------------------"<<endl;
  os<<"#----Type options--------------"<<endl;
  os<<"# 'allometry': input a, b parameters from W=a*L^b relationships (by region,sex, maturity, shell condition)"<<endl;
  os<<"# 'vector'   : input weight-at-size vector for size bins        (by region,sex, maturity, shell condition)"<<endl;
  os<<"#--Factor combinations--------------"<<endl;
  os<<(*ptrFCs)<<endl;
  
  os<<"#--Allometry info--------------"<<endl;
  os<<"#--Vector info-----------------"<<endl;
  if (debug) cout<<"finished WeightAtSize::write"<<endl;
}

///////////////////////////////////ModelCTL/////////////////////////////////////
int ModelCTL::debug = 1;
/* model ctl file version */
const adstring ModelCTL::version = "2022.11.29";
/* pointer to ModelConfiguration object */
ModelConfiguration* ModelCTL::ptrMC = nullptr;

/**
 * Class constructor
 * 
 * @param ptrMC_ - pointer to ModelConfiguration object
 */
ModelCTL::ModelCTL(ModelConfiguration* ptrMC_){
  if (debug) cout<<"starting ModelCTL::ModelCTL"<<endl;
  ptrMC = ptrMC_;
  ptrWatZ = nullptr;
  if (debug) cout<<"finished ModelCTL::ModelCTL"<<endl;
}

/**
 * Class destructor
 */
ModelCTL::~ModelCTL(){
  if (ptrWatZ) delete ptrWatZ; ptrWatZ = nullptr;
}
/**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void ModelCTL::read(cifstream & is){
  if (debug) cout<<"starting ModelCTL::read('"<<is.get_file_name()<<"')"<<endl;
  adstring str;
  is>>str; gmacs::checkKeyWord(str,version,"Reading ctl file. Incorrect version given.");
  if (debug) WeightAtSize::debug = 1;
  ptrWatZ = new WeightAtSize(ptrMC);
  is>>(*ptrWatZ);
  if (debug) WeightAtSize::debug = 0;
  if (debug) cout<<"finished ModelCTL::read"<<endl;
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void ModelCTL::write(std::ostream & os){
  if (debug) cout<<"starting ModelCTL::write"<<endl;
  os<<version<<"    #--ctl file version"<<endl;
  os<<"#############################################################"<<endl;
  os<<"##------------------------------------------------"<<endl;
  os<<"##--Population"<<endl;
  os<<(*ptrWatZ)<<endl;
  if (debug) cout<<"finished ModelCTL::write"<<endl;
}


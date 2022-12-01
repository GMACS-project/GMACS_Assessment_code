/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/cppFiles/file.cc to edit this template
 */
#include <map>
#include <admodel.h>
#include "../include/gmacs_utils.hpp"
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
  if (mirror==0)
    is>>(*((BasicParamInfo*) (this)));//read BasicParamInfo elements
  if (debug) cout<<"finished StdParamInfo::read"<<endl;
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void StdParamInfo::write(std::ostream & os){
  if (debug) cout<<"starting StdParamInfo::write"<<endl;
  os<<s_param<<"  "<<mirror;
  if (0==mirror)
    os<<(*(BasicParamInfo*) (this));//write BasicParamInfo elements;
  if (debug) cout<<"finished StdParamInfo::write"<<endl;
}
///////////////////////////////////WatZFunctionInfo////////////////////////////
/* flag to print debugging info */
int WatZFunctionInfo::debug = 1;

/**
 * Constructor
 */
WatZFunctionInfo::WatZFunctionInfo(int fc_,adstring& function_){
  fc = fc_;
  s_function = function_;
  ptrStdPI = nullptr;
}
/**
 * Destructor
 */
WatZFunctionInfo::~WatZFunctionInfo(){
  if (ptrStdPI) delete ptrStdPI;
}
 /**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void WatZFunctionInfo::read(cifstream & is){
  if (debug) cout<<"starting WatZFunctionInfo::read"<<endl;
  if (ptrStdPI) delete ptrStdPI;
  ptrStdPI = new StdParamInfo();
  is>>(*ptrStdPI);
  if (debug) cout<<"finished WatZFunctionInfo::read"<<endl;
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void WatZFunctionInfo::write(std::ostream & os){
  if (debug) cout<<"starting WatZFunctionInfo::write"<<endl;
  os<<fc<<"  ";
  os<<s_function<<"  ";
  os<<(*ptrStdPI);
  if (debug) cout<<"finished WatZFunctionInfo::write"<<endl;
}
///////////////////////////////////FunctionsInfo////////////////////////////
/* flag to print debugging info */
int WatZFunctionsInfo::debug = 1;
const adstring WatZFunctionsInfo::keyword = "functions";
/** 
 * Class constructor
 */
WatZFunctionsInfo::WatZFunctionsInfo(){
  
}
/** 
 * Class destructor
 */
WatZFunctionsInfo::~WatZFunctionsInfo(){
  
}
 /**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void WatZFunctionsInfo::read(cifstream & is){
  if (debug) cout<<"starting WatZFunctionsInfo::read"<<endl;
  adstring kw_;
  is>>kw_; gmacs::checkKeyWord(kw_,keyword,"");
  int fc_; adstring fcn_; 
  is>>fc_;
  while (fc_>0){
    is>>fcn_;
    WatZFunctionInfo* p = new WatZFunctionInfo(fc_,fcn_);
    is>>(*p);
    if (debug) cout<<(*p)<<endl;
    ParamMultiKey* pmk = new ParamMultiKey(fc_,fcn_,p->ptrStdPI->s_param);
    mapFIs[(*pmk)] = p;
    is>>fc_;
  }  
  if (debug) cout<<"finished WatZFunctionsInfo::read"<<endl;
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void WatZFunctionsInfo::write(std::ostream & os){
  if (debug) cout<<"starting WatZFunctionsInfo::write"<<endl;
  os<<keyword<<"  #--information type"<<endl;
  os<<"#fc function  par mir   ival    lb   ub   phz  jtr?  prior p1 p2"<<endl;
  if (debug) cout<<"number of rows defining functions: "<<mapFIs.size()<<endl;
  for (std::map<ParamMultiKey,WatZFunctionInfo*>::iterator it=mapFIs.begin(); it!=mapFIs.end(); ++it) {
    if (debug) cout<<(it->first).fc<<" "<<(it->first).fcn<<" "<<(it->first).par<<endl;
    os<<(*(it->second))<<endl;
  }
  
  if (debug) cout<<"finished WatZFunctionsInfo::write"<<endl;
}
///////////////////////////////////FactorCombination////////////////////////////
int FactorCombination::debug = 1;
ModelConfiguration* FactorCombination::ptrMC = nullptr;

/** 
 * Class constructor.
 */
FactorCombination::FactorCombination(ModelConfiguration* ptrMC_){
  if (debug) cout<<"Starting FactorCombination::FactorCombination"<<endl;
  ptrMC = ptrMC_;
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
  if (debug) cout<<endl<<"Finished FactorCombination::write"<<endl;
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
  if (debug) cout<<"Finished FactorCombinations::FactorCombinations"<<endl;
}

/**
 * Class constructor
 * 
 * @param ptrMC_ - pointer to ModelConfiguration object
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
    FactorCombination* pFC = new FactorCombination(ptrMC);
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
///////////////////////////////////WatZVectorInfo////////////////////////////
/* flag to print debugging info */
int WatZVectorInfo::debug = 1;

/**
 * Constructor
 */
WatZVectorInfo::WatZVectorInfo(int fc_,adstring& function_){
  fc = fc_;
  s_size_block = function_;
  ptrStdPI = nullptr;
}
/**
 * Destructor
 */
WatZVectorInfo::~WatZVectorInfo(){
  if (ptrStdPI) delete ptrStdPI;
}
 /**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void WatZVectorInfo::read(cifstream & is){
  if (debug) cout<<"starting WatZVectorInfo::read"<<endl;
  if (ptrStdPI) delete ptrStdPI;
  ptrStdPI = new StdParamInfo();
  is>>(*ptrStdPI);
  if (debug) cout<<"finished WatZVectorInfo::read"<<endl;
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void WatZVectorInfo::write(std::ostream & os){
  if (debug) cout<<"starting WatZVectorInfo::write"<<endl;
  os<<fc<<"  ";
  os<<s_size_block<<"  ";
  os<<(*ptrStdPI);
  if (debug) cout<<"finished WatZVectorInfo::write"<<endl;
}
///////////////////////////////////FunctionsInfo////////////////////////////
/* flag to print debugging info */
int WatZVectorsInfo::debug = 1;
const adstring WatZVectorsInfo::keyword = "functions";
/** 
 * Class constructor
 */
WatZVectorsInfo::WatZVectorsInfo(){
  
}
/** 
 * Class destructor
 */
WatZVectorsInfo::~WatZVectorsInfo(){
  
}
 /**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void WatZVectorsInfo::read(cifstream & is){
  if (debug) cout<<"starting WatZVectorsInfo::read"<<endl;
  adstring kw_;
  is>>kw_; gmacs::checkKeyWord(kw_,keyword,"");
  int fc_; adstring fcn_; 
  is>>fc_;
  while (fc_>0){
    is>>fcn_;
    WatZVectorInfo* p = new WatZVectorInfo(fc_,fcn_);
    is>>(*p);
    if (debug) cout<<(*p)<<endl;
    ParamMultiKey* pmk = new ParamMultiKey(fc_,fcn_,p->ptrStdPI->s_param);
    mapVIs[(*pmk)] = p;
    is>>fc_;
  }  
  if (debug) cout<<"finished WatZVectorsInfo::read"<<endl;
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void WatZVectorsInfo::write(std::ostream & os){
  if (debug) cout<<"starting WatZVectorsInfo::write"<<endl;
  os<<keyword<<"  #--information type"<<endl;
  os<<"#fc function  par mir   ival    lb   ub   phz  jtr?  prior p1 p2"<<endl;
  if (debug) cout<<"number of rows defining functions: "<<mapVIs.size()<<endl;
  for (std::map<ParamMultiKey,WatZVectorInfo*>::iterator it=mapVIs.begin(); it!=mapVIs.end(); ++it) {
    if (debug) cout<<(it->first).fc<<" "<<(it->first).fcn<<" "<<(it->first).par<<endl;
    os<<(*(it->second))<<endl;
  }
  
  if (debug) cout<<"finished WatZVectorsInfo::write"<<endl;
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
  ptrFIs = nullptr;
  ptrVIs = nullptr;
  nFunctionTypes = 0;
  nVectorTypes = 0;
  if (debug) cout<<"finished WeightAtSize::WeightAtSize"<<endl;
}

/**
 * Class destructor
 */
WeightAtSize::~WeightAtSize(){
  if (ptrFCs) delete ptrFCs; ptrFCs=nullptr;
  if (ptrFIs) delete ptrFIs; ptrFIs=nullptr;
  if (ptrVIs) delete ptrVIs; ptrVIs=nullptr;
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
//  if (debug) FactorCombinations::debug=1;
  if (ptrFCs) delete ptrFCs;
  ptrFCs = new FactorCombinations(ptrMC);
  is>>(*ptrFCs);
//  if (debug) FactorCombinations::debug=0;
  
  nFunctionTypes = ptrFCs->countType("function"); 
  if (debug) cout<<"nFunctionTypes = "<<nFunctionTypes<<endl;
  if (ptrFIs) delete ptrFIs;
  ptrFIs = new WatZFunctionsInfo();
  is>>(*ptrFIs);
  
  
  nVectorTypes = ptrFCs->countType("vector");
  if (debug) cout<<"nVectorTypes = "<<nVectorTypes<<endl;
  if (ptrVIs) delete ptrVIs;
  ptrVIs = new WatZVectorsInfo();
  is>>(*ptrVIs);
  
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
  os<<(*ptrFCs);
  
  os<<"#--Function info---------------"<<endl;
  os<<(*ptrFIs);
  
  os<<"#--Vector info-----------------"<<endl;
  os<<(*ptrVIs);
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
//  if (debug) WeightAtSize::debug = 1;
  ptrWatZ = new WeightAtSize(ptrMC);
  is>>(*ptrWatZ);
//  if (debug) WeightAtSize::debug = 0;
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


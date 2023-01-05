/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/cppFiles/file.cc to edit this template
 */

#include <map>
#include <admodel.h>
#include "../include/gmacs_utils.hpp"
#include "../include/ModelConfiguration.hpp"
#include "../include/ParamInfo.hpp"

///////////////////////////////////BasicParamInfo////////////////////////////
/* flag to print debugging info */
int ParamBasicInfo::debug = 0;

/**
 * Constructor
 */
ParamBasicInfo::ParamBasicInfo(){pv_idx=-1;}
/**
 * Destructor
 */
ParamBasicInfo::~ParamBasicInfo(){}
 /**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void ParamBasicInfo::read(cifstream & is){
  if (debug) cout<<"starting BasicParamInfo::read"<<endl;
  adstring str;
  is>>mir;
  if (mir==0){
    is>>init_val;
    is>>lwr_bnd;
    is>>upr_bnd;
    is>>phase;
    is>>str; jitter = gmacs::isTrue(str);
    is>>s_prior;
    is>>p1;
    is>>p2;
  }
  if (debug) cout<<"finished BasicParamInfo::read"<<endl;
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void ParamBasicInfo::write(std::ostream & os){
  if (debug) cout<<"starting BasicParamInfo::write"<<endl;
  os<<mir<<"  ";
  if (mir==0){
    os<<init_val<<"  ";
    os<<lwr_bnd<<"  ";
    os<<upr_bnd<<"  ";
    os<<phase<<"  ";
    os<<gmacs::isTrue(jitter)<<"  ";
    os<<s_prior<<"  ";
    os<<p1<<"  ";
    os<<p2<<"  ";
    os<<"#--param index: "<<pv_idx;
  } else {
    os<<"#--value is mirrored in "<<mir;
  }
  if (debug) cout<<endl<<"finished BasicParamInfo::write"<<endl;
}

///////////////////////////////////StdParamInfo////////////////////////////
/* flag to print debugging info */
int ParamStdInfo::debug = 0;

/**
 * Constructor
 */
ParamStdInfo::ParamStdInfo():ParamBasicInfo(){}
/**
 * Destructor
 */
ParamStdInfo::~ParamStdInfo(){}
 /**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void ParamStdInfo::read(cifstream & is){
  if (debug) cout<<"starting StdParamInfo::read"<<endl;
  is>>s_param;
  is>>(*((ParamBasicInfo*) (this)));//read BasicParamInfo elements
  if (debug) cout<<"finished StdParamInfo::read"<<endl;
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void ParamStdInfo::write(std::ostream & os){
  if (debug) cout<<"starting StdParamInfo::write"<<endl;
  os<<s_param<<"  ";
  os<<(*((ParamBasicInfo*) (this)));//write BasicParamInfo elements;
  if (debug) cout<<endl<<"finished StdParamInfo::write"<<endl;
}

///////////////////////////////////VectorParamInfo////////////////////////////
/* flag to print debugging info */
int ParamVectorInfo::debug = 0;

/**
 * Constructor
 */
ParamVectorInfo::ParamVectorInfo():ParamBasicInfo(){}
/**
 * Destructor
 */
ParamVectorInfo::~ParamVectorInfo(){}
 /**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void ParamVectorInfo::read(cifstream & is){
  if (debug) cout<<"starting VectorParamInfo::read"<<endl;
  is>>s_param;
  is>>s_vi;
  is>>(*((ParamBasicInfo*) (this)));//read BasicParamInfo elements
  if (debug) cout<<"finished VectorParamInfo::read"<<endl;
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void ParamVectorInfo::write(std::ostream & os){
  if (debug) cout<<"starting VectorParamInfo::write"<<endl;
  os<<s_param<<"  "<<s_vi<<"  ";
  os<<(*((ParamBasicInfo*) (this)));//write BasicParamInfo elements;
  if (debug) cout<<"finished VectorParamInfo::write"<<endl;
}

///////////////////////////////////MatrixParamInfo////////////////////////////
/* flag to print debugging info */
int ParamMatrixInfo::debug = 0;

/**
 * Constructor
 */
ParamMatrixInfo::ParamMatrixInfo():ParamBasicInfo(){}
/**
 * Destructor
 */
ParamMatrixInfo::~ParamMatrixInfo(){}
 /**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void ParamMatrixInfo::read(cifstream & is){
  if (debug) cout<<"starting MatrixParamInfo::read"<<endl;
  is>>s_param;
  is>>s_ri;
  is>>s_ci;
  is>>(*((ParamBasicInfo*) (this)));//read BasicParamInfo elements
  if (debug) cout<<"finished MatrixParamInfo::read"<<endl;
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void ParamMatrixInfo::write(std::ostream & os){
  if (debug) cout<<"starting MatrixParamInfo::write"<<endl;
  os<<s_param<<"  "<<s_ri<<"  "<<s_ci<<"  ";
  os<<(*((ParamBasicInfo*) (this)));//write BasicParamInfo elements;
  if (debug) cout<<"finished MatrixParamInfo::write"<<endl;
}

///////////////////////////////////StdParamFunctionInfo/////////////////////////
/* flag to print debugging info */
int ParamStdFunctionInfo::debug = 0;

/**
 * Constructor
 */
ParamStdFunctionInfo::ParamStdFunctionInfo(int fc_){
  fc = fc_;
  ptrPI = nullptr;
}
/**
 * Destructor
 */
ParamStdFunctionInfo::~ParamStdFunctionInfo(){
  if (ptrPI) delete ptrPI;
}
 /**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void ParamStdFunctionInfo::read(cifstream & is){
  if (debug) cout<<"starting StdParamFunctionInfo::read"<<endl;
  if (ptrPI) delete ptrPI;
  ptrPI = new ParamStdInfo();
  is>>(*ptrPI);
  if (debug) cout<<"finished StdParamFunctionInfo::read"<<endl;
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void ParamStdFunctionInfo::write(std::ostream & os){
  if (debug) cout<<"starting StdParamFunctionInfo::write"<<endl;
  os<<fc<<"  ";
  os<<(*ptrPI);
  if (debug) cout<<"finished StdParamFunctionInfo::write"<<endl;
}

///////////////////////////////////StdParamFunctionsInfo////////////////////////////
/* flag to print debugging info */
int ParamStdFunctionsInfo::debug = 0;
const adstring ParamStdFunctionsInfo::KEYWORD = "functions";
/** 
 * Class constructor
 */
ParamStdFunctionsInfo::ParamStdFunctionsInfo(){}
/** 
 * Class destructor
 */
ParamStdFunctionsInfo::~ParamStdFunctionsInfo(){
  for (std::map<MultiKey,ParamStdFunctionInfo*>::iterator it=mapFIs.begin(); it!=mapFIs.end(); ++it) {
    if (debug) cout<<(it->first)<<endl;
    delete it->second; it->second = nullptr;
  }
}
/**
 * Calculate number of parameters
 * 
 * @return - (int) number of parameters
 */
int ParamStdFunctionsInfo::calcNumParams(){
  if (debug) cout<<"starting StdParamFunctionsInfo::calcNumParams"<<endl;
  int n = gmacs::calcNumParams<ParamStdFunctionInfo*>(mapFIs);
  if (debug) cout<<"finished StdParamFunctionsInfo::calcNumParams"<<endl;
  return n;
}
/**
 * Create a matrix with initial value, lower bound, upper bound, phase, and jitter flag 
 * for all non-mirrored parameters.
 * 
 * @return - dmatrix with initial value, lower bound, upper bound, phase, 
 * and jitter flag for all non-mirrored parameters
 */
dmatrix ParamStdFunctionsInfo::calcILUPJs(){
  if (debug) cout<<"starting StdParamFunctionsInfo::calcILUPJs"<<endl;
  dmatrix mat = gmacs::calcILUPJs<ParamStdFunctionInfo*>(mapFIs);
  if (debug) cout<<"finished StdParamFunctionsInfo::calcILUPJs"<<endl;
  return mat;
}
/**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void ParamStdFunctionsInfo::read(cifstream & is){
  if (debug) cout<<"starting StdParamFunctionsInfo::read"<<endl;
  adstring kw_;
  is>>kw_; gmacs::checkKeyWord(kw_,KEYWORD,"StdParamFunctionsInfo::read");
  int fc_; 
  is>>fc_;
  while (fc_>0){
    ParamStdFunctionInfo* p = new ParamStdFunctionInfo(fc_);
    is>>(*p);
    if (debug) cout<<(*p)<<endl;
    MultiKey* mk = new MultiKey(gmacs::asa2(str(fc_),p->ptrPI->s_param));
    mapFIs[(*mk)] = p;
    is>>fc_;
  }  
  if (debug) cout<<"finished StdParamFunctionsInfo::read"<<endl;
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void ParamStdFunctionsInfo::write(std::ostream & os){
  if (debug) cout<<"starting StdParamFunctionsInfo::write"<<endl;
  os<<KEYWORD<<"  #--information type"<<endl;
  os<<"#fc par mir   ival    lb   ub   phz  jtr?  prior p1 p2"<<endl;
  if (debug) cout<<"number of rows defining functions: "<<mapFIs.size()<<endl;
  for (std::map<MultiKey,ParamStdFunctionInfo*>::iterator it=mapFIs.begin(); it!=mapFIs.end(); ++it) {
    if (debug) cout<<(it->first)<<endl;
    os<<(*(it->second))<<endl;
  }
  os<<EOF<<"   #--end of functions information section"<<endl;
  if (debug) cout<<"finished StdParamFunctionsInfo::write"<<endl;
}

///////////////////////////////////ParamVectorFunctionInfo/////////////////////////
/* flag to print debugging info */
int ParamVectorFunctionInfo::debug = 0;

/**
 * Constructor
 */
ParamVectorFunctionInfo::ParamVectorFunctionInfo(int fc_){
  fc = fc_;
  ptrPI = nullptr;
}
/**
 * Destructor
 */
ParamVectorFunctionInfo::~ParamVectorFunctionInfo(){
  if (ptrPI) delete ptrPI;
}
 /**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void ParamVectorFunctionInfo::read(cifstream & is){
  if (debug) cout<<"starting ParamVectorFunctionInfo::read"<<endl;
  if (ptrPI) delete ptrPI;
  ptrPI = new ParamVectorInfo();
  is>>(*ptrPI);
  if (debug) cout<<"finished ParamVectorFunctionInfo::read"<<endl;
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void ParamVectorFunctionInfo::write(std::ostream & os){
  if (debug) cout<<"starting ParamVectorFunctionInfo::write"<<endl;
  os<<fc<<"  ";
  os<<(*ptrPI);
  if (debug) cout<<"finished ParamVectorFunctionInfo::write"<<endl;
}

///////////////////////////////////ParamVectorFunctionsInfo////////////////////////////
/* flag to print debugging info */
int ParamVectorFunctionsInfo::debug = 0;
const adstring ParamVectorFunctionsInfo::KEYWORD = "param_vectors";
/** 
 * Class constructor
 */
ParamVectorFunctionsInfo::ParamVectorFunctionsInfo(){
  
}
/** 
 * Class destructor
 */
ParamVectorFunctionsInfo::~ParamVectorFunctionsInfo(){
  for (std::map<MultiKey,ParamVectorFunctionInfo*>::iterator it=mapFIs.begin(); it!=mapFIs.end(); ++it) {
    if (debug) cout<<(it->first)<<endl;
    delete it->second; it->second = nullptr;
  }
}
/**
 * Calculate number of parameters
 * 
 * @return - (int) number of parameters
 */
int ParamVectorFunctionsInfo::calcNumParams(){
  if (debug) cout<<"starting ParamVectorFunctionsInfo::calcNumParams"<<endl;
  int n = gmacs::calcNumParams<ParamVectorFunctionInfo*>(mapFIs);
  if (debug) cout<<"finished ParamVectorFunctionsInfo::calcNumParams"<<endl;
  return n;
}
/**
 * Create a matrix with initial value, lower bound, upper bound, phase, and jitter flag 
 * for all parameters.
 * 
 * @return - dmatrix with initial value, lower bound, upper bound, phase, 
 * and jitter flag for all parameters
 */
dmatrix ParamVectorFunctionsInfo::calcILUPJs(){
  if (debug) cout<<"starting ParamVectorFunctionsInfo::calcILUPJs"<<endl;
  dmatrix mat = gmacs::calcILUPJs<ParamVectorFunctionInfo*>(mapFIs);
  if (debug) cout<<"finished ParamVectorFunctionsInfo::calcILUPJs"<<endl;
  return mat;
}
/**
* Read object from input stream in ADMB format.
* 
* @param is - file input stream
*/
void ParamVectorFunctionsInfo::read(cifstream & is){
  if (debug) cout<<"starting ParamVectorFunctionsInfo::read"<<endl;
  adstring kw_;
  is>>kw_; gmacs::checkKeyWord(kw_,KEYWORD,"");
  int fc_; adstring fcn_; 
  is>>fc_;
  while (fc_>0){
    ParamVectorFunctionInfo* p = new ParamVectorFunctionInfo(fc_);
    is>>(*p);
    if (debug) cout<<(*p)<<endl;
    MultiKey* mk = new MultiKey(gmacs::asa3(str(fc_),p->ptrPI->s_param,p->ptrPI->s_vi));
    mapFIs[(*mk)] = p;
    is>>fc_;
  }  
  if (debug) cout<<"finished ParamVectorFunctionsInfo::read"<<endl;
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void ParamVectorFunctionsInfo::write(std::ostream & os){
  if (debug) cout<<"starting ParamVectorFunctionsInfo::write"<<endl;
  os<<KEYWORD<<"  #--information type"<<endl;
  os<<"#fc par vec_val  mir   ival    lb   ub   phz  jtr?  prior p1 p2"<<endl;
  if (debug) cout<<"number of rows defining functions: "<<mapFIs.size()<<endl;
  for (std::map<MultiKey,ParamVectorFunctionInfo*>::iterator it=mapFIs.begin(); it!=mapFIs.end(); ++it) {
    if (debug) cout<<(it->first)<<endl;
    os<<(*(it->second))<<endl;
  }
  os<<EOF<<"   #--end of param_vectors information section"<<endl;
  if (debug) cout<<"finished ParamVectorFunctionsInfo::write"<<endl;
}

///////////////////////////////////ParamMatrixFunctionInfo/////////////////////////
/* flag to print debugging info */
int ParamMatrixFunctionInfo::debug = 0;

/**
 * Constructor
 */
ParamMatrixFunctionInfo::ParamMatrixFunctionInfo(int fc_){
  fc = fc_;
  ptrPI = nullptr;
}
/**
 * Destructor
 */
ParamMatrixFunctionInfo::~ParamMatrixFunctionInfo(){
  if (ptrPI) delete ptrPI;
}
 /**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void ParamMatrixFunctionInfo::read(cifstream & is){
  if (debug) cout<<"starting ParamMatrixFunctionInfo::read"<<endl;
  if (ptrPI) delete ptrPI;
  ptrPI = new ParamMatrixInfo();
  is>>(*ptrPI);
  if (debug) cout<<"finished ParamMatrixFunctionInfo::read"<<endl;
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void ParamMatrixFunctionInfo::write(std::ostream & os){
  if (debug) cout<<"starting ParamMatrixFunctionInfo::write"<<endl;
  os<<fc<<"  ";
  os<<(*ptrPI);
  if (debug) cout<<"finished ParamMatrixFunctionInfo::write"<<endl;
}

///////////////////////////////////ParamMatrixFunctionsInfo////////////////////////////
/* flag to print debugging info */
int ParamMatrixFunctionsInfo::debug = 0;
const adstring ParamMatrixFunctionsInfo::KEYWORD = "param_matrices";
/** 
 * Class constructor
 */
ParamMatrixFunctionsInfo::ParamMatrixFunctionsInfo(){
  
}
/** 
 * Class destructor
 */
ParamMatrixFunctionsInfo::~ParamMatrixFunctionsInfo(){
  for (std::map<MultiKey,ParamMatrixFunctionInfo*>::iterator it=mapFIs.begin(); it!=mapFIs.end(); ++it) {
    if (debug) cout<<(it->first)<<endl;
    delete it->second; it->second = nullptr;
  }
}
/**
 * Calculate number of parameters
 * 
 * @return - (int) number of parameters
 */
int ParamMatrixFunctionsInfo::calcNumParams(){
  if (debug) cout<<"starting ParamMatrixFunctionsInfo::calcNumParams"<<endl;
  int n = gmacs::calcNumParams<ParamMatrixFunctionInfo*>(mapFIs);
  if (debug) cout<<"finished ParamMatrixFunctionsInfo::calcNumParams"<<endl;
  return n;
}
/**
 * Create a matrix with initial value, lower bound, upper bound, phase, and jitter flag 
 * for all parameters.
 * 
 * @return - dmatrix with initial value, lower bound, upper bound, phase, 
 * and jitter flag for all parameters
 */
dmatrix ParamMatrixFunctionsInfo::calcILUPJs(){
  if (debug) cout<<"starting ParamMatrixFunctionsInfo::calcILUPJs"<<endl;
  dmatrix mat = gmacs::calcILUPJs<ParamMatrixFunctionInfo*>(mapFIs);
  if (debug) cout<<"finished ParamMatrixFunctionsInfo::calcILUPJs"<<endl;
  return mat;
}
/**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void ParamMatrixFunctionsInfo::read(cifstream & is){
  debug=1;
  if (debug) ECHOSTR("starting ParamMatrixFunctionsInfo::read");
  adstring kw_;
  is>>kw_; gmacs::checkKeyWord(kw_,KEYWORD,"ParamMatrixFunctionsInfo::read");
  int fc_;
  is>>fc_;  ECHOOBJ("fc_ = ",fc_);
  while (fc_>0){
    ParamMatrixFunctionInfo* p = new ParamMatrixFunctionInfo(fc_);
    is>>(*p);
    if (debug) {ECHOPTR("ParamMatrixFunctionInfo* p\n",p);}
    MultiKey* mk = new MultiKey(gmacs::asa4(str(fc_),p->ptrPI->s_param,p->ptrPI->s_ri,p->ptrPI->s_ci));
    mapFIs[(*mk)] = p;
    is>>fc_;  ECHOOBJ("fc_ = ",fc_);
  }  
  if (debug) ECHOSTR("finished ParamMatrixFunctionsInfo::read");
  debug=0;
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void ParamMatrixFunctionsInfo::write(std::ostream & os){
  if (debug) cout<<"starting ParamMatrixFunctionsInfo::write"<<endl;
  os<<KEYWORD<<"  #--information type"<<endl;
  os<<"#fc par  row_val  col_val  mir   ival    lb   ub   phz  jtr?  prior p1 p2"<<endl;
  if (debug) cout<<"number of rows defining functions: "<<mapFIs.size()<<endl;
  for (std::map<MultiKey,ParamMatrixFunctionInfo*>::iterator it=mapFIs.begin(); it!=mapFIs.end(); ++it) {
    if (debug) cout<<(it->first)<<endl;
    os<<(*(it->second))<<endl;
  }
  os<<EOF<<"   #--end of param_matrices information section"<<endl;
  if (debug) cout<<"finished ParamMatrixFunctionsInfo::write"<<endl;
}


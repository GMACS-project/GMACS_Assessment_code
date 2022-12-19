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
int BasicParamInfo::debug = 0;

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
int StdParamInfo::debug = 0;

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
  os<<s_param<<"  "<<mirror<<"  ";
  if (0==mirror)
    os<<(*(BasicParamInfo*) (this));//write BasicParamInfo elements;
  else 
    os<<"#--see mirrored parameter for further details"<<endl;
  if (debug) cout<<"finished StdParamInfo::write"<<endl;
}

///////////////////////////////////VectorParamInfo////////////////////////////
/* flag to print debugging info */
int VectorParamInfo::debug = 0;

/**
 * Constructor
 */
VectorParamInfo::VectorParamInfo():StdParamInfo(){}
/**
 * Destructor
 */
VectorParamInfo::~VectorParamInfo(){}
 /**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void VectorParamInfo::read(cifstream & is){
  if (debug) cout<<"starting VectorParamInfo::read"<<endl;
  is>>s_vi;
  is>>(*((StdParamInfo*) (this)));//read StdParamInfo elements
  if (debug) cout<<"finished VectorParamInfo::read"<<endl;
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void VectorParamInfo::write(std::ostream & os){
  if (debug) cout<<"starting VectorParamInfo::write"<<endl;
  os<<s_vi<<"  ";
  os<<(*(StdParamInfo*) (this));//write StdParamInfo elements;
  if (debug) cout<<"finished VectorParamInfo::write"<<endl;
}

///////////////////////////////////MatrixParamInfo////////////////////////////
/* flag to print debugging info */
int MatrixParamInfo::debug = 0;

/**
 * Constructor
 */
MatrixParamInfo::MatrixParamInfo():VectorParamInfo(){}
/**
 * Destructor
 */
MatrixParamInfo::~MatrixParamInfo(){}
 /**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void MatrixParamInfo::read(cifstream & is){
  if (debug) cout<<"starting MatrixParamInfo::read"<<endl;
  is>>s_ri;
  is>>(*((VectorParamInfo*) (this)));//read VectorParamInfo elements
  if (debug) cout<<"finished MatrixParamInfo::read"<<endl;
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void MatrixParamInfo::write(std::ostream & os){
  if (debug) cout<<"starting MatrixParamInfo::write"<<endl;
  os<<s_ri<<"  ";
  os<<(*(VectorParamInfo*) (this));//write VectorParamInfo elements;
  if (debug) cout<<"finished MatrixParamInfo::write"<<endl;
}

///////////////////////////////////StdParamFunctionInfo/////////////////////////
/* flag to print debugging info */
int StdParamFunctionInfo::debug = 0;

/**
 * Constructor
 */
StdParamFunctionInfo::StdParamFunctionInfo(int fc_,adstring& function_){
  fc = fc_;
  s_function = function_;
  ptrPI = nullptr;
}
/**
 * Destructor
 */
StdParamFunctionInfo::~StdParamFunctionInfo(){
  if (ptrPI) delete ptrPI;
}
 /**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void StdParamFunctionInfo::read(cifstream & is){
  if (debug) cout<<"starting StdParamFunctionInfo::read"<<endl;
  if (ptrPI) delete ptrPI;
  ptrPI = new StdParamInfo();
  is>>(*ptrPI);
  if (debug) cout<<"finished StdParamFunctionInfo::read"<<endl;
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void StdParamFunctionInfo::write(std::ostream & os){
  if (debug) cout<<"starting StdParamFunctionInfo::write"<<endl;
  os<<fc<<"  ";
  os<<s_function<<"  ";
  os<<(*ptrPI);
  if (debug) cout<<"finished StdParamFunctionInfo::write"<<endl;
}

///////////////////////////////////StdParamFunctionsInfo////////////////////////////
/* flag to print debugging info */
int StdParamFunctionsInfo::debug = 0;
const adstring StdParamFunctionsInfo::KEYWORD = "functions";
/** 
 * Class constructor
 */
StdParamFunctionsInfo::StdParamFunctionsInfo(){
  
}
/** 
 * Class destructor
 */
StdParamFunctionsInfo::~StdParamFunctionsInfo(){
  
}
 /**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void StdParamFunctionsInfo::read(cifstream & is){
  if (debug) cout<<"starting StdParamFunctionsInfo::read"<<endl;
  adstring kw_;
  is>>kw_; gmacs::checkKeyWord(kw_,KEYWORD,"StdParamFunctionsInfo::read");
  int fc_; adstring fcn_; 
  is>>fc_;
  while (fc_>0){
    is>>fcn_;
    StdParamFunctionInfo* p = new StdParamFunctionInfo(fc_,fcn_);
    is>>(*p);
    if (debug) cout<<(*p)<<endl;
//    ParamMultiKey_IAA* pmk = new ParamMultiKey_IAA(fc_,fcn_,p->ptrPI->s_param);
//    mapFIs[(*pmk)] = p;
    MultiKey* mk = new MultiKey(gmacs::asa3(str(fc_),fcn_,p->ptrPI->s_param));
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
void StdParamFunctionsInfo::write(std::ostream & os){
  if (debug) cout<<"starting StdParamFunctionsInfo::write"<<endl;
  os<<KEYWORD<<"  #--information type"<<endl;
  os<<"#fc function  par mir   ival    lb   ub   phz  jtr?  prior p1 p2"<<endl;
  if (debug) cout<<"number of rows defining functions: "<<mapFIs.size()<<endl;
  for (std::map<MultiKey,StdParamFunctionInfo*>::iterator it=mapFIs.begin(); it!=mapFIs.end(); ++it) {
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
ParamVectorFunctionInfo::ParamVectorFunctionInfo(int fc_,adstring& function_){
  fc = fc_;
  s_function = function_;
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
  ptrPI = new VectorParamInfo();
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
  os<<s_function<<"  ";
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
    is>>fcn_;
    ParamVectorFunctionInfo* p = new ParamVectorFunctionInfo(fc_,fcn_);
    is>>(*p);
    if (debug) cout<<(*p)<<endl;
    MultiKey* mk = new MultiKey(gmacs::asa4(str(fc_),fcn_,p->ptrPI->s_param,p->ptrPI->s_vi));
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
  os<<"#fc function  par mir   ival    lb   ub   phz  jtr?  prior p1 p2"<<endl;
  if (debug) cout<<"number of rows defining functions: "<<mapFIs.size()<<endl;
  for (std::map<MultiKey,ParamVectorFunctionInfo*>::iterator it=mapFIs.begin(); it!=mapFIs.end(); ++it) {
    if (debug) cout<<(it->first)<<endl;
    os<<(it->second)<<endl;
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
ParamMatrixFunctionInfo::ParamMatrixFunctionInfo(int fc_,adstring& function_){
  fc = fc_;
  s_function = function_;
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
  ptrPI = new MatrixParamInfo();
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
  os<<s_function<<"  ";
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
  
}
 /**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void ParamMatrixFunctionsInfo::read(cifstream & is){
  if (debug) cout<<"starting ParamMatrixFunctionsInfo::read"<<endl;
  adstring kw_;
  is>>kw_; gmacs::checkKeyWord(kw_,KEYWORD,"ParamMatrixFunctionsInfo::read");
  int fc_; adstring fcn_; 
  is>>fc_;
  while (fc_>0){
    is>>fcn_;
    ParamMatrixFunctionInfo* p = new ParamMatrixFunctionInfo(fc_,fcn_);
    is>>(*p);
    if (debug) cout<<(*p)<<endl;
    MultiKey* mk = new MultiKey(gmacs::asa5(str(fc_),fcn_,p->ptrPI->s_param,p->ptrPI->s_ri,p->ptrPI->s_vi));
    mapFIs[(*mk)] = p;
    is>>fc_;
  }  
  if (debug) cout<<"finished ParamMatrixFunctionsInfo::read"<<endl;
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void ParamMatrixFunctionsInfo::write(std::ostream & os){
  if (debug) cout<<"starting ParamMatrixFunctionsInfo::write"<<endl;
  os<<KEYWORD<<"  #--information type"<<endl;
  os<<"#fc function  par  row_index  col_index  mir   ival    lb   ub   phz  jtr?  prior p1 p2"<<endl;
  if (debug) cout<<"number of rows defining functions: "<<mapFIs.size()<<endl;
  for (std::map<MultiKey,ParamMatrixFunctionInfo*>::iterator it=mapFIs.begin(); it!=mapFIs.end(); ++it) {
    if (debug) cout<<(it->first)<<endl;
    os<<(*(it->second))<<endl;
  }
  os<<EOF<<"   #--end of param_matrices information section"<<endl;
  if (debug) cout<<"finished ParamMatrixFunctionsInfo::write"<<endl;
}


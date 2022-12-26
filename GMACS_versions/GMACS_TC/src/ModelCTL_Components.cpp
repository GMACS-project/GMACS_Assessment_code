/*
 * file: ModelCTL_Components.cpp
 * author: William Stockhausen
 */
#include <map>
#include <admodel.h>
#include "ParamInfo.hpp"
#include "VarParamInfo.hpp"
#include "FixedQuantitiesInfo.hpp"
#include "ModelConfiguration.hpp"
#include "FactorCombinations.hpp"
#include "../include/ModelCTL_Components.hpp"

///////////////////////////////////AllParamsInfo////////////////////////////
int AllParamsInfo::debug = 1;

/** 
 * Class constructor
 */
AllParamsInfo::AllParamsInfo(){
  ptrFCs   = nullptr;
  ptrPSFIs  = nullptr;
  ptrPVFIs = nullptr;
  ptrPMFIs = nullptr;
  ptrFVIs  = nullptr;
  ptrFMIs  = nullptr;
  ptrVPFIs = nullptr;
  ptrVPVIs = nullptr;
}
/** 
 * Class destructor
 */
AllParamsInfo::~AllParamsInfo(){
  if (ptrFCs)   delete ptrFCs;   ptrFCs   = nullptr;
  if (ptrPSFIs)  delete ptrPSFIs;  ptrPSFIs  = nullptr;
  if (ptrPVFIs) delete ptrPVFIs; ptrPVFIs = nullptr;
  if (ptrPMFIs) delete ptrPMFIs; ptrPMFIs = nullptr;
  if (ptrFVIs)  delete ptrFVIs;  ptrFVIs  = nullptr;
  if (ptrFMIs)  delete ptrFMIs;  ptrFMIs  = nullptr;
  if (ptrVPFIs) delete ptrVPFIs; ptrVPFIs = nullptr;
  if (ptrVPVIs) delete ptrVPVIs; ptrVPVIs = nullptr;
}

/**
 * Calculate number of factor combinations
 * 
 * @return - (int) number of factor combinations
 */
int AllParamsInfo::getNumFCs(){
  int numFCs = 0;
  //loop through FCs: 
  //--each function, param_vector, param_matrix, fixed_vector, or fixed_matrix
  //----contributes 1
  //TODO: how to account for var_params??
  for (std::map<int,FactorCombination*>::iterator it=(ptrFCs->mapFCs).begin(); it!=(ptrFCs->mapFCs).end(); it++){
    if (debug) ECHOITER("fc ",it);
    if ((it->second)->s_type=="function")     numFCs++; else
    if ((it->second)->s_type=="param_vector") numFCs++; else
    if ((it->second)->s_type=="param_matrix") numFCs++; else
    if ((it->second)->s_type=="fixed_vector") numFCs++; else
    if ((it->second)->s_type=="fixed_matrix") numFCs++; else {
      //TODO: need to fill in behavior for var_ types
      ECHOSTR("AllParamsInfo::getNumFCs: numFCs not implemented for var_param types yet.");
    }
  }    
  return numFCs;
}
/**
 * Calculate number of non-mirrored parameters
 * 
 * @return - (int) number of non-mirrored parameters
 */
int AllParamsInfo::calcNumParams(){
  int numParams = 0;
  if (ptrPSFIs)  numParams += gmacs::calcNumParams<ParamStdFunctionInfo*>(ptrPSFIs->mapFIs);
  if (ptrPVFIs) numParams += gmacs::calcNumParams<ParamVectorFunctionInfo*>(ptrPVFIs->mapFIs);
  if (ptrPMFIs) numParams += gmacs::calcNumParams<ParamMatrixFunctionInfo*>(ptrPMFIs->mapFIs);
  //TODO: need to add VarParams?
  return numParams;
}
/**
 * For each parameter, set the index of the corresponding gmacs 
 * parameter, including mirrored parameters
 * 
 * @param idx - (int) the index of the last gmacs parameter (start with 0)
 * 
 * @return (int) the index associated with the last parameter in mapFIs
 */
int AllParamsInfo::setParamIndices(int idx){
  //note: evaluation order must be same as AllParamsInfo::calcILUPJs()
  if (ptrPSFIs){
    idx = gmacs::setParamIndices<ParamStdFunctionInfo*>(idx,ptrPSFIs->mapFIs);   
  }
  if (ptrPVFIs){
    idx = gmacs::setParamIndices<ParamVectorFunctionInfo*>(idx,ptrPVFIs->mapFIs);
  }
  if (ptrPMFIs){
    idx = gmacs::setParamIndices<ParamMatrixFunctionInfo*>(idx,ptrPMFIs->mapFIs);
  }
  return idx;
}
/**
 * Create a matrix with initial value, lower bound, upper bound, phase, and jitter flag 
 * for all parameters.
 * 
 * @return - dmatrix with initial value, lower bound, upper bound, phase, 
 * and jitter flag for all parameters
 */
dmatrix AllParamsInfo::calcILUPJs(){
  int n = calcNumParams();
  dmatrix dm(1,n,1,5); int ctr = 0;
  if (ptrPSFIs){
    dmatrix dmp = gmacs::calcILUPJs<ParamStdFunctionInfo*>(ptrPSFIs->mapFIs);   
    for (int r=dmp.indexmin();r<=dmp.indexmax();r++) dm(++ctr) = dmp(r);
  }
  if (ptrPVFIs){
    dmatrix dmp = gmacs::calcILUPJs<ParamVectorFunctionInfo*>(ptrPVFIs->mapFIs);
    for (int r=dmp.indexmin();r<=dmp.indexmax();r++) dm(++ctr) = dmp(r);
  }
  if (ptrPMFIs){
    dmatrix dmp = gmacs::calcILUPJs<ParamMatrixFunctionInfo*>(ptrPMFIs->mapFIs);
    for (int r=dmp.indexmin();r<=dmp.indexmax();r++) dm(++ctr) = dmp(r);
  }
  return dm;
}

///////////////////////////////////WeightAtSize/////////////////////////////////
int WeightAtSize::debug=1;
const adstring WeightAtSize::KEYWORD="WatZ";

/**
 * Class constructor
 */
WeightAtSize::WeightAtSize():AllParamsInfo(){
  if (debug) ECHOSTR("starting WeightAtSize::WeightAtSize");
  if (debug) ECHOSTR("finished WeightAtSize::WeightAtSize");
}

/**
 * Class destructor
 */
WeightAtSize::~WeightAtSize(){
  if (debug) ECHOSTR("starting WeightAtSize::~WeightAtSize");
  if (debug) ECHOSTR("finished WeightAtSize::~WeightAtSize");
}

/**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void WeightAtSize::read(cifstream & is){
  if (debug) ECHOSTR("starting WeightAtSize::read");
  adstring str;
  is>>str; gmacs::checkKeyWord(str,KEYWORD,"WeightAtSize::read");
  if (ptrFCs) delete ptrFCs;
  ptrFCs = new FactorCombinations();
  is>>(*ptrFCs);
  if (debug) {ECHOPTR("ptrFCs\n",ptrFCs);}
  
  nParamStdFunctionTypes = ptrFCs->countType("function"); 
  if (debug) ECHOOBJ("nFunctionTypes = ",nParamStdFunctionTypes);
  if (ptrPSFIs) delete ptrPSFIs;
  ptrPSFIs = new ParamStdFunctionsInfo();
  is>>(*ptrPSFIs);
  if (debug) {ECHOPTR("ptrPFI\n",ptrPSFIs);}
  
  
  nFixedVectorTypes = ptrFCs->countType("fixed_vector");
  if (debug) cout<<"nFixedVectorTypes = "<<nFixedVectorTypes<<endl;
  if (ptrFVIs) delete ptrFVIs;
  ptrFVIs = new FixedVectorsInfo();
  is>>(*ptrFVIs);
  if (debug) {ECHOPTR("ptrFVIs\n",ptrFVIs);}
  
  if (debug) ECHOSTR("finished WeightAtSize::read");
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void WeightAtSize::write(std::ostream & os){
  if (debug) cout<<"starting WeightAtSize::write"<<endl;
  os<<KEYWORD<<"       #keyword-----------------------------------"<<endl;
  os<<"#--Factor combinations--------------"<<endl;
  os<<"#----Type options--------------"<<endl;
  os<<"# 'function'    : input a, b parameters from W=a*L^b relationships (by region,sex, maturity, shell condition)"<<endl;
  os<<"# 'fixed_vector': input weight-at-size vector for size bins        (by region,sex, maturity, shell condition)"<<endl;
  os<<(*ptrFCs);
  
  os<<"#--Parameter info---------------"<<endl;
  
  os<<"#----Function info---------------"<<endl;
  os<<(*ptrPSFIs);
  
  os<<"#----Fixed vector info-----------------"<<endl;
  os<<(*ptrFVIs);
  if (debug) cout<<"finished WeightAtSize::write"<<endl;
}

///////////////////////////////////NatMort/////////////////////////////////
int NatMort::debug=1;
const adstring NatMort::KEYWORD="natural_mortality";

/**
 * Class constructor
 */
NatMort::NatMort(){
  if (debug) ECHOSTR("starting NatMort::NatMort");
  ptrFCs = nullptr;
  ptrVPFIs = nullptr;
  nFunctionTypes = 0;
  ptrVPVIs = nullptr;
  if (debug) ECHOSTR("finished NatMort::NatMort");
}

/**
 * Class destructor
 */
NatMort::~NatMort(){
  if (ptrFCs)   delete ptrFCs;   ptrFCs=nullptr;
  if (ptrVPFIs) delete ptrVPFIs; ptrVPFIs=nullptr;
  if (ptrVPVIs) delete ptrVPVIs; ptrVPVIs=nullptr;
}

/**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void NatMort::read(cifstream & is){
  if (debug) ECHOSTR("starting NatMort::read");
  adstring str;
  is>>str; gmacs::checkKeyWord(str,KEYWORD,"NatMort::read");
  if (ptrFCs) delete ptrFCs;
  ptrFCs = new FactorCombinations();
  is>>(*ptrFCs);
  if (debug) {ECHOPTR("ptrFCs\n",ptrFCs);}
  
  nFunctionTypes = ptrFCs->countType("var_function"); 
  if (debug) cout<<"nFunctionTypes = "<<nFunctionTypes<<endl;
  if (ptrVPFIs) delete ptrVPFIs;
  ptrVPFIs = new VarParamFunctionsInfo();
  is>>(*ptrVPFIs);
  if (debug) {ECHOPTR("ptrVPFIs\n",ptrVPFIs);}
  
  if (ptrVPVIs) delete ptrVPVIs;
  ptrVPVIs = new VarParamsVariationInfo();
  is>>(*ptrVPVIs);
  if (debug) {ECHOPTR("ptrVPVIs\n",ptrVPVIs);}
  
  if (debug) ECHOSTR("finished NatMort::read");
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void NatMort::write(std::ostream & os){
  if (debug) cout<<"starting NatMort::write"<<endl;
  os<<KEYWORD<<"       #--keyword-----------------------------------"<<endl;
  os<<"#--Factor combinations--------------"<<endl;
  os<<"#----Type options--------------"<<endl;
  os<<"# 'var_function': function with estimable parameters w/ variation (specified in 'var_functions' information section)"<<endl;
  os<<(*ptrFCs);
  
  os<<"#--Parameter info---------------"<<endl;
  
  os<<"#----var_functions info---------------"<<endl;
  os<<(*ptrVPFIs);
  
  os<<"#----var_params info---------------"<<endl;
  os<<(*ptrVPVIs);
  
  if (debug) cout<<"finished NatMort::write"<<endl;
}

///////////////////////////////////MoltProbability/////////////////////////////////
int MoltProbability::debug=1;
const adstring MoltProbability::KEYWORD="molt_probability";

/**
 * Class constructor
 */
MoltProbability::MoltProbability():AllParamsInfo(){
  if (debug) cout<<"starting MoltProbability::MoltProbability"<<endl;
  if (debug) cout<<"finished MoltProbability::MoltProbability"<<endl;
}

/**
 * Class destructor
 */
MoltProbability::~MoltProbability(){
  if (debug) cout<<"starting MoltProbability::~MoltProbability"<<endl;
  if (debug) cout<<"finished MoltProbability::~MoltProbability"<<endl;
}

/**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void MoltProbability::read(cifstream & is){
  if (debug) ECHOSTR("starting MoltProbability::read");
  adstring str;
  is>>str; gmacs::checkKeyWord(str,KEYWORD,"MoltProbability::read");
  
  if (ptrFCs) delete ptrFCs;
  ptrFCs = new FactorCombinations();
  is>>(*ptrFCs);
  if (debug) {ECHOPTR("ptrFCs\n",ptrFCs);}

  nParamStdFunctionTypes = ptrFCs->countType("function"); 
  if (debug) cout<<"nFunctionTypes = "<<nParamStdFunctionTypes<<endl;
  if (ptrPSFIs) delete ptrPSFIs;
  ptrPSFIs = new ParamStdFunctionsInfo();
  is>>(*ptrPSFIs);
  if (debug) {ECHOPTR("ptrPFIs\n",ptrPSFIs);}

  nParamVectorFunctionTypes = ptrFCs->countType("param_vector");
  if (debug) cout<<"nParamVectorFunctionTypes = "<<nParamVectorFunctionTypes<<endl;
  if (ptrPVFIs) delete ptrPVFIs;
  ptrPVFIs = new ParamVectorFunctionsInfo();
  is>>(*ptrPVFIs);
  if (debug) {ECHOPTR("ptrPVFIs\n",ptrPVFIs);}
  
  nFixedVectorTypes = ptrFCs->countType("fixed_vector");
  if (debug) cout<<"nFixedVectorTypes = "<<nFixedVectorTypes<<endl;
  if (ptrFVIs) delete ptrFVIs;
  ptrFVIs = new FixedVectorsInfo();
  is>>(*ptrFVIs);
  if (debug) {ECHOPTR("ptrFVIs\n",ptrFVIs);}
  
  if (debug) ECHOSTR("finished MoltProbability::read");
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void MoltProbability::write(std::ostream & os){
  if (debug) cout<<"starting MoltProbability::write"<<endl;
  os<<KEYWORD<<"       #keyword-----------------------------------"<<endl;
  os<<"#--Factor combinations--------------"<<endl;
  os<<"#----Type options to specify terminal molt--------------"<<endl;
  os<<"# 'function'     : function with estimable parameters          (specified in 'functions' information section)"<<endl;
  os<<"# 'param_vector' : vector of estimable parameters by size bin  (specified in 'param_vectors' information section)"<<endl;
  os<<"# 'fixed_vector' : fixed vector with probabilities by size bin (specified in 'fixed_vectors' information section)"<<endl;
  os<<"#----function options"<<endl;
  os<<"# 'flat': constant probability"<<endl;
  os<<"# 'declining': declining logistic function with parameters z50 and slope"<<endl;
  os<<"#----param_vector options"<<endl;
  os<<"# 'nonparam': probability of molt-at-size"<<endl;
  os<<(*ptrFCs);
  
  os<<"#--Parameter information"<<endl;
  
  os<<"#----Function info---------------"<<endl;
  os<<(*ptrPSFIs);
  
  os<<"#----Param vector info---------------"<<endl;
  os<<(*ptrPVFIs);
  
  os<<"#----Fixed vector info-----------------"<<endl;
  os<<(*ptrFVIs);
  if (debug) cout<<"finished MoltProbability::write"<<endl;
}

///////////////////////////////////Growth/////////////////////////////////
int Growth::debug=1;
const adstring Growth::KEYWORD="growth";

/**
 * Class constructor
 */
Growth::Growth():AllParamsInfo(){
  if (debug) cout<<"starting Growth::Growth"<<endl;
  if (debug) cout<<"finished Growth::Growth"<<endl;
}

/**
 * Class destructor
 */
Growth::~Growth(){
  if (debug) cout<<"starting Growth::~Growth"<<endl;
  if (debug) cout<<"finished Growth::~Growth"<<endl;
}

/**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void Growth::read(cifstream & is){
  if (debug) cout<<"starting Growth::read from '"<<is.get_file_name()<<"'"<<endl;
  adstring str;
  is>>str; gmacs::checkKeyWord(str,KEYWORD,"Growth::read");
  
  if (ptrFCs) delete ptrFCs;
  ptrFCs = new FactorCombinations();
  is>>(*ptrFCs);
  if (debug) {ECHOPTR("ptrFCs\n",ptrFCs);}

  nParamStdFunctionTypes = ptrFCs->countType("function"); 
  if (debug) cout<<"nStdParamTypes = "<<nParamStdFunctionTypes<<endl;
  if (ptrPSFIs) delete ptrPSFIs;
  ptrPSFIs = new ParamStdFunctionsInfo();
  is>>(*ptrPSFIs);
  if (debug) {ECHOPTR("ptrPFIs\n",ptrPSFIs);}

  nParamMatrixFunctionTypes = ptrFCs->countType("param_matrix");
  if (debug) cout<<"nParamMatrixTypes = "<<nParamMatrixFunctionTypes<<endl;
  if (ptrPMFIs) delete ptrPMFIs;
  ptrPMFIs = new ParamMatrixFunctionsInfo();
  is>>(*ptrPMFIs);
  if (debug) {ECHOPTR("ptrPMFIs\n",ptrPMFIs);}
  
  nFixedMatrixTypes = ptrFCs->countType("fixed_matrix");
  if (debug) cout<<"nFixedMatrixTypes = "<<nFixedMatrixTypes<<endl;
  if (ptrFMIs) delete ptrFMIs;
  ptrFMIs = new FixedMatrixsInfo();
  is>>(*ptrFMIs);
  if (debug) {ECHOPTR("ptrFMIs\n",ptrFMIs);}
  
  if (debug) cout<<"finished Growth::read from '"<<is.get_file_name()<<"'"<<endl;
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void Growth::write(std::ostream & os){
  if (debug) cout<<"starting Growth::write"<<endl;
  os<<KEYWORD<<"       #keyword-----------------------------------"<<endl;
  os<<"#--Factor combinations--------------"<<endl;
  os<<"#----Type options to specify terminal molt--------------"<<endl;
  os<<"# 'function' : function with estimable parameters          (specified in the 'functions' information section)"<<endl;
  os<<"# 'param_matrix'  : growth matrix w/ estimable parameters  (specified in the 'param_matrices' information section)"<<endl;
  os<<"# 'fixed_matrix'  : fixed growth matrix                    (specified in the 'fixed_matrices' information section)"<<endl;
  os<<(*ptrFCs);
  
  os<<"#--Parameter information"<<endl;
  
  os<<"#----Function info---------------"<<endl;
  os<<(*ptrPSFIs);
  
  os<<"#----Param matrix info-----------------"<<endl;
  os<<(*ptrPMFIs);
  
  os<<"#----Fixed matrix info-----------------"<<endl;
  os<<(*ptrFMIs);
  if (debug) cout<<"finished Growth::write"<<endl;
}

///////////////////////////////////MoltToMaturity/////////////////////////////////
int MoltToMaturity::debug=1;
const adstring MoltToMaturity::KEYWORD="molt_to_maturity";

/**
 * Class constructor
 */
MoltToMaturity::MoltToMaturity(){
  if (debug) cout<<"starting MoltToMaturity::MoltToMaturity"<<endl;
  if (debug) cout<<"finished MoltToMaturity::MoltToMaturity"<<endl;
}

/**
 * Class destructor
 */
MoltToMaturity::~MoltToMaturity(){
  if (debug) cout<<"starting MoltToMaturity::~MoltToMaturity"<<endl;
  if (debug) cout<<"finished MoltToMaturity::~MoltToMaturity"<<endl;
}

/**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void MoltToMaturity::read(cifstream & is){
  if (debug) ECHOSTR("starting MoltToMaturity::read");
  adstring str;
  is>>str; gmacs::checkKeyWord(str,KEYWORD,"MoltToMaturity::read");
  is>>str; hasTM = gmacs::isTrue(str);
  if (debug) ECHOOBJ("has terminal molt: ",hasTM);
  if (hasTM){
    if (ptrFCs) delete ptrFCs;
    ptrFCs = new FactorCombinations();
    is>>(*ptrFCs);
    if (debug) {ECHOPTR("ptrFCs\n",ptrFCs);}

    nParamStdFunctionTypes = ptrFCs->countType("function"); 
    if (debug) ECHOOBJ("nParamStdFunctionTypes = ",nParamStdFunctionTypes);
    if (ptrPSFIs) delete ptrPSFIs;
    ptrPSFIs = new ParamStdFunctionsInfo();
    is>>(*ptrPSFIs);
    if (debug) {ECHOPTR("ptrPSFIs\n",ptrPSFIs);}

    nParamVectorFunctionTypes = ptrFCs->countType("param_vector"); 
    if (debug) ECHOOBJ("nParamVectorFunctionTypes = ",nParamVectorFunctionTypes);
    if (ptrPVFIs) delete ptrPVFIs;
    ptrPVFIs = new ParamVectorFunctionsInfo();
    is>>(*ptrPVFIs);
    if (debug) {ECHOPTR("ptrPVFIs\n",ptrPVFIs);}
    echo::out<<"ptrPVFIs (2)\n"<<(*ptrPVFIs)<<endl;

    nFixedVectorTypes = ptrFCs->countType("fixed_vector");
    if (debug) ECHOOBJ("nFixedVectorTypes = ",nFixedVectorTypes);
    if (ptrFVIs) delete ptrFVIs;
    ptrFVIs = new FixedVectorsInfo();
    is>>(*ptrFVIs);
    if (debug) {ECHOPTR("ptrFVIs\n",ptrFVIs);}
  }
  
  if (debug) ECHOSTR("finished MoltToMaturity::read");
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void MoltToMaturity::write(std::ostream & os){
  if (debug) cout<<"starting MoltToMaturity::write"<<endl;
  os<<KEYWORD<<"       #keyword-----------------------------------"<<endl;
  os<<gmacs::isTrue(hasTM)<<"      #--undergoes terminal molt?"<<endl;
  os<<"#--if true, must specify probability-at-size for undergoing terminal molt to maturity"<<endl;
  if (hasTM){
    os<<"#--Factor combinations--------------"<<endl;
    os<<"#----Type options to specify terminal molt probability-at-size--------------"<<endl;
    os<<"# 'function'    : function with estimable parameters         (specified in the 'functions' information section)"<<endl;
    os<<"# 'param_vector': vector of estimable parameters by size bin (specified in 'param_vectors' information section)"<<endl;
    os<<"# 'fixed_vector': fixed weight-at-size vector                (specified in the 'fixed_vectors' information section)"<<endl;
    os<<"#----function options"<<endl;
    os<<"#--'none' (at the moment)"<<endl;
    os<<"#----param vector function options"<<endl;
    os<<"#--'nonparam': nonparameteric, with parameter estimated for each specified size bin"<<endl;
    os<<(*ptrFCs);

    os<<"#--Parameter information"<<endl;

    os<<"#----Functions info---------------"<<endl;
    os<<(*ptrPSFIs);

    os<<"#----Param vectors info---------------"<<endl;
    os<<(*ptrPVFIs);

    os<<"#----Fixed vectors info-----------------"<<endl;
    os<<(*ptrFVIs);
  }
  if (debug) cout<<"finished MoltToMaturity::write"<<endl;
}

///////////////////////////////////AnnualRecruitment/////////////////////////////////
int AnnualRecruitment::debug=1;
const adstring AnnualRecruitment::KEYWORD="annual_recruitment";

/**
 * Class constructor
 */
AnnualRecruitment::AnnualRecruitment(){
  if (debug) cout<<"starting AnnualRecruitment::AnnualRecruitment"<<endl;
  ptrFCs = nullptr;
  ptrVPFIs = nullptr;
  nFunctionTypes = 0;
  ptrVPVIs = nullptr;
  if (debug) cout<<"finished AnnualRecruitment::AnnualRecruitment"<<endl;
}

/**
 * Class destructor
 */
AnnualRecruitment::~AnnualRecruitment(){
  if (ptrFCs)   delete ptrFCs;   ptrFCs=nullptr;
  if (ptrVPFIs) delete ptrVPFIs; ptrVPFIs=nullptr;
  if (ptrVPVIs) delete ptrVPVIs; ptrVPVIs=nullptr;
}

/**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void AnnualRecruitment::read(cifstream & is){
  if (debug) ECHOSTR("starting AnnualRecruitment::read");
  adstring str;
  is>>str; gmacs::checkKeyWord(str,KEYWORD,"AnnualRecruitment::read");
//  if (debug) FactorCombinations::debug=1;
  if (ptrFCs) delete ptrFCs;
  ptrFCs = new FactorCombinations();
  is>>(*ptrFCs);
//  if (debug) FactorCombinations::debug=0;
  
  nFunctionTypes = ptrFCs->countType("var_function"); 
  if (debug) ECHOOBJ("nFunctionTypes = ",nFunctionTypes);
  if (ptrVPFIs) delete ptrVPFIs;
  ptrVPFIs = new VarParamFunctionsInfo();
  is>>(*ptrVPFIs);
  if (debug) {ECHOPTR("ptrVPFIs",ptrVPFIs);}
  
  if (ptrVPVIs) delete ptrVPVIs;
  ptrVPVIs = new VarParamsVariationInfo();
  is>>(*ptrVPVIs);
  if (debug) {ECHOPTR("ptrVPVIs",ptrVPVIs);}
  
  if (debug) ECHOSTR("finished AnnualRecruitment::read");
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void AnnualRecruitment::write(std::ostream & os){
  if (debug) cout<<"starting AnnualRecruitment::write"<<endl;
  os<<KEYWORD<<"       #--keyword-----------------------------------"<<endl;
  os<<"#--Factor combinations--------------"<<endl;
  os<<"#----Type options--------------"<<endl;
  os<<"# 'var_function': function with estimable parameters w/ variation (specified in 'var_functions' information section)"<<endl;
  os<<(*ptrFCs);
  
  os<<"#--Parameter info---------------"<<endl;
  
  os<<"#----var_functions info---------------"<<endl;
  os<<(*ptrVPFIs);
  
  os<<"#----var_params info---------------"<<endl;
  os<<(*ptrVPVIs);
  
  if (debug) cout<<"finished AnnualRecruitment::write"<<endl;
}

///////////////////////////////////RecruitmentAtSize/////////////////////////////////
int RecruitmentAtSize::debug=1;
const adstring RecruitmentAtSize::KEYWORD="recruitment_at_size";

/**
 * Class constructor
 */
RecruitmentAtSize::RecruitmentAtSize(){
  if (debug) cout<<"starting RecruitmentAtSize::RecruitmentAtSize"<<endl;
  ptrFCs = nullptr;
  ptrVPFIs = nullptr;
  nFunctionTypes = 0;
  ptrVPVIs = nullptr;
  if (debug) cout<<"finished RecruitmentAtSize::RecruitmentAtSize"<<endl;
}

/**
 * Class destructor
 */
RecruitmentAtSize::~RecruitmentAtSize(){
  if (ptrFCs)   delete ptrFCs;   ptrFCs=nullptr;
  if (ptrVPFIs) delete ptrVPFIs; ptrVPFIs=nullptr;
  if (ptrVPVIs) delete ptrVPVIs; ptrVPVIs=nullptr;
}

/**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void RecruitmentAtSize::read(cifstream & is){
  if (debug) cout<<"starting RecruitmentAtSize::read from '"<<is.get_file_name()<<"'"<<endl;
  adstring str;
  is>>str; gmacs::checkKeyWord(str,KEYWORD,"RecruitmentAtSize::read");
//  if (debug) FactorCombinations::debug=1;
  if (ptrFCs) delete ptrFCs;
  ptrFCs = new FactorCombinations();
  is>>(*ptrFCs);
//  if (debug) FactorCombinations::debug=0;
  
  nFunctionTypes = ptrFCs->countType("var_function"); 
  if (debug) cout<<"nFunctionTypes = "<<nFunctionTypes<<endl;
  if (ptrVPFIs) delete ptrVPFIs;
  ptrVPFIs = new VarParamFunctionsInfo();
  is>>(*ptrVPFIs);
  if (debug) cout<<(*ptrVPFIs)<<endl;
  
  if (ptrVPVIs) delete ptrVPVIs;
  ptrVPVIs = new VarParamsVariationInfo();
  is>>(*ptrVPVIs);
  if (debug) cout<<(*ptrVPVIs)<<endl;
  
  if (debug) cout<<"finished RecruitmentAtSize::read from '"<<is.get_file_name()<<"'"<<endl;
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void RecruitmentAtSize::write(std::ostream & os){
  if (debug) cout<<"starting RecruitmentAtSize::write"<<endl;
  os<<KEYWORD<<"       #--keyword-----------------------------------"<<endl;
  os<<"#--Factor combinations--------------"<<endl;
  os<<"#----Type options--------------"<<endl;
  os<<"# 'var_function': function with estimable parameters w/ variation (specified in 'var_functions' information section)"<<endl;
  os<<(*ptrFCs);
  
  os<<"#--Parameter info---------------"<<endl;
  
  os<<"#----var_functions info---------------"<<endl;
  os<<(*ptrVPFIs);
  
  os<<"#----var_params info---------------"<<endl;
  os<<(*ptrVPVIs);
  
  if (debug) cout<<"finished RecruitmentAtSize::write"<<endl;
}



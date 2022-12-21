/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/cppFiles/file.cc to edit this template
 */
#include "../include/ModelCTL.hpp"

///////////////////////////////////WeightAtSize/////////////////////////////////
int WeightAtSize::debug=0;
const adstring WeightAtSize::KEYWORD="WatZ";

/**
 * Class constructor
 */
WeightAtSize::WeightAtSize(){
  if (debug) cout<<"starting WeightAtSize::WeightAtSize"<<endl;
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
  is>>str; gmacs::checkKeyWord(str,KEYWORD,"WeightAtSize::read");
//  if (debug) FactorCombinations::debug=1;
  if (ptrFCs) delete ptrFCs;
  ptrFCs = new FactorCombinations();
  is>>(*ptrFCs);
//  if (debug) FactorCombinations::debug=0;
  
  nFunctionTypes = ptrFCs->countType("function"); 
  if (debug) cout<<"nFunctionTypes = "<<nFunctionTypes<<endl;
  if (ptrFIs) delete ptrFIs;
  ptrFIs = new StdParamFunctionsInfo();
  is>>(*ptrFIs);
  
  
  nVectorTypes = ptrFCs->countType("vector");
  if (debug) cout<<"nVectorTypes = "<<nVectorTypes<<endl;
  if (ptrVIs) delete ptrVIs;
  ptrVIs = new FixedVectorsInfo();
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
  os<<KEYWORD<<"       #keyword-----------------------------------"<<endl;
  os<<"#--Factor combinations--------------"<<endl;
  os<<"#----Type options--------------"<<endl;
  os<<"# 'function': input a, b parameters from W=a*L^b relationships (by region,sex, maturity, shell condition)"<<endl;
  os<<"# 'vector'   : input weight-at-size vector for size bins        (by region,sex, maturity, shell condition)"<<endl;
  os<<(*ptrFCs);
  
  os<<"#--Parameter info---------------"<<endl;
  
  os<<"#----Function info---------------"<<endl;
  os<<(*ptrFIs);
  
  os<<"#----Fixed vector info-----------------"<<endl;
  os<<(*ptrVIs);
  if (debug) cout<<"finished WeightAtSize::write"<<endl;
}

///////////////////////////////////NatMort/////////////////////////////////
int NatMort::debug=1;
const adstring NatMort::KEYWORD="natural_mortality";

/**
 * Class constructor
 */
NatMort::NatMort(){
  if (debug) cout<<"starting NatMort::NatMort"<<endl;
  ptrFCs = nullptr;
  ptrVPFIs = nullptr;
  nFunctionTypes = 0;
  ptrVPVIs = nullptr;
  if (debug) cout<<"finished NatMort::NatMort"<<endl;
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
  if (debug) cout<<"starting NatMort::read from '"<<is.get_file_name()<<"'"<<endl;
  adstring str;
  is>>str; gmacs::checkKeyWord(str,KEYWORD,"NatMort::read");
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
  ptrVPVIs = new AllVarParamsVariationInfo();
  is>>(*ptrVPVIs);
  if (debug) cout<<(*ptrVPVIs)<<endl;
  
  if (debug) cout<<"finished NatMort::read from '"<<is.get_file_name()<<"'"<<endl;
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
MoltProbability::MoltProbability(){
  if (debug) cout<<"starting MoltProbability::MoltProbability"<<endl;
  ptrFCs = nullptr;
  ptrFIs = nullptr;
  ptrVIs = nullptr;
  nFunctionTypes = 0;
  nVectorTypes = 0;
  if (debug) cout<<"finished MoltProbability::MoltProbability"<<endl;
}

/**
 * Class destructor
 */
MoltProbability::~MoltProbability(){
  if (ptrFCs) delete ptrFCs; ptrFCs=nullptr;
  if (ptrFIs) delete ptrFIs; ptrFIs=nullptr;
  if (ptrVIs) delete ptrVIs; ptrVIs=nullptr;
}

/**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void MoltProbability::read(cifstream & is){
  if (debug) cout<<"starting MoltProbability::read from '"<<is.get_file_name()<<"'"<<endl;
  adstring str;
  is>>str; gmacs::checkKeyWord(str,KEYWORD,"MoltProbability::read");
  
//  if (debug) FactorCombinations::debug=1;
  if (ptrFCs) delete ptrFCs;
  ptrFCs = new FactorCombinations();
  is>>(*ptrFCs);
//  if (debug) FactorCombinations::debug=0;

  nFunctionTypes = ptrFCs->countType("function"); 
  if (debug) cout<<"nFunctionTypes = "<<nFunctionTypes<<endl;
  if (ptrFIs) delete ptrFIs;
  ptrFIs = new StdParamFunctionsInfo();
  is>>(*ptrFIs);

  nVectorTypes = ptrFCs->countType("vector");
  if (debug) cout<<"nVectorTypes = "<<nVectorTypes<<endl;
  if (ptrVIs) delete ptrVIs;
  ptrVIs = new FixedVectorsInfo();
  is>>(*ptrVIs);
  
  if (debug) cout<<"finished MoltProbability::read from '"<<is.get_file_name()<<"'"<<endl;
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
  os<<"# 'function': function with estimable parameters (specified in the 'functions' information section)"<<endl;
  os<<"# 'vector'  : fixed weight-at-size vector        (specified in the 'fixed_vectors' information section)"<<endl;
  os<<(*ptrFCs);
  
  os<<"#--Parameter information"<<endl;
  
  os<<"#----Function info---------------"<<endl;
  os<<(*ptrFIs);
  
  os<<"#----Fixed vector info-----------------"<<endl;
  os<<(*ptrVIs);
  if (debug) cout<<"finished MoltProbability::write"<<endl;
}

///////////////////////////////////Growth/////////////////////////////////
int Growth::debug=1;
const adstring Growth::KEYWORD="growth";

/**
 * Class constructor
 */
Growth::Growth(){
  if (debug) cout<<"starting Growth::Growth"<<endl;
  ptrFCs = nullptr;
  ptrFIs = nullptr;
  ptrPMIs = nullptr;
  ptrFMIs = nullptr;
  nFunctionTypes = 0;
  nParamMatrixFunctionTypes = 0;
  nFixedMatrixTypes = 0;
  if (debug) cout<<"finished Growth::Growth"<<endl;
}

/**
 * Class destructor
 */
Growth::~Growth(){
  if (ptrFCs) delete ptrFCs; ptrFCs=nullptr;
  if (ptrFIs) delete ptrFIs; ptrFIs=nullptr;
  if (ptrPMIs) delete ptrPMIs; ptrPMIs=nullptr;
  if (ptrFMIs) delete ptrFMIs; ptrFMIs=nullptr;
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
  if (debug) cout<<(*ptrFCs)<<endl;

  nFunctionTypes = ptrFCs->countType("function"); 
  if (debug) cout<<"nFunctionTypes = "<<nFunctionTypes<<endl;
  if (ptrFIs) delete ptrFIs;
  ptrFIs = new StdParamFunctionsInfo();
  is>>(*ptrFIs);
  if (debug) cout<<(*ptrFIs)<<endl;

  nParamMatrixFunctionTypes = ptrFCs->countType("param_matrix");
  if (debug) cout<<"nParamMatrixTypes = "<<nParamMatrixFunctionTypes<<endl;
  if (ptrPMIs) delete ptrPMIs;
  ptrPMIs = new ParamMatrixFunctionsInfo();
  is>>(*ptrPMIs);
  if (debug) cout<<(*ptrPMIs)<<endl;
  
  nFixedMatrixTypes = ptrFCs->countType("fixed_matrix");
  if (debug) cout<<"nFixedMatrixTypes = "<<nFixedMatrixTypes<<endl;
  if (ptrFMIs) delete ptrFMIs;
  ptrFMIs = new FixedMatrixsInfo();
  is>>(*ptrFMIs);
  if (debug) cout<<(*ptrFMIs)<<endl;
  
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
  os<<(*ptrFIs);
  
  os<<"#----Param matrix info-----------------"<<endl;
  os<<(*ptrPMIs);
  
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
  ptrFCs = nullptr;
  ptrFIs = nullptr;
  ptrVIs = nullptr;
  nFunctionTypes = 0;
  nVectorTypes = 0;
  if (debug) cout<<"finished MoltToMaturity::MoltToMaturity"<<endl;
}

/**
 * Class destructor
 */
MoltToMaturity::~MoltToMaturity(){
  if (ptrFCs) delete ptrFCs; ptrFCs=nullptr;
  if (ptrFIs) delete ptrFIs; ptrFIs=nullptr;
  if (ptrVIs) delete ptrVIs; ptrVIs=nullptr;
}

/**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void MoltToMaturity::read(cifstream & is){
  if (debug) cout<<"starting MoltToMaturity::read from '"<<is.get_file_name()<<"'"<<endl;
  adstring str;
  is>>str; gmacs::checkKeyWord(str,KEYWORD,"MoltToMaturity::read");
  is>>str; hasTM = gmacs::isTrue(str);
  if (debug) cout<<"has terminal molt: "<<hasTM<<endl;
  if (hasTM){
  //  if (debug) FactorCombinations::debug=1;
    if (ptrFCs) delete ptrFCs;
    ptrFCs = new FactorCombinations();
    is>>(*ptrFCs);
    if (debug) cout<<(*ptrFCs)<<endl;

    nFunctionTypes = ptrFCs->countType("function"); 
    if (debug) cout<<"nFunctionTypes = "<<nFunctionTypes<<endl;
    if (ptrFIs) delete ptrFIs;
    ptrFIs = new StdParamFunctionsInfo();
    is>>(*ptrFIs);
    if (debug) cout<<(*ptrFIs)<<endl;

    nVectorTypes = ptrFCs->countType("vector");
    if (debug) cout<<"nVectorTypes = "<<nVectorTypes<<endl;
    if (ptrVIs) delete ptrVIs;
    ptrVIs = new FixedVectorsInfo();
    is>>(*ptrVIs);
    if (debug) cout<<(*ptrVIs)<<endl;
  }
  
  if (debug) cout<<"finished MoltToMaturity::read from '"<<is.get_file_name()<<"'"<<endl;
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
    os<<"# 'function': function with estimable parameters (specified in the 'functions' information section)"<<endl;
    os<<"# 'vector'  : fixed weight-at-size vector        (specified in the 'fixed_vectors' information section)"<<endl;
    os<<(*ptrFCs);

    os<<"#--Parameter information"<<endl;

    os<<"#----Function info---------------"<<endl;
    os<<(*ptrFIs);

    os<<"#----Fixed vector info-----------------"<<endl;
    os<<(*ptrVIs);
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
  if (debug) cout<<"starting AnnualRecruitment::read from '"<<is.get_file_name()<<"'"<<endl;
  adstring str;
  is>>str; gmacs::checkKeyWord(str,KEYWORD,"AnnualRecruitment::read");
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
  ptrVPVIs = new AllVarParamsVariationInfo();
  is>>(*ptrVPVIs);
  if (debug) cout<<(*ptrVPVIs)<<endl;
  
  if (debug) cout<<"finished AnnualRecruitment::read from '"<<is.get_file_name()<<"'"<<endl;
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
  ptrVPVIs = new AllVarParamsVariationInfo();
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

///////////////////////////////////ModelCTL/////////////////////////////////////
int ModelCTL::debug = 1;
/* model ctl file version */
const adstring ModelCTL::version = "2022.11.29";

/**
 * Class constructor
 */
ModelCTL::ModelCTL(){
  if (debug) cout<<"starting ModelCTL::ModelCTL"<<endl;
  ptrWatZ = nullptr;
  ptrNM   = nullptr;
  ptrMP   = nullptr;
  ptrM2M  = nullptr;
  ptrGrw  = nullptr;
  ptrAnnRec = nullptr;
  ptrRecAtZ = nullptr;
  if (debug) cout<<"finished ModelCTL::ModelCTL"<<endl;
}

/**
 * Class destructor
 */
ModelCTL::~ModelCTL(){
  if (ptrWatZ) delete ptrWatZ; ptrWatZ = nullptr;
  if (ptrNM)   delete ptrNM;   ptrNM   = nullptr;
  if (ptrMP)   delete ptrMP;   ptrMP   = nullptr;
  if (ptrM2M)  delete ptrM2M;  ptrM2M  = nullptr;
  if (ptrGrw)  delete ptrGrw;  ptrGrw  = nullptr;
  if (ptrAnnRec)  delete ptrAnnRec;  ptrAnnRec  = nullptr;
  if (ptrRecAtZ)  delete ptrRecAtZ;  ptrRecAtZ  = nullptr;
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
  if (debug) cout<<"\n\n--ModelCTL::read: creating and reading WeightAtSize object"<<endl;
  ptrWatZ = new WeightAtSize();
  is>>(*ptrWatZ);
//  if (debug) WeightAtSize::debug = 0;
//  if (debug) NatMort::debug = 1;
  if (debug) cout<<"\n\n--ModelCTL::read: creating and reading NatMort object"<<endl;
  ptrNM = new NatMort();
  is>>(*ptrNM);
//  if (debug) NatMort::debug = 0;
  if (debug) cout<<"\n\n--ModelCTL::read: creating and reading MoltProbability object"<<endl;
  ptrMP = new MoltProbability();
  is>>(*ptrMP);
  if (debug) cout<<"\n\n--ModelCTL::read: creating and reading MoltToMaturity object"<<endl;
  ptrM2M = new MoltToMaturity();
  is>>(*ptrM2M);
  if (debug) cout<<"\n\n--ModelCTL::read: creating and reading Growth object"<<endl;
  ptrGrw = new Growth();
  is>>(*ptrGrw);
  if (debug) cout<<"\n\n--ModelCTL::read: creating and reading AnnualRecruitment object"<<endl;
  ptrAnnRec = new AnnualRecruitment();
  is>>(*ptrAnnRec);
  if (debug) cout<<"\n\n--ModelCTL::read: creating and reading RecruitmentAtSize object"<<endl;
  ptrRecAtZ = new RecruitmentAtSize();
  is>>(*ptrRecAtZ);
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
  os<<(*ptrNM)<<endl;
  os<<(*ptrMP)<<endl;
  os<<(*ptrM2M)<<endl;
  os<<(*ptrGrw)<<endl;
  os<<(*ptrAnnRec)<<endl;
  os<<(*ptrRecAtZ)<<endl;
  if (debug) cout<<"finished ModelCTL::write"<<endl;
}


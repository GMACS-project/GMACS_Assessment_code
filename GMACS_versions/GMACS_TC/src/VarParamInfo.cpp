/**
 * VarParamInfo.cpp
 * 
 * author: William Stockhausen
 */
#include "../include/VarParamInfo.hpp"

///////////////////////////////////VarParamFunctionInfo/////////////////////////
/* flag to print debugging info */
int VarParamFunctionInfo::debug = 0;

/**
 * Constructor
 */
VarParamFunctionInfo::VarParamFunctionInfo(int fc_,adstring& function_,adstring& param_){
  if (debug) cout<<"starting VarParamFunctionInfo::VarParamFunctionInfo("<<fc_<<","<<function_<<","<<param_<<")"<<endl;
  fc = fc_;
  s_function = function_;
  s_param = param_;
  ptrPI = nullptr;
  if (debug) cout<<"finished VarParamFunctionInfo::VarParamFunctionInfo("<<fc_<<","<<function_<<","<<param_<<")"<<endl;
}
/**
 * Destructor
 */
VarParamFunctionInfo::~VarParamFunctionInfo(){
  delete ptrPI; ptrPI = nullptr;
}
 /**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void VarParamFunctionInfo::read(cifstream & is){
  if (debug) cout<<"starting VarParamFunctionInfo::read"<<endl;
  is>>mir;
  if (mir==0){
    is>>s_RV;
    is>>s_TV;
    is>>s_ZV;
    is>>nECs;
    if (nECs>0){
      sa_ECs.allocate(0,nECs-1);
      is>>sa_ECs;
    } else {
      adstring dummy; is>>dummy;
    }
    ptrPI = new BasicParamInfo();
    is>>(*ptrPI);
  }
  if (debug) cout<<"finished VarParamFunctionInfo::read"<<endl;
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void VarParamFunctionInfo::write(std::ostream & os){
  if (debug) cout<<"starting VarParamFunctionInfo::write"<<endl;
  os<<fc<<"  "<<s_function<<"  "<<s_param<<"  "<<mir<<"  ";
  if (mir==0){
    os<<s_RV<<"  "<<s_TV<<"  "<<s_ZV<<"  "<<nECs<<"  ";
    if (nECs>0) 
      for (int i=sa_ECs.indexmin();i<=sa_ECs.indexmax();i++)
        os<<sa_ECs(i)<<"  ";
    else os<<"none"<<"  ";
    os<<(*ptrPI);
  } else {
    os<<"#--mirrors "<<s_param<<" in fc "<<mir;
  }
  if (debug) cout<<endl<<"finished VarParamFunctionInfo::write"<<endl;
}

///////////////////////////////////VarParamFunctionsInfo////////////////////////////
/* flag to print debugging info */
int VarParamFunctionsInfo::debug = 0;
/* key word identifying start of section */
const adstring VarParamFunctionsInfo::KEYWORD = "var_functions";
/** 
 * Class constructor
 */
VarParamFunctionsInfo::VarParamFunctionsInfo(){
  
}
/** 
 * Class destructor
 */
VarParamFunctionsInfo::~VarParamFunctionsInfo(){
  for (std::map<MultiKey,VarParamFunctionInfo*>::iterator it=mapFIs.begin(); it!=mapFIs.end(); ++it) {
    if (debug) cout<<(it->first)<<endl;
    delete it->second; it->second = nullptr;
  }
}
 /**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void VarParamFunctionsInfo::read(cifstream & is){
  if (debug) cout<<"starting VarParamFunctionsInfo::read"<<endl;
  adstring kw_;
  is>>kw_; gmacs::checkKeyWord(kw_,KEYWORD,"VarParamFunctionsInfo::read");
  mapFIs.clear();
  int fc_; adstring fcn_; adstring param_;
  is>>fc_; if (debug) cout<<"fc_ = "<<fc_<<"  ";
  while (fc_>0){
    is>>fcn_;    if (debug)cout<<"fcn_ = "<<fcn_<<"  ";
    is>>param_;  if (debug)cout<<"param_ = "<<param_<<endl;
    VarParamFunctionInfo* p = new VarParamFunctionInfo(fc_,fcn_,param_);
    is>>(*p);
    if (debug) cout<<(*p)<<endl;
    MultiKey* mk = new MultiKey(gmacs::asa3(str(fc_),fcn_,param_));
    mapFIs[(*mk)] = p;
    is>>fc_; if (debug)cout<<"fc_ = "<<fc_<<"  ";
  }  
  if (debug) cout<<endl;
  if (debug) cout<<"finished VarParamFunctionsInfo::read"<<endl;
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void VarParamFunctionsInfo::write(std::ostream & os){
  if (debug) cout<<"starting VarParamFunctionsInfo::write"<<endl;
  os<<KEYWORD<<"  #--information type"<<endl;
  os<<"#fc function  param  mir  reg_var time_var size_var  numECs  ECs    ival    lb   ub   phz  jtr?  prior   p1    p2"<<endl;
  if (debug) cout<<"number of rows defining functions: "<<mapFIs.size()<<endl;
  for (std::map<MultiKey,VarParamFunctionInfo*>::iterator it=mapFIs.begin(); it!=mapFIs.end(); ++it) {
    if (debug) cout<<(it->first)<<endl;
    os<<(*(it->second))<<endl;
  }
  os<<EOF<<"   #--end of var_functions information section"<<endl;
  if (debug) cout<<"finished VarParamFunctionsInfo::write"<<endl;
}

///////////////////////////////////VarParamTypeInfo////////////////////////////
/* flag to print debugging info */
int VarParamTypeInfo::debug = 0;
/**
 * Class constructor
 * 
 * @param id_ - variation id
 * @param param_ - parameter name
 */
VarParamTypeInfo::VarParamTypeInfo(int id_,adstring param_){
  var_id = id_;
  s_param = param_;
}
/** 
 * Class destructor
 */
VarParamTypeInfo::~VarParamTypeInfo(){
}
 /**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void VarParamTypeInfo::read(cifstream & is){
  if (debug) cout<<"starting VarParamTypeInfo::read"<<endl;
  if (debug) cout<<"#var_id  param  type  constraint  value"<<endl;
  if (debug) cout<<var_id<<"  "<<s_param<<"  ";
  is>>s_var_type; if (debug) cout<<s_var_type<<"  ";
  is>>constraint; if (debug) cout<<constraint<<"  ";
  is>>value;      if (debug) cout<<value<<"  ";
  if (debug) cout<<endl<<"finished VarParamTypeInfo::read"<<endl;
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void VarParamTypeInfo::write(std::ostream & os){
  if (debug) cout<<"starting VarParamTypeInfo::write"<<endl;
  os<<var_id<<"  "<<s_param<<"  "<<s_var_type<<"  "<<constraint<<"  "<<value;
  if (debug) cout<<endl<<"finished VarParamTypeInfo::write"<<endl;
}

///////////////////////////////////VarParamTypesInfo////////////////////////////
/* flag to print debugging info */
int VarParamTypesInfo::debug = 0;
/** 
 * Class constructor
 */
VarParamTypesInfo::VarParamTypesInfo(adstring& type_){
  type = type_;
}
/** 
 * Class destructor
 */
VarParamTypesInfo::~VarParamTypesInfo(){
  for (std::map<MultiKey,VarParamTypeInfo*>::iterator it=mapPTIs.begin(); it!=mapPTIs.end(); ++it) {
    if (debug) cout<<(it->first)<<endl;
    delete it->second; it->second = nullptr;
  }
}
 /**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void VarParamTypesInfo::read(cifstream & is){
  if (debug) cout<<"starting VarParamTypesInfo::read for "<<type<<endl;
  int id_; adstring param_; adstring var_idx_;
  is>>id_;            if (debug) cout<<"id_      = "<<id_<<"  ";
  while (id_>0){
    is>>param_;       if (debug) cout<<"param_   = "<<param_<<endl;
    VarParamTypeInfo* p = new VarParamTypeInfo(id_,param_);
    is>>(*p);         if (debug) cout<<(*p)<<endl;
    MultiKey* mk = new MultiKey(gmacs::asa2(str(id_),param_));
    mapPTIs[(*mk)] = p;
    is>>id_; if (debug) cout<<"id_      = "<<id_<<"  ";
  }  
  if (debug) cout<<endl<<"finished VarParamTypesInfo::read for "<<type<<endl;
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void VarParamTypesInfo::write(std::ostream & os){
  if (debug) cout<<"starting VarParamTypesInfo::write"<<endl;
  os<<"#var_id  param  type  constraint  value"<<endl;
  for (std::map<MultiKey,VarParamTypeInfo*>::iterator it=mapPTIs.begin(); it!=mapPTIs.end(); ++it) {
    if (debug) cout<<(it->first)<<endl;
    os<<(*(it->second))<<endl;
  }
  os<<EOF<<"  #--EOI for "<<type<<"_vars variation types info";
  if (debug) cout<<endl<<"finished VarParamTypesInfo::write"<<endl;
}

///////////////////////////////////VarParamInfo////////////////////////////
/* flag to print debugging info */
int VarParamInfo::debug = 0;

/**
 * Class constructor
 * 
 * @param id_ - variation id
 * @param s_param - parameter name
 * @param var_idx_ - variation index value
 */
VarParamInfo::VarParamInfo(int id_,adstring& param_,adstring& var_idx_):BasicParamInfo(){
  var_id = id_;
  s_param = param_;
  s_var_idx = var_idx_;
}
/**
 * Destructor
 */
VarParamInfo::~VarParamInfo(){}
 /**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void VarParamInfo::read(cifstream & is){
  if (debug) cout<<"starting VarParamInfo::read"<<endl;
  is>>(*((BasicParamInfo*) (this)));//read BasicParamInfo elements
  if (debug) cout<<"finished VarParamInfo::read"<<endl;
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void VarParamInfo::write(std::ostream & os){
  if (debug) cout<<"starting VarParamInfo::write"<<endl;
  os<<var_id<<"  "<<s_param<<"  "<<s_var_idx<<"  ";
  os<<(*(BasicParamInfo*) (this));//write StdParamInfo elements;
  if (debug) cout<<"finished VarParamInfo::write"<<endl;
}

///////////////////////////////////VarParamsInfo////////////////////////////
/* flag to print debugging info */
int VarParamsInfo::debug = 1;
/**
 * Constructor
 */
VarParamsInfo::VarParamsInfo(adstring& type_){
  type = type_;
}
/**
 * Destructor
 */
VarParamsInfo::~VarParamsInfo(){
  for (std::map<MultiKey,VarParamInfo*>::iterator it=mapPIs.begin(); it!=mapPIs.end(); ++it) {
    if (debug) cout<<(it->first)<<endl;
    delete it->second; it->second = nullptr;
  }
}
 /**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void VarParamsInfo::read(cifstream & is){
  if (debug) cout<<"starting VarParamsInfo::read"<<endl;
  int id_; adstring param_; adstring var_idx_;
  is>>id_; if (debug) cout<<"id_      = "<<id_<<"  ";
  while (id_>0){
    is>>param_;       cout<<"param_   = "<<param_<<"  ";
    is>>var_idx_;     cout<<"var_idx_ = "<<var_idx_<<endl;
    VarParamInfo* p = new VarParamInfo(id_,param_,var_idx_);
    is>>(*p);
    if (debug) cout<<(*p)<<endl;
    MultiKey* mk = new MultiKey(gmacs::asa3(str(id_),param_,var_idx_));
    mapPIs[(*mk)] = p;
    is>>id_; if (debug) cout<<"id_      = "<<id_<<"  ";
  }  
  if (debug) cout<<endl<<"finished VarParamsInfo::read"<<endl;
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void VarParamsInfo::write(std::ostream & os){
  if (debug) cout<<"starting VarParamsInfo::write"<<endl;
  os<<"#var_id  param  "<<type<<"  ival    lb   ub   phz  jtr?  prior   p1    p2"<<endl;
  for (std::map<MultiKey,VarParamInfo*>::iterator it=mapPIs.begin(); it!=mapPIs.end(); ++it) {
    if (debug) cout<<(it->first)<<endl;
    os<<(*(it->second))<<endl;
  }
  os<<EOF<<"  #--EOI for "<<type<<"_vars variation parameters info";
  if (debug) cout<<endl<<"finished VarParamsInfo::write"<<endl;
}

//////////////////////////////VarParamsCombinedInfo//////////////////////////
/* flag to print debugging info */
int VarParamsCombinedInfo::debug = 0;
/* key word identifying information section */
const adstring VarParamsCombinedInfo::KEYWORD = "_vars";
/** 
 * Class constructor
 */
VarParamsCombinedInfo::VarParamsCombinedInfo(adstring& label_){
  if (debug) cout<<"Starting VarParamsCombinedInfo::VarParamsCombinedInfo for "<<label_<<endl;
  label = label_;
  ptrPTIs = nullptr;
  ptrPIs  = nullptr;
  if (debug) cout<<"Finished VarParamsCombinedInfo::VarParamsCombinedInfo for "<<label<<endl;
}
/** 
 * Class destructor
 */
VarParamsCombinedInfo::~VarParamsCombinedInfo(){
  if (debug) cout<<"Starting VarParamsCombinedInfo::~VarParamsCombinedInfo"<<endl;
  delete ptrPTIs; ptrPTIs = nullptr;
  delete ptrPIs;  ptrPIs  = nullptr;
  if (debug) cout<<"Finished VarParamsCombinedInfo::~VarParamsCombinedInfo"<<endl;
}
 /**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void VarParamsCombinedInfo::read(cifstream & is){
  if (debug) cout<<"Starting VarParamsCombinedInfo::read for "<<label<<endl;
  if (ptrPTIs) delete ptrPTIs;
  ptrPTIs = new VarParamTypesInfo(label);
  is>>(*ptrPTIs); if (debug) cout<<(*ptrPTIs)<<endl;
  if (ptrPIs) delete ptrPIs;
  ptrPIs = new VarParamsInfo(label);
  is>>(*ptrPIs);  if (debug) cout<<(*ptrPIs)<<endl;
  int tmp;
  is>>tmp; if (debug) cout<<"EOF = "<<tmp<<endl; //--should be EOL
  if (tmp!=EOF){
    cout<<"Apparent error reading combined parameter variation information for "<<label+KEYWORD<<"."<<endl;
    cout<<"Expected "<<EOF<<" but got "<<tmp<<endl;
    cout<<"Check ctl file."<<endl;
    exit(-1);
  }
  if (debug) cout<<"Finished VarParamsCombinedInfo::read for "<<label<<endl;
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void VarParamsCombinedInfo::write(std::ostream & os){
  if (debug) cout<<"Starting VarParamsCombinedInfo::write"<<endl;
  os<<label+KEYWORD<<"  #--parameter variation information type"<<endl;
  os<<(*ptrPTIs)<<endl;
  os<<(*ptrPIs)<<endl;
  os<<EOF<<"  #--EOI for parameter variation information";
  if (debug) cout<<endl<<"Finished VarParamsCombinedInfo::write"<<endl;
}

//////////////////////////////AllVarParamTypesInfo//////////////////////////
/* flag to print debugging info */
int AllVarParamsVariationInfo::debug = 0;
/* key word identifying information section */
const adstring AllVarParamsVariationInfo::KEYWORD = "var_params";
/** 
 * Class constructor
 */
AllVarParamsVariationInfo::AllVarParamsVariationInfo(){
  if (debug) cout<<"Starting AllVarParamsVariationInfo::AllVarParamsVariationInfo"<<endl;
  ptrRVs = nullptr;
  ptrTVs = nullptr;
  ptrZVs = nullptr;
  ptrECs = nullptr;
  if (debug) cout<<"Finished AllVarParamsVariationInfo::AllVarParamsVariationInfo"<<endl;
}
/** 
 * Class destructor
 */
AllVarParamsVariationInfo::~AllVarParamsVariationInfo(){
  if (debug) cout<<"Starting AllVarParamsVariationInfo::~AllVarParamsVariationInfo"<<endl;
  delete ptrRVs; ptrRVs = nullptr;
  delete ptrTVs; ptrTVs = nullptr;
  delete ptrZVs; ptrZVs = nullptr;
  delete ptrECs; ptrECs = nullptr;
  if (debug) cout<<"Finished AllVarParamsVariationInfo::~AllVarParamsVariationInfo"<<endl;
}
 /**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void AllVarParamsVariationInfo::read(cifstream & is){
  if (debug) cout<<"Starting AllVarParamsVariationInfo::read"<<endl;
  adstring kw_; adstring type_;
  is>>kw_; gmacs::checkKeyWord(kw_,KEYWORD,"AllVarParamTypesInfo::read");
  is>>kw_; if (debug) cout<<"kw_ = "<<kw_<<endl;
  while (true){
    if (kw_=="region_vars") {
      if (ptrRVs) delete ptrRVs;
      type_ = "region";
      ptrRVs = new VarParamsCombinedInfo(type_);
      is>>(*ptrRVs);
      if (debug) cout<<(*ptrRVs)<<endl;
    } else if (kw_=="time_vars"){
      if (ptrTVs) delete ptrTVs;
      type_ = "time";
      ptrTVs = new VarParamsCombinedInfo(type_);
      is>>(*ptrTVs);
      if (debug) cout<<(*ptrTVs)<<endl;
    } else if (kw_=="size_vars") {
      if (ptrZVs) delete ptrZVs;
      type_ = "size";
      ptrZVs = new VarParamsCombinedInfo(type_);
      is>>(*ptrZVs);
      if (debug) cout<<(*ptrZVs)<<endl;
    } else if (kw_=="EC_vars") {
      if (ptrECs) delete ptrECs;
      type_ = "EC";
      ptrECs = new VarParamsCombinedInfo(type_);
      is>>(*ptrECs);
      if (debug) cout<<(*ptrECs)<<endl;
    } else {
      break;
    }      
    is>>kw_; if (debug) cout<<"kw_ = "<<kw_<<endl;
  }
  if (debug) cout<<"Finished AllVarParamsVariationInfo::read"<<endl;
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void AllVarParamsVariationInfo::write(std::ostream & os){
  if (debug) cout<<"Starting AllVarParamsVariationInfo::write"<<endl;
  os<<"#----parameter variation information "<<endl;
  os<<KEYWORD<<"  #--information type"<<endl;
  os<<"## Variation types:                                                                      ##"<<endl;
  os<<"##       RW = Random walk (deviates constrained by variance in M)                        ##"<<endl;
  os<<"##       CS = Cubic Spline (deviates constrained by nodes & node-placement)              ##"<<endl;

  if (ptrRVs) os<<(*ptrRVs)<<endl;
  if (ptrTVs) os<<(*ptrTVs)<<endl;
  if (ptrZVs) os<<(*ptrZVs)<<endl;
  if (ptrECs) os<<(*ptrECs)<<endl;
  os<<EOF<<"  #--EOI for all "<<KEYWORD<<" (all parameter variation)";
  if (debug) cout<<endl<<"Finished AllVarParamsVariationInfo::write"<<endl;
}




/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/cppFiles/file.cc to edit this template
 */
#include "../include/ModelCTL.hpp"

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
  if (ptrAnnRec) delete ptrAnnRec;  ptrAnnRec  = nullptr;
  if (ptrRecAtZ) delete ptrRecAtZ;  ptrRecAtZ  = nullptr;
}
/**
 * Calculate number of parameters
 * 
 * @return - (int) number of parameters
 */
int ModelCTL::calcNumParams(){
  int n = 0;
  if (ptrWatZ)   n += ptrWatZ->calcNumParams();
//  if (ptrNM)     n += ptrNM->calcNumParams();
  if (ptrMP)     n += ptrMP->calcNumParams();
  if (ptrM2M)    n += ptrM2M->calcNumParams();
  if (ptrGrw)    n += ptrGrw->calcNumParams();
//  if (ptrAnnRec) n += ptrAnnRec->calcNumParams();
//  if (ptrRecAtZ) n += ptrRecAtZ->calcNumParams();
  return n;
}
/**
 * For each parameter, set the index of the corresponding gmacs 
 * parameter, including mirrored parameters
 * 
 * @return (int) the index associated with the last parameter
 * 
 * @details The returned value should be equal to the number of 
 * non-mirrored parameters.
 */
int ModelCTL::setParamIndices(){
  //must follow the order of evaluation in calcILUPJs
  int idx=0;
  if (ptrWatZ) idx = ptrWatZ->setParamIndices(idx);    
//  if (ptrNM) idx = ???   
  if (ptrMP)  idx = ptrMP->setParamIndices(idx);    
  if (ptrM2M) idx = ptrM2M->setParamIndices(idx);    
  if (ptrGrw) idx = ptrGrw->setParamIndices(idx);    
//  if (ptrAnnRec) idx = ???
//  if (ptrRecAtZ) idx = ???    
  return idx;  
}
/**
 * Utility function to copy matrix of initial value, lower bound, upper bound, phase, 
 * and jitter flag for all parameters in an object to a summary matrix
 * 
 * @param ctr - row counter for summary matrix
 * @param ptr - pointer to object to extract ILUJPs matrix from
 * @param dm - matrix to copy the extracted matrix into
 * 
 * @return - (int) the last row of dm written to
 */
int ModelCTL::extractILUPJs(int ctr,AllParamsInfo* ptr,dmatrix& dm){
  if (ptr){
    dmatrix dm1 = ptr->calcILUPJs();    
    for (int r=dm1.indexmin();r<=dm1.indexmax();r++) dm(++ctr) = dm1(r);
  }
  return ctr;
}
/**
 * Create a matrix with initial value, lower bound, upper bound, phase, and jitter flag 
 * for all parameters.
 * 
 * @return - dmatrix with initial value, lower bound, upper bound, phase, 
 * and jitter flag for all parameters
 */
dmatrix ModelCTL::calcILUPJs(){
  int n = calcNumParams();
  dmatrix dm(1,n,1,5); int ctr = 0;
  if (ptrWatZ) ctr = extractILUPJs(ctr,ptrWatZ,dm);    
//  if (ptrNM) ctr = extractILUPJs(ctr,ptrNM,dm);    
  if (ptrMP) ctr = extractILUPJs(ctr,ptrMP,dm);    
  if (ptrM2M) ctr = extractILUPJs(ctr,ptrM2M,dm);    
  if (ptrGrw) ctr = extractILUPJs(ctr,ptrGrw,dm);    
//  if (ptrAnnRec) ctr = extractILUPJs(ctr,ptrAnnRec,dm);    
//  if (ptrRecAtZ) ctr = extractILUPJs(ctr,ptrRecAtZ,dm);    
  return dm;  
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


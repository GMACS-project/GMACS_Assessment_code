/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/cppFiles/file.cc to edit this template
 */

#include "../include/FixedQuantitiesInfo.hpp"

///////////////////////////////////FixedVectorInfo////////////////////////////
/* flag to print debugging info */
int FixedVectorInfo::debug = 1;

/**
 * Constructor
 */
FixedVectorInfo::FixedVectorInfo(int fc_,adstring& alsZB_){
  fc = fc_;
  alsZB = alsZB_;
}
/**
 * Destructor
 */
FixedVectorInfo::~FixedVectorInfo(){}
 /**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void FixedVectorInfo::read(cifstream & is){
  if (debug) cout<<"starting FixedVectorInfo::read"<<endl;
  if (debug) cout<<"fc = "<<fc<<".  alias = "<<alsZB<<endl;
  values.deallocate();
  if (debug) cout<<"deallocated vector. "<<endl;
  SizeBlock* ptrZB = ModelConfiguration::getInstance()->getSizeBlock(alsZB);
  if (debug) cout<<"SizeBlock "<<ptrZB<<": "<<ptrZB->pIB->mdv<<endl;
  if (debug) cout<<"index min: "<<ptrZB->pIB->iv.indexmin()<<". index max: "<<ptrZB->pIB->iv.indexmax()<<endl;
  values.allocate(ptrZB->pIB->iv.indexmin(),ptrZB->pIB->iv.indexmax());
  is>>values;
  if (debug) cout<<"values: "<<values<<endl;
  if (debug) cout<<"finished FixedVectorInfo::read"<<endl;
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void FixedVectorInfo::write(std::ostream & os){
  if (debug) cout<<"starting FixedVectorInfo::write"<<endl;
  SizeBlock* ptrZB = ModelConfiguration::getInstance()->getSizeBlock(alsZB);
  os<<"#fc  size_block  zBs: "<<gmacs::getMidpoints(ptrZB->pIB->getValues())<<endl;
  os<<fc<<"  ";
  os<<alsZB<<"  ";
  os<<values;
  if (debug) cout<<"finished FixedVectorInfo::write"<<endl;
}
///////////////////////////////////FixedVectorsInfo////////////////////////////
/* flag to print debugging info */
int FixedVectorsInfo::debug = 1;
const adstring FixedVectorsInfo::KEYWORD = "fixed_vectors";
/** 
 * Class constructor
 */
FixedVectorsInfo::FixedVectorsInfo(){
  
}
/** 
 * Class destructor
 */
FixedVectorsInfo::~FixedVectorsInfo(){
  
}
 /**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void FixedVectorsInfo::read(cifstream & is){
  if (debug) cout<<"starting FixedVectorsInfo::read"<<endl;
  adstring kw_;
  is>>kw_; gmacs::checkKeyWord(kw_,KEYWORD,"");
  int fc_; adstring alsZB_; 
  is>>fc_;
  while (fc_>0){
    is>>alsZB_;
    FixedVectorInfo* p = new FixedVectorInfo(fc_,alsZB_);
    is>>(*p);
    if (debug) cout<<(*p)<<endl;
    mapVIs[fc_] = p;
    is>>fc_;
  }  
  if (debug) cout<<"finished FixedVectorsInfo::read"<<endl;
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void FixedVectorsInfo::write(std::ostream & os){
  if (debug) cout<<"starting FixedVectorsInfo::write"<<endl;
  os<<KEYWORD<<"  #--information type"<<endl;
  os<<"#fc size_block zBs:"<<endl;
  if (debug) cout<<"number of rows defining functions: "<<mapVIs.size()<<endl;
  for (std::map<int,FixedVectorInfo*>::iterator it=mapVIs.begin(); it!=mapVIs.end(); ++it) {
    if (debug) cout<<(it->first)<<endl;
    os<<(*(it->second))<<endl;
  }
  os<<EOF<<"  #--end of vector information type"<<endl;
  if (debug) cout<<"finished FixedVectorsInfo::write"<<endl;
}

///////////////////////////////////FixedMatrixInfo////////////////////////////
/* flag to print debugging info */
int FixedMatrixInfo::debug = 1;

/**
 * Constructor
 */
FixedMatrixInfo::FixedMatrixInfo(int fc_,double zB_,adstring& alsZB_){
  fc = fc_;
  zB = zB_;
  alsZB = alsZB_;
}
/**
 * Destructor
 */
FixedMatrixInfo::~FixedMatrixInfo(){}
 /**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void FixedMatrixInfo::read(cifstream & is){
  if (debug) cout<<"starting FixedMatrixInfo::read"<<endl;
  if (debug) cout<<"fc = "<<fc<<".  alias = "<<alsZB<<endl;
  values.deallocate();
  if (debug) cout<<"deallocated vector. "<<endl;
  SizeBlock* ptrZB = ModelConfiguration::getInstance()->getSizeBlock(alsZB);
  if (debug) cout<<"SizeBlock "<<ptrZB<<": "<<ptrZB->pIB->mdv<<endl;
  if (debug) cout<<"index min: "<<ptrZB->pIB->iv.indexmin()<<". index max: "<<ptrZB->pIB->iv.indexmax()<<endl;
  values.allocate(ptrZB->pIB->iv.indexmin(),ptrZB->pIB->iv.indexmax());
  is>>values;
  if (debug) cout<<"values: "<<values<<endl;
  if (debug) cout<<"finished FixedMatrixInfo::read"<<endl;
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void FixedMatrixInfo::write(std::ostream & os){
  if (debug) cout<<"starting FixedMatrixInfo::write"<<endl;
  SizeBlock* ptrZB = ModelConfiguration::getInstance()->getSizeBlock(alsZB);
  os<<"#fc  zB   size_block  zBs: "<<gmacs::getMidpoints(ptrZB->pIB->getValues())<<endl;
  os<<fc<<"  ";
  os<<zB<<"  ";
  os<<alsZB<<"  ";
  os<<values;
  if (debug) cout<<"finished FixedMatrixInfo::write"<<endl;
}
///////////////////////////////////FixedMatrixsInfo////////////////////////////
/* flag to print debugging info */
int FixedMatrixsInfo::debug = 1;
const adstring FixedMatrixsInfo::KEYWORD = "fixed_matrices";
/** 
 * Class constructor
 */
FixedMatrixsInfo::FixedMatrixsInfo(){
  
}
/** 
 * Class destructor
 */
FixedMatrixsInfo::~FixedMatrixsInfo(){
  
}
 /**
 * Read object from input stream in ADMB format.
 * 
 * @param is - file input stream
 */
void FixedMatrixsInfo::read(cifstream & is){
  if (debug) cout<<"starting FixedMatrixsInfo::read"<<endl;
  adstring kw_;
  is>>kw_; gmacs::checkKeyWord(kw_,KEYWORD,"");
  int fc_; double zB_; adstring alsZB_;
  is>>fc_;
  while (fc_>0){
    is>>zB_;
    is>>alsZB_;
    FixedMatrixInfo* p = new FixedMatrixInfo(fc_,zB_,alsZB_);
    is>>(*p);
    if (debug) cout<<(*p)<<endl;
    mapMIs[fc_] = p;
    is>>fc_;
  }  
  if (debug) cout<<"finished FixedMatrixsInfo::read"<<endl;
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void FixedMatrixsInfo::write(std::ostream & os){
  if (debug) cout<<"starting FixedMatrixsInfo::write"<<endl;
  os<<KEYWORD<<"  #--information type"<<endl;
  os<<"#fc size_block zBs:"<<endl;
  if (debug) cout<<"number of rows defining functions: "<<mapMIs.size()<<endl;
  for (std::map<int,FixedMatrixInfo*>::iterator it=mapMIs.begin(); it!=mapMIs.end(); ++it) {
    if (debug) cout<<(it->first)<<endl;
    os<<(*(it->second))<<endl;
  }
  os<<EOF<<"  #--end of vector information type"<<endl;
  if (debug) cout<<"finished FixedMatrixsInfo::write"<<endl;
}

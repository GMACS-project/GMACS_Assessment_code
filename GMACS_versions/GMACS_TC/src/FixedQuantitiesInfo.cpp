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
  SizeBlocks::debug = 1;
  SizeBlock* ptrZB = ModelConfiguration::getInstance()->getSizeBlock(alsZB);
  SizeBlocks::debug = 0;
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
  if (debug) cout<<endl<<"finished FixedVectorInfo::write"<<endl;
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
FixedMatrixInfo::FixedMatrixInfo(int fc_,adstring& alsZBrows_,adstring& alsZBcols_){
  fc = fc_;
  alsZBrows = alsZBrows_;
  alsZBcols = alsZBcols_;
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
  if (debug) cout<<"fc = "<<fc<<".  rows alias = "<<alsZBrows<<".  columns alias = "<<alsZBcols<<endl;
  values.deallocate();
  if (debug) cout<<"deallocated matrix. "<<endl;
  SizeBlock* ptrZBrows = ModelConfiguration::getInstance()->getSizeBlock(alsZBrows);
  SizeBlock* ptrZBcols = ModelConfiguration::getInstance()->getSizeBlock(alsZBcols);
  if (debug) cout<<"rows SizeBlock "<<ptrZBrows<<": "<<ptrZBrows->pIB->mdv<<endl;
  if (debug) cout<<"cols SizeBlock "<<ptrZBcols<<": "<<ptrZBcols->pIB->mdv<<endl;
  values.allocate(ptrZBrows->pIB->iv.indexmin(),ptrZBrows->pIB->iv.indexmax(),
                  ptrZBcols->pIB->iv.indexmin(),ptrZBcols->pIB->iv.indexmax());
  double zBrow; is>>zBrow; 
  while (zBrow>=0){
    int izr = ptrZBrows->getBinIndex(zBrow);
    is>>values(izr);
    if (debug) cout<<"row zB = "<<zBrow<<", row index = "<<izr<<". column values =  "<<values(izr)<<endl;
    is>>zBrow;
  }
  if (debug) cout<<"finished FixedMatrixInfo::read"<<endl;
}
/**
 * Write object to output stream in ADMB format.
 * 
 * @param os - output stream
 */
void FixedMatrixInfo::write(std::ostream & os){
  if (debug) cout<<"starting FixedMatrixInfo::write"<<endl;
  os<<fc<<"  #--factor combination"<<endl;
  os<<alsZBrows<<"  #--alias for size block defining rows"<<endl;
  os<<alsZBcols<<"  #--alias for size block defining columns"<<endl;
  SizeBlock* ptrZBrows = ModelConfiguration::getInstance()->getSizeBlock(alsZBrows);
  SizeBlock* ptrZBcols = ModelConfiguration::getInstance()->getSizeBlock(alsZBcols);
  os<<"#preZB   zBs: "<<gmacs::getMidpoints(ptrZBcols->pIB->getValues())<<endl;
  for (int ir=ptrZBrows->pIB->iv.indexmin();ir<=ptrZBrows->pIB->iv.indexmax();ir++)
    os<<ptrZBrows->pIB->getValue(ir)<<"  "<<values(ir)<<endl;
  os<<EOF<<"  #--end of fixed matrix"<<endl;
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
  int fc_; adstring alsZBrows_; adstring alsZBcols_;
  is>>fc_;
  while (fc_>0){
    is>>alsZBrows_;
    is>>alsZBcols_;
    FixedMatrixInfo* p = new FixedMatrixInfo(fc_,alsZBrows_,alsZBcols_);
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
  if (debug) cout<<"number of rows defining functions: "<<mapMIs.size()<<endl;
  int ctr = 1;
  for (std::map<int,FixedMatrixInfo*>::iterator it=mapMIs.begin(); it!=mapMIs.end(); ++it) {
    if (debug) cout<<(it->first)<<endl;
    os<<"#--matrix "<<ctr++<<endl;
    os<<(*(it->second));
  }
  os<<EOF<<"  #--end of fixed_matrices information type"<<endl;
  if (debug) cout<<"finished FixedMatrixsInfo::write"<<endl;
}

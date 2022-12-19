/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/cppFiles/file.cc to edit this template
 */

#include <clist.h>
#include <map>
#include <adstring.hpp>

#include "IndexBlocks.hpp"
#include "gmacs_utils.hpp"


/**
 * Parse an integer range string
 * 
 * @param str - adstring representing the range
 * @param dummy - integer value provided to allow function overloading
 * @return - ivector representing the range
 * 
 * @details The input adstring should have the form "x:y" or "x",
 * where x and y represent the min and max values for the range or, in 
 * the latter case, where x represents the single (degenerate) value of
 * the range.
 */
ivector gmacs::parseRangeStr(adstring& str,int dummy){
  ivector iv;
  int i = str.pos(":");
  if (i){
    iv.allocate(0,1);
    iv[0] = ::atoi(str(1,i-1));
    iv[1] = ::atoi(str(i+1,str.size()));
  } else {
    iv.allocate(0,0);
    iv[0] = ::atoi(str);
  }
  return iv;
}
/**
 * Parse a decimal range string
 * 
 * @param str - adstring representing the range
 * @param dummy - double value provided to allow function overloading
 * @return - ivector representing the range
 * 
 * @details The input adstring should have the form "x:y" or "x",
 * where x and y represent the min and max values for the range or, in 
 * the latter case, where x represents the single (degenerate) value of
 * the range.
 */
dvector gmacs::parseRangeStr(adstring& str, double dummy){
  dvector dv;
  int i = str.pos(":");
  if (i){
    dv.allocate(0,1);
    dv[0] = gmacs::str_to_dbl(str(1,i-1));
    dv[1] = gmacs::str_to_dbl(str(i+1,str.size()));
  } else {
    dv.allocate(0,0);
    dv[0] = str_to_dbl(str);
  }
  return dv;
}
  /**
   * Determine index range corresponding to an input string, 
   * based upon an integer-based dimension
   * 
   * @param str - adstring representing the range
   * @param mdv - ivector summarizing the model dimension (mdv: model dimension vector)
   * @param debug - int flag to print debugging info
   * @param cout - ostream& to print debugging info to
   * @return - ivector. See @details
   * 
   * @details If str is of the form "x:y", (x and y integers) a 2-element ivector indicating the 
   *          min and max indices in mdv corresponding to the range x to y is returned. 
   *          If str is of the form "x", a 1-element ivector indicating the index of the value
   *          of x is returned. In the special case where str is of the form "x:y" and 
   *          x is -1, then the minimum index is set equal to mdv.indexmin(). If y is -1,
   *          then the maximum index is set equal to mdv.indexmax(). In the case where str
   *          is of the form "x" and x is -1, the returned ivector is -1 (whether to assign 
   *          it to the min or max index is undetermined).
   */
  ivector gmacs::parseIndexRange(adstring str,ivector& mdv,int debug,ostream& os){
    ivector iv;//output
    if (debug) {
      cout<<"starting parseIndexRange for ivector"<<endl;
      cout<<"\tinput adstring = "<<str<<endl;
      cout<<"\tinput ivector  = "<<mdv<<endl;
    }
    ivector rng = gmacs::parseRangeStr(str,(int) 1);
    if (debug) cout<<"\tparsed rng = "<<rng<<endl;
    if (rng.size()==1){
      //--1-element range
      iv.allocate(0,0);
      iv = -1;
      if (rng[0]>=0){
        for (int i=mdv.indexmin();i<=mdv.indexmax();i++){
          if (rng[0]==mdv[i]) {iv[0] = i; break;}
        }
      }
    } else {
      //2-element range
      iv.allocate(0,1);
      iv = -1;
      if (rng[0]<0) {
        iv[0] = mdv.indexmin();
      } else {
        for (int i=mdv.indexmin();i<=mdv.indexmax();i++){
          if (rng[0]==mdv[i]) {iv[0] = i; break;}
        }
      }
      if (rng[1]<0) {
        iv[1] = mdv.indexmax();
      } else {
        for (int i=mdv.indexmax();mdv.indexmin()<=i;i--){
          if (rng[1]==mdv[i]) {iv[1] = i; break;}
        }
      }
    }
    if (debug) {
      cout<<"\tcorresponding indices are: "<<iv<<endl;
      cout<<"finished parseIndexRange for ivector"<<endl;
    }
    return(iv);
  }
  /**
   * Determine index range corresponding to an input string, 
   * based upon a decimal-based dimension
   * 
   * @param str - adstring representing the range
   * @param mdv - dvector providing cutpoints for the model dimension (mdv: model dimension vector)
   * @param debug - int flag to print debugging info
   * @param cout - ostream& to print debugging info to
   * @return - ivector. See @details
   * 
   * @details If str is of the form "x:y", (x and y integers) a 2-element ivector indicating the 
   *          min and max indices in mdv corresponding to the range x to y is returned. 
   *          If str is of the form "x", a 1-element ivector indicating the index of the value
   *          of x is returned. In the special case where str is of the form "x:y" and 
   *          x is -1, then the minimum index is set equal to mdv.indexmin(). If y is -1,
   *          then the maximum index is set equal to mdv.indexmax(). In the case where str
   *          is of the form "x" and x is -1, the returned ivector is -1 (whether to assign 
   *          it to the min or max index is undetermined).
   */
  ivector gmacs::parseIndexRange(adstring str,dvector& mdv,int debug, ostream& cout){
    ivector iv;//output
    if (debug) {
      cout<<"starting parseIndexRange for dvector"<<endl;
      cout<<"\tinput adstring = "<<str<<endl;
      cout<<"\tinput dvector  = "<<mdv<<endl;
    }
    dvector rng = gmacs::parseRangeStr(str,(double) 1);
    if (debug) cout<<"\tparsed rng = "<<rng<<endl;
    if (rng.size()==1){
      //1-element range
      iv.allocate(0,0);
      iv = -1;
      if (rng[0]>=0){
        //--assign to first bin
        if (rng[0]<=mdv[mdv.indexmin()]) {iv[0] = mdv.indexmin();}   else 
        //--assign to last bin
        if (mdv[mdv.indexmax()]<=rng[0]) {iv[0] = mdv.indexmax()-1;} else  
        //--find index to bin such that mdv[i]<=rng[0]<mdv[i+1]
        {
          for (int i=mdv.indexmin();i<mdv.indexmax();i++) 
            if (rng[0]<mdv[i+1]) {iv[0]=i; break;}
        }
      }
    } else {
      //2-element range
      iv.allocate(0,1);
      iv = -1;
      if (rng[0]<0) {
        iv[0] = mdv.indexmin();
      } else {
        //--assign to first bin
        if (rng[0]<=mdv[mdv.indexmin()]) {iv[0] = mdv.indexmin();}   else 
        //--assign to last bin
        if (mdv[mdv.indexmax()]<=rng[0]) {iv[0] = mdv.indexmax()-1;} else  
        //--find index to bin such that mdv[i]<=rng[0]<mdv[i+1]
        {
          for (int i=mdv.indexmin();i<mdv.indexmax();i++) 
            if (rng[0]<mdv[i+1]) {iv[0]=i; break;}
        }
      }
      if (rng[1]<0) {
        iv[1] = mdv.indexmax()-1;
      } else {
        //--assign to last bin
        if (mdv[mdv.indexmax()]<=rng[1]) {iv[1] = mdv.indexmax()-1;} else  
        //--assign to first bin
        if (rng[1]<=mdv[mdv.indexmin()]) {iv[1] = mdv.indexmin();}   else 
        //--find index to bin such that mdv[i]<=rng[1]<mdv[i+1]
        {
          for (int i=mdv.indexmax();mdv.indexmin()<i;i--) 
            if (mdv[i-1]<=rng[1]) {iv[1]=i-1; break;}
        }
      }
    }
    if (debug) {
      cout<<"\tcorresponding indices are: "<<iv<<endl;
      cout<<"finished parseIndexRange for dvector"<<endl;
    }
    return(iv);
  }

  ivector gmacs::parseIndexBlock(adstring str,ivector& mdv,int debug,ostream& cout){
    if (debug) {
      cout<<"starting parseIndexBlock(str,ivector)"<<endl;
      cout<<"\tstr = "<<str<<endl;
      cout<<"\tmdv = "<<mdv<<endl;
    }
    ivector iv;//output
    int ctr = 0;    
    {//loop through string sections demarcated by ";" to find iv size
      adstring str1 = str(2,str.size()-1);//remove brackets
      if (debug) cout<<"\tstr1 = "<<str1<<endl;
      int i = str1.pos(";");
      if (debug) cout<<"\t\ti = "<<i<<endl;
      while(i){
        adstring str2 = str1(1,i-1);
        if (debug) cout<<"\t\tstr2 = "<<str2<<endl;
        ivector iv2 = gmacs::parseIndexRange(str2,mdv,debug,cout);
        ctr += iv2[iv2.indexmax()]-iv2[iv2.indexmin()]+1;
        str1 = str1(i+1,str1.size());
        if (debug) cout<<"\t\tstr1 = "<<str1<<endl;
        i = str1.pos(";");
        if (debug) cout<<"\t\ti = "<<i<<endl;
      }
      if (debug) cout<<"\t\tfinished loop"<<endl;
      ivector iv1 = gmacs::parseIndexRange(str1,mdv,debug,cout);
      ctr += iv1[iv1.indexmax()]-iv1[iv1.indexmin()]+1;
      if (debug) cout<<"\tiv will have size "<<ctr<<endl;
      iv.allocate(0,ctr-1);
    }
    
    {//loop through the string sections demarcated by ";" again to extract indices
      ctr = 0;
      adstring str1 = str(2,str.size()-1);//remove brackets
      int i = str1.pos(";");
      while(i){
        adstring str2 = str1(1,i-1);
        ivector iv2 = gmacs::parseIndexRange(str2,mdv,0,cout);
        for (int j=iv2[iv2.indexmin()];j<=iv2[iv2.indexmax()];j++){iv[ctr++]=j;}
        str1 = str1(i+1,str1.size());
        i = str1.pos(";");
      }
      ivector iv1 = gmacs::parseIndexRange(str1,mdv,0,cout);
      for (int j=iv1[iv1.indexmin()];j<=iv1[iv1.indexmax()];j++){iv[ctr++]=j;}
    }
    if (debug) {
      cout<<"\tiv      = "<<iv<<endl;
      cout<<"\tmdv(iv) = "<<mdv(iv)<<endl;
    }
    return iv;
  }
  
  ivector gmacs::parseIndexBlock(adstring str,dvector& mdv,int debug,ostream& cout){
    if (debug) {
      cout<<"starting parseIndexBlock(str,dvector)"<<endl;
      cout<<"\tstr = "<<str<<endl;
      cout<<"\tmdv = "<<mdv<<endl;
    }
    ivector iv;//output
    int ctr = 0;    
    {//loop through string sections demarcated by ";" to find iv size
      adstring str1 = str(2,str.size()-1);//remove brackets
      if (debug) cout<<"\tstr1 = "<<str1<<endl;
      int i = str1.pos(";");
      if (debug) cout<<"\t\ti = "<<i<<endl;
      while(i){
        adstring str2 = str1(1,i-1);
        if (debug) cout<<"\t\tstr2 = "<<str2<<endl;
        ivector iv2 = gmacs::parseIndexRange(str2,mdv,debug,cout);
        ctr += iv2[iv2.indexmax()]-iv2[iv2.indexmin()]+1;
        str1 = str1(i+1,str1.size());
        if (debug) cout<<"\t\tstr1 = "<<str1<<endl;
        i = str1.pos(";");
        if (debug) cout<<"\t\ti = "<<i<<endl;
      }
      if (debug) cout<<"\t\tfinished loop"<<endl;
      ivector iv1 = gmacs::parseIndexRange(str1,mdv,debug,cout);
      ctr += iv1[iv1.indexmax()]-iv1[iv1.indexmin()]+1;
      if (debug) cout<<"\tiv will have size "<<ctr<<endl;
      iv.allocate(0,ctr-1);
    }
    
    {//loop through the string sections demarcated by ";" again to extract indices
      ctr = 0;
      adstring str1 = str(2,str.size()-1);//remove brackets
      int i = str1.pos(";");
      while(i){
        adstring str2 = str1(1,i-1);
        ivector iv2 = gmacs::parseIndexRange(str2,mdv,0,cout);
        for (int j=iv2[iv2.indexmin()];j<=iv2[iv2.indexmax()];j++){iv[ctr++]=j;}
        str1 = str1(i+1,str1.size());
        i = str1.pos(";");
      }
      ivector iv1 = gmacs::parseIndexRange(str1,mdv,0,cout);
      for (int j=iv1[iv1.indexmin()];j<=iv1[iv1.indexmax()];j++){iv[ctr++]=j;}
    }
    if (debug) {
      cout<<"\tiv      = "<<iv<<endl;
      cout<<"\tmdv(iv) = "<<mdv(iv)<<endl;
    }
    return iv;
  }

  adstring gmacs::toIndexBlockString(ivector& iv,ivector& mdv,int debug,ostream& cout){
    if (debug) {
      cout<<"starting toIndexBlockString(ivector& iv,ivector& dmv)"<<endl;
      cout<<"\tiv      = "<<iv<<endl;
      cout<<"\tmdv     = "<<mdv<<endl;
      cout<<"\tmdv(iv) = "<<mdv(iv)<<endl;
    }
    adstring str="";
    if (iv.size()==1) str = str+"["+::str(mdv[iv[0]])+"]";
    if (iv.size() >1) {
      str = str + "[";
      int s; int ctr; int seq;
      ctr = iv.indexmin(); s = iv[ctr]; seq = 0;
      while(ctr<iv.indexmax()){
        while(ctr<iv.indexmax()&&((iv[ctr+1]-iv[ctr])==1)) {
          if (debug) cout<<"\t\tchecking "<<ctr<<"<"<<iv.indexmax()<<" and "<<iv[ctr+1]<<" - "<<iv[ctr]<<" =  1?"<<endl;
          ctr++; //index is incrementing along iv
          if (debug) cout<<"\t\tctr incremented to "<<ctr<<endl;
        }
        if (debug){
          cout<<"\t\tout of inner loop."<<endl<<"\t\t"<<"ctr = "<<ctr<<"<"<<iv.indexmax()<<"?"<<endl;
          if (ctr<iv.indexmax())  cout<<"\t\t and "<<mdv(iv[ctr+1])<<" - "<<mdv(iv[ctr])<<" = "<<mdv(iv[ctr+1])-mdv(iv[ctr])<<endl;
        }
        //iv[ctr] is the end of the continuous sequence
        if (seq) str = str + ";";//add separator between ranges
        if (s==iv[ctr]){
          //1-element index range
          str = str + ::str(mdv[s]);
        } else {
          //2-element range
          str = str + ::str(mdv[s]) +":"+ ::str(mdv[iv[ctr]]);
        }
        if (debug) {
          cout<<"\t\tseq = "<<seq<<" ctr = "<<ctr<<endl;
          cout<<"\t\tstr = "<<str<<endl;
        }
        if (ctr<iv.indexmax()){
          //inner loop ended at end of continuous sequence
          ctr++;       //increment counter to next element in iv
          s = iv[ctr]; //save index as start of sequence
          seq++;       //increment sequence counter
        } else {
          //inner loop ended because ctr==iv.indexmax();
          //anything to finish up?
        }
      }//--outer while loop
      if (s==iv[ctr]){
        //iv ended with a 1-element index range
        if (seq) str = str + ";";//add separator between ranges
        str = str + ::str(mdv[s]);
      }
      str = str + "]";//"close" the index block
      if (debug) cout<<"\tstr = "<<str<<endl;
    }
    if (debug) {
      cout<<"\tindex block string = "<<str<<endl;
      cout<<"finished toIndexBlockString(ivector& iv,ivector& dmv)"<<endl;
    }
    return str;
  }
  
  adstring gmacs::toIndexBlockString(ivector& iv,dvector& mdv,int debug,ostream& cout){
    if (debug) {
      cout<<"starting toIndexBlockString(ivector& iv,dvector& dmv)"<<endl;
      cout<<"\tiv      = "<<iv<<endl;
      cout<<"\tmdv     = "<<mdv<<endl;
      cout<<"\tmdv(iv) = "<<mdv(iv)<<endl;
    }
    int mnmdv = mdv.indexmin(); int mxmdv = mdv.indexmax();
    dvector bdv = (mdv(mnmdv+1,mxmdv).shift(mnmdv)+mdv(mnmdv,mxmdv-1))/2.0;//bins
    adstring str="";
    if (iv.size()==1) str = str+"["+gmacs::dbl_to_str(bdv[iv[0]])+"]";
    if (iv.size() >1) {
      str = str + "[";
      int s; int ctr; int seq;
      ctr = iv.indexmin(); s = iv[ctr]; seq = 0;
      while(ctr<iv.indexmax()){
        while(ctr<iv.indexmax()&&((iv[ctr+1]-iv[ctr])==1)) {
          if (debug) cout<<"\t\tchecking "<<ctr<<"<"<<iv.indexmax()<<" and "<<iv[ctr+1]<<" - "<<iv[ctr]<<" =  1?"<<endl;
          ctr++; //index is incrementing along iv
          if (debug) cout<<"\t\tctr incremented to "<<ctr<<endl;
        }
        if (debug){
          cout<<"\t\tout of inner loop."<<endl<<"\t\t"<<"ctr = "<<ctr<<"<"<<iv.indexmax()<<"?"<<endl;
          if (ctr<iv.indexmax())  cout<<"\t\t and "<<mdv(iv[ctr+1])<<" - "<<mdv(iv[ctr])<<" = "<<mdv(iv[ctr+1])-mdv(iv[ctr])<<endl;
        }
        //iv[ctr] is the end of the continuous sequence
        if (seq) str = str + ";";//add separator between ranges
        if (s==iv[ctr]){
          //1-element index range
          str = str + gmacs::dbl_to_str(bdv[s]);
        } else {
          //2-element range
          str = str + gmacs::dbl_to_str(bdv[s]) +":"+ gmacs::dbl_to_str(bdv[iv[ctr]]);
        }
        if (debug) {
          cout<<"\t\tseq = "<<seq<<" ctr = "<<ctr<<endl;
          cout<<"\t\tstr = "<<str<<endl;
        }
        if (ctr<iv.indexmax()){
          //inner loop ended at end of continuous sequence
          ctr++;       //increment counter to next element in iv
          s = iv[ctr]; //save index as start of sequence
          seq++;       //increment sequence counter
        } else {
          //inner loop ended because ctr==iv.indexmax();
          //anything to finish up?
        }
      }//--outer while loop
      if (s==iv[ctr]){
        //iv ended with a 1-element index range
        if (seq) str = str + ";";//add separator between ranges
        str = str + gmacs::dbl_to_str(bdv[s]);
      }
      str = str + "]";//"close" the index block
      if (debug) cout<<"\tstr = "<<str<<endl;
    }
    if (debug) {
      cout<<"\tindex block string = "<<str<<endl;
      cout<<"finished toIndexBlockString(ivector& iv,dvector& mdv)"<<endl;
    }
    return str;
  }

////////////////////////////--TimeBlock--///////////////////////////////////////
  /**
   * Class constructor
   */
  TimeBlock::TimeBlock(ivector dimTime){
    modDim = dimTime;
    pIB = nullptr;
  }
  /** 
   * Class destructor
   */
  TimeBlock::~TimeBlock(){
    if (pIB) delete pIB;
  }
  
  void TimeBlock::setIndexBlockString(adstring str){
    indxBlkStr = str;
    if (pIB) delete pIB;
    pIB = new IndexBlock<ivector,int>(modDim);
    pIB->parseString(indxBlkStr);
  }
  /**
   * Read object from input stream in ADMB format.
   * 
   * @param is - file input stream
   */
  void TimeBlock::read(cifstream & is){
    adstring str;
    is>>id;
    is>>alias;
    is>>str;
    is>>description;
    setIndexBlockString(str);
  }
  /**
   * Write object to output stream in ADMB format.
   * 
   * @param os - output stream
   */
  void TimeBlock::write(std::ostream & os){
    adstring sp = "  ";
    os<<id<<sp<<alias<<sp<<(*pIB)<<sp<<description;
  }

////////////////////////////--TimeBlocks--//////////////////////////////////////
  adstring TimeBlocks::KEYWORD = "time_blocks";
  int TimeBlocks::debug = 0;
  /**
   * Class constructor
   */
  TimeBlocks::TimeBlocks(ivector dimTime){
    modDim = dimTime;
  }
  /** 
   * Class destructor
   */
  TimeBlocks::~TimeBlocks(){
  }
  
  /**
   * Read object from input stream in ADMB format.
   * 
   * @param is - file input stream
   */
  void TimeBlocks::read(cifstream & is){
    if (debug) cout<<"starting TimeBlocks::read"<<endl;
    adstring str;
    is>>str;
    if (debug) cout<<"keyword is '"<<str<<"'"<<endl;
    gmacs::checkKeyWord(str,KEYWORD,"In TimeBlocks::read");
    is>>nBs;
    if (debug) cout<<"nBs = "<<nBs<<endl;
    mapAliasesToBlocks.clear();
    for (int i=0;i<nBs;i++) {
      TimeBlock* pB = new TimeBlock(modDim);
      is>>(*pB);
      mapAliasesToBlocks[(const char*) (pB->alias)] = pB;
      mapIDsToBlocks[pB->id] = pB;
      if (debug) cout<<(*mapAliasesToBlocks[(const char*)(pB->alias)])<<endl;
    }
    if (debug) cout<<"finished TimeBlocks::read"<<endl;
  }
  /**
   * Write object to output stream in ADMB format.
   * 
   * @param os - output stream
   */
  void TimeBlocks::write(std::ostream & os){
    os<<KEYWORD<<"    #--keyword"<<endl;
    os<<nBs<<"    #--number of time blocks"<<endl;
    os<<"#id  alias   block    description"<<endl;
    if (nBs){
      for (std::map<int,TimeBlock*>::iterator it=mapIDsToBlocks.begin(); it!=mapIDsToBlocks.end(); ++it){
        os<<(*(it->second))<<endl;
      }
    }
  }

////////////////////////////--SizeBlock--///////////////////////////////////////
  /**
   * Class constructor
   * 
   * @param dimSize - (dvector) model size cutpoints dimension vector
   */
  SizeBlock::SizeBlock(dvector dimSize){
    modDim = dimSize;
    pIB = nullptr;
  }
  /** 
   * Class destructor
   */
  SizeBlock::~SizeBlock(){
    if (pIB) delete pIB;
  }
  
  /**
   * Get the index of the bin in which a value falls.
   * 
   * @param val_ - (double) the value
   * @return - (int) the index corresponding to the bin in which the value falls
   */
  int SizeBlock::getBinIndex(double val_){
    for (int i=pIB->iv.indexmin();i<=pIB->iv.indexmax();i++){
      if ((pIB->mdv[pIB->iv[i]]<=val_)&&(val_<pIB->mdv[pIB->iv[i]+1]))
        return i;
    }
    cout<<"In SizeBlock::getBinIndex("<<val_<<"). Did not find appropriate bin."<<endl;
    cout<<"iv =  "<<pIB->iv<<endl;
    cout<<"mdv = "<<pIB->mdv<<endl;
    return -1;
  }
  
  void SizeBlock::setIndexBlockString(adstring str){
    indxBlkStr = str;
    if (pIB) delete pIB;
    pIB = new IndexBlock<dvector,double>(modDim);
    pIB->parseString(indxBlkStr);
  }
  /**
   * Read object from input stream in ADMB format.
   * 
   * @param is - file input stream
   */
  void SizeBlock::read(cifstream & is){
    adstring str;
    is>>id;
    is>>alias;
    is>>str;
    is>>description;
    setIndexBlockString(str);
  }
  /**
   * Write object to output stream in ADMB format.
   * 
   * @param os - output stream
   */
  void SizeBlock::write(std::ostream & os){
    adstring sp = "  ";
    os<<id<<sp<<alias<<sp<<(*pIB)<<sp<<description;
  }

////////////////////////////--SizeBlocks--//////////////////////////////////////
  adstring SizeBlocks::KEYWORD = "size_blocks";
  int SizeBlocks::debug = 0;
  /**
   * Class constructor
   * 
   * @param dimSize - (dvector) model size cutpoints dimension vector
   */
  SizeBlocks::SizeBlocks(ivector dimSize){
    modDim = dimSize;
  }
  /** 
   * Class destructor
   */
  SizeBlocks::~SizeBlocks(){
  }
  
  /**
   * Return pointer to SizeBlock identified by alias_
   * @param alias_ - adstring used to identify SizeBlock
   * @return pointer to SizeBlock (or nullptr)
   */
  SizeBlock* SizeBlocks::getBlock(adstring& alias_){
    if (debug) {
      cout<<"starting SizeBlocks::getBlock with key '"<<(const char*)alias_<<"'"<<endl;
      cout<<"map size is "<<mapAliasesToBlocks.size()<<". Keys are :";
      for (std::map<const char*,SizeBlock*>::iterator it=mapAliasesToBlocks.begin(); it!=mapAliasesToBlocks.end(); ++it)
        cout<<"'"<<it->first<<"' ";
      cout<<endl;
    }
    SizeBlock* ptrZB = nullptr;
    for (std::map<const char*,SizeBlock*>::iterator it=mapAliasesToBlocks.begin(); it!=mapAliasesToBlocks.end(); ++it){
      if (debug) cout<<"'"<<it->first<<"'. ";
      compare cs;
      bool res = (!cs(it->first,(const char*)alias_))&&(!cs((const char*)alias_,it->first));
      if (debug) cout<<"Equals key '"<<alias_<<"'? "<<gmacs::isTrue(res)<<endl;
      if (res) {ptrZB = it->second; break;}
    }
    if (!ptrZB) {
      cout<<"--Did not find key '"<<(const char*)alias_<<"' in SizeBlocks"<<endl;
      cout<<"--Available keys are: ";
      for (std::map<const char*,SizeBlock*>::iterator it=mapAliasesToBlocks.begin(); it!=mapAliasesToBlocks.end(); ++it)
        cout<<"'"<<it->first<<"'  ";
      cout<<endl<<endl;
    }
    return ptrZB;
  }
  
  /**
   * Read object from input stream in ADMB format.
   * 
   * @param is - file input stream
   */
  void SizeBlocks::read(cifstream & is){
    if (debug) cout<<"starting SizeBlocks::read"<<endl;
    adstring str;
    is>>str;
    if (debug) cout<<"keyword is '"<<str<<"'"<<endl;
    gmacs::checkKeyWord(str,KEYWORD,"In SizeBlocks::read");
    is>>nBs;
    if (debug) cout<<"nBs = "<<nBs<<endl;
    mapAliasesToBlocks.clear();
    for (int i=0;i<nBs;i++) {
      SizeBlock* pB = new SizeBlock(modDim);
      is>>(*pB);
      mapAliasesToBlocks[(const char*)(pB->alias)] = pB;
      mapIDsToBlocks[pB->id] = pB;
      if (debug) cout<<(*mapAliasesToBlocks[(const char*)(pB->alias)])<<endl;
    }
    if (debug) cout<<"finished SizeBlocks::read"<<endl;
  }
  /**
   * Write object to output stream in ADMB format.
   * 
   * @param os - output stream
   */
  void SizeBlocks::write(std::ostream & os){
    os<<KEYWORD<<"    #--keyword"<<endl;
    os<<nBs<<"    #--number of time blocks"<<endl;
    os<<"#id  alias   block    description"<<endl;
    if (nBs){
      for (std::map<int,SizeBlock*>::iterator it=mapIDsToBlocks.begin(); it!=mapIDsToBlocks.end(); ++it){
        os<<(*(it->second))<<endl;
      }
    }
  }

  
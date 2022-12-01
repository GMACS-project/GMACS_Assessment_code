//ModelConfiguration.hpp

#pragma once
#ifndef MODELCONFIGURATION_HPP
#define	MODELCONFIGURATION_HPP
#include <admodel.h>
#include "gmacs_utils.hpp"
#include "IndexBlocks.hpp"

/**
 * @title CatDim
 * @description Class encapsulating information for a categorical dimension.
 */
class CatDim {
    private:
        adstring dimname;
        int n;
        ivector fi;
        ivector ri;
        adstring_array als;
        adstring_array lng;
    public:
        CatDim(adstring name_){dimname=name_;n=0;}
        ~CatDim(){}
        /**
         * Find index corresponding to a string
         * @param als_ - alias of index to find 
         * @return - (int) index corresponding to string (or -1 if not found)
         */
        int getIndex(adstring& str){
            for (int i=0;i<=n;i++) if (str==als[i]) return i;
            return -1;//--if str not found
        }
        adstring getDimName(){return dimname;}
        adstring getAlias(int i_){return als[i_];}
        adstring getLongName(int i_) {return lng[i_];}
        /**
         * Read from input file stream in ADMB format.
         * 
         * @param is - input file stream
         */
        void read(cifstream & is){
          adstring str;
          is>>str;
          if (!gmacs::checkKeyWord(str,dimname,"reading Model Configuration file")){
            exit(-1);
          }
          is>>n;
          if (fi.allocated()) fi.deallocate();
          fi.allocate(0,n);
          als.allocate(0,n); als[0] = "any";
          lng.allocate(0,n); lng[0] = "any_"+dimname;
          for (int i=1;i<=n;i++){
              is>>fi[i]; is>>als[i]; is>>lng[i];
          }
        }
        /**
         * Write object to output stream in ADMB format.
         * 
         * @param os - output stream
         */
        void write(std::ostream & os){
            os<<dimname<<"\t#------------------------"<<endl;
            os<<n<<"\t#--number of "<<dimname<<endl;
            os<<"#id    alias    long name"<<endl;
            for (int i=1;i<=n;i++)
                os<<fi[i]<<"\t"<<als[i]<<"\t"<<lng[i]<<endl;
        }
        /**
         * Operator to read from input filestream in ADMB format
         */
        friend cifstream&    operator >>(cifstream & is, CatDim & obj){obj.read(is);return is;}
        /**
         * Operator to write to output stream in ADMB format
         */
        friend std::ostream& operator <<(std::ostream & os,CatDim & obj){obj.write(os);;return os;}       
};
/**
 * Class encapsulating a (decimal) numbers-based dimension
 */
class NumDim {
    public:
        adstring dimname;
        /* number of bins */
        int n;
        int isLower;
        int isUpper;
        /* bin cutpoints */
        dvector cutpts;
        /* bin midpoints */
        dvector midpts;
    public:
        NumDim(adstring name_){dimname=name_;n=0;}
        ~NumDim(){}
        /**
         * Find index corresponding to a string
         * @param val_ - value to find enclosing bin 
         * @return - (int) index of bin corresponding to value (or -1 if not found)
         */
        adstring getDimName(){return dimname;}
        int getIndex(double val_){
            if (val_<cutpts[cutpts.indexmin()]) {
                if (isLower) return 1; else return -1;
            }
            if (cutpts[cutpts.indexmax()]<val_){
                if (isUpper) return n; else return -1;
            }
            for (int i=cutpts.indexmin();i<cutpts.indexmax();i++) 
              if ((cutpts[i]<=val_)&(val_<cutpts[i+1])) return i;
            return -1;//--if str not found
        }
        dvector getCutpoints(int i_){return cutpts(i_,i_+1);}
        double  getMidpoint(int i_) {return midpts[i_];}
        /**
         * Read from input file stream in ADMB format.
         * 
         * @param is - input file stream
         */
        void read(cifstream & is){
            adstring str;
            is>>str;
            if (!gmacs::checkKeyWord(str,dimname,"reading Model Configuration file")){
              exit(-1);
            }
            is>>n;
            is>>str; isLower = gmacs::isTrue(str);
            is>>str; isUpper = gmacs::isTrue(str);
            cutpts.allocate(0,n);
            is>>cutpts;
            midpts.allocate(0,n-1);
            midpts = 0.5*(cutpts(1,n).shift(0)-cutpts(0,n-1));
        }
        /**
         * Write object to output stream in ADMB format.
         * 
         * @param os - output stream
         */
        void write(std::ostream & os){
            os<<dimname<<"\t#------------------------"<<endl;
            os<<n<<"\t#--number of bins"<<endl;
            os<<"#cutpoints (number of bins + 1)"<<endl;
            os<<cutpts<<endl;
        }
        /**
         * Operator to read from input filestream in ADMB format
         */
        friend cifstream&    operator >>(cifstream & is, NumDim & obj){obj.read(is);return is;}
        /**
         * Operator to write to output stream in ADMB format
         */
        friend std::ostream& operator <<(std::ostream & os,NumDim & obj){obj.write(os);;return os;}       
};

/**
 * Class encapsulating an integer-based dimension
 */
class IntDim {
    public:
        adstring dimname;
        /* min value */
        int min;
        /* max value */
        int max;
        /* 0-based ivector from min to max by 1 */
        ivector dim;
    public:
        IntDim(adstring name_){dimname=name_;}
        ~IntDim(){}
        /**
         * Find index corresponding to a value
         * @param val_ - value to find
         * @return - (int) index corresponding to value (or -1 if not found)
         */
        int getIndex(double val_){
            if (val_<dim[dim.indexmin()])return -1;
            if (dim[dim.indexmax()]<val_)return -1;
            for (int i=dim.indexmin();i<=dim.indexmax();i++) 
              if (val_==dim[i]) return i;
            return -1;//--if val_ not found
        }
        adstring getDimName(){return dimname;}
        /**
         * Extract dimension value at an index
         * 
         * @param i_ - (int) index to extract value for
         * @return value at index
         */
        int getValue(int i_) {return dim[i_];}
        /**
         * Read from input file stream in ADMB format.
         * 
         * @param is - input file stream
         */
        void read(cifstream & is){
            adstring str;
            is>>str;
            if (!gmacs::checkKeyWord(str,dimname,"reading Model Configuration file")){
              exit(-1);
            }
            is>>min;
            is>>max;
            if (dim.allocated()) dim.deallocate();
            dim.allocate(0,max-min);
            for (int i=dim.indexmin();i<=dim.indexmax();i++) dim[i] = min+i;
        }
        /**
         * Write object to output stream in ADMB format.
         * 
         * @param os - output stream
         */
        void write(std::ostream & os){
            os<<dimname<<"\t#------------------------"<<endl;
            os<<min<<"\t#--min value"<<endl;
            os<<min<<"\t#--max value"<<endl;
            os<<"#index    value"<<endl;
            for (int i=dim.indexmin();i<=dim.indexmax();i++) os<<"# "<<i<<"  "<<dim[i]<<endl;
        }
        /**
         * Operator to read from input filestream in ADMB format
         */
        friend cifstream&    operator >>(cifstream & is, IntDim & obj){obj.read(is);return is;}
        /**
         * Operator to write to output stream in ADMB format
         */
        friend std::ostream& operator <<(std::ostream & os,IntDim & obj){obj.write(os);;return os;}       
};//--IntDim
////////////////////////////////--ModelConfiguration--//////////////////////////
/**
 * @title ModelConfiguration
 * @description 
 */
class ModelConfiguration {
    public:
        /* version string for class */
        const static adstring VERSION;
        /* flag to print debug info */
        static int debug;  
        /* static getter to obtain pointer to singleton instance */
        static ModelConfiguration* getInstance();
    public:
        CatDim* pRegs;
        CatDim* pSXs;
        CatDim* pMSs;
        CatDim* pSCs;
        NumDim* pZBs;
        CatDim* pFlts;
//        IntDim* pYrs;
        TimeBlocks* pTBlks;
        SizeBlocks* pZBlks;
        int stYr;
        int fnYr;
        int yRetro;
        ivector years;
        int nSzns;
        dvector szns;
    private:
        /* static singleton instance */
        static ModelConfiguration* ptrMC;
        /**
         * Constructor
         */
        ModelConfiguration(){yRetro=0; pSXs=pMSs=pSCs=pRegs=pFlts=nullptr;pTBlks=nullptr;pZBlks=nullptr;};
        ModelConfiguration(const ModelConfiguration&);     //not allowed
        ModelConfiguration& operator=(ModelConfiguration&);//not allowed
        /**
         * Destructor
         */
        ~ModelConfiguration(){
            if (pRegs) delete(pRegs); pRegs=nullptr;
            if (pSXs)  delete(pSXs);  pSXs =nullptr;
            if (pMSs)  delete(pMSs);  pMSs =nullptr;
            if (pSCs)  delete(pSCs);  pSCs =nullptr;
            if (pZBs)  delete(pZBs);  pZBs =nullptr;
            if (pFlts) delete(pFlts); pFlts=nullptr;
//            if (pYrs)  delete(pYrs);  pYrs=nullptr;
            if (pTBlks)  delete(pTBlks);  pTBlks=nullptr;
            if (pZBlks)  delete(pZBlks);  pZBlks=nullptr;
        }
     public:
       /**
         * Get the index for the categorical dimension indicated by the input string
         * 
         * @param als - alias (adstring) indicating categorical dimension index
         * @param pCD - pointer to appropriate categorical dimension info
         * @return - dimension index as an int (0=any/all values; -1: not found)
         */
        int getCatIndex(adstring als,CatDim* pCD);
        /**
         * Get region index corresponding to input string 
         * 
         * @param als - alias (adstring) indicating region(s)
         * @return region index (int)
         */
        int getRegionIndex(adstring als){return(getCatIndex(als,pRegs));}
        /**
         * Get sex dimension index corresponding to input string 
         * 
         * @param als - alias (adstring) indicating sex(s)
         * @return corresponding sex dimension index as int
         */
        int getSexIndex(adstring als){return(getCatIndex(als,pSXs));}
        /**
         * Get maturity state dimension index corresponding to input string 
         * 
         * @param als - alias (adstring) indicating maturity state(s)
         * @return corresponding maturity state dimension index as int
         */
        int getMatStateIndex(adstring als){return(getCatIndex(als,pMSs));}
        /**
         * Get shell condition dimension id corresponding to input string 
         * 
         * @param als - alias (adstring) indicating shell condition(s)
         * @return corresponding shell condition dimension index as int
         */
        int getShellCondIndex(adstring als){return(getCatIndex(als,pSCs));}
        /**
         * Get time block corresponding to input string 
         * 
         * @param als - alias (adstring) indicating time block
         * @return time block integer idex
         */
        TimeBlock* getTimeBlock(adstring& als){return pTBlks->getBlock(als);}
        /**
         * Get size block id corresponding to input string 
         * 
         * @param als - alias (adstring) indicating size block
         * @return pointer to SizeBlock
         */
        SizeBlock* getSizeBlock(adstring als){return pZBlks->getBlock(als);}
        
        /**
         * Set number of retrospective years to peel off.
         * 
         * @param _yRetro - number of retrospective years to peel off
         */
        void setNumRetroYears(int _yRetro){yRetro = _yRetro;}
        /**
         * Tests if stYr <= yr <= fnYr. 
         * 
         * @param yr
         * @return 1 if true, 0 if false
         */
        int isModelYear(int yr){if ((stYr<=yr)&&(yr<=(fnYr-yRetro))) return 1; return 0;}
        /**
         * Read a categorical dimension definition from an input file stream.
         * 
         * @param dimname
         * @param is
         * @return 
         */
        CatDim* readCatDim(adstring dimname, cifstream& is){
            adstring str;
            CatDim* p = new CatDim(dimname);
            is>>(*p);
            return(p);
        }
        /**
         * Read a numerical (decimal) dimension definition from an input file stream.
         * 
         * @param dimname
         * @param is
         * @return 
         */
        NumDim* readNumDim(adstring dimname, cifstream& is){
            adstring str;
            NumDim* p = new NumDim(dimname);
            is>>(*p);
            return(p);
        }
        /**
         * Read an integer dimension definition from an input file stream.
         * 
         * @param dimname
         * @param is
         * @return 
         */
        IntDim* readIntDim(adstring dimname, cifstream& is){
            adstring str;
            IntDim* p = new IntDim(dimname);
            is>>(*p);
            return(p);
        }
        /**
         * Read from input file stream in ADMB format.
         * 
         * @param is - input file stream
         */
        void read(cifstream & is){
            adstring str;
            is>>str;
            if (str!=VERSION){
                std::cout<<"Reading Model Configuration file."<<endl;
                std::cout<<"Model Configuration version does not match!"<<endl;
                std::cout<<"Got '"<<str<<"' but expected '"<<VERSION<<"'."<<endl;
                std::cout<<"Please update '"<<is.get_file_name()<<"'"<<endl;
                exit(-1);
            }
            pRegs = readCatDim("regions",is);
            pSXs  = readCatDim("sexes",is);
            pMSs  = readCatDim("maturity_states",is);
            pSCs  = readCatDim("shell_conditions",is);
            pZBs  = readNumDim("size_bins",is);
            pFlts = readCatDim("fleets",is);
            is>>str; gmacs::checkKeyWord(str,"years","reading Model Configuration file");
            is>>stYr;
            is>>fnYr;
            years.allocate(0,fnYr-stYr+1);
            for (int i=years.indexmin();i<=years.indexmax();i++) years[i] = stYr+i;
            is>>str; gmacs::checkKeyWord(str,"seasons","reading Model Configuration file");
            is>>nSzns;
            int id;
            szns.allocate(1,nSzns);
            for (int i=1;i<=nSzns;i++) {is>>id; is>>szns[id];}
            pTBlks = new TimeBlocks(years);
            is>>(*pTBlks);
            pZBlks = new SizeBlocks(pZBs->cutpts);
            is>>(*pZBlks);
        }
        /**
         * Write object to output stream in ADMB format.
         * 
         * @param os - output stream
         */
        void write(std::ostream & os){
          os<<"#--gmacs model configuration file"<<endl;
          os<<VERSION<<"\t# model configuration file version"<<endl;
          os<<"##############--Model Dimensions--#################"<<endl;
          os<<"##------------------------------------------------"<<endl;
          os<<"##--Population"<<endl;
          os<<(*pRegs);
          os<<(*pSXs)<<(*pMSs)<<(*pSCs);
          os<<(*pZBs);
          os<<"##------------------------------------------------"<<endl;
          os<<"##--Fisheries and surveys"<<endl;
          os<<(*pFlts);     
          os<<"##------------------------------------------------"<<endl;
          os<<"##--Time"<<endl;
          os<<"years"<<"\t#------------------------------------------"<<endl;
          os<<stYr<<"\t# start year"<<endl;
          os<<fnYr<<"\t# final year (assuming no retrospective)"<<endl;
          os<<"seasons"<<"\t#----------------------------------------"<<endl;
          os<<nSzns<<"\t# number of seasons"<<endl;
          os<<"#id  fraction"<<endl;
          for (int i=1;i<=nSzns;i++) os<<i<<"  "<<szns[i]<<endl;
          os<<"##############--Model Blocks--#######################"<<endl;
          os<<"##------------------------------------------------"<<endl;
          os<<"##--Time blocks"<<endl;
          os<<(*pTBlks);
          os<<"##------------------------------------------------"<<endl;
          os<<"##--Size blocks"<<endl;
          os<<(*pZBlks);
          os<<"###################################################"<<endl;
        }
        /**
         * Operator to read from input filestream in ADMB format
         */
        friend cifstream&    operator >>(cifstream & is, ModelConfiguration & obj){obj.read(is);return is;}
        /**
         * Operator to write to output stream in ADMB format
         */
        friend std::ostream& operator <<(std::ostream & os,ModelConfiguration & obj){obj.write(os);;return os;}       
};
#endif /* MODELCONFIGURATION_HPP */
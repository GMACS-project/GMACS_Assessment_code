/* 
 * File:   DatFileReader.hpp
 * Author: William Stockhausen
 *
 * Created on March 22, 2022, 2:08 PM
 */

#ifndef DATFILEREADER_HPP
#define DATFILEREADER_HPP

class DatModelInfo;
class DatSeasonInfo;

class DatFileReader {
    public:
        static int debug;
        static const adstring version;
        DatModelInfo* pDatModelInfo;
        DatSeasonInfo* pDatSeasonInfo;
    public:
        DatFileReader();
        ~DatFileReader();
        /**
         * Read gmacs dat file-formatted input
         */
        void read(cifstream & is);
        /**
         * Write gmacs dat file-formatted input to an output file
         */
        void write(std::ostream & os);
        /**
         * Operator to read dat file-formatted from an input stream into a DatFileReader object.
         */
        friend cifstream& operator >>(cifstream & is, DatFileReader & obj){obj.read(is); return is;}
        /**
         * Operator to read a dat file-formatted data from an input stream into a DatFileReader object.
         */
        friend std::ostream&   operator <<(std::ostream & os,   DatFileReader & obj){obj.write(os); return os;}
};

class DatModelInfo {
    public: 
        static int debug;
        int mnYr;
        int mxYr;
        int nFlts;
        adstring_array fleetNames;
        int nSXs;
        int nSCs;
        int nMSs;
        int nZBs;
        dvector mxZs;
        dvector ZCs;
        
    public:
        DatModelInfo(){}
        ~DatModelInfo(){}
        /**
         * Read header of gmacs dat file-formatted input
         */
        void read(cifstream & is);
        /**
         * Write header of gmacs dat file-formatted input to an output file
         */
        void write(std::ostream & os);
        /**
         * Operator to read header of dat file-formatted from an input stream into a DatFileReader object.
         */
        friend cifstream& operator >>(cifstream & is, DatModelInfo & obj){obj.read(is); return is;}
        /**
         * Operator to write the header for a dat file-formatted data from an input stream into a DatFileReader object.
         */
        friend std::ostream&   operator <<(std::ostream & os,   DatModelInfo & obj){obj.write(os); return os;}
    
};

class DatSeasonInfo {
    public: 
        /* flag to print debugging info */
        static int debug;
        /* min model year */
        int mnYr;
        /* max model year */
        int mxYr;
        /* number of seasons */
        int nSeasons;
        /* season with recruitment */
        int recSeason;
        /* season with molting/growth */
        int grwSeason;
        /* season to calculate SSB */
        int ssbSeason;
        /* season in which numbers at length are output */
        int nAtZSeason;
        /* type of input specification for M by season/year (1=season vector; 2=season/year matrix)*/
        int inpMType;
        /* fractional M's by season/year */
        dmatrix fracMs;
        /* vector of season types (0=instantaneous; 1=continuous) */
        ivector seasonTypes;
        
    public:
        /** default class constructor */
        DatSeasonInfo(){}
        /** class constructor */
        DatSeasonInfo(int mnYr_,int mxYr_){mnYr=mnYr_; mxYr=mxYr_;}
        /** class destructor */
        ~DatSeasonInfo(){}
        /**
         * Read header of gmacs dat file-formatted input
         */
        void read(cifstream & is);
        /**
         * Write header of gmacs dat file-formatted input to an output file
         */
        void write(std::ostream & os);
        /**
         * Operator to read header of dat file-formatted from an input stream into a DatFileReader object.
         */
        friend cifstream& operator >>(cifstream & is, DatSeasonInfo & obj){obj.read(is); return is;}
        /**
         * Operator to write the header for a dat file-formatted data from an input stream into a DatFileReader object.
         */
        friend std::ostream&   operator <<(std::ostream & os,   DatSeasonInfo & obj){obj.write(os); return os;}
    
};

#endif /* DATFILEREADER_HPP */


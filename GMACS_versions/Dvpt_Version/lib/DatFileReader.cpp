/**
 * Source code for:
 *  DatFileReader
 */
#include <admodel.h>
#include "DatFileReader.hpp"

////////////////////////////////////////////////////////////////////////////////
int DatFileReader::debug = 0;
const adstring DatFileReader::version("2022.03.22");

DatFileReader::DatFileReader(){
    pDatModelInfo = 0;
    pDatSeasonInfo = 0;
}

DatFileReader::~DatFileReader(){
    if (pDatModelInfo) delete pDatModelInfo;
    if (pDatSeasonInfo) delete pDatSeasonInfo;
}

void DatFileReader::read(cifstream & is){
    adstring ver;
    is>>ver;
    if (ver==version){
        if (pDatModelInfo) delete pDatModelInfo;
        pDatModelInfo = new DatModelInfo();
        is>>(*pDatModelInfo);
        if (pDatSeasonInfo) delete pDatSeasonInfo;
        pDatSeasonInfo = new DatSeasonInfo(pDatModelInfo->mnYr,pDatModelInfo->mxYr);
        is>>(*pDatSeasonInfo);
    }
}

void DatFileReader::write(ostream & os){
    adstring ver;
    os<<ver<<"\t#--dat file version"<<endl;
    os<<"#------Model Configuration Info--------"<<endl;
    os<<(*pDatModelInfo);
    os<<"#------Model Season Info--------"<<endl;
    os<<(*pDatSeasonInfo);
}

////////////////////////////////////////////////////////////////////////////////
int DatModelInfo::debug = 0;
void DatModelInfo::read(cifstream & is){
    is>>mnYr;
    is>>mxYr;
    is>>nFlts;
    fleetNames.allocate(1,nFlts);
    is>>fleetNames;
    is>>nSXs;
    is>>nSCs;
    is>>nMSs;
    is>>nZBs;
    mxZs.allocate(1,nSXs);
    is>>mxZs;
    ZCs.allocate(1,nZBs+1);
    is>>ZCs;
    //determine indices corresponding to mxZs
    //TODO!
}

void DatModelInfo::write(ostream & os){
    os<<mnYr<<"\t#--min model year"<<endl;
    os<<mxYr<<"\t#--max model year"<<endl;
    os<<nFlts<<"\t#--number of fleets"<<endl;
    for (int i=1;i<=nFlts; i++) os<<fleetNames(i)<<"\t#--fleet "<<i<<endl;
    os<<nSXs<<"\t#--number of sexes"<<endl;
    os<<nSCs<<"\t#--number of shell conditions"<<endl;
    os<<nMSs<<"\t#--number of maturity states"<<endl;
    os<<nZBs<<"\t#--number of size classes"<<endl;
    os<<mxZs<<"\t#--max sizes by sex (males, then females)"<<endl;
    os<<"#--size class cutpoints"<<endl;
    os<<ZCs<<endl;
}

////////////////////////////////////////////////////////////////////////////////
int DatSeasonInfo::debug = 0;
void DatSeasonInfo::read(cifstream & is){
    is>>nSeasons;
    is>>recSeason;
    is>>grwSeason;
    is>>ssbSeason;
    /* season in which numbers at length are output */
    is>>nAtZSeason;
    /* vector of season types (0=instantaneous; 1=continuous) */
    seasonTypes.allocate(1,nSeasons);
    is>>seasonTypes;
    /* type of input specification for M by season/year (1=season vector; 2=season/year matrix)*/
    is>>inpMType;
    /* fractional M's by season/year */
    fracMs.allocate(mnYr,mxYr,1,nSeasons);
    if (inpMType==1){
        //input is vector of fractional M's by season (applying to all years)
        dvector inp(1,nSeasons);
        is>>inp;
        for (int i=mnYr;i<=mxYr;i++) fracMs(i) = inp;
    } else {
        //input is season (column) by year (row)
        for (int i=mnYr;i<=mxYr;i++) is>>fracMs(i);
    }
}

void DatSeasonInfo::write(ostream & os){
    os<<nSeasons<<"\t#--number of seasons"<<endl;
    os<<recSeason<<"\t#--recruitment season"<<endl;
    os<<grwSeason<<"\t#--molting/growth season"<<endl;
    os<<ssbSeason<<"\t#--SSB season"<<endl;
    os<<nAtZSeason<<"\t#--season at which to export numbers-at-age"<<endl;
    os<<"#--vector of season types (0=instantaneous; 1=continuous)"<<endl;
    for (int i=1;i<=nSeasons;i++) os<<seasonTypes(i)<<"  #--Season "<<i<<endl;
    os<<"#--type of input specification for M by season/year (1=season vector; 2=season/year matrix)"<<endl;
    os<<inpMType<<endl;
    if (inpMType==1){
        os<<"input is vector of fractional M's by season (applying to all years)"<<endl;
        for (int i=1;i<=nSeasons;i++) os<<fracMs(mnYr,i)<<"  #--Season "<<i<<endl;
    } else {
        os<<"fractional M's by season/year"<<endl;
        for (int i=mnYr;i<=mxYr;i++) os<<fracMs(i)<<"  #--"<<i<<endl;
    }
}

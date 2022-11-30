//--gmacs_sandbox_data_section.cpp

  {
    ECHOSTR("#-----------------------------------")
    ECHOSTR("#--------SANDBOX TESTING------------")
    int i=0; double d=0;
//    {
//      cout<<"testing ::atoi with adstring '10':"<<endl;
//      adstring s1 = "10";
//      cout<<"atoi(10) = "<<::atoi(s1)<<endl<<endl;
//      cout<<"testing ::atoi with adstring 'fred':"<<endl;
//      adstring s2 = "fred";
//      cout<<"atoi(fred) = "<<::atoi(s2)<<" = "<<str(::atoi(s2))<<endl<<endl;
//      cout<<"check round trips"<<endl;
//      cout<<"s1: "<<(s1==str(::atoi(s1)))<<endl;
//      cout<<"s2: "<<(s2==str(::atoi(s2)))<<endl;
//    }
//    {
//      cout<<"#--testing dbl_to_str"<<endl;
//      double dbl;
//      dbl = 10; cout<<"dbl = 10: "<<gmacs::dbl_to_str(dbl)<<endl;
//      dbl = 25.51; cout<<"dbl = 25.51: "<<gmacs::dbl_to_str(dbl)<<endl;
//      dbl = 0.001; cout<<"dbl = 0.001: "<<gmacs::dbl_to_str(dbl)<<endl;
//    }
//    {
//      cout<<"#--testing parseRangeStr "<<endl;
//      adstring str1 = "100:200";
//      ivector iv  = gmacs::parseRangeStr(str1,i);
//      cout<<"iv(100:200) = "<<iv<<endl;
//      adstring str2 = "27.5:182.5";
//      dvector dv  = gmacs::parseRangeStr(str2,d);
//      cout<<"dv(27.5:182.5) = "<<dv<<endl;
//      cout<<"#--done testing parseRangeStr "<<endl<<endl;
//    }
//    {
//      cout<<"#--testing parseIndexRange(adstring, ivector)"<<endl;
//      adstring str;
//      ivector dimI(0,5);
//      for (int i=0;i<=5;i++) dimI[i] = i+2010;
//      str = "2010:2015";
//      gmacs::parseIndexRange(str,dimI,1,std::cout);
//      cout<<endl;
//      str = "2012";
//      gmacs::parseIndexRange(str,dimI,1,std::cout);
//      cout<<endl;
//      str = "-1:-1";
//      gmacs::parseIndexRange(str,dimI,1,std::cout);
//      cout<<"#--done testing parseIndexRange(adstring, ivector)"<<endl<<endl;
//    }
//    {
//      cout<<"#--testing parseIndexRange(adstring, dvector)"<<endl;
//      adstring str;
//      dvector dimD(0,5);
//      for (int i=0;i<=5;i++) dimD[i] = 25.0+5.0*i;
//      str = "27.5:40";
//      gmacs::parseIndexRange(str,dimD,1,std::cout);
//      cout<<endl;
//      str = "45";
//      gmacs::parseIndexRange(str,dimD,1,std::cout);
//      cout<<endl;
//      str = "-1:-1";
//      gmacs::parseIndexRange(str,dimD,1,std::cout);
//      cout<<"#--done testing parseIndexRange(adstring, dvector)"<<endl<<endl;
//    }
//    {
//      cout<<"#--testing parseIndexBlock and toIndexBlockString for ivectors"<<endl;
//      adstring str; adstring stro;
//      ivector dimI(0,5);
//      for (int i=0;i<=5;i++) dimI[i] = i+2010;
//      str = "[2012:2015]";
//      std::cout<<"input str = "<<str<<endl;
//      ivector iv1   = gmacs::parseIndexBlock(str,dimI,0,std::cout);
//      stro = gmacs::toIndexBlockString(iv1,dimI,1,std::cout);
//      std::cout<<"input  str = "<<str<<endl;
//      std::cout<<"output str = "<<stro<<endl;
//      cout<<endl;
//      //--
//      str = "[2012]";
//      std::cout<<"input str = "<<str<<endl;
//      ivector iv2   = gmacs::parseIndexBlock(str,dimI,0,std::cout);
//      stro = gmacs::toIndexBlockString(iv2,dimI,1,std::cout);
//      std::cout<<"input  str = "<<str<<endl;
//      std::cout<<"output str = "<<stro<<endl;
//      cout<<endl;
//      //--
//      str = "[-1:-1]";
//      std::cout<<"input str = "<<str<<endl;
//      ivector iv3   = gmacs::parseIndexBlock(str,dimI,0,std::cout);
//      stro = gmacs::toIndexBlockString(iv3,dimI,1,std::cout);
//      std::cout<<"input  str = "<<str<<endl;
//      std::cout<<"output str = "<<stro<<endl;
//      cout<<endl;
//      //--
//      str = "[-1:2012;2011:-1]";
//      std::cout<<"input str = "<<str<<endl;
//      ivector iv4   = gmacs::parseIndexBlock(str,dimI,0,std::cout);
//      stro = gmacs::toIndexBlockString(iv4,dimI,1,std::cout);
//      std::cout<<"input  str = "<<str<<endl;
//      std::cout<<"output str = "<<stro<<endl;
//      cout<<endl;
//      //--
//      str = "[-1:2012;2011:-1;2011]";
//      std::cout<<"input str = "<<str<<endl;
//      ivector iv5   = gmacs::parseIndexBlock(str,dimI,0,std::cout);
//      stro = gmacs::toIndexBlockString(iv5,dimI,1,std::cout);
//      std::cout<<"input  str = "<<str<<endl;
//      std::cout<<"output str = "<<stro<<endl;
//      cout<<endl;
//      //--
//      cout<<"#--done testing parseIndexBlock and toIndexBlockString for ivectors"<<endl<<endl;
//    }
//    {
//      cout<<"#--testing parseIndexBlock and toIndexBlockString for dvectors"<<endl<<endl;
//      adstring str; adstring stro;
//      dvector dimD(0,10);
//      for (int i=0;i<=10;i++) dimD[i] = 25.0+5.0*i;
//      str = "[27.5:40]";
//      ivector iv1 = gmacs::parseIndexBlock(str,dimD,1,std::cout);
//      stro = gmacs::toIndexBlockString(iv1,dimD,1,std::cout);
//      std::cout<<"input  str = "<<str<<endl;
//      std::cout<<"output str = "<<stro<<endl;
//      cout<<endl;
//      str = "[45]";
//      ivector iv2 = gmacs::parseIndexBlock(str,dimD,1,std::cout);
//      stro = gmacs::toIndexBlockString(iv2,dimD,1,std::cout);
//      std::cout<<"input  str = "<<str<<endl;
//      std::cout<<"output str = "<<stro<<endl;
//      cout<<endl;
//      str = "[-1:-1]";
//      ivector iv3 = gmacs::parseIndexBlock(str,dimD,1,std::cout);
//      stro = gmacs::toIndexBlockString(iv3,dimD,1,std::cout);
//      std::cout<<"input  str = "<<str<<endl;
//      std::cout<<"output str = "<<stro<<endl;
//      cout<<endl;
//      //--
//      str = "[10]";
//      ivector iv4a = gmacs::parseIndexBlock(str,dimD,1,std::cout);
//      stro = gmacs::toIndexBlockString(iv4a,dimD,1,std::cout);
//      std::cout<<"input  str = "<<str<<endl;
//      std::cout<<"output str = "<<stro<<endl;
//      cout<<endl;
//      //--
//      str = "[200]";
//      ivector iv4b = gmacs::parseIndexBlock(str,dimD,1,std::cout);
//      stro = gmacs::toIndexBlockString(iv4b,dimD,1,std::cout);
//      std::cout<<"input  str = "<<str<<endl;
//      std::cout<<"output str = "<<stro<<endl;
//      cout<<endl;
//      //--
//      str = "[27.5:40;45;-1:-1;72.5;200]";
//      ivector iv5 = gmacs::parseIndexBlock(str,dimD,1,std::cout);
//      stro = gmacs::toIndexBlockString(iv5,dimD,1,std::cout);
//      std::cout<<"input  str = "<<str<<endl;
//      std::cout<<"output str = "<<stro<<endl;
//      cout<<endl;
//      cout<<"#--done testing parseIndexBlock and toIndexBlockString for dvectors"<<endl<<endl;
//    }
//    {
//      cout<<"testing IndexBlock<ivector,int>"<<endl;
//      ivector dimI(0,10);
//      for (int i=dimI.indexmin();i<=dimI.indexmax();i++) dimI[i] = 2010+i;
//      IndexBlock<ivector,int>::debug = 1;
//      IndexBlock<ivector,int>* pIdxBlk = new IndexBlock<ivector,int>(dimI);
//      cout<<"Created pIdxBlk"<<endl;
//      adstring str;
//      str = "[2012:2015;2018;2019]";
//      pIdxBlk->parseString(str);
//      cout<<pIdxBlk->getIndexVector()<<endl;
//      cout<<pIdxBlk->getValues()<<endl;
//      cout<<"finished testing IndexBlock<ivector,int>"<<endl;
//    }
    // {
    //   cout<<"testing blocks"<<endl;
    //   adstring fn = "gmacs_ctl.dat";
    //   ad_comm::change_datafile_name(fn);
    //   cout<<"\ttesting time blocks"<<endl;
    //   ivector dimTime(0,10);//note: 0-based index
    //   for (int i=0;i<=10;i++) dimTime[i] = 2010+i;
    //   TimeBlocks* pTBs = new TimeBlocks(dimTime);
    //   pTBs->read(*(ad_comm::global_datafile));
    //   cout<<(*pTBs);
    //   delete pTBs;
    //   cout<<endl;
    //   cout<<"\ttesting size blocks"<<endl;
    //   dvector dimZCs(0,32);//note: 0-based index
    //   for (int i=0;i<=32;i++) dimZCs[i] = 25.0+5*i;
    //   SizeBlocks* pZBs = new SizeBlocks(dimZCs);
    //   pZBs->read(*(ad_comm::global_datafile));
    //   cout<<(*pZBs);
    //   delete pZBs;
    //   cout<<endl;
    // }
    ECHOSTR("#--------FINISHED SANDBOX-----------")
//    exit(-1);
  }

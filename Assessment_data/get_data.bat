@echo off

set /p dir=[Enter the root directory of the folder that holds the Version of GMACS you're considering (either the 'Dvpt_Version' or the 'Latest_Version')]
set /p Ver= [Enter the Version of GMACS to consider ('Dvpt_Version' or 'Latest_Version') and press enter]


set "BBRKC=\build\BBRKC\"
set "SMBKC=\build\SMBKC\"
set "WAG=\build\AIGKC\WAG\"
set "EAG=\build\AIGKC\EAG\"
set "SNOW_crab=\build\SNOW_crab\"

set "DirBBRKC= "%dir%%Ver%%BBRKC%""
set "DirSMBKC= "%dir%%Ver%%SMBKC%""
set "DirWAG= "%dir%%Ver%%WAG%""
set "DirEAG= "%dir%%Ver%%EAG%""
set "DirSNOW= "%dir%%Ver%%SNOW_crab%""

copy BBRKC\bbrkc21.prj %DirBBRKC%
copy BBRKC\bbrkc21-193d.dat %DirBBRKC%
copy BBRKC\bbrkc211.ctl %DirBBRKC%
copy BBRKC\gmacs.dat %DirBBRKC%

copy SMBKC\sm22.PRJ %DirSMBKC%
copy SMBKC\sm22.DAT %DirSMBKC%
copy SMBKC\sm22.CTL %DirSMBKC%
copy SMBKC\gmacs.DAT %DirSMBKC%

copy AIGKC\EAG\gmacs8cEAG21_1eUpdate2CatchNo.PRJ %DirEAG%
copy AIGKC\EAG\Gmacs8cEAG21_1eUpdate2CatchNo.DAT %DirEAG%
copy AIGKC\EAG\Gmacs8cEAG21_1eUpdate2CatchNo.CTL %DirEAG%
copy AIGKC\EAG\gmacs.DAT %DirEAG%

copy AIGKC\WAG\gmacs8cWAG21_1eUpdate2CatchNo.PRJ %DirWAG%
copy AIGKC\WAG\gmacs8cWAG21_1eUpdate2CatchNo.DAT %DirWAG%
copy AIGKC\WAG\Gmacs8cWAG21_1eUpdate2CatchNo.CTL %DirWAG%
copy AIGKC\WAG\gmacs.DAT %DirWAG%

copy SNOW_crab\*.prj %DirSNOW%
copy SNOW_crab\*.dat %DirSNOW%
copy SNOW_crab\*.ctl %DirSNOW%

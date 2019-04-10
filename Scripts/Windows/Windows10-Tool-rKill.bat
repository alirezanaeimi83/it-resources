@echo off 

REM Download and run rKill
REM Author: Justin Chapdelaine
REM Version: 20190409.3
REM Source: https://github.com/justinchapdelaine/IT-Resources

echo Downloading rKill
bitsadmin /transfer "Downloading rKill..." /download /priority normal https://github.com/justinchapdelaine/IT-Resources/raw/master/Tools/rk.exe C:\STS\Programs\rk.exe
echo:

echo Start rKill
start C:\STS\Programs\rk.exe
echo:

PAUSE


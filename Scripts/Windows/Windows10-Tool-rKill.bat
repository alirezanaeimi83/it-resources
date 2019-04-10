@echo off 

REM Download and run rKill
REM Author: Justin Chapdelaine
REM Version: 20190409.3
REM Source: https://github.com/justinchapdelaine/IT-Resources

echo Create STS directory
mkdir C:\STS\Programs

echo Downloading rKill 2.9.1.0
bitsadmin /transfer "Downloading rKill..." /download /priority normal https://dl.dropboxusercontent.com/s/7n94ql9zog1l1uf/rkill.exe C:\STS\Programs\rkill.exe
echo:

echo Start rKill
start C:\STS\Programs\rkill.exe
echo:

PAUSE

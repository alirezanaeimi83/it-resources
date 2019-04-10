@echo off 

REM Download and run rKill
REM Author: Justin Chapdelaine
REM Version: 20190409.3
REM Source: https://github.com/justinchapdelaine/IT-Resources

echo 1. Create STS directory
mkdir C:\STS\Programs
echo:

echo 2. Downloading rKill 2.9.1.0
bitsadmin /transfer "Downloading rKill..." /download /priority normal https://dl.dropboxusercontent.com/s/7n94ql9zog1l1uf/rkill.exe C:\STS\Programs\rkill.exe
echo:

echo 3. Start rKill
start C:\STS\Programs\rkill.exe
echo:

PAUSE

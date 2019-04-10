@echo off 

REM Download and run AdwCleaner
REM Author: Justin Chapdelaine
REM Version: 20190409.2
REM Source: https://github.com/justinchapdelaine/IT-Resources

echo Downloading AdwCleaner
bitsadmin /transfer "Downloading AdwCleaner..." /download /priority normal https://github.com/justinchapdelaine/IT-Resources/raw/master/Tools/adw.exe C:\STS\Programs\adw.exe

echo Start AdwCleaner
start C:\STS\Programs\adw.exe

PAUSE

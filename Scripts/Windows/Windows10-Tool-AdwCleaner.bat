@echo off 

REM Download and run AdwCleaner
REM Author: Justin Chapdelaine
REM Version: 20190409.3
REM Source: https://github.com/justinchapdelaine/IT-Resources

echo Downloading AdwCleaner 7.3
bitsadmin /transfer "Downloading AdwCleaner..." /download /priority normal https://dl.dropboxusercontent.com/s/h8rwawulb1i64l8/adwcleaner_7.3.exe C:\STS\Programs\adwcleaner_7.3.exe
echo:

echo Start AdwCleaner
start C:\STS\Programs\adw.exe
echo:

PAUSE

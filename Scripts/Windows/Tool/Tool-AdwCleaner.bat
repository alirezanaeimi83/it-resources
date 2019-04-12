@echo off 

REM Download and run AdwCleaner
REM Author: Justin Chapdelaine
REM Version: 20190409.3
REM Source: https://github.com/justinchapdelaine/IT-Resources

echo 1. Create STS directory
mkdir C:\STS\Programs
echo:

echo 2. Download AdwCleaner
REM bitsadmin /transfer "Downloading AdwCleaner..." /download /priority normal https://dl.dropboxusercontent.com/s/h8rwawulb1i64l8/adwcleaner_7.3.exe C:\STS\Programs\adwcleaner_7.3.exe

powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/justinchapdelaine/IT-Resources/master/Tools/adw.exe', 'C:\STS\Programs\adw.exe')"
echo:

echo 3. Start AdwCleaner
start C:\STS\Programs\adw.exe
echo:

PAUSE

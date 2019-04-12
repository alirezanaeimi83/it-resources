@echo off 

REM Download and run AdwCleaner
REM Author: Justin Chapdelaine
REM Version: 20190409.3
REM Source: https://github.com/justinchapdelaine/IT-Resources

echo 1. Create STS directory
mkdir C:\STS\Programs
echo:

echo 2. Downloading AdwCleaner
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/justinchapdelaine/IT-Resources/master/Tools/adw.exe', 'C:\STS\Programs\adw.exe')"
echo:

echo 3. Starting AdwCleaner
start C:\STS\Programs\adw.exe
echo:

PAUSE

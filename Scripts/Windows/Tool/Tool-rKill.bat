@echo off 

REM Download and run rKill
REM Author: Justin Chapdelaine
REM Version: 20190409.3
REM Source: https://github.com/justinchapdelaine/IT-Resources

echo 1. Create STS directory
mkdir C:\STS\Programs
echo:

echo 2. Downloading rKill
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/justinchapdelaine/IT-Resources/master/Tools/rk.exe', 'C:\STS\Programs\rk.exe')"
echo:

echo 3. Starting rKill
start C:\STS\Programs\rk.exe
echo:

PAUSE

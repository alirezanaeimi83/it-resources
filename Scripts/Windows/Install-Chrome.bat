@echo off

::--------------------------------------------------
:: Install Google Chrome
:: 
:: File Name    : Install-Chrome.bat
:: Author       : Justin Chapdelaine (@email)
:: Updated      : 2019-07-05
:: 
:: Script posted at:
:: https://github.com/justinchapdelaine/it-resources
::--------------------------------------------------

:: Variables
set "folder=C:\STS\Programs\"
set "file=Google_Chrome.exe"
set "url=https://dl.google.com/chrome/install/latest/chrome_installer.exe"
set "flags="


:: Create %folder%
if not exist %folder% ( mkdir %folder% && echo %folder% created)

:: Download %file% from %url% to %folder%
echo 1. Downloading %file%
PowerShell -NoProfile -Command "(New-Object Net.WebClient).DownloadFile('%url%', '%folder%%file%')"

:: Start %file%
echo 2. Starting %file%
start %folder%%file%%flags%

:: Close window in 5 seconds
timeout /t 5
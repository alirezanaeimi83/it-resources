@echo off

::--------------------------------------------------
:: Downlod and run Kaspersky Virus Removal Tool
:: 
:: File Name    : Get-KVRT.bat
:: Author       : Justin Chapdelaine (@email)
:: Updated      : 2019-07-05
:: 
:: Script posted at:
:: https://github.com/justinchapdelaine/it-resources
::--------------------------------------------------

:: Variables
set "folder=C:\STS\Programs\"
set "file=KVRT.exe"
set "url=http://devbuilds.kaspersky-labs.com/devbuilds/KVRT/latest/full/KVRT.exe"


:: Create %folder%
if not exist %folder% ( mkdir %folder% && echo %folder% created)

:: Download %file% from %url% to %folder%
echo 1. Downloading %file%
PowerShell -NoProfile -Command "(New-Object Net.WebClient).DownloadFile('%url%', '%folder%%file%')"

:: Start %file%
echo 2. Starting %file%
start %folder%%file%

:: Close window in 5 seconds
timeout /t 5
@echo off

::--------------------------------------------------
:: Install Norton 360
:: 
:: File Name    : Install-Noront360.bat
:: Author       : Justin Chapdelaine (@email)
:: Updated      : 2019-07-17
:: 
:: Script posted at:
:: https://github.com/justinchapdelaine/it-resources
::--------------------------------------------------

:: Variables
set "folder=C:\STS\Programs\"
set "file=Norton_360.exe"
set "url=https://dls.symantec.com/v1/downloads?downloadId=9a4a8b4d-0012-4635-bebc-c7a3cfaaed47"
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
@echo off

::--------------------------------------------------
:: Downlod and run Norton Power Eraser
:: 
:: File Name    : Get-NortonPE.bat
:: Author       : Justin Chapdelaine (@email)
:: Updated      : 2019-08-05
:: 
:: Script posted at:
:: https://github.com/justinchapdelaine/it-resources
::--------------------------------------------------

:: Variables
set "folder=C:\STS\Programs\"
set "file=NPE.exe"
set "url=https://support.norton.com/sp/static/external/NPE/5.3/prod/en/NPE.exe"
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
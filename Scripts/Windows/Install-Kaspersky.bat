@echo off

::--------------------------------------------------
:: Install Kaspersky Internet Security
:: 
:: File Name    : Install-Kaspersky.bat
:: Author       : Justin Chapdelaine (@email)
:: Updated      : 2019-07-05
:: 
:: Script posted at:
:: https://github.com/justinchapdelaine/it-resources
::--------------------------------------------------

:: Variables
set "folder=C:\STS\Programs\"
set "file=Kaspersky_Internet_Security.exe"
set "url=https://trial.s.kaspersky-labs.com/registered/oaavni0cztkt4nb17kzs/27c9b336/startup_14442.exe"


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
@echo off

::--------------------------------------------------
:: Install Norton Deluxe
:: 
:: File Name    : Install-NortonDeluxe.bat
:: Author       : Justin Chapdelaine (@email)
:: Updated      : 2019-07-05
:: 
:: Script posted at:
:: https://github.com/justinchapdelaine/it-resources
::--------------------------------------------------

:: Variables
set "folder=C:\STS\Programs\"
set "file=Norton_Deluxe.exe"
set "url=https://lcdls.symantec.com/93639012/AynW7R0BGKNVU00FOAUEbimf+/AbcX003MD/////%2F%26%7E%2F%26%7E%2F%26%7E%2F%26%7E%2F%26%7E%2F%26%7E%2F%26%7E%2F%26%7E%2F%26%7E%2F%26%7E/NSDownloader.exe?LNG=eng-USA&latest=true"


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
@echo off

::--------------------------------------------------
:: Downlod and run Microsoft Safety Scanner
:: 
:: File Name    : Get-MicrosoftScanner.bat
:: Author       : Justin Chapdelaine (@email)
:: Updated      : 2019-11-27
:: 
:: Script posted at:
:: https://github.com/justinchapdelaine/it-resources
::--------------------------------------------------

:: Variables
set "folder=C:\STS\Programs\"
set "file=MSERT.exe"
set "url32=https://go.microsoft.com/fwlink/?LinkId=212733"
set "url64=https://go.microsoft.com/fwlink/?LinkId=212732"
set "flags= /F:Y"

:: Create %folder%
if not exist %folder% ( mkdir %folder% && echo %folder% created)

:: Determine is OS is 32 or 64 bit
wmic os get osarchitecture | find /i "32-bit" > NUL && set osType=32bit || set osType=64bit

:: Download %file% from %url% to %folder%
if %osType% == 32bit (
    echo This is a %osType% operating system
    echo:
    echo 1. Downloading %file%
    PowerShell -NoProfile -Command "(New-Object Net.WebClient).DownloadFile('%url32%', '%folder%%file%')"
)

:: Download %file% from %url% to %folder%
if %osType% == 64bit (
    echo This is a %osType% operating system
    echo:
    echo 1. Downloading %file%
    PowerShell -NoProfile -Command "(New-Object Net.WebClient).DownloadFile('%url64%', '%folder%%file%')"
)

:: Start %file%
echo 2. Starting %file%
start %folder%%file%%flags%

:: Close window in 5 seconds
timeout /t 5
@echo off

::--------------------------------------------------
:: Copy data from source to destination
:: 
:: File Name    : Copy-Data.bat
:: Author       : Justin Chapdelaine (@email)
:: Updated      : 2019-10-27
:: 
:: Script posted at:
:: https://github.com/justinchapdelaine/it-resources
::--------------------------------------------------

:: Run script as administrator
:checkPrivileges

NET FILE 1>NUL 2>NUL

if '%errorlevel%' == '0' (
    goto mainScript 
) else (
    goto getPrivileges
)
::-------------------------------------------------------------------------------------------------

:getPrivileges

if '%1'=='ELEV' (shift & goto mainScript)
echo Requesting administrative privileges...
setlocal DisableDelayedExpansion
set "batchPath=%~0"
setlocal EnableDelayedExpansion
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\runAsAdmin.vbs"
echo UAC.ShellExecute "!batchPath!", "ELEV", "", "runas", 1 >> "%temp%\runAsAdmin.vbs"
"%temp%\runAsAdmin.vbs"
exit /B
::-------------------------------------------------------------------------------------------------

:: Running as administrator
:mainScript

echo Please enter the full path of the source (ie. D:\Users): 
set /p "source="

echo Please enter the full path of the destination (ie. C:\Users\Owner\Desktop\O942A1E1): 
set /p "destination="

:: Get source folder name
for %%f in ("%source%") do set name=%%~nxf

:: If source is root of drive label as root
if "%name" == "" (
    set "name=root"
)

:: Copy files from a source to a destination and write a log file
robocopy "%source%" "%destination%\%name%" /e /xj /eta /r:1 /w:0 /zb /efsraw /log:"%destination%\Log-%name%.txt" /np /tee

echo A log has been saved to %destination%\Log-%name%.txt
pause

@echo off

::--------------------------------------------------
:: Copy data from source to destination
:: 
:: File Name    : Copy-Data.bat
:: Author       : Justin Chapdelaine (@email)
:: Updated      : 2020-01-05
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

:: Information
echo Please select a Source and Destination folder.
echo.

:: Get source folder
set "psCommand="(new-object -COM 'Shell.Application').BrowseForFolder(0,'Please choose a source folder.',0,0).self.path""
for /f "usebackq delims=" %%I in (`powershell %psCommand%`) do set "source=%%I"

:: Get destination folder
set "psCommand="(new-object -COM 'Shell.Application').BrowseForFolder(0,'Please choose a destination folder.',0,0).self.path""
for /f "usebackq delims=" %%I in (`powershell %psCommand%`) do set "destination=%%I"

:: Confirm selection is correct
echo Source: %source%
echo Destination: %destination%
echo.
echo Is the above Source and Destination correct? [y/n]
set /p "confirm="

if NOT "%confirm%" == "y" (
    cls
    goto mainScript
)

:: Get source folder name
for %%f in ("%source%") do set name=%%~nxf

:: If source is root of drive label as root
if "%name%" == "" (
    set "name=Root"
)

:: If source is a root drive, escape the escape character
if %source:~-1%==\ (
    set "source=%source%."
)

:: Copy files from a source to a destination and write a log file
robocopy "%source%" "%destination%\%name%" /e /xj /eta /r:1 /w:0 /zb /efsraw /v /xf desktop.ini /log:"%destination%\CopyLog-%name%.txt" /np /tee

echo Migrated all data from %source% to %destination%
echo A log has been saved to %destination%\CopyLog-%name%.txt
pause
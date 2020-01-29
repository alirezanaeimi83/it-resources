@echo off

::--------------------------------------------------
:: Display the folder size of a selected source
:: 
:: File Name    : Get-FolderSize.bat
:: Author       : Justin Chapdelaine (@email)
:: Updated      : 2020-01-28
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
echo Please select the source you would like to find the size of.
echo.

:: Get source folder
set "psCommand="(new-object -COM 'Shell.Application').BrowseForFolder(0,'Please choose a source folder.',0,0).self.path""
for /f "usebackq delims=" %%I in (`powershell %psCommand%`) do set "source=%%I"

:: Dummy destination folder
set "destination=C:\STS"

:: Confirm selection is correct
echo Source: %source%
echo Is the above source correct? [y/n]
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

:: Determine total size of source and display results
robocopy "%source%" "%destination%\%name%" /e /xj /eta /r:1 /w:0 /zb /efsraw /v /xf desktop.ini /np /njh /ndl /nc /ns /nfl /l

echo See the above results under total for the size of the selected source.
pause
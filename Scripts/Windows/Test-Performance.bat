@echo off

::--------------------------------------------------
:: Test system performance using WinSAT
:: 
:: File Name    : Test-Performance.bat
:: Author       : Justin Chapdelaine (@email)
:: Updated      : 2019-09-015
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

:: Test boot partition file system
echo 1. Testing system performance
winsat prepop
echo:

:: Test operating system integrity
echo 2. Displaying results
PowerShell -NoProfile -Command "Get-WmiObject -Class Win32_WinSAT"
echo "WinSAT reports WEI scores on a scale from 1.0 to 5.9 for Windows Vista, 7.9 for Windows 7, and 9.9 for Windows 8 and Windows 10."
REM https://en.wikipedia.org/wiki/Windows_System_Assessment_Tool
echo:

:: Wait to close
pause
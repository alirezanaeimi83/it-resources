@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

REM Repair system image and system files
REM Author: Justin Chapdelaine
REM Version: 20190330.1
REM Source: https://github.com/justinchapdelaine/IT-Resources

REM Source:
REM https://support.microsoft.com/en-ca/help/929833/use-the-system-file-checker-tool-to-repair-missing-or-corrupted-system

echo 1. Repair system image
DISM.exe /Online /Cleanup-image /Restorehealth
echo:

echo 2. Repair system files
sfc /scannow
echo:

PAUSE

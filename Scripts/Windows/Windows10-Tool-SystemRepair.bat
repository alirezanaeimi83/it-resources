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

REM Repair file system and operating system
REM Author: Justin Chapdelaine
REM Version: 20190404.1
REM Source: https://github.com/justinchapdelaine/IT-Resources

REM Source:
REM https://support.microsoft.com/en-ca/help/929833/use-the-system-file-checker-tool-to-repair-missing-or-corrupted-system

echo 1. File system repair
chkdsk /scan
echo:

echo 2. Repair operating system image
DISM.exe /Online /Cleanup-image /Restorehealth
echo:

echo 3. Repair operating system
sfc /scannow
echo:

PAUSE

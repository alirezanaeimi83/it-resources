@echo off

::--------------------------------------------------
:: Test boot partition and system integrity
:: 
:: File Name    : Test-System.bat
:: Author       : Justin Chapdelaine (@email)
:: Updated      : 2019-07-05
:: 
:: Script posted at:
:: https://github.com/justinchapdelaine/it-resources
::--------------------------------------------------

REM  --> Elevate permissions
:: Self elevate script if not run as administrator
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

:: Test boot partition file system
echo 1. Repair boot partition file system
chkdsk /scan
echo:

:: Repair operating system component store
echo 2. Repair operating system component store
DISM.exe /Online /Cleanup-image /Restorehealth
echo:

:: Test operating system integrity
echo 2. Repair operating system integrity
sfc /scannow
echo:

:: Wait to close
pause
@echo off

REM  --> Elevate permissions
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

REM Create Start Menu tiles template
REM Author: Justin Chapdelaine
REM Version: 20190426.1
REM Source: https://github.com/justinchapdelaine/IT-Resources
	
SET APPDIR=%~dp0
SET ASSETDIR=%APPDIR%assets\
cd %APPDIR%
%~d0

IF NOT EXIST "%ASSETDIR%" GOTO CREATE_ASSET_DIR
echo Removing previous backup...
rmdir /s/q "%ASSETDIR%"


:CREATE_ASSET_DIR
echo ### Creating new backup dir in %ASSETDIR%
mkdir "%ASSETDIR%"


echo 1. Killing File Explorer...
taskkill /f /im explorer.exe


echo 2. File backup in progress!
robocopy "%LocalAppData%\Microsoft\Windows\CloudStore" "%ASSETDIR%CloudStore" /E
robocopy "%LocalAppData%\Microsoft\Windows\Caches" "%ASSETDIR%Caches" /E
robocopy "%LocalAppData%\Microsoft\Windows\Explorer" "%ASSETDIR%Explorer" /E


echo 3. Registry key backup in progress!
reg export HKCU\Software\Microsoft\Windows\CurrentVersion\CloudStore "%ASSETDIR%CloudStore.reg"


echo 4. Restarting File Explorer...
start explorer.exe
start .


:END
echo Start Menu template created!
PAUSE

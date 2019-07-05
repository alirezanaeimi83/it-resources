@echo off

::--------------------------------------------------
:: Set Windows 10 start menu tiles to specific layout
:: 
:: File Name    : Set-Tiles.bat
:: Author       : Justin Chapdelaine (@email)
:: Updated      : 2019-07-05
:: 
:: Script posted at:
:: https://github.com/justinchapdelaine/it-resources
::--------------------------------------------------

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

SET APPDIR=%~dp0
SET ASSETDIR=%APPDIR%assets\
cd %APPDIR%
%~d0

IF NOT EXIST "%ASSETDIR%" (
		
		echo ASSET DIRECTORY NOT FOUND!
		echo Please run Tool-BackupTiles.bat first with a desired setup to create a template.
		GOTO END
	)


echo 1. Killing File Explorer...
taskkill /f /im explorer.exe


echo 2. File restore in progress!
rmdir /s/q "%LocalAppData%\Microsoft\Windows\CloudStore"
robocopy "%ASSETDIR%CloudStore" "%LocalAppData%\Microsoft\Windows\CloudStore" /E

rmdir /s/q "%LocalAppData%\Microsoft\Windows\Caches"
robocopy "%ASSETDIR%Caches" "%LocalAppData%\Microsoft\Windows\Caches" /E

rmdir /s/q "%LocalAppData%\Microsoft\Windows\Explorer"
robocopy "%ASSETDIR%Explorer" "%LocalAppData%\Microsoft\Windows\Explorer" /E


echo 3. Registry key restore in progress!
reg import "%ASSETDIR%CloudStore.reg"


echo 4. Restarting File Explorer...
start explorer.exe
start .


:END
echo Start Menu template applied!
PAUSE
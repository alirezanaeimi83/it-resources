@echo off

::--------------------------------------------------
:: Set Windows 10 to show This PC and User desktop icons and set Time and Time Zone to autmatic
:: 
:: File Name    : Set-Tiles.bat
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

SET APPDIR=%~dp0
SET ASSETDIR=%APPDIR%assets\
cd %APPDIR%
%~d0

:: Get the default user localization
for /f "delims=" %%a in ('powershell (Get-WinUserLanguageList^)[0].LanguageTag') do set language=%%a
echo Language: %language%
echo:

echo Setting desktop icons and time settings...
echo:

echo 1. Display This PC
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel /v {20D04FE0-3AEA-1069-A2D8-08002B30309D} /t REG_DWORD /d 0 /f
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu /v {20D04FE0-3AEA-1069-A2D8-08002B30309D} /t REG_DWORD /d 0 /f
echo:

echo 2. Display User Folder
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel /v {59031a47-3f72-44a7-89c5-5595fe6b30ee} /t REG_DWORD /d 0 /f
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu /v {59031a47-3f72-44a7-89c5-5595fe6b30ee} /t REG_DWORD /d 0 /f
echo:

echo 3. Display Settings
if "%language%"=="fr-CA" (
    copy "%ASSETDIR%shortcuts\Paramätres.lnk" "%HOMEPATH%\Desktop"
) else (
    copy "%ASSETDIR%shortcuts\Settings.lnk" "%HOMEPATH%\Desktop"
)
echo:

echo 4. Set Time and Time Zone automatically
REG ADD HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Parameters /v Type /t REG_SZ /d NTP /f
REG ADD HKLM\SYSTEM\CurrentControlSet\Services\tzautoupdate /v Start /t REG_DWORD /d 3 /f
echo:

echo 5. Restart explorer to refresh desktop
taskkill /f /im explorer.exe
start explorer.exe
start .
echo:

echo All done!
PAUSE
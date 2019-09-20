@echo off

::--------------------------------------------------
:: Update drivers from the Microsoft Update Catalog
:: 
:: File Name    : Update-Drivers.bat
:: Author       : Justin Chapdelaine (@email)
:: Updated      : 2019-07-09
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

:: Create PowerShell modules folder
set "modulesFolder=%windir%\System32\WindowsPowerShell\v1.0\Modules\"
if not exist %modulesFolder% ( mkdir %modulesFolder% && echo %modulesFolder% created)

echo 1. Initializing driver updater...
echo:

:: Install NuGet package provider
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force" >nul
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Import-PackageProvider -Name NuGet -RequiredVersion 2.8.5.201" >nul

:: Import the PSWindowsUpdate module
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Find-Module -Name PSWindowsUpdate | Install-Module -Force -Scope CurrentUser" >nul
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Import-Module PSWindowsUpdate" >nul

:: Add Windows Update ServiceID
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Add-WUServiceManager -ServiceID 7971f918-a847-4430-9279-4a52d1efe18d -Confirm:$false" >nul

:: Update all drivers
echo 2. Searching for driver updates...
echo:
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Install-WindowsUpdate -MicrosoftUpdate -UpdateType Driver -AcceptAll -IgnoreReboot -Verbose"

:: Uninstall PSWindowsUpdate module
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Uninstall-Module PSWindowsUpdate"

:: Uninstall NuGet package provider
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-PackageProvider -Name NuGet | Uninstall-Package -Force"

echo:
echo Driver updates complete! A reboot may be required.
pause
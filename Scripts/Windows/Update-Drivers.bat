@echo off

::--------------------------------------------------
:: Update drivers from the Microsoft Catalog
:: 
:: File Name    : Update-Drivers.bat
:: Author       : Justin Chapdelaine (@email)
:: Updated      : 2019-07-09
:: 
:: Script posted at:
:: https://github.com/justinchapdelaine/it-resources
::--------------------------------------------------

REM PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0Update-Drivers.ps1""' -Verb RunAs}"

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

:: Import the PSWindowsUpdate module
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Find-Module -Name PSWindowsUpdate | Install-Module -Force -Scope CurrentUser"

:: Add Windows Update ServiceID
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Add-WUServiceManager -ServiceID 7971f918-a847-4430-9279-4a52d1efe18d -Confirm:$false"

:: Update all drivers
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-WUInstall -MicrosoftUpdate Driver -AcceptAll"

pause
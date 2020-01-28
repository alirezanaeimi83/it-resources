@echo off

::--------------------------------------------------
:: Perform malware remediation using built in Windows Defender
:: 
:: File Name    : Start-Defender.bat
:: Author       : Justin Chapdelaine (@email)
:: Updated      : 2020-01-27
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

echo Starting malware remediation with Windows Defender
echo:

:: Update signature database
"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -SignatureUpdate
echo:

:: Scan boot sector
echo Boot sector remediation:
"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -Scan -ScanType -BootSectorScan
echo:

:: Full system scan
echo Full system remediation:
"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -Scan -ScanType 2
echo:

pause
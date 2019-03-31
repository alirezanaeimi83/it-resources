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

REM Start Service will get serial number, disable sleep, and get S.M.A.R.T. status, Create restore point
REM Author: Justin Chapdelaine
REM Version: 20190323.1
REM Source: https://github.com/justinchapdelaine/IT-Resources

rem Serial Number
wmic bios get serialnumber

echo Disable sleep and monitor timeout
powercfg /change monitor-timeout-ac 0
powercfg /change standby-timeout-ac 0
echo Done 

echo S.M.A.R.T. status
wmic diskdrive get status 

echo Create initial restore point
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Enable-ComputerRestore -Drive 'C:\'"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "vssadmin Resize ShadowStorage /For=C: /On=C: /MaxSize=5%"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Checkpoint-Computer -Description 'STAPLES - Setup Start'"
echo: 

echo Start your setup!
PAUSE

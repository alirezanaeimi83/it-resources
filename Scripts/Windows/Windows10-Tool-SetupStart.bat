@echo off

REM Start Service will get serial number, disable sleep, and get S.M.A.R.T. status
REM Author: Justin Chapdelaine
REM Version: 20190323.1
REM Source: https://github.com/justinchapdelaine/IT-Resources

echo Serial Number
wmic bios get serialnumber
rem

echo Disable sleep and monitor timeout
powercfg /change monitor-timeout-ac 0
powercfg /change standby-timeout-ac 0
rem

echo S.M.A.R.T. status
wmic diskdrive get status
rem

REM Create initial restore point
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Checkpoint-Computer -Description 'STAPLES - Setup Start'"
rem

echo Start your setup!
PAUSE

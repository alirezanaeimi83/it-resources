REM Start Service will get serial number, disable sleep, and get S.M.A.R.T. status
REM Author: Justin Chapdelaine
REM Version: 20190323.1
REM Source: https://github.com/justinchapdelaine/IT-Resources

REM Serial Number
wmic bios get serialnumber

REM Disable sleep

REM S.M.A.R.T. status
wmic diskdrive get status

REM Create initial restore point
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Checkpoint-Computer -Description 'STAPLES - Start Setup'"

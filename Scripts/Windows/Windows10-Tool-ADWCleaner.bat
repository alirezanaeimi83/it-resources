REM Download ADWCleaner
REM Author: Justin Chapdelaine
REM Version: 20190323.1
REM Source: https://github.com/justinchapdelaine/IT-Resources

REM Downloading ADWCleaner to C:\STS
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "& {Invoke-WebRequest -Uri 'https://download.bleepingcomputer.com/dl/8f2cfe815fa12a8f7a057a0dbc9f879a/5c96a4c6/windows/security/security-utilities/a/adwcleaner/AdwCleaner.exe' -OutFile 'C:\STS\ADWCleaner.exe'}"

REM Download Done!
PAUSE

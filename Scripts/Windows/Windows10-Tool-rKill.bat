@echo off 

REM Download and run rKill
REM Author: Justin Chapdelaine
REM Version: 20190401.1
REM Source: https://github.com/justinchapdelaine/IT-Resources

echo Downloading rKill
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "& {$P = $env:TEMP + '\rk.exe'; Invoke-WebRequest 'https://github.com/justinchapdelaine/IT-Resources/raw/master/Tools/rk.exe' -OutFile $P; Start-Process -FilePath $P -Verb RunAs -Wait; Remove-Item $P}"
echo:

PAUSE

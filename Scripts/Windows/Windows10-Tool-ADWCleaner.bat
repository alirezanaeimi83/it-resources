@echo off 

REM Download and run ADWCleaner
REM Author: Justin Chapdelaine
REM Version: 20190330.1
REM Source: https://github.com/justinchapdelaine/IT-Resources

echo Downloading ADWCleaner
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "& {$P = $env:TEMP + '\adw.exe'; Invoke-WebRequest 'https://github.com/justinchapdelaine/IT-Resources/raw/master/Tools/adw.exe' -OutFile $P; Start-Process -FilePath $P -Args '' -Verb RunAs -Wait; Remove-Item $P}"
echo:

PAUSE

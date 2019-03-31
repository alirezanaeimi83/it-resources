@echo off 

REM Download and run ADWCleaner
REM Author: Justin Chapdelaine
REM Version: 20190330.1
REM Source: https://github.com/justinchapdelaine/IT-Resources

echo Downloading ADWCleaner
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "& {$P = $env:TEMP + '\adwcleaner_7.2.7.0.exe'; Invoke-WebRequest 'https://dl.dropboxusercontent.com/s/y11kuufqjgbvgh7/adwcleaner_7.2.7.0.exe' -OutFile $P; Start-Process -FilePath $P -Verb RunAs -Wait; Remove-Item $P}"
echo:

PAUSE

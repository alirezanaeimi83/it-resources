@echo off

REM Install Google Chrome
REM Author: Justin Chapdelaine
REM Version: 20190323.1
REM Source: https://github.com/justinchapdelaine/IT-Resources

echo Installing Google Chrome version Latest
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "& {$P = $env:TEMP + '\chrome_installer.exe'; Invoke-WebRequest 'https://dl.google.com/chrome/install/latest/chrome_installer.exe' -OutFile $P; Start-Process -FilePath $P -Args '/silent /install' -Verb RunAs -Wait; Remove-Item $P}"
echo:

echo Installation Done!
PAUSE

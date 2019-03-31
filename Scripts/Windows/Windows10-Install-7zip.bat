@echo off

REM Install 7-zip
REM Author: Justin Chapdelaine
REM Version: 20190323.1
REM Source: https://github.com/justinchapdelaine/IT-Resources

echo Installing 7-zip version 19.00
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "& {$P = $env:TEMP + '\7z1900-x64.exe'; Invoke-WebRequest 'https://www.7-zip.org/a/7z1900-x64.exe' -OutFile $P; Start-Process -FilePath $P -Args '/S /D="%PROGRAMFILES%\7-Zip"' -Verb RunAs -Wait; Remove-Item $P}"
echo:

echo Installation Done!
PAUSE

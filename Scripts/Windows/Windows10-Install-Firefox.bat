@echo off

REM Install Mozilla Firefox
REM Author: Justin Chapdelaine
REM Version: 20190330.1
REM Source: https://github.com/justinchapdelaine/IT-Resources

echo Installing Mozilla Firefox version 66.0.2
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "& {$P = $env:TEMP + '\Firefox%20Setup%2066.0.2.exe'; Invoke-WebRequest 'https://ftp.mozilla.org/pub/firefox/releases/66.0.2/win64/en-CA/Firefox%20Setup%2066.0.2.exe' -OutFile $P; Start-Process -FilePath $P -Args '-ms' -Verb RunAs -Wait; Remove-Item $P}"
echo:

echo Installation Done!
PAUSE

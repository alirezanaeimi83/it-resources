@echo off

REM Install Norton Dexlude
REM Author: Justin Chapdelaine
REM Version: 20190409.1
REM Source: https://github.com/justinchapdelaine/IT-Resources

echo Installing Norton Security Deluxe version Latest
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "& {$P = $env:TEMP + '\NSDeluxeDownloader.exe'; Invoke-WebRequest 'https://lcdls.symantec.com/93639012/AynW7R0BGKNVU00FOAUEbimf+/AbcX003MD/////%2F%26~%2F%26~%2F%26~%2F%26~%2F%26~%2F%26~%2F%26~%2F%26~%2F%26~%2F%26~/NSDownloader.exe?LNG=eng-USA&latest=true' -OutFile $P; Start-Process -FilePath $P -Verb RunAs -Wait; Remove-Item $P}"
echo:

echo Installation Done!
PAUSE

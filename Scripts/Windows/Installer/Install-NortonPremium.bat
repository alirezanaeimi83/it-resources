@echo off

REM Install Norton Premium
REM Author: Justin Chapdelaine
REM Version: 20190409.2
REM Source: https://github.com/justinchapdelaine/IT-Resources

echo Installing Norton Security Premium version Latest
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "& {$P = $env:TEMP + '\NSPremiumDownloader.exe'; Invoke-WebRequest 'https://lcdls.symantec.com/93639012/CXlwMQ0HR9DNR00RSDTAVsy/+/Abcb003MD/////%2F%26~%2F%26~%2F%26~%2F%26~%2F%26~%2F%26~%2F%26~%2F%26~%2F%26~%2F%26~/NSBUDownloader.exe?LNG=eng-USA&latest=true' -OutFile $P; Start-Process -FilePath $P -Verb RunAs -Wait; Remove-Item $P}"
echo:

echo Installation Done!
PAUSE

@echo off

REM Install Kaspersky Internet Security
REM Author: Justin Chapdelaine
REM Version: 20190409.1
REM Source: https://github.com/justinchapdelaine/IT-Resources

echo Installing Kaspersky Internet Security version Latest
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "& {$P = $env:TEMP + '\startup_14442.exe'; Invoke-WebRequest 'https://trial.s.kaspersky-labs.com/registered/oaavni0cztkt4nb17kzs/27c9b336/startup_14442.exe' -OutFile $P; Start-Process -FilePath $P -Verb RunAs -Wait; Remove-Item $P}"
echo:

echo Installation Done!
PAUSE

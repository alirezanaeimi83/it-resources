@echo off

REM Install Adobe Reader DC
REM Author: Justin Chapdelaine
REM Version: 20190330.1
REM Source: https://github.com/justinchapdelaine/IT-Resources

echo Installing Adobe Reader DC version 2019.010.20098
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "& {$P = $env:TEMP + '\AcroRdrDC1901020098_en_US.exe'; Invoke-WebRequest 'ftp://ftp.adobe.com/pub/adobe/reader/win/AcrobatDC/1901020098/AcroRdrDC1901020098_en_US.exe' -OutFile $P; Start-Process -FilePath $P -Args '/sAll /rs' -Verb RunAs -Wait; Remove-Item $P}"
echo:

echo Installation Done!
PAUSE

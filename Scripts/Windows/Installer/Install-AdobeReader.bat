@echo off

REM Install Adobe Reader DC
REM Author: Justin Chapdelaine
REM Version: 20190330.1
REM Source: https://github.com/justinchapdelaine/IT-Resources

echo Installing Adobe Reader DC version 2019.010.20099
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "& {$P = $env:TEMP + '\AcroRdrDC1901020099_en_US.exe'; Invoke-WebRequest 'http://ardownload.adobe.com/pub/adobe/reader/win/AcrobatDC/1901020099/AcroRdrDC1901020099_en_US.exe' -OutFile $P; Start-Process -FilePath $P -Args '/sAll /rs' -Verb RunAs -Wait; Remove-Item $P}"
echo:

echo Installation Done!
PAUSE

REM Install basic software on new setup
REM Author: Justin Chapdelaine
REM Version: 20190323.2
REM Source: https://github.com/justinchapdelaine/IT-Resources

REM Install Google Chrome version Latest
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "& {$P = $env:TEMP + '\chrome_installer.exe'; Invoke-WebRequest 'https://dl.google.com/chrome/install/latest/chrome_installer.exe' -OutFile $P; Start-Process -FilePath $P -Args '/silent /install' -Verb RunAs -Wait; Remove-Item $P}"

REM Install 7-zip version 19.00
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "& {$P = $env:TEMP + '\7z1900-x64.exe'; Invoke-WebRequest 'https://www.7-zip.org/a/7z1900-x64.exe' -OutFile $P; Start-Process -FilePath $P -Args '/S /D="%PROGRAMFILES%\7-Zip"' -Verb RunAs -Wait; Remove-Item $P}"

REM Install VLC Media Player version 3.0.6
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "& {$P = $env:TEMP + '\vlc-3.0.6-win64.exe'; Invoke-WebRequest 'https://mirrors.syringanetworks.net/videolan/vlc/3.0.6/win64/vlc-3.0.6-win64.exe' -OutFile $P; Start-Process -FilePath $P -Args '/L=1033 /S' -Verb RunAs -Wait; Remove-Item $P}"

REM Install Adobe Reader DC version 2019.010.20098
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "& {$P = $env:TEMP + '\AcroRdrDC1901020098_en_US.exe'; Invoke-WebRequest 'ftp://ftp.adobe.com/pub/adobe/reader/win/AcrobatDC/1901020098/AcroRdrDC1901020098_en_US.exe' -OutFile $P; Start-Process -FilePath $P -Args '/sAll /rs' -Verb RunAs -Wait; Remove-Item $P}"

REM Installation Done!
PAUSE

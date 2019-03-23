REM Install basic software on new setup
REM Author: Justin Chapdelaine
REM Version: 20190321.1
REM Source: https://github.com/justinchapdelaine/IT-Resources

REM Install Google Chrome ver Latest
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "& {$P = $env:TEMP + '\chrome_installer.exe'; Invoke-WebRequest 'https://dl.google.com/chrome/install/latest/chrome_installer.exe' -OutFile $P; Start-Process -FilePath $P -Args '/silent /install' -Verb RunAs -Wait; Remove-Item $P}"

REM Install 7-zip ver 19.00
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "& {$P = $env:TEMP + '\7z1900-x64.exe'; Invoke-WebRequest 'https://www.7-zip.org/a/7z1900-x64.exe' -OutFile $P; Start-Process -FilePath $P -Args '/S /D="%PROGRAMFILES%\7-Zip"' -Verb RunAs -Wait; Remove-Item $P}"

REM Install VLC Media Player ver 3.0.6
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "& {$P = $env:TEMP + '\vlc-3.0.6-win64.exe'; Invoke-WebRequest 'https://mirrors.syringanetworks.net/videolan/vlc/3.0.6/win64/vlc-3.0.6-win64.exe' -OutFile $P; Start-Process -FilePath $P -Args '/L=1033 /S' -Verb RunAs -Wait; Remove-Item $P}"

PAUSE
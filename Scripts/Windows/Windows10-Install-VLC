REM Install VLC Media Player
REM Author: Justin Chapdelaine
REM Version: 20190323.1
REM Source: https://github.com/justinchapdelaine/IT-Resources

REM Installing VLC Media Player version 3.0.6
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "& {$P = $env:TEMP + '\vlc-3.0.6-win64.exe'; Invoke-WebRequest 'https://mirrors.syringanetworks.net/videolan/vlc/3.0.6/win64/vlc-3.0.6-win64.exe' -OutFile $P; Start-Process -FilePath $P -Args '/L=1033 /S' -Verb RunAs -Wait; Remove-Item $P}"

REM Installation Done!
PAUSE

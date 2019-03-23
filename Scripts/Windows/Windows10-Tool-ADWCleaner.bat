REM Download ADWCleaner
REM Author: Justin Chapdelaine
REM Version: 20190323.1
REM Source: https://github.com/justinchapdelaine/IT-Resources

REM Downloading ADWCleaner to C:\STS
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "& {Invoke-WebRequest 'https://download.toolslib.net/download/direct/1/latest?channel=release'; Start-Process -FilePath C:\STS -Verb RunAs -Wait}"

REM Download Done!
PAUSE

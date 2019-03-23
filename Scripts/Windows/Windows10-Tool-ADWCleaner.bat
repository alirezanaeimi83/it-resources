REM Download ADWCleaner
REM Author: Justin Chapdelaine
REM Version: 20190323.1
REM Source: https://github.com/justinchapdelaine/IT-Resources

REM Downloading ADWCleaner to C:\STS\
md C:\STS
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "& {Invoke-WebRequest -Uri 'https://www.fosshub.com/Malwarebytes-AdwCleaner.html?dwl=adwcleaner_7.2.7.0.exe' -OutFile 'C:\STS\ADWCleaner.exe'}"

REM Download Done!
PAUSE

REM Download ADWCleaner
REM Author: Justin Chapdelaine
REM Version: 20190323.1
REM Source: https://github.com/justinchapdelaine/IT-Resources

REM Downloading ADWCleaner to C:\STS\
md C:\STS
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "& {Invoke-WebRequest -Uri 'http://files2.majorgeeks.com/4ce393c4a7caa63badce4afca5a905c786a66d4f/spyware/adwcleaner-7.2.7.0.exe' -OutFile 'C:\STS\ADWCleaner.exe'}"

REM Download Done!
PAUSE

https://github.com/justinchapdelaine/IT-Resources/raw/master/Tools/adw.exe

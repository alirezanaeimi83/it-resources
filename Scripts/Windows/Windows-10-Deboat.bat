REM Install basic software for new Windows setup
REM Author: Justin Chapdelaine
REM Version: 20190320.1
REM Source: https://github.com/justinchapdelaine/IT-Resources

REM Remove global Windows 10 Apps
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "get-appxpackage *officehub* | remove-appxpackage"

REM Install basic software for new Windows setup
REM Author: Justin Chapdelaine
REM Version: 20181201.01
REM Source: https://github.com/justinchapdelaine/latteit

@echo off

REM download and install Chocolatey
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

REM update Chocolatey
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "& {&choco upgrade chocolatey}"

REM install basic apps: VLC Media Player, Google Chrome, 7zip, Adobe Reader DC
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "& {&choco install vlc googlechrome 7zip adobereader -y}"

PAUSE

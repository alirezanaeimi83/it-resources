REM Enable desktop icons and set time to auto
REM Author: Justin Chapdelaine
REM Version: 20190321.1
REM Source: https://github.com/justinchapdelaine/IT-Resources

REM Enable This PC
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel /v 20D04FE0-3AEA-1069-A2D8-08002B30309D /t REG_DWORD /d 0 /f
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu /v 20D04FE0-3AEA-1069-A2D8-08002B30309D /t REG_DWORD /d 0 /f

REM Enable User Folder
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel /v 59031a47-3f72-44a7-89c5-5595fe6b30ee /t REG_DWORD /d 0 /f
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu /v 59031a47-3f72-44a7-89c5-5595fe6b30ee /t REG_DWORD /d 0 /f

REM Set Time and Time Zone automatically
REG ADD HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Parameters /v Type /t REG_SZ /d NTP /f
REG ADD HKLM\SYSTEM\CurrentControlSet\Services\tzautoupdate /v Type /t REG_DWORD /d 3 /f

PAUSE

@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

REM Remove manufacture bloatware on new setups
REM Author: Justin Chapdelaine
REM Version: 20190320.1
REM Source: https://github.com/justinchapdelaine/IT-Resources

REM Use to get all installed packages: Get-AppxPackage | Select Name , PackageFullName
REM To output all installed packages to desktop: Get-AppxPackage | Select Name, PackageFullName >"$env:userprofile\Desktop\InstalledApps_List.txt"

REM Disable Consumer Experience (Automatically Re-Install Apps)
REG ADD HKLM\Software\Policies\Microsoft\Windows\CloudContent /v DisableWindowsConsumerFeatures /t REG_DWORD /d 1 /f

REM Disable Suggestion In Start
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v SubscribedContent-338388Enabled /t REG_DWORD /d 0 /f

@echo on

echo Remove Utilities
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *MicrosoftOfficeHub* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *OneConnect* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *Netflix* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *AdobePhotoshopExpress* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *DrawboardPDF* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *PandoraMediaInc* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *Phototastic* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *Fitbit* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *DolbyAccess* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *BingTranslator* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *Evernote* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *DropboxOEM* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *RemoteDesktop* | Remove-AppxPackage"

echo Remove Games
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *Asphalt8Airborne* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *CandyCrushSodaSaga* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *FalloutShelter* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *FarmVille2CountryEscape* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *MinecraftUWP* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *RoyalRevolt2* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *Candy* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *SimpleMahjong* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *Spades* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *SimpleSolitaire* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *WildTangentGames* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *HeartsDeluxe* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *COOKINGFEVER* | Remove-AppxPackage"

echo Remove Social Media
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *Facebook* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *Twitter* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *LinkedIn* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *WhatsAppDesktop* | Remove-AppxPackage"

echo Remove Shopping
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *eBay* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *Amazon* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *Booking* | Remove-AppxPackage"

echo Remove Acer Specific
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *UserExperienceImprovementProgram* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *QuickAccess* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *AcerRegistration* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *AcerCollectionS* | Remove-AppxPackage"

echo Remove HP Specific
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *HPJumpStart* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *HPPrinterControl* | Remove-AppxPackage"

echo Remove Lenovo Specific

echo Remove Microsoft (Surface) Specific

echo Uninpin Non-Installed Bloatware (incomplete)

echo Bloatware removal complete!
PAUSE

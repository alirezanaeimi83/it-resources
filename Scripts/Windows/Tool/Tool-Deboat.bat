@echo off

REM Remove manufacture bloatware on new setups
REM Author: Justin Chapdelaine
REM Version: 20190330.1
REM Source: https://github.com/justinchapdelaine/IT-Resources

REM Use to get all installed packages: Get-AppxPackage | Select Name , PackageFullName
REM To output all installed packages to desktop: Get-AppxPackage | Select Name, PackageFullName >"$env:userprofile\Desktop\InstalledApps_List.txt"

REM  --> Elevate permissions
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

REM Get vendor name of unit
FOR /F "tokens=1 delims=0 skip=1" %%A IN ('wmic csproduct get vendor ^| findstr /r /v "^$"') do SET vendor=%%A
echo Unit vendor: %vendor%
echo:

REM Remove bloatware
echo Disable Consumer Experience (Automatically App Installation)
REG ADD HKLM\Software\Policies\Microsoft\Windows\CloudContent /v DisableWindowsConsumerFeatures /t REG_DWORD /d 1 /f

echo Disable Suggestion In Start
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v SubscribedContent-338388Enabled /t REG_DWORD /d 0 /f
echo:

echo This may take a few minutes...
echo:

echo 1. Removing Utilities
REM --- Metro Apps ---
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
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *McAfeeSecurity* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *SpotifyMusic* | Remove-AppxPackage"

echo 2. Removing Games
REM --- Metro Apps ---
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

echo 3. Removing Social Media
REM --- Metro Apps ---
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *Facebook* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *Twitter* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *LinkedIn* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *WhatsAppDesktop* | Remove-AppxPackage"

echo 4. Removing Shopping
REM --- Metro Apps ---
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *eBay* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *Amazon* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *Booking* | Remove-AppxPackage"

ECHO %vendor% | FINDSTR "Acer" >nul && (
	goto Acer
	) || (
)
ECHO %vendor% | FINDSTR "HP" >nul && (
	goto HP
	) || (
)
ECHO %vendor% | FINDSTR "Lenovo" >nul && (
	goto Lenovo
	) || (
)
ECHO %vendor% | FINDSTR "Microsoft" >nul && (
	goto Microsoft
	) || (
)
ECHO %vendor% | FINDSTR "Asus" >nul && (
	goto Asus
	) || (
)
ECHO %vendor% | FINDSTR "Dell" >nul && (
	goto Dell
	) || (
)

:Acer
echo 5. Removing Acer Specific
REM --- Metro Apps ---
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *UserExperienceImprovementProgram* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *QuickAccess* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *AcerRegistration* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *AcerCollectionS* | Remove-AppxPackage"
REM --- Programs ---
wmic product where name="Acer Jumpstart" call uninstall >nul
wmic product where name="User Experience Improvement Program Service" call uninstall >nul
wmic product where name="Amazon" call uninstall >nul
wmic product where name="Acer UEIP Framework" call uninstall >nul
wmic product where name="Acer Collection" call uninstall >nul
goto End

:HP
echo 5. Remove HP Specific
REM --- Metro Apps ---
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *HPJumpStart* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *HPPrinterControl* | Remove-AppxPackage"
REM --- Programs ---
wmic product where name="HP JumpStart Launch" call uninstall >nul
wmic product where name="HP JumpStart Bridge" call uninstall >nul
wmic product where name="HP Customer Experience Enhancements" call uninstall >nul
wmic product where name="HP Registration Service" call uninstall >nul
wmic product where name="ePrint SW" call uninstall >nul
wmic product where name="HP ePrint SW" call uninstall >nul
goto End

:Lenovo
echo 5. Removing Lenovo Specific
goto End

:Microsoft
echo 5. Removing Microsoft (Surface) Specific
goto End

:Asus
echo 5. Removing Asus Specific
REM --- Metro Apps ---
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *ASUSProductRegistrationProgram* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *ASUSGIFTBOX* | Remove-AppxPackage"
REM --- Programs ---
wmic product where name="ASUS Hello" call uninstall >nul
wmic product where name="ASUS Device Activation" call uninstall >nul
wmic product where name="ASUS GiftBox Service" call uninstall >nul
wmic product where name="ASUS ZenAnywhere" call uninstall >nul
goto End

:Dell
echo 5. Removing Dell Specific
REM --- Programs ---
wmic product where name="Dropbox Update Helper" call uninstall >nul
wmic product where name="Dropbox 20 GB" call uninstall >nul
wmic product where name="Product Registration" call uninstall >nul
goto End

:End

echo 6. Unpining Non-Installed Bloatware (incomplete)

echo:
echo Bloatware removal complete!
PAUSE

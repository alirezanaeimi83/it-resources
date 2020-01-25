@echo off

::--------------------------------------------------
:: Removes most pre-installed Bloatware from OEM units.
:: 
:: File Name    : Uninstall-Bloatware-v2.bat
:: Author       : Justin Chapdelaine (@email)
:: Updated      : 2020-01-21
:: 
:: Script posted at:
:: https://github.com/justinchapdelaine/it-resources
::--------------------------------------------------

:: Use to get all installed metro apps: Get-AppxPackage | Select Name , PackageFullName
:: To get all installed msi programs: wmic product get name

REM  --> Elevate permissions
:: Self elevate script if not run as administrator
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

:: Get vendor name of unit
FOR /F "tokens=1 delims=0 skip=1" %%A IN ('wmic csproduct get vendor ^| findstr /r /v "^$"') do SET vendor=%%A
echo Unit vendor: %vendor%
echo:

:: Disable automatic unwated application installation
echo 1. Disable Consumer Experience (Automatically App Installation)
REG ADD HKLM\Software\Policies\Microsoft\Windows\CloudContent /v DisableWindowsConsumerFeatures /t REG_DWORD /d 1 /f
echo:

:: Disables ads (suggestions) in start menu
echo 2. Disable Suggestion In Start
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v SubscribedContent-338388Enabled /t REG_DWORD /d 0 /f
echo:

:: Start bloatware removal
echo 3. Removing %vendor%bloatware, this may take a few minutes...

:: Remove bloatware for specific vendor
ECHO %vendor% | FINDSTR "Acer" >nul && (
	goto Acer
	) || (
	REM Not Acer
)
ECHO %vendor% | FINDSTR "HP" >nul && (
	goto HP
	) || (
	REM Not HP
)
ECHO %vendor% | FINDSTR "LENOVO" >nul && (
	goto Lenovo
	) || (
	REM Not Lenovo
)
ECHO %vendor% | FINDSTR "Microsoft" >nul && (
	goto Microsoft
	) || (
	REM Not Microsoft
)
ECHO %vendor% | FINDSTR "ASUSTeK" >nul && (
	goto Asus
	) || (
	REM Not Asus
)
ECHO %vendor% | FINDSTR "Dell" >nul && (
	goto Dell
	) || (
	REM Not Dell
)
ECHO %vendor% | FINDSTR "Micro-Star" >nul && (
	goto MSI
	) || (
	REM Not Dell
)
goto End

:Acer
REM --- Metro Apps ---
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *UserExperienceImprovementProgram* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *Booking* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *SimpleMahjong* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *LinkedInforWindows* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *Spades* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *GO-TrustAuthenticator* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *Netflix* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *SimpleSolitaire* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *eBay* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *Amazon* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *HeartsDeluxe* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *Evernote * | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *SpotifyMusic* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *CandyCrushFriends* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *CandyCrushSaga* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *QuickAccess* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *AcerRegistration* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *AcerCollectionS* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *AcerCollection* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *WildTangentGames* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *DropboxOEM* | Remove-AppxPackage"
REM --- Programs ---
wmic product where name="Acer Jumpstart" call uninstall >nul
wmic product where name="User Experience Improvement Program Service" call uninstall >nul
wmic product where name="ExpressVPN" call uninstall >nul
wmic product where name="Amazon" call uninstall >nul
wmic product where name="Forge of Empires" call uninstall >nul
wmic product where name="Acer UEIP Framework" call uninstall >nul
wmic product where name="Acer Collection" call uninstall >nul
REM --- Manual Uninstall ---
"%LOCALAPPDATA%\Host App Service\Uninstall.exe" /SELF=1 /UN="%LOCALAPPDATA%\Temp\~nsu.tmp\Un_A.exe"
goto End

:HP
REM --- Metro Apps ---
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *SpotifyMusic* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *CandyCrushSaga* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *CandyCrushFriends* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *WildTangentGames* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *FarmHeroesSaga* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *SimpleSolitaire* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *Booking* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *McAfeeSecurity* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *LinkedInforWindows* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *Netflix* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *DropboxOEM* | Remove-AppxPackage"
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
REM -- Metro Apps ---
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *FarmHeroesSaga* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *CandyCrushFriends* | Remove-AppxPackage"
REM -- Programs ---
goto End

:Microsoft
REM --- Metro Apps ---
REM --- Programs ---
goto End

:Asus
REM --- Metro Apps ---
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *WPSOffice* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *LinkedInforWindows* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *McAfeeSecurity* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *Netflix* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *SpotifyMusic* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *CandyCrushFriends* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *CandyCrushSaga* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *ASUSProductRegistrationProgram* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *ASUSGIFTBOX* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *FarmHeroesSaga* | Remove-AppxPackage"
REM --- Programs ---
wmic product where name="ASUS Hello" call uninstall >nul
wmic product where name="ASUS Device Activation" call uninstall >nul
wmic product where name="ASUS GiftBox Service" call uninstall >nul
wmic product where name="ASUS ZenAnywhere" call uninstall >nul
goto End

:Dell
REM --- Metro Apps ---
REM --- Programs ---
wmic product where name="Dropbox Update Helper" call uninstall >nul
wmic product where name="Dropbox 20 GB" call uninstall >nul
wmic product where name="Product Registration" call uninstall >nul
goto End

:MSI
REM -- Metro Apps ---
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *SpotifyMusic* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *CandyCrushFriends* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *CandyCrushSaga* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *LinkedInforWindows* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *NortonStudio* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *Wordament* | Remove-AppxPackage"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *MicrosoftSudoku* | Remove-AppxPackage"
REM --- Programs ---

:End

echo:
echo Bloatware removal complete!
PAUSE
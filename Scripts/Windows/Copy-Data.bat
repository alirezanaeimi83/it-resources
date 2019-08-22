<!-- :: Batch section
@echo off
setlocal

::--------------------------------------------------
:: Copy data from one location to another
:: 
:: File Name    : Copy-Data.bat
:: Author       : Justin Chapdelaine (@email)
:: Updated      : 2019-08-03
:: 
:: Script posted at:
:: https://github.com/justinchapdelaine/it-resources
::--------------------------------------------------

:: Start cmd windows minimized
if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit

:: Open HTA GUI window
echo Select an option:
for /F "delims=" %%a in ('mshta.exe "%~F0"') do set "HTAreply=%%a"
echo End of HTA window, reply: "%HTAreply%"
exit

:: for /f "skip=1 delims=" %%x in ('wmic logicaldisk get name') do @echo.%%x
-->


<HTML>
<HEAD>
<HTA:
    APPLICATIONNAME="Staples Backup"
    APPLICATION SCROLL="yes" 
    SYSMENU="yes" 
>

<TITLE>Staples Backup</TITLE>

<SCRIPT language="VBScript">

   Set objShell = CreateObject("Shell.Application")

   Sub Window_OnLoad
      window.resizeTo 600,400
   End Sub

   Sub getDrives
      Dim command
      command = "/c for /f "skip=1 delims=" %%x in ('wmic logicaldisk get name') do @echo.%%x"
      objShell.ShellExecute "cmd.exe", command, "", "runas", 1
   End Sub

</SCRIPT>

</HEAD>

<BODY>

   <input id=runbutton  class="button" type="button" value="Flush DNS" name="db_button"  onClick="getDrives"><p>
   
</BODY>

</HTML>
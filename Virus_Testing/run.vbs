Set oShell = CreateObject ("Wscript.Shell") 
Dim strArgs
strArgs = "cmd /c dont_run_this.bat"
oShell.Run strArgs, 0, false
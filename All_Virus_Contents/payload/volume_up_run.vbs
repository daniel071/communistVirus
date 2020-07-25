Set oShell = CreateObject ("Wscript.Shell") 
Dim strArgs
strArgs = "cmd /c volume_up.bat"
oShell.Run strArgs, 0, false
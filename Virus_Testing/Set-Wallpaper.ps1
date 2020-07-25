Function Set-WallPaper($Value)
 {
    Set-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -name wallpaper -value $value
    rundll32.exe user32.dll, UpdatePerUserSystemParameters
 }
 
Set-WallPaper -value D:\Daniel's work in one\Other\batch_startup_file\soviet_union.jpg
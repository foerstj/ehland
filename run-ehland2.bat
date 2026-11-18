:: map name, lowercase
set map2=ehland2
:: path of Bits dir
set bits=%~dp0.
:: path of DS installation
set ds=%DungeonSiege%

:: Compile map & main resource file
call "%bits%\build.bat" %*

::pause

:: Run it!
"%ds%\DungeonSiege.exe" nointro=true map=%map2%

:: Cleanup resources so as not to confuse Siege Editor
call "%bits%\cleanup.bat" %*

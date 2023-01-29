:: This script is supposed to be executed from your DS installation folder.
:: TankCreator is expected to be in a sibling dir.

:: map name, lowercase
set map=ehland
:: path of DS documents dir (where Bits are)
set doc_ds=%USERPROFILE%\Documents\Dungeon Siege
:: path of DS installation
set ds=.

:: Compile map & main resource file
call "%doc_ds%\Bits\build.bat" %*

::pause

:: Run it!
"%ds%\DungeonSiege.exe" nointro=true map=%map%

:: Cleanup resources so as not to confuse Siege Editor
call "%doc_dsloa%\Bits\cleanup.bat" %*

:: This script is supposed to be executed from your DS installation folder.
:: TankCreator is expected to be in a sibling dir.

:: map name, case sensitive
set map_cs=Ehland
:: map name, lowercase
set map=ehland
:: path of DSLOA documents dir (where Bits are)
set doc_ds=%USERPROFILE%\Documents\Dungeon Siege
:: path of DS installation
set ds=.
:: path of TankCreator
set tc=..\TankCreator

:: Compile main resource file
call "%doc_ds%\Bits\build.bat"

::pause

:: Run it!
"%ds%\DSLOA.exe" nointro=true map=%map%

:: Cleanup resources so as not to confuse Siege Editor
del "%ds%\Resources\%map_cs%.dsres"

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

:: Compile map file
rmdir /S /Q "%tmp%\Bits"
robocopy "%doc_ds%\Bits\world\maps\%map%" "%tmp%\Bits\world\maps\%map%" /E
%tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\Maps\%map_cs%.dsmap" -copyright "CC-BY-SA 2021" -title "%map_cs%" -author "Johannes Förstner"
if %errorlevel% neq 0 pause

:: Compile main resource file
rmdir /S /Q "%tmp%\Bits"
robocopy "%doc_ds%\Bits\world\ai" "%tmp%\Bits\world\ai" /E
robocopy "%doc_ds%\Bits\world\contentdb\templates\%map_cs%" "%tmp%\Bits\world\contentdb\templates\%map_cs%" /E
robocopy "%doc_ds%\Bits\world\global" "%tmp%\Bits\world\global" /E
%tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\Resources\%map_cs%.dsres" -copyright "CC-BY-SA 2021" -title "%map_cs%" -author "Johannes Förstner"
if %errorlevel% neq 0 pause

:: Cleanup
rmdir /S /Q "%tmp%\Bits"

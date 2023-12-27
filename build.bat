:: This script is supposed to be executed from your DS installation folder.
:: TankCreator is expected to be in a sibling dir.

:: map name
set map=ehland
:: map name, case sensitive
set map_cs=Ehland
:: path of DS documents dir (where Bits are)
set doc_ds=%USERPROFILE%\Documents\Dungeon Siege
:: path of DS installation
set ds=.
:: path of TankCreator
set tc=..\TankCreator

set copyright=CC-BY-SA 2023
set author=Johannes Förstner

:: Compile map file
rmdir /S /Q "%tmp%\Bits"
robocopy "%doc_ds%\Bits\world\maps\%map%" "%tmp%\Bits\world\maps\%map%" /E
%tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\Maps\%map_cs%.dsmap" -copyright "%copyright%" -title "%map_cs%" -author "%author%"
if %errorlevel% neq 0 pause

:: Compile main resource file
rmdir /S /Q "%tmp%\Bits"
robocopy "%doc_ds%\Bits\world\ai\jobs\%map%" "%tmp%\Bits\world\ai\jobs\%map%" /E
robocopy "%doc_ds%\Bits\world\contentdb\templates\%map%" "%tmp%\Bits\world\contentdb\templates\%map%" /E
robocopy "%doc_ds%\Bits\world\global" "%tmp%\Bits\world\global" /E
%tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\Resources\%map_cs%.dsres" -copyright "%copyright%" -title "%map_cs%" -author "%author%"
if %errorlevel% neq 0 pause

:: Compile German language resource file
rmdir /S /Q "%tmp%\Bits"
robocopy "%doc_ds%\Bits\language" "%tmp%\Bits\language" %map%-* /S
%tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\Resources\%map_cs%-de.dsres" -copyright "%copyright%" -title "%map_cs%" -author "%author%"
if %errorlevel% neq 0 pause

:: Cleanup
rmdir /S /Q "%tmp%\Bits"

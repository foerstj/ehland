:: This script is supposed to be executed from your DS installation folder.
:: TankCreator and gaspy are expected to be in sibling dirs.

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
:: path of GasPy
set gaspy=..\gaspy

set copyright=CC-BY-SA 2023
set author=Johannes Förstner

:: param
set mode=%1
echo %mode%

:: pre-build checks
pushd %gaspy%
setlocal EnableDelayedExpansion
if not "%mode%"=="light" (
  venv\Scripts\python -m build.check_player_world_locations %map% --bits DS1
  if !errorlevel! neq 0 pause
  venv\Scripts\python -m build.check_lore %map% --bits DS1
  if !errorlevel! neq 0 pause
  venv\Scripts\python -m build.check_moods %map% --bits DS1
  if !errorlevel! neq 0 pause
  venv\Scripts\python -m build.check_quests %map% --bits DS1
  if !errorlevel! neq 0 pause
  venv\Scripts\python -m build.check_dupe_node_ids %map% --bits DS1
  if !errorlevel! neq 0 pause
  venv\Scripts\python -m build.check_tips %map% --bits DS1
  if !errorlevel! neq 0 pause
)
if "%mode%"=="release" (
  venv\Scripts\python -m build.check_cam_blocks %map% --bits DS1
  if !errorlevel! neq 0 pause
)
endlocal
popd

:: Compile map file
rmdir /S /Q "%tmp%\Bits"
robocopy "%doc_ds%\Bits\world\maps\%map%" "%tmp%\Bits\world\maps\%map%" /E
pushd %gaspy%
venv\Scripts\python -m build.fix_start_positions_required_levels %map% "%tmp%\Bits"
if %errorlevel% neq 0 pause
setlocal EnableDelayedExpansion
if "%mode%"=="release" (
  venv\Scripts\python -m build.add_world_levels %map% "%tmp%\Bits" "%doc_ds%\Bits"
  if !errorlevel! neq 0 pause
)
endlocal
popd
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

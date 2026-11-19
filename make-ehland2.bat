:: map name
set map=ehland
set map2=%map%2

:: path of Bits dir
set bits=%~dp0.


robocopy "%bits%\world\maps\%map%" "%bits%\world\maps\%map2%" /S /xf main.gas start_positions.gas conversations.gas
pushd %gaspy%
venv\Scripts\python -m landscaping.replace_objs --bits "%bits%" %map2% --replace-from-file "%bits%\gaspy\ehland2-replacements-enemies.txt" "%bits%\gaspy\ehland2-replacements-plants.txt" "%bits%\gaspy\ehland2-replacements-npcs.txt"
if %errorlevel% neq 0 pause
venv\Scripts\python -m landscaping.change_nodeset --bits "%bits%" %map2% ehwood dgn03=dgn09 for01=for02
if %errorlevel% neq 0 pause
popd

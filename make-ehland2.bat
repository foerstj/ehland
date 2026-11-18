:: map name
set map=ehland
set map2=%map%2

:: path of Bits dir
set bits=%~dp0.


robocopy "%bits%\world\maps\%map%" "%bits%\world\maps\%map2%" /S /xf main.gas start_positions.gas
pushd %gaspy%
venv\Scripts\python -m landscaping.replace_objs %map2% --bits "%bits%" --replace wolf_gray=wolf_black wolf_gray_boss_01=wolf_black_boss_01
popd

:: map name
set map=ehland

:: path of Bits dir
set bits=%~dp0.


robocopy "%bits%\world\maps\%map%" "%bits%\world\maps\%map%2" /S /xf main.gas start_positions.gas

:: map name, case sensitive
set map_cs=Ehland
:: path of DS installation
set ds=%DungeonSiege%

:: Cleanup resources so as not to confuse Siege Editor
del "%ds%\Resources\%map_cs%.dsres"
del "%ds%\Resources\%map_cs%.de.dsres"
del "%ds%\Resources\%map_cs%.es.dsres"
del "%ds%\Resources\%map_cs%.fr.dsres"

:: This script is supposed to be executed from your DS installation folder.

:: map name, case sensitive
set map_cs=Ehland
:: path of DS installation
set ds=.

:: Cleanup resources so as not to confuse Siege Editor
del "%ds%\Resources\%map_cs%.dsres"
del "%ds%\Resources\%map_cs%-de.dsres"

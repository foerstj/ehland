# Ehland
A little map for Dungeon Siege 1.

FOSS, CC-BY-SA.

## About
This was my first completed Dungeon Siege map. It features two regions, one quest, and various NPCs (among others, a magic shop, a smith shop, a mule seller, and a companion). It's basically a demo map for the main elements a map needs, plus proof-of-concept for some creative use of terrain.

The map is set in Ehland, a handful of islands floating in the sky. Lord Hovart is threatening the quaint village of Eh, and you are asked to help. You have to get a little training in the woods before confronting him, and find a treasure to afford good equipment. You reach about level 5. The map features impossible geometry: regions stitched in a loop, and a tunnel through mid-air that is not visible from outside.

The map is NOT intended to fit into DS lore. It makes no sense that Lord Hovart is buried in Ehland. Please ignore.

## Installation & Compatibility
- This map does not require LoA.
- To install, simply put the .dsmap file in the Maps folder and the .dsres files in the Resources folder.\
  Or put them all in the DSLOA folder if you use DSLOA.
- The "de" and "es" .dsres files are optional and contain translations into German and Spanish, which will be picked up if you have a German or Spanish installation.
- To uninstall, simply remove the files again :)
- No known incompatibilities.

## Attribution
Spanish translation by Nekurrot25.

## Changelog
Changes in 1.1:
- Moved propeller of toolshed
- Unbounded camera for some nodes
- Moved a door to make it path-findable; make doors open to the outside
- Define own templates for mushrooms, for better support of Wintermod
- Auto-size mushrooms
- Some internal cleanups

Changes in 1.2:
- Added German translation (separate optional .dsres file)
- Make well fairies readable
- Make vanes rotate in same direction as gears; gears fade to alpha
- Fix unfitting path node
- Minor terrain fixes and concealments
- Fix lighting of plants along ledges by moving them a bit
- Fix lighting of airgap tunnel: does not occlude light, is not lit by daylight itself
- Use generic talk skrits from my other projects; thereby fixing crash when you tried to buy the third of Barney's two mules

Changes in 1.3:
- Added Veteran & Elite world levels!
- Make Lauryn non-hireable in multiplayer
- Removed 1 bad camera block
- Fix Hovart quest image & replay dialog
- Doubled precipitation
- Fix Meg not moving
- Updated generic talk skrits used by Old Man, Barney & Lauryn - makes them face the player
- Internal: Use non-itemshop actors for Meg & Barney

Changes in 1.3.1:
- Added Spanish translation
- Fixed a typo

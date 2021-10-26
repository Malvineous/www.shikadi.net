<!--@
TITLE=Camoto - shikadi.net
-->
# Camoto Online #
**Camoto Online** is a collection of integrated utilities for editing (modding)
"classic DOS games", those running under MS-DOS on the PC from the early to mid
1990s.

A complete rewrite of the earlier [Camoto Desktop](desktop/), this version is
capable of running in a web browser so requires no installation -
[try it now!](https://camoto.shikadi.net)

## Current Status ##

As of October 2021, there is still plenty of work to do!  The web interface is
capable of editing graphics for supported games (really only Dangerous Dave at
this point) but it can't do much else.

The focus is now on the level editor and the music UI as, after so many years of
talking about it, I have yet to finish a DRO/IMF to MIDI converter that can
convert the instruments in real time while the song is playing.

## Code ##

Contributions are most welcome from any Javascript programmers who are
interested in adding support for more games.

* [gamecomp.js](https://github.com/camoto-project/gamecompjs)
  applies and removes various compression and encryption algorithms.  It can
  also remove LZEXE and all known PKLite versions.
* [gamearchive.js](https://github.com/camoto-project/gamearchivejs)
  extracts, creates and modifies game archive files.  These are just like .zip
  files except many games use their own custom format.
* [gamemap.js](https://github.com/camoto-project/gamemapjs)
  provides a consistent interface to 2D grid-based game levels.
* [gamegraphics.js](https://github.com/camoto-project/gamegraphicsjs)
  allows conversion to and from many different graphics formats, as most games
  used their own custom ones.
* [gamemusic.js](https://github.com/camoto-project/gamemusicjs)
  reads and writes music notation files used to store music for many games.
* [gameinfo.js](https://github.com/camoto-project/gameinfojs)
  ties everything together into a unified interface.  Camoto Studio only needs
  to talk to gameinfo.js, which handles things like which files are required to
  load which levels, which palette applies to which graphics files, and so on.
* [Camoto Studio Online](https://github.com/camoto-project/studiojs)
  is a web-based interface to viewing and modifying any game supported by
  gameinfo.js.

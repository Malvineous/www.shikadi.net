<!--@
TITLE=Add a new game to Camoto Studio
-->

# Add a new game to Camoto Studio #

This tutorial will explain how to add a new game to Camoto Studio, so that you
can create a new project to edit that game.

## Prerequisites ##

* You can run Camoto Studio and create new projects
* All the file formats you wish to edit are already supported by the other
  Camoto libraries
* You know where the Camoto Studio data directory is
  * Windows (probably): C:\Program Files (x86)\Camoto\data\
  * Linux: /usr/local/share/camoto-studio/
  * Mac: ?

## Create new files ##

In the Camoto Studio data directory you will see a collection of XML files, one
for each game.  It's easiest to copy an existing file and then modify it for
your new game, so pick one and make a copy.  Name it appropriately to match the
existing files (full game name, all lowercase, dashes instead of spaces, etc.)

Open the file in an XML editor.  The files use UNIX LF-only files so you'll need
an editor that can handle this.  (Microsoft's Notepad can't, and will display
everything on one line.)

Change the game title, publisher, etc.  The game's credits will tell you this,
or failing that, it will be on [Mobygames](http://www.mobygames.com).  Check on
the [ModdingWiki](https://moddingwiki.shikadi.net) to see who reverse-engineered
the file formats and list those people as the reversers.

## Populate images ##

In the Camoto Studio data directory, there are subfolders for icons and for
screenshots.  The filenames match the XML file, but with `.xml` replaced
with `.png`.

The screenshot should be as close to possible as the start of the first level in
the stock, unmodified game.  This is the screen the most people will have seen
when playing the game, so is most likely to jog the memory of someone flicking
through the screenshots.

Where possible, the icon should be the face of the main player.  All the
existing icons are of the player facing right, so try to follow this if you can.
Of course not all games can do this, so a few have players facing straight ahead
or have spacecraft instead of people.  If there is any doubt, choose an icon
that is the most memorable - what players will have seen the most while in the
game.

## Populating the game description XML ##

At this point you should be able to create a new project using your XML file,
but the items from the original game will show up instead.

In your XML editor, go to the <files/> section and update as appropriate for the
game.  Look at similar format files in other game XML files for examples about
what to put.  Look on the ModdingWiki to see what file format games are - if
they aren't listed and you know what they are, then please update the
ModdingWiki while you are there!  You can use the <archive/> element if the
files you want to edit are located inside archive files.  Again, have a look at
the XML files of similar games for example usage.

Every <file/> entry within <files/> must have a matching <item/> entry in the
<display/> section, otherwise it won't show up in Camoto's list of items to
edit.

You will need to exit and restart Camoto Studio to see your changes.  Once you
have created a new project using your new XML file, you can use the
`--project` command-line parameter to quickly load it again to test any
changes to your XML file.

If you launch Camoto Studio from the command line, you can see any errors it
prints as it reads your XML file.

## Submit ##

When you are done, you can either e-mail the new XML file and images to me, or
commit it to the git repository yourself if you know how.  If you do this,
remember to update the `README` file in your commit, as well as adding
the new files to `Makefile.am`, before sending me a pull request via
GitHub.

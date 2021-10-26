<!--@
TITLE=Compiling Camoto under Windows
-->
# Compiling Camoto under Windows #

This tutorial will explain how to set up a compilation environment under
Microsoft Windows with Visual Studio 2013 so that a Windows version of Camoto
can be compiled from source.

## Version ##

* If you are compiling the old (stable) `v1.x` branch, follow the [build
  instructions](../help-build-win32-v1.x).
* If you are compiling the latest `master` branch, continue with the
  instructions below.

This is the current state of the transition from `v1.x` to `master` (v2.0), for
Visual Studio:

<table class="wikitable">
<thead>
<tr>
<td rowspan="2">
Component
</td>
<td colspan="2">
Which branch compiles with Visual Studio?
</td>
</tr>
<tr>
<th>v1.x</th>
<th>master</th>
</tr>
</thead>
<tbody>
<tr>
<td>libgamecommon</td>
<td><img src="../images/tick.png"></td>
<td><img src="../images/tick.png"></td>
</tr>
<tr>
<td>libgamearchive</td>
<td><img src="../images/tick.png"></td>
<td><img src="../images/tick.png"></td>
</tr>
<tr>
<td>libgamegraphics</td>
<td><img src="../images/tick.png"></td>
<td><img src="../images/tick.png"> (except command line utils)</td>
</tr>
<tr>
<td>libgamemaps</td>
<td><img src="../images/tick.png"></td>
<td><img src="../images/tick.png"> (except command line utils)</td>
</tr>
<tr>
<td>libgamemusic</td>
<td><img src="../images/tick.png"></td>
<td><img src="../images/cross.png"></td>
</tr>
<tr>
<td>camoto-studio</td>
<td><img src="../images/tick.png"></td>
<td><img src="../images/cross.png"></td>
</tr>
</tbody>
</table>

At the time of writing (November 2015), there is no version of the libpng/zlib
NuGet packages available for the `v140_xp` toolset.  Consequently anything using
.png files will not compile.  This is all the libgamegraphics and libgamemaps
command-line tools, as well as Camoto Studio.

## Prerequisites ##

* Visual Studio **2015** installed with the C++ compiler available (Visual
  Studio 2013 and earlier are unsuitable due to lack of C++11 support)
* git command-line tools installed, or some other way of checking out git
  repositories into arbitrary folders

## Create source tree ##

1. Clone the **camoto-win32** repository
   (https://github.com/Malvineous/camoto-win32.git) into a folder.
For this tutorial we will use `H:\Camoto`, so change as appropriate.
2. After cloning, confirm you have `H:\Camoto\Camoto.sln`
3. Within each project folder, clone the following git repositories into a `git`
   folder inside each project folder.  You might need to do this from the
   command line (`git clone https://url`):
   * `H:\Camoto\libgamecommon\git` : https://github.com/Malvineous/libgamecommon.git
   * `H:\Camoto\libgamearchive\git`: https://github.com/Malvineous/libgamearchive.git
   * `H:\Camoto\libgamegraphics\git`: https://github.com/Malvineous/libgamegraphics.git
   * `H:\Camoto\libgamemaps\git`: https://github.com/Malvineous/libgamemaps.git
   * `H:\Camoto\libgamemusic\git`: https://github.com/Malvineous/libgamemusic.git
   * `H:\Camoto\camoto-studio\git`: https://github.com/Malvineous/camoto-studio.git
4. Confirm the following files are present in the given paths.  If so, everything
   has been placed in the correct folders:
   * `H:\Camoto\libgamecommon\git\configure.ac`
   * `H:\Camoto\libgamearchive\git\configure.ac`
   * `H:\Camoto\libgamegraphics\git\configure.ac`
   * `H:\Camoto\libgamemaps\git\configure.ac`
   * `H:\Camoto\libgamemusic\git\configure.ac`
   * `H:\Camoto\camoto-studio\git\configure.ac`
   * `H:\Camoto\Camoto.sln`
5. Double-click on `H:\Camoto\Camoto.sln` (or open in Visual Studio)
6. You should now have the Solution loaded for Camoto, with a project for each
   .dll and .exe file in the project.  However it's not quite ready to build yet!

## Configure GTK ##

This step can be omitted if you don't want to build the GUI (Camoto Studio) and
are happy working with the command-line tools.

TODO

## Building ##

Now everything has been set up, the build process can begin.  Be aware that the
first time you do this, all the other prerequisites will be downloaded which
will take some time, especially for Boost which is quite large and has many
files.  Approximately **130MB will be downloaded** and it will take up around
1GB of disk space once everything has been decompressed.

1. Right-click on the Solution and choose **Build Solution** to compile
   everything.
2. When the compilation has finished, the output files should be in
   `H:\Camoto\Debug`
3. You will get errors about missing DLLs the first time you run many of the
   programs.  Copy missing DLLs into the `Debug` folder from the previous step.
   * Copy the Boost DLLs from
     `packages\boost_*\lib\native\address-model-*\xxx.dll` in the Solution
     directory (`H:\Camoto`).  The NuGet packages would normally do this
     automatically but for some reason the Boost ones don't.

## Troubleshooting ##

### Undefined references ###

If you get messages about undefined references to png-related functions like
`png_create_info_struct` the the NuGet package for libpng doesn't support your
compiler.  At the time of writing, this happens with Visual Studio 2015 because
the NuGet package hasn't yet been updated for vc140.

The workaround is to:

1. Go into the Solution directory and into the
   `packages/libpng.1.5.10.11/build/native/` folder and edit `libpng.targets`.
2. Find the `<ItemDefinitionGroup>` tags - there are a lot of them.  Find all
   the ones that say **v110**.
3. For each one, copy the block (from `<ItemDefinitionGroup>` until the matching
   `</ItemDefinitionGroup>`, including both tags)
4. In the copy, go to the `<ItemDefinitionGroup>` line and change **vc110** to
   **vc140** in two places.  This process is making copies of the Visual
   Studio 2012 sections and changing them to apply to Visual Studio 2015.
5. There are more **v110** mentions on the `<AdditionalDependencies>` line.
   These must be left alone, as we want VS2015 to use the older VS2012
   libraries.  If you were to change this line too, you'd just get "file not
   found" errors because there are no libraries for vc140 yet.  (This is why the
   package needs to be updated!)

At present this has to be done for the following packages:

* libpng
* glew
* libxml2
* libiconv

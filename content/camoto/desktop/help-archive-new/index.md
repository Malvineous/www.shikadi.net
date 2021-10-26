<!--@
TITLE=Add a new archive format to Camoto
-->

# Add a new archive format to Camoto #

This tutorial will explain how to add a new [archive file
format](https://moddingwiki.shikadi.net/wiki/Category:Archive_formats) to Camoto,
specifically to libgamearchive.

<a name="Prerequisites"></a>
## Prerequisites ##

* You can compile the git version of libgamearchive
  ([Windows instructions](../help-build-win32))
* You can run the libgamearchive tests ("`make check`" under Linux,
  `libgamearchive-tests.exe` under Windows cmd.exe)
* If you're on Windows, you have installed
  [ANSICON](https://github.com/adoxa/ansicon)
  ([download](https://github.com/adoxa/ansicon/releases)) so that the errors
  from the test code can be coloured
  * Without this you will only see a mass of ANSI escape sequences making it
    impossible to work out what the problem is.
  * Make sure you don't install ANSICON into `%windir%\system32` on a 64-bit
    machine, otherwise it won't work when running 32-bit apps (because this
    folder gets redirected to `%windir%\SysWOW64` where ANSICON can't be found.)
    Putting it in `%windir%` should be fine.
* The file format has been documented on the
  [ModdingWiki](http://moddingwiki.shikadi.net/wiki/Category:All_archive_formats)!
  File formats are not added to libgamearchive unless they are fully documented
  on the ModdingWiki.

## Select a format to copy ##

Most archive formats are very similar, so instead of reinventing the wheel, a
new format is always implemented by selecting a similar existing format, copying
the code, then making whatever changes are specific to the new format.  The
closer the format you copy to your new one, the less code you will have to
change.

When finding a similar format, don't worry about technical things like which
offsets the fields are at, but look for similar features, such as:

* Is the FAT (File Allocation Table; the table of filenames and offsets/sizes)
  in the archive itself, or is it in a separate file?
  * If the FAT is in the archive file, is it at the start, the end, or is there
    an entry before each subfile?
* Is the FAT a fixed length or does it expand as files are added?
* Does the format store both file offsets and sizes, or just one?  Which one?
* Does the format store filenames or not?

Once you have answers to these questions, it should be easy to find a similar
archive format to base the new one on.  Don't worry if you can't find a good
match, it just means you'll have to write a little more code.  Just pick a
format that has the most features in common.  The list above is in order of
difficulty, so the first items are harder to change but last items are very easy
- so if you can't get a perfect match, try to at least find a match for the
first point or two.

If you've added your new format to the
[ModdingWiki](https://moddingwiki.shikadi.net/wiki/Category:Archive_formats) and
correctly filled out the article's infobox, then the page will have been
automatically added to a handful of categories - you can browse these categories
to find similar formats.  Alternatively for simple formats, the follow table may
help:

<table class="wikitable center">
<thead>
<tr>
<th colspan="4">
Priority 1<br/>
FAT location
</th>
<th colspan="2">
Priority 2<br/>
FAT size
</th>
<th colspan="3">
Priority 3<br/>
FAT content
</th>
<th rowspan="2">
Format
</th>
</tr>
<tr>
<td>Archive start</td>
<td>Archive end</td>
<td>Archive embedded</td>
<td>External file</td>
<td>Variable</td>
<td>Fixed</td>
<td>Offset</td>
<td>Size</td>
<td>Filenames</td>
</tr>
</thead>
<tbody>
<tr>
<td><img src="../images/tick.png"></td>
<td>-</td>
<td>-</td>
<td>-</td>
<td><img src="../images/tick.png"></td>
<td>-</td>
<td><img src="../images/tick.png"></td>
<td><img src="../images/tick.png"></td>
<td><img src="../images/tick.png"></td>
<td><a href="https://moddingwiki.shikadi.net/wiki/POD_Format">pod-tv</a></td>
</tr>
<tr>
<td><img src="../images/tick.png"></td>
<td>-</td>
<td>-</td>
<td>-</td>
<td><img src="../images/tick.png"></td>
<td>-</td>
<td><img src="../images/tick.png"></td>
<td><img src="../images/tick.png"></td>
<td>-</td>
<td><a href="https://moddingwiki.shikadi.net/wiki/RES_Format_(Boppin)">res-boppin</a></td>
</tr>
<tr>
<td><img src="../images/tick.png"></td>
<td>-</td>
<td>-</td>
<td>-</td>
<td><img src="../images/tick.png"></td>
<td>-</td>
<td><img src="../images/tick.png"></td>
<td>-</td>
<td><img src="../images/tick.png"></td>
<td><a href="https://moddingwiki.shikadi.net/wiki/LBR_Format">lbr-vinyl</a></td>
</tr>
<tr>
<td><img src="../images/tick.png"></td>
<td>-</td>
<td>-</td>
<td>-</td>
<td><img src="../images/tick.png"></td>
<td>-</td>
<td>-</td>
<td><img src="../images/tick.png"></td>
<td><img src="../images/tick.png"></td>
<td><a href="https://moddingwiki.shikadi.net/wiki/GRP_Format">grp-duke3d</a> <!-- Has field for file count --></td>
</tr>
<tr>
<td><img src="../images/tick.png"></td>
<td>-</td>
<td>-</td>
<td>-</td>
<td>-</td>
<td><img src="../images/tick.png"></td>
<td><img src="../images/tick.png"></td>
<td><img src="../images/tick.png"></td>
<td><img src="../images/tick.png"></td>
<td><a href="https://moddingwiki.shikadi.net/wiki/VOL_Format">vol-cosmo</a></td>
</tr>
<tr>
<td>-</td>
<td><img src="../images/tick.png"></td>
<td>-</td>
<td>-</td>
<td><img src="../images/tick.png"></td>
<td>-</td>
<td><img src="../images/tick.png"></td>
<td><img src="../images/tick.png"></td>
<td><img src="../images/tick.png"></td>
<td><a href="https://moddingwiki.shikadi.net/wiki/DAT_Format_(Mystic_Towers)">dat-mystic</a> <!-- Has field for file count --></td>
</tr>
<tr>
<td>-</td>
<td><img src="../images/tick.png"></td>
<td>-</td>
<td>-</td>
<td><img src="../images/tick.png"></td>
<td>-</td>
<td>-</td>
<td><img src="../images/tick.png"></td>
<td><img src="../images/tick.png"></td>
<td><a href="https://moddingwiki.shikadi.net/wiki/EPF_Format">epf-lionking</a> <!-- Has field for file count --></td>
</tr>
<tr>
<td>-</td>
<td>-</td>
<td><img src="../images/tick.png"></td>
<td>-</td>
<td><img src="../images/tick.png"></td>
<td>-</td>
<td>-</td>
<td><img src="../images/tick.png"></td>
<td><img src="../images/tick.png"></td>
<td><a href="https://moddingwiki.shikadi.net/wiki/DAT_Format_(Wacky_Wheels)">dat-wacky</a> <!-- Has field for file count --></td>
</tr>
<tr>
<td>-</td>
<td>-</td>
<td><img src="../images/tick.png"></td>
<td><img src="../images/tick.png"></td>
<td><img src="../images/tick.png"></td>
<td>-</td>
<td><img src="../images/tick.png"></td>
<td><img src="../images/tick.png"></td>
<td><img src="../images/tick.png"></td>
<td><a href="https://moddingwiki.shikadi.net/wiki/BNK_Format_(Halloween_Harry)">bnk-harry</a></td>
</tr>
<tr>
<td>-</td>
<td>-</td>
<td>-</td>
<td><img src="../images/tick.png"></td>
<td><img src="../images/tick.png"></td>
<td>-</td>
<td><img src="../images/tick.png"></td>
<td><img src="../images/tick.png"></td>
<td>-</td>
<td><a href="https://moddingwiki.shikadi.net/wiki/DAT_Format_(Hocus_Pocus)">dat-hocus</a></td>
</tr>
<tr>
<td>-</td>
<td>-</td>
<td>-</td>
<td><img src="../images/tick.png"></td>
<td>-</td>
<td><img src="../images/tick.png"></td>
<td>-</td>
<td><img src="../images/tick.png"></td>
<td>-</td>
<td><a href="https://moddingwiki.shikadi.net/wiki/Doofus_Game_Data_Format">gd-doofus</a></td>
</tr>
</tbody>
</table>

For more complex formats, the following existing types may serve as a helpful reference:

* [bpa-drally](https://moddingwiki.shikadi.net/wiki/Death_Rally_BPA_Format) -
  FAT at start of archive, encrypted filenames
* [dat-got](https://moddingwiki.shikadi.net/wiki/DAT_Format_(God_of_Thunder)) -
  encrypted FAT at start of archive, compressed files
* [rff-blood](https://moddingwiki.shikadi.net/wiki/RFF_Format) - encrypted FAT
  at end of archive, encryption key is based on FAT offset, so entire encrypted
  FAT changes content as files are added/removed.  Filenames stored as "DATONE"
  instead of "ONE.DAT" so need transforming.  First 256 bytes of files
  optionally encrypted.
* [dat-bash](https://moddingwiki.shikadi.net/wiki/DAT_Format_(Monster_Bash)) -
  no filename extensions, filetype codes used instead.  Many files have the same
  name and differ only by filetype code.  Filenames translated to convert codes
  into made-up filename extensions.
* [pod-tv](https://moddingwiki.shikadi.net/wiki/POD_Format) - has an
  80-character description in the header made available as an "attribute" which
  can be viewed and changed.

Once you have selected an existing format to copy, you can begin.  For this
tutorial we will be basing the new archive format on the Duke Nukem 3D .grp
format, referred to as
[`grp-duke3d`](https://moddingwiki.shikadi.net/wiki/GRP_Format) in
libgamearchive, and we will be creating a new format called `new-example`.

## Pick a name ##

Where possible, name your format as the most common or unique filename extension
(e.g. `grp`), a dash, and then either the first or the most well-known game that
uses the format - hence `grp-duke3d`.  We could have used `grp-sw` in reference
to ''Shadow Warrior'' but that short name isn't very descriptive, and likewise
`grp-redneckrampage` is a bit long, so you will likely have to bend the rules a
little to come up with a memorable and easily identifiable name.  Specifying the
game along with the filename extension is important, as many games share the
same extension, such as `dat-bash`, `dat-wacky`, `dat-hocus`, and so on.

Have a look at the other format identifiers and use your best judgement.  You
can run `gamearch --list-types` to see a list of them all.

You'll also have to choose a class name suffix for your format, ideally matching
the format identifier.  There are `ArchiveType` and `Archive` classes that the
format will implement, and these have to be named uniquely.  The `grp-duke3d`
format uses the `GRP_Duke3D` suffix, so its classes are called
'''`ArchiveType_GRP_Duke3D`''' and '''`Archive_GRP_Duke3D`'''.

## Create a test ##

The first step in adding a new file format is to create test code for it.  This
is simple to do, and means you can simply tweak your code and run the test until
it passes with no errors, and then your new archive format will be ready to use.
The tests themselves are already written, all you have to do is provide the
content of the archive file after certain operations have been performed, just
like you were looking at the file in a hex editor.  The tests will then do
things like add, remove and rename files in a virtual (in-memory) archive, and
make sure the result comes out the way your test code says it should.  If it
does, your code works.  If not, either your archive code is broken or you made a
typo in your test code :-)

Start by finding the test code for your base format, and create copies of the
files, using your new format code instead.  Here we are duplicating `grp-duke3d`
to create `new-example`, so we will make the following duplicate files (relative
to the libgamearchive root folder):

* `tests/test-fmt-grp-duke3d.cpp` &rarr; `tests/test-fmt-new-example.cpp`

The new file needs to be included in the build system, so edit
`tests/Makefile.am`, find the line for `grp-duke3d` and copy it as appropriate,
remembering to keep the list somewhat in alphabetical order:

    tests_SOURCES += test-fmt-new-example.cpp

If you're using Visual Studio, you'll also have to add the new file to the
`libgamearchive-tests` project.  (Somewhat confusingly the file will be found
inside the folder for the `libgamearchive` project, even though you're adding it
to the different `libgamearchive-tests` project.  This is fine, it simply allows
the two projects to share the same set of source code files.)

Now you can edit the new .cpp file and change all the references to `grp-duke3d`
to `new-example`.  You'll also need to change the name of the test class,
i.e. `test_grp_duke3d` becomes `test_new_example`, and at the very end of the
file, the `IMPLEMENT_TESTS` line also has to be changed, being careful to note
that this line refers to the name of the test class so it should be
`new_example` with an underscore rather than a hyphen.

Now you can edit the class constructor, and set the appropriate variables.  You
can leave out most of them as the defaults are sensible, however here is a list
of what you can set if you need to: (you should remove any lines that set
variables to the default value)

<table class="wikitable">
<thead>
<tr>
<th>Variable</th>
<th>Default value</th>
<th>Purpose</th>
</tr>
</thead>
<tbody>
<tr>
<td>
this->type
</td>
<td>
N/A
</td>
<td>
Name of the format being tested, must be set.  Matches the return value of
`ArchiveType::code()`
</td>
</tr>
<tr>
<td>
this->skipInstDetect
</td>
<td>
None
</td>
<td>
This is a list of '''other''' archive formats which misdetect the new file
format as one of them.  This is a last resort - if it happens, the other
archive's autodetection routines should be fixed.  This is a vector, so values
should be added with
`this->skipInstDetect.push_back("broken-format");`
</td>
</tr>
<tr>
<td>
this->lenMaxFilename
</td>
<td>
12
</td>
<td>
Maximum usable number of characters in the filename, not including any
terminating bytes.  The default of 12 allows a DOS 8.3 style name, including the
period.  This only needs to be changed if your format has a different maximum
length of a filename.  If your format does not support filenames, this should be
set to `-1`.
</td>
</tr>
<tr>
<td>
this->filename[0]<br/>
this->filename[1]<br/>
this->filename[2]<br/>
this->filename[3]<br/>

</td>
<td>
"ONE.DAT"<br/>
"TWO.DAT"<br/>
"THREE.DAT"<br/>
"FOUR.DAT"
</td>
<td>
The filenames to use when adding/renaming/removing files.  You only need to
change these if for some reason your archive format cannot store these filenames
as-is.  If your archive format has no filenames at all, there is no need to set
these to blank, just ignore them.
</td>
</tr>
<tr>
<td>
this->filename_shortext
</td>
<td>
"TEST.A"
</td>
<td>
A filename with an extension less than three chars.  Again, this only needs to
be changed if your new archive format cannot store the default filename.
</td>
</tr>
<tr>
<td>
this->insertAttr
</td>
<td>
EA_NONE
</td>
<td>
Attributes to set when inserting new files.  If your format supports compression
then you probably want to set this to `EA_COMPRESSED`.  If
compression/encryption is optional in your format, then ideally you would create
two tests, one that uses compression/encryption and one that is plaintext.
</td>
</tr>

<tr>
<td>
this->content[0]<br/>
this->content[1]<br/>
this->content[2]<br/>
this->content[3]<br/>
this->content0_overwritten
</td>
<td>
"This is one.dat"<br/>
"This is two.dat"<br/>
"This is three.dat"<br/>
"This is four.dat"<br/>
"Now resized to 23 chars"
</td>
<td>
Content for each file.  This should only be changed if your archive format
cannot contain arbitrary data files.
</td>
</tr>

<tr>
<td>
this->content0_largeSize<br/>
this->content0_largeSize_unfiltered<br/>
this->content0_smallSize<br/>
this->content0_smallSize_unfiltered
</td>
<td>
20<br/>
20<br/>
10<br/>
10
</td>
<td>
Size of the first file, in bytes, after it has been enlarged (largeSize) and
shrunk (smallSize).  If files are compressed, the `_unfiltered` variables are
the decompressed size, and the others are the compressed size.
</td>
</tr>

<tr>
<td>
this->attributes
</td>
<td>
empty
</td>
<td>
Add an `Attribute` to this for each attribute the format supports, if any.  For
example:
<pre>
Attribute comment;
comment.type = Attribute::Type::Text;
comment.textValue = "This is the comment field";
comment.textMaxLength = 123;
this->attributes.push_back(comment);
</pre>
You should supply values for all attributes the format supports.  The file
content you supply for each test function should have these attributes in place,
as the test code will load your content and retrieve each attribute, and fail
the test if it doesn't match the data supplied here.
</td>
</tr>

<tr>
<td>
this->outputWidth
</td>
<td>
16
</td>
<td>
Width (in bytes) of the hex dump shown on test failure.  This is purely to
assist debugging, as sometimes it's easier to see what's going on if the hex
dump is a different width, e.g. the size of a whole FAT entry.  Only change this
for good reason - if you just like wider hex dumps, then edit `tests/tests.cpp`
and change the default instead.  This should rarely need to be changed for
archive files - it was added primarily for game maps so the hex dump could match
the level width.
</td>
</tr>

</tbody>
</table>

Go to the `addTests()` function and leave the first (`c00`) `isInstance()` call
intact, but comment out all the other `isInstance()` and any `invalidContent()`
calls, as these will be written last, once your format has passed all the other
tests.  For the moment, update the other functions with the new archive format's
content.  For example, the `initialstate()` function for `grp-duke3d` looks like
this:

```C++
return STRING_WITH_NULLS(
	"KenSilverman"      "\x02\x00\x00\x00"
	"ONE.DAT\0\0\0\0\0" "\x0f\x00\x00\x00"
	"TWO.DAT\0\0\0\0\0" "\x0f\x00\x00\x00"
	"This is one.dat"
	"This is two.dat"
);
```

Here you can see that two files are present.  ONE.DAT is first, and TWO.DAT is
second, with the content following.  You should replace this content with
whatever your archive format would look like if it too had only two files, with
the same name, content, and order.  Note that this format stores the number of
files in the archive (the field with `\x02` directly following "KenSilverman")
however your format may not store this field, in which case it is fine to remove
it completely.

Note that the splitting of the content into multiple strings is purely for
readability, and you can choose to split the data as much or as little as you
like.  I choose to split them at approximate field boundaries to make it easier
to work out which byte belongs to which field.  You can also add comments, but
try to avoid documenting large numbers of fields - this is what the ModdingWiki
is for!

Proceed through the remaining functions, updating them to reflect your own
archive's content at each stage.  Pay close attention to the changes, and be
sure to calculate offsets correctly.  Avoid the temptation to compute values in
code, as this risks the same bug appearing in both the main code and test code,
where it will never be detected.  Calculate everything manually and hard code
it!  (But only for the test code!)

Once you have done this, you are ready to start implementing the format.

## Implement the format handler ##

Copy the files for your base format again:

* `src/fmt-grp-duke3d.cpp` &rarr; `src/fmt-new-example.cpp`
* `src/fmt-grp-duke3d.hpp` &rarr; `src/fmt-new-example.hpp`

Edit `src/Makefile.am` as you did with the test code and create two new lines,
one for the new .cpp and one for the new .hpp.

You will also have to edit `src/main.cpp` and make the following changes:

* Add an `#include` line for your .hpp file
* Add your `ArchiveType` class name to the `FormatEnumerator` list (using
  whatever name you chose previously instead of `ArchiveType_GRP_Duke3D`)

Without this your code may compile but you'll get an error saying the archive
format could not be found.

Now edit your new .cpp and .hpp files, and make the following changes:

* Replace `grp-duke3d` with `new-example`
* Replace the Archive and ArchiveType class names (`ArchiveType_GRP_Duke3D` and
  `Archive_GRP_Duke3D`) with new unique names (matching what you put in
  `main.cpp`)
* Update the ArchiveType functions as appropriate (i.e. put the correct
  description, list of games, etc.)
* Update the `isInstance` function to correctly identify files in this format.
  You may wish to just comment the code out and make this function return
  `DefinitelyNo` while you implement the rest of the code, and then return to
  implement this function last - whichever you prefer.
  * Don't make it return `DefinitelyYes` unconditionally during testing as it's
    too easy to forget to go back to implement it later!
  * If you want to use `gamearch` to inspect some real archives in your new
    format during testing, before you have implemented `isInstance()`, you'll
    have to manually specify the format and force it to open, e.g. `gamearch -t
    new-example --force testfile.new`
* Update the Archive constructor (`Archive_GRP_Duke3D::Archive_GRP_Duke3D()`) to
  correctly read the contents of the new archive format.

Update the remaining functions as necessary.  Some functions are optional and
can be removed entirely, while others must be present and return without doing
anything if they are not needed.  There may be other functions you need that are
not implemented in the base archive format you are working from, so it is a good
idea to look through a couple of other file formats if you need a feature you
can't seem to find easily.

When you think you are done, compile the code and run the tests like this:

### Linux/Mac ###

Perform the compile.  Adjust `-j8` as appropriate for the number of CPUs in your
system.

    make -j8 check

If the tests fail, you can examine the test log.  Personally I find it easier to
do all this in one command, like this:

    rm tests/tests.log ; make -j8 check ; if [ -f tests/tests.log ]; then cat tests/tests.log; fi

This will compile everything and stop if there was a compilation error,
otherwise if everything compiled successfully it will run the tests and print
the test log if there were any failures.

### Windows ###

Build the `libgamearchive-tests` project, and from the command-line run the
resulting `libgamearchive-tests.exe` file.

You will probably need to make the console window wider to avoid the test output
wrapping to the next line.  You can't resize a console window wider by dragging,
but you can by running this command:

    mode con cols=132    # Set console window to be 132 characters wide, adjust as needed

If the output looks all messy and there are no colours, make sure you have
installed ANSICON correctly (see [#Prerequisites](#Prerequisites) above.)

## Once the tests run ##

Keep working on your code and fixing the errors until they run through without
any problems.  Remember to ignore any `isInstance()` errors at this stage as
those functions haven't been implemented yet.

Once everything is working fine, go ahead and implement `isInstance()`.  Try to
keep the function fairly lean, as it should be able to identify an archive
format as quickly as possible, and if someone opens a folder of 100 files and
your `isInstance()` function has to run along with everyone else's 100 times,
you want it to be quick!  You should only throw exceptions in this function for
I/O errors - problems with the file format (e.g. values out of range, file too
short) should never throw exceptions.  If the problem is bad enough you should
return a value like `DefinitelyNo`, indicating that you cannot handle the file
format.

The purpose of this function is to identify an file format, not to verify it.
You may see some formats scanning for invalid characters in filenames or other
lengthy tests, but this is only because those file formats don't have a
signature.  If you are lucky enough to have an unambiguous signature in your
file format, then simply check that and be done.

## Finalise the tests ##

The last thing to do is to go back to the test code, and uncomment the
`isInstance()` calls.  You should update these so that they trigger all the
conditions in your archive handler's `isInstance()` function, to verify that it
correctly identifies and rejects files appropriately.

Run the tests again, and if you get any errors about your new hander
accidentally identifying other archive format as its own, go back to your
`isInstance()` function and add more tests and conditions so that there are no
false detections.

### invalidContent() tests ###

You may also want to add some `invalidContent()` tests after the `isInstance()`
ones.  These tests are for files that are in the correct file format but are
corrupted in a manner that is likely to cause problems upon opening, such as
triggering infinite loops or allocating too much memory.  The tests ensure your
code rejects the corrupted file instead of trying to load it and crashing.  The
tests supply sample archive files that pass your archive handler's
`isInstance()` function but cause an exception to be thrown when opening the
file.  See `test-fmt-grp-duke3d.cpp` for an example where the signatures all
match but there are over a billion files in the archive, which should never
happen.  Not all file formats will have `invalidContent()` tests, as some file
formats cannot be corrupted in a way that will cause critical errors.

Note that technically the `grp-duke3d` handler doesn't need the
`invalidContent()` test, because `isInstance()` could check to make sure the
archive file is large enough to hold that many FAT entries, and if not, report
that it isn't a `.grp` file.  The distinction was made because `.grp` files have
a signature which on its own is enough to positively identify a file in this
format.  Because of this, only this signature is checked by `isInstance()`,
allowing corrupted data to sneak through undetected.  Other file formats with no
signatures typically rely on verifying all the structures within the archive in
order to positively identify the format, so in these cases any corrupted data
would never make it past `isInstance()`.  These formats are the ones that are
less likely to have `invalidContent()` tests.

## Submit a patch ##

Generating a patch is beyond the scope of this article (read up on git) however
here are some hints:

* Update the `README` with your new file format
* Add the README, new files, and other changes to a single commit and push to
  your preferred repository (e.g. fork the project on GitHub and push there)
* Send a pull request to me via GitHub and I will review your change and
  hopefully merge it into the main branch

## Notes ##

* The `Archive::isInstance()` function is not a gate-keeper, but an
  autodetection function.  This means that if you report `DefinitelyNo` (a file
  is definitely not in the format you are implementing) it's still possible for
  someone to attempt to open it with your archive handler anyway by passing the
  `--type` and `--force` parameters to `gamearch`.  Your `Archive` constructor
  should be prepared to deal with this and throw exceptions (not crash) if any
  values are so far out of range that you cannot continue or return a partial
  read.  You must '''not''' check any signatures here and only abort if there is
  a truly unrecoverable error, because the idea behind this is that if someone
  obfuscates the signature but leaves the file format intact, you can still open
  the archive by manually specifying the file format.

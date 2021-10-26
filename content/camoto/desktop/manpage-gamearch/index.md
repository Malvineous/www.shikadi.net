<!--@
TITLE=gamearch manpage
-->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /><title>gamearch</title><meta name="generator" content="DocBook XSL Stylesheets Vsnapshot" /></head><body><div class="refentry"><a id="gamearch"></a><div class="titlepage"></div><div class="refnamediv"><a id="name"></a><h2>Name</h2><p>gamearch — manipulate file archives used internally by many games</p></div><div class="refsynopsisdiv"><h2>Synopsis</h2><div class="cmdsynopsis"><p><code class="command">gamearch</code>  [<em class="replaceable"><code>options</code></em>...]  <em class="replaceable"><code>archive</code></em>  [<em class="replaceable"><code>actions</code></em>...]</p></div></div><div class="refsect1"><a id="description"></a><h2>Description</h2><p>
			Perform the specified <em class="replaceable"><code>actions</code></em> on the given
			<em class="replaceable"><code>archive</code></em>.  The actions are performed in order
			(i.e. the first action specified on the command line is performed first.)
		</p></div><div class="refsect1"><a id="actions"></a><h2>Actions</h2><div class="variablelist"><dl class="variablelist"><dt><span class="term"><code class="option">--list</code>, </span><span class="term"><code class="option">-l</code></span></dt><dd><p>
						list files in the archive
					</p></dd><dt><span class="term"><code class="option">--extract-all</code>, </span><span class="term"><code class="option">-X</code></span></dt><dd><p>
						extract all the files in the archive, saving them into the current
						directory.  If a given file already exists, the newly extracted
						file will have .1 appended (or .2, .3, etc.)
					</p></dd><dt><span class="term"><code class="option">--extract</code>=<em class="replaceable"><code>file</code></em>[<span class="optional">=<em class="replaceable"><code>dest</code></em></span>], </span><span class="term"><code class="option">-x </code><em class="replaceable"><code>file</code></em>[<span class="optional">=<em class="replaceable"><code>dest</code></em></span>]</span></dt><dd><p>
						extract <em class="replaceable"><code>file</code></em> from the archive, saving it
						as <em class="replaceable"><code>dest</code></em> (or into the current directory if
						<em class="replaceable"><code>dest</code></em> is not supplied)
					</p></dd><dt><span class="term"><code class="option">--add</code>=<em class="replaceable"><code>file</code></em>[<span class="optional">=<em class="replaceable"><code>source</code></em></span>], </span><span class="term"><code class="option">-a </code><em class="replaceable"><code>file</code></em>[<span class="optional">=<em class="replaceable"><code>source</code></em></span>]</span></dt><dd><p>
						add <em class="replaceable"><code>source</code></em> into the archive, storing it
						as <em class="replaceable"><code>file</code></em>.  If <em class="replaceable"><code>source
						</code></em> is not specified, <em class="replaceable"><code>file</code></em>
						is read from the current directory.  If
						<em class="replaceable"><code>file</code></em> already exists in the archive,
						depending on the archive format either the operation will fail (see
						<code class="option">--overwrite</code>) or the file will be added with the
						same name as the existing file.  (Those files with identical names
						will need to be referred to by their index number to avoid
						ambiguity.)
					</p></dd><dt><span class="term"><code class="option">--insert</code>=<em class="replaceable"><code>file</code></em>[<span class="optional">=<em class="replaceable"><code>source</code></em></span>]:<em class="replaceable"><code>here</code></em>, </span><span class="term"><code class="option">-i </code><em class="replaceable"><code>file</code></em>[<span class="optional">=<em class="replaceable"><code>source</code></em></span>]:<em class="replaceable"><code>here</code></em></span></dt><dd><p>
						insert <em class="replaceable"><code>source</code></em> into the archive, storing
						it at the location currently used by <em class="replaceable"><code>here</code></em>.
						<em class="replaceable"><code>here</code></em> is moved out of the way to make room.
						If <em class="replaceable"><code>source</code></em> is not specified,
						<em class="replaceable"><code>file</code></em> is read from the current directory.
						<em class="replaceable"><code>here</code></em> must already exist in the archive
						and can be specified by name or index (see <a class="xref" href="#notes" title="Notes">Notes</a> below.)
						After the operation, the newly inserted file exists in the position
						previously occupied by <em class="replaceable"><code>here</code></em>, and the
						original file is moved one position down (i.e. it is now directly
						after the new <em class="replaceable"><code>file</code></em>.)
					</p></dd><dt><span class="term"><code class="option">--overwrite</code>=<em class="replaceable"><code>file</code></em>[<span class="optional">=<em class="replaceable"><code>source</code></em></span>], </span><span class="term"><code class="option">-o </code><em class="replaceable"><code>file</code></em>[<span class="optional">=<em class="replaceable"><code>source</code></em></span>]</span></dt><dd><p>
						replace <em class="replaceable"><code>file</code></em> with the data from
						<em class="replaceable"><code>newfile</code></em>.  <em class="replaceable"><code>file</code></em>
						can be specified as an index (see <a class="xref" href="#notes" title="Notes">Notes</a> below.)  The filename inside the
						archive (if any) is unchanged.
					</p></dd><dt><span class="term"><code class="option">--rename</code>=<em class="replaceable"><code>file</code></em>=<em class="replaceable"><code>newname</code></em>, </span><span class="term"><code class="option">-r </code><em class="replaceable"><code>file</code></em>=<em class="replaceable"><code>newname</code></em></span></dt><dd><p>
						change the name of <em class="replaceable"><code>file</code></em> to
						<em class="replaceable"><code>newname</code></em>.  This can be used to move files
						between folders with archives that support subdirectories.
						<em class="replaceable"><code>file</code></em> can be specified as an index (see
						<a class="xref" href="#notes" title="Notes">Notes</a>
						below.)  If <em class="replaceable"><code>newname</code></em> is specified as an
						index, the file is moved to that position, pushing the rest of the
						files down by one.
					</p></dd><dt><span class="term"><code class="option">--delete</code>=<em class="replaceable"><code>file</code></em>, </span><span class="term"><code class="option">-d </code><em class="replaceable"><code>file</code></em></span></dt><dd><p>
						remove <em class="replaceable"><code>file</code></em> from the archive.
					</p></dd><dt><span class="term"><code class="option">--filetype</code>=<em class="replaceable"><code>format</code></em>, </span><span class="term"><code class="option">-y </code><em class="replaceable"><code>format</code></em></span></dt><dd><p>
						when using <code class="option">--add</code> or <code class="option">--insert</code> the
						file being added can have a type set, for those archives that store
						this value separately (often when no or incomplete filenames are
						used.)  Valid values depend on the archive format, and viewing the
						archive with <code class="option">--list</code> will show any existing file
						types.  A set file type will remain in effect until changed.  Set
						to a blank string ("") to return to the default file type.
					</p></dd><dt><span class="term"><code class="option">--attribute</code>=<em class="replaceable"><code>attr</code></em>, </span><span class="term"><code class="option">-b </code><em class="replaceable"><code>attr</code></em></span></dt><dd><p>
						when using <code class="option">--add</code> or <code class="option">--insert</code> the
						new file can have certain attributes set with this option.  This
						option affects only <code class="option">--add</code> or
						<code class="option">--insert</code> options following it.  Multiple attributes
						can be specified by using the option multiple times.  Prefix the
						attribute with a minus sign to unset it again.  Valid attributes
						are:
					</p><div class="variablelist"><dl class="variablelist"><dt><span class="term"><code class="option">empty</code></span></dt><dd><p>file slot is unused</p></dd><dt><span class="term"><code class="option">hidden</code></span></dt><dd><p>file is hidden between two FAT entries</p></dd><dt><span class="term"><code class="option">compressed</code></span></dt><dd><p>
									a compression algorithm has been applied to the file's content
								</p></dd><dt><span class="term"><code class="option">encrypted</code></span></dt><dd><p>
									an encryption algorithm has been applied to the file's content
								</p></dd></dl></div><p>
						Not all values are supported by a given archive format, and a
						warning will be shown if an unsupported value is used.
					</p></dd><dt><span class="term"><code class="option">--uncompressed-size</code>=<em class="replaceable"><code>integer</code></em>, </span><span class="term"><code class="option">-z </code><em class="replaceable"><code>integer</code></em></span></dt><dd><p>
						archives that can compress their files often store both the
						compressed and decompressed file sizes internally.  Normally filters
						are enabled and these values are calculated automatically, but when
						<code class="option">--unfiltered</code> is in use, the uncompressed size is
						not known.  This option will set the value to use as the
						uncompressed size for all subsequent changes.  It can be specified
						multiple times, and would normally be used just prior to any
						<code class="option">--add</code>, <code class="option">--insert</code> or
						<code class="option">--overwrite</code>.  This option can only be used with
						<code class="option">--unfiltered</code>.
					</p></dd></dl></div></div><div class="refsect1"><a id="options"></a><h2>Options</h2><div class="variablelist"><dl class="variablelist"><dt><span class="term"><code class="option">--type</code>=<em class="replaceable"><code>format</code></em>, </span><span class="term"><code class="option">-t </code><em class="replaceable"><code>format</code></em></span></dt><dd><p>
						manually specify the archive type.  The archive type is normally
						autodetected, but it needs to be specified for a few archives which
						lack signatures to identify them by.  See
						<code class="option">--list-types</code>.
					</p></dd><dt><span class="term"><code class="option">--list-types</code></span></dt><dd><p>
						show a list of supported file formats, along with the code to pass
						to <code class="option">--type</code>.
					</p></dd><dt><span class="term"><code class="option">--unfiltered</code>, </span><span class="term"><code class="option">-u</code></span></dt><dd><p>
						do not filter files.  When extracting files, if they are compressed
						or encrypted inside the archive, they will not be decompressed or
						decrypted, and the output file will contain the unmodified data
						directly from the archive.  This allows use of an external utility
						to perform the decompression, such as
						<a class="citerefentry" href="../manpage-gamecomp"><span class="citerefentry"><span class="refentrytitle">gamecomp</span>(1)</span></a>.  When adding files
						to the archive, they will not be compressed/encrypted and must
						already be in the format the archive expects (i.e. they should be
						compressed by an external utility first.)
					</p><p>
						If the file is not encrypted or
						compressed inside the archive, this option has no effect.  If this
						option is used, <code class="option">--uncompressed-size</code> will need to be
						specified if any changes are made to the archive.
					</p></dd><dt><span class="term"><code class="option">--force</code>, </span><span class="term"><code class="option">-f</code></span></dt><dd><p>
						open the archive as the given <code class="option">--type</code>, even if it
						doesn't look like it's in that format.
					</p></dd><dt><span class="term"><code class="option">--verbose</code>, </span><span class="term"><code class="option">-v</code></span></dt><dd><p>
						print more detail when listing files with <code class="option">--list</code>.
					</p></dd><dt><span class="term"><code class="option">--script</code>, </span><span class="term"><code class="option">-s</code></span></dt><dd><p>
						print output suitable for parsing by a script.
					</p></dd></dl></div></div><div class="refsect1"><a id="examples-basic"></a><h2>Basic Examples</h2><div class="variablelist"><dl class="variablelist"><dt><span class="term"><span class="command"><strong>gamearch duke3d.grp --list</strong></span></span></dt><dd><p>
						display all the filenames inside the Duke Nukem 3D group file.
					</p></dd><dt><span class="term"><span class="command"><strong>gamearch duke3d.grp --extract-all</strong></span></span></dt><dd><p>
						extract all the files inside duke3d.grp into the current directory.
					</p></dd><dt><span class="term"><span class="command"><strong>gamearch wacky.dat --type=dat-wacky --extract-all</strong></span></span></dt><dd><p>
						extract the contents of <code class="literal">wacky.dat</code>.  Since the
						Wacky Wheels archive format lacks a signature, it can't be
						autodetected so the archive type must be specified with the
						<code class="option">--type</code> parameter.
					</p></dd><dt><span class="term"><span class="command"><strong>gamearch duke3d.grp --extract=subway.voc</strong></span></span></dt><dd><p>
						extract a sound effect into the current directory.
					</p></dd><dt><span class="term"><span class="command"><strong>gamearch duke3d.grp --add=newsong.mid</strong></span></span></dt><dd><p>
						add a new music track into the group file.
					</p></dd><dt><span class="term"><span class="command"><strong>gamearch duke3d.grp --delete=newsong.mid</strong></span></span></dt><dd><p>
						delete the file added in the last example.
					</p></dd></dl></div></div><div class="refsect1"><a id="examples-advanced"></a><h2>Advanced Examples</h2><div class="variablelist"><dl class="variablelist"><dt><span class="term"><span class="command"><strong>gamearch hocus.dat -x @1=first.bin</strong></span></span></dt><dd><p>
						extract the first file in the archive and save it as
						<code class="literal">first.bin</code> in the current directory.
					</p></dd><dt><span class="term"><span class="command"><strong>gamearch duke3d.grp -f -a subway.voc=/tmp/truck.voc</strong></span></span></dt><dd><p>
						add <code class="literal">/tmp/truck.voc</code> into the archive, saving it
						over the top of <code class="literal">subway.voc</code></p></dd><dt><span class="term"><span class="command"><strong>gamearch duke3d.grp -x @1.5=hidden.bin</strong></span></span></dt><dd><p>
						extract the hidden data stored between the first and second files in
						the archive (only valid if <code class="option">--list</code> reports hidden
						data present)
					</p></dd><dt><span class="term"><span class="command"><strong>gamearch duke3d.grp -a @1.5=hidden.bin</strong></span></span></dt><dd><p>
						add hidden data between the first and second files in the archive
						(not all archive formats support this)
					</p></dd><dt><span class="term"><span class="command"><strong>gamearch duke3d.grp -a music/newsong.mid</strong></span><br /><span class="command"><strong>gamearch duke3d.grp -a newsong.mid=music/newsong.mid</strong></span></span></dt><dd><p>
						the first command fails adding the file, because the .GRP format
						does not support subdirectories.  The second command works as it is
						specifying a valid alternate name to store in the archive.
					</p></dd><dt><span class="term"><span class="command"><strong>gamearch disk.pod -a music/tame.mod</strong></span></span></dt><dd><p>
						adds a file called <code class="literal">tame.mod</code> into the
						<code class="literal">music</code> subdirectory in the archive
						<code class="literal">disk.pod</code>.  The file being added
						(<code class="literal">tame.mod</code>) must also reside in a folder called
						<code class="literal">music</code> in the current directory.
					</p></dd><dt><span class="term"><span class="command"><strong>gamearch disk.pod -a music/tame.mod=tame.mod</strong></span></span></dt><dd><p>
						same as previous example, except the file being added is now read
						from the current directory instead
					</p></dd><dt><span class="term"><span class="command"><strong>gamearch duke3d.grp -r e1l1.map=@1</strong></span></span></dt><dd><p>
						moves <code class="literal">e1l1.map</code> to be the first file in the
						archive.  The other files are shifted out of the way (so the
						original first file in the archive becomes the second file.)  This
						is usually only necessary when a game places significance on the
						positions of files as well as their names (e.g. .wad)
					</p></dd><dt><span class="term"><span class="command"><strong>gamearch duke3d.grp -a data.bin -r data.bin=@5</strong></span></span></dt><dd><p>
						inserts <code class="literal">data.bin</code> as the fifth file in the
						archive, moving the other files out of the way (but not overwriting
						any of them!)
					</p></dd><dt><span class="term"><span class="command"><strong>gamearch duke3d.grp -f -a @5=data.bin</strong></span></span></dt><dd><p>
						overwrites the fifth file in the archive with
						<code class="literal">data.bin</code> (renaming the fifth file to
						<code class="literal">data.bin</code> in the process, regardless of its
						previous name.)
					</p></dd><dt><span class="term"><span class="command"><strong>gamearch bash1.dat -a data1.bin --filetype image/bash-sprite
					-a data2.bin -a data3.bin</strong></span></span></dt><dd><p>
						appends <code class="literal">data1.bin</code> leaving its file type as the
						default, then appends <code class="literal">data2.bin</code> followed by
						<code class="literal">data3.bin</code>, flagging them both as containing
						Monster Bash sprite data.
					</p></dd><dt><span class="term"><span class="command"><strong>gamearch bash1.dat -a data1.bin --attribute compressed
					-a data2.bin -a data3.bin --attribute hidden -a data4.bin
					--attribute -compressed -a data5.bin</strong></span></span></dt><dd><p>
						appends <code class="literal">data1.bin</code> through
						<code class="literal">data5.bin</code> as follows:
						<code class="literal">data1.bin</code> is normal (no attributes),
						<code class="literal">data2.bin</code> and <code class="literal">data3.bin</code> are
						both compressed, <code class="literal">data4.bin</code> is both compressed
						and hidden, and <code class="literal">data5.bin</code> is just hidden.
					</p></dd></dl></div></div><div class="refsect1"><a id="notes"></a><h2>Notes</h2><p>
			When a filename refers to an item inside an archive, it can be specified
			either by filename, or by index.  When using an index, prepend an at-sign
			(<code class="literal">@</code>) before the number.  Using an index is most useful
			for archives which don't support filenames, or for accessing hidden data
			between files in archives which support it.
		</p><p>
			Exit status is <span class="returnvalue">0</span> on success,
			<span class="returnvalue">non-zero</span> on failure (<span class="returnvalue">1</span>
			for bad parameters, <span class="returnvalue">2</span> for critical errors such
			as being unable to open the the archive file, <span class="returnvalue">3</span>
			for more information needed, <span class="returnvalue">4</span> for non-critical
			errors such as being unable to insert one of many files,
			<span class="returnvalue">5</span> for uncommon failures like running out of disk
			space.)
		</p><p>
			All the file formats supported by this utility are fully documented on the
			<a class="ulink" href="http://www.shikadi.net/moddingwiki" target="_top">Game Modding Wiki</a>.
		</p></div><div class="refsect1"><a id="bugs"></a><h2>Bugs and Questions</h2><p>
			Report bugs at
			<a class="ulink" href="https://github.com/Malvineous/libgamearchive/issues" target="_top">https://github.com/Malvineous/libgamearchive/issues</a></p><p>
			Ask questions about Camoto or modding in general at the <a class="ulink" href="http://www.classicdosgames.com/forum/viewforum.php?f=25" target="_top">RGB
			Classic Games modding forum</a></p></div><div class="refsect1"><a id="copyright"></a><h2>Copyright</h2><p>
			Copyright (c) 2010-2017 Adam Nielsen.
		</p><p>
			License GPLv3+: <a class="ulink" href="http://gnu.org/licenses/gpl.html" target="_top">GNU GPL
			version 3 or later</a></p><p>
			This is free software: you are free to change and redistribute it.
			There is NO WARRANTY, to the extent permitted by law.
		</p></div><div class="refsect1"><a id="seealso"></a><h2>See Also</h2><span class="simplelist"><a class="citerefentry" href="../manpage-gamecomp"><span class="citerefentry"><span class="refentrytitle">gamecomp</span>(1)</span></a>, <a class="citerefentry" href="../manpage-gametls"><span class="citerefentry"><span class="refentrytitle">gametls</span>(1)</span></a>, <a class="citerefentry" href="../manpage-gameimg"><span class="citerefentry"><span class="refentrytitle">gameimg</span>(1)</span></a>, <a class="citerefentry" href="../manpage-gamemap"><span class="citerefentry"><span class="refentrytitle">gamemap</span>(1)</span></a>, <a class="citerefentry" href="../manpage-gamemus"><span class="citerefentry"><span class="refentrytitle">gamemus</span>(1)</span></a>, <a class="citerefentry" href="../manpage-camoto-studio"><span class="citerefentry"><span class="refentrytitle">camoto-studio</span>(1)</span></a></span></div></div></body></html>

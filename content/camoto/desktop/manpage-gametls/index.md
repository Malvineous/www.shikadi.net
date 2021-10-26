<!--@
TITLE=gametls manpage
-->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /><title>gametls</title><meta name="generator" content="DocBook XSL Stylesheets Vsnapshot" /></head><body><div class="refentry"><a id="gametls"></a><div class="titlepage"></div><div class="refnamediv"><a id="name"></a><h2>Name</h2><p>gametls — 
			manipulate collections of images (tilesets) used internally by many games
		</p></div><div class="refsynopsisdiv"><h2>Synopsis</h2><div class="cmdsynopsis"><p><code class="command">gametls</code>  [<em class="replaceable"><code>options</code></em>...]  <em class="replaceable"><code>tileset</code></em>  [<em class="replaceable"><code>actions</code></em>...]</p></div></div><div class="refsect1"><a id="description"></a><h2>Description</h2><p>
			Perform the specified <em class="replaceable"><code>actions</code></em> on the given
			<em class="replaceable"><code>tileset</code></em> file.  The actions are performed in order
			(i.e. the first action specified on the command line is performed first.)
		</p></div><div class="refsect1"><a id="actions"></a><h2>Actions</h2><div class="variablelist"><dl class="variablelist"><dt><span class="term"><code class="option">--list</code>, </span><span class="term"><code class="option">-l</code></span></dt><dd><p>
						list tilesets and images in the file, along with an
						<code class="varname">id</code> that can be passed to the other commands.
					</p></dd><dt><span class="term"><code class="option">--extract-all-images</code>, </span><span class="term"><code class="option">-X</code></span></dt><dd><p>
						extract all the images in the file, saving them into the current
						directory as a separate .png file per image.
					</p></dd><dt><span class="term"><code class="option">--extract-all-tilesets</code>, </span><span class="term"><code class="option">-T</code></span></dt><dd><p>
						extract all the images in the file, combining them into one .png
						file per tileset (e.g. as a grid of 10x10 tiles.)  Grid size is
						controlled via the <code class="option">--width</code> option.
					</p></dd><dt><span class="term"><code class="option">--extract</code>=<em class="replaceable"><code>id</code></em>[<span class="optional">=<em class="replaceable"><code>dest.png</code></em></span>], </span><span class="term"><code class="option">-x </code><em class="replaceable"><code>id</code></em>[<span class="optional">=<em class="replaceable"><code>dest.png</code></em></span>]</span></dt><dd><p>
						extract <em class="replaceable"><code>id</code></em> from the tileset, saving it
						as <em class="replaceable"><code>dest.png</code></em> (or into the current
						directory as <em class="replaceable"><code>id</code></em>.png if
						<em class="replaceable"><code>dest.png</code></em> is not supplied.)
					</p></dd><dt><span class="term"><code class="option">--overwrite</code>=<em class="replaceable"><code>id</code></em>[<span class="optional">=<em class="replaceable"><code>new.png</code></em></span>], </span><span class="term"><code class="option">-o </code><em class="replaceable"><code>id</code></em>[<span class="optional">=<em class="replaceable"><code>new.png</code></em></span>]</span></dt><dd><p>
						replace <em class="replaceable"><code>id</code></em> with the data from
						<em class="replaceable"><code>new.png</code></em>.  The image must be in the
						correct format (bit depth) or an error will be returned.  The
						palette in the image file (if any) is not changed, so for best
						results the palette in <em class="replaceable"><code>new.png</code></em> should
						match the one generated when extracting images.  If
						<em class="replaceable"><code>new.png</code></em> is not specified,
						<code class="literal"><em class="replaceable"><code>id</code></em>.png</code> is used.
					</p></dd><dt><span class="term"><code class="option">--insert-image</code>=<em class="replaceable"><code>id</code></em>[<span class="optional">=<em class="replaceable"><code>new.png</code></em></span>], </span><span class="term"><code class="option">-i </code><em class="replaceable"><code>id</code></em>[<span class="optional">=<em class="replaceable"><code>new.png</code></em></span>]</span></dt><dd><p>
						store <em class="replaceable"><code>new.png</code></em> at the position
						<em class="replaceable"><code>id</code></em>, shifting the original
						<em class="replaceable"><code>id</code></em> and all following tiles
						closer to the end of the file.  If
						<em class="replaceable"><code>new.png</code></em> is not specified,
						<code class="literal"><em class="replaceable"><code>id</code></em>.png</code> is used.
					</p></dd><dt><span class="term"><code class="option">--insert-tileset</code>=<em class="replaceable"><code>id</code></em>, </span><span class="term"><code class="option">-n </code><em class="replaceable"><code>id</code></em></span></dt><dd><p>
						add an empty tileset at position <em class="replaceable"><code>id</code></em>,
						shifting the original <em class="replaceable"><code>id</code></em> and all
						following sub-tilesets closer to the end of the file.  This can only
						be used with file formats that support sub-tilesets.
					</p></dd><dt><span class="term"><code class="option">--print</code>=<em class="replaceable"><code>id</code></em>, </span><span class="term"><code class="option">-p </code><em class="replaceable"><code>id</code></em></span></dt><dd><p>
						print image <em class="replaceable"><code>id</code></em> to standard output using
						ANSI codes and spaces to display the image on a text console.
					</p></dd><dt><span class="term"><code class="option">--set-size</code>=<em class="replaceable"><code>W</code></em>x<em class="replaceable"><code>H</code></em>, </span><span class="term"><code class="option">-z </code><em class="replaceable"><code>W</code></em>x<em class="replaceable"><code>H</code></em></span></dt><dd><p>
						set all images in the tileset <em class="replaceable"><code>id</code></em> to
						<em class="replaceable"><code>W</code></em> pixels wide and
						<em class="replaceable"><code>H</code></em> pixels high.  This will cause all
						images to become distorted, so all images will need to be
						overwritten after this operation.
					</p></dd></dl></div></div><div class="refsect1"><a id="options"></a><h2>Options</h2><div class="variablelist"><dl class="variablelist"><dt><span class="term"><code class="option">--type</code>=<em class="replaceable"><code>format</code></em>, </span><span class="term"><code class="option">-t </code><em class="replaceable"><code>format</code></em></span></dt><dd><p>
						manually specify the file type.  The type is normally autodetected,
						but it needs to be specified for a few formats which lack signatures
						to identify them by.  See <code class="option">--list-types</code>.
					</p></dd><dt><span class="term"><code class="option">--list-types</code></span></dt><dd><p>
						show a list of supported file formats, along with the value to pass
						to <code class="option">--type</code>.
					</p></dd><dt><span class="term"><code class="option">--width</code>=<em class="replaceable"><code>num</code></em>, </span><span class="term"><code class="option">-w </code><em class="replaceable"><code>num</code></em></span></dt><dd><p>
						when using <code class="option">--extract</code> with a tileset or
						<code class="option">--extract-all-tilesets</code>, this option controls the
						width of the .png image, measured in tiles.  A tileset with 32
						images and a <code class="option">--width</code> of 8 will result in a .png
						file of 8x4 tiles.
					</p></dd><dt><span class="term"><code class="option">--force</code>, </span><span class="term"><code class="option">-f</code></span></dt><dd><p>
						open the file as the given <code class="option">--type</code>, even if it
						doesn't look like it's in that format.
					</p></dd><dt><span class="term"><code class="option">--script</code>, </span><span class="term"><code class="option">-s</code></span></dt><dd><p>
						print output suitable for parsing by a script.
					</p></dd></dl></div></div><div class="refsect1"><a id="examples"></a><h2>Examples</h2><div class="variablelist"><dl class="variablelist"><dt><span class="term"><span class="command"><strong>gametls cc1.gfx --list</strong></span></span></dt><dd><p>
						display a list of the images inside the main Crystal Caves graphics
						file.
					</p></dd><dt><span class="term"><span class="command"><strong>gametls cc1.gfx --extract-all-images</strong></span></span></dt><dd><p>
						extract every image in every tileset as a separate .png file into
						the current directory.
					</p></dd><dt><span class="term"><span class="command"><strong>gametls cc1.gfx --extract-all-tilesets</strong></span></span></dt><dd><p>
						extract all the tilesets into a handful of .png files in the current
						directory (all the images in each tileset are displayed as a grid in
						each .png file.)
					</p></dd><dt><span class="term"><span class="command"><strong>gametls cc1.gfx -p 0.1.2</strong></span></span></dt><dd><p>
						print the third image ("2") from the second tileset ("0.1") as
						ANSI coloured text.
					</p></dd><dt><span class="term"><span class="command"><strong>gametls cc1.gfx -x 0.1.2=test.png</strong></span></span></dt><dd><p>
						extract the third image ("2") from the second tileset ("0.1") and
						save it as <code class="literal">test.png</code> in the current directory.
					</p></dd><dt><span class="term"><span class="command"><strong>gametls cc1.gfx -o 0.1.2=new.png</strong></span></span></dt><dd><p>
						overwrite the image extracted in the previous example with the
						contents of <code class="literal">new.png</code>.
					</p></dd><dt><span class="term"><span class="command"><strong>gametls cc1.gfx --type=img-ccaves --list</strong></span></span></dt><dd><p>
						list contents of the tileset, when the format can't be autodetected
						and must be specified manually with <code class="option">--type</code>.
					</p></dd></dl></div></div><div class="refsect1"><a id="notes"></a><h2>Notes</h2><p>
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
			<a class="ulink" href="https://github.com/Malvineous/libgamegraphics/issues" target="_top">https://github.com/Malvineous/libgamegraphics/issues</a></p><p>
			Ask questions about Camoto or modding in general at the <a class="ulink" href="http://www.classicdosgames.com/forum/viewforum.php?f=25" target="_top">RGB
			Classic Games modding forum</a></p></div><div class="refsect1"><a id="copyright"></a><h2>Copyright</h2><p>
			Copyright (c) 2010-2017 Adam Nielsen.
		</p><p>
			License GPLv3+: <a class="ulink" href="http://gnu.org/licenses/gpl.html" target="_top">GNU GPL
			version 3 or later</a></p><p>
			This is free software: you are free to change and redistribute it.
			There is NO WARRANTY, to the extent permitted by law.
		</p></div><div class="refsect1"><a id="seealso"></a><h2>See Also</h2><span class="simplelist"><a class="citerefentry" href="../manpage-gamearch"><span class="citerefentry"><span class="refentrytitle">gamearch</span>(1)</span></a>, <a class="citerefentry" href="../manpage-gamecomp"><span class="citerefentry"><span class="refentrytitle">gamecomp</span>(1)</span></a>, <a class="citerefentry" href="../manpage-gameimg"><span class="citerefentry"><span class="refentrytitle">gameimg</span>(1)</span></a>, <a class="citerefentry" href="../manpage-gamemap"><span class="citerefentry"><span class="refentrytitle">gamemap</span>(1)</span></a>, <a class="citerefentry" href="../manpage-gamemus"><span class="citerefentry"><span class="refentrytitle">gamemus</span>(1)</span></a>, <a class="citerefentry" href="../manpage-camoto-studio"><span class="citerefentry"><span class="refentrytitle">camoto-studio</span>(1)</span></a></span></div></div></body></html>

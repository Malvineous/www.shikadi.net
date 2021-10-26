<!--@
TITLE=gamemap manpage
-->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /><title>gamemap</title><meta name="generator" content="DocBook XSL Stylesheets Vsnapshot" /></head><body><div class="refentry"><a id="gamemap"></a><div class="titlepage"></div><div class="refnamediv"><a id="name"></a><h2>Name</h2><p>gamemap — 
			get information about maps/levels used by supported games
		</p></div><div class="refsynopsisdiv"><h2>Synopsis</h2><div class="cmdsynopsis"><p><code class="command">gamemap</code>  [<em class="replaceable"><code>options</code></em>...]  <em class="replaceable"><code>map</code></em>  [<em class="replaceable"><code>actions</code></em>...]</p></div></div><div class="refsect1"><a id="description"></a><h2>Description</h2><p>
			Perform the specified <em class="replaceable"><code>actions</code></em> on the given
			<em class="replaceable"><code>map</code></em> file.  The actions are performed in order
			(i.e. the first action specified on the command line is performed first.)
		</p></div><div class="refsect1"><a id="actions"></a><h2>Actions</h2><div class="variablelist"><dl class="variablelist"><dt><span class="term"><code class="option">--info</code>, </span><span class="term"><code class="option">-i</code></span></dt><dd><p>
						show information about the map (size, layers, etc.)
					</p></dd><dt><span class="term"><code class="option">--print</code>=<em class="replaceable"><code>layer</code></em>, </span><span class="term"><code class="option">-p </code><em class="replaceable"><code>layer</code></em></span></dt><dd><p>
						attempt to print the given <em class="replaceable"><code>layer</code></em> as ASCII
						text to standard output.  The values printed at each tile location
						are the internal tile codes.
					</p></dd><dt><span class="term"><code class="option">--render</code>=<em class="replaceable"><code>dest.png</code></em>, </span><span class="term"><code class="option">-r </code><em class="replaceable"><code>dest.png</code></em></span></dt><dd><p>
						render the map as an image, saved to
						<em class="replaceable"><code>dest.png</code></em>.
					</p></dd></dl></div></div><div class="refsect1"><a id="options"></a><h2>Options</h2><div class="variablelist"><dl class="variablelist"><dt><span class="term"><code class="option">--list-types</code></span></dt><dd><p>
						show a list of supported file formats, along with the values to pass
						to <code class="option">--type</code> and <code class="option">--graphicstype</code>.
					</p></dd><dt><span class="term"><code class="option">--force</code>, </span><span class="term"><code class="option">-f</code></span></dt><dd><p>
						open the file as the given <code class="option">--type</code>, even if it
						doesn't look like it's in that format.
					</p></dd><dt><span class="term"><code class="option">--graphics</code>=<em class="replaceable"><code>tileset</code></em>, </span><span class="term"><code class="option">-g </code><em class="replaceable"><code>tileset</code></em></span></dt><dd><p>
						supply the filename of the <em class="replaceable"><code>tileset</code></em> to use
						when rendering the map.
					</p></dd><dt><span class="term"><code class="option">--graphicstype</code>=<em class="replaceable"><code>format</code></em>, </span><span class="term"><code class="option">-y </code><em class="replaceable"><code>format</code></em></span></dt><dd><p>
						manually specify the file type of the graphics file given by
						<code class="option">--graphics</code>.  The type is normally autodetected,
						but it needs to be specified for a few formats which lack signatures
						to identify them by.  See <code class="option">--list-types</code>.
					</p></dd><dt><span class="term"><code class="option">--script</code>, </span><span class="term"><code class="option">-s</code></span></dt><dd><p>
						print output suitable for parsing by a script.
					</p></dd><dt><span class="term"><code class="option">--type</code>=<em class="replaceable"><code>format</code></em>, </span><span class="term"><code class="option">-t </code><em class="replaceable"><code>format</code></em></span></dt><dd><p>
						manually specify the file type.  The type is normally autodetected,
						but it needs to be specified for a few formats which lack signatures
						to identify them by.  See <code class="option">--list-types</code>.
					</p></dd></dl></div></div><div class="refsect1"><a id="examples"></a><h2>Examples</h2><div class="variablelist"><dl class="variablelist"><dt><span class="term"><span class="command"><strong>gamemap level01.dav --info</strong></span></span></dt><dd><p>
						display information about the first level in Dangerous Dave.
					</p></dd><dt><span class="term"><span class="command"><strong>gamemap level01.dav --print 1 | less -S</strong></span></span></dt><dd><p>
						display the first layer of the map as text, passing it to
						<code class="literal">less</code> so that each row doesn't wrap to the next
						line, and <code class="literal">less</code> can be used to scroll through the
						layer horizontally.
					</p></dd><dt><span class="term"><span class="command"><strong>gamemap --graphics vgadave.dav level01.dav --render dave01.png</strong></span></span></dt><dd><p>
						use the tileset <code class="literal">vgadave.dav</code> to draw the entire
						map, and save it as the PNG image <code class="literal">dave01.png</code>.
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
			<a class="ulink" href="https://github.com/Malvineous/libgamemaps/issues" target="_top">https://github.com/Malvineous/libgamemaps/issues</a></p><p>
			Ask questions about Camoto or modding in general at the <a class="ulink" href="http://www.classicdosgames.com/forum/viewforum.php?f=25" target="_top">RGB
			Classic Games modding forum</a></p></div><div class="refsect1"><a id="copyright"></a><h2>Copyright</h2><p>
			Copyright (c) 2010-2017 Adam Nielsen.
		</p><p>
			License GPLv3+: <a class="ulink" href="http://gnu.org/licenses/gpl.html" target="_top">GNU GPL
			version 3 or later</a></p><p>
			This is free software: you are free to change and redistribute it.
			There is NO WARRANTY, to the extent permitted by law.
		</p></div><div class="refsect1"><a id="seealso"></a><h2>See Also</h2><span class="simplelist"><a class="citerefentry" href="../manpage-gamearch"><span class="citerefentry"><span class="refentrytitle">gamearch</span>(1)</span></a>, <a class="citerefentry" href="../manpage-gamecomp"><span class="citerefentry"><span class="refentrytitle">gamecomp</span>(1)</span></a>, <a class="citerefentry" href="../manpage-gameimg"><span class="citerefentry"><span class="refentrytitle">gameimg</span>(1)</span></a>, <a class="citerefentry" href="../manpage-gametls"><span class="citerefentry"><span class="refentrytitle">gametls</span>(1)</span></a>, <a class="citerefentry" href="../manpage-gamemus"><span class="citerefentry"><span class="refentrytitle">gamemus</span>(1)</span></a>, <a class="citerefentry" href="../manpage-camoto-studio"><span class="citerefentry"><span class="refentrytitle">camoto-studio</span>(1)</span></a></span></div></div></body></html>

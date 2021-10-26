<!--@
TITLE=gamecomp manpage
-->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /><title>gamecomp</title><meta name="generator" content="DocBook XSL Stylesheets Vsnapshot" /></head><body><div class="refentry"><a id="gamecomp"></a><div class="titlepage"></div><div class="refnamediv"><a id="gamecomp-name"></a><h2>Name</h2><p>gamecomp — 
			apply or reverse compression and encryption algorithms used by games
		</p></div><div class="refsynopsisdiv"><h2>Synopsis</h2><div class="cmdsynopsis"><p><code class="command">gamecomp</code>   --type=<em class="replaceable"><code>type</code></em>  [--apply]  &lt; <em class="replaceable"><code>infile</code></em>   &gt; <em class="replaceable"><code>outfile</code></em> </p></div></div><div class="refsect1"><a id="gamecomp-description"></a><h2>Description</h2><p>
			Filter data from standard input and send it to standard output, using the
			given <em class="replaceable"><code>algorithm</code></em>.  The default is to reverse
			the algorithm (which will decompress or decrypt the input data) however
			<code class="option">--apply</code> will apply the algorithm instead (resulting in
			the input data being compressed or encrypted.)
		</p></div><div class="refsect1"><a id="gamecomp-options"></a><h2>Options</h2><div class="variablelist"><dl class="variablelist"><dt><span class="term"><code class="option">--type</code>=<em class="replaceable"><code>algorithm</code></em>, </span><span class="term"><code class="option">-t</code><em class="replaceable"><code>algorithm</code></em></span></dt><dd><p>
						specify the algorithm to use, from the list shown by
						<code class="option">--list</code>.
					</p></dd><dt><span class="term"><code class="option">--list</code>, </span><span class="term"><code class="option">-l</code></span></dt><dd><p>
						list all the algorithms on stdout instead.
					</p></dd></dl></div></div><div class="refsect1"><a id="gamecomp-examples-basic"></a><h2>Examples</h2><div class="variablelist"><dl class="variablelist"><dt><span class="term"><span class="command"><strong>gamearch bash1.dat -u -x mb1_h1.txt</strong></span><br /><span class="command"><strong>gamecomp -t lzw-bash &lt; mb1_h1.txt &gt; decompressed.txt</strong></span></span></dt><dd><p>
						extract <code class="literal">mb1_h1.txt</code> from the Monster Bash archive
						file (<code class="option">-x</code>), without decompressing it
						(<code class="option">-u</code>).  Then use <code class="literal">gamecomp</code> to
						decompress it instead, saving the data into
						<code class="literal">decompressed.txt</code>.
					</p></dd><dt><span class="term"><span class="command"><strong>gamecomp -a -t lzw-bash &lt; input.txt &gt; mb1_h1.txt</strong></span></span></dt><dd><p>
						take the plain text in <code class="literal">input.txt</code>, compress it
						using the Monster Bash compression algorithm and store the
						compressed data in <code class="literal">mb1_h1.txt</code>.
					</p></dd></dl></div></div><div class="refsect1"><a id="gamecomp-notes"></a><h2>Notes</h2><p>
			Exit status is <span class="returnvalue">0</span> on success,
			<span class="returnvalue">1</span> on bad parameters and
			<span class="returnvalue">2</span> on an I/O error.
		</p><p>
			All the algorithms supported by this utility are fully documented on the
			<a class="ulink" href="http://www.shikadi.net/moddingwiki" target="_top">Game Modding Wiki</a>.
		</p></div><div class="refsect1"><a id="gamecomp-issues"></a><h2>Known Issues</h2><p>
			Not all algorithms support compression.
		</p></div><div class="refsect1"><a id="gamecomp-bugs"></a><h2>Bugs and Questions</h2><p>
			Report bugs at
			<a class="ulink" href="https://github.com/Malvineous/libgamearchive/issues" target="_top">https://github.com/Malvineous/libgamearchive/issues</a></p><p>
			Ask questions about Camoto or modding in general at the <a class="ulink" href="http://www.classicdosgames.com/forum/viewforum.php?f=25" target="_top">RGB
			Classic Games modding forum</a></p></div><div class="refsect1"><a id="gamecomp-copyright"></a><h2>Copyright</h2><p>
			Copyright (c) 2010-2017 Adam Nielsen.
		</p><p>
			License GPLv3+: <a class="ulink" href="http://gnu.org/licenses/gpl.html" target="_top">GNU GPL
			version 3 or later</a></p><p>
			This is free software: you are free to change and redistribute it.
			There is NO WARRANTY, to the extent permitted by law.
		</p></div><div class="refsect1"><a id="gamecomp-seealso"></a><h2>See Also</h2><span class="simplelist"><a class="citerefentry" href="../manpage-gamearch"><span class="citerefentry"><span class="refentrytitle">gamearch</span>(1)</span></a>, <a class="citerefentry" href="../manpage-gametls"><span class="citerefentry"><span class="refentrytitle">gametls</span>(1)</span></a>, <a class="citerefentry" href="../manpage-gameimg"><span class="citerefentry"><span class="refentrytitle">gameimg</span>(1)</span></a>, <a class="citerefentry" href="../manpage-gamemap"><span class="citerefentry"><span class="refentrytitle">gamemap</span>(1)</span></a>, <a class="citerefentry" href="../manpage-gamemus"><span class="citerefentry"><span class="refentrytitle">gamemus</span>(1)</span></a>, <a class="citerefentry" href="../manpage-camoto-studio"><span class="citerefentry"><span class="refentrytitle">camoto-studio</span>(1)</span></a></span></div></div></body></html>

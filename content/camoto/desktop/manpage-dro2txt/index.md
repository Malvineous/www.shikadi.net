<!--@
TITLE=dro2txt manpage
-->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /><title>dro2txt</title><meta name="generator" content="DocBook XSL Stylesheets V1.78.1" /></head><body><div class="refentry"><a id="dro2txt"></a><div class="titlepage"></div><div class="refnamediv"><a id="name"></a><h2>Name</h2><p>dro2txt — 
			list the events in a DROv2 capture
		</p></div><div class="refsynopsisdiv"><h2>Synopsis</h2><div class="cmdsynopsis"><p><code class="command">dro2txt</code>   &lt; <em class="replaceable"><code>input.dro</code></em> </p></div></div><div class="refsect1"><a id="description"></a><h2>Description</h2><p>
			Convert a DRO file (a DOSBox raw OPL capture) read from stdin into ASCII
			text.  The text is sent to stdout and each line roughly describes an
			Ad Lib event.
		</p><p>
			The events are printed such that things not affecting the audio output
			(such as different ordering of the OPL register writes, or redundant
			register writes) will not change the output text.  Thus two different
			players could output quite different OPL data yet providing the resulting
			music sounds the same, the text produced by this utility would also be the
			same.
		</p><p>
			This utility is intended to be used in conjunction with <a class="citerefentry" href="../manpage-diff"><span class="citerefentry"><span class="refentrytitle">diff</span>(1)</span></a> to compare two different .dro files.  A binary comparison
			in this situation is not practical, as the files could be very different
			at the byte level yet sound the same musically.  This utility will allow
			the files to be compared at the aural level.  Its main use is in
			implementing new music formats, where a libgamemusic format reader can be
			compared with a .dro capture of the original in-game music to ensure the
			format is being converted correctly.
		</p></div><div class="refsect1"><a id="examples"></a><h2>Examples</h2><div class="variablelist"><dl class="variablelist"><dt><span class="term"><span class="command"><strong>dro2txt &lt; game.dro &gt; orig.txt &amp;&amp;
						dro2txt &lt; output.dro &gt; convert.txt &amp;&amp;
						diff -u orig.txt convert.txt | less</strong></span></span></dt><dd><p>
						compare two .dro files and show any differences as a diff
					</p></dd></dl></div></div><div class="refsect1"><a id="notes"></a><h2>Notes</h2><p>
			The utility only supports version 2.0 of the DOSBox .dro format, used by
			DOSBox 0.73 and newer.
		</p><p>
			Exit status is <span class="returnvalue">0</span> on success,
			<span class="returnvalue">1</span> on failure.
		</p><p>
			The .dro file format is fully documented on the
			<a class="ulink" href="http://www.shikadi.net/moddingwiki" target="_top">Game Modding Wiki</a>.
		</p></div><div class="refsect1"><a id="bugs"></a><h2>Bugs and Questions</h2><p>
			Report bugs at <a class="ulink" href="http://www.shikadi.net/camoto/bugs/" target="_top">http://www.shikadi.net/camoto/bugs/</a></p><p>
			Ask questions about Camoto or modding in general at the <a class="ulink" href="http://www.classicdosgames.com/forum/viewforum.php?f=25" target="_top">RGB
			Classic Games modding forum</a></p></div><div class="refsect1"><a id="copyright"></a><h2>Copyright</h2><p>
			Copyright (c) 2010-2012 Adam Nielsen.
		</p><p>
			License GPLv3+: <a class="ulink" href="http://gnu.org/licenses/gpl.html" target="_top">GNU GPL
			version 3 or later</a></p><p>
			This is free software: you are free to change and redistribute it.
			There is NO WARRANTY, to the extent permitted by law.
		</p></div><div class="refsect1"><a id="seealso"></a><h2>See Also</h2><span class="simplelist"><a class="citerefentry" href="../manpage-dosbox"><span class="citerefentry"><span class="refentrytitle">dosbox</span>(1)</span></a>, <a class="citerefentry" href="../manpage-gamearch"><span class="citerefentry"><span class="refentrytitle">gamearch</span>(1)</span></a>, <a class="citerefentry" href="../manpage-gamecomp"><span class="citerefentry"><span class="refentrytitle">gamecomp</span>(1)</span></a>, <a class="citerefentry" href="../manpage-gameimg"><span class="citerefentry"><span class="refentrytitle">gameimg</span>(1)</span></a>, <a class="citerefentry" href="../manpage-gametls"><span class="citerefentry"><span class="refentrytitle">gametls</span>(1)</span></a>, <a class="citerefentry" href="../manpage-gamemap"><span class="citerefentry"><span class="refentrytitle">gamemap</span>(1)</span></a>, <a class="citerefentry" href="../manpage-gamemus"><span class="citerefentry"><span class="refentrytitle">gamemus</span>(1)</span></a>, <a class="citerefentry" href="../manpage-camoto-studio"><span class="citerefentry"><span class="refentrytitle">camoto-studio</span>(1)</span></a></span></div></div></body></html>

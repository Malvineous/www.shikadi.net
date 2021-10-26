<!--@
TITLE=gamemus manpage
-->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /><title>gamemus</title><meta name="generator" content="DocBook XSL Stylesheets Vsnapshot" /></head><body><div class="refentry"><a id="gamemus"></a><div class="titlepage"></div><div class="refnamediv"><a id="name"></a><h2>Name</h2><p>gamemus — 
			read, write and convert game music files
		</p></div><div class="refsynopsisdiv"><h2>Synopsis</h2><div class="cmdsynopsis"><p><code class="command">gamemus</code>  [<em class="replaceable"><code>options</code></em>...]  <em class="replaceable"><code>song</code></em>  [<em class="replaceable"><code>actions</code></em>...]</p></div></div><div class="refsect1"><a id="description"></a><h2>Description</h2><p>
			Perform the specified <em class="replaceable"><code>actions</code></em> on the given
			<em class="replaceable"><code>song</code></em> file.  The actions are performed in order
			(i.e. the first action specified on the command line is performed first.)
		</p></div><div class="refsect1"><a id="actions"></a><h2>Actions</h2><div class="variablelist"><dl class="variablelist"><dt><span class="term"><code class="option">--convert</code>=<em class="replaceable"><code>format</code></em>:<em class="replaceable"><code>file</code></em>, </span><span class="term"><code class="option">-c </code><em class="replaceable"><code>format</code></em>:<em class="replaceable"><code>file</code></em></span></dt><dd><p>
						convert the input song into another
						<em class="replaceable"><code>format</code></em>, saving it as
						<em class="replaceable"><code>file</code></em>.  Use
						<code class="option">--list-formats</code> to see the available output formats.
					</p></dd><dt><span class="term"><code class="option">--list</code>, </span><span class="term"><code class="option">-l</code></span></dt><dd><p>
						list all the events in the song, in text form.
					</p></dd><dt><span class="term"><code class="option">--list-instruments</code>, </span><span class="term"><code class="option">-i</code></span></dt><dd><p>
						list all the instruments used in the song, in text form.
					</p></dd><dt><span class="term"><code class="option">--metadata</code>, </span><span class="term"><code class="option">-m</code></span></dt><dd><p>
						list any metadata/tags in the file.
					</p></dd><dt><span class="term"><code class="option">--newinst</code>=<em class="replaceable"><code>format</code></em>:<em class="replaceable"><code>file</code></em>, </span><span class="term"><code class="option">-n </code><em class="replaceable"><code>format</code></em>:<em class="replaceable"><code>file</code></em></span></dt><dd><p>
						use a different instrument bank for subsequent conversions with
						<code class="option">--convert</code>.
					</p></dd><dt><span class="term"><code class="option">--play</code>, </span><span class="term"><code class="option">-p</code></span></dt><dd><p>
						play the song.
					</p></dd><dt><span class="term"><code class="option">--remap-tracks</code>=<em class="replaceable"><code>index</code></em>=<em class="replaceable"><code>target</code></em>, </span><span class="term"><code class="option">-k </code><em class="replaceable"><code>index</code></em>=<em class="replaceable"><code>target</code></em></span></dt><dd><p>
						change the channel assignment for a given track.  Use
						<code class="option">--list-instruments</code> to see the current channel
						assignment for a song.
					</p><p>
						Generally speaking, only one note can be played on each channel
						at a time.  MIDI is the only exception to this, but MIDI can
						still only support one instrument on each channel at a time.
					</p><p><em class="replaceable"><code>index</code></em> is the zero-based track number
						to modify, and <em class="replaceable"><code>target</code></em> is the new type
						and channel to assign.  A <em class="replaceable"><code>target</code></em> of
						<code class="computeroutput">m0</code> means to use MIDI channel 0.
						Channel types are:
					</p><div class="variablelist"><dl class="variablelist"><dt><span class="term"><code class="option">m0</code>..<code class="option">m15</code></span></dt><dd><p>
									MIDI channels 0 to 15.  MIDI normally uses numbers 1..16 with
									percussion on 10, but since this number is zero-based, the
									channels are 0..15 with percussion on channel 9.
								</p></dd><dt><span class="term"><code class="option">p0</code>..<code class="option">p255</code></span></dt><dd><p>
									PCM channel.  Maximum value depends on the file format.  For
									some file formats (e.g. .mod) this can affect the panning.
								</p></dd><dt><span class="term"><code class="option">o0</code>..<code class="option">o8</code></span></dt><dd><p>
									OPL/FM melodic channels 0 through 8.
								</p><p>
									Note that OPL percussion mode uses channels 6, 7 and 8, so it
									is not valid for a song to have events on these channels while
									percussive events are present.  This may happen temporarily
									during a format conversion, but this state must be resolved by
									the time the song is written out to a file.
								</p></dd><dt><span class="term"><code class="option">r0</code>..<code class="option">r4</code></span></dt><dd><p>
									OPL/FM percussive/rhythm. 0 = hi-hat, 1 = top cymbal, 2 = tom
									tom, 3 = snare drum, 4 = bass drum.
								</p></dd><dt><span class="term"><code class="option">-</code></span></dt><dd><p>
									Unused channel.  This will drop all events (including tempo
									events!) from this channel.
								</p></dd><dt><span class="term"><code class="option">*0</code>..<code class="option">*255</code></span></dt><dd><p>
									Any device.  Only used internally.  Songs cannot be written
									to a file if they contain an 'any' track type.  Only one note
									at a time can be played on each 'any' track.
								</p></dd></dl></div><p>
						This option can be specified multiple times and the change only
						applies to actions specified after it on the command line.
					</p></dd><dt><span class="term"><code class="option">--repeat-instruments</code>=<em class="replaceable"><code>count</code></em>, </span><span class="term"><code class="option">-r </code><em class="replaceable"><code>count</code></em></span></dt><dd><p>
						repeat the instrument bank until there are
						<em class="replaceable"><code>count</code></em> instruments available.  This is
						useful when replacing instruments, but there are not enough of them
						in the newly loaded bank.
					</p></dd><dt><span class="term"><code class="option">--tag-title</code>=<em class="replaceable"><code>text</code></em></span></dt><dd><p>
						Set the title to use for the next file written with
						<code class="option">--convert</code>.  The title is silently ignored for
						formats that do not support metadata.
					</p></dd><dt><span class="term"><code class="option">--tag-artist</code>=<em class="replaceable"><code>text</code></em></span></dt><dd><p>
						Set the artist to use for the next file written with
						<code class="option">--convert</code>.  The artist is silently ignored for
						formats that do not support metadata, or have no place to store
						the artist name.
					</p></dd><dt><span class="term"><code class="option">--tag-comment</code>=<em class="replaceable"><code>text</code></em></span></dt><dd><p>
						Set a comment to use for the next file written with
						<code class="option">--convert</code>.  The comment is silently ignored for
						formats that do not support metadata, or have no place to store a
						comment.
					</p></dd><dt><span class="term"><code class="option">--tempo</code>=<em class="replaceable"><code>us_per_tick</code></em>:<em class="replaceable"><code>ticks_per_beat</code></em>,<em class="replaceable"><code>frames_per_tick</code></em>,<em class="replaceable"><code>time_signature</code></em></span></dt><dd><p>
						change the playback speed of the song.  Events occur after a number
						of "ticks" on a clock, and the tempo controls how fast this clock
						runs.  The faster this clock, the faster it ticks and so the
						faster events play, even though they remain the same number of ticks
						apart.
					</p><p>
						A tick is the finest grain of timing in a song.  It is not possible
						to play events after half a tick, events can only be played after
						a whole number of ticks.  For this reason there are usually many
						ticks for each musical beat, to allow for notes to be played before
						or after the beat, and to allow notes to be shorter in length than
						a whole beat.
					</p><div class="variablelist"><dl class="variablelist"><dt><span class="term"><em class="replaceable"><code>us_per_tick</code></em></span></dt><dd><p>
									The number of microseconds per tick.  A value of 250000 is
									the default and will result in four ticks every second, or
									240 ticks per minute.
								</p><p>
									If there is one tick per beat then this will be 240 BPM (beats
									per minute) and notes will only be able to be played at each
									beat.  If instead there are two ticks per beat then this will
									be 120 BPM, and notes will be able to be played both on the
									beat and also exactly in the middle between beats.
								</p></dd><dt><span class="term"><em class="replaceable"><code>ticks_per_beat</code></em></span></dt><dd><p>
									The number of ticks in each musical beat.  If this value is 1,
									then only one note can be played per beat, and it will always
									be at least one beat in length, making every note a semibreve
									(whole note) or longer.  A value of 2 will allow up to two
									notes to be played per beat, meaning the shortest note will be
									a minim (half note).  4 will allow for crotchets (quarter
									notes) and so on.
								</p><p>
									This value is typically only used to assist with placing notes
									into a musical staff, so many formats do not make use of this
									value as it does not affect the song speed.  MIDI is one
									format that uses it.
								</p></dd><dt><span class="term"><em class="replaceable"><code>frames_per_tick</code></em></span></dt><dd><p>
									The number of audio frames in each tick.  This is only
									relevant for some tracker formats that offer retrigger
									effects, where a sample is played from the beginning
									repeatedly within the space of one tick to the next.  This
									value indicates how many repeats will happen.  A value of 2
									means the retriggered note will play twice - once at the tick
									and again half way between ticks.  The default value used by
									most trackers is 6, with the value usually being ignored by
									other formats.
								</p></dd><dt><span class="term"><em class="replaceable"><code>time_signature</code></em></span></dt><dd><p>
									Two numbers separated by a slash, such as
									<code class="option">3/4</code>.  This is only used to assist with
									placing notes on a musical staff, so MIDI is currently the
									only format that makes use of it.
								</p></dd></dl></div></dd><dt><span class="term"><code class="option">--wav</code>=<em class="replaceable"><code>filename</code></em>, </span><span class="term"><code class="option">-w </code><em class="replaceable"><code>filename</code></em></span></dt><dd><p>
						convert the song to PCM and save it as a .wav file with the given
						name.  This uses the same rendering process as <code class="option">--play</code>.
					</p></dd></dl></div></div><div class="refsect1"><a id="options"></a><h2>Options</h2><div class="variablelist"><dl class="variablelist"><dt><span class="term"><code class="option">--list-types</code></span></dt><dd><p>
						show a list of supported file formats, along with the value to pass
						to <code class="option">--type</code>, <code class="option">--convert</code> and
						<code class="option">--newinst</code>.
					</p></dd><dt><span class="term"><code class="option">--force</code>, </span><span class="term"><code class="option">-f</code></span></dt><dd><p>
						open the file as the given <code class="option">--type</code>, even if it
						doesn't look like it's in that format.
					</p></dd><dt><span class="term"><code class="option">--force-opl2</code>, </span><span class="term"><code class="option">-2</code></span></dt><dd><p>
						force OPL2 mode (11 channels) when writing FM songs with
						<code class="option">--convert</code>.  This drops events that enable OPL3
						mode.
					</p></dd><dt><span class="term"><code class="option">--force-opl3</code>, </span><span class="term"><code class="option">-3</code></span></dt><dd><p>
						force OPL3 mode (18 channels) when writing FM songs with
						<code class="option">--convert</code>.  This duplicates certain events so they
						apply to both register sets, and drops events that disable OPL3
						mode.  This may fail if the file format does not support OPL3 chips.
					</p></dd><dt><span class="term"><code class="option">--midibank</code>=<em class="replaceable"><code>filename</code></em>, </span><span class="term"><code class="option">-b </code><em class="replaceable"><code>filename</code></em></span></dt><dd><p>
						instrument bank to use for playing MIDI events with
						<code class="option">--play</code> or rendering with <code class="option">--wav</code>.
						Without this option, MIDI notes will be silent.
					</p><p>
						Any file supported (see <code class="option">--list-types</code>) can be used
						as a MIDI bank.  The file should have 128 instruments or some notes
						may be silent, if they are played with a MIDI patch that is not
						supplied.
					</p><p>
						Both OPL and PCM instruments are supported (separately or at the
						same time).
					</p></dd><dt><span class="term"><code class="option">--no-pitchbends</code>, </span><span class="term"><code class="option">-n</code></span></dt><dd><p>
						don't use pitchbends with <code class="option">--convert</code>.  This can make
						the output notes a bit cleaner if the song doesn't use any
						pitchbends.
					</p></dd><dt><span class="term"><code class="option">--script</code>, </span><span class="term"><code class="option">-s</code></span></dt><dd><p>
						print output suitable for parsing by a script.
					</p></dd><dt><span class="term"><code class="option">--type</code>=<em class="replaceable"><code>format</code></em>, </span><span class="term"><code class="option">-t </code><em class="replaceable"><code>format</code></em></span></dt><dd><p>
						manually specify the file type.  The type is normally autodetected,
						but it needs to be specified for a few formats which lack signatures
						to identify them by.  See <code class="option">--list-types</code>.
					</p></dd></dl></div></div><div class="refsect1"><a id="examples"></a><h2>Examples</h2><div class="variablelist"><dl class="variablelist"><dt><span class="term"><span class="command"><strong>gamemus song_5.kb1 --list</strong></span></span></dt><dd><p>
						list all the note on/off and other events in the
						<span class="productname">Kiloblaster</span> theme song.
					</p></dd><dt><span class="term"><span class="command"><strong>gamemus --type imf-idsoftware-duke2 hesbacka.imf -c cmf-creativelabs:out.cmf</strong></span></span></dt><dd><p>
						convert the <span class="productname">Duke Nukem II</span> song
						<code class="literal">hesbacka.imf</code> into a CMF file saved as
						<code class="literal">out.cmf</code>.  Because both IMF and CMF formats use
						Ad Lib/FM instruments, the instruments are converted as-is, with no
						replacement instrument bank required.
						<span class="productname">Duke Nukem II</span> however, plays its IMF
						songs at a different speed to the normal format, so the
						<code class="literal">imf-idsoftware-duke2</code> file type must be manually
						specified to get the correct tempo.
					</p></dd><dt><span class="term"><span class="command"><strong>gamemus capture.dro -n gm.mid -c mid-type0:out.mid</strong></span></span></dt><dd><p>
						convert the <span class="productname">DOSBox</span> Ad Lib capture
						<code class="literal">capture.dro</code> into a MIDI file called
						<code class="literal">out.mid</code>, using the instruments loaded from
						<code class="literal">gm.mid</code>.
					</p><p>
						Replacing the instruments is required here, because MIDI files
						cannot use Ad Lib instruments.  The first instrument encountered in
						<code class="literal">capture.dro</code> is replaced with the first instrument
						used in <code class="literal">gm.mid</code> (which may
						<span class="emphasis"><em>not necessarily</em></span> be MIDI instrument #1/piano.)
					</p></dd></dl></div></div><div class="refsect1"><a id="errors"></a><h2>Errors</h2><div class="variablelist"><dl class="variablelist"><dt><span class="term"><code class="computeroutput">decode-opl: Invalid OPL channel 15</code></span></dt><dd><p>
						The OPL chip only has nine melodic channels per register set,
						numbered from 0 to 8 inclusive.  However the channel is specified
						in a 4-bit field, allowing values from 0 to 15.  There are no
						registers for channels 9 through 15, but it's still possible for
						a game to try to write to these registers.  Doing so has no effect,
						and typically is a bug in the game's music player.  Since the OPL
						chip ignores these events, the library also ignores them, but it
						displays this warning message to inform you that some data has been
						discarded.
					</p><p>
						Note that although the OPL3 has 18 channels, they are arranged in
						two separate sets of nine channels, so this error can still appear
						even for OPL3 songs.  It does not mean that there is OPL3 data
						that is being discarded.  Since the OPL3 has two register sets, it
						is possible to write to 32 different channels, even though only 18
						of them are valid.  The only valid channels for an OPL3 chip are
						0 to 8 inclusive in register set A, and 0 to 8 inclusive in register
						set B (18 channels total).  Channels 9 through 15 can be written to
						in both register sets, all of which are invalid and will generate
						this warning.  This is why the error will always show a channel
						number between 9 and 15, whether in OPL2 or OPL3 mode.
					</p></dd><dt><span class="term"><code class="computeroutput">decode-opl: Bad OPL note-on register/channel 0xF</code></span></dt><dd><p>
						Like the <code class="computeroutput">Invalid OPL channel</code>
						error, this one indicates the song actually tried to play a note
						on one of the non-existent channels.  If you see this error it
						might be worth investigating, as there could be a hidden part to
						the song that has never been heard.  This error appears for every
						attempt to play a note on a channel that is not present, so the
						more messages are seen, the more notes are going unheard.
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
			Report bugs at <a class="ulink" href="https://github.com/Malvineous/libgamemusic/issues" target="_top">https://github.com/Malvineous/libgamemusic/issues</a></p><p>
			Ask questions about Camoto or modding in general at the <a class="ulink" href="http://www.classicdosgames.com/forum/viewforum.php?f=25" target="_top">RGB
			Classic Games modding forum</a></p></div><div class="refsect1"><a id="copyright"></a><h2>Copyright</h2><p>
			Copyright (c) 2010-2012 Adam Nielsen.
		</p><p>
			License GPLv3+: <a class="ulink" href="http://gnu.org/licenses/gpl.html" target="_top">GNU GPL
			version 3 or later</a></p><p>
			This is free software: you are free to change and redistribute it.
			There is NO WARRANTY, to the extent permitted by law.
		</p></div><div class="refsect1"><a id="seealso"></a><h2>See Also</h2><span class="simplelist"><a class="citerefentry" href="../manpage-dro2txt"><span class="citerefentry"><span class="refentrytitle">dro2txt</span>(1)</span></a>, <a class="citerefentry" href="../manpage-gamearch"><span class="citerefentry"><span class="refentrytitle">gamearch</span>(1)</span></a>, <a class="citerefentry" href="../manpage-gamecomp"><span class="citerefentry"><span class="refentrytitle">gamecomp</span>(1)</span></a>, <a class="citerefentry" href="../manpage-gameimg"><span class="citerefentry"><span class="refentrytitle">gameimg</span>(1)</span></a>, <a class="citerefentry" href="../manpage-gametls"><span class="citerefentry"><span class="refentrytitle">gametls</span>(1)</span></a>, <a class="citerefentry" href="../manpage-gamemap"><span class="citerefentry"><span class="refentrytitle">gamemap</span>(1)</span></a>, <a class="citerefentry" href="../manpage-camoto-studio"><span class="citerefentry"><span class="refentrytitle">camoto-studio</span>(1)</span></a></span></div></div></body></html>

<HTML>
<head><title>Network shims</title></head>
<BODY>

<H1>Network Shims</H1>

On this page you will find a collection of shims for converting among various network layers/stacks.  These have proven to be quite difficult to track down, so hopefully by
placing them all here it will help others who may be looking for them.
<P>
I should point out that in most cases I have no idea where these came from and even less of an understanding of how they all work, so there is probably a lot of inaccurate/incomplete
information here - but if you find any mistakes or missing information then please send me corrections so I can update this page.
<P>
All these shims are DOS based, and in most cases they are .COM files (except the NDIS shims which are mostly .DOS files.)  They are organised by the protocol they provide, so under the IPX heading you will find various shims all providing
the IPX protocol once loaded.

<P>
You can use the following links to jump to a particular section of this page.
<P>
&quot;I want to end up with this protocol:&quot;
<UL>
<LI><A HREF="#shimIPX">IPX</A>
<LI><A HREF="#shimPD">Packet Driver (PD)</A>
<LI><A HREF="#shimNDIS">NDIS</A>
<LI><A HREF="#shimODI">ODI</A>
</UL>

<HR>


<!-- ///////////////// IPX \\\\\\\\\\\\\\\\\\ -->
<A NAME="shimIPX"></A>
<H2>IPX</H2>

<!-- Begin PDIPX -->
<TABLE CELLSPACING=0 CELLPADDING=5 BORDER=0 CLASS="clEntry">
<TR><TD CLASS="one">

<TABLE CELLSPACING=2 CELLPADDING=2 CLASS="wikitable" WIDTH=300>
<TR><TD CLASS="one">Name:</TD><TD>PDIPX</TD></TR>
<TR><TD CLASS="one">Parent&nbsp;protocol:</TD><TD><A HREF="#shimPD">Packet driver</A></TD></TR>
<TR><TD CLASS="one">Provides:</TD><TD>IPX</TD></TR>
<TR><TD CLASS="one">Mem usage:</TD><TD>18,400 bytes</TD></TR>
<TR><TD CLASS="one">Loads high?</TD><TD>Yes</TD></TR>
<TR><TD CLASS="one">Download:</TD><TD><A HREF="http://files.shikadi.net/malv/files/network/pd2ipx/pdipx.zip">pdipx.zip</A>&nbsp;(38kB)</TD></TR>
</TABLE>

</TD><TD VALIGN=TOP>

<H3>PD to IPX</H3>
PDIPX provides IPX services when a packet driver interface is available.  Apparently there are some issues using Novell networking with this IPX driver, however I have not had the chance
to fully test this.  Reports welcome!
<P>
There are two versions of the driver included in this package - PDIPX1 uses an extra 16 bytes of memory and appears to have a newer packet driver (v1.03 dated 1992/09/28) whereas
PDIPX2's packet driver is v1.02 (dated 1992/04/03)

</TD></TR>
</TABLE>
<!-- End PDIPX -->
<!-- \\\\\\\\\\\\\\\\\ IPX ////////////////// -->

<!-- ////////////////// PD \\\\\\\\\\\\\\\\\\ -->
<A NAME="shimPD"></A>
<H2>Packet Driver (PD)</H2>

<!-- Begin IPXPKT -->
<TABLE CELLSPACING=0 CELLPADDING=5 BORDER=0 CLASS="clEntry">
<TR><TD CLASS="one">

<TABLE CELLSPACING=2 CELLPADDING=2 CLASS="wikitable" WIDTH=300>
<TR><TD CLASS="one">Name:</TD><TD>IPXPKT</TD></TR>
<TR><TD CLASS="one">Parent&nbsp;protocol:</TD><TD><A HREF="#shimIPX">IPX</A></TD></TR>
<TR><TD CLASS="one">Provides:</TD><TD>Packet (PD)</TD></TR>
<TR><TD CLASS="one">Mem usage:</TD><TD>?</TD></TR>
<TR><TD CLASS="one">Loads high?</TD><TD>Untested</TD></TR>
<TR><TD CLASS="one">Download:</TD><TD><A HREF="http://files.shikadi.net/malv/files/network/ipx2pd/ipxpkt.com">ipxpkt.com</A>&nbsp;(14kB)</TD></TR>
</TABLE>

</TD><TD VALIGN=TOP>

<H3>IPX to PD</H3>
Untested: IPXPKT should provide a Packet Driver interface when an IPX interface is available.

</TD></TR>
</TABLE>
<!-- End IPXPKT -->

<!-- Begin DIS_PKT -->
<TABLE CELLSPACING=0 CELLPADDING=5 BORDER=0 CLASS="clEntry">
<TR><TD CLASS="one">

<TABLE CELLSPACING=2 CELLPADDING=2 CLASS="wikitable" WIDTH=300>
<TR><TD CLASS="one">Name:</TD><TD>DIS_PKT</TD></TR>
<TR><TD CLASS="one">Parent&nbsp;protocol:</TD><TD><A HREF="#shimNDIS">NDIS</A></TD></TR>
<TR><TD CLASS="one">Provides:</TD><TD>Packet (PD)</TD></TR>
<TR><TD CLASS="one">Mem usage:</TD><TD>?</TD></TR>
<TR><TD CLASS="one">Loads high?</TD><TD>Untested</TD></TR>
<TR><TD CLASS="one">Download:</TD><TD><A HREF="http://files.shikadi.net/malv/files/network/ndis2pd/dis_pkt9.zip">dis_pkt9.zip</A>&nbsp;(30kB)</TD></TR>
<TR><TD CLASS="one">&nbsp;</TD><TD><A HREF="http://files.shikadi.net/malv/files/network/ndis2pd/dis_pkt11.zip">dis_pkt11.zip</A>&nbsp;(24kB)</TD></TR>
</TABLE>

</TD><TD VALIGN=TOP>

<H3>NDIS to PD</H3>
Untested: DIS_PKT provides Packet services when an NDIS interface is available.  NDIS is usually provided by a LANMan setup (think PROTOCOL.INI)
<P>
Two versions of this shim are available - one that provides a v1.09 packet interface (dis_pkt9.zip) and one that provides v1.11 (dis_pkt11.zip)

</TD></TR>
</TABLE>
<!-- End DIS_PKT -->

<!-- Begin ODIPKT -->
<TABLE CELLSPACING=0 CELLPADDING=5 BORDER=0 CLASS="clEntry">
<TR><TD CLASS="one">

<TABLE CELLSPACING=2 CELLPADDING=2 CLASS="wikitable" WIDTH=300>
<TR><TD CLASS="one">Name:</TD><TD>ODIPKT</TD></TR>
<TR><TD CLASS="one">Parent&nbsp;protocol:</TD><TD><A HREF="#shimODI">ODI</A></TD></TR>
<TR><TD CLASS="one">Provides:</TD><TD>Packet (PD)</TD></TR>
<TR><TD CLASS="one">Mem usage:</TD><TD>?</TD></TR>
<TR><TD CLASS="one">Loads high?</TD><TD>Untested</TD></TR>
<TR><TD CLASS="one">Download:</TD><TD><A HREF="http://files.shikadi.net/malv/files/network/odi2pd/odipkt.zip">odipkt.zip</A>&nbsp;(25kB)</TD></TR>
</TABLE>

</TD><TD VALIGN=TOP>

<H3>ODI to PD</H3>
Untested: Provides Packet services when an ODI interface is available (think LSL.COM)

</TD></TR>
</TABLE>
<!-- End ODIPKT -->

<!-- Begin UNDIPD -->
<TABLE CELLSPACING=0 CELLPADDING=5 BORDER=0 CLASS="clEntry">
<TR><TD CLASS="one">

<TABLE CELLSPACING=2 CELLPADDING=2 CLASS="wikitable" WIDTH=300>
<TR><TD CLASS="one">Name:</TD><TD>UNDIPD</TD></TR>
<TR><TD CLASS="one">Parent&nbsp;protocol:</TD><TD><A HREF="#shimUNDI">UNDI/PXE</A></TD></TR>
<TR><TD CLASS="one">Provides:</TD><TD>Packet (PD)</TD></TR>
<TR><TD CLASS="one">Mem usage:</TD><TD>4,768 bytes</TD></TR>
<TR><TD CLASS="one">Loads high?</TD><TD>Yes</TD></TR>
<TR><TD CLASS="one">Download:</TD><TD><A HREF="http://files.shikadi.net/malv/files/network/undi2pd/undipd.com">undipd.com</A>&nbsp;(9.5kB)</TD></TR>
</TABLE>

</TD><TD VALIGN=TOP>

<H3>UNDI to PD</H3>
UNDIPD provides Packet services when an UNDI interface is available - which is most commonly when the PC has booted over the network via PXE.  In this case the UNDI interface is loaded
from the network card's boot ROM so this is essentially a device-independent Packet Driver.

</TD></TR>
</TABLE>
<!-- End UNDIPD -->
<!-- \\\\\\\\\\\\\\\\\\ PD ////////////////// -->

<!-- ///////////////// NDIS \\\\\\\\\\\\\\\\\ -->
<A NAME="shimNDIS"></A>
<H2>NDIS</H2>

<!-- Begin NDIS.DOS -->
<TABLE CELLSPACING=0 CELLPADDING=5 BORDER=0 CLASS="clEntry">
<TR><TD CLASS="one">

<TABLE CELLSPACING=2 CELLPADDING=2 CLASS="wikitable" WIDTH=300>
<TR><TD CLASS="one">Name:</TD><TD>NDIS.DOS</TD></TR>
<TR><TD CLASS="one">Parent&nbsp;protocol:</TD><TD><A HREF="#shimUNDI">UNDI/PXE</A></TD></TR>
<TR><TD CLASS="one">Provides:</TD><TD>NDIS</TD></TR>
<TR><TD CLASS="one">Mem usage:</TD><TD>? kB</TD></TR>
<TR><TD CLASS="one">Loads high?</TD><TD>Untested</TD></TR>
<TR><TD CLASS="one">Download:</TD><TD><A HREF="http://files.shikadi.net/malv/files/network/undi2ndis/ndis.dos">ndis.dos</A>&nbsp;(27kB)</TD></TR>
</TABLE>

</TD><TD VALIGN=TOP>

<H3>Intel's Universal NDIS Driver</H3>
NDIS.DOS provides NDIS services from an UNDI/PXE stack.  Useful for getting NDIS support when booting over a network.  In some cases more compatible than 3Com's equivalent below.

</TD></TR>
</TABLE>
<!-- End NDIS.DOS -->

<!-- Begin UNDIS3C.DOS -->
<TABLE CELLSPACING=0 CELLPADDING=5 BORDER=0 CLASS="clEntry">
<TR><TD CLASS="one">

<TABLE CELLSPACING=2 CELLPADDING=2 CLASS="wikitable" WIDTH=300>
<TR><TD CLASS="one">Name:</TD><TD>UNDIS3C.DOS</TD></TR>
<TR><TD CLASS="one">Parent&nbsp;protocol:</TD><TD><A HREF="#shimUNDI">UNDI/PXE</A></TD></TR>
<TR><TD CLASS="one">Provides:</TD><TD>NDIS</TD></TR>
<TR><TD CLASS="one">Mem usage:</TD><TD>? kB</TD></TR>
<TR><TD CLASS="one">Loads high?</TD><TD>Untested</TD></TR>
<TR><TD CLASS="one">Download:</TD><TD><A HREF="http://files.shikadi.net/malv/files/network/undi2ndis/undis3c.dos">undis3c.dos</A>&nbsp;(32kB)</TD></TR>
</TABLE>

</TD><TD VALIGN=TOP>

<H3>3Com's Universal NDIS Driver</H3>
UNDIS3C.DOS provides NDIS services from an UNDI/PXE stack.  Useful for getting NDIS support when booting over a network.

</TD></TR>
</TABLE>
<!-- End UNDIS3C.DOS -->

<!-- Begin NVNDIS2.DOS -->
<TABLE CELLSPACING=0 CELLPADDING=5 BORDER=0 CLASS="clEntry">
<TR><TD CLASS="one">

<TABLE CELLSPACING=2 CELLPADDING=2 CLASS="wikitable" WIDTH=300>
<TR><TD CLASS="one">Name:</TD><TD>NVNDIS2.DOS</TD></TR>
<TR><TD CLASS="one">Parent&nbsp;protocol:</TD><TD><A HREF="#shimUNDI">UNDI/PXE</A></TD></TR>
<TR><TD CLASS="one">Provides:</TD><TD>NDIS</TD></TR>
<TR><TD CLASS="one">Mem usage:</TD><TD>? kB</TD></TR>
<TR><TD CLASS="one">Loads high?</TD><TD>Untested</TD></TR>
<TR><TD CLASS="one">Download:</TD><TD><A HREF="http://files.shikadi.net/malv/files/network/undi2ndis/nvndis2.dos">nvndis2.dos</A>&nbsp;(28kB)</TD></TR>
</TABLE>

</TD><TD VALIGN=TOP>

<H3>nVidia NDIS Driver</H3>
Untested:  Not sure if this is universal or for nVidia onboard network cards only.  Does mention UNDI so it could be universal.  Reports welcome!

</TD></TR>
</TABLE>
<!-- End NVNDIS2.DOS -->

<!-- Begin ODINSUP -->
<TABLE CELLSPACING=0 CELLPADDING=5 BORDER=0 CLASS="clEntry">
<TR><TD CLASS="one">

<TABLE CELLSPACING=2 CELLPADDING=2 CLASS="wikitable" WIDTH=300>
<TR><TD CLASS="one">Name:</TD><TD>ODINSUP</TD></TR>
<TR><TD CLASS="one">Parent&nbsp;protocol:</TD><TD><A HREF="#shimODI">ODI</A></TD></TR>
<TR><TD CLASS="one">Provides:</TD><TD>NDIS</TD></TR>
<TR><TD CLASS="one">Mem usage:</TD><TD>? kB</TD></TR>
<TR><TD CLASS="one">Loads high?</TD><TD>Untested</TD></TR>
<TR><TD CLASS="one">Download:</TD><TD><A HREF="http://files.shikadi.net/malv/files/network/odi2ndis/odinsup.zip">odinsup.zip</A>&nbsp;(26kB)</TD></TR>
</TABLE>

</TD><TD VALIGN=TOP>

<H3>ODINSUP</H3>
Untested:  Provides NDIS services from an existing ODI interface.

</TD></TR>
</TABLE>
<!-- End ODINSUP -->
<!-- \\\\\\\\\\\\\\\\\ NDIS ///////////////// -->

<!-- ///////////////// ODI \\\\\\\\\\\\\\\\\\ -->
<A NAME="shimODI"></A>
<H2>ODI</H2>

<!-- Begin PDEther -->
<TABLE CELLSPACING=0 CELLPADDING=5 BORDER=0 CLASS="clEntry">
<TR><TD CLASS="one">

<TABLE CELLSPACING=2 CELLPADDING=2 CLASS="wikitable" WIDTH=300>
<TR><TD CLASS="one">Name:</TD><TD>PDEther</TD></TR>
<TR><TD CLASS="one">Parent&nbsp;protocol:</TD><TD><A HREF="#shimPD">Packet driver</A></TD></TR>
<TR><TD CLASS="one">Provides:</TD><TD>ODI</TD></TR>
<TR><TD CLASS="one">Mem usage:</TD><TD>2,912 bytes</TD></TR>
<TR><TD CLASS="one">Loads high?</TD><TD>Yes *</TD></TR>
<TR><TD CLASS="one">Download:</TD><TD><A HREF="http://files.shikadi.net/malv/files/network/pd2odi/pdether.zip">pdether.zip</A>&nbsp;(28kB)</TD></TR>
</TABLE>

</TD><TD VALIGN=TOP>

<H3>PD to ODI</H3>
PDEther provides an ODI interface when a packet driver interface is available.
<P>
<SMALL>* It appears that this driver will only load into high memory if LSL.COM is *not* loaded high.  Since LSL.COM uses 12kB of memory it's probably better to have that loaded high and lose 2kB of
conventional memory rather than the other way around.</SMALL>
</TD></TR>
</TABLE>
<!-- End PDEther -->
<!-- \\\\\\\\\\\\\\\\\ ODI ////////////////// -->

<!-- ///////////////// UNDI \\\\\\\\\\\\\\\\\ -->
<A NAME="shimUNDI"></A>
<H2>UNDI</H2>

I am not aware of any shims providing UNDI support at present, however I doubt this is necessary.  If your NIC supports PXE booting then you can use PXELinux combined with MemDisk to boot
to DOS with the UNDI layer still available, and if your NIC doesn't support PXE you can use an Etherboot floppy to provide it.

<!-- \\\\\\\\\\\\\\\\\ UNDI ///////////////// -->





<CENTER>

<!-- Start of StatCounter Code -->
<!-- <script type="text/javascript" language="javascript">
var sc_project=518033; 
var sc_partition=3; 
</script>

<script type="text/javascript" language="javascript" src="http://www.statcounter.com/counter/counter.js"></script>
<noscript>
<a href="http://www.statcounter.com/" target="_blank"> -->
<img src="http://c4.statcounter.com/counter.php?sc_project=518033&java=0" alt="Counter" border="0" WIDTH=68 HEIGHT=16>
<!-- </a>
</noscript> -->
<!-- End of StatCounter Code -->
<BR>
<SMALL><A HREF="mailto:malvineous@shikadi.net">malvineous@shikadi.net</A></SMALL>
</CENTER>
</BODY>
</HTML>

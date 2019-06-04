<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:output method="html"/> 

<xsl:template match="/">
<html>
<head>
<style type="text/css">
 .tg {font-family:Arial;font-size:14px;border-collapse:collapse;border-spacing:0;border-color:#aabcfe;background-color:#e8edff;}
 .tg td{padding:10px 5px;border-style:solid;border-width:1px;border-color:#aabcfe;color:#669;background-color:#e8edff;}
 .tg th{font-weight:bold;padding:10px 5px;border-style:solid;border-width:1px;border-color:#aabcfe;color:#039;background-color:#b9c9fe;}
</style>
</head>

<body>
<h1> Podział zwierząt na klatki: </h1>
<h3> Drapiezne: </h3>
<table class="tg">
	<tr>
		<th>Nr klatki</th>
		<th>Imię</th>
		<th>Gatunek</th>
		<th>Płeć</th>
		<th>Opiekun</th>
	</tr>

	<xsl:for-each select="//drapiezne/zwierze">
	<xsl:variable name="opiekun" select="@id_opiekuna"/>
	<tr>
		<td><xsl:value-of select="@numer_klatki"/></td>
		<td><xsl:value-of select="imie"/></td>
		<td><xsl:value-of select="gatunek"/></td>
		<td><xsl:value-of select="plec"/></td>
		<td><xsl:apply-templates select="//opiekunowie/opiekun[@id_opiekuna=$opiekun]"/></td>
	</tr>
	</xsl:for-each>
</table>

<h3> Naczelne: </h3>
<table class="tg">
	<tr>
		<th>Nr klatki</th>
		<th>Imię</th>
		<th>Gatunek</th>
		<th>Płeć</th>
		<th>Opiekun</th>
	</tr>

	<xsl:for-each select="//naczelne/zwierze">
	<xsl:variable name="opiekun" select="@id_opiekuna"/>
	<tr>
		<td><xsl:value-of select="@numer_klatki"/></td>
		<td><xsl:value-of select="imie"/></td>
		<td><xsl:value-of select="gatunek"/></td>
		<td><xsl:value-of select="plec"/></td>
		<td><xsl:apply-templates select="//opiekunowie/opiekun[@id_opiekuna=$opiekun]"/></td>
	</tr>
	</xsl:for-each>
</table>

<h3> Kiwi: </h3>
<table class="tg">
	<tr>
		<th>Nr klatki</th>
		<th>Imię</th>
		<th>Gatunek</th>
		<th>Płeć</th>
		<th>Opiekun</th>
	</tr>
	<xsl:for-each select="//kiwi/zwierze">
	<xsl:variable name="opiekun" select="@id_opiekuna"/>
	<tr>
		<td><xsl:value-of select="@numer_klatki"/></td>
		<td><xsl:value-of select="imie"/></td>
		<td><xsl:value-of select="gatunek"/></td>
		<td><xsl:value-of select="plec"/></td>
		<td><xsl:apply-templates select="//opiekunowie/opiekun[@id_opiekuna=$opiekun]"/></td>
	</tr>
	</xsl:for-each>
</table>

<h3> Pingwiny: </h3>
<table class="tg">
	<tr>
		<th>Nr klatki</th>
		<th>Imię</th>
		<th>Gatunek</th>
		<th>Płeć</th>
		<th>Opiekun</th>
	</tr>
	<xsl:for-each select="//pingwiny/zwierze">
	<xsl:variable name="opiekun" select="@id_opiekuna"/>
	<tr>
		<td><xsl:value-of select="@numer_klatki"/></td>
		<td><xsl:value-of select="imie"/></td>
		<td><xsl:value-of select="gatunek"/></td>
		<td><xsl:value-of select="plec"/></td>
		<td><xsl:apply-templates select="//opiekunowie/opiekun[@id_opiekuna=$opiekun]"/></td>
	</tr>
	</xsl:for-each>
</table>

<h2> Najcięższe zwierzaki: (powyżej 100 kg)</h2>
<ol>
	<xsl:for-each select="//zwierze">
		<xsl:sort select="masa" order="descending"/>
		<xsl:if test="masa[@jednostka='kg'] and masa &gt; 100">
			<xsl:apply-templates select="."/>
			<br />
		</xsl:if>
	</xsl:for-each>
</ol>
</body>
</html>
</xsl:template>

<xsl:template match="//opiekunowie/opiekun[@id_opiekuna=$opiekun]">
	<xsl:value-of select="./imie"/>
	<xsl:text> </xsl:text>
	<xsl:value-of select="./nazwisko"/>
</xsl:template>

<xsl:template match="zwierze">
<li>
	<xsl:value-of select="imie"/>
	<xsl:text> - </xsl:text>
	<xsl:value-of select="gatunek"/>
	<xsl:text> (</xsl:text>
	<xsl:value-of select="masa"/>
	<xsl:text> kg)</xsl:text>
</li>
</xsl:template>

</xsl:stylesheet>
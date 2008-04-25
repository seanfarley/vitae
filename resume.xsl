<!DOCTYPE resume [
	<!ENTITY tab '&#160;&#160;&#160;&#160;&#160;'>
	<!ENTITY space '&#160;'>
	<!ENTITY null '&#216;'>
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="resume">
	<html>
		<head>
			<title><xsl:value-of select="//applicant/name"/>'s Resume</title>
			<link rel="stylesheet" type="text/css" href="resume.css"/>
		</head>
		<body>
			<table border="0">
				<xsl:apply-templates />
			</table>
		</body>
	</html>
</xsl:template>

<xsl:template match="applicant">
	<tr>
		<td align="center" colspan="2">
		<span class="name"><xsl:value-of select="name"/></span><br/>
		<span class="header">
			<xsl:value-of select="address/building"/><br/>
			<xsl:value-of select="address/university"/><br/>				
			<xsl:value-of select="address/city"/>, <xsl:value-of select="address/state"/> <xsl:value-of select="address/zip"/><br/>
			<xsl:value-of select="phone"/><br/>
			<xsl:value-of select="email"/><br/>
		</span>
	</td>
	</tr>
</xsl:template>

<xsl:template match="education | experience">
	<tr>
		<td valign="top"><span class="heading"><xsl:value-of select="local-name()" /></span></td>
		<td><xsl:apply-templates /></td>
	</tr>
</xsl:template>

<xsl:template match="courses">
	<tr>
		<td valign="top"><span class="heading"><xsl:value-of select="local-name()" /></span></td>
		<td><table border="0" cellspacing="0"><xsl:apply-templates /></table><br /></td>
	</tr>
</xsl:template>

<xsl:template match="qualifications | awards | extracurricular">
	<tr>
		<td valign="top"><span class="heading"><xsl:value-of select="local-name()" /></span></td>
		<td><ul><xsl:apply-templates /></ul></td>
	</tr>
</xsl:template>

<xsl:template match="institution">
	<div class="title"><xsl:value-of select="name" /></div>
	<div>
		<span><xsl:value-of select="address/city" /></span>,
		<span><xsl:value-of select="address/state" /></span> - 
		<span class="degree"><xsl:value-of select="degree" /></span>, 
		<spane><xsl:value-of select="time" /></spane>
	</div>
	<br />
</xsl:template>

<xsl:template match="course">
	<xsl:variable name="highlight">
		<xsl:if test="@group">highlight</xsl:if>
	</xsl:variable>
	<tr class="{$highlight}">
		<td>
			<xsl:choose>
				<xsl:when test="@dept"><xsl:value-of select="@dept" /></xsl:when>
				<xsl:otherwise>Math</xsl:otherwise>
			</xsl:choose>
		</td>
		<td><xsl:value-of select="@number" /></td>
		<td>&tab;</td>
		<td><xsl:value-of select="." /></td>
	</tr>
</xsl:template>

<xsl:template match="employment">
	<table border="0" width="100%">
		<tr class="title">
			<td colspan="4"><xsl:value-of select="title" /></td>
		</tr>
		<tr class="subtitle">
			<td><xsl:value-of select="employer" />; <xsl:value-of select="address/city" />, <xsl:value-of select="address/state" /></td>
			<td align="right"><xsl:value-of select="time" /></td>
		</tr>
		<tr>
			<td colspan="4"><xsl:value-of select="job" /></td>
		</tr>
	</table>
	<br />
</xsl:template>

<xsl:template match="qualification">
	<li><xsl:apply-templates /></li>
</xsl:template>

<xsl:template match="award">
	<li><xsl:apply-templates /></li>
</xsl:template>

<xsl:template match="activity">
	<li><xsl:apply-templates /></li>
</xsl:template>

</xsl:stylesheet>
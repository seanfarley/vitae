<!DOCTYPE resume [
	<!ENTITY tab '&#160;&#160;&#160;&#160;&#160;'>
	<!ENTITY null '&#216;'>
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<html>
<head>
	<title><xsl:value-of select="//applicant/name"/>'s Resume</title>
	<link rel="stylesheet" type="text/css" href="resume.css"/>
</head>
<body>
	<div style="text-align: center">
	<xsl:for-each select="//applicant">	
		<span class="name"><xsl:value-of select="name"/></span><br/>
		<span class="header">
		<xsl:value-of select="address/street"/><br/>				
		<xsl:value-of select="address/city"/>, <xsl:value-of select="address/state"/> <xsl:value-of select="address/zip"/><br/>
		<xsl:value-of select="phone"/><br/>
		<xsl:value-of select="email"/><br/>
		</span>
	</xsl:for-each>
	</div>

	<br/>

	<div class="title">Objective</div>

	<xsl:for-each select="//objective">
		<div class="section"><xsl:value-of select="."/></div>
	</xsl:for-each>

	<div class="title">Education</div>

	<xsl:for-each select="//education/institution">
		<div style="text-indent: .5in;">
			<span class="degree"><xsl:value-of select="degree"/></span>&tab;
			<span  class="schoolname"><xsl:value-of select="name"/></span>
		<span style="text-align: right" class="schoolname"><xsl:value-of select="time"/></span>	
		</div>
	</xsl:for-each>

	<div class="title">Work Experience</div>

	<xsl:for-each select="//experience/employment">
		<div class="section">
			<span class="degree"><xsl:value-of select="title"/></span>&tab;
			<xsl:value-of select="employer"/>&tab;
			<xsl:value-of select="address/city"/>, <xsl:value-of select="address/state"/>
			
			<div class="section"><xsl:value-of select="job"/></div>
			<span class="time"><xsl:value-of select="time"/></span>
		</div>
	</xsl:for-each>
	
	<div class="title">Skills</div>
	<ul>
	<xsl:for-each select="//qualifications/qualification">
		<div class="section"><xsl:value-of select="."/></div>
	</xsl:for-each>
	</ul>


	<div class="title">Extracurricular Activies</div>

	<xsl:for-each select="//extracurricular/activity">
		<div class="section"><xsl:value-of select="."/></div>
	</xsl:for-each>

</body>
</html>
</xsl:template>


</xsl:stylesheet>
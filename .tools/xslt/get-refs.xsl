<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		version="1.0">

  <xsl:output method="text"/>
  <xsl:template match="/rfc">
    <xsl:apply-templates
	select="descendant::xref[(starts-with(@target, 'RFC') or
		starts-with(@target, 'I-D.') and
		not(preceding::xref/@target = @target))]"/>
  </xsl:template>

<xsl:template match="xref">
  <xsl:text></xsl:text>
  <xsl:value-of select="concat('&lt;!ENTITY ', @target, '  SYSTEM ')"/>
  <xsl:text>"http://xml.resource.org/public/rfc/bibxml</xsl:text>
  <xsl:choose>
    <xsl:when test="starts-with(@target, 'RFC')">
      <xsl:text>/reference.RFC.</xsl:text>
      <xsl:value-of select="substring-after(@target, 'RFC')"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="concat('3/reference.', @target)"/>
    </xsl:otherwise>
  </xsl:choose>
  <xsl:text>.xml"&gt;&#xA;</xsl:text>
</xsl:template>

</xsl:stylesheet>

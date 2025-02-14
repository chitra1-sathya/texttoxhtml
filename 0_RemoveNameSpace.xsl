<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    
   <xsl:template match="/">
       <xsl:text disable-output-escaping="yes">&lt;p&gt;</xsl:text>
       <xsl:apply-templates/>
       <xsl:text disable-output-escaping="yes">&lt;/p&gt;</xsl:text>
   </xsl:template>
    
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>




<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
   <xsl:output method="html"/>
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <!--<xsl:variable name="txt" select="unparsed-text('001 Things That Go Round_Searchwords.txt')"/>
    <xsl:variable name="strlen" select="string-length($txt)"/>-->
    
    <xsl:template match="text()">
        <xsl:element name="p">
            <xsl:attribute name="class">
                <xsl:value-of select="'normal'"/>
            </xsl:attribute>
            <xsl:attribute name="data-name">
                <xsl:value-of select="'normal'"/>
            </xsl:attribute>
        <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>
        
   
</xsl:stylesheet>

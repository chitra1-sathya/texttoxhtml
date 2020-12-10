<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="/">
        <xsl:text disable-output-escaping="yes">&lt;html xmlns="http://www.w3.org/1999/xhtml"&gt;</xsl:text>
        <xsl:text disable-output-escaping="yes">&lt;head xmlns="http://www.w3.org/1999/xhtml"&gt;</xsl:text>
        <xsl:text disable-output-escaping="yes">&lt;meta xmlns="http://www.w3.org/1999/xhtml" http-equiv="Content-Type" content="text/html; charset=UTF-8"&gt;</xsl:text>
        <xsl:text disable-output-escaping="yes">&lt;/meta&gt;</xsl:text>
        <xsl:text disable-output-escaping="yes">&lt;/head&gt;</xsl:text>
        <xsl:text>&#x00A;</xsl:text>
        <xsl:text disable-output-escaping="yes">&lt;body&gt;</xsl:text>
        <xsl:text>&#x00A;</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>&#x00A;</xsl:text>
        <xsl:text disable-output-escaping="yes">&lt;/body&gt;</xsl:text>
        <xsl:text disable-output-escaping="yes">&lt;/html&gt;</xsl:text>
        <xsl:text>&#x00A;</xsl:text>
    </xsl:template>


    <xsl:template match="p">
        <xsl:element name="p">
            <xsl:attribute name="class">
                <xsl:value-of select="'normal'"/>
            </xsl:attribute>
            <xsl:attribute name="data-name">
                <xsl:value-of select="'normal'"/>
            </xsl:attribute>
            <xsl:apply-templates select="@*"/>
        <xsl:apply-templates select="node()"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="text()" name="insertBreaks">
        <xsl:param name="pText" select="."/>
        <xsl:choose>  
            <xsl:when test="not(contains($pText, '&#xA;'))">  
                <xsl:copy-of select="$pText"/>
            </xsl:when>
            <xsl:otherwise>  
                <xsl:value-of select="substring-before($pText, '&#xA;')"/>
                <xsl:choose>
                    <xsl:when test="parent::node()[@data-name='Contents']">
                        <xsl:text disable-output-escaping="yes">&lt;/p&gt;</xsl:text>
                        <xsl:text disable-output-escaping="yes">&lt;p class="break" data-name="break"&gt;</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <!--<xsl:text disable-output-escaping="yes">&lt;br/&gt;</xsl:text>-->
                        <xsl:text disable-output-escaping="yes">&lt;/p&gt;</xsl:text>
                        <xsl:text>&#x00A;</xsl:text>
                        <xsl:text disable-output-escaping="yes">&lt;p&gt;</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:call-template name="insertBreaks">
                    <xsl:with-param name="pText" select=  
                        "substring-after($pText, '&#xA;')"/>
                </xsl:call-template>
            </xsl:otherwise>  
        </xsl:choose>
    </xsl:template>

   
</xsl:stylesheet>

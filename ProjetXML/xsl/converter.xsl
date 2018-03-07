<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output
            indent="yes"
            method="xml"
            doctype-system="master.dtd"
    />

    <xsl:template match="/">
        <Master>
            <xsl:call-template name="Master"/>
        </Master>
    </xsl:template>

    <xsl:template name="Master" match="/">
        <Master>
            <xsl:for-each select="objets/objet[@type='mention']">
                <nom><xsl:value-of select="info[@nom='nom']/@value"/></nom>
            </xsl:for-each>
        </Master>
    </xsl:template>
</xsl:stylesheet>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output
            method="html"
            version="4.0"
            indent="yes"
    />
    <xsl:template name="intervenant">
        <xsl:for-each select="Master/Intervenants/Intervenant">
            <xsl:document href="www/intervenants/{@id}.html"
                          method="xml"
                          encoding="iso-8859-1"
                          doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
                          doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
                          indent="yes">
                <html>
                    <head><title><xsl:value-of select="nom"/></title></head>
                    <body>
                        <h2  id="{@id}" ><xsl:value-of select="nom"/></h2>
                        <p>
                            mail -> <xsl:value-of select="adrElect"/>
                        </p>
                        <p>
                            <a href="{adrSiteWeb}"> site web </a>
                        </p>
                    </body>
                </html>
            </xsl:document>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template name="intervenants">
        <xsl:document href="www/intervenants.html"
                      method="xml"
                      encoding="iso-8859-1"
                      doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
                      doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
                      indent="yes">
            <html>
                <head>
                    <title>Liste intervenants</title>
                </head>
                <body>
                    <ul>
                        <xsl:for-each select="Master/Intervenants/Intervenant">
                            <li><a href="intervenants/{@id}.html"><xsl:value-of select="nom"/></a></li>
                        </xsl:for-each>
                    </ul>
                </body>
            </html>
        </xsl:document>
    </xsl:template>

</xsl:stylesheet>
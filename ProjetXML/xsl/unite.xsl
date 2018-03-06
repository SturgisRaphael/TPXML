<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template name="unite">
        <xsl:for-each select="//UE">
            <xsl:document href="www/unites/{@id}.html"
                          method="xml"
                          encoding="iso-8859-1"
                          doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
                          doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
                          indent="yes">
                <html>
                    <head>
                        <title><xsl:value-of select="nom"/></title>
                    </head>
                    <body>
                        <h1><xsl:value-of select="nom"/></h1>
                        <h4>Credits:<xsl:value-of select="nbCredits"/></h4>
                        <h4>Resume:</h4>
                        <xsl:value-of select="resume"/>
                        <h4>plan:</h4>
                        <table summary="plan">
                            <xsl:for-each select="plan/*">
                                <tr>
                                    <td><xsl:value-of select ="local-name()"/></td>
                                    <td><xsl:value-of select="."/></td>
                                </tr>
                            </xsl:for-each>
                        </table>
                        <h4>Lieux:</h4>
                        <ul>
                            <xsl:for-each select="lieuEns/lieu">
                                <li><xsl:value-of select="."/></li>
                            </xsl:for-each>
                        </ul>
                        <h4>Intervenant:</h4>
                        <ul>
                            <xsl:for-each select="ref-Intervenant">
                                <li><a href="./intervenants/{key('inter', @ref)/@id}.html"><xsl:value-of select="key('inter', @ref)/nom"/> </a></li>
                                <!--TODO: make it work-->
                            </xsl:for-each>
                        </ul>
                    </body>
                </html>
            </xsl:document>
        </xsl:for-each>
    </xsl:template>

    <xsl:key name="inter" match="//Intervenant" use="@id"/>
</xsl:stylesheet>
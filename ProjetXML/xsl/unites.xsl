<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template name="unites">
        <xsl:document href="www/unites.html"
                      method="xml"
                      encoding="iso-8859-1"
                      doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
                      doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
                      indent="yes">

            <html>
                <head>
                    <title>Liste UEs</title>
                    <link rel="stylesheet" type="text/css" href="master.css" />
                </head>
                <body>
                    <h2>Liste UEs et credits</h2>
                    <table summary="UEs et credits">
                        <tr>
                            <th style="text-align:left">nom</th>
                            <th style="text-align:left">nbCredits</th>
                        </tr>
                        <xsl:for-each select="Master/Parcours/Semestre/Bloc/UE">
                            <tr>
                                <td><a href="unites/{@id}.html"><xsl:value-of select="nom"/></a></td>
                                <td><xsl:value-of select="nbCredits"/></td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </body>
            </html>
        </xsl:document>
    </xsl:template>

</xsl:stylesheet>
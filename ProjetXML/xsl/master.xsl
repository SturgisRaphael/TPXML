<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output
        method="html"
        encoding="iso-8859-1"
        doctype-system="../master.dtd"
        />
    <xsl:template match="/">
        <html>
            <body>
                <xsl:call-template name="Href-Intervenants" />
                <xsl:call-template name="liste-UE" />
                <xsl:call-template name="liste-Intervenants" />

            </body>
        </html>
    </xsl:template>


    <xsl:template name="Href-Intervenants">
        <ul>
            <xsl:for-each select="Master/Intervenants/Intervenant">
                <li><a href="#{@id}"><xsl:value-of select="nom"/></a></li>
            </xsl:for-each>
        </ul>
    </xsl:template>


    <xsl:template name="liste-UE">
        <h2>Liste UEs et credits</h2>
        <table border="1">
            <tr bgcolor="#ffffff">
                <th style="text-align:left">nom</th>
                <th style="text-align:left">nbCredits</th>
            </tr>
            <xsl:for-each select="Master/Parcours/Semestre/Bloc/UE">
                <tr>
                    <td><xsl:value-of select="nom"/></td>
                    <td><xsl:value-of select="nbCredits"/></td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>

    <xsl:template name="liste-Intervenants">

        <xsl:for-each select="Master/Intervenants/Intervenant">
            <xsl:document href="intervenant/{@id}.html">
                <html>
                    <head><title>Intervenant</title></head>
                    <body>
                        <h2  id="{@id}" ><xsl:value-of select="nom"/></h2>
                        <p><xsl:value-of select="adrElect"/>     <xsl:value-of select="adrSiteWeb"/></p>
                    </body>
                </html>
            </xsl:document>
        </xsl:for-each>
        <h1>Liste Intervenants</h1>
        <xsl:for-each select="Master/Intervenants/Intervenant">
            <h2  id="{@id}" ><xsl:value-of select="nom"/></h2>
            <p><xsl:value-of select="adrElect"/>     <xsl:value-of select="adrSiteWeb"/></p>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
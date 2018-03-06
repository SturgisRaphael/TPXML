<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output
        method="html"
        encoding="iso-8859-1"
        doctype-system="../master.dtd"
        />
    <xsl:template match="/">
                <xsl:call-template name="index"/>
                <xsl:call-template name="Href-Intervenants" />
                <xsl:call-template name="liste-UE" />
                <xsl:call-template name="liste-Intervenants" />
                <xsl:call-template name="unite"/>
    </xsl:template>

    <xsl:template name="index">
        <xsl:document href="www/index.html">
            <html>
                <body>
                    <h1>Master 1</h1>
                    <p>Bienvenue sur le site du master Informatique de l'universite aix-marseille.</p>
                    <ul>
                        <li><a href="unites.html">Liste des unitées</a> </li>
                        <li><a href="intervenants.html">Liste des intervenants</a></li>
                    </ul>

                    <h2>Les parcours</h2>
                    <xsl:call-template name="parcours"/>
                </body>
            </html>
        </xsl:document>
    </xsl:template>

    <xsl:template name="Href-Intervenants">
        <xsl:document href="www/intervenants.html">
            <ul>
                <xsl:for-each select="Master/Intervenants/Intervenant">
                    <li><a href="intervenants/{@id}.html"><xsl:value-of select="nom"/></a></li>
                </xsl:for-each>
            </ul>
        </xsl:document>
    </xsl:template>


    <xsl:template name="liste-UE">
        <xsl:document href="www/unites.html">
            <h2>Liste UEs et credits</h2>
            <table border="1">
                <tr bgcolor="#ffffff">
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
        </xsl:document>
    </xsl:template>

    <xsl:template name="liste-Intervenants">

        <xsl:for-each select="Master/Intervenants/Intervenant">
            <xsl:document href="www/intervenants/{@id}.html">
                <html>
                    <head><title>Intervenant</title></head>
                    <body>
                        <h2  id="{@id}" ><xsl:value-of select="nom"/></h2>
                        <p><xsl:value-of select="adrElect"/>     <xsl:value-of select="adrSiteWeb"/></p>
                    </body>
                </html>
            </xsl:document>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="unite">
        <xsl:for-each select="Master/Parcours/Semestre/Bloc/UE">
            <xsl:document href="www/unites/{@id}.html">
                <html>
                    <body>
                        <h1><xsl:value-of select="nom"/></h1>
                        <h3>Resume:</h3>
                        <p><xsl:value-of select="resume"/></p>
                    </body>
                </html>
            </xsl:document>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="parcours">
        <p>
            <xsl:for-each select="Master/Parcours">
                    <a href="parcours/{@id}.html"><xsl:value-of select="nom"/></a>
                <xsl:document href="parcours/{@id}.html">
                    <html>
                        <body>
                            <h1><xsl:value-of select="nom"/></h1>
                            <h3>Resume:</h3>
                            <p><xsl:value-of select="resume"/></p>
                        </body>
                    </html>
                </xsl:document>
            </xsl:for-each>
        </p>
    </xsl:template>

</xsl:stylesheet>
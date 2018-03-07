<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template name="index" match="/">
        <xsl:document href="www/index.html"
                      method="xml"
                      encoding="iso-8859-1"
                      doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
                      doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
                      indent="yes">

            <html>
                <head>
                    <link rel="stylesheet" type="text/css" href="master.css" />
                    <title>Accueil</title>
                </head>
                <body>
                    <h1>Master</h1>
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

    <xsl:template name="parcours">
        <p>
            <ul>
                <xsl:for-each select="Master/Parcours">
                    <li><a href="parcours/{@id}.html"><xsl:value-of select="nom"/></a></li>
                    <xsl:document href="parcours/{@id}.html">
                        <head>
                            table, th, td {
                            border: 1px solid black;
                            }
                        </head>
                        <html>
                            <body>
                                <h1><xsl:value-of select="nom"/></h1>
                                <h3>Resume:</h3>
                                <p><xsl:value-of select="resume"/></p>
                                <h3>Debouche:</h3>
                                <ul>
                                    <xsl:for-each select="Debouches/Debouche">
                                        <li><xsl:value-of select="."/></li>
                                    </xsl:for-each>
                                </ul>
                                <xsl:call-template name="Semestre"/>
                            </body>
                        </html>
                    </xsl:document>
                </xsl:for-each>
            </ul>
        </p>
    </xsl:template>

    <xsl:template name="Semestre">
        <table style="width:100%">
            <xsl:for-each select="Semestre">
                <tr><td colspan="2"><xsl:value-of select="nom"/></td></tr>
                <xsl:for-each select="Bloc">
                    <tr><td colspan="2"><xsl:value-of select="Type"/></td></tr>
                    <xsl:for-each select="UE">
                        <tr>
                            <td><a href="../unites/{@id}.html"><xsl:value-of select="nom"/></a></td>
                            <td><xsl:value-of select="nbCredits"/></td>
                        </tr>
                    </xsl:for-each>
                </xsl:for-each>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>
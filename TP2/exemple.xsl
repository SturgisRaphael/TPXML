<?xml version="1.0" encoding="utf-8" ?>

<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

  <xsl:output
    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
    method="html"/>

  <xsl:template match="stock">
    <html><body>
      <h1 bgcolor="blue">Stock de la soci�t�</h1>
      <xsl:apply-templates/>
    </body></html>
  </xsl:template>

  <xsl:template match="produit">
    <h2>Produit <xsl:value-of select="nom"/></h2>
    <xsl:apply-templates select="prix"/>
  </xsl:template>

  <xsl:template match="prix">
    <p>Prix : <xsl:value-of select="."/> en
    <xsl:value-of select="@monnaie"/></p>
  </xsl:template>

</xsl:stylesheet>

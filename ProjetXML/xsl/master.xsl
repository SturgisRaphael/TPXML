<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:include href="index.xsl"/>
    <xsl:include href="intervenant.xsl"/>
    <xsl:include href="intervenants.xsl"/>
    <xsl:include href="unite.xsl"/>
    <xsl:include href="unites.xsl"/>

    <xsl:template match="/">
        <xsl:call-template name="index"/>
        <xsl:call-template name="intervenant"/>
        <xsl:call-template name="intervenants"/>
        <xsl:call-template name="unite"/>
        <xsl:call-template name="unites"/>
    </xsl:template>

</xsl:stylesheet>



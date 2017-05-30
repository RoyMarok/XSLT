<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

    <xsl:output method="xml" encoding="utf-8" indent="no"/>

    <xsl:template match="/">
        <div class="highchart_data">
            <div class="categories"><xsl:value-of select="string-join(//ANLYS_USE_DYN_ATTEND//MONTH_STR, '|')"/></div>
            <div class="series"><div class="element" data-name="Объектов" data-chart-type="area"><xsl:value-of select="string-join(//ANLYS_USE_DYN_ATTEND//CNT, '|')"/></div></div>
            <div class="links"><xsl:value-of select="string-join(//ANLYS_USE_DYN_ATTEND//LNK, '|||')"/></div>
        </div>
        <XML>
          <xsl:copy-of select="."/>
        </XML>

    </xsl:template>
</xsl:stylesheet>

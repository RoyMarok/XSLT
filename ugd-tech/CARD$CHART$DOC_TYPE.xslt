<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

    <xsl:output method="xml" encoding="utf-8" indent="no"/>

    <xsl:template match="/">
        <div class="highchart_data">
            <div class="categories"><xsl:value-of select="string-join(//DASHBOARD_DOC_TYPE//NAME, '|')"/></div>
            <div class="series"><div class="element" data-name="Документов" data-chart-type="bar" data-stacked="true" data-names="Привязано|Без привязки|Не используется|Привязано автоматичеки"><xsl:value-of select="string-join(//DASHBOARD_DOC_TYPE//RATE_LNK, '|')"/>==<xsl:value-of select="string-join(//DASHBOARD_DOC_TYPE//RATE_UNLNK, '|')"/>==<xsl:value-of select="string-join(//DASHBOARD_DOC_TYPE//RATE_DEL, '|')"/>==<xsl:value-of select="string-join(//DASHBOARD_DOC_TYPE//RATE_LNK_AUTO, '|')"/></div></div>
        </div>
        <XML>
          <xsl:copy-of select="."/>
        </XML>

    </xsl:template>
</xsl:stylesheet>

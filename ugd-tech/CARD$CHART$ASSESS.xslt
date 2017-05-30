<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>
    <xsl:output method="xml" encoding="utf-8" indent="no"/>

    <xsl:template match="/">
        <div class="highchart_data">
            <div class="categories"> |<xsl:value-of select="string-join(//DASHBOARD_ASSESS//ROW[NAME!='NOTDOC' and NAME!='HAVEDOC' and NAME!='OBJALL']/NAME, '|')"/></div>
            <div class="series"><div class="element" data-name="Объектов" data-chart-type="column">0|<xsl:value-of select="string-join(//DASHBOARD_ASSESS//ROW[NAME!='NOTDOC' and NAME!='HAVEDOC' and NAME!='OBJALL']/CNT, '|')"/></div><div class="element" data-name="Объектов" data-chart-type="pie" data-names="C привязкой|Без привязки"><xsl:value-of select="sum(//DASHBOARD_ASSESS//ROW[NAME='HAVEDOC']/CNT)"/>|<xsl:value-of select="//DASHBOARD_ASSESS//ROW[NAME='NOTDOC']/CNT"/></div></div>
        </div>
        <XML>
          <xsl:copy-of select="."/>
        </XML>

    </xsl:template>
</xsl:stylesheet>
<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

    <xsl:output method="xml" encoding="utf-8" indent="no"/>

    <xsl:template match="/">
        <div class="highchart_data">
            <div class="categories"><xsl:value-of select="string-join(//DASHBOARD_GPZU_QUAL//ATTR_NAME, '|')"/></div>
            <div class="series"><div class="element" data-name="%" data-chart-type="bar"  data-names="Сведения внесены|Без сведений" data-stacked="true" ><xsl:value-of select="string-join(//DASHBOARD_GPZU_QUAL//RATE, '|')"/></div></div>
        </div>
        <XML>
          <xsl:copy-of select="."/>
        </XML>

    </xsl:template>
</xsl:stylesheet>
<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

    <xsl:output method="xml" encoding="utf-8" indent="no"/>

    <xsl:template match="/">
        <div class="highchart_data">
            <div class="categories">Месяц|2 месяца|6 месяцев|Год</div>
            <div class="series"><div class="element" data-name="%" data-chart-type="bar"  data-names="Не входили в систему|Входили в систему" data-stacked="true" ><xsl:value-of select="string-join(//ANLYS_USE_ACTIVITY//CNT_EXIT, '|')"/></div></div>
        </div>
        <XML>
          <xsl:copy-of select="."/>
        </XML>

    </xsl:template>
</xsl:stylesheet>

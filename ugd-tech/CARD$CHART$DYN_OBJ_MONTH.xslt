<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>
    <xsl:output method="xml" encoding="utf-8" indent="no"/>
    <xsl:template match="/">
        <!--div class="highchart_data" data-chart-type="line">
            <div class="categories">янв,фев,мар,апр,май,июн,июл,авг,сент,окт,ноя,дек</div>
            <div class="series"><div class="element" data-name="">400,280,650,400,100,200,100,100,100,100,100,100</div></div>
        </div-->
        <div class="highchart_data">
            <div class="categories"><xsl:value-of select="string-join(//DASHBOARD_DYN_OBJ_MONTH//MONTH_STR, '|')"/></div>
            <div class="series"><div class="element" data-name="Объектов" data-chart-type="line"><xsl:value-of select="string-join(//DASHBOARD_DYN_OBJ_MONTH//CNT, '|')"/></div></div>
            <div class="links"><xsl:value-of select="string-join(//DASHBOARD_DYN_OBJ_MONTH//LNK, '|||')"/></div>
        </div>
        <XML>
          <xsl:copy-of select="."/>
        </XML>
    </xsl:template>
</xsl:stylesheet>
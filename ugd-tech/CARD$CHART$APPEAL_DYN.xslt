<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:layout="URN:html-form-layout:v0.1" xmlns="http://www.w3.org/1999/xhtml" xmlns:ex2="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLTExtension" xmlns:ctx="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLDataContext" xmlns:gbu="http://xmlns.oracle.com/MSG_GBU_doc">
<xsl:output method="xml" indent="yes" omit-xml-declaration="no" undeclare-prefixes="yes" exclude-result-prefixes="#all"/>
<xsl:variable name="DATA">
    <GLOBAL xmlns="">
        <RANGES>
            <xsl:for-each select="//APPEAL_DYN//ROW">
                <RANGE><xsl:value-of select="CNT_MIN"/>==<xsl:value-of select="CNT_MAX"/></RANGE>
            </xsl:for-each>
        </RANGES>
        <xsl:copy-of select="/"/>
    </GLOBAL>
</xsl:variable>
    <xsl:template match="/">
        <div class="highchart_data">
            <div class="categories"><xsl:value-of select="string-join(//APPEAL_DYN//MONTH_STR, '|')"/></div>
            <div class="series"><div class="element" data-name="Обращений" data-chart-type="line" data-element-id="1"><xsl:value-of select="string-join(//APPEAL_DYN//CNT, '|')"/></div><div class="element" data-name="Обращений" data-chart-type="arearange" data-element-id="2"><xsl:value-of select="string-join($DATA//RANGE, '|')"/></div></div>
            <div class="link_wrap"><div class="links" data-element-id="1"><xsl:value-of select="string-join(//APPEAL_DYN//LNK, '|||')"/></div></div>
        </div>
        <XML>
          <xsl:copy-of select="$DATA"/>
        </XML>

    </xsl:template>
</xsl:stylesheet>
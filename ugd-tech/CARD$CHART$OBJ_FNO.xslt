<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

    <xsl:output method="xml" encoding="utf-8" indent="no"/>

    <xsl:template match="/">
        <div class="show">
            <div class="blockGroup">
                <xsl:for-each select="//DASHBOARD_OBJ_FNO//ROW">
                <div class="docElm objFno" data-code="{CODE}">
                    <xsl:if test="ICON"><img src="/portal_static/img/icons/{ICON}" alt=""/></xsl:if><div class="bigNumber"><xsl:value-of select="CNT"/></div><div class="text"><xsl:value-of select="NAME"/></div></div>
                </xsl:for-each>
            </div>
        </div>
        <XML>
          <xsl:copy-of select="."/>
        </XML>

    </xsl:template>
</xsl:stylesheet>
<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

    <xsl:output method="xml" encoding="utf-8" indent="no"/>

    <xsl:template match="/">
        <xml style="display: none">
          <xsl:copy-of select="/"/>
        </xml>
        <xsl:for-each select="//ROOT//CC_APPEAL_STATE//ROW">
            <div class="stage">
                <div class="pointer {STAGE_STATE}"></div>
                <div class="desc"><xsl:value-of select="NAME"/></div>
            </div>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
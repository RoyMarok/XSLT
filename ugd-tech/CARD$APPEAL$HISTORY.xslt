<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

    <xsl:output method="xml" encoding="utf-8" indent="no"/>

    <xsl:template match="/">
        <div class="requestList listLimited" data-link="DECLARANT">
            <xsl:for-each select="//ROOT//CC_HISTORY_BY_DECLARANT//ROW">
                <div class="request listLimited_element">
                    <div class="status" style="background-color: {APPEAL_COLOR}"><xsl:value-of select="APPEAL_STATUS"/></div>
                    <div class="title"><a href="" data-link="{LNK}" target="_blank"><xsl:value-of select="ALT_CODE"/></a></div>
                    <div class="content"><xsl:value-of select="APPEAL_TEXT"/></div>
                </div>
            </xsl:for-each>
        </div>
        <div class="requestList listLimited" data-link="ORG">
            <xsl:for-each select="//ROOT//CC_HISTORY_BY_ORG//ROW">
                <div class="request listLimited_element">
                    <div class="status" style="background-color: {APPEAL_COLOR}"><xsl:value-of select="APPEAL_STATUS"/></div>
                    <div class="title"><a href="" data-link="{LNK}"  target="_blank"><xsl:value-of select="ALT_CODE"/></a></div>
                    <div class="content"><xsl:value-of select="APPEAL_TEXT"/></div>
                </div>
            </xsl:for-each>
        </div>
        <xml style="display: none">
          <xsl:copy-of select="/"/>
        </xml>

    </xsl:template>
</xsl:stylesheet>

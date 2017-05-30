<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

    <xsl:output method="xml" encoding="utf-8" indent="no"/>

    <xsl:template match="/">
        <div class="show">
            <ul class="ft-cc-group ft-people">
                <xsl:for-each select="//ANLYS_USE_TOP_EMP//ROW">
                    <li data-id="{ID}">
                        <div class="ft-cc-group-inner">

                            <div class="ft-cc-photo">
                              <span>
                                <xsl:if test="FOTO_ID">
                                  <xsl:attribute name="style">background-image: url(/ugd/getThumb.action?cardId=<xsl:value-of select="FOTO_ID"/>)</xsl:attribute>
                                </xsl:if>
                              </span>
                            </div>
                            <div class="ft-cc-info">
                                <span><xsl:value-of select="FIO"/></span>
                                <span class="ft-cc-info-org"><xsl:value-of select="ROLE_MODEL//MANAGEMENTS_NAME"/></span>
                            </div>
                            <div class="ft-cc-enters"><xsl:value-of select="CNT"/></div>
                        </div>
                    </li>
                </xsl:for-each>
            </ul>
        </div>
        <XML>
          <xsl:copy-of select="."/>
        </XML>

    </xsl:template>
</xsl:stylesheet>

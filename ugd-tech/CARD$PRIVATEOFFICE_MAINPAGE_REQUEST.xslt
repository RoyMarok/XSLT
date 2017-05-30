<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="utf-8" indent="no"/>

    <xsl:template match="/">
      <xml style="display: none">
      	<xsl:copy-of select="*"/>
      </xml>

      <xsl:for-each select="//REQUESTS//REQUEST">
        <div class="request-item">
          <div style="background-color: {DOC_STATUS_COLOR}" class="request-status"><xsl:value-of select="DOC_STATUS"/></div>
          <h2><xsl:value-of select="NAME"/></h2>
          <div><xsl:value-of select="LNK_DOC_NUMBER" disable-output-escaping="yes" /> от <xsl:value-of select="DOC_DATE"/></div>
          <div>
          <xsl:variable name="fioCount" select="ADD_INFO/CNT" />

          <xsl:if test="ADD_INFO/FIO">
            <span><xsl:value-of select="ADD_INFO/FIO" /></span>
            <xsl:if test="ADD_INFO/ORG_POSITION">
              <span><xsl:text> </xsl:text>(<xsl:value-of select="ADD_INFO/ORG_POSITION" />)</span>
            </xsl:if>
          </xsl:if>

          <xsl:choose>
            <xsl:when test="$fioCount &gt; 3">
              <xsl:for-each select="ADD_INFO/FIOS/FIO">
                <div><xsl:value-of select="text()" /></div>
              </xsl:for-each>
              <div>… (всего <xsl:value-of select="$fioCount" /> пользователей)</div>
            </xsl:when>
            <xsl:when test="$fioCount &lt; 3">
              <xsl:for-each select="ADD_INFO/FIOS/FIO">
                <div><xsl:value-of select="text()" /></div>
              </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
            </xsl:otherwise>
          </xsl:choose>
        <xsl:choose>
            <xsl:when test="(OBJECT_ADDRESS != '') and (OBJECT_NAME != '')">
                <div>
                <xsl:if test="ADD_INFO/OBJECT_NAME">
                    <xsl:value-of select="ADD_INFO/OBJECT_NAME" />
                </xsl:if>

                <xsl:if test="ADD_INFO/OBJECT_ADDRESS">
                    <xsl:text value=" - "/><xsl:value-of select="ADD_INFO/OBJECT_ADDRESS" />
                </xsl:if>
                </div>
            </xsl:when>

            <xsl:otherwise>
                <xsl:for-each select="ADD_INFO//OBJECT">
                    <div>
                    <xsl:if test="NAME">
                        <xsl:value-of select="NAME" />
                    </xsl:if>

                    <xsl:if test="ADDRESS">
                        <xsl:text> - </xsl:text><xsl:value-of select="ADDRESS" />
                    </xsl:if>
                    </div>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
          </div>
        </div>
      </xsl:for-each>

    </xsl:template>
</xsl:stylesheet>
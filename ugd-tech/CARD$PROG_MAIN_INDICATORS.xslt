<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

    <xsl:output method="html" encoding="utf-8" indent="no"/>

    <xsl:template match="/">

      <xsl:variable name="DATA" select="//PROG_MAIN_INDICATORS/XMLDOC/INDICATORS" />

      <div class="filterBlock"><div class="filterLabel">Показаны:</div><div class="tagLine"></div><div class="filterButton blueButton" data-fancybox="" data-src="#modalIndicatorFilter">Поиск по показателям</div></div>

      <div class="pd-items">
        <xsl:for-each select="$DATA/INDICATOR">
          <div class="pd-item">
            <div class="pd-item-head">
              <div class="pd-item-num">
                <xsl:choose>
                  <xsl:when test="STATUS_NICK = 'PROJECT' or STATUS_NICK = 'IN_PROGRESS'">
                    <xsl:attribute name="style">
                      <xsl:text>background-color:#476BB3;border-color: #6699FF;</xsl:text>
                    </xsl:attribute>
                  </xsl:when>
                  <xsl:when test="STATUS_NICK = 'NOTREACHED'">
                    <xsl:attribute name="style">
                      <xsl:text>background-color:#A61C28;border-color: #ED2939;</xsl:text>
                    </xsl:attribute>
                  </xsl:when>
                  <xsl:when test="STATUS_NICK = 'REACHED'">
                    <xsl:attribute name="style">
                      <xsl:text>background-color:#196332;border-color: #248D48;</xsl:text>
                    </xsl:attribute>
                  </xsl:when>
                  <xsl:otherwise>
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:value-of select="NUM"/>
              </div>
              <div class="pd-item-name">
              <xsl:value-of select="NAME" disable-output-escaping="yes"/>
              </div>
            </div>
            <div class="pd-item-indicator-peoples">
                <div>
                  <strong><xsl:value-of select="VICE_FIO" /></strong>
                  <span><xsl:value-of select="DEPARTMENT_CHIEF_FIO" /></span>
                </div>
                <div>
                  <strong>
                    <xsl:value-of select="EXECUTOR_FIO" />
                    <xsl:for-each select="COWORKINGS/COWORKING">
                         <div style="margin-top: 3px"><xsl:value-of select="text()" /></div>
                    </xsl:for-each>
                  </strong>
                </div>
            </div>
            <xsl:if test="COMMENTS/COMMENT">
              <div class="pd-item-body">
                <table class="pd-item-documents-table">
                  <thead>
                  <tr>
                    <th></th>
                    <th>Целевое</th>
                    <th>Текущее</th>
                  </tr>
                  </thead>
                  <tbody>
                  <xsl:for-each select="COMMENTS/COMMENT">
                  <tr>
                    <th><a class="pd-get-modal" href="/ugd/getCardHtml.action?cardId=CARD$PROG_INDICATOR_INDICATORS&amp;documentId={ID}"><xsl:value-of select="NAME" /></a></th>
                    <td><span><xsl:value-of select="PLAN_VAL" /></span></td>
                    <td><xsl:value-of select="FACT_VAL" /></td>
                  </tr>
                  </xsl:for-each>
                  </tbody>
                </table>
              </div>
            </xsl:if>
          </div>
        </xsl:for-each>
      </div>
      <xml style="display: none">
        <xsl:copy-of select="*"/>
      </xml>
  </xsl:template>
</xsl:stylesheet>

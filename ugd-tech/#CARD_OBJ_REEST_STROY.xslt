
<div class="block">
  <p class="sectionTitle" style="border-top: 1px solid #e4e4e4; font-size: 12pt;  font-weight: bold; line-height: 35px;cursor:pointer">
    <span style="border-bottom:1px dashed #000000">Решения штабов, рабочих групп, комиссий</span></p>

  <xsl:for-each select="ROOT/OBJ_MEET/ROW_SET/ROW">
      <p style="font-weight: bold;margin-bottom: 5px;"><xsl:value-of select="MEET_NAME"/></p>
      <div>
        <span style="font-weight:bold">Заседание </span> 
        <a href="tabInfo.action?tab=PCARDGIO3_CARD&amp;tab2=PCARDGIO3_CARD&amp;documentId={DOC_ID}" target="_blank"><xsl:value-of select="DOC_NMBR"/></a>
      </div>
      <xsl:if test="DECIDED">
        <div><span>Принято решение: </span>
          <xsl:call-template name="nl2br">
              <xsl:with-param name="s" select="DECIDED"/>
          </xsl:call-template>
        </div>
      </xsl:if>
  </xsl:for-each>
</div>
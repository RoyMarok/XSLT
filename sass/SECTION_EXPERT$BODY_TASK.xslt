<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

    <xsl:output method="xml" encoding="utf-8" indent="no"/>

    <xsl:template match="/">
    <xsl:for-each select="//TASK_LIST/ROW_SET/ROW">
    <div class="cardTapeItem favorite">
        <table>
            <tbody>
                <tr>
                    <td class="td-icon">
                        <div class="icon-star hide"></div>
                    </td>
                    <td>
                        <p class="cardTapeItemCaption"><xsl:value-of select="TASK_TYPE_NAME"/></p>
                        <p class="gray"><xsl:value-of select="TASK_TYPE_NOTE"/></p>
                        <p>Обращение № <a href="/portal/tabInfo.action?tab=CARD_APPEAL&amp;documentId={TASK_FK_REQ_REQUEST}#tab::id=0/card::cardId=CARD_APPEAL_Body"><xsl:value-of select="REQ_NUM_DATE"/></a></p>

                        <p><xsl:value-of select="REQ_OBJECT_NAME"/></p><p><xsl:value-of select="REQ_ADDRESS"/></p>
                        <div class="cardTapeItemAddInfo">
                            <p><xsl:value-of select="TASK_BODY/DESC/TEXT" /></p>
                            <xsl:for-each select="TASK_BODY/DESC/BUTTONS/ROW_SET/ROW">
                                <a href="{URL}" class="taskActionButton" target="_blank"><xsl:value-of select="TEXT" /></a>
                            </xsl:for-each>
                        </div>

                    </td>
                    <td class="td-status">
                        <p class="cardTapeItemCaption"><xsl:value-of select="TASK_DATE_DONE_PLAN"/></p>
                        <div class="cardTapeItemStatus red hide">срок истек</div>
                        <div class="cardTapeItemStatus green hide">на сегодня</div>

                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    </xsl:for-each>
        <XML style="display:none">
          <xsl:copy-of select="."/>
        </XML>

    </xsl:template>
</xsl:stylesheet>

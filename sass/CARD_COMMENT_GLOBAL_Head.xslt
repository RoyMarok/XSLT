<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" encoding="utf-8" indent="no"/>

    <xsl:output method="html" encoding="utf-8" indent="no"/>
      {B{CARD$HEADER}E}
    <xsl:template match="/">

        <xsl:call-template name="header">
            <!--Центральный блок-->
            <xsl:with-param name="BC_titleCard">Сводное замечание</xsl:with-param>
            <xsl:with-param name="BC_nameObj" select="//REQUEST_NAMEADRESS"/>


            <!--Правый блок-->
            <xsl:with-param name="BR_blockRightTop">
                <xsl:value-of select="//NSI_COMMENT_STATUS_TEXT"/>
            </xsl:with-param>

            <!--Левый блок-->
            <xsl:with-param name="BL_blockLeftTop" select="//REG_NUMDATE"/>
        </xsl:call-template>

        <!--H1>Карточка СВОДНОГО  ЗАМЕЧАНИЯ - шапка</H1-->
        <xml class="head" style="display: none"><xsl:copy-of select="*"/></xml>
    </xsl:template>


</xsl:stylesheet>

<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="utf-8" indent="no"/>
	  {B{CARD$HEADER}E}
    <xsl:template match="/">
        <xsl:variable name="is_approved_text_color">
            <xsl:choose>
                <xsl:when test="//IS_APPROVED = 1">green</xsl:when>
                <xsl:otherwise>red</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <style type="text/css">
            .descriptObj_3 {
                font-weight: bold;
                color: <xsl:value-of select="$is_approved_text_color"/>
            }
        </style>
        
        <xsl:call-template name="header">
            <!--Центральный блок-->      
            <xsl:with-param name="BC_titleCard">Сводное заключение</xsl:with-param> 
            <xsl:with-param name="BC_nameObj" select="//REQUEST_NAMEADRESS"/>
            <xsl:with-param name="BC_descriptObj_3">
                <xsl:if test="//IS_APPROVED != ''">
                    <xsl:value-of select="//IS_APPROVED_TEXT"/>
                </xsl:if>
            </xsl:with-param>

            <!--Правый блок-->
            <xsl:with-param name="BR_blockRightTop">
                <xsl:value-of select="//NSI_RESOLUTION_STATUS_TEXT"/>
            </xsl:with-param>

            <!--Левый блок-->
            <xsl:with-param name="BL_blockLeftTop" select="//REG_NUMDATE"/>
        </xsl:call-template>
    
        <!--H1>Карточка ЛОКАЛЬНОГО ЗАМЕЧАНИЯ - шапка</H1-->
        <xml class="head" style="display: none"><xsl:copy-of select="*"/></xml>
    </xsl:template>
</xsl:stylesheet>
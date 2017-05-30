<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="utf-8" indent="no"/>
	
	{B{CARD$HEADER}E}

    <xsl:template match="/">

		<xsl:call-template name="header">
          <!--Центральный блок-->       
         	<xsl:with-param name="BC_nameObj" select="//DOGOVOR_HEAD//DOC_NUMDATE" />
	        <xsl:with-param name="BC_descriptObj_2">
        		<xsl:value-of select="//DOGOVOR_HEAD//REQUEST_OBJECT_NAME"/>
				<xsl:text> - </xsl:text>
        		<xsl:value-of select="//DOGOVOR_HEAD//REQUEST_OBJECT_ADDRES"/>
          </xsl:with-param>
	        <xsl:with-param name="BC_descriptObj_2ref" select="//DOGOVOR_HEAD//DOC_NUMDATE"/>

          <!--Правый блок-->
          <xsl:with-param name="BR_blockRightTop">
        		<xsl:value-of select="//DOGOVOR_HEAD//CONTRACT_STATUS_ID"/>
        		<xsl:value-of select="//DOGOVOR_HEAD//DOC_STATUS"/>
          </xsl:with-param>

		<!--Левый блок-->
        <xsl:with-param name="BL_blockLeftBottom" select="//DOGOVOR_HEAD//REG_NUMDATE"/>

      </xsl:call-template>

    </xsl:template>
</xsl:stylesheet>


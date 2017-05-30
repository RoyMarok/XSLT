<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:doc="http://xmlns.oracle.com/SMI_1" xmlns:ctx="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLDataContext">
	<xsl:output method="html" encoding="utf-8" indent="no"/>

    {B{CARD$TEMPLATE}E}
      <!--  Шаблон построения галереи -->
    {B{CARD$TEMPLATE$GALLERY}E}
    {B{CARD$HTML_TEMPLATE}E}


    {B{CARD$HTML_TEMPLATE_2}E}

  <xsl:template match="/">
    {B{CARD$BODY_STYLE}E}

  <!-- Вспомогательные скрипты для карточеи -->
    {B{CARD$BODY_SCRIPT}E}

    <div id="objCard">
      {B{CARD$GALLERY_STYLE}E}
        {B{CARD$TEMPLATE$GALLERY_SCRIPT}E}
            <!--  Вызов шаблона построения галереи -->
            <!--  левая часть карточки  -->
      {B{CARD$TEMPLATE$GALLERY$CALL}E}
      {B{CARD$SMI_BODY_STYLE}E}
      <div class="content_block">
                <div class="content content-block">
                    <!-- Содержание -->
                    <div class="block">
                        <p class="sectionTitle"><span>Содержание</span></p>
                        <div class="blockText">
                            <xsl:value-of select="//doc:text" disable-output-escaping="yes"/>
                        </div>
                        <xsl:if test="//doc:Autor_news != ''">
                            <div class="blockText">
                                <xsl:text>Автор: </xsl:text>
                                <xsl:value-of select="//doc:Autor_news"/>
                            </div>
                        </xsl:if>
                        <div class="blockText">
                            <a>
                                <xsl:attribute name="href">
                                    <xsl:value-of select="//doc:link"/>
                                </xsl:attribute>
                                <xsl:value-of select="//doc:link"/>
                            </a>
                        </div>
                    </div>
                    <!-- Объекты строительства -->
                    <xsl:if test="count(//OBJ_INFO//ROW) &gt; 0">
                        <div class="block">
                            <p class="sectionTitle"><span>Объекты строительства</span></p>
                            <xsl:for-each select="//OBJ_INFO//ROW">
                                <div class="blockText">
                                    <xsl:if test="OBJ_ADDR !=''">
                                        <a>
                                            <xsl:attribute name="href">
                                                <xsl:text>/portal/htmlcard.action?documentId=OB2:</xsl:text>
                                                <xsl:value-of select="OBJECT_ID"/>
                                            </xsl:attribute>
                                            <xsl:value-of select="OBJ_ADDR"/>
                                        </a>
                                    </xsl:if>
                                    <div>
                                        <xsl:value-of select="OBJ_NAME"/>
                                    </div>
                                    <div>
                                        <b><xsl:value-of select="STATUS_NAME"/></b>
                                    </div>
                                </div>
                            </xsl:for-each>
                        </div>
                    </xsl:if>
                </div>
            </div>
        </div>
        <XML style="display: none">
            <xsl:copy-of select="."/>
        </XML>
    </xsl:template>
</xsl:stylesheet>

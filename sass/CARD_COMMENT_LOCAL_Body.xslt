<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:layout="URN:html-form-layout:v0.1" xmlns="http://www.w3.org/1999/xhtml" xmlns:ex2="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLTExtension" xmlns:ctx="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLDataContext">
<xsl:output method="html" indent="yes" omit-xml-declaration="yes" undeclare-prefixes="yes" exclude-result-prefixes="#all"/>

    <xsl:output method="html" encoding="utf-8" indent="no"/>
    
    <!-- Разметка тела карточки -->
    <xsl:variable name="LAYOUT">
    
<xsl:if test="//COMMENT//FILE_CARD_ID !=''">
    {B{CARD$GALLERY_STYLES}E}
    <link type="text/css" rel="stylesheet" href="/portal_static/css/ps/fileBaloon.css"/>
    <div class="files_block pdoc-right-side">
        <div class="content">
                <xsl:if test="//COMMENT/ROW_SET/ROW/FILE_PAGECOUNT &gt; 0">
                  <p class="sectionTitle">Галерея документа</p>
                  <div class="gallery-right">
                    <a href="#" class="main-image" data-images-count="{//COMMENT/ROW_SET/ROW/FILE_PAGECOUNT}" data-id="{//COMMENT/ROW_SET/ROW/FILE_CARD_ID}">
                      <img src="" alt="" rel="galleryRight" page="{//COMMENT/ROW_SET/ROW/FILE_CARD_ID}"/>
                    </a>           
                    <xsl:if test="//COMMENT/ROW_SET/ROW/FILE_PAGECOUNT &gt; 0">
                      <div class="other-images">
                        <div class="wrp-images">  
                          <xsl:for-each select="//COMMENT/ROW_SET/ROW">
                            <div class="wrp-images-group" data-images-count="{FILE_PAGECOUNT}" data-id="{FILE_CARD_ID}"></div>
                          </xsl:for-each>
                        </div>
                       </div>
                    </xsl:if> 
                   </div>
                </xsl:if>
            
                <div class="preview-wrapper">
                    <xsl:for-each select="//COMMENT/ROW_SET/ROW">
                        <xsl:call-template name="file_transform">
                          <xsl:with-param name="pageCount" select="FILE_PAGECOUNT"/>
                          <xsl:with-param name="fileName" select="FILE_NAME"/>                
                          <xsl:with-param name="cardId" select="FILE_CARD_ID"/>
                          <xsl:with-param name="fileSize" select="FILE_LENGTH"/>
                          <xsl:with-param name="fkID" select="FILE_CARD_ID"/>
                          <xsl:with-param name="ecp" select="FILE_ECP"/>
                        </xsl:call-template> 
                    </xsl:for-each>
                </div> 
          </div>
    </div>
</xsl:if>
  
        <layout:block>
            <layout:header>
                <layout:element type="text" value="Общие сведения"/>
            </layout:header>
            <layout:item label="Наименование объекта" value="//COMMENT//REQUEST_OBJECT_NAME"/>
            <layout:item label="Адрес объекта" value="//COMMENT//REQUEST_OBJECT_ADDRES"/>
            <layout:item label="Ссылка на ПД" value="//COMMENT//LOADER_TEXT"/>
            <layout:item label="Обращение" escape="false" value="//COMMENT//REG_NUMDATE"/>
            <layout:item label="Раздел" value="//COMMENT//RES_SEC_NSI_PROJECT_SECTI_TEXT"/>
            <layout:item label="Тематика" value="//COMMENT//RES_SEC_NSI_PROJECT_SUBJE_TEXT"/>
            <layout:item label="Ведущее подразделение" value="//COMMENT//RES_SEC_FK_EXP_DEPARTMENT_TEXT"/>
            <layout:item label="Ведущий эксперт" value="//COMMENT//RES_SEC_FK_EXP_PERSON_TEXT"/>
            <layout:item label="Ответственное подразделение" value="//COMMENT//REQUEST_FK_EXP_DEPARTMENT_TEXT"/>
            <layout:item label="Ответственный эксперт" value="//COMMENT//REQUEST_FK_EXP_PERSON_TEXT"/>
            <layout:item label="Дата создания локального замечания" value="//COMMENT//DATE_CREATED"/>
        </layout:block>
        
        <div class="block ">
            <p class="sectionTitle"><span>Замечания</span></p>
            <xsl:if test="count(//REMARK//ROW) = 0">
                <div class="goodBlock">Замечаний нет</div>
            </xsl:if>
            <xsl:if test="count(//REMARK//ROW) != 0">
            <table class="tableCardStyle">
                <thead>
                    <tr>
                        <th>Статус</th>
                        <th>Номер замечания</th>
                        <th>Документы</th>
                        <th>Страницы</th>
                        <th>Примечания</th>
                        <th>Текст замечания</th>
                        <th>Приложения</th>
                        <th>Дата устранения</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each-group select="//REMARK//ROW" group-by="RF_FILE_ID">
                        <xsl:variable name="groupCount" select="count(current-group())"/>
                        <xsl:for-each select="current-group()">
                            <tr>
                                <xsl:if test="position() = 1">
                                    <td class="td-center" rowspan="{$groupCount}">
                                        <xsl:choose>
                                            <xsl:when test="REM_DATE_CORRECTED_FLG = '1'"><img src="/portal_static/img/greenCube.png"/></xsl:when>
                                            <xsl:otherwise><img src="/portal_static/img/greenCube.png"/></xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                    <td class="td-center" rowspan="{$groupCount}">
                                        <span class="text-bold"><xsl:value-of select="REM_COMMENT_NUMBER"/></span>
                                    </td>
                                </xsl:if>
                                <td class="td-center"><a href="{FILE_CARD_ID}"><xsl:value-of select="FILE_NAME"/></a></td>
                                <td class="td-center"><span class="text-bold"><xsl:value-of select="RF_PAGE_NUMBER"/></span></td>
                                <td class="td-center"><span class="text-bold"><xsl:value-of select="RF_NOTE"/></span></td>
                                <xsl:if test="position() = 1">
                                    <td class="td-center" rowspan="{$groupCount}"><span class="text-bold"><xsl:value-of select="REM_COMMENT_TEXT"/></span></td>
                                    <td class="td-center" rowspan="{$groupCount}"></td>
                                    <td class="td-center" rowspan="{$groupCount}"><span class="text-bold"><xsl:value-of select="REM_DATE_COMPLETED"/></span></td>
                                </xsl:if>
                            </tr>
                        </xsl:for-each>
                    </xsl:for-each-group>
                </tbody>
            </table>
            </xsl:if>
        </div>
        
        <layout:block>
            <layout:item label="Выводы по разделу" value="//COMMENT//COMMENT_TEXT"/>
        </layout:block>
    </xsl:variable>
    
    <!-- Шаблон описания элементов -->
    {B{CARD$HTML_TEMPLATE}E}
    
    {B{CARD$GALLERY_DOCUMENT}E}

    <xsl:template match="/">
        <xml class="body" style="display: none"><xsl:copy-of select="*"/></xml>
        
        <style type="text/css">
            .td-center {
                text-align: center;
                vertical-align: middle;
            }
            .goodBlock {
                color: #00B06E;
                /*background: #DDEBF7;*/
                padding: 5px 10px;
            }
        </style>
        
        <div class="cardWrapper">
            <xsl:call-template name="Context.setNamespace">
                <xsl:with-param name="namespacePrefix"></xsl:with-param>
                <xsl:with-param name="namespaceURI"></xsl:with-param>
            </xsl:call-template>    

            <xsl:call-template name="pageBuilder">
                <xsl:with-param name="data" select="/"/> <!-- Передаём XML данные в шаблоны -->
                <xsl:with-param name="layout" select="$LAYOUT"/> <!-- Передаём разметку -->
            </xsl:call-template> 
            
            <div class="clear"></div>
        </div>
        {B{CARD$GALLERY_scripts}E}
    </xsl:template>
</xsl:stylesheet>
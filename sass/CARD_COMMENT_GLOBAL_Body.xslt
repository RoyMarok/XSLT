<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:layout="URN:html-form-layout:v0.1" xmlns="http://www.w3.org/1999/xhtml" xmlns:ex2="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLTExtension" xmlns:ctx="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLDataContext">
<xsl:output method="html" indent="yes" omit-xml-declaration="yes" undeclare-prefixes="yes" exclude-result-prefixes="#all"/>

    <xsl:output method="html" encoding="utf-8" indent="no"/>
	<xsl:variable name="LAYOUT">
		<xsl:if test="//COMMENT_GLOBAL//FILE_CARD_ID !=''">
		    {B{CARD$GALLERY_STYLES}E}
		    <link type="text/css" rel="stylesheet" href="/portal_static/css/ps/fileBaloon.css"/>
		    <div class="files_block pdoc-right-side">
		        <div class="content">
		                <xsl:if test="//COMMENT_GLOBAL/ROW_SET/ROW/FILE_PAGECOUNT &gt; 0">
		                  <p class="sectionTitle">Галерея документа</p>
		                  <div class="gallery-right">
		                    <a href="#" class="main-image" data-images-count="{//COMMENT_GLOBAL/ROW_SET/ROW/FILE_PAGECOUNT}" data-id="{//COMMENT_GLOBAL/ROW_SET/ROW/FILE_CARD_ID}">
		                      <img src="" alt="" rel="galleryRight" page="{//COMMENT_GLOBAL/ROW_SET/ROW/FILE_CARD_ID}"/>
		                    </a>           
		                    <xsl:if test="//COMMENT_GLOBAL/ROW_SET/ROW/FILE_PAGECOUNT &gt; 0">
		                      <div class="other-images">
		                        <div class="wrp-images">  
		                          <xsl:for-each select="//COMMENT_GLOBAL/ROW_SET/ROW">
		                            <div class="wrp-images-group" data-images-count="{FILE_PAGECOUNT}" data-id="{FILE_CARD_ID}"></div>
		                          </xsl:for-each>
		                        </div>
		                       </div>
		                    </xsl:if> 
		                   </div>
		                </xsl:if>
		            
		                <div class="preview-wrapper">
		                    <xsl:for-each select="//COMMENT_GLOBAL/ROW_SET/ROW">
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
            <layout:item label="Наименование объекта" value="//COMMENT_GLOBAL//REQUEST_OBJECT_NAME"/>
            <layout:item label="Адрес объекта" value="//COMMENT_GLOBAL//REQUEST_OBJECT_ADDRES"/>
            <layout:item label="Ссылка на ПД" value="//COMMENT_GLOBAL//LOADER_TEXT"/>
            <layout:item label="Обращение" escape="false" value="//COMMENT_GLOBAL//REG_NUMDATE"/>
            <layout:item label="Ведущее подразделение" value="//COMMENT_GLOBAL//FK_EXP_DEPARTMENT_TEXT"/>
            <layout:item label="Ведущий эксперт" value="//COMMENT_GLOBAL//FK_EXP_PERSON_TEXT"/>

            <layout:item label="Дата создания сводного замечания" value="//COMMENT_GLOBAL//DATE_CREATED"/>
            <layout:item label="Дата подписания ведущим экспертом" value="//COMMENT_GLOBAL//DATE_SIGNED"/>
            <layout:item label="Замечания ведущего эксперта отсутствуют " value="//COMMENT_GLOBAL//IS_NO_COMMENT" checkbox="1"/>
            <layout:item label="Примечание" value="//COMMENT_GLOBAL//NOTE"/>
            <layout:item label="Общие выводы" value="//COMMENT_GLOBAL//COMMENT_TEXT"/>
        </layout:block>
        <layout:block>
			<layout:header>
                <layout:element type="text" value="Локальные замечания"/>
            </layout:header>
            <xsl:if test="count(//COMMENT_JOIN//ROW) = 0">
                <div class="goodBlock">Замечаний нет</div>
            </xsl:if>
            <xsl:if test="count(//COMMENT_JOIN//ROW) != 0">
            	<table class="tableCardStyle">
	                <thead>
	                    <tr>
	                        <th>№</th>
	                        <th>Раздел</th>
	                        <th>Тематика</th>
	                        <th>Отв. Эксперт</th>
	                        <th>Номер замечания</th>
	                        <th>Дата замечания плановая</th>
	                        <th>Замечание устранено</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <xsl:for-each select="//COMMENT_JOIN//ROW">
                            <tr>
                            	<td class="td-center"><xsl:value-of select="position()"/></td>
                            	<td class="td-center"><xsl:value-of select="NSI_PROJECT_SECTION_TEXT"/></td>
                            	<td class="td-center"><xsl:value-of select="NSI_PROJECT_SUBJEC_TEXT"/></td>
                            	<td class="td-center"><xsl:value-of select="EXP_PERSON_TEXT"/></td>
                            	<td class="td-center"><xsl:value-of select="REMARK_COMMENT_NUMBER"/></td>
                            	<td class="td-center"><xsl:value-of select="DATE_PLAN"/></td>

                        
               					<td class="td-center">
                                <xsl:choose>
                                    <xsl:when test="REMARK_DATE_CORRECTED_FLG = '1'"><img src="/portal_static/img/greenCube.png"/></xsl:when>
                                    <xsl:otherwise><img src="/portal_static/img/redCube.png"/></xsl:otherwise>
                                </xsl:choose>
                   				</td>
                            </tr>
	                        
	                    </xsl:for-each>
	                </tbody>
	            </table>
            </xsl:if>
        </layout:block>

        <table class="card-history">
	        <tr>
	            <td><div class="gray">Дата последнего изменения:</div><layout:element type="line" value="//SYS_LOG//DATA_CHANGED"/></td>
	            <td><div class="gray">Изменения внес:</div><layout:element type="line" value="//SYS_LOG//USER_CHANGED"/></td>
	            <td><div class="gray">Дата создания:</div><layout:element type="line" value="//SYS_LOG//DATE_CREATED"/></td>
	            <td><div class="gray">Создал:</div><layout:element type="line" value="//SYS_LOG//USER_CREATED"/></td>
	        </tr>
	    </table>

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
            <xml style="display: none">
			     <xsl:copy-of select="*"/>
		     </xml>
        </div>
        {B{CARD$GALLERY_scripts}E}
    </xsl:template>


</xsl:stylesheet>
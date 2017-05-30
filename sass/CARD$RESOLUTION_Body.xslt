<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:layout="URN:html-form-layout:v0.1" xmlns="http://www.w3.org/1999/xhtml" xmlns:ex2="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLTExtension" xmlns:ctx="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLDataContext">
<xsl:output method="html" indent="yes" omit-xml-declaration="yes" undeclare-prefixes="yes" exclude-result-prefixes="#all"/>

    
    <!-- Разметка тела карточки -->
    <xsl:variable name="LAYOUT">
        <xml style="display: none">
            <xsl:copy-of select="*"/>
        </xml> 
	<xsl:if test="//RES_RESOLUTION//ROW[1]/FILE_CARD_ID !=''">
	    {B{CARD$GALLERY_STYLES}E}
	    <link type="text/css" rel="stylesheet" href="/portal_static/css/ps/fileBaloon.css"/>
	    <div class="files_block pdoc-right-side">
	        <div class="content">
	                <xsl:if test="//RES_RESOLUTION/ROW_SET/ROW[1]/FILE_PAGECOUNT &gt; 0">
	                  <p class="sectionTitle">Галерея документа</p>
	                  <div class="gallery-right">
	                    <a href="#" class="main-image" data-images-count="{//RES_RESOLUTION/ROW_SET/ROW/FILE_PAGECOUNT}" data-id="{//RES_RESOLUTION/ROW_SET/ROW/FILE_CARD_ID}">
	                      <img src="" alt="" rel="galleryRight" page="{//RES_RESOLUTION/ROW_SET/ROW/FILE_CARD_ID}"/>
	                    </a>           
	                    <xsl:if test="//RES_RESOLUTION/ROW_SET/ROW/FILE_PAGECOUNT &gt; 0">
	                      <div class="other-images">
	                        <div class="wrp-images">  
	                          <xsl:for-each select="//RES_RESOLUTION/ROW_SET/ROW">
	                            <div class="wrp-images-group" data-images-count="{FILE_PAGECOUNT}" data-id="{FILE_CARD_ID}"></div>
	                          </xsl:for-each>
	                        </div>
	                       </div>
	                    </xsl:if> 
	                   </div>
	                </xsl:if>
	            
	                <div class="preview-wrapper">
	                    <xsl:for-each select="//RES_RESOLUTION/ROW_SET/ROW[1]">
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
	<div class="pdoc-left-side">
	   <layout:block>
            <layout:header>
                <layout:element type="text" value="Сведения об объекте"/>
            </layout:header>
            <layout:item label="Наименование объекта" value="//RES_RESOLUTION//ROW[1]/REQUEST_OBJECT_NAME"/>
            <layout:item label="Адрес объекта" value="//RES_RESOLUTION//ROW[1]/REQUEST_OBJECT_ADDRES"/>
            <layout:item label="Материалы, в отношении которых выдано заключение" value="//RES_RESOLUTION//ROW[1]/REG_EXPERT_TARGET"/>
            <layout:item label="Источник финансирования" escape="false" value="//RES_RESOLUTION//ROW[1]/REG_OBJECT_FINANCE"/>
            <layout:item label="Ссылка на проектную документацию" escape="false" value="//RES_RESOLUTION//ROW[1]/LOADER_TEXT"/>
            <layout:item label="Обращение" escape="false" value="//RES_RESOLUTION//ROW[1]/DOG_NUMBERDATE"/>
            <layout:item label="Реквизиты договора на проведение государственной экспертизы" value="//DOGOVOR_HEAD//ROW[1]/REQUEST_OBJECT_NAME"/> <!-- Нет данных -->
        </layout:block>
		
		<layout:block>
            <layout:header>
                <layout:element type="text" value="Реквизиты заключения"/>
            </layout:header>
            <layout:item label="Заключение государственной экспертизы">
            	<layout:element type="line" value="//RES_RESOLUTION//ROW[1]/DOC_NUMBER"/>
      			<xsl:text>от</xsl:text>
                <layout:element type="line" value="//RES_RESOLUTION//ROW[1]/DATE_COMPLETED"/>
        	</layout:item>

          <!--   <layout:if test="//RES_RESOLUTION//IS_APPROVED" operator="eq" value="1">
                <layout:item label="Результат экспертизы" value="123"/>
            </layout:if> 
            
             <layout:if test="//RES_RESOLUTION//IS_APPROVED" operator="eq" value="0">
                <layout:item label="Результат экспертизы" value="456"/>
            </layout:if> 

            <layout:if test="//RES_RESOLUTION//IS_APPROVED" operator="eq" value="0">
                <layout:item label="Причина отрицательного заключения" value="//RES_RESOLUTION//???"/>
            </layout:if>  -->

            <layout:item label="Регистрационный номер в реестре">
            	<layout:element type="line" value="//RES_RESOLUTION//ROW[1]/REGISTRY_NUMBER"/>
      			<xsl:text>от</xsl:text>
                <layout:element type="line" value="//RES_RESOLUTION//ROW[1]/REGISTRY_DATE"/>
        	</layout:item>
            <layout:item label="Комментарий" value="//RES_RESOLUTION//ROW[1]/REGISTRY_NOTE"/>
            <layout:item label="Дата передачи документов заявителю" value="//RES_RESOLUTION//ROW[1]/DATE_POST_RESOLUTION"/>
        </layout:block>


	</div>

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
    
    <!-- **************************** Основной темплейт ******************************** -->
    <xsl:template match="/">
      <div class="cardWrapper">
        <xsl:call-template name="Context.setNamespace">
            <xsl:with-param name="namespacePrefix"></xsl:with-param>
            <xsl:with-param name="namespaceURI"></xsl:with-param>
        </xsl:call-template>    

        <xsl:call-template name="pageBuilder">
            <xsl:with-param name="data" select="/"/> <!-- Передаём XML данные в шаблоны -->
            <xsl:with-param name="layout" select="$LAYOUT"/> <!-- Передаём разметку -->
        </xsl:call-template> 
      </div>
      {B{CARD$GALLERY_scripts}E}
    </xsl:template>
    
    {B{CARD$GALLERY_DOCUMENT}E}
  
</xsl:stylesheet>
<!--?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cfm="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml">
<xsl:output method="html"/-->
    
    <!-- Lashina 09.11.2015 GGE-186-->

    
    <xsl:template name="file_parse">    
        <xsl:param name="s"/>      
        
        <xsl:variable name="c10">,</xsl:variable>
        
        <xsl:choose>
            <xsl:when test="contains($s,$c10)">
            
                    <xsl:variable select="substring-before($s,$c10)" name="str"/>                    
     
                    <xsl:variable select="substring-before(substring-after($str, 'name='), '#size=')" name="fileName"/>
                    <xsl:variable select="substring-before(substring-after($str, '#size='), '#ecp')" name="fileSize"/>
                    <xsl:variable select="substring-before(substring-after($str, '#ecp='), '#pagecount=')" name="fileECP"/>
                    <xsl:variable select="substring-before(substring-after($str, '#pagecount='), '#t_file_id=')" name="filePagecount"/> 
                    <xsl:variable select="substring-after($str, '#card_id=')" name="fkID"/>                                                                                  
                                                                                    
                    <xsl:call-template name="file_transform">
                      <xsl:with-param name="pageCount" select="number($filePagecount)"/>
                      <xsl:with-param name="fileName" select="$fileName"/>
                      <xsl:with-param name="cardId" select="$fkID"/>
                      <xsl:with-param name="fileSize" select="$fileSize"/>
                      <xsl:with-param name="fkID" select="$fkID"/>
                      <xsl:with-param name="ecp" select="$fileECP"/>
                    </xsl:call-template>   
        
                    <xsl:call-template name="file_parse">
                      <xsl:with-param name="s" select="substring-after($s,$c10)"/>
                  </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
            
                  <xsl:variable select="substring-before(substring-after($s, 'name='), '#size=')" name="fileName"/>
                  <xsl:variable select="substring-before(substring-after($s, '#size='), '#ecp')" name="fileSize"/>
                  <xsl:variable select="substring-before(substring-after($s, '#ecp='), '#pagecount=')" name="fileECP"/>
                  <xsl:variable select="substring-before(substring-after($s, '#pagecount='), '#t_file_id=')" name="filePagecount"/>  
                  <xsl:variable select="substring-after($s, '#card_id=')" name="fkID"/>      
                     
                  <xsl:call-template name="file_transform">
                    <xsl:with-param name="pageCount" select="number($filePagecount)"/>
                    <xsl:with-param name="fileName" select="$fileName"/>
                    <xsl:with-param name="cardId" select="$fkID"/>
                    <xsl:with-param name="fileSize" select="$fileSize"/>
                    <xsl:with-param name="fkID" select="$fkID"/>
                    <xsl:with-param name="ecp" select="$fileECP"/>
                  </xsl:call-template>
                          
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template> 
 
<xsl:template name="file_transform">
    <xsl:param name="pageCount"/>
    <xsl:param name="fileName"/>
    <xsl:param name="rows"/>
    <xsl:param name="cardId"/>
    <xsl:param name="fileSize"/>
    <xsl:param name="fkID"/>
    <xsl:param name="ecp"/>


          <div class="preview-block">           
              <xsl:element name="img">
                  <xsl:choose>
                      <xsl:when test="contains($fileName, '.image') or contains($fileName, '.bmp') or contains($fileName, '.jpg')  or contains($fileName, '.gif')  or contains($fileName, '.png')">                                    
                          <xsl:attribute name="src">/portal_static/img/mime/image.png</xsl:attribute>                                            
                      </xsl:when>
                      <xsl:when test="contains($fileName, '.xlsx') or contains($fileName, '.xls')">
                          <xsl:attribute name="src">/portal_static/img/mime/x_office_spreadsheet.png</xsl:attribute>                                    
                      </xsl:when>
                      <xsl:when test="contains($fileName, '.doc') or contains($fileName, '.docx')">
                          <xsl:attribute name="src">/portal_static/img/mime/document.png</xsl:attribute>  
                      </xsl:when>
                      <xsl:when test="contains($fileName, '.ppt') or contains($fileName, '.pptx')">
                          <xsl:attribute name="src">/portal_static/img/mime/image_x_eps.png</xsl:attribute>  
                      </xsl:when>
                      <xsl:when test="contains($fileName, '.rar')">
                          <xsl:attribute name="src">/portal_static/img/mime/zip.png</xsl:attribute>  
                      </xsl:when>                                 
                      <xsl:when test="contains($fileName, '.pdf')">
                          <xsl:attribute name="src">/portal_static/img/mime/pdf.png</xsl:attribute>  
                      </xsl:when>
                      <xsl:when test="contains($fileName, '.zip')">
                          <xsl:attribute name="src">/portal_static/img/mime/zip.png</xsl:attribute>  
                      </xsl:when>                                        
                      <xsl:when test="contains($fileName, '.txt')">
                          <xsl:attribute name="src">/portal_static/img/mime/text_plain.png</xsl:attribute>  
                      </xsl:when>                                      
                       <xsl:when test="contains($fileName, '.xml')">
                          <xsl:attribute name="src">/portal_static/img/mime/xml.png</xsl:attribute>  
                      </xsl:when>
                     <xsl:otherwise>
                         <xsl:attribute name="src">/portal_static/img/mime/application_octet_stream.png</xsl:attribute>                                           
                      </xsl:otherwise>
                  </xsl:choose>
            </xsl:element>
      <xsl:if test="$ecp = '1'">
              <img class="signIcon" src="/portal_static/img/signIcon.png" />
            </xsl:if>
                        
        <div class="prew-description-block">
            <div class="pr-desc-name">
              <p><span style="line-height:20px;"><xsl:value-of select="$fileName"/></span></p>
              <p><span class="fileSize"><xsl:value-of select="$fileSize"/></span></p>
            </div>
        </div>
        <div class="clear"></div>
        <div class="baloon-wrapp" fileID="{$fkID}">
            <div class="baloon-arrow">
              <div class="sub-arrow"></div>
            </div>
            <!--div class="p-doc-scroller" style="" data-page="{$pageCount}" data-id="{$cardId}"></div-->
            <div class="button-baloon-block">
              <xsl:if test="$ecp = '1'">       
                <xsl:attribute name="style">min-width:270px</xsl:attribute>
              </xsl:if> 
              <span class="singleButton">
                <xsl:element name="a">
                  <xsl:attribute name="href">/elib/getFile.action?app=EXPERT&amp;contentType=application/octet-stream&amp;cardId=<xsl:value-of select="$fkID"/></xsl:attribute>
                  <img src="/portal_static/img/ps/icons/folder_open.gif"/>Открыть
                </xsl:element>
              </span> 
             <xsl:if test="$ecp = '1'">                            
              <span class="singleButton">
                <xsl:element name="a">                    
                    <xsl:attribute name="href">/elib/getFileWithEcp.action?contentType=application/octet-stream&amp;cardId=<xsl:value-of select="$cardId"/></xsl:attribute>
                    <xsl:attribute name="title">Скачать с ЭП</xsl:attribute>
                    <img src="/static/typeForm/img/download_with_ecp.png"/>Скачать с ЭП              
                </xsl:element>
              </span>  
             </xsl:if>
        
           <!--span class="singleButton">
                <xsl:element name="a">
                    <xsl:attribute name="href">#</xsl:attribute>
                    <xsl:attribute name="title">Просмотреть в Autovue</xsl:attribute>
                    <img src="/portal_static/img/ps/icons/autovue.gif"/>Autovue
                </xsl:element>
              </span-->    
            
             <xsl:if test="$ecp = '1'">   
              <span class="singleButton last">
                <xsl:element name="a">
                    <xsl:attribute name="id"><xsl:value-of select="$cardId"/></xsl:attribute>
                    <xsl:attribute name="title">Проверить электронную подпись</xsl:attribute>
                    <xsl:attribute name="class">cardCheckECP</xsl:attribute>
                    <img src="/portal_static/img/ps/icons/ecp_check.gif"/>
                </xsl:element>    
              </span>
             </xsl:if>
           
              
           </div>
           <xsl:if test="$pageCount > 0">
              <div class="preview-block p-doc-scroller" data-page="{$pageCount}" data-id="{$cardId}">
                  <div class="gallery-images">              
                  </div>
              </div>
           </xsl:if>
        </div>                       
        </div>
        <div class="preview-divider"></div>


</xsl:template>
<!--/xsl:stylesheet-->
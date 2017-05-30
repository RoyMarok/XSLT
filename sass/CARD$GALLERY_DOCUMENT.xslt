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
    
    <xsl:variable name="onclick">fileBaloon.toggle(this, '<xsl:value-of select="$cardId" />', +'<xsl:value-of select="$pageCount" />', !!+'<xsl:value-of select="$ecp" />')</xsl:variable>
    <!-- fileBaloon.toggle(this, '{$cardId}', +'{$pageCount}', !!+'{$ecp}') -->

          <div class="preview-block">        
              <xsl:element name="img">
                  <xsl:choose>
                      <xsl:when test="contains(translate($fileName,'IMAGE','image'), '.image') or contains(translate($fileName,'BMP','bmp'), '.bmp') or contains(translate($fileName,'JPG','jpg'), '.jpg')  or contains(translate($fileName,'GIF','gif'), '.gif')  or contains(translate($fileName,'PNG','png'), '.png')">                                    
                          <xsl:attribute name="src">/portal_static/img/mime/image.png</xsl:attribute>                                            
                      </xsl:when>
                      <xsl:when test="contains(translate($fileName,'XLSX','xlsx'), '.xlsx') or contains(translate($fileName,'XLS','xls'), '.xls')">
                          <xsl:attribute name="src">/portal_static/img/mime/x_office_spreadsheet.png</xsl:attribute>                                    
                      </xsl:when>
                      <xsl:when test="contains(translate($fileName,'DOC','doc'), '.doc') or contains(translate($fileName,'DOCX','docx'), '.docx')">
                          <xsl:attribute name="src">/portal_static/img/mime/document.png</xsl:attribute>  
                      </xsl:when>
                      <xsl:when test="contains(translate($fileName,'PPT','ppt'), '.ppt') or contains(translate($fileName,'PPTX','pptx'), '.pptx')">
                          <xsl:attribute name="src">/portal_static/img/mime/image_x_eps.png</xsl:attribute>  
                      </xsl:when>
                      <xsl:when test="contains(translate($fileName,'RAR','rar'), '.rar')">
                          <xsl:attribute name="src">/portal_static/img/mime/zip.png</xsl:attribute>  
                      </xsl:when>                                 
                      <xsl:when test="contains(translate($fileName,'PDF','pdf'), '.pdf')">
                          <xsl:attribute name="src">/portal_static/img/mime/pdf.png</xsl:attribute>  
                      </xsl:when>
                      <xsl:when test="contains(translate($fileName,'ZIP','zip'), '.zip')">
                          <xsl:attribute name="src">/portal_static/img/mime/zip.png</xsl:attribute>  
                      </xsl:when>                                        
                      <xsl:when test="contains(translate($fileName,'TXT','txt'), '.txt')">
                          <xsl:attribute name="src">/portal_static/img/mime/text_plain.png</xsl:attribute>  
                      </xsl:when>                                      
                       <xsl:when test="contains(translate($fileName,'XML','xml'), '.xml')">
                          <xsl:attribute name="src">/portal_static/img/mime/xml.png</xsl:attribute>  
                      </xsl:when>
                     <xsl:otherwise>
                         <xsl:attribute name="src">/portal_static/img/mime/application_octet_stream.png</xsl:attribute>                                           
                      </xsl:otherwise>
                  </xsl:choose>
                  <xsl:attribute name="onclick"><xsl:value-of select="$onclick" /></xsl:attribute>
            </xsl:element>
            <xsl:if test="$ecp = '1'">
              <img class="signIcon" src="/portal_static/img/signIcon.png" />
            </xsl:if>
                        
        <div class="prew-description-block">
            <div class="pr-desc-name">
              <p onclick="{$onclick}"><span style="line-height:20px;"><xsl:value-of select="$fileName"/></span></p>
              <p><span class="fileSize"><xsl:value-of select="$fileSize"/></span></p>
            </div>
        </div>
        <div class="clear"></div>                     
        </div>
        <div class="preview-divider"></div>


</xsl:template>
<!--/xsl:stylesheet-->
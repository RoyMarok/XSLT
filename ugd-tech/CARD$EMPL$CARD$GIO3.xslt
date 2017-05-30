<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>


<xsl:template match="/">



<script type="text/javascript"  src="/static/accounting/accounting.min.js"></script>


<script src="/static/accounting/accounting.min.js"></script>
   <script>
            <![CDATA[
                $(document).ready(function(){
                   $(".staticCheckBox").click(function(e){
                      e.preventDefault();
                   });
                });
                $(document).ready(function(){
                  $(".p-doc-scroller").each(function(){
                    var id = $(this).attr('data-id');
                    $.ajax({
                      url: location.origin+'/portal/getImage.action?cardId='+id+'&page=1',
                      type:'GET',
                      success:function(){
                        /**/
                      }
                    });
                  });
                });
            ]]>
        </script>
  <div class="pdoc-main-wrapp" id="objCard">
    {B{CARD$PDOC$BODY_styles}E}
    {B{CARD$MGE$REGISTRATION_styles__}E}
    {B{CARD$BODY_STYLE}E}
    {B{CARD$PDOC$BODY_scripts}E}
    
  <div class="pdoc-right-side">
  
   
          <div class="content">
    
      <xsl:if test="//PDOC_FILES/ROW_SET/ROW/PAGECOUNT &gt; 0">
            <p class="sectionTitle"><span>Галерея документа</span></p>
            <div class="gallery-right">
              <a class="main-image" data-images-count="1" data-id="{//PDOC_FILES/ROW_SET/ROW/FK_CARD_ID}">
                <img src=""/>
              </a>           
              <xsl:if test="//PDOC_FILES/ROW_SET/ROW/PAGECOUNT &gt; 0">
                <div class="other-images">
                  <div class="wrp-images" data-images-count="{//PDOC_FILES/ROW_SET/ROW/PAGECOUNT}" data-id="{//PDOC_FILES/ROW_SET/ROW/FK_CARD_ID}"></div>
                </div>
              </xsl:if> 
            </div>
          </xsl:if>
          <xsl:choose>
            <xsl:when test="//PDOC_FILES/ROW_SET/ROW!=''">
              <p class="sectionTitle"><span>Электронные документы</span></p>
            </xsl:when>
            <xsl:otherwise>
            <!--Тут нужно переделать-->
              <style>
                div.pdoc-left-side{
                  width: 100%;
                  }
                div.pdoc-right-side{
                  width: 0%;
                }
              </style>
            <!--Тут нужно переделать-->
            </xsl:otherwise>
          </xsl:choose>  
            <div class="preview-wrapper">
        <xsl:for-each select="//PDOC_FILES/ROW_SET/ROW">
          <xsl:call-template name="file_transform">
            <xsl:with-param name="pageCount" select="PAGECOUNT"/>
            <xsl:with-param name="fileName" select="FV_NAME"/>
            <xsl:with-param name="cardId" select="FK_CARD_ID"/>
            <xsl:with-param name="fileSize" select="FN_SIZE"/>
            <xsl:with-param name="fkID" select="FK_CARD_ID"/>
            <xsl:with-param name="ecp" select="ECP"/>
          </xsl:call-template>
        </xsl:for-each>
  
          </div>
            <xsl:if test="//FILES_ADDICTED/ROW_SET/ROW!=''">
              <p class="sectionTitle">Приложение</p>
            </xsl:if>
            <xsl:for-each select="//FILES_ADDICTED/ROW_SET/ROW">
              <div class="simpleFile">
                <img class="docMini" src="/portal_static/img/pdf.png" style="float:left"/>
                <a href="getFile.action?cardId={FK_FILE}"><xsl:value-of select="FV_NAME"/></a>
              </div>
            </xsl:for-each>
    </div>
        </div>
  <div class="pdoc-left-side">
    <div class="content"> 
      <xsl:if test = "ROOT/CARD_FIELD = ''">
        <h1 class="emptyDoc">Такого документа не существует</h1>
      </xsl:if>  
    <xsl:for-each-group select="ROOT/CARD_FIELD/ROW_SET/ROW[FT_IS_SECTION='TRUE']" group-by="FIELD_ID">
      <xsl:sort select="FIELD_ORDER"/>
      <xsl:call-template name="makeSection">
        <xsl:with-param name="id" select="FIELD_ID"/>
        <xsl:with-param name="name" select="NAME"/>
        <xsl:with-param name="visible" select="VISIBLE"/>
        <xsl:with-param name="htmlclass" select="HTML_CLASS"/>
        <xsl:with-param name="ftnick" select="FT_NICK"/>
        <xsl:with-param name="currentGroup" select="current-group()"/>
      </xsl:call-template> 
    </xsl:for-each-group>
    
    <xsl:if test = "//CARD_FIELD/ROW_SET/ROW!=''">
     <xsl:if test="//PDOC_ADDICTED/ROW_SET/ROW !=''">
               <div class="GreyLineDivider"></div>          
              <p class="sectionTitle">Приложения</p>
            </xsl:if>
                <table class="common editorial">
                  <xsl:for-each select="//PDOC_ADDICTED/ROW_SET/ROW">
                    <tr>
                    <td width="60%">
                        <div class="p-doc-value pdoc-left"><xsl:value-of select="AD_DOC_NAME"/></div>
                    </td>
                    <td width="20%">
                        <div class="p-doc-value">
                        <xsl:element name="a">
                                    <xsl:attribute name="href">tabInfo.action?tab=PCARDGIO3_CARD&amp;tab2=PCARDGIO3_CARD&amp;documentId=<xsl:value-of select="AD_FK_ID"/></xsl:attribute>
                          <xsl:value-of select="AD_DOC_NUMBER"/>
                        </xsl:element>
                      </div>
                    </td>
                    <td width="20%">
                        <div class="p-doc-value">от <xsl:value-of select="AD_DOC_DATE"/></div>
                    </td>
                </tr>
              </xsl:for-each>
          </table>  
            <xsl:if test="//BOUNDED_DOCS/ROW_SET/ROW !=''">
              <div class="GreyLineDivider"></div>            
              <p class="sectionTitle">Связанные документы</p>
              <table class="common editorial">
                  <xsl:for-each select="//BOUNDED_DOCS/ROW_SET/ROW">
                    <tr>
                    <td width="60%">
                        <div class="p-doc-value pdoc-left"><xsl:value-of select="AD_DOC_NAME"/></div>
                    </td>
                    <td width="20%">
                        <div class="p-doc-value">
                        <xsl:element name="a">
                                  
              <xsl:choose>
                <xsl:when test="BDOC_CLASS_NICK='SERVICE'">
                                  <xsl:attribute name="href">tabInfo.action?tab=APPEAL_CARD&amp;tab2=APPEAL_CARD&amp;documentId=<xsl:value-of select="AD_FK_ID"/></xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                                  <xsl:attribute name="href">tabInfo.action?tab=PCARDGIO3_CARD&amp;tab2=PCARDGIO3_CARD&amp;documentId=<xsl:value-of select="AD_FK_ID"/></xsl:attribute>
                </xsl:otherwise>
              </xsl:choose>


                          <xsl:value-of select="AD_DOC_NUMBER"/>
                        </xsl:element>
                        </div>
                    </td>
                    <td width="20%">
                        <div class="p-doc-value">от <xsl:value-of select="AD_DOC_DATE"/></div>
                    </td>
                </tr>
              </xsl:for-each>
              </table> 
            </xsl:if> 
            <xsl:if test="//VERSION_HIST/ROW_SET/ROW !=''">
              <div class="GreyLineDivider"></div>            
              <p class="sectionTitle">Редакции документа</p>
            
                <table class="common editorial">
                  <xsl:for-each select="//VERSION_HIST/ROW_SET/ROW">
                    <tr>
                      <xsl:if test="//T_DOCUMENT/ROW_SET/ROW/FK_ID = DOC_KEY">
                        <xsl:attribute name="class">active</xsl:attribute>
                      </xsl:if>
                  <td width="165px">
                    <xsl:if test="//T_DOCUMENT/ROW_SET/ROW/FK_ID = DOC_KEY">
                    <div class="size_8">
                    <span>Вы находитесь здесь</span>
                    <span class="arrow_right"><img src="/portal_static/img/ps/card_arrow_right.png"/></span>
                    </div>
                    </xsl:if>
                  </td>
                  <xsl:if test="/ROOT != ''">
                    <td width="150px">
                        <div class="p-doc-value"><xsl:value-of select="DOC_DATE"/></div>
                    </td>
                  </xsl:if>
                  <xsl:if test="/ROOT != ''">
                    <td>
                          <xsl:choose>
                            <xsl:when test="//T_DOCUMENT/ROW_SET/ROW/FK_ID != DOC_KEY">
                            <div class="p-doc-value">
                            <xsl:element name="a">
                               <xsl:attribute name="href">tabInfo.action?tab=PCARDGIO3_CARD&amp;tab2=PCARDGIO3_CARD&amp;documentId=<xsl:value-of select="DOC_KEY"/></xsl:attribute>
                              <!--<xsl:attribute name="href">tabInfo.action?tab=PDOC_CARD&amp;tab2=PDOC_CARD&amp;documentId=<xsl:value-of select="DOC_KEY"/></xsl:attribute>-->
                              <xsl:value-of select="VERSION_TYPE"/>
                            </xsl:element>
                            </div>
                            </xsl:when>
                            <xsl:otherwise>
                              <div class="p-doc-value"><strong><xsl:value-of select="VERSION_TYPE"/></strong></div>
                            </xsl:otherwise>
                          </xsl:choose>   
                    </td>
                  </xsl:if>
        
                  <td>
                      <!--div class="cat">
                        <div class="value"><a href="#"><xsl:value-of select="'Процесс'"/></a></div>
                      </div-->
                  </td>
                  
                  <xsl:if test="/ROOT != ''">
                    <td>
                        <div class="p-doc-value">
                          <span class="size_8"><xsl:value-of select="VERSION_ANNOTATION"/></span>
                      </div>
                  </td>
                </xsl:if>
            </tr>
    </xsl:for-each>
</table>
</xsl:if>
<hr/>
<xsl:if test="/ROOT != ''">
</xsl:if>
<table class="common">
    <tr>
        <td>
            <div class="value size_8">
                <span class="color_light_gray">Дата последнего изменения: </span>
                <span><xsl:value-of select="//T_DOCUMENT_CUT/ROW_SET/ROW/FD_LAST_MODIFIED"/></span>
            </div>
        </td>
        <td>
            <div class="value size_8">
                <span class="color_light_gray"> Изменения внес: </span>
                <span><xsl:value-of select="//T_DOCUMENT_CUT/ROW_SET/ROW/FV_MODIFIED_BY_FIO"/></span>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <div class="value size_8">
                <span class="color_light_gray">Дата создания: </span>
                <span><xsl:value-of select="//T_DOCUMENT_CUT/ROW_SET/ROW/FD_CREATED"/></span>
            </div>
        </td>
        <td>
            <div class="value size_8">
                <span class="color_light_gray"> Создал: </span>
                <span><xsl:value-of select="//T_DOCUMENT_CUT/ROW_SET/ROW/FV_CREATED_BY_FIO"/></span>
            </div>
        </td>
    </tr>
</table>
    
    
    
    
  </xsl:if>  
  </div>
  
  </div>
   </div>    

  
  
</xsl:template>

  <!-- Section Table -->
  
  <!-- Section Table TR -->

  <!-- Section DIV -->
  
  
  {B{CARD$GIO3$TEMPLATE}E}
  {B{CARD$GALLERY_DOCUMENT}E} 
  
  <!-- Date transform -->
  <xsl:template name="date_transform">
    <xsl:param name="old_date"/>
    <xsl:choose>
      <xsl:when test="substring($old_date,5,1) = '-' and substring($old_date,8,1) = '-'">
        <xsl:value-of select="substring($old_date,9,2)"/>
        <xsl:text>.</xsl:text>
        <xsl:value-of select="substring($old_date,6,2)"/>
        <xsl:text>.</xsl:text>
        <xsl:value-of select="substring($old_date,1,4)"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$old_date"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
</xsl:stylesheet>
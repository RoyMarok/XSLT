<xsl:if test="//GALLERY//FILE_ID !=''">
    <div class="files_block pdoc-right-side">
        <div class="content content-block">
            <xsl:if test="//GALLERY//FILE_PAGE_COUNT &gt; 0">
                <p class="sectionTitle"><span>Галерея документа</span></p>           
                        <div class="gallery-right">
                            <a href="#" class="main-image" data-images-count="{//GALLERY//FILE_PAGE_COUNT}" data-id="{//GALLERY//FILE_ID}">
                                <img src="" alt="" rel="galleryRight" page="{//GALLERY//FILE_ID}"/>
                            </a>
                            <xsl:if test="//GALLERY//FILE_PAGE_COUNT &gt; 0">
                                <div class="other-images">
                                    <div class="wrp-images" data-images-count="{//GALLERY//FILE_PAGE_COUNT}" data-id="{//GALLERY//FILE_ID}"></div>
                                </div>
                            </xsl:if>
                        </div>                   
            </xsl:if>            

            <div class="preview-wrapper"> 
                <xsl:for-each select="//GALLERY//ROW">                 
                    <xsl:call-template name="file_transform">
                        <xsl:with-param name="pageCount" select="FILE_PAGE_COUNT"/>
                        <xsl:with-param name="fileName" select="FILE_NAME"/>
                        <xsl:with-param name="cardId" select="FILE_ID"/>
                        <xsl:with-param name="fileSize" select="FILE_SIZE"/>
                        <xsl:with-param name="fkID" select="FILE_ID"/>
                        <xsl:with-param name="ecp" select="ECP"/>
                    </xsl:call-template>               
                </xsl:for-each>
            </div>
        </div>
    </div>
</xsl:if>
    
    
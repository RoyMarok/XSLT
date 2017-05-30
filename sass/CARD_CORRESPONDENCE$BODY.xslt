<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="utf-8" indent="no"/>

    <xsl:template match="/">
    <div class="cardWrapper">
       <!--  Стили карточки -->
       {B{CARD$BODY_STYLE}E}

       <!-- Вспомогательные скрипты для карточеи -->
       {B{CARD$BODY_SCRIPT}E}

       {B{CARD$TEMPLATE$GALLERY_SCRIPT}E}
       {B{CARD$GALLERY_STYLE}E}
        <div id="objCard">

          {B{CARD$TEMPLATE$GALLERY$CALL}E}

          <div class="content_block">

            <div class="content">
              <xsl:if test="//REQ_DISPATCH//FILES//CARD_ID !=''">
          	    {B{CARD$GALLERY_STYLES}E}
          	    <link type="text/css" rel="stylesheet" href="/portal_static/css/ps/fileBaloon.css"/>
          	    <div class="files_block pdoc-right-side">
          	        <div class="content">
          	                <xsl:if test="//REQ_DISPATCH//FILES//FILE_PAGECOUNT &gt; 0">
          	                  <p class="sectionTitle">Галерея документа</p>
          	                  <div class="gallery-right">
          	                    <a href="#" class="main-image" data-images-count="{//REQ_DISPATCH//FILES//FILE_PAGECOUNT}" data-id="{//REQ_DISPATCH//FILES//CARD_ID}">
          	                      <img src="" alt="" rel="galleryRight" page="{//REQ_DISPATCH//FILES//CARD_ID}"/>
          	                    </a>
          	                    <xsl:if test="//REQ_DISPATCH//FILES//FILE_PAGECOUNT &gt; 0">
          	                      <div class="other-images">
          	                        <div class="wrp-images">
          	                          <xsl:for-each select="//REQ_DISPATCH//FILES//ROW">
          	                            <div class="wrp-images-group" data-images-count="{FILE_PAGECOUNT}" data-id="{CARD_ID}"></div>
          	                          </xsl:for-each>
          	                        </div>
          	                       </div>
          	                    </xsl:if>
          	                   </div>
          	                </xsl:if>

          	                <div class="preview-wrapper">
          	                    <xsl:for-each select="//REQ_DISPATCH//FILES//ROW">
          	                        <xsl:call-template name="file_transform">
          	                          <xsl:with-param name="pageCount" select="FILE_PAGECOUNT"/>
          	                          <xsl:with-param name="fileName" select="FILE_NAME"/>
          	                          <xsl:with-param name="cardId" select="CARD_ID"/>
          	                          <xsl:with-param name="fileSize" select="FILE_LENGTH"/>
          	                          <xsl:with-param name="fkID" select="CARD_ID"/>
          	                          <xsl:with-param name="ecp" select="FILE_ECP"/>
          	                        </xsl:call-template>
          	                    </xsl:for-each>
          	                </div>
          	          </div>
          	    </div>
          	</xsl:if>
            <div class="pdoc-left-side">
                <div class="block">

                  <p class="sectionTitle " style=""><span>Общая информация</span></p>

                  <xsl:if test="//REQ_DISPATCH//DOC_NUMBER != ''">
                    <div class="cat">
                      <div class="key"><span>Регистрационный номер</span></div>
                      <div class="value">
                        <xsl:text>№ </xsl:text>
                        <xsl:value-of select="//REQ_DISPATCH//DOC_NUMBER" />
                        <xsl:if test="//REQ_DISPATCH//DOC_DATE != ''">
                          <xsl:text> от </xsl:text>
                          <xsl:value-of select="//REQ_DISPATCH//DOC_DATE" />
                        </xsl:if>
                      </div>
                    </div>
                  </xsl:if>


                  <xsl:if test="//REQ_DISPATCH//DEP_NAME != ''">
                    <div class="cat">
                      <div class="key"><span>Вид корреспонденции</span></div>
                      <div class="value"><xsl:value-of select="//REQ_DISPATCH//DEP_NAME" /></div>
                    </div>
                  </xsl:if>

                  <xsl:if test="//REQ_DISPATCH//NSI_PROCESS_DIRECTION_TEXT != ''">
                    <div class="cat">
                      <div class="key"><span>Тип документа</span></div>
                      <div class="value">
                        <xsl:value-of select="//REQ_DISPATCH//NSI_PROCESS_DIRECTION_TEXT" />
                        <xsl:if test="//REQ_DISPATCH//NSI_REQUEST_TYPE != ''">
                          <xsl:text> (</xsl:text>
                          <xsl:value-of select="//REQ_DISPATCH//NSI_REQUEST_TYPE_TEXT" />
                          <xsl:text>)</xsl:text>
                        </xsl:if>
                      </div>
                    </div>
                  </xsl:if>

                  <xsl:if test="//REQ_DISPATCH//NSI_DISPATCH_TYPE_TEXT != ''">
                    <div class="cat">
                      <div class="key"><span>Вид документа</span></div>
                      <div class="value"><xsl:value-of select="//REQ_DISPATCH//NSI_DISPATCH_TYPE_TEXT" /></div>
                    </div>
                  </xsl:if>

                  <xsl:if test="//REQ_DISPATCH//DOC_REQ_DISP_PREV != ''">
                    <div class="cat">
                      <div class="key"><span>Предыдущий документ</span></div>
                      <div class="value">
                        <xsl:text>№ </xsl:text>
                        <xsl:value-of select="//REQ_DISPATCH//DOC_REQ_DISP_PREV" />
                      </div>
                    </div>
                  </xsl:if>

                  <xsl:if test="//REQ_DISPATCH//DOC_NUMBER_IN != ''">
                  <div class="cat">
                    <div class="key"><span>На номер</span></div>
                    <div class="value">
                      <xsl:text>№ </xsl:text>
                      <xsl:value-of select="//REQ_DISPATCH//DOC_NUMBER_IN" />
                      <xsl:if test="//REQ_DISPATCH//NSI_REQUEST_TYPE != ''">
                        <xsl:text> от </xsl:text>
                          <xsl:value-of select="//REQ_DISPATCH//DOC_DATE_IN" />
                      </xsl:if>
                    </div>
                  </div>
                  </xsl:if>

                  <xsl:if test="//REQ_DISPATCH//DOC_NUMBER_OUT != ''">
                    <div class="cat">
                      <div class="key"><span>Исходящий номер</span></div>
                      <div class="value">
                        <xsl:text>№ </xsl:text>
                        <xsl:value-of select="//REQ_DISPATCH//DOC_NUMBER_OUT" />
                        <xsl:if test="//REQ_DISPATCH//DOC_DATE_OUT != ''">
                          <xsl:text> от </xsl:text>
                          <xsl:value-of select="//REQ_DISPATCH//DOC_DATE_OUT" />
                        </xsl:if>
                      </div>
                    </div>
                  </xsl:if>

                  <xsl:if test="//REQ_DISPATCH//NOTE != ''">
                    <div class="cat">
                      <div class="key"><span>Содержание</span></div>
                      <div class="value"><xsl:value-of select="//REQ_DISPATCH//NOTE" /></div>
                    </div>
                  </xsl:if>
                </div>

                <div class="block">
                  <p class="sectionTitle " style=""><span>Адресаты документа</span></p>

                  <xsl:if test="//REQ_DISPATCH//CON_PERSON_FROM_NAME != ''">
                    <div class="cat">
                      <div class="key"><span>Отправитель</span></div>
                      <div class="value">
                        <xsl:value-of select="//REQ_DISPATCH//CON_PERSON_FROM_NAME" />
                        <xsl:if test="//REQ_DISPATCH//CON_CONTRACTOR_FROM_NAME != ''">
                          <xsl:text>, </xsl:text>
                          <xsl:value-of select="//REQ_DISPATCH//CON_CONTRACTOR_FROM_NAME" />
                        </xsl:if>
                      </div>
                    </div>
                  </xsl:if>


                  <xsl:if test="count(//REQ_DISPATCH_RECIPIENT//ROW) > 0">
                    <div class="cat">
                      <div class="key"><span>Получатели</span></div>
                      <div class="value">
                        <xsl:for-each select="//REQ_DISPATCH_RECIPIENT//ROW">
                          <xsl:value-of select="CON_PERSON_NAME" />
                          <xsl:if test="CON_CONTRACTOR_NAME != ''">
                            <xsl:text>, </xsl:text>
                            <xsl:value-of select="CON_CONTRACTOR_NAME" />
                          </xsl:if>
                        </xsl:for-each>
                      </div>
                    </div>
                  </xsl:if>

                </div>
                <table class="card-history">
                  <tr>
                      <td><div class="gray">Дата последнего изменения:</div><xsl:value-of select="//SYS_LOG//DATA_CHANGED"/></td>
                      <td><div class="gray">Изменения внес:</div><xsl:value-of select="//SYS_LOG//USER_CHANGED"/></td>
                      <td><div class="gray">Дата создания:</div><xsl:value-of select="//SYS_LOG//DATE_CREATED"/></td>
                      <td><div class="gray">Создал:</div><xsl:value-of select="//SYS_LOG//USER_CREATED"/></td>
                  </tr>
              </table>
              </div>
            </div>
          </div>
        </div>
      </div>

      <xml id="b-xml" style="display: none">
      	<xsl:copy-of select="*"/>
      </xml>
      {B{CARD$GALLERY_scripts}E}

    </xsl:template>
        {B{CARD$GALLERY_DOCUMENT}E}
</xsl:stylesheet>

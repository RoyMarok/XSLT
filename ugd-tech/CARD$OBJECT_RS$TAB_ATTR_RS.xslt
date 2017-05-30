<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="utf-8"/>

    <xsl:template match="/">


     {B{CARD$BODY_STYLE}E}

      <style>
        .newWindowData {
          cursor: pointer;
        }
        .buttons {
          clear: both; margin-bottom: 30px; overflow: hidden;  text-align: right;
        }
        .tableCardStyle td:first-child{
          padding-left: 40px;
          position: relative;
        }
        .expander {
          display: inline-block;
          width: 30px;
          height: 30px;
          position: absolute;
          left: 10px;
          top: 0px;
          background-image: url(/portal_static/img/ps/toggle_plus.gif);
          background-position: left;
          background-repeat: no-repeat;
          cursor: pointer;
        }
        .expander.expand {
          background-image: url(/portal_static/img/ps/toggle_minus.gif);
        }
      </style>
    <div id="formCard">
      <!-- <div class="buttons">
        <input class="newWindowData buttonCard edit" type="button" widthwin="1000" heightwin="700" value="Редактировать">
          <xsl:attribute name="link">
            <xsl:text>/ugd/getCardHtml.action?cardId=RS$GBU_DOC_NORM$FRM&amp;ATTR_NAME=</xsl:text>
            <xsl:value-of select="ATTR_NAME"/>
            <xsl:text>&amp;DOC_TYPE_ID=</xsl:text>
            <xsl:choose>
              <xsl:when test="DOC_TYPE_ID != ''">
                <xsl:value-of select="DOC_TYPE_ID"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:text>A6B4E4B805CD4498992FCD42175BCA4E</xsl:text>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:text>&amp;DOC_KEY=</xsl:text>
            <xsl:value-of select="DOC_KEY"/>
            <xsl:text>&amp;OBJECT_ID=</xsl:text>
            <xsl:value-of select="OBJECT_ID"/> -->
            <!--xsl:text>&amp;DOC_DATE=</xsl:text>
            <xsl:value-of select="DOC_DATE"/>
            <xsl:text>&amp;DOC_NUMBER=</xsl:text>
            <xsl:value-of select="DOC_NUMBER"/-->
            <!-- <xsl:text>#tab_2</xsl:text>
          </xsl:attribute>
        </input>
      </div> -->



      <table class="tableCardStyle" style="width:100%; margin-top:15px">
        <tr>
          <th>Атрибут</th>
          <th>Значение</th>
          <th>Основание</th>
          <th>Ред.</th>
        </tr>
        <xsl:for-each select="//ROW[MAIN_FLAG = 'Д' or not(MAIN_FLAG)]">
          <xsl:variable name="attrId" select="ATTR_ID"/>
          <xsl:variable name="editedAttr">
            <xsl:call-template name="getAttr">
              <xsl:with-param name="attrId" select="ATTR_ID"/>
            </xsl:call-template>
          </xsl:variable>
          <tr>
            <td>
              <xsl:if test="count(../ROW[ATTR_ID = $attrId]) &gt; 1">
                <span class="expander">
                  <xsl:attribute name="attrId">
                    <xsl:value-of select="ATTR_ID"/>
                  </xsl:attribute>
                </span>

               </xsl:if>
              <xsl:choose>
                <xsl:when test="ATTR_ID ='status_object_detailm'">
                 <b> <xsl:text>Детализация состояния объекта</xsl:text></b>
                </xsl:when>
                <xsl:otherwise>
                  <b><xsl:value-of select="ATTR_NAME"/></b>
                </xsl:otherwise>
              </xsl:choose>


             <!-- <b><xsl:value-of select="ATTR_NAME"/></b>-->




            </td>
            <td>
              <xsl:choose>
                <xsl:when test="CALCULATED_VALUE != ''">
                  <xsl:value-of select="CALCULATED_VALUE"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="USER_VALUE"/>
                </xsl:otherwise>
              </xsl:choose>
            </td>
            <td>
              <xsl:choose>
                <xsl:when test="DOC_NUMBER != '' or DOC_DATE != '' or DOC_TYPE != ''">
                  <div class="bold">
                    <xsl:value-of select="DOC_DATE"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="DOC_TYPE"/>
                  </div>
                  <div>
                    <a>
                      <xsl:attribute name="href">
                        <xsl:text>getCardHtml.action?cardId=CARD$DOC_REDIRECT&amp;documentId=</xsl:text>
                        <xsl:value-of select="DOC_KEY"/>
                      </xsl:attribute>
                      <xsl:value-of select="DOC_NUMBER"/>
                    </a>
                    <xsl:choose>
                        <xsl:when test="DOC_DATE != ''">
                          <xsl:text> от </xsl:text>
                          <xsl:value-of select="DOC_DATE"/>
                        </xsl:when>
                       </xsl:choose>
                  </div>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="USER_NAME"/>
                </xsl:otherwise>
              </xsl:choose>
            </td>
            <td>
              <xsl:if test="$editedAttr != ''">
                <img src="/portal_static/img/icons/pensil.png" class="newWindowData" widthwin="1000" heightwin="700">
                  <xsl:attribute name="link">
                    <xsl:text>/ugd/getCardHtml.action?cardId=RS$GBU_DOC_NORM$FRM&amp;DOC_TYPE_ID=</xsl:text>
                    <xsl:choose>
                      <xsl:when test="DOC_TYPE_ID != ''">
                        <xsl:value-of select="DOC_TYPE_ID"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:text>A6B4E4B805CD4498992FCD42175BCA4E</xsl:text>
                      </xsl:otherwise>
                    </xsl:choose>
                    <xsl:text>&amp;documentId=</xsl:text>
                    <xsl:value-of select="'9CE3FD9488DB3387256EE58BFAF1BD78'"/>
                    <xsl:text>&amp;DOC_KEY=</xsl:text>
                    <xsl:value-of select="DOC_KEY"/>
                    <xsl:text>&amp;OBJECT_ID=</xsl:text>
                    <xsl:value-of select="OBJECT_ID"/>
                    <xsl:text>&amp;DOC_TYPE=</xsl:text>
                    <xsl:value-of select="DOC_TYPE"/>
                    <xsl:text>&amp;DOC_DATE=</xsl:text>
                    <xsl:value-of select="DOC_DATE"/>
                    <xsl:text>&amp;DOC_NUMBER=</xsl:text>
                    <xsl:value-of select="DOC_NUMBER"/>
                    <xsl:text>&amp;ATTRVAL=</xsl:text>
                    <xsl:choose>
                      <xsl:when test="CALCULATED_VALUE !=''">
                        <xsl:value-of select="CALCULATED_VALUE"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="USER_VALUE"/>
                      </xsl:otherwise>
                    </xsl:choose>
                    <xsl:text>&amp;ATTR=</xsl:text>
                    <xsl:value-of select="$editedAttr"/>
                    <xsl:text>#tab_2</xsl:text>

                  </xsl:attribute>
                </img>
              </xsl:if>
            </td>
          </tr>
          <xsl:if test="MAIN_FLAG = 'Д'">
            <xsl:for-each select="../ROW[ATTR_ID = $attrId and MAIN_FLAG = 'Н']">
              <tr>
                <xsl:attribute name="class">
                  <xsl:text>hidden child-</xsl:text>
                  <xsl:value-of select="$attrId"/>
                </xsl:attribute>
                <td>
                  <xsl:value-of select="ATTR_NAME"/>
                </td>
                <td>
                  <xsl:choose>
                    <xsl:when test="CALCULATED_VALUE != ''">
                      <xsl:value-of select="CALCULATED_VALUE"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="USER_VALUE"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </td>
                <td>
                  <xsl:choose>
                    <xsl:when test="DOC_NUMBER != '' or DOC_DATE != '' or DOC_TYPE != ''">
                      <div >
                        <xsl:value-of select="DOC_DATE"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="DOC_TYPE"/>
                     </div>
                      <div>
                        <a>
                          <xsl:attribute name="href">
                            <xsl:text>getCardHtml.action?cardId=CARD$DOC_REDIRECT&amp;documentId=</xsl:text>
                            <xsl:value-of select="DOC_KEY"/>
                          </xsl:attribute>
                          <xsl:value-of select="DOC_NUMBER"/>
                        </a>
                        <xsl:choose>
                        <xsl:when test="DOC_DATE != ''">
                          <xsl:text> от </xsl:text>
                          <xsl:value-of select="DOC_DATE"/>
                        </xsl:when>
                       </xsl:choose>
                      </div>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="USER_NAME"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </td>
                <td>
                  <!--xsl:if test="$editedAttr != ''">
                    <img src="/portal_static/img/icons/pensil.png" class="newWindowData" widthwin="1000" heightwin="700">
                      <xsl:attribute name="link">
                        <xsl:text>/ugd/getCardHtml.action?cardId=RS$GBU_DOC_NORM$FRM&amp;DOC_TYPE_ID=</xsl:text>
                        <xsl:choose>
                          <xsl:when test="DOC_TYPE_ID != ''">
                            <xsl:value-of select="DOC_TYPE_ID"/>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:text>A6B4E4B805CD4498992FCD42175BCA4E</xsl:text>
                          </xsl:otherwise>
                        </xsl:choose>
                        <xsl:text>&amp;documentId=</xsl:text>
                        <xsl:value-of select="'9CE3FD9488DB3387256EE58BFAF1BD78'"/>
                        <xsl:text>&amp;DOC_KEY=</xsl:text>
                        <xsl:value-of select="DOC_KEY"/>
                        <xsl:text>&amp;OBJECT_ID=</xsl:text>
                        <xsl:value-of select="OBJECT_ID"/>
                        <xsl:text>&amp;DOC_DATE=</xsl:text>
                        <xsl:value-of select="DOC_DATE"/>
                        <xsl:text>&amp;DOC_TYPE=</xsl:text>
                        <xsl:value-of select="DOC_TYPE"/>
                        <xsl:text>&amp;DOC_NUMBER=</xsl:text>
                        <xsl:value-of select="DOC_NUMBER"/>
                        <xsl:text>&amp;ATTRVAL=</xsl:text>
                        <xsl:choose>
                          <xsl:when test="CALCULATED_VALUE !=''">
                            <xsl:value-of select="CALCULATED_VALUE"/>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:value-of select="USER_VALUE"/>
                          </xsl:otherwise>
                        </xsl:choose>
                        <xsl:text>&amp;ATTR=</xsl:text>
                        <xsl:value-of select="$editedAttr"/>
                        <xsl:text>#tab_2</xsl:text>
                      </xsl:attribute>
                    </img>
                  </xsl:if-->
                </td>
              </tr>
            </xsl:for-each>
          </xsl:if>
        </xsl:for-each>
      </table>
    </div>


    <script type="text/javascript">
      $(function(){
        $('.expander').click(function(e){
          var id = e.target.getAttribute('attrid');
          $('.child-'+id).toggleClass('hidden');
          $(this).toggleClass('expand');
        })
      })
    </script>
      <xml style="display: none">
          <xsl:copy-of select="/"/>
        </xml>

    </xsl:template>

    <xsl:template name="getAttr">
      <xsl:param name="attrId"></xsl:param>
      <xsl:choose>
        <xsl:when test="$attrId = 'address'">
          <xsl:text>ObjectAddress</xsl:text>
        </xsl:when>
        <xsl:when test="$attrId = 'okrug'">
          <xsl:text>ObjectOkrug</xsl:text>
        </xsl:when>
        <xsl:when test="$attrId = 'district'">
          <xsl:text>ObjectDistrict</xsl:text>
        </xsl:when>
        <xsl:when test="$attrId = 'kadastr_number'">
          <xsl:text>KadastrNumber</xsl:text>
        </xsl:when>
        <xsl:when test="$attrId = 'name'">
          <xsl:text>ObjectName</xsl:text>
        </xsl:when>
        <xsl:when test="$attrId = 'object_type_main'">
          <xsl:text>MainFunctional</xsl:text>
        </xsl:when>
        <xsl:when test="$attrId = 'work_type'">
          <xsl:text>ConstructionWorkType</xsl:text>
        </xsl:when>
        <xsl:when test="$attrId = 'objectuid'">
          <xsl:text>ObjUID</xsl:text>
        </xsl:when>
        <xsl:when test="$attrId = 'source_finance'">
          <xsl:text>SourceOfFinance</xsl:text>
        </xsl:when>
        <xsl:when test="$attrId = 'plan_date_end_total'">
          <xsl:text>PlanDateEndOks</xsl:text>
        </xsl:when>
        <xsl:when test="$attrId = 'project_series'">
          <xsl:text>ProjectSer</xsl:text>
        </xsl:when>
        <xsl:when test="$attrId = 'post_address'">
          <xsl:text>PostAddress</xsl:text>
        </xsl:when>
        <xsl:when test="$attrId = 'oks_x'">
          <xsl:text>OksX</xsl:text>
        </xsl:when>
        <xsl:when test="$attrId = 'oks_y'">
          <xsl:text>OksY</xsl:text>
        </xsl:when>
        <xsl:when test="$attrId = 'obj_list'">
          <xsl:text>obj_list</xsl:text>
        </xsl:when>
        <xsl:when test="$attrId = 'status_object'">
          <xsl:text>ObjectCondition</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text></xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:template>
</xsl:stylesheet>



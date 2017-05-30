<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:layout="URN:html-form-layout:v0.1" xmlns="http://www.w3.org/1999/xhtml" xmlns:ex2="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLTExtension" xmlns:ctx="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLDataContext" xmlns:gbu="http://xmlns.oracle.com/MSG_GBU_doc">

    <xsl:output method="html" indent="yes" omit-xml-declaration="yes" undeclare-prefixes="yes" exclude-result-prefixes="#all"/>

<!-- 28.08.2015 Королев Н.А. задача https://jira.mdi.ru/browse/UGDII-1490  -->
<xsl:variable name="DATA">
    <GLOBAL xmlns="">
        <xsl:copy-of select="/"/>
        <FNO_306>
            <xsl:if test="count(//ROOT//GBU_CORRECTDOC_FNO_306//OLD//FNO) &gt; 0">
                <OLD>
                    <xsl:for-each select="//ROOT//GBU_CORRECTDOC_FNO_306//OLD//FNO">
                    <FNO>
                        <COMBO><xsl:value-of select="concat(CODE, ' ', NAME)"/></COMBO>
                    </FNO>
                    </xsl:for-each>
                </OLD>
            </xsl:if>
            <xsl:if test="count(//ROOT//GBU_CORRECTDOC_FNO_306//NEW//FNO) &gt; 0">
                <NEW>
                    <xsl:for-each select="//ROOT//GBU_CORRECTDOC_FNO_306//NEW//FNO">
                    <FNO>
                        <COMBO><xsl:value-of select="concat(CODE, ' ', NAME)"/></COMBO>
                    </FNO>
                    </xsl:for-each>
                </NEW>
            </xsl:if>
        </FNO_306>
        <VRI>
            <xsl:if test="count(//ROOT//GBU_CORRECTDOC_SD_CODES//OLD//SD_CODE) &gt; 0">
                <OLD>
                    <xsl:for-each select="//ROOT//GBU_CORRECTDOC_SD_CODES//OLD//SD_CODE">
                    <ROW>
                        <COMBO><xsl:value-of select="concat(CODE, ' ', NAME)"/></COMBO>
                    </ROW>
                    </xsl:for-each>
                </OLD>
            </xsl:if>
            <xsl:if test="count(//ROOT//GBU_CORRECTDOC_SD_CODES//NEW//SD_CODE) &gt; 0">
                <NEW>
                    <xsl:for-each select="//ROOT//GBU_CORRECTDOC_SD_CODES//NEW//SD_CODE">
                    <ROW>
                        <COMBO><xsl:value-of select="concat(CODE, ' ', NAME)"/></COMBO>
                    </ROW>
                    </xsl:for-each>
                </NEW>
            </xsl:if>
        </VRI>
    </GLOBAL>
</xsl:variable>

    <xsl:variable name="LAYOUT">



      <!-- Основные показатели объекта  -->
      <layout:block>

        <layout:header>Показатели</layout:header>

        <xsl:if test="//gbu:ObjectInfo//gbu:ObjectId != ''">

        <div class="cat">
            <div class="key">
              <span>Ссылка на объект</span>
            </div>
            <div class="value">
              <a>
                <xsl:attribute name="href">
                  <xsl:text>getCardHtml.action?cardId=CARD$DOC_REDIRECT&amp;documentId=</xsl:text>
                  <xsl:value-of select="//gbu:ObjectInfo//gbu:ObjectId"/>
                </xsl:attribute>
                           <xsl:value-of select="'Перейти к объекту'"/>

              </a>
            </div>
          </div>

        </xsl:if>

        <layout:item format="text" label="Идентификатор объекта" value="//gbu:ObjectInfo//gbu:ObjectId"/>

        <layout:item format="text" label="Наименование объекта" value="//gbu:ObjectInfo//gbu:ObjectName"/>
        <layout:item format="text" label="Присвоенный адрес" value="//gbu:ObjectInfo//gbu:PostAddress"/>
        <layout:item format="text" label="Район" value="//gbu:ObjectInfo//gbu:ObjectDistrict"/>
        <layout:item format="text" label="Округ" value="//gbu:ObjectInfo//gbu:ObjectArea"/>
        <layout:item format="text" label="Строительный адрес" value="//gbu:ObjectInfo//gbu:ObjectAddress"/>
        <layout:item format="text" label="Вид работ" value="//gbu:ObjectInfo//gbu:ConstructionWorkType"/>
        <layout:item format="text" label="Источник финансирования" value="//gbu:ObjectInfo//gbu:SourceOfFinance"/>
        <layout:item format="text" label="Серия проекта" value="//gbu:ObjectInfo//gbu:ProjectSer"/>
        <layout:item format="text" label="Основное функциональное назначение" value="//gbu:ObjectInfo//gbu:MainFunctional"/>
        <layout:item format="text" label="Дополнительные виды использования" value="//gbu:ObjectInfo//gbu:AdditionalFunctional"/>
        <layout:item format="text" label="Плановый год ввода (итоговый)" value="//gbu:ObjectInfo//gbu:PlanDateEndOks"/>
        <layout:item format="text" label="Координаты ОКС Х" value="//gbu:ObjectInfo//gbu:OksX"/>
        <layout:item format="text" label="Координаты ОКС Y" value="//gbu:ObjectInfo//gbu:OksY"/>
        <layout:item format="text" label="Старое значение" value="//gbu:ObjectInfo//gbu:ValueOld"/>


      </layout:block>



      <!-- Технико-экономические показатели объекта  -->
      <layout:block>

        <layout:header>Технико-экономические показатели объекта</layout:header>

        <layout:item format="text" label="Наименование" value="//gbu:Powers/gbu:PowerName"/>
        <layout:item format="text" label="Новое значение" value="//gbu:Powers/gbu:PowerValueFact"/>
        <layout:item format="text" label="Старое значение" value="//gbu:Powers/gbu:PowerValueOld"/>
        <layout:item format="text" label="Комментарий" value="//gbu:Powers/gbu:PowerComment"/>


      </layout:block>

      <!-- ТФНО по 306-ПП  -->
      <layout:block>

        <layout:header>ФНО по 306-ПП</layout:header>
        <xsl:if test="count($DATA//FNO_306//OLD//FNO) &gt; 0">

                <div class="cat">
                  <div class="key">
                    <span>Старое значение</span>
                  </div>
                  <div class="value">
                    <xsl:for-each select="$DATA//FNO_306//OLD//FNO">
                        <div><xsl:value-of select="COMBO"/></div>
                    </xsl:for-each>
                  </div>
                </div>


        </xsl:if>
        <xsl:if test="count($DATA//FNO_306//NEW//FNO) &gt; 0">

                <div class="cat">
                  <div class="key">
                    <span>Новое значение</span>
                  </div>
                  <div class="value">
                    <xsl:for-each select="$DATA//FNO_306//NEW//FNO">
                        <div><xsl:value-of select="COMBO"/></div>
                    </xsl:for-each>
                  </div>
                </div>


        </xsl:if>
    </layout:block>

      <!-- ТФНО по 306-ПП  -->
      <layout:block>

        <layout:header>Основные виды разрешенного использования</layout:header>
        <xsl:if test="count($DATA//VRI//OLD//ROW) &gt; 0">

                <div class="cat">
                  <div class="key">
                    <span>Старое значение</span>
                  </div>
                  <div class="value">
                    <xsl:for-each select="$DATA//VRI//OLD//ROW">
                        <div><xsl:value-of select="COMBO"/></div>
                    </xsl:for-each>
                  </div>
                </div>


        </xsl:if>
        <xsl:if test="count($DATA//VRI//NEW//ROW) &gt; 0">

                <div class="cat">
                  <div class="key">
                    <span>Новое значение</span>
                  </div>
                  <div class="value">
                    <xsl:for-each select="$DATA//VRI//NEW//ROW">
                        <div><xsl:value-of select="COMBO"/></div>
                    </xsl:for-each>
                  </div>
                </div>


        </xsl:if>
    </layout:block>


      <!-- Информация об измененном документе  -->
      <layout:block>

        <layout:header>Измененный документ</layout:header>


      <xsl:if test="//gbu:DocumentToCorrect/gbu:DocumentID != ''">

        <div class="cat">
            <div class="key">
              <span>Номер измененного документа</span>
            </div>

                    <div class="value">
              <a>
                <xsl:attribute name="href">
                  <xsl:text>getCardHtml.action?cardId=CARD$DOC_REDIRECT&amp;documentId=</xsl:text>
                  <xsl:value-of select="//gbu:DocumentToCorrect/gbu:DocumentID"/>
                </xsl:attribute>
                  <xsl:choose>
                     <xsl:when test="//gbu:DocumentToCorrect/gbu:DocumentNumber != ''">
                     <xsl:value-of select="//gbu:DocumentToCorrect/gbu:DocumentNumber"/>
                     </xsl:when>
                     <xsl:otherwise>
                     <xsl:value-of select="'Без номера'"/>
                    </xsl:otherwise>
                  </xsl:choose>
              </a>
            </div>
        </div>

        <layout:item format="date" label="Дата измененного документа" value="//gbu:DocumentToCorrect/gbu:DocumentDate"/>

        </xsl:if>


       <xsl:if test="//gbu:DocumentToCorrect/gbu:DocumentID = ''">

         <layout:item format="text" label="Номер имитируемого документа" value="//gbu:DocumentToCorrect/gbu:DocumentNumber"/>
         <layout:item format="date" label="Дата имитируемого документа" value="//gbu:DocumentToCorrect/gbu:DocumentDate"/>

       </xsl:if>


      </layout:block>

      <layout:block>

      <layout:header>Сведения об операторе</layout:header>
        <layout:item format="text" label="Логин оператора" value="//cfm:Login"/>
        <layout:item format="text" label="ФИО оператора" value="//cfm:UserName"/>
        <layout:item format="text" label="Дата редактирования" value="//cfm:EditDate"/>


      </layout:block>



    </xsl:variable>








     <!-- **************************** Основной темплейт ******************************** -->
    <xsl:template match="/">

        <xsl:call-template name="Context.setNamespace">
            <xsl:with-param name="namespacePrefix">gbu</xsl:with-param>
            <xsl:with-param name="namespaceURI">http://xmlns.oracle.com/MSG_GBU_doc</xsl:with-param>
        </xsl:call-template>

        <xsl:call-template name="Context.setNamespace">
            <xsl:with-param name="namespacePrefix">cfm</xsl:with-param>
            <xsl:with-param name="namespaceURI">http://xmlns.oracle.com/COMMON_FORM</xsl:with-param>
        </xsl:call-template>

        <xsl:call-template name="pageBuilder">
            <xsl:with-param name="data" select="/"/>
            <xsl:with-param name="layout" select="$LAYOUT"/>
        </xsl:call-template>
        <xml style="display: none">
            <xsl:copy-of select="$DATA"/>
        </xml>
    </xsl:template>
<!-- Шаблон описания элементов для формы -->
    {B{CARD$HTML_TEMPLATE}E}

</xsl:stylesheet>






<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:layout="URN:html-form-layout:v0.1" xmlns="http://www.w3.org/1999/xhtml" xmlns:ex2="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLTExtension" xmlns:ctx="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLDataContext" xmlns:gbu="http://xmlns.oracle.com/MSG_GBU_doc">

    <xsl:output method="html" indent="yes" omit-xml-declaration="yes" undeclare-prefixes="yes" exclude-result-prefixes="#all"/>

     <xsl:variable name="DOCUMENT_INFO">
                    <layout:hidden xmlTag="DocumentType" value="/ROOT/DocumentType"/>

                    <layout:simple-field label="Номер" class="medium" required="0">
                        <layout:edit type="TEXT" xmlTag="DocumentNumber" value="/ROOT/NewDocumentDetails_Number"/>
                        <label>Дата</label>
                        <layout:edit type="DATE" xmlTag="DocumentDate" value="/ROOT/NewDocumentDetails_Date"/>
                    </layout:simple-field>

                       <layout:hiddenSection>
              		     <layout:simple-field label="ID документа" class="full" required="0">
                         <layout:edit type="TEXT" xmlTag="DocumentID" value="/ROOT/DocumentID"/>
                         </layout:simple-field>
                  </layout:hiddenSection>



     </xsl:variable>

       <xsl:variable name="TEPS">
        <div xmlTag="Powers">
    <!-- ***************** ТЭПы начало ********************* -->
                    <!--<layout:table class="test" style="width:100%;" add="1" move="0">-->
                    <layout:table style="width:100%;" add="1" move="0">
                        <layout:header>
                          <layout:cell name="ТЭП" width="310px"/>
                          <layout:cell name="Текущее значение" width="130px"/>
                        <!--  <layout:cell name="знач. план." width="130px"/>    -->
                          <layout:cell name="Новое значение" width="130px"/>
                          <layout:cell name="Примечание" width="350px"/>
                        </layout:header>

                      <layout:body  value="/ROOT/Powers/gbu:Powers">
                        <layout:cell>
                          <layout:edit type="TEXT" style="width:300px;" xmlTag="PowerName" readonly="//PARAMETER_MAP//TEP_NAME" value="gbu:PowerName"/>
                        </layout:cell>
                          <!--
                           <layout:cell>
                              <layout:edit type="TEXT" style="width:120px;" xmlTag="PowerValuePlan" value="gbu:PowerValuePlan"/>
                            </layout:cell>   -->
                            <layout:cell>
                              <layout:edit type="TEXT" style="width:120px;" xmlTag="PowerValueOld" readonly="//PARAMETER_MAP//TEPVAL" value="gbu:PowerVal"/>
                            </layout:cell>
                            <layout:cell>
                              <layout:edit type="TEXT" style="width:120px;" xmlTag="PowerValueFact" value="gbu:PowerValueFact"/>
                            </layout:cell>
                            <layout:cell>
                              <layout:edit type="TEXT" style="width:340px;" xmlTag="PowerComment" value="gbu:PowerComment"/>
                            </layout:cell>
                        </layout:body>

                      </layout:table>
            <layout:simple-field label=" " class="" required="0">
                <layout:checkbox forceCheckbox="1" label="Не установлено" value="gbu:PowerNotSet" valueChecked="1" xmlTag="PowerNotSet"/>
            </layout:simple-field>

            <layout:hint visible="//PARAMETER_MAP//TEPVAL">Основание: <xsl:value-of select="//CURRENT_DOC//TYPE_NAME"/> № <xsl:value-of select="//CURRENT_DOC//DOC_NUM"/> от <xsl:value-of select="//CURRENT_DOC//DOC_DATE"/></layout:hint>

        </div>
                    <!-- ***************** ТЭПы конец ********************* -->
  </xsl:variable>


     <xsl:variable name="DATA" xmlns="">
      <ROOT>
        <xsl:copy-of select="/ROOT/*"/>
        <NewDocumentDetails_Date>
      <xsl:value-of select="//SYS//SYS_DATE"/>

        </NewDocumentDetails_Date>

    <!-- вычисление номера нового документа по параметру в ссылке -->
    <NewDocumentDetails_Number>
      <xsl:choose>
        <xsl:when test="exists(//PARAMETER_MAP//DOC_NUMBER)">
        <xsl:value-of select="//PARAMETER_MAP//DOC_NUMBER"/>
        </xsl:when>
        <xsl:otherwise>
        <xsl:value-of select="//CURRENT_DOC//DOC_NUM"/>
        </xsl:otherwise>
      </xsl:choose>
    </NewDocumentDetails_Number>

    <!-- вычисление типа документа по параметру в ссылке -->
    <DocumentType>
      <xsl:choose>
        <xsl:when test="exists(//PARAMETER_MAP//DOC_TYPE_ID)">
        <xsl:value-of select="//PARAMETER_MAP//DOC_TYPE_ID"/>
        </xsl:when>
        <xsl:otherwise>
        <xsl:value-of select="//CURRENT_DOC//TYPE_ID"/>
        </xsl:otherwise>
      </xsl:choose>
    </DocumentType>

        <!-- вычисление ID документа по параметру в ссылке  -->


    <DocumentID>
      <xsl:choose>
        <xsl:when test="exists(//PARAMETER_MAP//DOC_KEY)">
        <xsl:value-of select="//PARAMETER_MAP//DOC_KEY"/>
        </xsl:when>
        <xsl:otherwise>
        <xsl:value-of select="//CURRENT_DOC//DOC_KEY"/>
        </xsl:otherwise>
      </xsl:choose>
    </DocumentID>

    <!-- вычисление ТЭПа по параметру в ссылке  -->
    <Powers>
      <gbu:Powers>
        <gbu:PowerName><xsl:value-of select="//PARAMETER_MAP//TEP_NAME"/></gbu:PowerName>
        <gbu:PowerVal><xsl:value-of select="//PARAMETER_MAP//TEPVAL"/></gbu:PowerVal>
      </gbu:Powers>
    </Powers>
      </ROOT>
    </xsl:variable>

    <xsl:variable name="LAYOUT">


        <layout:form actionId="RS$GBU_DOC_LOW$FRM" xmlTag="DocContent" xmlNS="http://xmlns.oracle.com/MSG_GBU_doc">

            <layout:hidden name="SOURCE_DOC_ID" value="//cfm:SourceDocID"/>
            <layout:hidden name="DOC_ID" xmlTag="DocId" value="//GBU_DOC_ID//DOCID"/>


            <input type="hidden" name="PROVIDER_CODE" value="ГБУ"/>
            <input type="hidden" name="FORM_CODE" value="GBU_CorrectDoc"/>

            <layout:header>Корректировка ТЭПов документа оператором Системы</layout:header>


      <layout:Section xmlTag="DocumentToCorrect">
        <xsl:copy-of select="$DOCUMENT_INFO"/>
      </layout:Section>

        <layout:simple-field label=" " class="full" required="0">
          <label style="width:50px;"> </label>
        </layout:simple-field>

        <xsl:copy-of select="$TEPS"/>


            <span class="clearBlock"></span>
            <div class="formSpace"></div>
            <div class="clear"></div>
            <input class="cancel" type="reset" value="Отмена"/>
            <input class="submit" type="submit" value="Сохранить"/>
            <div class="clear padinal"></div>

        </layout:form>

    </xsl:variable>


    {B{FRM$XML_LAYOUT$V0}E}

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
            <xsl:with-param name="data" select="$DATA"/>
            <xsl:with-param name="layout" select="$LAYOUT"/>
        </xsl:call-template>

    <xml style="display: none">
  <xsl:copy-of select="*"/>
</xml>

    </xsl:template>

</xsl:stylesheet>

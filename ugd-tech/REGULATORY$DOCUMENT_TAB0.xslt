<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:layout="URN:html-form-layout:v0.1" xmlns="http://www.w3.org/1999/xhtml" xmlns:ex2="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLTExtension" xmlns:ctx="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLDataContext" xmlns:doc="http://xmlns.oracle.com/MSG_NDD1_1v2">

    <xsl:output method="html" indent="yes" omit-xml-declaration="yes" undeclare-prefixes="yes" exclude-result-prefixes="#all"/>

    <xsl:variable name="LAYOUT">

      <layout:block>
           <!--pre>
      <xsl:value-of select="//doc:Body"/>
      </pre-->

       <!--layout:element value="//doc:Body" type="nl2br" class="documentText"/-->
      </layout:block>

      <div class="documentContainer">
        <div class="documentText">
          <xsl:choose>
            <xsl:when test="string-length(//doc:Body)&gt;1 and //doc:ISPRE='false'">
              <div id="RD">
                <xsl:value-of select="//doc:Body" disable-output-escaping="yes"/>
              </div>
            </xsl:when>
            <xsl:when test="string-length(//doc:Body)&gt;1 and //doc:ISPRE='true'">
                    <!--pre class="doc_ndd_body">
                      <xsl:value-of select="//doc:Body" disable-output-escaping="yes"/>
                    </pre-->

                    <div class="preWarpped"><xsl:value-of select="//doc:Body" disable-output-escaping="yes"/></div>
            </xsl:when>
            <xsl:when test="string-length(//doc:Body)&gt;1">
                    <!--xsl:call-template name="nl2br2">
                        <xsl:with-param name="s" select="//doc:Body"/>
                      </xsl:call-template-->
                    <!--pre class="doc_ndd_body">
                      <xsl:value-of select="//doc:Body" disable-output-escaping="yes"/>
                    </pre-->
                    <div class="preWarpped"><xsl:value-of select="//doc:Body" disable-output-escaping="yes"/></div>
            </xsl:when>
            <xsl:otherwise>

              <div class="doc_ndd_table doc_ndd_body doc_ndd_header">
                <xsl:value-of select="translate(//doc:Subject,
                'абвгдежзиклмнопрстуфхцчшщьыъэюяabcdefghijklmnopqrstuvwxyz',
                'АБВГДЕЖЗИКЛМНОПРСТУФХЦЧШЩЬЫЪЭЮЯABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
              </div>
              <div class="doc_ndd_absent">
                <xsl:text>Текст документа отсутствует</xsl:text>
              </div>
            </xsl:otherwise>
          </xsl:choose>
        </div>
      </div>
     </xsl:variable>

    <!-- **************************** Основной темплейт ******************************** -->


   <xsl:template name="nl2br2">
    <xsl:param name="str"/>
    <xsl:choose>
      <xsl:when test="contains($str,'
')">
        <xsl:value-of select="substring-before($str,'
')"/>
        <xsl:if test="contains($str,'
')">
          <xsl:text> </xsl:text>
          <br/>
          <xsl:call-template name="nl2br2">
            <xsl:with-param name="str" select="substring-after($str,'
')"/>
          </xsl:call-template>
        </xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$str"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>


    <xsl:template match="/">
        <style>
          .documentText {
            /* position: relative;
            float: right;
            right: 50%; */
            display: inline-block;
            text-align: left;
            font-size: 15px;
          }
          .documentContainer {
            text-align: center;
          }
          .documentText div:not(.preWarpped) {
              min-height: 10px;
              position: relative;
              right: -50%;
              font-family: Courier New;
          }
          .preWarpped{
            white-space: pre-wrap;
          }
        </style>
        <xsl:call-template name="Context.setNamespace">
            <xsl:with-param name="namespacePrefix">doc</xsl:with-param>
            <xsl:with-param name="namespaceURI">http://xmlns.oracle.com/MSG_NDD1_1v2</xsl:with-param>
        </xsl:call-template>


        <xsl:call-template name="pageBuilder">
            <xsl:with-param name="data" select="/"/>
            <xsl:with-param name="layout" select="$LAYOUT"/>
        </xsl:call-template>

    </xsl:template>

    <!-- Шаблон описания элементов для формы -->
    {B{CARD$HTML_TEMPLATE}E}

</xsl:stylesheet>

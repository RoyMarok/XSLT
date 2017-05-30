    <!-- section ********************************
    <layout:iterator xmlns:layout="URN:html-form-layout:v0.1"
        select="XPATH">
       повторяющийся блок
    </layout:iterator>
      *******************************************-->


    <xsl:template match="layout:iterator" xmlns:layout="URN:html-form-layout:v0.1" xmlns:ex2="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLTExtension">
        <xsl:comment>********************** SECTION:START *******************</xsl:comment>
        <xsl:variable name="this" select="."/>

        <!-- содержимое -->
        <xsl:variable name="content" select="*"/>
        

        <xsl:for-each select="ctx:extract(@select)">
                    
          <!-- @todo add XML generation flags -->
          <xsl:call-template name="layoutXMLInfo">
            <xsl:with-param name="source" select="$this"/>
          </xsl:call-template>
                
          <xsl:call-template name="Context.execute">
            <xsl:with-param name="contextData" select="."/>
            <xsl:with-param name="markup" select="$content"/>
          </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    
    <!-- Использование:
    <layout:extract select="XPATH">
      Получить значение
    </layout:extract>
    -->
    <xsl:template match="layout:extract" xmlns:layout="URN:html-form-layout:v0.1">

        <xsl:value-of select="ctx:extract(@select)"/>
                    
    </xsl:template>

    <!-- if ********************************
    <layout:if test="//PARAM//VALUE" operator="!eq" value="true">
      true  
    </layout:if>
      *******************************************-->
    <xsl:template match="layout:if" xmlns:layout="URN:html-form-layout:v0.1"> 

      <xsl:choose>

          <xsl:when test="@operator = 'eq'">
            <xsl:if test="ctx:extract(@test) = @value">
              <xsl:apply-templates/>
            </xsl:if>
          </xsl:when>

          <xsl:when test="@operator = '!eq'">
            <xsl:if test="ctx:extract(@test) != @value">
              <xsl:apply-templates/>
            </xsl:if>
          </xsl:when>

          <xsl:when test="@operator = '&gt;'">
            <xsl:if test="ctx:extract(@test) &gt; @value">
              <xsl:apply-templates/>
            </xsl:if>
          </xsl:when>
          
          <xsl:when test="@operator = '&gt;='">
            <xsl:if test="ctx:extract(@test) &gt;= @value">
              <xsl:apply-templates/>
            </xsl:if>
          </xsl:when>
          
          <xsl:when test="@operator = '&lt;'">
            <xsl:if test="ctx:extract(@test) &gt; @value">
              <xsl:apply-templates/>
            </xsl:if>
          </xsl:when>
          
          <xsl:when test="@operator = '&lt;='">
            <xsl:if test="ctx:extract(@test) &gt;= @value">
              <xsl:apply-templates/>
            </xsl:if>
          </xsl:when>

          <xsl:otherwise>
            <xsl:if test="ctx:extract(@test) != ''">
              <xsl:apply-templates/>
            </xsl:if>
          </xsl:otherwise>
          
      </xsl:choose>      

    </xsl:template>
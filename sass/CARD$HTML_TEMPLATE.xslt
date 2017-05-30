
    <!-- ********************************* COMMON$FRM_LAYOUT$V0 начало ******************************** -->

    <!-- ************* context operating tamplates ****************** -->
    <xsl:decimal-format name="ik_format" decimal-separator="," grouping-separator=" "/>

    <xsl:template name="Context.setNamespace">
        <xsl:param name="contextName" required="no"/>
        <xsl:param name="namespacePrefix"/>
        <xsl:param name="namespaceURI"/>
        <xsl:variable name="ctx_1" select="ctx:addContextNamespace($contextName, $namespacePrefix, $namespaceURI)"/>
    </xsl:template>

    <xsl:template name="Context.execute">
        <xsl:param name="contextName" required="no"/>
        <xsl:param name="contextData" required="yes"/>
        <xsl:param name="markup" required="yes"/>
        <xsl:variable name="ctx_1" select="ctx:setContext($contextName, $contextData)"/>
        <xsl:apply-templates select="$markup"/>
        <xsl:variable name="ctx_2" select="ctx:releaseContext($contextName)"/>
    </xsl:template>

    <!-- Вспомогательный шаблон для форматирования -->
      {B{CARD$TEMPLATE}E}






    <!--  Шаблон построения галереи -->
      {B{CARD$TEMPLATE$GALLERY}E}


      {B{CARD$HTML_TEMPLATE_2}E}


    <!-- ************************************************************ -->
    <!-- главный темплейт -->
    <xsl:template name="pageBuilder">
        <xsl:param name="data" required="yes"/>
        <xsl:param name="layout" required="yes"/>
                 <!--  Стили карточки -->
                {B{CARD$BODY_STYLE}E}

                 <!-- Вспомогательные скрипты для карточеи -->
                {B{CARD$BODY_SCRIPT}E}

                {B{CARD$TEMPLATE$GALLERY_SCRIPT}E}
                {B{CARD$GALLERY_STYLE}E}

                <div id="objCard">

                  <!--  Вызов шаблона построения галереи -->
                  <!--  левая часть карточки  -->
                  {B{CARD$TEMPLATE$GALLERY$CALL}E}

                  <!-- правая часть карточки -->
                  <div class="content_block">

                    <div class="content">

                      <xsl:call-template name="Context.execute">
                        <xsl:with-param name="contextData" select="$data"/>
                        <xsl:with-param name="markup" select="$layout">
                      </xsl:with-param>
                      </xsl:call-template>

                    </div>
                  </div>
                </div>

    </xsl:template>


    <!-- header ********************************
    <layout:header xmlns:layout="URN:html-form-layout:v0.1">
      text
      class="text"
      style="color:red; text-align:center"
    </layout:header>
      *******************************************-->
    <xsl:template match="layout:header" xmlns:layout="URN:html-form-layout:v0.1">
         <p class="sectionTitle {@class}" style="{@style}"><xsl:apply-templates/></p>
    </xsl:template>

    <!-- if ********************************
    <layout:if test="//PARAM//VALUE" operator="!eq" value="true">
      true
    </layout:if>
      *******************************************-->
    <xsl:template match="layout:if" xmlns:layout="URN:html-form-layout:v0.1">
      <xsl:variable name="test" select="normalize-space(ctx:extract(@test))"/>
      <xsl:choose>

          <xsl:when test="@operator = 'eq'">
            <xsl:if test="$test = @value">
              <xsl:apply-templates/>
            </xsl:if>
          </xsl:when>

          <xsl:when test="@operator = '!eq'">
            <xsl:if test="$test != @value">
             <xsl:apply-templates/>
            </xsl:if>
          </xsl:when>

          <xsl:when test="@operator = '&gt;'">
            <xsl:if test="$test &gt; '@value'">
              <xsl:apply-templates/>
            </xsl:if>
          </xsl:when>

          <xsl:when test="@operator = '&gt;='">
            <xsl:if test="$test &gt;= '@value'">
              <xsl:apply-templates/>
            </xsl:if>
          </xsl:when>

          <xsl:when test="@operator = '&lt;'">
            <xsl:if test="$test &gt; '@value'">
              <xsl:apply-templates/>
            </xsl:if>
          </xsl:when>

          <xsl:when test="@operator = '&lt;='">
            <xsl:if test="$test &gt;= '@value'">
              <xsl:apply-templates/>
            </xsl:if>
          </xsl:when>

          <xsl:otherwise>
            <xsl:if test="$test != ''">
              <xsl:apply-templates/>
            </xsl:if>
          </xsl:otherwise>

      </xsl:choose>

    </xsl:template>

    <!-- text ********************************
    <layout:header xmlns:layout="URN:html-form-layout:v0.1">
      text
      class="text"
      style="style='color:red'"
    </layout:header>
      *******************************************-->
    <xsl:template match="layout:text" xmlns:layout="URN:html-form-layout:v0.1">

      <xsl:variable name="value">
        <xsl:choose>
          <xsl:when test="@format = 'date' and @format">
             <xsl:call-template name="date_transform">
                <xsl:with-param name="old_date" select="@value"/>
             </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="@value"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>

         <xsl:if test="$value != ''">
            <span class="{@class}" style="{@style}">
                <xsl:value-of select="$value"/>
                <xsl:if test="string-length(text()) = 0">
                  <xsl:text> </xsl:text>
                </xsl:if>
            </span>
         </xsl:if>

         <xsl:if test="string-length(text()) > 0">
          <span class="{@class}" style="{@style}">
              <xsl:value-of select="text()" disable-output-escaping="yes"/>
          </span>
         </xsl:if>
    </xsl:template>


    <!-- table  *******************************************-->
    <!-- таблица ********************************
        <layout:table class="test" style="width:100px">
          <layout:header>
            <layout:cell name="test1" class="text" style="width:120px;"/>
             <layout:cell name="test1" />
           ..............
          </layout:header>
          <layout:body value="//SAMPLE_LIST//ROW">
            <layout:cell class="text" style="width:120px;" value="VALUE"/>
            <layout:cell value="VALUE">
           ...............
          </layout:body>
        </layout:table>

    *******************************************-->
    <xsl:template match="layout:table" xmlns:layout="URN:html-form-layout:v0.1">
        <xsl:variable name="ROW" select="layout:body"/>
        <xsl:if test="ctx:extract(layout:body/@value) != ''">
          <table class="tableCardStyle {@class}" style="{@style}">
              <thead>
                   <tr>
                      <xsl:for-each select="layout:header/layout:cell">
                          <th class="{@class}" style="{@style}"><xsl:value-of select="@name"/></th>
                      </xsl:for-each>
                   </tr>
              </thead>
              <tbody>
                   <xsl:for-each select="ctx:extract(layout:body/@value)">
                      <tr>
                          <xsl:variable name="CELL" select="."/>

                          <xsl:for-each select="$ROW/layout:cell">
                            <td class="{@class}" style="{@style}">
                              <xsl:choose>
                                 <xsl:when test="@type = 'break'">
                                  <xsl:call-template name="nl2br">
                                    <xsl:with-param name="s">
                                      <xsl:call-template name="Context.execute">
                                        <xsl:with-param name="contextData" select="$CELL"/>
                                        <xsl:with-param name="markup" select="*"/>
                                      </xsl:call-template>
                                    </xsl:with-param>
                                  </xsl:call-template>
                                </xsl:when>

                                <xsl:otherwise>
                                   <xsl:call-template name="Context.execute">
                                      <xsl:with-param name="contextData" select="$CELL"/>
                                      <xsl:with-param name="markup" select="*"/>
                                    </xsl:call-template>
                                </xsl:otherwise>
                              </xsl:choose>


                            </td>
                          </xsl:for-each>
                      </tr>
                  </xsl:for-each>
              </tbody>
          </table>
        </xsl:if>
    </xsl:template>


    <!-- section ********************************
    <layout:section xmlns:layout="URN:html-form-layout:v0.1">
    text
    </layout:section>
      *******************************************-->
    <xsl:template match="layout:section" xmlns:layout="URN:html-form-layout:v0.1">
        <xsl:variable select="*" name="sectionLayout"/>
        <xsl:variable select="@select" name="Section"/>

        <xsl:for-each select="ctx:extract($Section)">
           <xsl:call-template name="Context.execute">
              <xsl:with-param name="contextData" select="."/>
              <xsl:with-param name="markup" select="$sectionLayout"/>
           </xsl:call-template>
        </xsl:for-each>
    </xsl:template>


    <!-- block ********************************
    <layout:block xmlns:layout="URN:html-form-layout:v0.1">

    </layout:block>
    *******************************************-->
    <xsl:template match="layout:block" xmlns:layout="URN:html-form-layout:v0.1">
         <div class="block {@class}">
              <xsl:apply-templates/>
         </div>
    </xsl:template>



    <!-- link ********************************
    <layout:link xmlns:layout="URN:html-form-layout:v0.1">
        *@href="ссылка"
         @type="text" - используется если в ссылке передается text
         @class = "класс"
         @style = "стиль"
    </layout:link>
    *******************************************-->
    <xsl:template match="layout:link" xmlns:layout="URN:html-form-layout:v0.1">
         <xsl:choose>
          <xsl:when test="@href != '' and @type='text'">
            <a href="{@href}" class="{@class}" style="{@style}">
              <xsl:apply-templates/>
            </a>
          </xsl:when>
          <xsl:when test="string-length(ctx:extract(@href)) > 0">
           <a href="{ctx:extract(@href)}" class="{@class}" style="{@style}">
              <xsl:apply-templates/>
            </a>
          </xsl:when>
          <xsl:otherwise>
            <xsl:apply-templates/>
          </xsl:otherwise>
         </xsl:choose>
    </xsl:template>


    <!-- line ********************************
    <layout:line xmlns:layout="URN:html-form-layout:v0.1" />
    </layout:line>
      *******************************************-->
    <xsl:template match="layout:line" xmlns:layout="URN:html-form-layout:v0.1">
        <hr/>
    </xsl:template>

    <!-- @format ********************************
    Определение форма элемента
      *******************************************-->
      <!-- *************************************** -->
      <!-- Если есть формат, то вызываем шаблон переопределения -->
      <!-- *** format="date"  - преобразование в дату -->
      <!-- *** format="number"  - преобразование в число -->
      <!-- *************************************** -->
     <xsl:template name="format">
      <xsl:param name="value"/>
      <xsl:param name="format"/>

      <xsl:choose>
        <xsl:when test="$format = 'date'">
           <xsl:call-template name="date_transform">
              <xsl:with-param name="old_date" select="ctx:extract($value)"/>
           </xsl:call-template>
        </xsl:when>
       <xsl:when test="$format = 'nl2br'">
           <xsl:call-template name="nl2br">
              <xsl:with-param name="s" select="ctx:extract($value)"/>
           </xsl:call-template>
        </xsl:when>
        <xsl:when test="$format = 'number'">
           <xsl:call-template name="number_float">
              <xsl:with-param name="str" select="ctx:extract($value)"/>
           </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="ctx:extract($value)"/>
        </xsl:otherwise>
      </xsl:choose>

     </xsl:template>



    <!-- ********************************* COMMON$FRM_LAYOUT$V0 конец ******************************** -->

    <xsl:template name="layoutXMLInfo">
      <xsl:param name="source"/>
      <xsl:if test="./@xmlTag">
        <xsl:attribute name="xfTag"><xsl:value-of select="./@xmlTag"/></xsl:attribute>
      </xsl:if>
      <xsl:if test="./@xmlNS">
        <xsl:attribute name="xfNS"><xsl:value-of select="./@xmlNS"/></xsl:attribute>
      </xsl:if>
    </xsl:template>

    <!--/xsl:stylesheet-->

   <xsl:template match="layout:copy" xmlns:layout="URN:html-form-layout:v0.1">
        <xsl:copy-of select="./*"/>
    </xsl:template>



    <xsl:template match="*">
        <xsl:param name="field_required">0</xsl:param>
        <xsl:copy>
            <!-- @todo add XML generation flags -->
            <xsl:call-template name="layoutXMLInfo">
              <xsl:with-param name="source" select="."/>
            </xsl:call-template>

            <xsl:for-each select="@*">
                <xsl:copy/>
            </xsl:for-each>
            <xsl:apply-templates>
                <xsl:with-param name="field_required" select="$field_required"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
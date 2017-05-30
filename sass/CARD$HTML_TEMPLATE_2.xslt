    <!-- element ********************************
    <layout:block xmlns:layout="URN:html-form-layout:v0.1">
      <layout:element type="line" class="test"  value="//doc:OrgNameFull"/>
    </layout:element>
    *******************************************-->
    <xsl:template match="layout:element" xmlns:layout="URN:html-form-layout:v0.1">

        <!-- *************************************** -->
        <!-- Если есть формат, то вызываем шаблон переопределения -->
        <!-- *** format="date"  - преобразование в дату -->
        <!-- *** format="number"  - преобразование в число -->
        <!-- *************************************** -->

        <xsl:variable name="value">
            <xsl:choose>
                <xsl:when test="@format != '' and @format">
                  <xsl:call-template name="format">
                    <xsl:with-param name="value" select="@value"/>
                    <xsl:with-param name="format" select="@format"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:when test="@type = 'text' or @type = 'custom'">
                  <xsl:value-of select="@value"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="ctx:extract(@value)"/>
                </xsl:otherwise>
            </xsl:choose>
         </xsl:variable>

         <!-- *************************************** -->
         <!-- Определяем тип шаблона -->
         <!-- *** type="block"  - блочный элемент -->
         <!-- *** type="line"  - строчный элемент -->
         <!-- *** type="link"  href="путь" - строчный элемент -->
         <!-- *************************************** -->

         <xsl:choose>

            <xsl:when test="@type='block'">
              <div class="{@class}">
                <xsl:if test="text() != ''">
                  <span>
                    <xsl:value-of select="text()" disable-output-escaping="yes"/>
                  </span>
                </xsl:if>
                <span class="{@class}" style="{@style}">
                  <xsl:value-of select="$value"  disable-output-escaping="yes"/>
                </span>
              </div>
            </xsl:when>

            <xsl:when test="@type='date'">
                <xsl:if test="text() != ''">
                  <span>
                    <xsl:value-of select="text()" disable-output-escaping="yes"/>
                  </span>
                </xsl:if>
                <span  class="{@class}" style="{@style}">
                  <xsl:call-template name="date_transform">
                    <xsl:with-param name="old_date" select="$value"/>
                  </xsl:call-template>
                  <xsl:text> </xsl:text>
                </span>
            </xsl:when>

            <xsl:when test="@type='link' and @href != ''">
              <xsl:if test="text() != ''">
                  <span>
                    <xsl:value-of select="text()" disable-output-escaping="yes"/>
                  </span>
              </xsl:if>
              <a class="{@class}" style="{@style}" href="{@href}">
                <xsl:value-of select="$value"/>
                <xsl:text> </xsl:text>
              </a>
            </xsl:when>

            <xsl:when test="@type='line'">
              <xsl:if test="text() != ''">
                  <span>
                    <xsl:value-of select="text()" disable-output-escaping="yes"/>
                  </span>
              </xsl:if>
              <span class="{@class}" style="{@style}">
                <xsl:value-of select="$value" disable-output-escaping="yes"/>
                <xsl:text> </xsl:text>
              </span>
            </xsl:when>

            <xsl:when test="@type='nl2br'">
              <xsl:if test="text() != ''">
                  <span>
                    <xsl:value-of select="text()" disable-output-escaping="yes"/>
                  </span>
              </xsl:if>
              <div class="{@class}" style="{@style}">
                <xsl:call-template name="nl2br">
                  <xsl:with-param name="s" select="ctx:extract(@value)"/>
               </xsl:call-template>
              </div>
            </xsl:when>

            <xsl:when test="@type='custom'">
              <xsl:if test="@tag != ''">
                <xsl:element name="{@tag}">
                    <xsl:attribute name="class">
                      <xsl:value-of select="@class" />
                    </xsl:attribute>
                    <xsl:attribute name="style">
                      <xsl:value-of select="@style" />
                    </xsl:attribute>



                    <xsl:apply-templates/>
                </xsl:element>
              </xsl:if>
            </xsl:when>

            <xsl:when test="@type='text'">
              <xsl:if test="text() != ''">
                  <span>
                    <xsl:value-of select="text()" disable-output-escaping="yes"/>
                  </span>
              </xsl:if>
              <span class="{@class}" style="{@style}">
                <xsl:value-of select="@value"/>
              </span>
            </xsl:when>
            <xsl:otherwise>
              <span>
                  <xsl:value-of select="text()" disable-output-escaping="yes"/>
              </span>
              <span class="{@class}" style="{@style}">
                <xsl:value-of select="$value"/>
                <xsl:text> </xsl:text>
              </span>
            </xsl:otherwise>
         </xsl:choose>

    </xsl:template>




     <!-- item ********************************
    <layout:item xmlns:layout="URN:html-form-layout:v0.1">
      type="date | " - необязательный параметр
      label="LABEL"
      value="VALUE"
      type="text"
    </layout:item>
    <layout:item type="text" label="Застройщик (арендатор)" value="//doc:OrgNameFull">
        <layout:element type="line" value="//doc:OrgNameFull"/>
        <layout:element type="block" value="//doc:OrgNameFull"/>
    </layout:item>
     *******************************************-->
    <xsl:template match="layout:item" xmlns:layout="URN:html-form-layout:v0.1">
        <xsl:variable select="*" name="sectionLayout"/>


       <xsl:variable name="label">
        <!-- проверяем это xPath или текст -->
        <xsl:choose>
          <!-- если xPath  -->
          <xsl:when test="@type='text'">
            <xsl:value-of select="@label"/>
          </xsl:when>
          <!-- если xPath для лейбла пуст, то выводим текст из emptyLabelText -->
          <xsl:when test="(string-length(ctx:extract(@label)) = 0) and (@emptyLabelText)">
            <xsl:value-of select="@emptyLabelText"/>
          </xsl:when>
          <xsl:when test="(string-length(ctx:extract(@label)) = 0)  and not(@emptyLabelText)">
            <xsl:value-of select="@label"/>
          </xsl:when>
          <!-- если текст -->
          <xsl:otherwise>
            <xsl:value-of select="ctx:extract(@label)"/>
          </xsl:otherwise>
        </xsl:choose>
       </xsl:variable>

       <xsl:variable name="value">
         <xsl:if test="@value != '' and ctx:extract(@value) != ''">

          <!-- *************************************** -->
          <!-- Если есть формат, то вызываем шаблон переопределения -->
          <!-- *** format="date"  - преобразование в дату -->
          <!-- *** format="number"  - преобразование в число -->
          <!-- *************************************** -->

            <xsl:choose>
                <xsl:when test="@format != '' and @format">
                  <xsl:call-template name="format">
                    <xsl:with-param name="value" select="@value"/>
                    <xsl:with-param name="format" select="@format"/>
                  </xsl:call-template>
                </xsl:when>

                <xsl:otherwise>
                  <xsl:value-of select="ctx:extract(@value)"/>
                </xsl:otherwise>
            </xsl:choose>

         </xsl:if>
       </xsl:variable>

    <xsl:choose>

    <xsl:when test="layout:link != '' ">
        <div class="cat {@class}">
          <div class="key">
            <span><xsl:value-of select="$label"/></span>
          </div>
          <div class="value" style="{@style}">
            <xsl:choose>
              <xsl:when test="@href != ''">
                <a href="{@href}" class="{@class}" style="{@style}">
                   <xsl:apply-templates select="layout:link"/>
                </a>
              </xsl:when>
              <xsl:otherwise>
                   <!--xsl:apply-templates select="layout:link"/-->
              </xsl:otherwise>
            </xsl:choose>
            <xsl:text> </xsl:text>
            <span><xsl:value-of select="@afterValue"/></span>
          </div>
        </div>
    </xsl:when>

    <xsl:when test="@select !='' and layout:element/@value != ''">
        <xsl:variable name="element" select="layout:element"/>
        <div class="cat {@class}">
          <div class="key">
            <span><xsl:value-of select="$label"/></span>
          </div>
          <div class="value" style="{@style}">
            <xsl:for-each select="ctx:extract(@select)">

                <xsl:call-template name="Context.execute">
                  <xsl:with-param name="contextData" select="."/>
                  <xsl:with-param name="markup" select="$element"/>
                </xsl:call-template>

            </xsl:for-each>
            <xsl:text> </xsl:text>
            <span><xsl:value-of select="@afterValue"/></span>
          </div>
        </div>
    </xsl:when>

    <xsl:when test="$value !='' or layout:element/@value != ''">
        <div class="cat {@class}">
          <div class="key">
            <span><xsl:value-of select="$label"/></span>
          </div>
          <div class="value" style="{@style}">
            <xsl:choose>
                <xsl:when test="@checkbox">
                  <xsl:choose>
                    <xsl:when test="$value = '1'"><img src="/portal_static/img/greenCube.png"/></xsl:when>
                    <xsl:otherwise><img src="/portal_static/img/redCube.png"/></xsl:otherwise>
                  </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="$value" disable-output-escaping="yes"/>
                  <xsl:if test="(count(layout:element) &gt; 0) and (layout:element/@value != '')">
                    <xsl:call-template name="Context.execute">
                      <xsl:with-param name="contextData" select="ctx:extract(layout:element/@value)"/>
                      <xsl:with-param name="markup" select="$sectionLayout"/>
                    </xsl:call-template>
                  </xsl:if>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:text> </xsl:text>
            <span><xsl:value-of select="@afterValue"/></span>
          </div>
        </div>
    </xsl:when>
    <xsl:when test="layout:text/text() != '' or layout:text/@value != ''">
        <div class="cat {@class}">
          <div class="key">
            <span><xsl:value-of select="@label"/></span>
          </div>
          <div class="value" style="{@style}">
             <xsl:call-template name="Context.execute">
                <xsl:with-param name="contextData" select="layout:text"/>
                <xsl:with-param name="markup" select="$sectionLayout"/>
              </xsl:call-template>
              <xsl:text> </xsl:text>
              <span><xsl:value-of select="@afterValue"/></span>
          </div>
        </div>
    </xsl:when>
    <xsl:otherwise>

    </xsl:otherwise>

      </xsl:choose>


    </xsl:template>
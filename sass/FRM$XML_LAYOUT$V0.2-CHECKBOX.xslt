    <!-- checkbox ********************************
    <layout:checkbox xmlns:layout="URN:html-form-layout:v0.1"
       valueChecked="VALUE"
       valueUnchecked="VALUE"
       labelChecked="LABEL"
       labelUnchecked="LABEL"
       value="VALUE"
       valueXPATH="XPATH"
       name="NAME"
       id="ID"
       forceCheckbox="1|0"
       label="static label value"
       labelValue="XPATH">

    ....
    </layout:checkbox>
      *******************************************-->
    <xsl:template match="layout:checkbox" xmlns:layout="URN:html-form-layout:v0.1">

        <xsl:param name="field_required">0</xsl:param>

        <xsl:variable name="value">
          <xsl:choose>
            <xsl:when test="@valueXPATH != '' ">
              <xsl:value-of select="ctx:extract(@valueXPATH)"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="@value"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>

        <xsl:variable name="label">
          <xsl:choose>
            <xsl:when test="@labelValue!=''">
              <xsl:value-of select="ctx:extract(@labelValue)"/>
              <!--xsl:value-of select="@labelValue"/-->
            </xsl:when>
            <xsl:when test="@label!=''">
              <xsl:value-of select="@label"/>
            </xsl:when>
          </xsl:choose>
        </xsl:variable>

        <xsl:variable name="name">
          <xsl:choose>
            <xsl:when test="@nameXPATH!=''">
              <xsl:value-of select="ctx:extract(@nameXPATH)"/>
            </xsl:when>
            <xsl:when test="@name!=''">
              <xsl:value-of select="@name"/>
            </xsl:when>
          </xsl:choose>
        </xsl:variable>


        <xsl:variable name="valueChecked">
            <xsl:choose>
                <xsl:when test="@valueChecked">
                    <xsl:value-of select="@valueChecked"/>
                </xsl:when>
                <xsl:when test="@valueCheckedXPATH">
                    <xsl:value-of select="ctx:extract(@valueCheckedXPATH)"/>
                </xsl:when>
                <xsl:otherwise>1</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:variable name="valueUnchecked">
            <xsl:choose>
                <xsl:when test="@valueUnchecked">
                    <xsl:value-of select="@valueUnchecked"/>
                </xsl:when>
                <xsl:otherwise>0</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:choose>
            <xsl:when test="not(@forceCheckbox) or @forceCheckbox!='1'">
                <select name="{@name}" id="{@id}" style="{@style}">
                    <!-- @todo add XML generation flags -->
                    <xsl:call-template name="layoutXMLInfo">
                      <xsl:with-param name="source" select="."/>
                    </xsl:call-template>

                <xsl:call-template name="standardControlFlags">
                    <xsl:with-param name="source" select="."/>
                    </xsl:call-template>

                    <xsl:if test="@readonly='1'">
                        <xsl:attribute name="readonly">1</xsl:attribute>
                    </xsl:if>

                    <option>
                        <xsl:if test="$value!=$valueChecked">
                            <xsl:attribute name="selected">1</xsl:attribute>
                        </xsl:if>

                        <xsl:attribute name="value">
                            <xsl:value-of select="$valueUnchecked"/>
                        </xsl:attribute>

                        <xsl:choose>
                            <xsl:when test="@labelUnchecked">
                                <xsl:value-of select="@labelUnchecked"/>
                            </xsl:when>
                            <xsl:otherwise>Нет</xsl:otherwise>
                        </xsl:choose>
                    </option>

                    <option>
                        <xsl:if test="$value=$valueChecked">
                            <xsl:attribute name="selected">1</xsl:attribute>
                        </xsl:if>

                        <xsl:attribute name="value">
                            <xsl:value-of select="$valueChecked"/>
                        </xsl:attribute>

                        <xsl:choose>
                            <xsl:when test="@labelChecked">
                                <xsl:value-of select="@labelChecked"/>
                            </xsl:when>
                            <xsl:otherwise>Да</xsl:otherwise>
                        </xsl:choose>
                    </option>


                </select>

            </xsl:when>
            <xsl:otherwise>
              <div class="checkbox-wrap">
                  <input type="checkbox" name="{@name}" id="{@id}" style="{@style}" class="{@class}">
                      <!-- @todo add XML generation flags -->
                      <xsl:call-template name="layoutXMLInfo">
                        <xsl:with-param name="source" select="."/>
                      </xsl:call-template>

                      <xsl:call-template name="standardControlFlags">
                        <xsl:with-param name="source" select="."/>
                      </xsl:call-template>

                      <xsl:if test="$value=$valueChecked">
                          <xsl:attribute name="checked">checked</xsl:attribute>
                      </xsl:if>

                      <xsl:attribute name="value">
                          <xsl:value-of select="$valueChecked"/>
                      </xsl:attribute>

                  </input>
                  <xsl:if test="$label !=''">
                    <label for="{@id}"><xsl:value-of select="$label"/></label>
                  </xsl:if>
              </div>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>
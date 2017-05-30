<!-- radio ********************************
    <layout:radio xmlns:layout="URN:html-form-layout:v0.1"
       valueChecked="value"
       valueCheckedPath="XPATH"
       value="value"
       valuePath="XPATH"
       name="NAME"
       id="ID"
       label="value"
       labelValue="value">
       labelPath="XPATH">
    ....
    </layout:radio>
      *******************************************-->

<xsl:template match="layout:radio" xmlns:layout="URN:html-form-layout:v0.1">
  <xsl:param name="field_required">0</xsl:param>

    <!--xsl:variable name="value" select="@value"/-->
    <xsl:variable name="value">
        <xsl:choose>
            <xsl:when test="@valuePath">
                <xsl:value-of select="ctx:extract(@valuePath)"/>
            </xsl:when>
            <xsl:when test="@value">
                <xsl:value-of select="@value"/>
            </xsl:when>
            <xsl:otherwise>0</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="valueChecked">
        <xsl:choose>
            <xsl:when test="@valueCheckedPath">
                <xsl:value-of select="ctx:extract(@valueCheckedPath)"/>
            </xsl:when>
            <xsl:when test="@valueChecked">
                <xsl:value-of select="@valueChecked"/>
            </xsl:when>
            <xsl:otherwise>0</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>

    <xsl:variable name="valueExtractChecked">

  <!--xsl:choose>
    <xsl:when test="@checked">
      1
    </xsl:when>
    <xsl:otherwise>0</xsl:otherwise>
  </xsl:choose-->

  <!-- Evstigneev Added 24.08.16 -->
    <xsl:choose>
        <xsl:when test="@valueChecked!='' or @valueCheckedPath!=''">
            <xsl:choose>
                <xsl:when test="$value=$valueChecked">1</xsl:when>
                <xsl:otherwise>
                    <xsl:choose>
                      <xsl:when test="@checked">
                        <xsl:choose>
                            <xsl:when test="@checked=1">1</xsl:when>
                            <xsl:otherwise>0</xsl:otherwise>
                        </xsl:choose>
                      </xsl:when>
                      <xsl:otherwise>0</xsl:otherwise>
                    </xsl:choose>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:when>
        <xsl:otherwise>
            <xsl:choose>
              <xsl:when test="@checked">
                <xsl:choose>
                    <xsl:when test="@checked=1">1</xsl:when>
                    <xsl:otherwise>0</xsl:otherwise>
                </xsl:choose>
              </xsl:when>
              <xsl:otherwise>0</xsl:otherwise>
            </xsl:choose>
        </xsl:otherwise>
    </xsl:choose>

  </xsl:variable>
<!--div style="display: none;">
  <xsl:choose>
        <xsl:when test="@valueChecked!='' or @valueCheckedPath!=''">
            <xsl:text><script>console.log('$valueChecked exist')</script></xsl:text>
            <xsl:choose>
                <xsl:when test="$value=$valueChecked">$value=$valueChecked</xsl:when>
                <xsl:otherwise>$value!=$valueChecked
                  <xsl:choose>
              <xsl:when test="@checked">
                <xsl:choose>
                    <xsl:when test="@checked=1">@checked=1</xsl:when>
                    <xsl:otherwise>@checked=!1</xsl:otherwise>
                </xsl:choose>
              </xsl:when>
              <xsl:otherwise>@checked NOT</xsl:otherwise>
            </xsl:choose>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:when>
        <xsl:otherwise>
            <xsl:text><script>console.log('$valueChecked NOT exist')</script></xsl:text>
            <xsl:choose>
              <xsl:when test="@checked">
                <xsl:choose>
                    <xsl:when test="@checked=1">@checked=1</xsl:when>
                    <xsl:otherwise>@checked=!1</xsl:otherwise>
                </xsl:choose>
              </xsl:when>
              <xsl:otherwise>@checked NOT</xsl:otherwise>
            </xsl:choose>
        </xsl:otherwise>
    </xsl:choose>
</div-->
    <xsl:variable name="label">
        <xsl:choose>
            <xsl:when test="@labelPath!=''">
                <xsl:value-of select="ctx:extract(@labelPath)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="@labelValue!=''">
                        <xsl:value-of select="@labelValue"/>
                    </xsl:when>
                    <xsl:when test="@label!=''">
                        <xsl:value-of select="@label"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>

    <!--xsl:variable name="labelValue">
      <xsl:choose>
        <xsl:when test="$label!=''">
          <xsl:value-of select="ctx:extract($label)"/>
        </xsl:when>
      </xsl:choose>
    </xsl:variable-->

  <label style="{@style}">
    <xsl:attribute name="class">
      <xsl:text>labelFloat </xsl:text>
      <xsl:value-of select="@class"/>
    </xsl:attribute>
    <input type="radio" id="{@id}" name="{@name}">
      <xsl:call-template name="layoutXMLInfo">
        <xsl:with-param name="source" select="."/>
      </xsl:call-template>

      <xsl:attribute name="class">
        <xsl:text>radioItem masked </xsl:text>
      </xsl:attribute>

      <xsl:call-template name="standardControlFlags">
        <xsl:with-param name="source" select="."/>
      </xsl:call-template>

      <xsl:if test="$valueExtractChecked = 1">
        <xsl:attribute name="checked">1</xsl:attribute>
      </xsl:if>

      <xsl:attribute name="value">
        <xsl:value-of select="$value"/>
      </xsl:attribute>
    </input>
    <xsl:value-of select="$label"/>
  </label>
</xsl:template>
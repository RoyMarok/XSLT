    <!-- комбобокс ********************************
    <layout:select xmlns:layout="URN:html-form-layout:v0.1"
       name="NAME"
       value="VALUE"
       listSource="XPATH">

    ....
    </layout:simple-field>
      *******************************************-->
    <xsl:template match="layout:select" xmlns:layout="URN:html-form-layout:v0.1">

        <xsl:param name="field_required">0</xsl:param>

        <xsl:variable name="value" select="ctx:extract(@value)"/>

        <select name="{@name}" id="{@id}">
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
            <xsl:if test="$field_required!='1'">
                <option></option>
            </xsl:if>

            <xsl:choose>
                <xsl:when test="@listSourceID">
                    <xsl:variable name="listData" select="ex2:dictionarySQL( @listSourceID )"/>
                    <xsl:for-each select="$listData//ROW">
                        <!--option value="">Не выбрано</option-->
                        <option value="{ID}">
                            <xsl:if test="$value=ID">
                                <xsl:attribute name="selected">1</xsl:attribute>
                            </xsl:if>
                            <xsl:value-of select="NAME"/>
                        </option>
                    </xsl:for-each>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:for-each select="ctx:extract(@listSource)">
                        <!--option value="">Не выбрано</option-->
                        <option value="{ID}">
                            <xsl:if test="$value=ID">
                                <xsl:attribute name="selected">1</xsl:attribute>
                            </xsl:if>
                            <xsl:value-of select="NAME"/>
                        </option>
                    </xsl:for-each>
                  <!-- ссылка на данные для списка, должна сет элемнтов, у которых есть дочерний тэк ID и есть дочерний тэг NAME
                     Привязка к обязательному ROW обрана

                    <xsl:for-each select="ctx:extract(concat('//',@listSource,'//ROW'))">

                        <option value="{ID}">
                            <xsl:if test="$value=ID">
                                <xsl:attribute name="selected">1</xsl:attribute>
                            </xsl:if>
                            <xsl:value-of select="NAME"/>
                        </option>
                    </xsl:for-each>
                    -->
                </xsl:otherwise>
            </xsl:choose>

        </select>

    </xsl:template>
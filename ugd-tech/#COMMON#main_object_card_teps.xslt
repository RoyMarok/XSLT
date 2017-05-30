<!-- Раздел "Технико-экономические показатели" новый вариантдля СП и Реестар Строек -->
<xsl:if test="ROOT/TEPS_NEW/ROW_SET/ROW/VALUE1 != '' and ROOT/PERMISSIONS/ROW_SET/ROW/PR_SHOW_OBJ_TEP = '1'">
    <table class="innerTable objTepTab spObjTep">
        <tr>
            <td class="tableTitle" colspan="3">
                <span id="tepTitleWrap">Технико-экономические показатели</span>
            </td>
        </tr>
        
        <xsl:for-each select="ROOT/TEPS_NEW/ROW_SET/ROW">
        <!-- Проверка - после за заголовком следует ещё один заголовок (раздел не содержит информации) - заголовок не выводится -->
        <xsl:choose>
            <xsl:when test="TITLE='1' and following::TITLE[1]='1'">
                
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="tr">
                    <xsl:attribute name="class">
                        <xsl:choose>
                            <!-- Если поле TITLE==1 - выводится жирная строка заколовка группы ТЭП' -->
                            <xsl:when test="TITLE eq '1'">tepDataRow regTepTitleRow</xsl:when>
                            <xsl:otherwise>tepDataRow regTepDataRow</xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                    
                    <xsl:attribute name="style">
                        <xsl:if test="(position() mod 2) != 1">background-color: #EDEDED</xsl:if>
                    </xsl:attribute>
                    <td class="regTepRowTitle">
                        <span><xsl:value-of select="TNAME"/></span>
                    </td>
                    <td class="regTepRowProj">
                        <xsl:value-of select="VALUE1"/>
                    </td>
                    <td class="regTepRow">
                        <xsl:value-of select="VALUE2"/>
                    </td>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
        </xsl:for-each>
    </table>
</xsl:if>
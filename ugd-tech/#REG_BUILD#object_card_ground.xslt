<!-- Раздел "Земельно-правовые отношения" паспорт Объекта "Реестр Строек" -->
<table class="innerTable spDazuTab">
    <tr>
        <td class="tableTitle" colspan="3">
            <span id="orgTabTitle">Земельно-правовые отношения</span>
        </td>
    </tr>
    <!-- Три варианта вывода раздела: 1-При наличии данных в DOC_KEY выводятся строки со сслыками -->
    <!-- 2-При отсутсвии DOC_KEY, но наличии GA_NUMBER данные выводятся в виде обычного текста -->
    <!-- 3-При отсутствии DOC_KEY и GA_NUMBER выводятся серые строки "Кадастровый номер..." и "Договор аренды..." -->
    <xsl:choose>
        <xsl:when test="ROOT/REG_GROUND/ROW_SET/ROW/GA_NUMBER!=''">
            <xsl:for-each select="ROOT/REG_GROUND/ROW_SET/ROW">
                <tr class="spDazuRow">
                    <xsl:element name="td">
                        <xsl:choose>
                            <xsl:when test="position()=1">
                                <xsl:attribute name="class">regObjGrLeft1</xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="TYPEDOCUDO"><span class="doTitleSp"><xsl:value-of select="TYPEDOCUDO"/></span></xsl:when>
                                    <xsl:otherwise><span class="doTitleSp">Кадастровый номер и адрес</span></xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:otherwise>&#160;</xsl:otherwise>
                        </xsl:choose>
                    </xsl:element>
                    <td class="regObjGrCenter">
                        <xsl:choose>
                            <xsl:when test="DOC_KEY and DOC_KEY!=''">
                                <xsl:element name="a">
                                    <xsl:attribute name="class">activeLink</xsl:attribute>
                                    <!--xsl:attribute name="href">htmlcard.action?documentId=<xsl:value-of select="DOC_KEY"/></xsl:attribute-->
                                    <xsl:attribute name="href">getCardHtml.action?cardId=CARD$DOC_REDIRECT&amp;documentId=<xsl:value-of select="DOC_KEY"/></xsl:attribute> 
                                    <xsl:value-of select="GA_NUMBER"/>
                                </xsl:element>
                            </xsl:when>
                            <xsl:otherwise><xsl:value-of select="GA_NUMBER"/></xsl:otherwise>
                        </xsl:choose>
                    </td>
                    <td class="regObjGrRight"><xsl:value-of select="GA_ADDRESS_STRING"/></td>
                </tr>
            </xsl:for-each>
        </xsl:when>
        <xsl:otherwise><tr class="regObjGrRow"><td colspan="3" class="grayText">Кадастровый номер и адрес</td></tr></xsl:otherwise>
    </xsl:choose>
    
    <xsl:choose>
        <xsl:when test="ROOT/REG_GR_CONTR/ROW_SET/ROW/REGISTR_N!=''">
            <xsl:for-each select="ROOT/REG_GR_CONTR/ROW_SET/ROW">
                <tr class="regObjGrRow">
                    <td class="regObjGrLeft2">
                        <xsl:choose>
                            <xsl:when test="TYPEDOCUDO"><span class="doTitleSp"><xsl:value-of select="TYPEDOCUDO"/></span></xsl:when>
                            <xsl:otherwise><span class="doTitleSp">Договор аренды земельного участка</span></xsl:otherwise>
                        </xsl:choose>
                    </td>
                    <td class="regObjGrCenter">
                        <xsl:choose>
                            <xsl:when test="DOC_KEY and DOC_KEY!=''">
                                <div>
                                    <xsl:element name="a">
                                        <xsl:attribute name="class">activeLink</xsl:attribute>
                                        <!--xsl:attribute name="href">htmlcard.action?documentId=<xsl:value-of select="DOC_KEY"/></xsl:attribute-->
                                        <xsl:attribute name="href">getCardHtml.action?cardId=CARD$DOC_REDIRECT&amp;documentId=<xsl:value-of select="DOC_KEY"/></xsl:attribute> 
                                        <xsl:value-of select="REGISTR_N"/>
                                    </xsl:element>
                                </div>
                            </xsl:when>
                            <xsl:otherwise><div><xsl:value-of select="REGISTR_N"/></div></xsl:otherwise>
                        </xsl:choose>
                        <xsl:if test="RTEXT and RTEXT!=''">Цель использования:</xsl:if>
                    </td>
                    <td class="regObjGrRight">
                        <div><xsl:value-of select="DATA_BEGIN"/></div>
                        <xsl:value-of select="RTEXT"/>
                    </td>
                </tr>
            </xsl:for-each>
        </xsl:when>
        <xsl:otherwise><tr class="regObjGrRow"><td colspan="3" class="grayText">Договор аренды земельного участка</td></tr></xsl:otherwise>
    </xsl:choose>
</table>
<xsl:if test="ROOT/ORGS/ROW_SET/ROW/CONTRACTOR_NAME and ROOT/PERMISSIONS/ROW_SET/ROW/PR_SHOW_OBJ_ORGANIZATIONS = '1'">
<table class="innerTable orgTab spOrgInfo">
    <tr>
        <td class="tableTitle" colspan="3">
            <span id="orgTabTitle">Организации</span>
            <xsl:if test="$obj_type!='RegBuild'">
                <span class="detailLinkWrap" id="orgDetailLink">
                    <a class="detailLink" id="spObjOrgLink" title="Перейти в раздел 'Организации'">Подробнее</a>
                </span>
            </xsl:if>
        </td>
    </tr>
    <xsl:for-each select="ROOT/ORGS/ROW_SET/ROW">
    <!-- <xsl:if test="$obj_type='RegBuild'"> -->
    <tr>
        <xsl:element name="td">
            <xsl:attribute name="class">
                <xsl:choose> <!-- Вывод иконки в левой колонке в зависимости от наличия данных в поле ELEMENT_VALUE -->
                    <xsl:when test="ELEMENT_VALUE">orgTabIcon</xsl:when>
                    <xsl:otherwise>orgTabIconEmpty</xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            &#160;
        </xsl:element>
        <xsl:element name="td">
            <xsl:attribute name="class">
                <xsl:choose> <!-- Вывод точек в центральной колонке в зависимости от наличия данных в поле ELEMENT_VALUE -->
                    <xsl:when test="ELEMENT_VALUE">orgTabLeft</xsl:when>
                    <xsl:otherwise>orgTabLeftEmpty</xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <span class="doTitleSp"><xsl:value-of select="ELEMENT_VALUE"/></span>
        </xsl:element>
        <td class="orgTabRight">
            <div class="orgLinkWrap">
            <xsl:choose>
            <xsl:when test="/ROOT/PERMISSIONS/ROW_SET/ROW/PR_SHOW_ORG_CARD = '1' and ALT_CODE!=''">
                <xsl:element name="a">
                    <xsl:attribute name="class">activeLinkOrgs</xsl:attribute>
                    <xsl:attribute name="target">_self</xsl:attribute>
                    <!--xsl:attribute name="href">htmlcard.action?documentId=ORG:<xsl:value-of select="ALT_CODE"/></xsl:attribute-->
                    <xsl:attribute name="href">getCardHtml.action?cardId=CARD$DOC_REDIRECT&amp;documentId=ORG:<xsl:value-of select="ALT_CODE"/></xsl:attribute> 
                    <xsl:value-of select="CONTRACTOR_NAME"/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise><span style="color:#777777;"><xsl:value-of select="CONTRACTOR_NAME"/></span></xsl:otherwise>
            </xsl:choose>
            </div>
        </td>
    </tr>
    <!-- </xsl:if> -->
    </xsl:for-each>
</table>
</xsl:if>
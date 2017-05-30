<xsl:if test="/ROOT/PROGS/ROW_SET/ROW/PROGRAM_ID">
<table class="innerTable progTab">

    <tr>
        <td colspan="2" class="tableTitle">Объект включен в программы и перечни</td>
    </tr>
    <!-- <tr style="height:23px;">
        <td>Городские программы и адресные перечни:</td>
    </tr> -->
    
    <!-- <xsl:attribute name="href"><xsl:value-of select="/ROOT/MISC/sp_app_link"/>faces/program_edit.jsp?ProgramId=<xsl:value-of select="ID"/></xsl:attribute> -->
    <xsl:for-each select="/ROOT/PROGS/ROW_SET/ROW">
        <tr>
            <td>
                <xsl:element name="div">
                    <xsl:attribute name="class">progLineWrap</xsl:attribute>
                    <xsl:if test="PORTAL_SHOW_FLAG='А'">
                        <xsl:attribute name="style">background: transparent url(img/isio/progIconCross.gif) no-repeat scroll 0 3px !important;</xsl:attribute>
                        <xsl:attribute name="title">Не действует</xsl:attribute>
                    </xsl:if>
                    <xsl:if test="NAME_SHORT != ''">
                        <xsl:choose>
                            <xsl:when test="PROGRAM_ID != ''">
                                <xsl:element name="a">
                                    <!--xsl:attribute name="href">htmlcard.action?documentId=PRG:<xsl:value-of select="PROGRAM_ID"/></xsl:attribute-->
                                    <xsl:attribute name="href">getCardHtml.action?cardId=CARD$DOC_REDIRECT&amp;documentId=PRG:<xsl:value-of select="PROGRAM_ID"/></xsl:attribute> 
                                    <xsl:attribute name="target">_self</xsl:attribute>
                                    <xsl:attribute name="class">activeLink</xsl:attribute>
                                    <xsl:value-of select="NAME_SHORT"/>
                                </xsl:element>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="NAME_SHORT"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:if>
                    
                    <!-- Вывод ссылки на документ, если есть название документа -->
                    <!-- <xsl:if test="DOC_TYPE_NAME">,&#160;
                        <xsl:choose>
                            <xsl:when test="DOCKEY_ISIO!=''">
                                <xsl:element name="a">
                                    <xsl:attribute name="href">htmlcard.action?documentId=<xsl:value-of select="DOCKEY_ISIO"/></xsl:attribute>
                                    <xsl:attribute name="target">_self</xsl:attribute>
                                    <xsl:value-of select="DOC_TYPE_NAME"/>&#160;<xsl:value-of select="DOC_NUMBER"/>&#160;от&#160;<xsl:value-of select="DOC_DATE"/>
                                </xsl:element>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="DOC_TYPE_NAME"/>&#160;<xsl:value-of select="DOC_NUMBER"/>&#160;от&#160;<xsl:value-of select="DOC_DATE"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:if> -->
                    
                </xsl:element>
            </td>
            <td>
            </td>
        </tr>
    </xsl:for-each>

</table>
</xsl:if>
<table class="innerTable progTab">
    <tr>
        <td class="tableTitle">Объект входит в застройку / комплекс</td>
    </tr>
    
    <xsl:for-each select="/ROOT/OBJ_COPLEX_INFO/ROW_SET/ROW">
        <tr>
            <td>
                <div class="progLineWrap">
                    <xsl:choose>
                        <xsl:when test="OBJECT1_ID">
                            <xsl:element name="a">
                                <!--xsl:attribute name="href">htmlcard.action?documentId=OB2:<xsl:value-of select="OBJECT1_ID"/></xsl:attribute-->                               
                                <xsl:attribute name="href">tabInfo.action?tab=CARD$CARD_OBJ&amp;tab2=CARD_OBJ_TAB&amp;documentId=<xsl:value-of select="OBJECT1_ID"/></xsl:attribute>  
                                <xsl:attribute name="target">_self</xsl:attribute>
                                <xsl:value-of select="CA_VALUE"/>
                            </xsl:element>
                        </xsl:when>
                        <xsl:otherwise><xsl:value-of select="CA_VALUE"/></xsl:otherwise>
                    </xsl:choose>
                </div>
                <span class="progLineAdd"><xsl:value-of select="OBJECT_NAME"/></span>
            </td>
        </tr>
    </xsl:for-each>
</table>
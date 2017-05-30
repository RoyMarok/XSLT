<style>
    div#spObjSMI{display:block;position:relative;padding-top:20px}
    div#spObjSMI div{display:block;position:relative}    
    div#spObjSMI div.rightSectTitle{height:20px}
    div#spObjSMI div.SMItop{padding:0 0 5px;font-size:88%;}
    div#spObjSMI div.SMIblock{padding-top:10px}
    div#spObjSMI div.SMItop span.SMIsource{padding-left:10px;color:#888}
</style>
<xsl:if test="/ROOT/SMI/ROW_SET/ROW">
    <div class="rightSectTitle">
        <div class="rightSectTContent">Публикации СМИ</div>
    </div>
    <xsl:for-each select="/ROOT/SMI/ROW_SET/ROW">
        <div class="SMIblock">
            <div class="SMItop">
                <span class="SMIdate"><xsl:value-of select="DOC_DATE"/></span>
                <span class="SMIsource"><xsl:value-of select="SOURCE"/></span>
            </div>
            <xsl:element name="a">
                <xsl:attribute name="class">SMIlink</xsl:attribute>
                <xsl:choose>
                    <xsl:when test="VIEW_='0'">
                        <xsl:attribute name="href"><xsl:value-of select="LINK_"/></xsl:attribute>            
                        <xsl:attribute name="target">_blank</xsl:attribute>
                    </xsl:when>
                    <xsl:otherwise>
                        <!--xsl:attribute name="href">htmlcard.action?documentId=<xsl:value-of select="DOC_KEY"/></xsl:attribute-->   
                        <xsl:attribute name="href">getCardHtml.action?cardId=CARD$DOC_REDIRECT&amp;documentId=<xsl:value-of select="DOC_KEY"/></xsl:attribute>          
                        <xsl:attribute name="target">_self</xsl:attribute>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:value-of select="TITLE"/>                
            </xsl:element>            
        </div>
    </xsl:for-each>
</xsl:if>
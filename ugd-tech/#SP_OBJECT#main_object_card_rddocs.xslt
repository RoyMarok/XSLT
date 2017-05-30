<xsl:if test="/ROOT/OBJ_RDDOCS/ROW_SET/ROW/DOC_TYPE_NAME != '' and ROOT/PERMISSIONS/ROW_SET/ROW/PR_SHOW_OBJ_DOC = '1'">

<style type="text/css">
.spObjRdRow .spRdInfo div.spRdTextWrap { height: auto !important; font-size: 12px; }
</style>

<table class="innerTable spRdTab raspDoc">
    <tr>
        <!-- Старый вариант заголовка раздела без фильтра -->
        <td colspan="5" class="tableTitle" id="docTitleWrap"><span>Распорядительные документы</span></td>
    </tr>
    
    <!-- Цикл вывод распорядительных документов в таблицу -->
    <xsl:for-each select="/ROOT/OBJ_RDDOCS/ROW_SET/ROW">
        <tr class="spObjRdRow">
            <xsl:choose>
                <!-- Если документ -->
                <xsl:when test="IS_DOC=1 and STATUSNDD1_3!='2'">
                    <xsl:choose>
                        <xsl:when test="IS_DOC_ACTIVE='1'">
                            <!-- Активный документ -->
                            <td class="doGreenDoc spIconRdCell" title="Действует"></td>
                        </xsl:when>
                        
                        <xsl:otherwise>
                            <!-- Не активный документ -->
                            <td class="doGreenCrossDoc spIconRdCell" title="Не действует"></td>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                
                <!-- Если заявка -->
                <xsl:when test="IS_DOC=0 and STATUSNDD1_3!='2'">
                    <xsl:choose>
                        <xsl:when test="IS_DOC_ACTIVE='0'">
                            <!-- Активная заявка -->
                            <td class="doBlackDoc spIconRdCell" title="В работе"></td>
                        </xsl:when>
                        
                        <xsl:otherwise>
                            <!-- Не активная заявка -->
                            <td class="doBlackCrossDoc spIconRdCell" title="Отказано"></td>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                
                <!-- Спец.случай -->
                <xsl:when test="STATUSNDD1_3 = '2'">
                    <td class="spRdYellDoc spIconRdCell" title="Не действует в отношении данного объекта"></td>
                </xsl:when>
                
                <xsl:otherwise>
                    <td class="doGrayDoc doIconEmpty"></td>
                </xsl:otherwise>
            </xsl:choose>
            
            <td class="rdLinkSp">
                <xsl:element name="a">
                    <xsl:attribute name="class">activeLink</xsl:attribute>
                    <xsl:attribute name="target">_self</xsl:attribute>
                    <!--xsl:attribute name="href">htmlcard.action?documentId=<xsl:value-of select="DOCKEY_ISIO"/></xsl:attribute-->
                    <xsl:attribute name="href">getCardHtml.action?cardId=CARD$DOC_REDIRECT&amp;documentId=<xsl:value-of select="DOCKEY_ISIO"/></xsl:attribute> 
                    <xsl:value-of select="DOC_NUMB"/>
                </xsl:element>
            </td>
            <td class="spRdDate">
                <xsl:choose>
                    <xsl:when test="DOC_DATE!=''">
                        <xsl:value-of select="DOC_DATE"/>
                    </xsl:when>
                    <xsl:otherwise>
                        &#160;
                    </xsl:otherwise>
                </xsl:choose>
            </td>
            <td class="spRdInfo">
                <xsl:choose>
                    <xsl:when test="SUBJECT!=''">
                        <xsl:element name="div">
                            <xsl:attribute name="class">spRdTextWrap</xsl:attribute>
                            <xsl:attribute name="title"><xsl:value-of select="SUBJECT"/></xsl:attribute>
                            <div class="spRdText">
                                <xsl:value-of select="SUBJECT"/>
                            </div>
                            <span class="spObjRdGradient">&#160;</span>
                        </xsl:element>
                    </xsl:when>
                    <xsl:otherwise>
                        &#160;
                    </xsl:otherwise>
                </xsl:choose>
            </td>
        </tr>
    </xsl:for-each>
</table>
</xsl:if>

<!-- <div id="rdBottom"></div> -->
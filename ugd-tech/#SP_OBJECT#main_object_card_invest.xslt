<xsl:if test="/ROOT/OBJ_INVEST/ROW_SET/ROW/DOC_TYPE_NAME != '' and ROOT/PERMISSIONS/ROW_SET/ROW/PR_SHOW_OBJ_DOC = '1'">
<table class="innerTable spRdTab">
    <tr>
        <!-- Старый вариант заголовка раздела без фильтра -->
        <td colspan="4" class="tableTitle">Инвестиционные контракты</td>
    </tr>
    
    <!-- Цикл вывод распорядительных документов в таблицу -->
    <xsl:for-each select="/ROOT/OBJ_INVEST/ROW_SET/ROW">
        <tr class="spObjRdRow">
            <xsl:choose>
                <!-- Если документ -->
                <xsl:when test="IS_DOC=1 and STATUSNDD1_3!='2'">
                    <xsl:choose>
                        <xsl:when test="IS_DOC_ACTIVE='1'">
                            <!-- Активный документ -->
                            <!-- NORM UGLY <td class="doGreenDoc spIconRdCell" title="Действует">&#160;&#160;&#160;</td> -->
                            <td class="doGreenDoc spIconRdCell" title="Действует"><div style="width:16px;"></div></td>
                        </xsl:when>
                        
                        <xsl:otherwise>
                            <!-- Не активный документ -->
                            <td class="doGreenCrossDoc spIconRdCell" title="Не действует"><div style="width:16px;"></div></td>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                
                <!-- Если заявка -->
                <xsl:when test="IS_DOC=0 and STATUSNDD1_3!='2'">
                    <xsl:choose>
                        <xsl:when test="IS_DOC_ACTIVE='0'">
                            <!-- Активная заявка -->
                            <td class="doBlackDoc spIconRdCell" title="В работе"><div style="width:16px;"></div></td>
                        </xsl:when>
                        
                        <xsl:otherwise>
                            <!-- Не активная заявка -->
                            <td class="doBlackCrossDoc spIconRdCell" title="Отказано"><div style="width:16px;"></div></td>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                
                <!-- Спец.случай -->
                <xsl:when test="STATUSNDD1_3 = '2'">
                    <td class="spRdYellDoc spIconRdCell" title="Не действует в отношении данного документа"><div style="width:16px;"></div></td>
                </xsl:when>
                
                <xsl:otherwise>
                    <td class="doGrayDoc spIconRdCell"><div style="width:16px;"></div></td>
                </xsl:otherwise>
            </xsl:choose>
            
            <td class="rdLinkSp">
                <xsl:choose>
                    <xsl:when test="DOCKEY_ISIO!=''">
                        <xsl:element name="a">
                            <xsl:attribute name="class">activeLink</xsl:attribute>
                            <xsl:attribute name="target">_self</xsl:attribute>
                            <!--xsl:attribute name="href">htmlcard.action?documentId=<xsl:value-of select="DOCKEY_ISIO"/></xsl:attribute-->
                            <xsl:attribute name="href">getCardHtml.action?cardId=CARD$DOC_REDIRECT&amp;documentId=<xsl:value-of select="DOCKEY_ISIO"/></xsl:attribute> 
                            
                            <xsl:value-of select="DOC_NUMB"/>
                        </xsl:element>
                    </xsl:when>
                    <xsl:otherwise><span style="white-space:nowrap"><xsl:value-of select="DOC_NUMB"/></span></xsl:otherwise>                  
                </xsl:choose>
            </td>
            
            <!-- Вывод даты регистрации. -->
            <!-- <td class="spRdDate">
                <xsl:choose>
                    <xsl:when test="DOC_DATE!=''">
                        <xsl:value-of select="DOC_DATE"/>
                    </xsl:when>
                    <xsl:otherwise>
                        &#160;
                    </xsl:otherwise>
                </xsl:choose>
            </td> -->
            
            <!-- Вывод состояния -->
            <td style="white-space:nowrap !important;">
                <xsl:choose>
                    <xsl:when test="SUBJECT!=''">
                        <xsl:element name="div">
                            <xsl:attribute name="class">spRdTextWrap</xsl:attribute>
                            <xsl:attribute name="title"><xsl:value-of select="SUBJECT"/></xsl:attribute>
                            <xsl:value-of select="SUBJECT"/>
                        </xsl:element>
                    </xsl:when>
                    <xsl:otherwise>&#160;</xsl:otherwise>
                </xsl:choose>
            </td>
            
            
            <!-- Крайняя правая колонка - текст справа прикрыт градиентом -->
            <td class="spObjContent2">
                <xsl:choose>
                    <xsl:when test="CONTENT2!=''">
                        <xsl:element name="div">
                            <xsl:attribute name="class">spRdTextWrap</xsl:attribute>
                            <xsl:attribute name="title"><xsl:value-of select="CONTENT2"/></xsl:attribute>
                            <div class="spRdText"><xsl:value-of select="CONTENT2"/></div>
                            <span class="spObjRdGradient">&#160;</span>
                        </xsl:element>
                    </xsl:when>
                    <xsl:otherwise>&#160;</xsl:otherwise>
                </xsl:choose>
            </td>
        </tr>
    </xsl:for-each>
</table>
</xsl:if>

<!-- <div id="rdBottom"></div> -->
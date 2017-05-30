<table id="docTabHeader" class="spObjDocTab">
    <tr>
        <td class="tableTitle">Документационное обеспечение</td>
        <!-- <td id="spObjFilterWrap"> -->
            <!-- Старый вариант фильтра с 3-я пунктами -->
            <!-- <ul id="spObjFilterList">
                <li id="fdocTabAll" class="filterWhiteLink"><a>Все</a></li>
                <li id="fdocTabFiltr1" class="filterActiveLink"><a>Только действующие</a></li>
                <li id="fdocTabFiltr2" class="filterActiveLink"><a>Без заявок</a></li>
            </ul> -->
            
            <!-- Новый вариант фильтра с 2-я пунктами -->
            <!-- <ul id="spObjFilterList">
                <li id="fdocTabAll" class="filterWhiteLink"><a>Все</a></li>
                <li id="fdocTabCut" class="filterActiveLink"><a>Только действующие</a></li>
            </ul> -->
        <!-- </td> -->
        
        <!-- Старый вариант вывода иконки через background - некорректное масштабирование при уменьшении в IE6 -->
        <td id="spObjMoreDetails">
            <xsl:if test="$obj_type!='RegBuild'">
                <div class="spObjLinkWrap"><a class="detailLink" id="spObjDocLink" title="Перейти в раздел 'Документы'">Подробнее</a></div>
            </xsl:if>
        </td>
        
        <!-- Новый вариант иконки (должен корректно масштабироваться во всех браузерах) -->
        <!-- <td id="spObjMoreDetails">
            <img src="img/isio/i_icon.gif" style="float:left;"/>
            <a class="detailLink" id="spObjDocLink" title="Перейти в раздел 'Документы'">Подробнее</a>
        </td> -->
        
    </tr>
    <xsl:if test="/ROOT/OBJ_INFO/ROW_SET/ROW/ARCHIVEREASON">
        <tr><td colspan="2"><span style="line-height:30px"><xsl:value-of select="/ROOT/OBJ_INFO/ROW_SET/ROW/ARCHIVEREASON" /></span></td></tr>
    </xsl:if>
</table>

<!-- Таблица для вывода списка документов -->
<table class="innerTable spDocInfo">
<xsl:if test="ROOT/PERMISSIONS/ROW_SET/ROW/PR_SHOW_OBJ_DOC = '1'">
        
    <!-- Вывод серых строк в случае отсутствия записей по соответствующей категории BEGIN -->
    <!-- <xsl:if test="not(/ROOT/OBJ_DOCS/ROW_SET/ROW[DOC_TYPE_NAME='Разрешение на ввод / Акт ввода'])">
        <xsl:call-template name="grayDocRow">
            <xsl:with-param name="stringText" select="'Разрешение на ввод / Акт ввода'"/>
        </xsl:call-template>
    </xsl:if>
    
    <xsl:if test="not(/ROOT/OBJ_DOCS/ROW_SET/ROW[DOC_TYPE_NAME='Разрешение на строительство'])">
        <xsl:call-template name="grayDocRow">
            <xsl:with-param name="stringText" select="'Разрешение на строительство'"/>
        </xsl:call-template>
    </xsl:if>

    <xsl:if test="not(/ROOT/OBJ_DOCS/ROW_SET/ROW[DOC_TYPE_NAME='Заключение МГЭ на ПСД'])">
        <xsl:call-template name="grayDocRow">
            <xsl:with-param name="stringText" select="'Заключение МГЭ на ПСД'"/>
        </xsl:call-template>
    </xsl:if>
    
    <xsl:if test="not(/ROOT/OBJ_DOCS/ROW_SET/ROW[DOC_TYPE_NAME='ГПЗУ'])">
        <xsl:call-template name="grayDocRow">
            <xsl:with-param name="stringText" select="'ГПЗУ'"/>
        </xsl:call-template>
    </xsl:if>
    
    <xsl:if test="not(/ROOT/OBJ_DOCS/ROW_SET/ROW[DOC_TYPE_NAME='АРИ'])">
        <xsl:call-template name="grayDocRow">
            <xsl:with-param name="stringText" select="'АРИ'"/>
        </xsl:call-template>
    </xsl:if> -->
    <!-- Вывод серых строк в случае отсутствия записей по соответствующей категории END -->
    
    
    <xsl:if test="ROOT/OBJ_DOCS/ROW_SET/ROW/OBJECT_ID">
        <xsl:for-each select="ROOT/OBJ_DOCS/ROW_SET/ROW">
        
        <xsl:choose>
            <!-- Документ -->
            <xsl:when test="IS_DOC=1 and EMPTY_LINE=0">
                <xsl:choose>
                    <!-- Активный документ -->
                    <xsl:when test="IS_DOC_ACTIVE='1'">
                        <xsl:call-template name="viewDocRow">
                            <xsl:with-param name="stringClass" select="'docRow activeRow'"/>
                            <xsl:with-param name="firstCellClass" select="'doGreenDoc spIconCell'"/>
                            <xsl:with-param name="iconComment" select="'Действует'"/>
                        </xsl:call-template>
                    </xsl:when>
                    
                    <!-- Не активный документ -->
                    <xsl:when test="IS_DOC_ACTIVE='0'">
                        <xsl:call-template name="viewDocRow">
                            <xsl:with-param name="stringClass" select="'docRow passiveRow'"/>
                            <xsl:with-param name="firstCellClass" select="'doGreenCrossDoc spIconCell'"/>
                            <xsl:with-param name="iconComment" select="'Не действует'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="viewDocRow">
                            <xsl:with-param name="stringClass" select="'docRow emptyRow'"/>
                            <xsl:with-param name="firstCellClass" select="'doIconEmpty'"/>
                            <xsl:with-param name="iconComment" select="''"/>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            
            <!-- Заявка -->
            <xsl:when test="IS_DOC=0 and EMPTY_LINE=0">
                <xsl:choose>
                    <!-- Активная заявка -->
                    <!-- <xsl:with-param name="firstCellClass" select="'doGrayDoc spIconCell'"/> -->
                    <xsl:when test="IS_DOC_ACTIVE='1'">
                        <xsl:call-template name="viewDocRow">
                            <xsl:with-param name="stringClass" select="'refRow activeRow'"/>
                            <xsl:with-param name="firstCellClass" select="'doBlackDoc spIconCell'"/>
                            <xsl:with-param name="iconComment" select="'В работе'"/>
                        </xsl:call-template>
                    </xsl:when>
                    
                    <!-- Не активная заявка -->
                    <xsl:when test="IS_DOC_ACTIVE='0'">
                        <xsl:call-template name="viewDocRow">
                            <xsl:with-param name="stringClass" select="'refRow passiveRow'"/>
                            <xsl:with-param name="firstCellClass" select="'doBlackCrossDoc spIconCell'"/>
                            <xsl:with-param name="iconComment" select="'Отказано'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="viewDocRow">
                            <xsl:with-param name="stringClass" select="'refRow emptyRow'"/>
                            <xsl:with-param name="firstCellClass" select="'doIconEmpty'"/>
                            <xsl:with-param name="iconComment" select="''"/>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            
            <!-- <xsl:when test="EMPTY_LINE=1"> -->
            <xsl:when test="(EMPTY_LINE=1 and not(/ROOT/OBJ_INFO/ROW_SET/ROW/COMPLEX)) or (EMPTY_LINE=1 and /ROOT/OBJ_INFO/ROW_SET/ROW/COMPLEX ne 'Д')">
                <xsl:call-template name="grayDocRow">
                    <xsl:with-param name="stringText" select="DOC_TYPE_NAME"/>
                </xsl:call-template>
            </xsl:when>
            
            <xsl:otherwise>
            </xsl:otherwise>
        </xsl:choose>
        
        </xsl:for-each>
    </xsl:if>
</xsl:if>
</table>
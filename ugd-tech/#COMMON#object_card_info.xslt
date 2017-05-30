<table class="innerTable objDescTab spObjInfo">
    
    <tr>
        <td colspan="2" class="tableTitle">
            <span id="orgTabTitle">Описание объекта</span>

            <!-- Вывод ссылки "Подробнее" для объекта РСО -->
            <xsl:if test="$obj_type = 'RSO'">
                <span class="rsoObjDetailLinkWrap">
                    <xsl:element name="a">
                        <xsl:attribute name="id">rsoObjectDetails</xsl:attribute>
                        <xsl:attribute name="class">detailLink</xsl:attribute>
                        <xsl:attribute name="title">Перейти в раздел 'Показатели'</xsl:attribute>
                        Подробнее
                    </xsl:element>
                </span>
            </xsl:if>
        </td>
    </tr>
    
    <tr>
        <td class="spInfoLeft">
            <table class="spObjInfoLeftTab">
                <!-- Вывод поля "Вид работ" в карточке объекта РСО -->
                <xsl:if test="$obj_type = 'RSO' and /ROOT/OBJ_INFO/ROW_SET/ROW/WORK_TYPE!=''">
                    <tr>
                        <xsl:element name="td">
                            <xsl:attribute name="class">spObjDescName</xsl:attribute>
                            <xsl:if test="/ROOT/OBJ_INFO/ROW_SET/ROW/WORK_TYPE=''">
                                <xsl:attribute name="style">background:none !important; color: #C0C0C0;</xsl:attribute>
                            </xsl:if>
                            <span class="objDescTName">Вид работ</span>
                        </xsl:element>
                        <td class="spObjDescVal">
                            <xsl:value-of select="/ROOT/OBJ_INFO/ROW_SET/ROW/WORK_TYPE"/>
                        </td>
                    </tr>
                </xsl:if>
                
                <!-- Вывод в том случае, если есть значение. Если убрать данное условие - при отсутсвии значения будет выводиться серая строка -->
                <!-- <xsl:if test="ROOT/OBJ_INFO/ROW_SET/ROW/BUILD_VIEW!=''"> -->
                <tr>
                    <xsl:element name="td">
                        <xsl:attribute name="class">
                            <xsl:choose>
                                <xsl:when test="ROOT/OBJ_INFO/ROW_SET/ROW/BUILD_VIEW">spDescNameAct</xsl:when>
                                <xsl:otherwise>spDescNamePas</xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                        <div><span>Вид строительства</span></div>
                    </xsl:element>
                    <td class="spObjDescVal">
                        <xsl:if test="ROOT/OBJ_INFO/ROW_SET/ROW/BUILD_VIEW">
                            <xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/BUILD_VIEW"/>
                        </xsl:if>
                    </td>
                </tr>
                <!-- </xsl:if> -->
                
                <!-- Вывод в том случае, если есть значение. Если убрать данное условие - при отсутсвии значения будет выводиться серая строка -->
                <xsl:if test="ROOT/OBJ_INFO/ROW_SET/ROW/SOURCE_FUNDING!=''">
                <tr>
                    <xsl:element name="td">
                        <xsl:attribute name="class">
                            <xsl:choose>
                                <xsl:when test="ROOT/OBJ_INFO/ROW_SET/ROW/SOURCE_FUNDING">spDescNameAct</xsl:when>
                                <xsl:otherwise>spDescNamePas</xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                        <div><span>Источник финансирования</span></div>
                    </xsl:element>
                    <td class="spObjDescVal">
                        <xsl:if test="ROOT/OBJ_INFO/ROW_SET/ROW/SOURCE_FUNDING">
                            <xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/SOURCE_FUNDING"/>
                        </xsl:if>
                    </td>
                </tr>
                </xsl:if>

                <!-- Вывод в том случае, если есть значение. Если убрать данное условие - при отсутсвии значения будет выводиться серая строка -->
                <!-- <xsl:if test="ROOT/OBJ_INFO/ROW_SET/ROW/FUNC_NAME!=''"> -->
                <!-- <tr>
                    <xsl:element name="td">
                        <xsl:attribute name="class">
                            <xsl:choose>
                                <xsl:when test="ROOT/OBJ_INFO/ROW_SET/ROW/FUNC_NAME">spObjDescName spDescNameAct</xsl:when>
                                <xsl:otherwise>spObjDescName spDescNamePas</xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                        <span>Функциональное назначение</span>
                    </xsl:element>
                    <td class="spObjDescVal">
                        <xsl:if test="ROOT/OBJ_INFO/ROW_SET/ROW/FUNC_NAME">
                            <xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/FUNC_NAME"/>
                        </xsl:if>
                    </td>
                </tr> -->
                <!-- </xsl:if> -->
                
                <!-- Вывод в том случае, если есть значение. Если убрать данное условие - при отсутсвии значения будет выводиться серая строка -->
                <xsl:if test="ROOT/OBJ_INFO/ROW_SET/ROW/SERIES!=''">
                <tr>
                    <xsl:element name="td">
                        <xsl:attribute name="class">
                            <xsl:choose>
                                <xsl:when test="ROOT/OBJ_INFO/ROW_SET/ROW/SERIES">spDescNameAct</xsl:when>
                                <xsl:otherwise>spDescNamePas</xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                        <div><span>Серия проекта</span></div>
                    </xsl:element>
                    <td class="spObjDescVal">
                        <xsl:if test="ROOT/OBJ_INFO/ROW_SET/ROW/SERIES">
                            <xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/SERIES"/>
                        </xsl:if>
                    </td>
                </tr>
                </xsl:if>

                <xsl:if test="$obj_type='RSO'">
                    <!-- Вывод в том случае, если есть значение. Если убрать данное условие - при отсутсвии значения будет выводиться серая строка -->
                    <xsl:if test="ROOT/OBJ_INFO/ROW_SET/ROW/BEGIN_DATE=''">
                    <!-- Вывод поля "Дата начала строительства" в карточке объекта РСО -->
                    <tr>
                        <xsl:element name="td">
                            <xsl:attribute name="class">
                                <xsl:choose>
                                    <xsl:when test="ROOT/OBJ_INFO/ROW_SET/ROW/BEGIN_DATE!=''">spDescNameAct</xsl:when>
                                    <xsl:otherwise>spDescNamePas</xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
                            <div><span>Дата начала строительства</span></div>
                        </xsl:element>
                        <td class="spObjDescVal"><xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/BEGIN_DATE"/></td>
                    </tr>
                    </xsl:if>
                
                    <!-- Вывод в том случае, если есть значение. Если убрать данное условие - при отсутсвии значения будет выводиться серая строка -->
                    <xsl:if test="/ROOT/OBJ_INFO/ROW_SET/ROW/KADASTR=''">
                    <!-- Вывод поля "Кадастровый номер земельного участка" в карточке объекта РСО -->
                    <tr>
                        <xsl:element name="td">
                            <xsl:attribute name="class">spObjDescName</xsl:attribute>
                            <xsl:if test="/ROOT/OBJ_INFO/ROW_SET/ROW/KADASTR=''">
                                <xsl:attribute name="style">background:none !important; color: #C0C0C0;</xsl:attribute>
                            </xsl:if>
                            <span class="objDescTName">Кадастровый номер земельного участка</span>
                        </xsl:element>
                        <td class="spObjDescVal" style="vertical-align:top;">
                            <xsl:value-of select="/ROOT/OBJ_INFO/ROW_SET/ROW/KADASTR"/>
                        </td>
                    </tr>
                    </xsl:if>
                </xsl:if>
                
                <xsl:if test="$obj_type eq 'RegBuild'">
                    <!-- Дата начала строительства в паспорте Объекта Реестра Строек -->
                    <xsl:if test="ROOT/OBJ_INFO/ROW_SET/ROW/FACT_DATE_START">
                        <tr>
                            <td class="spDescNameAct" style="padding-bottom:0px;"><div><span>Дата начала строительства</span></div></td>
                            <td class="spObjDescVal">
                                <xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/FACT_DATE_START"/>
                            </td>
                        </tr>
                    </xsl:if>
                    
                    <!-- Вывод таблицы "Плановый срок ввода" для карточки Объекта РЕЕСТРА СТРОЕК -->
                    <xsl:if test="ROOT/OBJ_INFO/ROW_SET/ROW/RD_SYEAR or ROOT/OBJ_INFO/ROW_SET/ROW/TITUL_FULL_DATE or ROOT/OBJ_INFO/ROW_SET/ROW/TITUL_SYEAR or ROOT/OBJ_INFO/ROW_SET/ROW/RAZR_STR_SYEAR or ROOT/OBJ_INFO/ROW_SET/ROW/TOTAL_SYEAR">
                    <tr>
                        <td class="spDescNameAct"><div><span>Плановый срок ввода</span></div></td>
                        <td style="padding-bottom:0px;">
                            <xsl:if test="ROOT/OBJ_INFO/ROW_SET/ROW/TOTAL_SYEAR">
                                <xsl:choose>
                                    <xsl:when test="ROOT/OBJ_INFO/ROW_SET/ROW/TOTAL_SYEAR = 'Не определен'">
                                        <div class="regB_PlanStr">
                                            <b><xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/TOTAL_SYEAR"/></b>
                                        </div>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <div class="regB_PlanStr">
                                            <b><xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/TOTAL_SYEAR"/></b>
                                            <xsl:if test="ROOT/OBJ_INFO/ROW_SET/ROW/TOTAL_FORM">
                                                <xsl:choose>
                                                    <xsl:when test="ROOT/OBJ_INFO/ROW_SET/ROW/TOTAL_DOCKEY_ISIO">
                                                        <xsl:element name="a">
                                                            <xsl:if test="ROOT/OBJ_INFO/ROW_SET/ROW/TOTAL_DOC_NUM">
                                                                <xsl:attribute name="title">
                                                                    <xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/TOTAL_DOC_NUM"/>
                                                                </xsl:attribute>
                                                            </xsl:if>
                                                            <xsl:attribute name="href">
                                                                <xsl:choose>
                                                                    <!--xsl:when test="ROOT/OBJ_INFO/ROW_SET/ROW/TOTAL_FORM_NICK='HODv3'">htmlcardbody.action?documentId=<xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/TOTAL_DOCKEY_ISIO"/></xsl:when>
                                                                    
                                                                    <xsl:otherwise>htmlcard.action?documentId=<xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/TOTAL_DOCKEY_ISIO"/></xsl:otherwise-->
                                                                    
                                                                    <xsl:when test="ROOT/OBJ_INFO/ROW_SET/ROW/TOTAL_FORM_NICK='HODv3'">cardId=CARD$DOC_REDIRECT&amp;documentId=<xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/TOTAL_DOCKEY_ISIO"/></xsl:when>
                                                                    
                                                                    <xsl:otherwise>getCardHtml.action?cardId=CARD$DOC_REDIRECT&amp;documentId=<xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/TOTAL_DOCKEY_ISIO"/></xsl:otherwise>
                                                                </xsl:choose>
                                                            </xsl:attribute>
                                                            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                            <xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/TOTAL_FORM"/>
                                                        </xsl:element>    
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:element name="a">
                                                            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                            <xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/TOTAL_FORM"/>
                                                        </xsl:element>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:if>
                                        </div>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:if>
                        
                        
                        
                        
                            <xsl:if test="ROOT/OBJ_INFO/ROW_SET/ROW/RD_SYEAR">
                                <div class="regB_PlanStr">
                                    <!-- Вывод значения "по РД" -->
                                    <xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/RD_SYEAR"/>

                                    <xsl:if test="ROOT/OBJ_INFO/ROW_SET/ROW/RD_SYEAR and ROOT/OBJ_INFO/ROW_SET/ROW/RD_DOCKEY_ISIO">
                                        <!-- Ссылка "По РД" RD_DOCKEY_ISIO -->
                                        <xsl:element name="a">
                                            <xsl:if test="ROOT/OBJ_INFO/ROW_SET/ROW/RD_DOC_NUM">
                                                <xsl:attribute name="title"><xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/RD_DOC_NUM"/></xsl:attribute>
                                            </xsl:if>
                                            <!--xsl:attribute name="href">htmlcard.action?documentId=<xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/RD_DOCKEY_ISIO"/></xsl:attribute-->
                                            <xsl:attribute name="href">getCardHtml.action?cardId=CARD$DOC_REDIRECT&amp;documentId=<xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/RD_DOCKEY_ISIO"/></xsl:attribute>                                            
                                            по РД
                                        </xsl:element>
                                    </xsl:if>
                                </div>
                            </xsl:if>

                            <!-- <xsl:if test="ROOT/OBJ_INFO/ROW_SET/ROW/TITUL_FULL_DATE">
                                <div class="regB_PlanStr">
                                    <xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/TITUL_FULL_DATE"/>
                                    
                                    <xsl:if test="ROOT/OBJ_INFO/ROW_SET/ROW/RAZR_STR_DOCKEY_ISIO and ROOT/OBJ_INFO/ROW_SET/ROW/TITUL_DOCKEY_ISIO">
                                        <xsl:element name="a">
                                            <xsl:if test="ROOT/OBJ_INFO/ROW_SET/ROW/TITUL_DOC_NUM">
                                                <xsl:attribute name="title"><xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/TITUL_DOC_NUM"/></xsl:attribute>
                                            </xsl:if>
                                            <xsl:attribute name="href">htmlcard.action?documentId=<xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/TITUL_DOCKEY_ISIO"/></xsl:attribute>
                                            по Титулу
                                        </xsl:element>
                                    </xsl:if>
                                </div>
                            </xsl:if> -->
                            
                            <xsl:if test="ROOT/OBJ_INFO/ROW_SET/ROW/TITUL_SYEAR">
                                <div class="regB_PlanStr">
                                    <xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/TITUL_SYEAR"/>
                                    
                                    <xsl:if test="ROOT/OBJ_INFO/ROW_SET/ROW/TITUL_SYEAR and ROOT/OBJ_INFO/ROW_SET/ROW/TITUL_DOCKEY_ISIO">
                                        <xsl:element name="a">
                                            <xsl:if test="ROOT/OBJ_INFO/ROW_SET/ROW/TITUL_DOC_NUM">
                                                <xsl:attribute name="title"><xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/TITUL_DOC_NUM"/></xsl:attribute>
                                            </xsl:if>
                                            <!--xsl:attribute name="href">htmlcard.action?documentId=<xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/TITUL_DOCKEY_ISIO"/></xsl:attribute-->
                                            <xsl:attribute name="href">getCardHtml.action?cardId=CARD$DOC_REDIRECT&amp;documentId=<xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/TITUL_DOCKEY_ISIO"/></xsl:attribute>                                        
                                            по Титулу
                                        </xsl:element>
                                    </xsl:if>
                                </div>
                            </xsl:if>
                    
                            <xsl:if test="ROOT/OBJ_INFO/ROW_SET/ROW/RAZR_STR_SYEAR">
                                <div class="regB_PlanStr">
                                    <xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/RAZR_STR_SYEAR"/>
                                    
                                    <xsl:if test="ROOT/OBJ_INFO/ROW_SET/ROW/RAZR_STR_DOCKEY_ISIO">
                                        <xsl:element name="a">
                                            <xsl:if test="ROOT/OBJ_INFO/ROW_SET/ROW/RAZR_STR_DOC_NUM">
                                                <xsl:attribute name="title"><xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/RAZR_STR_DOC_NUM"/></xsl:attribute>
                                            </xsl:if>
                                            <!--xsl:attribute name="href">htmlcard.action?documentId=<xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/RAZR_STR_DOCKEY_ISIO"/></xsl:attribute-->
                                            <xsl:attribute name="href">getCardHtml.action?cardId=CARD$DOC_REDIRECT&amp;documentId=<xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/RAZR_STR_DOCKEY_ISIO"/></xsl:attribute>   
                                            по Разрешению
                                        </xsl:element>
                                    </xsl:if>
                                </div>
                            </xsl:if>
                        </td>
                    </tr>
                    </xsl:if>
                    
                    <xsl:if test="ROOT/OBJ_INFO/ROW_SET/ROW/FACT_DATE_END!=''">
                    <tr>
                        <td class="spObjDescName">
                            <span class="doTitleSp">Фактическая дата ввода</span>
                        </td>
                        <td class="spObjDescVal" colspan="2">
                            <xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/FACT_DATE_END"/>
                        </td>
                    </tr>
                    </xsl:if>
                </xsl:if>
            </table>
        </td>
        
        <!-- Правая колонка для вывода ТЭП'ов со значением IS_MAIN='Д' в карточке Сводных Перечней -->
        <td class="spInfoRight">
            <xsl:if test="/ROOT/TEPS/ROW_SET/ROW[IS_MAIN='Д']">
                <table class="spMainTepTab">
                    <xsl:for-each select="/ROOT/TEPS/ROW_SET/ROW[IS_MAIN='Д']">
                        <xsl:if test="DIRTY_VALUE">
                        <tr>
                            <td class="spObjInfoTepName2">
                                <div><span><xsl:if test="DIRTY_NAME"><xsl:value-of select="DIRTY_NAME"/></xsl:if></span></div>
                            </td>
                            
                            <!-- Новый вариант - сделать новое имя класса, выровнять текст по правому краю -->
                            <td class="spObjInfoTepVal">
                                <div><xsl:value-of select="DIRTY_VALUE"/></div>
                            </td>
                        </tr>
                        </xsl:if>
                    </xsl:for-each>
                </table>
            </xsl:if>
        </td>
    </tr>

</table>
<xsl:if test="count(/ROOT/OBJ_FNO_306/ROW_SET/ROW) &gt; 0">
    <table>
        <tr>
            <td class="spDescNameAct">
                <div><span>Функциональное назначение (306-ПП)</span></div>
            </td>
            <td class="nested-list">
                <ul>    
                    <xsl:apply-templates select='ROOT/OBJ_FNO_306/ROW_SET/ROW[IS_LEAF = 0]' />
                </ul>
            </td>
        </tr>
    </table>
</xsl:if>

<!-- Вывод таблицы "Плановый срок ввода" для карточки Объекта СВОДНЫХ ПЕРЕЧНЕЙ -->
<xsl:if test="$obj_type ne 'RegBuild'">
    <table class="spPlanTab">
        <tr><td class="spObjDescName" colspan="3" style="background: none;">Плановая дата ввода</td></tr>
        <tr>
            <xsl:element name="td">
                <xsl:choose>
                    <xsl:when test="ROOT/OBJ_INFO/ROW_SET/ROW/RD_SYEAR">
                        <xsl:attribute name="class">spObjDescName</xsl:attribute>
                        <span class="spObjInfoData">по РД</span>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:attribute name="class">spObjDescName</xsl:attribute>
                        <xsl:attribute name="style">padding-left:20px; color:#CFCFCF; background:none; width:210px;</xsl:attribute>
                        по РД:
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:element>
            
            <td class="spOrgInfoYearCell">
                <xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/RD_SYEAR"/>
            </td>
            <td class="doHeaderLink">
                <xsl:choose>
                    <xsl:when test="ROOT/OBJ_INFO/ROW_SET/ROW/RD_DOC_NUMB_ENCODE!='' and ROOT/OBJ_INFO/ROW_SET/ROW/RD_FULL_DATE!='' and ROOT/OBJ_INFO/ROW_SET/ROW/RD_NICK!='' and ROOT/OBJ_INFO/ROW_SET/ROW/RD_ISIO='Д'">
                    <xsl:element name="a">
                        <xsl:attribute name="class">activeLink</xsl:attribute>
                        <xsl:attribute name="target">_self</xsl:attribute>
                        <xsl:attribute name="href">htmlcard.action?documentId=<xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/RD_DOCKEY_ISIO"/></xsl:attribute>
                        №
                        <xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/RD_DOC_NUM"/>
                        от
                        <xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/RD_FULL_DATE"/>
                    </xsl:element>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="ROOT/OBJ_INFO/ROW_SET/ROW/RD_DOC_NUM!='' and ROOT/OBJ_INFO/ROW_SET/ROW/RD_FULL_DATE!=''">
                            №
                            <xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/RD_DOC_NUM"/>
                            от
                            <xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/RD_FULL_DATE"/>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
        </tr>

        <tr>
            <xsl:element name="td">
                <xsl:choose>
                    <xsl:when test="ROOT/OBJ_INFO/ROW_SET/ROW/TITUL_FULL_DATE">
                        <xsl:attribute name="class">spObjDescName</xsl:attribute>
                        <span class="spObjInfoData">по Титулу</span>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:attribute name="class">spObjDescName</xsl:attribute>
                        <xsl:attribute name="style">padding-left:20px; color:#CFCFCF; background:none; width:210px;</xsl:attribute>
                        по Титулу:
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:element>
            
            <td class="spOrgInfoYearCell">
                <xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/TITUL_FULL_DATE"/>
            </td>
            <td class="doHeaderLink">
                <xsl:choose>
                    <xsl:when test="ROOT/OBJ_INFO/ROW_SET/ROW/TITUL_DOCKEY_ISIO!=''">
                    <xsl:element name="a">
                        <xsl:attribute name="class">activeLink</xsl:attribute>
                        <xsl:attribute name="target">_self</xsl:attribute>
                        <xsl:attribute name="href">htmlcard.action?documentId=<xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/TITUL_DOCKEY_ISIO"/></xsl:attribute>
                        <xsl:if test="ROOT/OBJ_INFO/ROW_SET/ROW/TITUL_DOC_NUM!=''">
                            №
                            <xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/TITUL_DOC_NUM"/>
                        </xsl:if>
                        <xsl:if test="ROOT/OBJ_INFO/ROW_SET/ROW/TITUL_SYEAR!=''">
                            от
                            <xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/TITUL_SYEAR"/>
                        </xsl:if>
                    </xsl:element>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="ROOT/OBJ_INFO/ROW_SET/ROW/TITUL_DOC_NUM!='' and ROOT/OBJ_INFO/ROW_SET/ROW/TITUL_FULL_DATE!=''">
                            №
                            <xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/TITUL_DOC_NUM"/>
                            от
                            <xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/TITUL_FULL_DATE"/>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
        </tr>

        <tr>
            <xsl:element name="td">
                <xsl:choose>
                    <xsl:when test="ROOT/OBJ_INFO/ROW_SET/ROW/RAZR_STR_SYEAR">
                        <xsl:attribute name="class">spObjDescName</xsl:attribute>
                        <xsl:attribute name="style">border-left:20px solid #FFFFFF;</xsl:attribute>
                        <!-- <span class="spObjInfoData">по Разрешению на строительство: </span> -->
                        <span style="background-color:#FFFFFF; padding-right:1px;">по Разрешению на строительство: </span>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:attribute name="class">spObjDescName</xsl:attribute>
                        <xsl:attribute name="style">padding-left:20px; color:#CFCFCF; background:none; width:210px;</xsl:attribute>
                        по Разрешению на строительство:
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:element>
            
            <td class="spOrgInfoYearCell">
                <xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/RAZR_STR_SYEAR"/>
            </td>
            
            <td class="doHeaderLink">
                <xsl:choose>
                    <xsl:when test="ROOT/OBJ_INFO/ROW_SET/ROW/RAZR_STR_DOC_NUMB_ENCODE!='' and ROOT/OBJ_INFO/ROW_SET/ROW/RAZR_STR_FULL_DATE!='' and ROOT/OBJ_INFO/ROW_SET/ROW/RAZR_STR_NICK!='' and ROOT/OBJ_INFO/ROW_SET/ROW/RAZR_STR_ISIO='Д'">
                    <xsl:element name="a">
                        <xsl:attribute name="class">activeLink</xsl:attribute>
                        <xsl:attribute name="target">_self</xsl:attribute>
                        <xsl:attribute name="href">htmlcard.action?documentId=<xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/RAZR_STR_DOCKEY_ISIO"/></xsl:attribute>
                        №
                        <xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/RAZR_STR_DOC_NUM"/>
                        от
                        <xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/RAZR_STR_FULL_DATE"/>
                    </xsl:element>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="ROOT/OBJ_INFO/ROW_SET/ROW/RAZR_STR_DOC_NUM!='' and ROOT/OBJ_INFO/ROW_SET/ROW/RAZR_STR_FULL_DATE!=''">
                            №
                            <xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/RAZR_STR_DOC_NUM"/>
                            от
                            <xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/RAZR_STR_FULL_DATE"/>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
        </tr>
        
        <xsl:for-each select="/ROOT/DATE_BY_LIST/ROW_SET/ROW">
            <tr>
                <xsl:element name="td">
                    <xsl:attribute name="class">spObjDescName</xsl:attribute>
                    <xsl:if test="/ROOT/DATE_BY_LIST/ROW_SET/ROW/OBJECT_ID='' or position() &gt; 1">
                        <xsl:attribute name="style">padding-left:20px; color:#CFCFCF; background:none; width:210px;</xsl:attribute>
                    </xsl:if>
                    <xsl:choose>
                        <xsl:when test="position()=1">
                            <span class="spObjInfoData">по перечням</span>
                        </xsl:when>
                        <xsl:otherwise>&#160;</xsl:otherwise>
                    </xsl:choose>
                </xsl:element>
                <td class="spOrgInfoYearCell">
                    <xsl:choose>
                        <xsl:when test="END_DATE!=''">
                            <xsl:value-of select="END_DATE"/>
                        </xsl:when>
                        <xsl:otherwise>&#160;</xsl:otherwise>
                    </xsl:choose>
                </td>
                <td class="doHeaderLink">
                    <xsl:choose>
                        <xsl:when test="NAME_SHORT!=''">
                            <xsl:element name="a">
                                <xsl:attribute name="href">htmlcard.action?documentId=PRG:<xsl:value-of select="PROGRAM_ID"/></xsl:attribute>
                                <xsl:attribute name="class">activeLink</xsl:attribute>
                                <xsl:attribute name="target">_self</xsl:attribute>
                                <xsl:value-of select="NAME_SHORT"/>
                            </xsl:element>
                        </xsl:when>
                        <xsl:otherwise>&#160;</xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
        </xsl:for-each>
            
        
        <!-- <xsl:if test="ROOT/OBJ_INFO/ROW_SET/ROW/END_DATE_FACT!='' and ROOT/OBJ_INFO/ROW_SET/ROW/OBJECT_STATUS='3'">
        <tr>
            <td class="spObjDescName">
                <span class="doTitleSp">Фактическая дата ввода</span>
            </td>
            <td class="spObjDescVal" colspan="2">
                <xsl:value-of select="ROOT/OBJ_INFO/ROW_SET/ROW/FACT_DATE_END"/>
            </td>
        </tr>
        </xsl:if> -->
        
    </table>
</xsl:if>
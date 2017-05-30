<!-- Вывод фотографий (используется в #SP_OBJECT#main_object_card_photo) !!BEGIN!! -->
<xsl:template name="PICS">
    <xsl:if test="/ROOT/OBJ_PHOTO/ROW_SET/ROW/CARD_ID">
        <xsl:for-each select="/ROOT/OBJ_PHOTO/ROW_SET/ROW">
            <xsl:if test="position() &lt;= &quot;2&quot;">

                <!-- Формирование значения для правильного открытия фотографий как в СП так и в Реестрестроек -->
                <xsl:variable name="portalID">
                    <xsl:choose>
                        <xsl:when test="PORTAL_ID"><xsl:value-of select="PORTAL_ID"/></xsl:when>
                        <xsl:otherwise>86711761A3AA4D17BA85E08832B4A7A5</xsl:otherwise> <!-- Статическое значение в случае отсутствия значения в XML-файле -->
                    </xsl:choose>
                </xsl:variable>

                <!-- Вариант с таблицей для корректной вертикальной центровки BEGIN -->
                <xsl:choose>
                    <!-- Вывод правой ячейки в случае наличия данных для второй фотографии -->
                    <!-- Попадаются объекты с одной фотографией, для них необходимо заполнять правую половину для корректного определения ширины превьюшки -->
                    <xsl:when test="position() &gt; 1 and CARD_ID!=''">
                        <td class="spObjPicCell" style="padding-left: 2px;">
                            <table>
                                <tr>
                                    <td class="spObjImgWrap spObjSecondPic" align="center">
                                        <xsl:element name="img">
                                            <xsl:attribute name="src">/portal/getThumb.action?page=1&amp;cardId=<xsl:value-of select="CARD_ID"/></xsl:attribute>
                                            <xsl:attribute name="class">spComPicImg</xsl:attribute>
                                            <xsl:attribute name="title">Перейти в раздел "Фотографии"</xsl:attribute>
                                            <!-- LAST NORM <xsl:attribute name="href">imageNavigator.action?objectId=<xsl:value-of select="GET_OBJECT_ID"/>&amp;documentActionId=<xsl:value-of select="$portalID"/></xsl:attribute> -->
                                            <xsl:attribute name="href">imageNavigator.action?objectId=<xsl:value-of select="GET_OBJECT_ID"/>&amp;documentActionId=<xsl:value-of select="$portalID"/>&amp;cardId=<xsl:value-of select="CARD_ID"/></xsl:attribute>
                                            <xsl:attribute name="target">_blank</xsl:attribute>
                                        </xsl:element>
                                        <span><xsl:value-of select="DESCRIPTION"/></span>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </xsl:when>
                    <xsl:otherwise>
                        <td class="spObjPicCell" style="padding-right: 2px;">
                            <table>
                                <tr>
                                    <td class="spObjImgWrap" align="center">
                                        <xsl:element name="img">
                                            <xsl:attribute name="src">/portal/getThumb.action?page=1&amp;cardId=<xsl:value-of select="CARD_ID"/></xsl:attribute>
                                            <xsl:attribute name="class">spComPicImg</xsl:attribute>
                                            <xsl:attribute name="title">Перейти в раздел "Фотографии"</xsl:attribute>
                                            <xsl:attribute name="href">imageNavigator.action?objectId=<xsl:value-of select="GET_OBJECT_ID"/>&amp;documentActionId=<xsl:value-of select="$portalID"/>&amp;cardId=<xsl:value-of select="CARD_ID"/></xsl:attribute>
                                            <xsl:attribute name="target">_blank</xsl:attribute>
                                        </xsl:element>
                                        <span><xsl:value-of select="DESCRIPTION"/></span>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <!-- Вывод пустой ячейки справа в случае, если есть только одна фотография -->
                        <xsl:if test="count(/ROOT/OBJ_PHOTO/ROW_SET/ROW)=1">
                            <td class="spObjPicCell" style="width:50%;">&#160;</td>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
                <!-- Вариант с таблицей для корректной вертикальной центровки END -->

            </xsl:if>
        </xsl:for-each>
    </xsl:if>
</xsl:template>
<!-- Вывод фотографий !!END!! -->


<!-- Вывод изображений проектной документации (используется main_object_card_project) !!BEGIN!! -->
<xsl:template name="PROJPICS">
    <xsl:if test="/ROOT/OBJ_PRPIC/ROW_SET/ROW/CARD_ID">
        <xsl:for-each select="/ROOT/OBJ_PRPIC/ROW_SET/ROW">
            <xsl:if test="position() &lt;= &quot;2&quot;">

                <!-- Формирование значения для правильного открытия фотографий как в СП так и в Реестрестроек -->
                <xsl:variable name="portalID">
                    <xsl:choose>
                        <xsl:when test="PORTAL_ID"><xsl:value-of select="PORTAL_ID"/></xsl:when>
                        <xsl:otherwise>2DE10926749E437892149A455BD4E6CC</xsl:otherwise> <!-- Статическое значение в случае отсутствия значения в XML-файле -->
                    </xsl:choose>
                </xsl:variable>

                <!-- Новый вариант для ссылки BEGIN -->
                <xsl:choose>
                    <xsl:when test="position() &gt; 1">
                        <td class="spObjPicCell" style="padding-left: 2px;">
                            <table>
                                <tr>
                                    <td class="spObjImgWrap spObjSecondPic" align="center">
                                        <xsl:element name="img">
                                            <xsl:attribute name="src">/portal/getThumb.action?page=1&amp;cardId=<xsl:value-of select="CARD_ID"/></xsl:attribute>
                                            <xsl:attribute name="class">spComPicImg</xsl:attribute>
                                            <xsl:attribute name="title">Перейти в раздел "Альбом АГР"</xsl:attribute>
                                            <!-- FORM PHOTO <xsl:attribute name="href">imageNavigator.action?objectId=<xsl:value-of select="GET_OBJECT_ID"/>&amp;documentActionId=<xsl:value-of select="$portalID"/>&amp;cardId=<xsl:value-of select="CARD_ID"/></xsl:attribute> -->
                                            <!-- LAST NORM -->
                                            <!-- <xsl:attribute name="href"><xsl:value-of select="/ROOT/OBJ_LINKS/ROW_SET/ROW[PROPERTY_KEY='photo_link']/PROPERTY_VALUE"/>imageNavigator.action?xmlDocId=<xsl:value-of select="XML_DOC_ID"/>&amp;cardId=<xsl:value-of select="CARD_ID"/></xsl:attribute> -->

                                            <xsl:attribute name="href"><xsl:value-of select="/ROOT/OBJ_LINKS/ROW_SET/ROW[PROPERTY_KEY='photo_link']/PROPERTY_VALUE"/>imageNavigator.action?cardId=<xsl:value-of select="CARD_ID"/>&amp;documentActionId=<xsl:value-of select="$portalID"/>&amp;objectId=<xsl:value-of select="ALLOBJID"/></xsl:attribute>
                                        </xsl:element>
                                        <span><xsl:value-of select="DESCRIPTION"/></span>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </xsl:when>
                    <xsl:otherwise>
                        <td class="spObjPicCell" style="padding-right: 2px;">
                            <table>
                                <tr>
                                    <td class="spObjImgWrap" align="center">
                                        <xsl:element name="img">
                                            <xsl:attribute name="src">/portal/getThumb.action?page=1&amp;cardId=<xsl:value-of select="CARD_ID"/></xsl:attribute>
                                            <xsl:attribute name="class">spComPicImg</xsl:attribute>
                                            <xsl:attribute name="title">Перейти в раздел "Альбом АГР"</xsl:attribute>
                                            <!-- LAST NORM -->
                                            <!-- <xsl:attribute name="href"><xsl:value-of select="/ROOT/OBJ_LINKS/ROW_SET/ROW[PROPERTY_KEY='photo_link']/PROPERTY_VALUE"/>imageNavigator.action?xmlDocId=<xsl:value-of select="XML_DOC_ID"/>&amp;cardId=<xsl:value-of select="CARD_ID"/></xsl:attribute> -->

                                            <xsl:attribute name="href"><xsl:value-of select="/ROOT/OBJ_LINKS/ROW_SET/ROW[PROPERTY_KEY='photo_link']/PROPERTY_VALUE"/>imageNavigator.action?cardId=<xsl:value-of select="CARD_ID"/>&amp;documentActionId=<xsl:value-of select="$portalID"/>&amp;objectId=<xsl:value-of select="ALLOBJID"/></xsl:attribute>
                                        </xsl:element>
                                        <span><xsl:value-of select="DESCRIPTION"/></span>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <!-- Вывод пустой ячейки справа в случае, если есть только одна превьюшка проектных материалов -->
                        <xsl:if test="count(/ROOT/OBJ_PRPIC/ROW_SET/ROW)=1">
                            <td class="spObjPicCell" style="width:50%;">&#160;</td>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
                <!-- Новый вариант для ссылки END -->

            </xsl:if>
        </xsl:for-each>
    </xsl:if>
</xsl:template>
<!-- Вывод изображений проектной документации !!END!! -->

<!-- Вывод хода строительства !!BEGIN!! -->
<xsl:template name="buildProgress">

    <!-- Строка с датой и названием раздела -->
    <!-- Новая вёрстки в табличном стиле для выравнивания заголовка по правому краю. -->
    <!-- Старый вариант с блочной вёрсткой и сохранившимся вариантом ссылки "Подробнее" рядом с заголовоком - см. архив от 20.01.2011 -->
    <style type="text/css">
        span.perm{background:url(img/sp/1.gif) no-repeat top left;}
        span.ind{display:inline-block;margin-right:5px;width:10px;height:10px;}
        div#Percents{display:block;width:200px;height:10px;background-color:#ccc;margin:5px 10px 0 0;padding:0px;overflow:hidden;float:left;}
        div#donePercents{display:block;height:10px;background-color:#009900;margin:0px;padding:0px;}
    </style>
<xsl:choose>
    <xsl:when test="RC_VVOD_NAME or HDATECONDITION or MGSN_ARCHIVE or MDATE">
        <xsl:if test="RC_VVOD_NAME">
        <table class="spObjBuildTab hodv3">

            <tr><td>
                <xsl:element name="img">
                    <xsl:attribute name="src">img/isio/hod_ico/stat<xsl:value-of select="ICO_NUM_VVOD"/>.png</xsl:attribute>
                    <xsl:attribute name="alt"><xsl:value-of select="RC_VVOD_NAME"/></xsl:attribute>
                    <xsl:attribute name="style">padding:10px 0 5px</xsl:attribute>
                </xsl:element>
            </td></tr>
            <tr><td class="spObjConditionCell" style="position:relative">
                <xsl:element name="div">
                    <xsl:attribute name="class">colored</xsl:attribute>
                    <xsl:attribute name="style">background-color:#<xsl:value-of select="RC_VVOD_COLOR"/>;</xsl:attribute>
                    <xsl:value-of select="RC_VVOD_NAME"/>
                </xsl:element>
            </td></tr>
            <xsl:if test="RC_VVOD_NOTE">
                <tr><td><xsl:value-of select="RC_VVOD_NOTE"/></td></tr>
            </xsl:if>
            <xsl:if test="RC_VVOD_SOURCE">
                <tr><td>Источник сведений: <xsl:value-of select="RC_VVOD_SOURCE"/></td></tr>
            </xsl:if>
            <tr><td style="color:#aaa;font-weight:normal;font-size:89%;margin:10px 0px">
                <xsl:value-of select="RC_VVOD_ORGNAME"/>
             </td></tr>
        </table>
        <xsl:if test="(RC_VVOD_NAME and HDATECONDITION)or (RC_VVOD_NAME and MGSN_ARCHIVE) or (RC_VVOD_NAME and MDATE)">
            <br /><hr />
        </xsl:if>
    </xsl:if>


    <xsl:if test="HDATECONDITION">
    <table class="spObjBuildTab hodv3">
        <col width="120" />
        <col width="250" />
        <tr>
            <td>
                <xsl:element name="a">
                   <!-- <xsl:attribute name="href">htmlcardbody.action?documentId=<xsl:value-of select="HDOCID"/></xsl:attribute>   US-217  -->
                   <!--<xsl:attribute name="href">http://ugd-test.mos.ru/portal/htmlcardbody.action?documentId=<xsl:value-of select="HDOCID"/></xsl:attribute>  US-217 -->
                   <xsl:attribute name="href"><xsl:value-of select="/ROOT/V_HREF/ROW_SET/ROW/V_HREF"/>/portal/htmlcardbody.action?documentId=<xsl:value-of select="HDOCID"/></xsl:attribute>  <!-- US-217 -->
                    <xsl:element name="img">
                        <xsl:attribute name="src">img/isio/hod_ico/stat<xsl:value-of select="ICO_NUM_HOD"/>.png</xsl:attribute>
                        <xsl:attribute name="alt"><xsl:value-of select="RC_VVOD_NAME"/></xsl:attribute>
                        <xsl:attribute name="style">padding:10px 0 5px</xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </td>
            <td align="left" valign="top">
                <div style="position:relative">
                    <xsl:if test="(HENDPERCENT) and (HENDPERCENT&gt;0)">
                        <xsl:element name="div">
                            <xsl:attribute name="style">color:#<xsl:value-of select="HCOLOR"/>;font-size:24px;text-align:left;position:relative;left:-2px;top:15px</xsl:attribute>
                            <xsl:value-of select="HENDPERCENT"/>&#160;%
                        </xsl:element>
                    </xsl:if>
                    <xsl:if test="HSROKVVODAPLAN">
                        <xsl:element name="span">
                            <xsl:attribute name="style">display:block;color:#aaa;font-size:89%;font-weight:bold;position:absolute;top:49px</xsl:attribute>
                            <xsl:value-of select="HSROKVVODAPLAN"/>
                        </xsl:element>
                    </xsl:if>
                 </div>
            </td>
        </tr>

        <tr>
            <td class="spObjConditionCell" colspan="2" style="position:relative">
                <xsl:element name="div">
                    <xsl:attribute name="class">colored</xsl:attribute>
                    <xsl:attribute name="style">background-color:#<xsl:value-of select="HCOLOR"/></xsl:attribute>
                    <span style="position:absolute;display:block;left:0px;top:0px;background:url() no-repeat top left;width:4px;height:21px;"></span>
                    <xsl:value-of select="HNAME"/>
                </xsl:element>
                <xsl:if test="HPROBLEMTYPE"><p><xsl:value-of select="HPROBLEMTYPE"/></p></xsl:if>
                <xsl:if test="HCOMMENT">
                    <p>
                        <xsl:value-of select="HCOMMENT"/>
                        <xsl:if test="HWORKINGPERSON&gt;0">&#160;|&#160;<xsl:value-of select="HWORKINGPERSON"/> чел.</xsl:if>
                    </p>
                </xsl:if>
                <xsl:if test="HRAZVVODNUM"><p><xsl:value-of select="HRAZVVODNUM"/></p></xsl:if>
                <xsl:if test="HTRANSFERSETTLING=1"><p><span class="perm ind"></span>Передан под заселение</p></xsl:if>
            </td>
        </tr>



        <xsl:if test="HCONDITIONCONSTRUCTION">
            <tr><td colspan="2"><xsl:value-of select="HCONDITIONCONSTRUCTION"/></td></tr>
        </xsl:if>

        <tr><td colspan="2" style="color:#aaa;font-weight:normal;font-size:89%;margin:10px 0px">
                <xsl:value-of select="HDATECONDITION"/>&#160;&#160;<xsl:value-of select="HORGNAME"/>
         </td></tr>
    </table>
    </xsl:if>

    <xsl:if test="(HDATECONDITION and MGSN_ARCHIVE) or (HDATECONDITION and MDATE)"><br /><hr /></xsl:if>

    <xsl:if test="MGSN_ARCHIVE">
        <table class="spObjBuildTab hodv3">
            <tr><td>
                <xsl:element name="img">
                    <xsl:attribute name="src">img/isio/hod_ico/stat11.png</xsl:attribute>
                    <xsl:attribute name="alt"><xsl:value-of select="ARCHIVEREASON"/></xsl:attribute>
                    <xsl:attribute name="style">padding:10px 0 5px</xsl:attribute>
                </xsl:element>
            </td></tr>
            <tr>
                <td class="spObjConditionCell" style="position:relative">
                    <xsl:element name="div">
                        <xsl:attribute name="class">colored</xsl:attribute>
                        <xsl:attribute name="style">background-color:#cc0000;</xsl:attribute>
                        <span style="position:absolute;display:block;left:0px;top:0px;background:url() no-repeat top left;width:4px;height:21px;"></span>
                        <xsl:value-of select="MGSN_ARCHIVE"/>
                    </xsl:element>
                    <xsl:if test="FLAGDOLGOSTROY">
                        <p><xsl:value-of select="FLAGDOLGOSTROY"/></p>
                    </xsl:if>
                    <xsl:if test="FLAGCONSERV">
                        <p><xsl:value-of select="FLAGCONSERV"/></p>
                    </xsl:if>
                    <xsl:if test="FLAGAVARIYA">
                        <p><xsl:value-of select="FLAGAVARIYA"/></p>
                    </xsl:if>
                </td>
            </tr>
            <xsl:if test="ARCHIVEREASONCOMMENT">
                <tr><td colspan="2"><xsl:value-of select="ARCHIVEREASONCOMMENT"/></td></tr>
            </xsl:if>
            <xsl:if test="MGSN_INFO">
                <tr><td style="color:#aaa;font-weight:normal;font-size:89%;margin:10px 0px"><xsl:value-of select="MGSN_INFO"/></td></tr>
            </xsl:if>
        </table>
    </xsl:if>
    <xsl:if test="MDATE">
        <table class="spObjBuildTab hodv3">
            <col width="120" />
            <col width="250" />
            <xsl:if test="ICO_NUM_M or MDATE_VVOD">
            <tr>
                <td width="120">
                   <xsl:if test="ICO_NUM_M">
                        <xsl:element name="img">
                            <xsl:attribute name="src">img/isio/hod_ico/stat<xsl:value-of select="ICO_NUM_M"/>.png</xsl:attribute>
                            <xsl:attribute name="alt"><xsl:value-of select="RC_VVOD_NAME"/></xsl:attribute>
                            <xsl:attribute name="style">padding:10px 0 5px</xsl:attribute>
                        </xsl:element>
                   </xsl:if>
                </td>
                <td align="left" valign="top">
                    <xsl:if test="MDATE_VVOD">
                        <div style="position:relative">
                            <xsl:element name="span">
                                <xsl:attribute name="style">color:#009900;font-size:89%;font-weight:bold;position:absolute;top:49px</xsl:attribute>
                                <xsl:value-of select="MDATE_VVOD"/>
                            </xsl:element>
                        </div>
                    </xsl:if>
                </td>
            </tr>
            </xsl:if>
            <xsl:if test="MNAME or MCOMMENT or MI3_2">
            <tr>
                <td class="spObjConditionCell" colspan="2" style="position:relative">
                    <xsl:if test="MNAME">
                            <xsl:element name="div">
                            <xsl:attribute name="class">colored</xsl:attribute>
                            <xsl:attribute name="style">background-color:#<xsl:value-of select="MCOLOR"/>;</xsl:attribute>
                            <span style="position:absolute;display:block;left:0px;top:0px;background:url() no-repeat top left;width:4px;height:21px;"></span>
                            <xsl:value-of select="MNAME"/>
                        </xsl:element>
                    </xsl:if>
                    <xsl:if test="MCOMMENT">
                        <p><xsl:value-of select="MCOMMENT"/></p>
                    </xsl:if>
                    <xsl:if test="MI3_2">
                        <p><xsl:value-of select="MI3_2"/></p>
                    </xsl:if>
                </td>
            </tr>
            </xsl:if>
            <xsl:if test="MCONDITIONCONSTRUCTION">
                <tr><td colspan="2">
                    <xsl:choose>
                        <xsl:when test="contains(MCONDITIONCONSTRUCTION, '&lt;br')">
                            <xsl:value-of select="substring-before(MCONDITIONCONSTRUCTION, '&lt;')"/><br /><xsl:value-of select="substring-after(MCONDITIONCONSTRUCTION, '&gt;')"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="MCONDITIONCONSTRUCTION"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </td></tr>
            </xsl:if>
            <tr><td style="color:#aaa;font-weight:normal;font-size:89%;margin:10px 0px" colspan="2">
                <xsl:value-of select="MDATE"/>&#160;&#160;Мосгосстройнадзор
             </td></tr>
        </table>
    </xsl:if>
    </xsl:when>
    <xsl:otherwise>
        <table class="spObjBuildTitle spObjBuildInf" style="margin-bottom:10px;">
        <tr>
            <td class="comObjHodLeft">
                <xsl:choose>
                <!-- Вывод даты -->
                    <xsl:when test="CDATE">
                        <xsl:choose>
                            <!-- Вывод серой ячейки с датой в случае если период между датой события и текущей датой больше месяца -->
                            <xsl:when test="DATA_DIF &lt; 1">
                                <span style="background-color:#008E00;"><xsl:value-of select="CDATE"/></span>
                            </xsl:when>
                            <xsl:otherwise>
                                <span style="background-color:#8B8B8B;"><xsl:value-of select="CDATE"/></span>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <span style="background-color: #FFFFFF;">&#160;</span>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
            <td class="comObjHodRight">
                <!-- Вывод заголовка -->
                <xsl:if test="CSOURCE"><xsl:value-of select="CSOURCE"/></xsl:if>
            </td>
        </tr>
    </table>

    <xsl:if test="STAGE or CONSTR or PERSON">
    <table class="spObjBuildTab">
        <!-- <xsl:if test="CONSTR"> -->
        <xsl:if test="CONDITION">
        <tr>
            <td class="spObjBuildCell"><span class="spObjBuildVal">Общее состояние</span></td>
            <td class="spObjConditionCell"><xsl:value-of select="CONDITION"/></td>
        </tr>
        </xsl:if>

        <xsl:if test="STAGE">
        <tr>
            <td class="spObjBuildCell"><span class="spObjBuildVal">Стадия строительства</span></td>
            <td class="spObjConditionCell"><xsl:value-of select="STAGE"/></td>
        </tr>
        </xsl:if>

        <xsl:if test="PERSON">
        <tr>
            <td class="spObjBuildCell"><span class="spObjBuildVal">Количество работающих</span></td>
            <td class="spObjConditionCell"><xsl:value-of select="PERSON"/></td>
        </tr>
        </xsl:if>
    </table>
    </xsl:if>

    <!-- LAST HALF-NORM
    <xsl:if test="CONDITION">
    <div class="currentCondition"><xsl:value-of select="CONDITION"/></div>
    </xsl:if> -->
    <xsl:if test="CONSTR">
    <div class="currentCondition"><xsl:value-of select="CONSTR"/></div>
    </xsl:if>
    </xsl:otherwise>
</xsl:choose>

</xsl:template>
<!-- Вывод хода строительства !!END!! -->




<!-- Состояние проектной подготовки строительства !!BEGIN!! -->
<xsl:template name="sppBuild">

    <!-- Строка с датой и названием раздела -->
    <div class="spObjBuildTitle">
        <div class="spObjBuildInf">

        <xsl:choose>
            <!-- Вывод даты -->
            <xsl:when test="CDATE_SORT">
                <span style="background-color:#8B8B8B;"><xsl:value-of select="CDATE_SORT"/></span>
            </xsl:when>
            <xsl:otherwise>
                <span style="background-color: #FFFFFF;">
                    &#160;
                </span>
            </xsl:otherwise>
        </xsl:choose>

        <!-- Вывод заголовка -->
        <xsl:if test="CSOURCE">
            <xsl:value-of select="CSOURCE"/>
        </xsl:if>
        </div>

        <!-- Вывод ссылки "Подробнее" в зависимости от содержимого заголовка -->
        <xsl:if test="DOCKEY_ISIO!=''">
            <div class="detailLinkWrap">
                <xsl:element name="a">
                    <!--xsl:attribute name="href">htmlcard.action?documentId=<xsl:value-of select="DOCKEY_ISIO"/></xsl:attribute-->
                    <xsl:attribute name="href">getCardHtml.action?cardId=CARD$DOC_REDIRECT&amp;documentId=<xsl:value-of select="DOCKEY_ISIO"/></xsl:attribute>
                    <xsl:attribute name="target">_self</xsl:attribute>
                    <xsl:attribute name="class">detailLink</xsl:attribute>
                    Подробнее
                </xsl:element>
            </div>
        </xsl:if>
    </div>

    <xsl:if test="STAGE or CONSTR or PERSON or CONDITION">
    <table class="spObjBuildTab">
        <xsl:if test="STAGE">
        <tr>
            <td class="spObjBuildCell">
                <span class="spObjBuildVal">Общее состояние</span>
            </td>
            <td class="spObjConditionCell">
                <xsl:value-of select="STAGE"/>
            </td>
        </tr>
        </xsl:if>

        <xsl:if test="CONSTR">
        <tr>
            <td class="spObjBuildCell">
                <span class="spObjBuildVal">Стадия строительства</span>
            </td>
            <td class="spObjConditionCell">
                <xsl:value-of select="CONSTR"/>
            </td>
        </tr>
        </xsl:if>

        <xsl:if test="PERSON">
        <tr>
            <td class="spObjBuildCell">
                <span class="spObjBuildVal">Количество работающих</span>
            </td>
            <td class="spObjConditionCell">
                <xsl:value-of select="PERSON"/>
            </td>
        </tr>
        </xsl:if>

        <xsl:if test="CONDITION">
            <tr>
                <td class="spObjBuildCell">
                    <span class="spObjBuildVal">Вид проектной документации</span>
                </td>
                <td class="spObjConditionCell">
                    <xsl:value-of select="CONDITION"/>
                </td>
            </tr>
        </xsl:if>
    </table>
    </xsl:if>

</xsl:template>
<!-- Состояние проектной подготовки строительства !!END!! -->

<!-- Шаблон вывода серых строк в разделе "Документационное обеспечение" !!BEGIN!! -->
<xsl:template name="grayDocRow">
    <xsl:param name="stringText" select="' '"/>
    <tr class="gpzuGrayOrig">
        <td class="doGrayDoc spIconCell doIconEmpty">&#160;</td>
        <!-- <td class="doTitle grayText"> -->
        <td class="spObjDoTitle grayText">
            <xsl:value-of select="$stringText"/>
        </td>
        <td class="doLink">&#160;</td>
        <td class="doDate">&#160;</td>
        <td class="doInfo">&#160;</td>
    </tr>
</xsl:template>
<!-- Шаблон вывода серых строк в разделе "Документационное обеспечение" !!END!! -->


<!-- Шаблон вывода обычных строк в разделе "Документационное обеспечение" !!BEGIN!! -->
<xsl:template name="viewDocRow">
    <xsl:param name="stringClass" select="' '"/>
    <xsl:param name="firstCellClass" select="' '"/>
    <xsl:param name="iconComment" select="' '"/>
        <xsl:element name="tr">
            <xsl:attribute name="class"><xsl:value-of select="$stringClass"/></xsl:attribute>
            <xsl:attribute name="width">100%</xsl:attribute>

            <!-- Вывод иконки в back-ground ячейки таблицы -->
            <xsl:element name="td">
                <xsl:attribute name="class"><xsl:value-of select="$firstCellClass"/></xsl:attribute>
                <xsl:attribute name="title"><xsl:value-of select="$iconComment"/></xsl:attribute>
                <!-- OLD &#160; -->
                <div style="width:16px;"></div>
            </xsl:element>

            <!-- Вариант вывода иконки в виде ссылки для отображения комментария в "alt" -->
            <!-- <td>
                <xsl:element name="a">
                    <xsl:attribute name="class"><xsl:value-of select="$firstCellClass"/> spObjDocIconLink</xsl:attribute>
                    <xsl:attribute name="title"><xsl:value-of select="$iconComment"/></xsl:attribute>
                    <xsl:attribute name="href">#</xsl:attribute>
                    &#160;
                </xsl:element>
            </td> -->

            <xsl:element name="td">
                <xsl:if test="DOC_NUMB != ''">
                    <xsl:attribute name="class">spObjDoTitle</xsl:attribute>
                </xsl:if>
                <span class="doTitleSp">
                    <xsl:value-of select="DOC_TYPE_NAME"/>
                </span>
            </xsl:element>

            <td class="doLink">
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
                    <xsl:otherwise>
                        <xsl:value-of select="DOC_NUMB"/>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:if test="IS_DOC=0">
                    (Заявка)
                </xsl:if>
            </td>
            <td class="doDate">
                <xsl:choose>
                    <xsl:when test="DOC_DATE!=''">
                        <xsl:value-of select="DOC_DATE"/>
                    </xsl:when>
                    <xsl:otherwise>
                        &#160;
                    </xsl:otherwise>
                </xsl:choose>
            </td>
            <td class="doInfo">
                <xsl:choose>
                    <xsl:when test="DOC_STATUS_NAME!=''">
                        <xsl:value-of select="DOC_STATUS_NAME"/>
                    </xsl:when>
                    <xsl:otherwise>
                        &#160;
                    </xsl:otherwise>
                </xsl:choose>
            </td>
        </xsl:element>
</xsl:template>
<!-- Шаблон вывода обычных строк в разделе "Документационное обеспечение" !!END!! -->


<!-- Шаблон вывода правой колонки таблицы в закладке "Организации" !!BEGIN!! -->
<xsl:template name="orgRightCell">
    <xsl:param name="tdClass" value="' '"/>
    <xsl:param name="iconClass" value="' '"/>
    <xsl:param name="tableType" select="' '"/>
    <xsl:param name="iconComment" select="' '"/>

    <xsl:choose>
        <!-- Вывод четырёх колонок для таблицы "По ролям" (В настоящий момент не используется) -->
        <!-- (вывод всей информации в правую колонку производится в одну строку - см. ниже) -->
        <xsl:when test="$tableType='byRole'">

            <xsl:element name="td">
                <xsl:attribute name="style"><xsl:value-of select="$tdClass"/></xsl:attribute>
                <xsl:attribute name="class">spOrgDocCell</xsl:attribute>

                <xsl:if test="DOC_TYPE_NAME"> <!-- Вывод названия документа -->
                    <xsl:element name="span">
                        <xsl:attribute name="class">spDocTypeWrap <xsl:value-of select="$iconClass"/></xsl:attribute>
                        <xsl:value-of select="DOC_TYPE_NAME"/>
                    </xsl:element>
                </xsl:if>
            </xsl:element>

            <xsl:element name="td"> <!-- Ссылка на номер документа -->
                <xsl:attribute name="style"><xsl:value-of select="$tdClass"/>text-align:left; padding-left: 5px;</xsl:attribute>

                <xsl:if test="DOC_NUMB!=''">
                    <xsl:element name="a">
                        <xsl:attribute name="target">_self</xsl:attribute>
                        <!-- <xsl:attribute name="href">http://isio.stroy.mos.ru/portal/htmlcard.action?documentId=<xsl:value-of select="DOCKEY_ISIO"/></xsl:attribute> -->
                        <!--xsl:attribute name="href">htmlcard.action?documentId=<xsl:value-of select="DOCKEY_ISIO"/></xsl:attribute-->
                        <xsl:attribute name="href">getCardHtml.action?cardId=CARD$DOC_REDIRECT&amp;documentId=<xsl:value-of select="DOCKEY_ISIO"/></xsl:attribute>

                        <xsl:attribute name="class">
                            spDocNumbWrap
                        </xsl:attribute>

                            № <xsl:value-of select="DOC_NUMB"/>
                    </xsl:element>
                </xsl:if>
            </xsl:element>

            <xsl:element name="td"> <!-- Вывод даты документа -->
                <xsl:attribute name="style"><xsl:value-of select="$tdClass"/>white-space:nowrap; padding-left: 5px;</xsl:attribute>

                <xsl:choose>
                    <xsl:when test="DOC_DATE!=''">
                            от <xsl:value-of select="DOC_DATE"/>
                    </xsl:when>
                    <!-- В случае отсутствия даты - вывод пробела для корректного отображения подчёркивания ячейки -->
                    <xsl:otherwise test="DOC_DATE=''">
                        &#160;
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:element>

            <xsl:element name="td"> <!-- Вывод статуса документа -->
                <xsl:attribute name="style"><xsl:value-of select="$tdClass"/>text-align:left; padding-left: 5px; padding-right: 5px;</xsl:attribute>

                <xsl:choose>
                    <xsl:when test="DOC_STATUS_NAME!=''">
                        <xsl:value-of select="DOC_STATUS_NAME"/>
                    </xsl:when>
                     <!-- В случае отсутствия статуса документа - вывод пробела для корректного отображения подчёркивания ячейки -->
                    <xsl:otherwise test="DOC_STATUS_NAME=''">
                        &#160;
                    </xsl:otherwise>
                </xsl:choose>

            </xsl:element>
        </xsl:when>


        <!-- Вывод одной строкой для таблицы "По организациям" -->
        <xsl:otherwise>

            <!-- Ячейка для вывода иконки документа - сделано отдельной ячейкой для правильного отступа -->
            <!-- слева при длинных строка и корректного отображения курсора при наведении на иконку -->
            <xsl:element name="td">
                <xsl:attribute name="style"><xsl:value-of select="$tdClass"/></xsl:attribute>
                <xsl:attribute name="class">spOrgIconCell <xsl:value-of select="$iconClass"/></xsl:attribute>
                <xsl:attribute name="title"><xsl:value-of select="$iconComment"/></xsl:attribute>
                &#160;
            </xsl:element>

            <xsl:element name="td"> <!-- Ячейка для вывода информации по документу -->
                <xsl:attribute name="style"><xsl:value-of select="$tdClass"/>padding-right:5px;</xsl:attribute>
                <xsl:attribute name="class">spOrgDocCell</xsl:attribute>

                <xsl:element name="span">
                    <xsl:attribute name="class">spDocByOrg</xsl:attribute>

                    <xsl:if test="DOC_TYPE_NAME">
                        <xsl:value-of select="DOC_TYPE_NAME"/>
                    </xsl:if>

                    <!-- Старый вариант формирования ссылки -->
                    <!-- <xsl:if test="DOCKEY_ISIO!=''">
                        <xsl:element name="a">
                            <xsl:attribute name="target">_self</xsl:attribute>
                            <xsl:attribute name="href">http://isio.stroy.mos.ru/portal/htmlcard.action?documentId=<xsl:value-of select="DOCKEY_ISIO"/></xsl:attribute>

                            <xsl:attribute name="class">
                                spDocLinkByOrg
                            </xsl:attribute>№ <xsl:value-of select="DOC_NUMB"/>
                        </xsl:element>
                    </xsl:if> -->
                    <xsl:choose>
                        <xsl:when test="DOCKEY_ISIO!='' and DOC_NUMB!=''">
                            <xsl:element name="a">
                                <xsl:attribute name="target">_self</xsl:attribute>
                                <!-- <xsl:attribute name="href">http://isio.stroy.mos.ru/portal/htmlcard.action?documentId=<xsl:value-of select="DOCKEY_ISIO"/></xsl:attribute> -->
                                <!--xsl:attribute name="href">htmlcard.action?documentId=<xsl:value-of select="DOCKEY_ISIO"/></xsl:attribute-->
                                <xsl:attribute name="href">getCardHtml.action?cardId=CARD$DOC_REDIRECT&amp;documentId=<xsl:value-of select="DOCKEY_ISIO"/></xsl:attribute>

                                <xsl:attribute name="class">
                                    spDocLinkByOrg
                                </xsl:attribute>№ <xsl:value-of select="DOC_NUMB"/>
                            </xsl:element>
                        </xsl:when>
                        <xsl:otherwise>
                            <span class="spDocNumber">№ <xsl:value-of select="DOC_NUMB"/></span>
                        </xsl:otherwise>
                    </xsl:choose>

                    <xsl:if test="DOC_DATE!=''">
                        от <xsl:value-of select="DOC_DATE"/>
                    </xsl:if>

                    <xsl:if test="DOC_STATUS_NAME!=''">
                        <span class="spDocStatusWrap">
                            <xsl:value-of select="DOC_STATUS_NAME"/>
                        </span>
                    </xsl:if>

                    <xsl:if test="DOC_DATE='' and DOC_STATUS_NAME=''">
                        &#160;
                    </xsl:if>
                </xsl:element>
            </xsl:element>
        </xsl:otherwise>
    </xsl:choose>

</xsl:template>
<!-- Шаблон вывода правой колонки таблицы в закладке "Организации" !!END!! -->


<!-- Шаблон для корректной передачи значения iconClass (класс стиля) в шаблон orgRightCell !!BEGIN!! -->
<xsl:template name="rightCellTempl">
    <xsl:param name="iconClass" value="' '"/>
    <xsl:param name="nextOrg" select="' '"/>
    <xsl:param name="tableType" select="' '"/>
    <xsl:param name="pos" select="' '"/>
    <xsl:param name="last" select="' '"/>
    <xsl:param name="iconComment" select="' '"/>

    <xsl:choose>
        <xsl:when test="$nextOrg!='' or $pos=$last">
            <!-- Если в следующей строке колонка "Организация" не пустая - для ячейки определяется нижняя граница -->
            <xsl:variable name="tdClass" select="'border-bottom:1px solid #CFCFCF;padding-bottom:9px;'"/>
            <xsl:call-template name="orgRightCell"> <!-- Вызов шаблона для вывода содержимого колоноки "Основание" -->
                <xsl:with-param name="tdClass" select="$tdClass"/> <!-- Передача параметра, определяющего нижнюю границы ячейки -->
                <xsl:with-param name="iconClass" select="$iconClass"/> <!-- Передача параметра, определяющего иконку для строки -->
                <xsl:with-param name="tableType" select="$tableType"/>
                <xsl:with-param name="iconComment" select="$iconComment"/> <!-- Передача переметра, определяющего комментарий, выводимый при наведении курсора -->
            </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
            <xsl:variable name="tdClass" select="'border-bottom:0px none !important;'"/>
            <xsl:call-template name="orgRightCell"> <!-- Вызов шаблона для вывода содержимого колоноки "Основание" -->
                <xsl:with-param name="tdClass" select="$tdClass"/> <!-- Передача параметра, определяющего нижнюю границы ячейки -->
                <xsl:with-param name="iconClass" select="$iconClass"/> <!-- Передача параметра, определяющего иконку для строки -->
                <xsl:with-param name="tableType" select="$tableType"/>
                <xsl:with-param name="iconComment" select="$iconComment"/> <!-- Передача переметра, определяющего комментарий, выводимый при наведении курсора -->
            </xsl:call-template>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>
<!-- Шаблон для корректной передачи значения iconClass (класс стиля) в шаблон orgRightCell !!END!! -->

<!-- Шаблон для рекурсивного вывода объектов в поле "Фукнциональное назначение (306-ПП)" (используется в #COMMON#object_card_info) -->
<xsl:template match='/ROOT/OBJ_FNO_306/ROW_SET/ROW'>
    <xsl:variable name="parent" select="/ROOT/OBJ_FNO_306/ROW_SET/ROW[ID_PARENT=current()/ID]"/>
    <li data-leaf="{IS_LEAF}">
    <strong><xsl:value-of select="CODE"/></strong>
    <xsl:text> </xsl:text>
    <xsl:value-of select="NAME"/>

    <xsl:if test="$parent != ''">
      <ul>
           <xsl:apply-templates select="$parent" />
      </ul>
    </xsl:if>
    </li>
</xsl:template>

<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="utf-8" indent="no"/>

    <xsl:template match="/">
    
        {B{CARD_APPEAL_Styles}E}
    
        <XML class="body" style="display: none;">
            <xsl:copy-of select="."/>
        </XML>
        
        <div class="cardWrapper">
            <div class="cardLeftSide">
                <div class="grayBlock dataBlock">
                    <div class="paddingBlock">
                        Заявление  <b>№ <xsl:value-of select="//REGUEST//ORDER_NUMBER"/>
                              <xsl:if test="//REGUEST//ORDER_DATE != ''"> от <xsl:value-of select="//REGUEST//ORDER_DATE"/></xsl:if></b>
                    </div>
                </div>
                <!--xsl:if test="//RES_RESOLUTION">
                <div class="whiteBlock dataBlock">
                    <div class="paddingBlock">
                        <h2>Заключение</h2>
                        <div class="grayText">Заключение государственной экспертизы</div>
                        <div class="blueText">
                            <xsl:value-of select="//RES_RESOLUTION//DOC_NUMBER"/>
                            <xsl:if test="//RES_RESOLUTION//DATE_COMPLETED != ''"> от <xsl:value-of select="//RES_RESOLUTION//DATE_COMPLETED"/></xsl:if>
                        </div>
                        <xsl:choose>
                            <xsl:when test="//RES_RESOLUTION//IS_APPROVED = '1'"><div class="greenText">Положительное заключение</div></xsl:when>
                            <xsl:otherwise><div class="redText">Отрицательное заключение</div></xsl:otherwise>
                        </xsl:choose>
                        
                        <br/>
                        
                        <div class="grayText">Регистрационный номер в реестре</div>
                        <div><xsl:value-of select="//RES_RESOLUTION//REGISTRY_NUMBER"/>
                            <xsl:if test="//RES_RESOLUTION//REGISTRY_DATE != ''"> от <xsl:value-of select="//RES_RESOLUTION//REGISTRY_DATE"/></xsl:if>
                        </div>
                        
                        <br/>
                        
                        <div class="grayText">Передача заявителю</div>
                        <div><xsl:value-of select="//RES_RESOLUTION//DATE_COMPLETED"/>         
                            <xsl:choose>
                                <xsl:when test="//REQUEST//IS_RESULT_OFFLINE = '1' and //REQUEST//IS_RESULT_ONLINE = '1'">Лично и через ЛК</xsl:when>
                                <xsl:when test="//REQUEST//IS_RESULT_OFFLINE = '0' and //REQUEST//IS_RESULT_ONLINE = '1'">Через ЛК</xsl:when>
                                <xsl:when test="//REQUEST//IS_RESULT_OFFLINE = '1' and //REQUEST//IS_RESULT_ONLINE = '0'">Лично</xsl:when>
                                <xsl:otherwise></xsl:otherwise>
                            </xsl:choose>
                        </div>
                    </div>
                </div>
                </xsl:if-->
            </div>
            <div class="cardRightSide">
                <div class="whiteBlock dataBlock">
                    <div class="paddingBlock">
                        <div class="sectionHead">
                            <span>Заявление</span>
                        </div>
                        <xsl:if test="//REGUEST != ''">
                            <xsl:if test="//REGUEST//ORDER_NUMBER != ''">
                                <div class="cat">
                                    <div class="key"><span>Номер заявления</span></div>
                                    <div class="value"><xsl:value-of select="//REGUEST//ORDER_NUMBER"/>
                                        <xsl:if test="//REGUEST//ORDER_DATE != ''"> от <xsl:value-of select="//REGUEST//ORDER_DATE"/></xsl:if>
                                        <xsl:if test="//REGUEST//NSI_REQUEST_TYPE_TEXT != ''"> (<xsl:value-of select="//REGUEST//NSI_REQUEST_TYPE_TEXT"/>)</xsl:if>
                                    </div>
                                </div>
                            </xsl:if>
                            <xsl:if test="//REGUEST//NSI_SERVICE_TYPE_TEXT != ''">
                                <div class="cat">
                                    <div class="key"><span>Вид услуги</span></div>
                                    <div class="value"><xsl:value-of select="//REGUEST//NSI_SERVICE_TYPE_TEXT"/></div>
                                </div>
                            </xsl:if>
                            <xsl:if test="//REGUEST//NSI_EXPERT_TARGET != ''">
                                <div class="cat">
                                    <div class="key"><span>Материалы, в отношении которых рассматривается дело</span></div>
                                    <div class="value"><xsl:value-of select="//REGUEST//NSI_EXPERT_TARGET_TEXT"/></div>
                                </div>
                            </xsl:if>
                            <div class="cat">
                                <div class="key"><span>BIM проект</span></div>
                                <div class="value">
                                    <xsl:choose>
                                        <xsl:when test="//REGUEST//IS_BIM = '1'"><span class="greenLabel"></span></xsl:when>
                                        <xsl:otherwise>нет</xsl:otherwise>
                                    </xsl:choose>
                                </div>
                            </div>
                        </xsl:if>
                        <div class="cat">
                            <div class="key"><span>Наличие ПД</span></div>
                            <div class="value">
                                <xsl:choose>
                                    <xsl:when test="count(//DOCUMENT/ROW_SET/ROW) &gt; 0"><span class="greenLabel"></span></xsl:when>
                                    <xsl:otherwise>нет</xsl:otherwise>
                                </xsl:choose>
                            </div>
                        </div>

                        <xsl:if test="//REGUEST//REQ_REQUEST_PREVIOUS_TEXT != '' or //REGUEST_LINK/ROW_SET/ROW != ''">
                            <br/>
                            <h2>Связанные заявления</h2>
                            <div class="cat grayText whiteCat">
                                <div class="key"><span>Тип обращения</span></div>
                                <div class="value">Номер заявления, Дата</div>
                            </div>
                            <xsl:if test="//REGUEST//REQ_REQUEST_PREVIOUS_TEXT">
                                <div class="cat">
                                    <div class="key"><span>Предыдущее заявление</span></div>
                                    <div class="value">
                                        <xsl:value-of select="//REGUEST//REQ_REQUEST_PREVIOUS_TEXT" disable-output-escaping="yes"/>
                                    </div>
                                </div>
                            </xsl:if>
                            <xsl:for-each select="//REGUEST_LINK/ROW_SET/ROW">
                                <div class="cat">
                                    <div class="key"><span>Связанное заявление</span></div>
                                    <div class="value">
                                        <a href="{FK_REQ_REQUEST_LINK}" target="_blank"><xsl:value-of select="REQUEST_TEXT"/></a>
                                    </div>
                                </div>
                            </xsl:for-each>
                        </xsl:if>

                        <xsl:if test="//DOGOVOR != ''">
                            <br/>
                            <h2>Информация о договоре</h2>
                            <xsl:for-each select="//DOGOVOR/ROW_SET/ROW">
                                <div class="cat">
                                    <div class="key"><span>Договор</span></div>
                                    <div class="value">
                                        <xsl:value-of select="DOG_NUMBERDATE" disable-output-escaping="yes"/>
                                    </div>
                                </div>
                                <div class="cat">
                                    <div class="key"><span>Итого</span></div>
                                    <div class="value"><xsl:value-of select="DOG_SUM_TOTAL"/></div>
                                </div>
                            </xsl:for-each>
                        </xsl:if>

                        <xsl:if test="//RES_RESOLUTION != '' or //REQUEST//IS_RESULT_OFFLINE != '' or //REQUEST//IS_RESULT_ONLINE != ''">
                            <br/>
                            <h2>Заключение</h2>
                            <xsl:if test="//RES_RESOLUTION//DOC_NUMBER != ''">
                                <div class="cat">
                                    <div class="key"><span>Номер заключения</span></div>
                                    <div class="value">
                                        <xsl:value-of select="//RES_RESOLUTION//DOC_NUMBER"/>
                                        <xsl:if test="//RES_RESOLUTION//DATE_COMPLETED != ''"> от <xsl:value-of select="//RES_RESOLUTION//DATE_COMPLETED"/></xsl:if>
                                    </div>
                                </div>
                            </xsl:if>
                            <xsl:if test="//RES_RESOLUTION//IS_APPROVED != ''">
                                <div class="cat">
                                    <div class="key"><span>Результат экспертизы</span></div>
                                    <div class="value">
                                        <xsl:choose>
                                            <xsl:when test="//RES_RESOLUTION//IS_APPROVED = '1'"><div class="greenText">Положительное заключение</div></xsl:when>
                                            <xsl:otherwise><div class="redText">Отрицательное заключение</div></xsl:otherwise>
                                        </xsl:choose>
                                    </div>
                                </div>
                            </xsl:if>
                            <xsl:if test="//RES_RESOLUTION//REGISTRY_NUMBER != ''">
                                <div class="cat">
                                    <div class="key"><span>Номер заключения в реестре</span></div>
                                    <div class="value">
                                        <xsl:value-of select="//RES_RESOLUTION//REGISTRY_NUMBER"/>
                                        <xsl:if test="//RES_RESOLUTION//REGISTRY_DATE != ''"> от <xsl:value-of select="//RES_RESOLUTION//REGISTRY_DATE"/></xsl:if>
                                    </div>
                                </div>
                            </xsl:if>
                            <xsl:if test="//REQUEST//IS_RESULT_OFFLINE != '' or //REQUEST//IS_RESULT_ONLINE != ''">
                                <div class="cat">
                                    <div class="key"><span>Способ получения результата</span></div>
                                    <div class="value">
                                        <xsl:choose>
                                            <xsl:when test="//REQUEST//IS_RESULT_OFFLINE = '1' and //REQUEST//IS_RESULT_ONLINE = '1'">Лично и через ЛК</xsl:when>
                                            <xsl:when test="//REQUEST//IS_RESULT_OFFLINE = '0' and //REQUEST//IS_RESULT_ONLINE = '1'">Через ЛК</xsl:when>
                                            <xsl:when test="//REQUEST//IS_RESULT_OFFLINE = '1' and //REQUEST//IS_RESULT_ONLINE = '0'">Лично</xsl:when>
                                            <xsl:otherwise></xsl:otherwise>
                                        </xsl:choose>
                                    </div>
                                </div>
                            </xsl:if>
                        </xsl:if>
                        
                        <br/>
                        <div class="sectionHead">
                            <span>Сведения о проекте</span>
                        </div>
                        <xsl:if test="//REGUEST//OBJECT_NAME != ''">
                            <div class="cat">
                                <div class="key"><span>Наименование объекта</span></div>
                                <div class="value"><xsl:value-of select="//REGUEST//OBJECT_NAME"/></div>
                            </div>
                        </xsl:if>
                        <xsl:if test="//REGUEST//ADDRESS != ''">
                            <div class="cat">
                                <div class="key"><span>Адрес объекта</span></div>
                                <div class="value"><xsl:value-of select="//REGUEST//ADDRESS"/></div>
                            </div>
                        </xsl:if>
                        <xsl:if test="//REGUEST//NSI_OBJECT_WORK_TYPE_TEXT != ''">
                            <div class="cat">
                                <div class="key"><span>Вид работ</span></div>
                                <div class="value"><xsl:value-of select="//REGUEST//NSI_OBJECT_WORK_TYPE_TEXT"/></div>
                            </div>
                        </xsl:if>
                        <xsl:if test="//REGUEST//NSI_OBJECT_TYPE_TEXT != ''">
                            <div class="cat">
                                <div class="key"><span>Вид объекта</span></div>
                                <div class="value"><xsl:value-of select="//REGUEST//NSI_OBJECT_TYPE_TEXT"/></div>
                            </div>
                        </xsl:if>
                        <xsl:if test="//REGUEST//NSI_OBJECT_USAGE_TEXT != ''">
                            <div class="cat">
                                <div class="key"><span>Функциональное назначение</span></div>
                                <div class="value"><xsl:value-of select="//REGUEST//NSI_OBJECT_USAGE_TEXT"/></div>
                            </div>
                        </xsl:if>
                        <xsl:if test="//OBJ_UNIQUE//NSI_OBJECT_UNIQUE_TYPE_TEXT != ''">
                            <div class="cat">
                                <div class="key"><span>Признак уникальности</span></div>
                                <div class="value">
                                    <xsl:for-each select="//OBJ_UNIQUE/ROW_SET/ROW">
                                        <div><xsl:value-of select="NSI_OBJECT_UNIQUE_TYPE_TEXT"/></div>
                                    </xsl:for-each>
                                </div>
                            </div>
                        </xsl:if>
                        <xsl:if test="//REGUEST//NSI_OBJECT_FINANCE_TEXT != ''">
                            <div class="cat">
                                <div class="key"><span>Источник финансирования</span></div>
                                <div class="value"><xsl:value-of select="//REGUEST//NSI_OBJECT_FINANCE_TEXT"/></div>
                            </div>
                        </xsl:if>
                        <xsl:if test="//REGUEST//ECO_EXPERT_NUMBER != ''">
                            <div class="cat">
                                <div class="key"><span>Номер положительного заключения государственной экологической экспертизы</span></div>
                                <div class="value"><xsl:value-of select="//REGUEST//ECO_EXPERT_NUMBER"/></div>
                            </div>
                        </xsl:if>
                        <xsl:if test="//REGUEST//ECO_EXPERT_DATE != ''">
                            <div class="cat">
                                <div class="key"><span>Дата положительного заключения государственной экологической экспертизы</span></div>
                                <div class="value"><xsl:value-of select="//REGUEST//ECO_EXPERT_DATE"/></div>
                            </div>
                        </xsl:if>

                        <xsl:if test="//REGUEST//GPZU_NUMBER != ''">
                            <br/>
                            <h2>Документы по планировке территории</h2>
                            <div class="cat">
                                <div class="key"><span>Номер ГПЗУ</span></div>
                                <div class="value"><xsl:value-of select="//REGUEST//GPZU_NUMBER"/></div>
                            </div>
                        </xsl:if>

                        <xsl:if test="//REGUEST//IS_OBJECT_OWNER != '' or //REGUEST//CADASTRAL_NUMBER != ''">
                            <br/>
                            <h2>Сведения о земельно-правовых отношениях</h2>
                            <xsl:if test="//REGUEST//IS_OBJECT_OWNER != ''">
                                <div class="cat">
                                    <div class="key"><span>Земельный участок находится</span></div>
                                    <div class="value">
                                        <xsl:choose>
                                            <xsl:when test="//REGUEST//IS_OBJECT_OWNER = '1'">В собственности</xsl:when>
                                            <xsl:otherwise>В аренде/ пользовании заявителя</xsl:otherwise>
                                        </xsl:choose>
                                    </div>
                                </div>
                            </xsl:if>
                            <xsl:if test="//REGUEST//CADASTRAL_NUMBER != ''">
                                <div class="cat">
                                    <div class="key"><span>Кадастровый номер</span></div>
                                    <div class="value"><xsl:value-of select="//REGUEST//CADASTRAL_NUMBER"/></div>
                                </div>
                            </xsl:if>
                        </xsl:if>

                        <xsl:if test="//CONTRACTOR_MEMBER">
                            <br/>
                            <div class="sectionHead">
                                <span>Участники проекта</span>
                            </div>
                        </xsl:if>
                    </div>

                    <xsl:if test="//CONTRACTOR_MEMBER">
                    <div class="iMembers">
                        <xsl:for-each select="//CONTRACTOR_MEMBER/ROW_SET/ROW">
                            <div class="iMembersItem">
                                <div class="showHide iMembersItemHead">
                                    <div class="iMembersName"><xsl:value-of select="FULL_NAME"/></div>
                                    <div class="iMembersNote"><xsl:value-of select="NSI_COMPANY_ROLE_TEXT"/></div>
                                </div>
                                <div class="showHideTarget iMembersItemBody">
                                    <xsl:if test="NAME != ''">
                                        <div class="iMembersProp">
                                            <div class="propName">Представитель:</div>
                                            <div class="propValue"><xsl:value-of select="NAME"/></div>
                                        </div>
                                    </xsl:if>
                                    <xsl:if test="POST != ''">
                                        <div class="iMembersProp">
                                            <div class="propName">Должность:</div>
                                            <div class="propValue"><xsl:value-of select="POST"/></div>
                                        </div>
                                    </xsl:if>
                                    <xsl:if test="PHONE != ''">
                                        <div class="iMembersProp">
                                            <div class="propName">Телефон, факс:</div>
                                            <div class="propValue"><xsl:value-of select="PHONE"/></div>
                                        </div>
                                    </xsl:if>
                                    <xsl:if test="EMAIL != ''">
                                        <div class="iMembersProp">
                                            <div class="propName">Почта:</div>
                                            <div class="propValue"><xsl:value-of select="EMAIL"/></div>
                                        </div>
                                    </xsl:if>
                                    <xsl:if test="BANK_NAME != ''">
                                        <div class="iMembersProp">
                                            <div class="propName">Отделение банка:</div>
                                            <div class="propValue"><xsl:value-of select="BANK_NAME"/></div>
                                        </div>
                                    </xsl:if>
                                    <xsl:if test="BANK_ADDRESS != ''">
                                        <div class="iMembersProp">
                                            <div class="propName">Адрес банка:</div>
                                            <div class="propValue"><xsl:value-of select="BANK_ADDRESS"/></div>
                                        </div>
                                    </xsl:if>
                                    <xsl:if test="BANK_BIK != ''">
                                        <div class="iMembersProp">
                                            <div class="propName">БИК:</div>
                                            <div class="propValue"><xsl:value-of select="BANK_BIK"/></div>
                                        </div>
                                    </xsl:if>
                                    <xsl:if test="ACCOUNT_SET != ''">
                                        <div class="iMembersProp">
                                            <div class="propName">Расчетный счет:</div>
                                            <div class="propValue"><xsl:value-of select="ACCOUNT_SET"/></div>
                                        </div>
                                    </xsl:if>
                                    <xsl:if test="ACCOUNT_COR != ''">
                                        <div class="iMembersProp">
                                            <div class="propName">Корреспондентский счет:</div>
                                            <div class="propValue"><xsl:value-of select="ACCOUNT_COR"/></div>
                                        </div>
                                    </xsl:if>
                                    <div class="clear"></div>
                                </div>
                            </div>
                        </xsl:for-each>
                    </div>
                    </xsl:if>
                    
                    <div class="paddingBlock">
                        <table class="data_create">
                            <tbody>
                                <tr>
                                    <td>
                                        <div class="grayText">Создал:</div>
                                        <div><xsl:value-of select="//SYS_LOG//USER_CREATED"/></div>
                                        
                                        <div class="grayText">Дата создания:</div>
                                        <div><xsl:value-of select="//SYS_LOG//DATE_CREATED"/></div>
                                    </td>
                                    <td>
                                        <div class="grayText">Изменения внес:</div>
                                        <div><xsl:value-of select="//SYS_LOG//USER_CHANGED"/></div>
                                        
                                        <div class="grayText">Дата последнего изменения:</div>
                                        <div><xsl:value-of select="//SYS_LOG//DATA_CHANGED"/></div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        
        <script type="text/javascript">
            $(function() {
                $('.showHide').click(function() {
                    $(this).next('.showHideTarget').stop().slideToggle(300);
                });
                $('.expertItem').click(function() {
                    $('.expertInfo', this).stop().fadeToggle(300);
                });
            });
        </script>

    </xsl:template>
</xsl:stylesheet>
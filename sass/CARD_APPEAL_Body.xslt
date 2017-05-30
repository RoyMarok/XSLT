<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="utf-8" indent="no"/>

    <xsl:template match="/">
    
        {B{CARD_APPEAL_Styles}E}
    
        <XML style="display: none;" class="body">
          <xsl:copy-of select="."/>
        </XML>
        
        <div class="cardWrapper">
        
            <div class="cardLeftSide">
                <div class="grayBlock dataBlock">
                    <div class="paddingBlock">
                        Обращение  <b>№ <xsl:value-of select="//REGUEST//REQUEST_NUMBER"/>
                              <xsl:if test="//REGUEST//REQUEST_DATE != ''"> от <xsl:value-of select="//REGUEST//REQUEST_DATE"/></xsl:if></b>
                    </div>
                </div>
                <xsl:if test="//RES_RESOLUTION">
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
                </xsl:if>
                
                <div class="whiteBlock dataBlock stageBlock"><!-- Этапы прохождения -->
                    <div class="stageList">
                        <div class="stageItem completed">
                            <div class="showHide">
                                <div class="stageNumber">1</div>
                                <div class="stageName">Новое обращение</div>
                                <div class="stageStatus"><span class="greenLabel"></span></div>
                            </div>
                            <div class="showHideTarget">
                                <div class="stageInfo">
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td class="right">Дата заявления</td>
                                                <td><xsl:value-of select="//REGUEST//ORDER_DATE"/></td>
                                            </tr>
                                            <tr>
                                                <td class="right">Дата регистрации обращения</td>
                                                <td><xsl:value-of select="//REGUEST//REQUEST_DATE"/></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="stageItem completed">
                            <div class="showHide">
                                <div class="stageNumber">2</div>
                                <div class="stageName">Договор</div>
                                <div class="stageStatus"><span class="greenLabel"></span></div>
                            </div>
                            <div class="showHideTarget">
                                <div class="stageInfo">
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td class="right">Дата создания договора</td>
                                                <td><xsl:value-of select="//CON_CONTRACT//DATE_DATE"/></td>
                                            </tr>
                                            <tr>
                                                <td class="right">Дата подписания договора</td>
                                                <td><xsl:value-of select="//CON_CONTRACT//DATE_SIGNED"/></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="stageItem completed"><!-- active -->
                            <div class="showHide">
                                <div class="stageNumber">3</div>
                                <div class="stageName">Экспертиза</div>
                                <div class="stageStatus"><span class="greenLabel"></span></div>
                            </div>
                            <div class="showHideTarget">
                                <div class="stageInfo">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>Плановая</th>
                                                <th>Фактическая</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="right">Начало экспертизы</td>
                                                <td><xsl:value-of select="//CON_CONTRACT//DATE_INFO_BEGIN"/></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td class="right">Подготовка локальных замечаний</td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td class="right">Подготовка сводного замечания</td>
                                                <td><xsl:value-of select="//RES_COMMENT_GLOBAL//DATE_PLANNED"/></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td class="right">Устранение замечаний</td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td class="right">Подготовка локальных заключений</td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td class="right">Подготовка сводного заключения</td>
                                                <td><xsl:value-of select="//RES_RESOLUTION_GLOBAL//DATE_PLANNED"/></td>
                                                <td></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="stageItem completed"><!-- disabled -->
                            <div class="showHide">
                                <div class="stageNumber">4</div>
                                <div class="stageName">Рассмотрение завершено</div>
                                <div class="stageStatus"><span class="greenLabel"></span></div>
                            </div>
                            <div class="showHideTarget">
                                <div class="stageInfo">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>Плановая</th>
                                                <th>Фактическая</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="right">Подготовка заключения</td>
                                                <td><xsl:value-of select="//RES_RESOLUTION//DATE_READY_PLAN"/></td>
                                                <td></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="stageItem completed"><!-- disabled -->
                            <div class="showHide">
                                <div class="stageNumber">5</div>
                                <div class="stageName">Передано заявителю</div>
                                <div class="stageStatus"><span class="greenLabel"></span></div>
                            </div>
                            <div class="showHideTarget">
                                <div class="stageInfo">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>Плановая</th>
                                                <th>Фактическая</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="right">Передача заключения заявителю</td>
                                                <td><xsl:value-of select="//RES_RESOLUTION//DATE_PASS_PLAN"/></td>
                                                <td><xsl:value-of select="//RES_RESOLUTION//DATE_COMPLETED"/></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="transparentBlock dataBlock">
                    <div class="paddingBlock">
                        <h2>Участники экспертизы</h2>
                        <xsl:for-each select="//EXPERT_MEMBER/ROW_SET/ROW">
                            <div class="expertItem">
                                <div class="expertImage"></div>
                                <div class="expertShortInfo">
                                    <div><b><xsl:value-of select="NSI_EXPERT_ROLE_TEXT"/></b></div>
                                    <div><xsl:value-of select="EXP_PERSON_TEXT"/></div>
                                    <div class="expertDepText"><xsl:value-of select="EXP_DEPARTMENT_TEXT"/></div>
                                </div>
                                <xsl:if test="NOTE != ''">
                                    <div class="expertInfo" style="display: none">
                                        <xsl:value-of select="NOTE" disable-output-escaping="yes"/>
                                    </div>
                                </xsl:if>
                            </div>
                        </xsl:for-each>
                    </div>
                </div>
            </div>
        
            <div class="cardRightSide">
                <div class="whiteBlock dataBlock">
                    <div class="paddingBlock">
                    <xsl:if test="//REGUEST != ''">
                       <h2>Реквизиты обращения</h2>
                       <xsl:if test="//REGUEST//ORDER_NUMBER != ''">
                       <div class="cat">
                          <div class="key"><span>Номер заявления</span></div>
                          <div class="value"><xsl:value-of select="//REGUEST//ORDER_NUMBER"/>
                              <xsl:if test="//REGUEST//ORDER_DATE != ''"> от <xsl:value-of select="//REGUEST//ORDER_DATE"/></xsl:if>
                              <xsl:if test="//REGUEST//NSI_REQUEST_TYPE != ''"> (<xsl:value-of select="//REGUEST//NSI_REQUEST_TYPE"/>)</xsl:if>
                          </div>
                       </div>
                       </xsl:if>
                       <xsl:if test="//REGUEST//REQUEST_NUMBER != ''">
                       <div class="cat">
                          <div class="key"><span>Номер обращения</span></div>
                          <div class="value"><xsl:value-of select="//REGUEST//REQUEST_NUMBER"/>
                              <xsl:if test="//REGUEST//REQUEST_DATE != ''"> от <xsl:value-of select="//REGUEST//REQUEST_DATE"/></xsl:if>
                          </div>
                       </div>
                       </xsl:if>
                       <xsl:if test="//REGUEST//FK_EXP_PERSON_REGISTRATED_TEXT != ''"><!--fk_exp_person_registrated_text-->
                       <div class="cat">
                          <div class="key"><span>Зарегистрировал обращение</span></div>
                          <div class="value">
                              <a href="{//REGUEST//USER_INFO}"><xsl:value-of select="//REGUEST//FK_EXP_PERSON_REGISTRATED_TEXT"/></a>
                          </div>
                       </div>
                       </xsl:if>
                       <xsl:if test="//CONTRACTOR_MEMBER/ROW_SET/ROW[NSI_COMPANY_ROLE='DECLARANT']//FULL_NAME != ''">
                       <div class="cat">
                          <div class="key"><span>Заявитель</span></div>
                          <div class="value">
                              <a href=""><xsl:value-of select="//CONTRACTOR_MEMBER/ROW_SET/ROW[NSI_COMPANY_ROLE='DECLARANT']//FULL_NAME"/></a>
                          </div>
                       </div>
                       </xsl:if>
                       <xsl:if test="//REGUEST//REGISTRY_NUMBER != ''">
                       <div class="cat">
                          <div class="key"><span>Номер дела</span></div>
                          <div class="value"><xsl:value-of select="//REGUEST//REGISTRY_NUMBER"/>
                              <xsl:if test="//REGUEST//REGISTRY_DATE != ''"> от <xsl:value-of select="//REGUEST//REGISTRY_DATE"/></xsl:if>
                          </div>
                       </div>
                       </xsl:if>
                       <xsl:if test="//REGUEST//NSI_SERVICE_TYPE_TEXT != ''">
                       <div class="cat">
                          <div class="key"><span>Вид услуги</span></div>
                          <div class="value"><xsl:value-of select="//REGUEST//NSI_SERVICE_TYPE_TEXT"/></div>
                       </div>
                       </xsl:if>
                       <xsl:if test="//REGUEST//NSI_EXPERT_TARGET_TEXT != ''">
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
                       <div class="cat">
                          <div class="key"><span>Наличие ПД</span></div>
                          <div class="value">
                              <xsl:choose>
                                  <xsl:when test="count(//DOCUMENT/ROW_SET/ROW) &gt; 0"><span class="greenLabel"></span></xsl:when>
                                  <xsl:otherwise>нет</xsl:otherwise>
                              </xsl:choose>
                          </div>
                       </div>
                       <xsl:if test="//REGUEST//OBJECT_NOTE != ''">
                          <div class="cat">
                              <div class="key"><span>Примечание к учетной карточке</span></div>
                              <div class="value"><xsl:value-of select="//REGUEST//OBJECT_NOTE"/></div>
                          </div>
                       </xsl:if>

                       <xsl:if test="//REGUEST//OBJECT_NOTE != ''">
                          <div class="cat">
                              <div class="key"><span>Заявление о приеме на рассмотрение</span></div>
                              <div class="value">                                 
                                <xsl:for-each select="//REGUEST//FILES//ROW">
                                    <a href="#"> <xsl:value-of select="FILE_NAME"/> </a> <br />
                                </xsl:for-each>
                            </div>
                          </div>
                       </xsl:if>
                       
                       <xsl:if test="//REGUEST//FK_REQ_REQUEST_PREVIOUS != '' or //REGUEST_LINK/ROW_SET/ROW != ''">
                          <br/>
                          <h2>Связанные обращения</h2>
                          <div class="cat grayText whiteCat">
                              <div class="key"><span>Тип обращения</span></div>
                              <div class="value">Номер обращения, Дата</div>
                          </div>
                          <xsl:if test="//REGUEST//FK_REQ_REQUEST_PREVIOUS">
                              <div class="cat">
                                  <div class="key"><span>Предыдущее обращение</span></div>
                                  <div class="value">
                                      <xsl:value-of select="//REGUEST//REQ_REQUEST_PREVIOUS_TEXT" disable-output-escaping="yes"/>
                                  </div>
                              </div>
                          </xsl:if>
                          <xsl:for-each select="//REGUEST_LINK/ROW_SET/ROW">
                              <div class="cat">
                                  <div class="key"><span>Связанное обращение</span></div>
                                  <div class="value">
                                      <a href="{FK_REQ_REQUEST_LINK}" target="_blank"><xsl:value-of select="REQUEST_TEXT"/></a>
                                  </div>
                              </div>
                          </xsl:for-each>
                          <xsl:if test="//REGUEST//REQUEST_PREVIOUS_COMMENT != ''">
                              <div class="cat">
                                  <div class="key"><span>Примечание</span></div>
                                  <div class="value"><xsl:value-of select="//REGUEST//REQUEST_PREVIOUS_COMMENT"/></div>
                              </div>
                          </xsl:if>
                       </xsl:if>
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
                    
                    <xsl:if test="//REGUEST != ''">   
                       <br/>
                       <div class="sectionHead">
                          <span>Сведения об объекте</span>
                       </div>
                       <h2>Общие сведения</h2>
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
                       <xsl:if test="//REGUEST//NSI_OBJECT_STAGE_TEXT != ''">
                       <div class="cat">
                          <div class="key"><span>Стадия проектирования</span></div>
                          <div class="value"><xsl:value-of select="//REGUEST//NSI_OBJECT_STAGE_TEXT"/></div>
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
                       <xsl:if test="//OBJ_UNIQUE//ROW_SET/ROW/NSI_OBJECT_UNIQUE_TYPE_TEXT != ''">
                       <div class="cat">
                          <div class="key"><span>Признак уникальности</span></div>
                          <div class="value">
                              <xsl:for-each select="//OBJ_UNIQUE//ROW_SET/ROW[NSI_OBJECT_UNIQUE_TYPE_TEXT!='']">
                                  <xsl:if test="position() &gt; 1"><br/></xsl:if>
                                  <xsl:value-of select="NSI_OBJECT_UNIQUE_TYPE_TEXT"/>
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
                       
                       <br/>
                       <h2>Сведения о земельно-правовых отношениях</h2>
                       <div class="cat">
                          <div class="key"><span>Земельный участок находится</span></div>
                          <div class="value">
                              <xsl:choose>
                                  <xsl:when test="//REGUEST//IS_OBJECT_OWNER = '1'">В собственности</xsl:when>
                                  <xsl:otherwise>В аренде/ пользовании заявителя</xsl:otherwise>
                              </xsl:choose>
                          </div>
                       </div>
                       <xsl:if test="//REGUEST//CADASTRAL_NUMBER != ''">
                       <div class="cat">
                          <div class="key"><span>Кадастровый номер</span></div>
                          <div class="value"><xsl:value-of select="//REGUEST//CADASTRAL_NUMBER"/></div>
                       </div>
                       </xsl:if>
                       
                       <xsl:if test="//RECRUIT != ''">
                          <br/>
                          <div class="sectionHead">
                              <span>Привлечение к экспертизе</span>
                          </div>
                          <xsl:if test="//RECRUIT/NSI_PERSON_ROLE_TEXT != ''">
                              <div class="cat">
                                  <div class="key"><span>Тип</span></div>
                                  <div class="value"><xsl:value-of select="//RECRUIT//NSI_PERSON_ROLE_TEXT"/></div>
                              </div>
                          </xsl:if>
                          <xsl:if test="//RECRUIT//DOC_NAME != ''">
                              <div class="cat">
                                  <div class="key"><span>Договор</span></div>
                                  <div class="value">
                                      № <xsl:value-of select="//RECRUIT//DOC_NAME"/>
                                      <xsl:if test="//RECRUIT//DOC_DATE != ''"> от <xsl:value-of select="//RECRUIT//DOC_DATE"/></xsl:if>
                                  </div>
                              </div>
                          </xsl:if>
                          <xsl:if test="//RECRUIT/DOC_SUM != ''">
                              <div class="cat">
                                <div class="key"><span>Стоимость привлечения</span></div>
                                <div class="value"><xsl:value-of select="//RECRUIT//DOC_SUM"/></div>
                              </div>
                          </xsl:if>
                       </xsl:if>
                    </xsl:if>
                       
                       
                    <xsl:if test="//CONTRACTOR_MEMBER != ''">
                       <br/>
                       <div class="sectionHead">
                          <span>Участники проекта</span>
                       </div>
                    </xsl:if>
                    
                    </div>
                    
                    <div class="iMembers">
                        <xsl:for-each select="//CONTRACTOR_MEMBER/ROW_SET/ROW">
                            <div class="iMembersItem">
                                <div class="showHide iMembersItemHead">
                                    <div class="iMembersName"><xsl:value-of select="FULL_NAME"/></div>
                                    <div class="iMembersNote"><xsl:value-of select="NSI_COMPANY_ROLE_TEXT"/></div>
                                </div>
                                <div class="showHideTarget iMembersItemBody">
                                  <xsl:if test="PER_FIRST_NAME != ''">
                                    <div class="iMembersProp">
                                        <div class="propName">Представитель:</div>
                                        <div class="propValue">
                                            <xsl:value-of select="PER_FIRST_NAME"/>
                                            <xsl:text> </xsl:text>
                                            <xsl:value-of select="PER_MIDDLE_NAME"/>
                                            <xsl:text> </xsl:text>
                                            <xsl:value-of select="PER_LAST_NAME"/>
                                        </div>
                                    </div>
                                  </xsl:if>
                                  <xsl:if test="PER_POST != ''">
                                    <div class="iMembersProp">
                                        <div class="propName">Должность:</div>
                                        <div class="propValue"><xsl:value-of select="PER_POST"/></div>
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
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:layout="URN:html-form-layout:v0.1" xmlns="http://www.w3.org/1999/xhtml" xmlns:ex2="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLTExtension" xmlns:ctx="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLDataContext" xmlns:gbu="http://xmlns.oracle.com/MSG_GBU_doc">
<xsl:output method="html" indent="yes" omit-xml-declaration="yes" undeclare-prefixes="yes" exclude-result-prefixes="#all"/>


    <xsl:variable name="DATA">
        <ROOT xmlns="">
            <TEST_VALUE></TEST_VALUE>
            <INIT_STEP>1</INIT_STEP>
            <DEFAULT_LIST><ROW></ROW></DEFAULT_LIST>
            <!--MY_MULTISELECT_VALUE>galactica_admin1</MY_MULTISELECT_VALUE-->
            <MY_MULTISELECT_VALUE></MY_MULTISELECT_VALUE>
            <MY_LIST_VALUE>id1</MY_LIST_VALUE>
            <KLADR_REG>910000000000000</KLADR_REG>
            <!--KLADR_LOCAL>
                <REGION><xsl:value-of select="//REGUEST//KLADR_REGION"/>00000000000</REGION>
                <DISTRICT><xsl:value-of select="//REGUEST//KLADR_REGION"/><xsl:value-of select="//REGUEST//KLADR_DISTRICT"/>00000000</DISTRICT>
                <TOWN><xsl:value-of select="//REGUEST//KLADR_REGION"/><xsl:value-of select="//REGUEST//KLADR_DISTRICT"/><xsl:value-of select="//REGUEST//KLADR_TOWN"/>00000</TOWN>
                <LOCALITY>xsl:value-of select="//REGUEST//KLADR_REGION"/><xsl:value-of select="//REGUEST//KLADR_DISTRICT"/><xsl:value-of select="//REGUEST//KLADR_TOWN"/><xsl:value-of select="//REGUEST//KLADR_LOCALITY"/>00</LOCALITY>
                <STREET><xsl:value-of select="//REGUEST//KLADR"/>00</STREET>
            </KLADR_LOCAL-->
            <MY_LIST>
                <ROW>
                    <ID>id1</ID>
                    <NAME>name1</NAME>
                </ROW>
                <ROW>
                    <ID>id2</ID>
                    <NAME>name2</NAME>
                </ROW>
            </MY_LIST>
            <TABLE>
                <ROW>
                    <CELL1>aaa</CELL1>
                </ROW>
            </TABLE>
            <REPRESENTATOR>
                <ROW>
                    <CELL></CELL>
                </ROW>
            </REPRESENTATOR>
            <SECTIONS>
                <ROW>
                    <CELL></CELL>
                </ROW>
            </SECTIONS>
            <APPLICANT_DOCS>
                <DOC><VALUE>Доверенность</VALUE></DOC>
                <DOC><VALUE>Градостроительный план земельного участка</VALUE></DOC>
                <DOC><VALUE>Договор аренды земельного участка</VALUE></DOC>
                <DOC><VALUE>Правовой акт Департамента Имущества</VALUE></DOC>
                <DOC><VALUE>Свидетельство о регистрации права на ЗУ</VALUE></DOC>
                <DOC><VALUE>Положительное заключение экологической экспертизы</VALUE></DOC>
                <DOC><VALUE>Положительное заключение в отношении типовой ПД</VALUE></DOC>
                <DOC><VALUE>Решение о строительстве (реконструкции)</VALUE></DOC>
                <DOC><VALUE>Основание для проектирования</VALUE></DOC>
                <DOC><VALUE>Договор на разработку ПД</VALUE></DOC>
                <DOC><VALUE>СРО</VALUE></DOC>
                <DOC><VALUE>Задание на проектирование</VALUE></DOC>
                <DOC><VALUE>Задание на выполнение инженерных изысканий</VALUE></DOC>
                <DOC><VALUE>Внешние инженерные сети и конструктив</VALUE></DOC>
                <DOC><VALUE>Технические условия</VALUE></DOC>
                <DOC><VALUE>Ситуационный план</VALUE></DOC>
                <DOC><VALUE>Результаты инженерных изысканий</VALUE></DOC>
                <DOC><VALUE>Информационные материалы</VALUE></DOC>
                <DOC><VALUE>Распорядительный документ об утверждении ППТ</VALUE></DOC>
            </APPLICANT_DOCS>
            <ENABLISH>
                <xsl:choose>
                    <xsl:when test="//STATUSEDIT//FLG='ADMIN' or //STATUSEDIT//FLG='NEW_REQUEST'">
                        <ENABLE_ALL>0</ENABLE_ALL>
                        <ENABLE_NOT_NEW>0</ENABLE_NOT_NEW>
                        <ENABLE_NEW>0</ENABLE_NEW>
                    </xsl:when>
                    <xsl:when test="//STATUSEDIT//FLG='HAS_ROLE_NOT_NEW_REQUEST'">
                        <ENABLE_ALL>1</ENABLE_ALL>
                        <ENABLE_NOT_NEW>0</ENABLE_NOT_NEW>
                        <ENABLE_NEW>1</ENABLE_NEW>
                    </xsl:when>
                    <xsl:when test="//STATUSEDIT//FLG='HAS_ROLE_NEW_REQUEST'">
                        <ENABLE_ALL>1</ENABLE_ALL>
                        <ENABLE_NOT_NEW>0</ENABLE_NOT_NEW>
                        <ENABLE_NEW>0</ENABLE_NEW>
                    </xsl:when>
                    <xsl:otherwise>
                        <ENABLE_ALL>1</ENABLE_ALL>
                        <ENABLE_NOT_NEW>1</ENABLE_NOT_NEW>
                        <ENABLE_NEW>1</ENABLE_NEW>
                    </xsl:otherwise>
                </xsl:choose>
            </ENABLISH>
        <xsl:copy-of select="/"/>
        </ROOT>

    </xsl:variable>
    <xsl:variable name="STYLES">
        {B{FRM$XML_LAYOUT$V0.1-2PANEL_STYLES}E}
        <style>
            .customSelect.readonly:before,
            ._token_input_wrapper.readonly:before{
                content: '';
                display: block;
                position: absolute;
                width: 100%;
                height: 100%;
                z-index: 300;
                cursor: initial;
                background-color: rgba(245, 242, 242, 0.32);
                border: 1px solid #d9dbdd;
                box-sizing: border-box;
                border-radius: 2px;
            }
            ._token_input_wrapper{
                position: relative;
            }

            .line.checkbox input.readOnly+span.overTrop{
                background-color: #f7f7f7;
            }
        </style>
    </xsl:variable>
    <xsl:variable name="LAYOUT">
        <div class="frmAppeal_main">
            <div class="frmAppeal_steps">
                <ol>
                    <li class="" data-content-block="step1">
                        <span>Реквизиты обращения</span>
                    </li>
                    <li class="" data-content-block="step2">
                        <span>Сведения о заявителе</span>
                    </li>
                    <li data-content-block="step3">
                        <span>Сведения об объекте</span>
                    </li>
                    <li data-content-block="step4">
                        <span>Участники проекта</span>
                    </li>
                    <li data-content-block="step5">
                        <span>Технико-экономические показатели</span>
                    </li>
                    <li data-content-block="step6">
                        <span>Участники экспертизы</span>
                    </li>
                    <!--li data-content-block="step7">
                        <span>Опись документов</span>
                    </li-->
                </ol>
            </div>
            <div class="frmAppeal_content">
                <layout:form action="/customactions/requestSave.action" xmlTag="request">
                    <layout:hidden name="documentId" value="//SYS_LOG//DOC_KEY" xmlTag=":name:"/>
                    <layout:hidden name="disableNew" value="//ENABLISH//ENABLE_NEW" xmlTag=":name:"/>
                    <layout:hidden name="disableNotNew" value="//ENABLISH//ENABLE_NOT_NEW" xmlTag=":name:"/>
                    <layout:hidden name="disableAll" value="//ENABLISH//ENABLE_ALL" xmlTag=":name:"/>
                    <layout:hidden name="currentStep" value="//INIT_STEP" xmlTag=":name:"/>
                    <div class="steps" id="step1">
                        <layout:header>ШАГ 1. Реквизиты обращения</layout:header>
                        <layout:simple-field label="Номер заявления" class="medium" required="0">
                            <layout:edit type="TEXT" name="req_request__order_number" xmlTag=":name:" value="//REGUEST//ORDER_NUMBER" readonly="//ENABLISH//ENABLE_NEW"/>
                            <input type="button" value="№" class="form_button afterClose" />
                            <label>от</label>
                            <layout:edit type="DATE" name="req_request__order_date_edit" value="//REGUEST//ORDER_DATE" xmlTag=":name:" readonly="//ENABLISH//ENABLE_NEW"/>
                            <layout:hidden name="req_request__order_date" value="//REGUEST//ORDER_DATE" xmlTag=":name:"/>
                        </layout:simple-field>
                        <layout:simple-field label="Тип заявления" class="medium" required="0">
                            <layout:select name="req_request__nsi_request_type" value="//REGUEST//NSI_REQUEST_TYPE" listSourceID="nsi_request_type" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                        </layout:simple-field>
                        <layout:simple-field label="Номер обращения" class="medium" required="1">
                            <layout:edit type="TEXT" name="req_request__request_number" value="//REGUEST//REQUEST_NUMBER" xmlTag=":name:" readonly="//ENABLISH//ENABLE_NEW"/>
                            <input type="button" value="№" class="form_button afterClose registryRequest"/>
                            <label>от</label>
                            <layout:edit type="DATE" name="req_request__request_date" value="//REGUEST//REQUEST_DATE" xmlTag=":name:" readonly="//ENABLISH//ENABLE_NEW"/>
                        </layout:simple-field>
                        <layout:simple-field label="Письмо с обращением о приеме на рассмотрение" class="full double_line" required="0">
                            <layout:file value="Загрузить" id="req_request__file_id" xmlTag=":name:" pre_files="//REGUEST//FILE_COMBO_LINE" sign="false" readonly="//ENABLISH//ENABLE_NEW"/>
                        </layout:simple-field>
                        <layout:simple-field label="Зарегистрировал обращение" class="medium" required="0">
                            <layout:edit type="TEXT" name="req_request__user_info_text" value="//REGUEST//FK_EXP_PERSON_REGISTRATED_TEXT"  xmlTag=":name:" readonly="1"/>
                            <layout:hidden value="//REGUEST//FK_EXP_PERSON_REGISTRATED" name="req_request__user_info" xmlTag=":name:"/>
                            <layout:hidden value="//REGUEST//NSI_REQUEST_STATUS" name="req_request__nsi_request_status" xmlTag=":name:"/>
                        </layout:simple-field>
                        <layout:simple-field label="Номер дела" class="medium" required="0">
                            <layout:edit type="TEXT" name="req_request__registry_number" value="//REGUEST//REGISTRY_NUMBER" xmlTag=":name:" readonly="//ENABLISH//ENABLE_NEW"/>
                            <input type="button" value="№" class="form_button afterClose"/>
                            <label>от</label>
                            <layout:edit type="DATE" name="req_request__registry_date" value="//REGUEST//REGISTRY_DATE" xmlTag=":name:" readonly="//ENABLISH//ENABLE_NEW"/>
                        </layout:simple-field>

                        <layout:simple-field label="" class="small checkBox" required="0">
                            <div class="one_must_be">
                                <layout:checkbox forceCheckbox="1" label="Получить лично" name="req_request__is_result_offline" valueXPATH="//REGUEST//IS_RESULT_OFFLINE" valueChecked="1" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                <layout:checkbox forceCheckbox="1" label="Получить через ЛК" name="req_request__is_result_online" valueXPATH="//REGUEST//IS_RESULT_ONLINE" valueChecked="1" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                            </div>
                        </layout:simple-field>
                        <layout:simple-field label="Вид услуги" class="medium" required="1">
                            <layout:select name="req_request__nsi_service_type" value="//REGUEST//NSI_SERVICE_TYPE" listSourceID="nsi_service_type" xmlTag=":name:" readonly="1"/>
                        </layout:simple-field>
                        <layout:simple-field label="Включает сметы" class="medium checkBox" >
                            <layout:checkbox forceCheckbox="1" label="" name="req_request__is_estimate_included" valueXPATH="//REGUEST//IS_ESTIMATE_INCLUDED" valueChecked="1" xmlTag=":name:" readonly="//ENABLISH//ENABLE_NOT_NEW"/>
                        </layout:simple-field>

                        <layout:simple-field label="Материалы в отношении которых рассматривается дело" class="medium double_line" required="1">
                            <layout:select name="req_request__nsi_expert_target" value="//REGUEST//NSI_EXPERT_TARGET" listSourceID="nsi_expert_target" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                        </layout:simple-field>

                        <layout:simple-field label="BIM" class="full radioGroup radio" required="1">
                                <layout:radio labelValue="Да" value="1" valueCheckedPath="//REGUEST//IS_BIM" name="req_request__is_bim" checked="1" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                <layout:radio labelValue="Нет" value="0" valueCheckedPath="//REGUEST//IS_BIM" name="req_request__is_bim" checked="0" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                        </layout:simple-field>

                        <layout:simple-field label="Первичность обращения" class="full radioGroup radio" required="1">
                            <layout:radio labelValue="Первичное" value="1" valueCheckedPath="//REGUEST//IS_PRIMARY_REQUEST" name="req_request__is_primary_request" checked="1" xmlTag=":name:" readonly="//ENABLISH//ENABLE_NOT_NEW"/>
                            <layout:radio labelValue="Повторное" value="0" valueCheckedPath="//REGUEST//IS_PRIMARY_REQUEST" name="req_request__is_primary_request" checked="0" xmlTag=":name:" readonly="//ENABLISH//ENABLE_NOT_NEW"/>

                        </layout:simple-field>
                        <div class="before_appeal">
                            <layout:simple-field label="Предыдущее обращение" class="medium" required="0">
                                <layout:multiselect value="//REGUEST//FK_REQ_REQUEST_PREVIOUS" limit="1" listSourceID="nsi_request_all" name="req_request__fk_req_request_previous" xmlTag=":name:" readonly="//ENABLISH//ENABLE_NOT_NEW"/>
                                <label> </label>
                                <layout:edit type="TEXT" name="req_request_previous_nsi_service_type" value="//REGUEST//FK_REQ_REQUEST_PREVIOUS_SERVICE_TYPE"  xmlTag=":name:" readonly="1"/>
                            </layout:simple-field>
                            <layout:simple-field label="Примечание" class="full" required="0">
                                <layout:edit type="TEXTAREA" name="req_request__request_previous_comment" value="//REGUEST//REQUEST_PREVIOUS_COMMENT"  xmlTag=":name:" readonly="//ENABLISH//ENABLE_NOT_NEW"/>
                            </layout:simple-field>
                        </div>
                        <layout:simple-field label="Связанные обращения" class=" medium noinner_line" required="0">

                            <xsl:choose>
                                <xsl:when test="$DATA//ENABLISH//ENABLE_NOT_NEW='1'">

                                    <layout:table class="simpleTable" style="width:100%;"  move="1">
                                        <!--layout:header>
                                          <layout:cell name="Связанные обращения" />
                                          <layout:cell name="Вид услуги" />
                                        </layout:header-->
                                        <layout:body value="//REGUEST_LINK//ROW" name="req_link" xmlTag="req_link">
                                          <layout:cell>
                                            <layout:multiselect value="FK_REQ_REQUEST_LINK" limit="1" listSourceID="nsi_request_all" name="req_link_FK_req_request_link" xmlTag=":name:" readonly="//ENABLISH//ENABLE_NOT_NEW"/>
                                          </layout:cell>
                                          <layout:cell >
                                            <layout:edit type="TEXT" value="REQUEST_TEXT" name="req_link_nsi_service_type"  xmlTag=":name:" readonly="1"/>
                                          </layout:cell>

                                        </layout:body>
                                    </layout:table>
                                </xsl:when>
                                <xsl:otherwise>
                                    <layout:table class="simpleTable" style="width:100%;" add="1" move="1">
                                        <!--layout:header>
                                          <layout:cell name="Связанные обращения" />
                                          <layout:cell name="Вид услуги" />
                                        </layout:header-->
                                        <layout:body value="//REGUEST_LINK//ROW" name="req_link" xmlTag="req_link">
                                          <layout:cell>
                                            <layout:multiselect value="FK_REQ_REQUEST_LINK" limit="1" listSourceID="nsi_request_all" name="req_link_FK_req_request_link" xmlTag=":name:" readonly="//ENABLISH//ENABLE_NOT_NEW"/>
                                          </layout:cell>
                                          <layout:cell >
                                            <layout:edit type="TEXT" value="REQUEST_TEXT" name="req_link_nsi_service_type"  xmlTag=":name:" readonly="1"/>
                                          </layout:cell>

                                        </layout:body>
                                    </layout:table>
                                </xsl:otherwise>
                            </xsl:choose>



                        </layout:simple-field>
                    </div>
                    <div class="steps" id="step2">
                        <layout:header>ШАГ 2. Сведения о заявителе</layout:header>
                        <layout:simple-field label="" class="full radioGroup_list radio ur_fiz" required="0">
                            <layout:radio labelValue="Юридическое лицо" value="ur" name="con_contractor_declarant_nsi_company_form" checked="1" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                            <layout:radio labelValue="Индивидуальный предприниматель" value="ip" name="con_contractor_declarant_nsi_company_form" checked="0" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                            <layout:radio labelValue="Физическое лицо" value="fiz" name="con_contractor_declarant_nsi_company_form" checked="0" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                            <!--layout:hidden value="//MY_LIST_VALUE" name="is_primary_request" xmlTag=":name:"/-->
                        </layout:simple-field>

                        <div class="ur">
                            <div class="fields_selector">
                            <layout:simple-field label="Название организации" class="medium" required="0">
                                <layout:select name="declarer_con_contractor_select__name" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/FK_CON_CONTRACTOR" listSourceID="nsi_con_contractor" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                <input type="button" value="Создать новую" class="addNewOrg form_button"/>
                            </layout:simple-field>
                            <div class="this_org_data"></div>
                            </div>
                            <div class="full_fields_list">
                            <layout:simple-field label="Организационно-правовая форма" class="full double_line" required="1">
                                <layout:select name="declarer_nsi_company_form" value="//MY_LIST_VALUE" listSourceID="nsi_company_form" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                            </layout:simple-field>
                            <layout:simple-field label="Наименование полное" class="full" required="1">
                                <layout:edit type="TEXTAREA" name="declarer_con_contractor__full_name" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/FULL_NAME" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                            </layout:simple-field>
                            <layout:simple-field label="Наименование краткое" class="full" required="1">
                                <layout:edit type="TEXT" name="declarer_con_contractor__name" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/NAME" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                            </layout:simple-field>
                            <layout:simple-field label="Юридический адрес" class="full" required="0">
                                <layout:edit type="TEXTAREA" name="declarer_con_contractor__address_legal" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/ADDRESS_LEGAL" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                            </layout:simple-field>
                            <layout:simple-field label="Фактический адрес" class="full" required="0">
                                <layout:edit type="TEXTAREA" name="declarer_con_contractor__address_post" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/ADDRESS_POST" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                            </layout:simple-field>
                            <layout:simple-field label="ИНН" class="small some_inline" required="1">
                                <layout:edit type="TEXT" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/INN" name="declarer_con_contractor__inn" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                <label class="redStar"><strong>*</strong>КПП</label>
                                <layout:edit type="TEXT" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/KPP" name="declarer_con_contractor__kpp" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                            </layout:simple-field>
                            <layout:simple-field label="ОГРН" class="small some_inline" required="1">
                                <layout:edit type="TEXT" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/OGRN_NUMBER" name="declarer_con_contractor__ogrn_number" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                            </layout:simple-field>
                            <layout:simple-field label="ОКПО" class="small some_inline" required="0">
                                <layout:edit type="TEXT" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/OKPO" name="declarer_con_contractor__okpo" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                            </layout:simple-field>
                            <layout:simple-field label="Телефон, факс" class="small some_inline mask_phone" required="1">
                                <layout:edit type="TEXT" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/PHONE" name="declarer_con_contractor__phone" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                            </layout:simple-field>
                            <layout:simple-field label="Электронная почта" class="medium mask_email" required="1">
                                <layout:edit type="EMAIL" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/EMAIL" name="declarer_con_contractor__email" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                            </layout:simple-field>
                            <layout:simple-field label="Документы, подтверждающие право заявителя действовать от имени заказчика" class="medium double_line" required="0">
                                <layout:file value="Загрузить" id="declarer_con_contract_member__file_id" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                            </layout:simple-field>
                            <h3 class="header line"><span>Банковские реквизиты</span></h3>

                                <layout:simple-field label="Наименование реквизитов" class="medium" required="1">
                                    <layout:select name="declarer_con_bank_account__name" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/FK_CON_BANK_ACCOUNT" listSourceID="nsi_request_type" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                </layout:simple-field>
                                <layout:simple-field label="Адрес банка" class="medium" required="1">
                                    <layout:edit type="TEXTAREA" value="//TEST_VALUE" name="declarer_con_bank_account__bank_adress" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                </layout:simple-field>
                                <layout:simple-field label="Отделение банка" class="medium" required="1">
                                    <layout:edit type="TEXTAREA" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/BANK_NAME" name="declarer_con_bank_account__bank_name" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>

                                </layout:simple-field>
                                <layout:simple-field label="БИК" class="medium number_9" required="0">
                                    <layout:edit type="TEXT" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/BANK_BIK" name="declarer_con_bank_account__bank_bik" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                </layout:simple-field>
                                <layout:simple-field label="Расчётный счет" class="medium number_24" required="1">
                                    <layout:edit type="TEXT" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/ACCOUNT_COR" name="declarer_con_bank_account__bank_account_set" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                </layout:simple-field>
                                <layout:simple-field label="Корреспондентский счет" class="medium number_24" required="0">
                                     <layout:edit type="TEXT" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/BANK_NAME" name="declarer_con_bank_account__bank_account_cor" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                </layout:simple-field>

                            <h3 class="header line"><span>Представитель</span></h3>

                                <layout:simple-field label="ФИО" class="medium" required="0">
                                    <layout:edit type="TEXT" value="//TEST_VALUE" name="declarer_con_person__name" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                    <input type="button" value="Изменить" class="addNewOrg form_button"/>
                                </layout:simple-field>
                                <layout:simple-field label="Фамилия" class="medium" required="1">
                                    <layout:edit type="TEXT" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/PER_LAST_NAME" name="declarer_con_person__last_name" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                </layout:simple-field>
                                <layout:simple-field label="Имя" class="medium" required="1">
                                    <layout:edit type="TEXT" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/PER_FIRST_NAME" name="declarer_con_person__first_name" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                </layout:simple-field>
                                <layout:simple-field label="Отчество" class="medium" required="1">
                                    <layout:edit type="TEXT" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/PER_MIDDLE_NAME" name="declarer_con_person__middle_name" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                </layout:simple-field>
                                <layout:simple-field label="Должность" class="medium" required="1">
                                    <layout:edit type="TEXT" value="//TEST_VALUE" name="declarer_con_person__post" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                </layout:simple-field>
                                <layout:simple-field label="Действует на основании" class="medium" required="0">
                                    <layout:edit type="TEXT" value="//TEST_VALUE" name="declarer_con_person__doc_proxy" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                </layout:simple-field>
                                <layout:simple-field label="Тип документа" class="medium" required="1">
                                    <layout:select name="declarer_req_expert_member__fk_exp_person" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/NSI_PERSON_DOC" listSourceID="nsi_person_doc" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                </layout:simple-field>
                                <layout:simple-field label="Серия и номер" class="small" required="1">
                                    <layout:edit type="TEXT" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/PER_DOC_SERIAL" name="declarer_con_person__doc_serial" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                    <label>  </label>
                                    <layout:edit type="TEXT" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/PER_DOC_NUMBER" name="declarer_con_person__doc_serial" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                </layout:simple-field>
                                <layout:simple-field label="Когда выдан" class="medium" required="1">
                                    <layout:edit type="DATE" name="declarer_con_person__doc_reg_date" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/PER_DOC_DATE" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                </layout:simple-field>
                                <layout:simple-field label="Кем выдан" class="medium" required="1">
                                    <layout:edit type="TEXT" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/PER_DOC_ORGAN" name="declarer_con_person__doc_reg_organ" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                </layout:simple-field>
                                <layout:simple-field label="Телефон" class="small some_inline mask_phone" required="0">
                                    <layout:edit type="TEXT" value="//PERSON//PHONE" name="declarer_con_person__phone" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                </layout:simple-field>
                                <layout:simple-field label="Электронная почта" class="medium mask_email" required="0">
                                    <layout:edit type="EMAIL" value="//TEST_VALUE" name="declarer_con_person__email" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                </layout:simple-field>

                            </div>
                        </div>
                        <div class="fiz" name="fiz" xmlTag=":name:">

                        <div class="fields_selector">
                            <layout:simple-field label="ФИО" class="medium" required="0">
                                <layout:select name="declarer_con_person__name_fiz" value="//MY_LIST_VALUE" listSourceID="nsi_con_contractor" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                <input type="button" value="Изменить" class="addNewOrg form_button"/>
                            </layout:simple-field>
                        </div>
                        <div class="full_fields_list">
                            <layout:simple-field label="Фамилия" class="medium" required="1">
                                <layout:edit type="TEXT" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/PER_LAST_NAME" name="declarer_con_person__last_name_fiz" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                            </layout:simple-field>
                            <layout:simple-field label="Имя" class="medium" required="1">
                                <layout:edit type="TEXT" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/PER_FIRST_NAME" name="declarer_con_person__first_name_fiz" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                            </layout:simple-field>
                            <layout:simple-field label="Отчество" class="medium" required="1">
                                <layout:edit type="TEXT" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/PER_MIDDLE_NAME" name="declarer_con_person__middle_name_fiz" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                            </layout:simple-field>
                            <layout:simple-field label="ИНН" class="small some_inline" required="0">
                                <layout:edit type="TEXT" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/INN" name="con_contractor__inn_fiz" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                <label>СНИЛС</label>
                                <layout:edit type="TEXT" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/SNILS" name="declarer_con_person__snils_number_fiz" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                            </layout:simple-field>

                            <layout:simple-field label="Тип документа" class="medium" required="1">
                                <layout:select name="declarer_req_expert_member__fk_exp_person_fiz" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/NSI_PERSON_DOC" listSourceID="nsi_person_doc" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                            </layout:simple-field>
                            <layout:simple-field label="Серия и номер" class="small" required="1">
                                <layout:edit type="TEXT" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/PER_DOC_SERIAL" name="declarer_con_person__doc_serial_fiz" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                <label>  </label>
                                <layout:edit type="TEXT" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/PER_DOC_NUMBER" name="declarer_con_person__doc_serial_fiz" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                            </layout:simple-field>
                            <layout:simple-field label="Когда выдан" class="medium" required="1">
                                <layout:edit type="DATE" name="declarer_con_person__doc_reg_date_fiz" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/PER_DOC_DATE" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                            </layout:simple-field>
                            <layout:simple-field label="Кем выдан" class="medium" required="1">
                                <layout:edit type="TEXT" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/PER_DOC_ORGAN" name="declarer_con_person__doc_reg_organ_fiz" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                            </layout:simple-field>
                            <layout:simple-field label="Телефон" class="small some_inline mask_phone" required="1">
                                <layout:edit type="TEXT" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/PHONE" name="declarer_con_person__phone_fiz" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                            </layout:simple-field>

                            <layout:simple-field label="Электронная почта" class="medium mask_email" required="1">
                                <layout:edit type="EMAIL" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/EMAIL" name="declarer_con_person__email_fiz" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                            </layout:simple-field>
                        <h3 class="header line"><span>Банковские реквизиты</span></h3>
                            <layout:simple-field label="Адрес банка" class="medium" required="1">
                                    <layout:edit type="TEXTAREA" value="//TEST_VALUE" name="declarer_con_bank_account__bank_adress" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                </layout:simple-field>
                            <layout:simple-field label="Отделение банка" class="medium" required="1">
                                    <layout:edit type="TEXTAREA" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/BANK_NAME" name="declarer_con_bank_account__bank_name_fiz" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                </layout:simple-field>

                                <layout:simple-field label="БИК" class="small number_9" required="0">
                                    <layout:edit type="TEXT" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/BANK_BIK" name="declarer_con_bank_account__bank_bik_fiz" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                </layout:simple-field>
                                <layout:simple-field label="Расчётный счет" class="medium" required="1">
                                    <layout:edit type="TEXT" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/ACCOUNT_SET" name="declarer_con_bank_account__bank_account_set_fiz" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                </layout:simple-field>
                                <layout:simple-field label="Корреспондентский счет" class="medium" required="0">
                                     <layout:edit type="TEXT" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/ACCOUNT_COR" name="declarer_con_bank_account__bank_account_cor_fiz" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                </layout:simple-field>
                        </div>
                    </div>
                    </div>

                    <div class="steps" id="step3">
                        <layout:header>ШАГ 3. Сведения об объекте</layout:header>
                        <layout:simple-field label="Наименование объекта" class="full" required="1">
                            <layout:edit type="TEXTAREA" value="//REGUEST//OBJECT_NAME" name="req_request__object_name" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                        </layout:simple-field>
                        <layout:simple-field label="Стадия проектирования" class="medium" required="0">
                            <layout:select name="req_request__nsi_object_stage" value="//REGUEST//NSI_OBJECT_STAGE" listSourceID="nsi_object_stage" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                        </layout:simple-field>
                        <layout:simple-field label="Вид работ" class="medium" required="0">
                            <layout:select name="req_request__nsi_object_work_type" value="//REGUEST//NSI_OBJECT_WORK_TYPE" listSourceID="nsi_object_work_type" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                        </layout:simple-field>
                        <layout:simple-field label="Функциональное назначение" class="medium" required="0">
                            <layout:select name="req_request_nsi_object_usage" value="//REGUEST//NSI_OBJECT_USAGE" listSourceID="nsi_object_usage" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                        </layout:simple-field>
                        <layout:simple-field label="Вид объекта" class="medium" required="1">
                            <layout:select name="req_request__nsi_object_type" value="//REGUEST//NSI_OBJECT_WORK_TYPE" listSourceID="nsi_object_type" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                        </layout:simple-field>
                        <!--layout:simple-field label="Год ввода" class="medium" required="0">
                            <layout:select name="req_request__enter_year" value="//MY_LIST_VALUE" listSource="MY_LIST" xmlTag=":name:"/>
                        </layout:simple-field-->
                        <layout:simple-field label="Признак уникальности" class="full" required="0">
                             <layout:multiselect value="//OBJ_UNIQUE//NSI_OBJECT_UNIQUE_TYPE" limit="100" listSourceID="nsi_object_unique_type" name="req_request__nsi_object_unique_type" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                        </layout:simple-field>
                        <layout:simple-field label="Источник финансирования" class="medium" required="1">
                            <layout:select name="req_request__nsi_object_finance" value="//REGUEST//NSI_OBJECT_FINANCE" listSourceID="nsi_object_finance" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                        </layout:simple-field>

                        <!--layout:simple-field label="Субсидия" class="full double_line checkBox" required="0">
                            <layout:checkbox forceCheckbox="1" label="" name="agreement" value="test" valueChecked=""/>
                        </layout:simple-field-->

                        <layout:simple-field label="Номер положительного заключения государственной экологической экспертизы" class="full double_line" required="0">
                            <layout:edit type="TEXT" value="//REGUEST//ECO_EXPERT_NUMBER" name="req_request__eco_expert_number" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                        </layout:simple-field>
                        <layout:simple-field label="Дата положительного заключения государственной экологической экспертизы" class="full double_line" required="0">
                            <layout:edit type="DATE" name="req_request__eco_expert_date" value="//REGUEST//ECO_EXPERT_DATE" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                        </layout:simple-field>
                        <h3 class="header line"><span>Документы по планировке территории</span></h3>
                        <layout:simple-field label="Номер ГПЗУ" class="full" required="0">
                            <layout:edit type="TEXT" value="//REGUEST//GPZU_NUMBER" name="req_request__gpzu_number" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                        </layout:simple-field>
                        <h3 class="header line"><span>Сведения о земельно-правовых отношениях</span></h3>
                        <layout:simple-field label="Земельный участок находится" class="full  radioGroup_list radio" required="0">
                            <xsl:choose>
                                <xsl:when test="//REGUEST//IS_OBJECT_OWNER=1">
                                    <layout:radio labelValue="В собственности заявителя" value="1" name="req_request__is_object_owner" checked="1" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                    <layout:radio labelValue="В аренде/пользовании у заявителя" value="0" name="req_request__is_object_owner" checked="0" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <layout:radio labelValue="В собственности заявителя" value="1" name="req_request__is_object_owner" checked="0" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                    <layout:radio labelValue="В аренде/пользовании у заявителя" value="0" name="req_request__is_object_owner" checked="1" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                </xsl:otherwise>
                            </xsl:choose>

                        </layout:simple-field>
                        <layout:simple-field label="Кадастровый номер" class="medium" required="0">
                            <layout:edit type="TEXT" value="//REGUEST//CADASTRAL_NUMBER" name="req_request__cadastral_number" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                        </layout:simple-field>
                        <h3 class="header line"><span>Адрес Объекта</span></h3>
                        <div class="kladr">
                        <xsl:variable name="kladr1">
                            <xsl:value-of select="//KLADR_REGION"/>
                        </xsl:variable>
                        <xsl:variable name="kladr2">
                            <xsl:choose>
                                <xsl:when test="//KLADR_DISTRICT">
                                    <xsl:value-of select="//KLADR_DISTRICT"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="//KLADR_REGION"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        <xsl:variable name="kladr3">
                            <xsl:choose>
                                <xsl:when test="//KLADR_TOWN">
                                    <xsl:value-of select="//KLADR_TOWN"/>
                                </xsl:when>
                                <xsl:when test="//KLADR_DISTRICT">
                                    <xsl:value-of select="//KLADR_DISTRICT"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="//KLADR_REGION"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        <xsl:variable name="kladr4">
                            <xsl:choose>
                                <xsl:when test="//KLADR_LOCALITY">
                                    <xsl:value-of select="//KLADR_LOCALITY"/>
                                </xsl:when>
                                <xsl:when test="//KLADR_TOWN">
                                    <xsl:value-of select="//KLADR_TOWN"/>
                                </xsl:when>
                                <xsl:when test="//KLADR_DISTRICT">
                                    <xsl:value-of select="//KLADR_DISTRICT"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="//KLADR_REGION"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>

                        <layout:simple-field label="Регион" class="medium" required="1">
                            <layout:multiselect name="req_request__kladr_region" value="//REGUEST//KLADR_REGION" listSourceID="KLADR_LIST" paramnames="INPUT_LEVEL__INPUT_CODE" parameters="1" limit="1" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                        </layout:simple-field>

                        <layout:simple-field label="Район" class="medium" required="0">
                            <layout:multiselect name="req_request__kladr_district" value="//REGUEST//KLADR_DISTRICT" listSourceID="KLADR_LIST" paramnames="INPUT_LEVEL__INPUT_CODE" parameters="2__{$kladr1}" limit="1" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                        </layout:simple-field>
                        <layout:simple-field label="Город" class="medium" required="0">
                            <layout:multiselect name="req_request__kladr_town" value="//REGUEST//KLADR_TOWN" listSourceID="KLADR_LIST" paramnames="INPUT_LEVEL__INPUT_CODE" parameters="3__{$kladr2}" limit="1" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>

                        </layout:simple-field>
                        <layout:simple-field label="Нас. пункт" class="medium" required="0">
                            <layout:multiselect name="req_request__kladr_locality" value="//REGUEST//KLADR_LOCALITY" listSourceID="KLADR_LIST" paramnames="INPUT_LEVEL__INPUT_CODE" parameters="4__{$kladr3}" limit="1" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>

                        </layout:simple-field>
                        <layout:simple-field label="Улица" class="medium" required="0">
                            <layout:multiselect name="req_request__kladr_street" value="//REGUEST//KLADR_STREET" listSourceID="KLADR_LIST" paramnames="INPUT_LEVEL__INPUT_CODE" parameters="5__{$kladr4}" limit="1" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                        </layout:simple-field>
                        <layout:simple-field label="Дом" class="ultra_small" required="0">
                            <layout:edit type="TEXT" value="//REGUEST//HOUSE" name="req_request__house" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                            <label>Владение</label>
                            <layout:edit type="TEXT" value="//REGUEST//OWNERSHIP" name="req_request__ownership" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                            <label>Корпус</label>
                            <layout:edit type="TEXT" value="//REGUEST//HOUSING" name="req_request__housing" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                            <label>Строение</label>
                            <layout:edit type="TEXT" value="//REGUEST//BUILDING" name="req_request__building" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                        </layout:simple-field>

                        <layout:simple-field label="Дополнительные адресные данные" class="full double_line" required="0">
                            <layout:edit type="TEXTAREA" value="//REGUEST//ADDRESS_MORE" name="req_request_address_more" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                        </layout:simple-field>
                        <layout:simple-field label="Сформированный адрес" class="full" required="0">
                            <layout:edit type="TEXTAREA" value="//REGUEST//ADDRESS" name="req_request_combo_address" xmlTag=":name:" readonly="1"/>
                        </layout:simple-field>
                        </div>
                    </div>
                    <div class="steps" id="step4">
                        <layout:header>ШАГ 4. Участники проекта</layout:header>
                        <layout:section label="Участник проекта" xmlTag="members" class="topSection" select="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE!='DECLARANT']" add="1">
                            <div class="fields_selector">
                            <layout:simple-field label="Название организации" class="medium" required="1">
                                <layout:select value="FK_CON_CONTRACTOR" listSourceID="nsi_con_contractor" name="member_con_contractor_select__name" xmlTag=":name:"/>
                                <input type="button" value="Добавить новую" class="addNewOrg form_button unique_butt" data-readonly="{$DATA//ENABLISH//ENABLE_ALL}"/>
                            </layout:simple-field>
                            <layout:simple-field label="" class="full radioGroup_list radio" required="0">
                                <layout:radio labelValue="Юридическое лицо" value="ЮЛ" name="member_con_contractor__nsi_company_form" checked="1" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                <layout:radio labelValue="Индивидуальный предприниматель" value="ИП" name="member_con_contractor__nsi_company_form" checked="0" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                            </layout:simple-field>
                            <layout:simple-field label="Роль организации" class="medium role_selector" required="1">
                                <layout:select name="member_req_contractor_member__nsi_company_role" value="NSI_COMPANY_ROLE" listSourceID="nsi_company_role" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                            </layout:simple-field>
                            <div class="this_org_data"></div>
                            </div>
                            <div class="full_fields_list">

                            <layout:simple-field label="Наименование полное" class="full" required="0">
                                <layout:edit type="TEXTAREA" name="member_con_contractor__full_name" value="//TEST_VALUE" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                            </layout:simple-field>
                            <layout:simple-field label="Наименование краткое" class="full" required="0">
                                <layout:edit type="TEXT" name="member_con_contractor__name" value="//TEST_VALUE" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                            </layout:simple-field>
                            <layout:simple-field label="Юридический адрес" class="full" required="0">
                                <layout:edit type="TEXTAREA" name="member_con_contractor__address_legal" value="//TEST_VALUE" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                            </layout:simple-field>
                            <layout:simple-field label="Фактический адрес" class="full" required="0">
                                <layout:edit type="TEXTAREA" name="member_con_contractor__address_post" value="//TEST_VALUE" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                            </layout:simple-field>
                            <layout:simple-field label="ИНН" class="small some_inline" required="0">
                                <layout:edit type="TEXT" value="//TEST_VALUE" name="member_con_contractor__inn" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                <label>КПП</label>
                                <layout:edit type="TEXT" value="//TEST_VALUE" name="member_con_contractor__kpp" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                            </layout:simple-field>
                            <layout:simple-field label="ОГРН" class="small some_inline" required="0">
                                <layout:edit type="TEXT" value="//TEST_VALUE" name="member_con_contractor__ogrn_number" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                <label>ОКПО</label>
                                <layout:edit type="TEXT" value="//TEST_VALUE" name="member_con_contractor__okpo" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                            </layout:simple-field>
                            <layout:simple-field label="Телефон" class="small some_inline mask_phone" required="0">
                                <layout:edit type="TEXT" value="//TEST_VALUE" name="member_con_contractor__phone" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                            </layout:simple-field>
                            <layout:simple-field label="Электронная почта" class="medium mask_email" required="0">
                                <layout:edit type="EMAIL" value="//TEST_VALUE" name="member_con_contractor__email" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                            </layout:simple-field>

                            <h3 class="header line"><span>Банковские реквизиты</span></h3>

                                <layout:simple-field label="Наименование реквизитов" class="medium" required="1">

                                    <layout:select name="member_requizit_name" value="//MY_LIST_VALUE" listSourceID="nsi_request_type" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                </layout:simple-field>
                                <layout:simple-field label="Адрес банка" class="medium" required="1">
                                    <layout:edit type="TEXTAREA" value="//TEST_VALUE" name="member_con_bank_account__bank_adress" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                </layout:simple-field>
                                <layout:simple-field label="Отделение банка" class="medium" required="1">
                                    <layout:edit type="TEXTAREA" value="//TEST_VALUE" name="member_con_bank_account__bank_name" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                </layout:simple-field>

                                <layout:simple-field label="БИК" class="small number_9" required="0">
                                    <layout:edit type="TEXT" value="//TEST_VALUE" name="member_con_bank_account__bank_bik" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                </layout:simple-field>
                                <layout:simple-field label="Расчётный счет" class="medium" required="1">
                                    <layout:edit type="TEXT" value="//TEST_VALUE" name="member_con_bank_account__bank_account_set" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                </layout:simple-field>
                                <layout:simple-field label="Корреспондентский счет" class="medium" required="0">
                                     <layout:edit type="TEXT" value="//TEST_VALUE" name="member_con_bank_account__bank_account_cor" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                </layout:simple-field>

                            <h3 class="header line"><span>Представитель</span></h3>

                                <layout:simple-field label="ФИО" class="medium" required="0">
                                    <layout:edit type="TEXT" value="//TEST_VALUE" name="member_con_person__name" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                    <input type="button" value="Изменить" class="addNewOrg form_button"/>
                                </layout:simple-field>
                                <layout:simple-field label="Фамилия" class="medium" required="1">
                                    <layout:edit type="TEXT" value="//TEST_VALUE" name="member_con_person__last_name" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                    </layout:simple-field>
                                    <layout:simple-field label="Имя" class="medium" required="1">
                                        <layout:edit type="TEXT" value="//TEST_VALUE" name="member_con_person__first_name" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                    </layout:simple-field>
                                    <layout:simple-field label="Отчество" class="medium" required="1">
                                        <layout:edit type="TEXT" value="//TEST_VALUE" name="member_con_person__middle_name" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                    </layout:simple-field>
                                <layout:simple-field label="Должность" class="medium" required="1">
                                    <layout:edit type="TEXT" value="//TEST_VALUE" name="member_con_person__post" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                </layout:simple-field>
                                <layout:simple-field label="Действует на основании" class="medium" required="0">
                                    <layout:edit type="TEXT" value="//TEST_VALUE" name="member_con_person__doc_proxy" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                </layout:simple-field>

                                <layout:simple-field label="Телефон" class="small some_inline mask_phone" required="0">
                                    <layout:edit type="TEXT" value="//TEST_VALUE" name="member_con_person__phone" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                </layout:simple-field>
                                <layout:simple-field label="Электронная почта" class="medium mask_email" required="0">
                                    <layout:edit type="EMAIL" value="//TEST_VALUE" name="member_con_person__email" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                                </layout:simple-field>

                            <div class="project_org">
                            <layout:simple-field label="ГИП/Телефон" class="medium" required="0">
                                <layout:edit type="TEXT" value="//TEST_VALUE" name="member_con_contractor__phone_gip" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                            </layout:simple-field>
                            <layout:simple-field label="ГАП/Телефон" class="medium" required="0">
                                <layout:edit type="TEXT" value="//TEST_VALUE" name="member_con_contractor__phone_gap" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                            </layout:simple-field>
                            <layout:simple-field label="Примечание" class="full" required="0">
                                <layout:edit type="TEXTAREA" value="//TEST_VALUE" name="member_con_contractor__note" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                            </layout:simple-field>
                            <div class="line narrow">
                                <div class="top_label">Реквизиты свидетельства о допуске к видам работ по подготовке проектной документации и (или) по инженерным изысканиям, выданного саморегулируемой организацией</div>
                                <layout:edit type="TEXTAREA" value="//TEST_VALUE" name="member_con_contractor__doc_sro" style="height: 75px;width: 100%;border: 1px solid #D9DBDD;border-radius: 2px;" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                            </div>
                            <div class="line narrow">
                                <div class="top_label">Файлы свидетельства о допуске к видам  работ по подготовке проектной документации и (или) по инженерным изысканиям, выданного саморегулируемой организацией</div>
                                <layout:file value="Загрузить" id="member_con_contractor__folder_id_spo" xmlTag=":name:" readonly="//ENABLISH//ENABLE_ALL"/>
                            </div>
                            </div>
                            <script>$(function(){
                                all_masks();
                                addFieldsActivate();
                                });</script>
                            </div>
                        </layout:section>
                    </div>
                    <div class="steps" id="step5">

                        <layout:header>ШАГ 5. Технико-экономические показатели</layout:header>
                        <layout:section select="//OBJ_PARAMETER//ROW" xmlTag="obj_parameter" class="topSection" add="1">
                            <div class="line tep">
                            <div class="tep_left">
                                <layout:edit type="TEXT"  name="obj_parameter__sort" xmlTag=":name:" value="SORT" readonly="1" style="width:55px;"/>
                            </div>
                            <div class="tep_right">
                                <div class="tep_params">
                                    <div class="top_label">Показатель</div>
                                    <layout:multiselect value="NSI_OBJECT_PARAMETER" limit="100" listSourceID="nsi_object_param" name="obj_parameter__nsi_object_params" viewingId="57949E9FAB23443F98CA918599BCFABA" multiple="true" xmlTag=":name:" style="width:609px;" readonly="1"/>

                                </div>
                                <div class="tep_measure triple">
                                    <div class="top_label">Ед. изм.</div>
                                    <layout:edit type="TEXT"  name="obj_parameter__nsi_object_params_measure" xmlTag=":name:" value="//TEST_VALUE" readonly="1" />
                                </div>
                                <div class="tep_value_before triple">
                                    <div class="top_label">До экспертизы</div>
                                    <layout:edit type="TEXT"  name="obj_parameter__value_before" xmlTag=":name:" value="VALUE_BEFORE" readonly="//ENABLISH//ENABLE_NOT_NEW"/>
                                </div>
                                <div class="tep_value_after triple">
                                    <div class="top_label">После экспертизы</div>
                                    <layout:edit type="TEXT"  name="obj_parameter__value_after" xmlTag=":name:" value="VALUE_AFTER" readonly="//ENABLISH//ENABLE_NOT_NEW"/>
                                </div>
                                <div class="tep_note">
                                    <div class="label">Примечание</div>
                                    <layout:edit type="TEXTAREA"  name="obj_parameter__note" xmlTag=":name:" value="NOTE" style="width:518px;" readonly="//ENABLISH//ENABLE_NOT_NEW"/>
                                </div>
                            </div>
                            </div>
                        </layout:section>
                    </div>
                    <div class="steps" id="step6">
                        <layout:header>ШАГ 6. Участники экспертизы</layout:header>
                        <strong>Ведущий эксперт</strong>
                        <div class="line">
                            <div class="row">
                                <div class="top_label_cell medium">
                                    <div class="top_label">Подразделение</div>
                                    <div class="cell_content">
                                        <layout:multiselect value="//EXPERT_MEMBER//ROW[NSI_EXPERT_ROLE='LEADING_EXPERT']/FK_EXP_DEPARTMENT" limit="1" listSourceID="nsi_exp_department" name="req_expert_member__fk_exp_department_lead" xmlTag=":name:" readonly="//ENABLISH//ENABLE_NOT_NEW"/>
                                        <layout:hidden name="expert_member_lead_section" value="//EXPERT_MEMBER//ROW[NSI_EXPERT_ROLE='LEADING_EXPERT']/FK_EXP_DEPARTMENT"/>
                                    </div>
                                </div>
                                <div class="top_label_cell medium">
                                    <div class="top_label">Сотрудник</div>
                                    <div class="cell_content">
                                        <layout:select value="//EXPERT_MEMBER//ROW[NSI_EXPERT_ROLE='LEADING_EXPERT']/FK_EXP_PERSON" listSource="nsi_exp_person" name="req_expert_member__fk_exp_person_lead" xmlTag=":name:" readonly="//ENABLISH//ENABLE_NOT_NEW"/>
                                        <layout:hidden name="expert_member_lead" value="//EXPERT_MEMBER//ROW[NSI_EXPERT_ROLE='LEADING_EXPERT']/FK_EXP_PERSON"/>
                                    </div>
                                </div>
                            </div>
                            <layout:edit type="TEXTAREA" value="//EXPERT_MEMBER//ROW[NSI_EXPERT_ROLE='LEADING_EXPERT']/NOTE" style="height: 32px;width: 100%;border: 1px solid #D9DBDD;border-radius: 2px;" name="req_expert_member__note_lead" xmlTag=":name:" readonly="//ENABLISH//ENABLE_NOT_NEW"/>
                        </div>
                        <strong>Ответственный финансист</strong>
                        <div class="line">
                            <div class="row">
                                <div class="top_label_cell medium">
                                    <div class="top_label">Подразделение</div>
                                    <div class="cell_content">
                                        <layout:multiselect value="//EXPERT_MEMBER//ROW[NSI_EXPERT_ROLE='RESPONSIBLE_FINANCIER']/FK_EXP_DEPARTMENT" limit="1" listSourceID="nsi_exp_department" name="req_expert_member__fk_exp_department" xmlTag=":name:" readonly="//ENABLISH//ENABLE_NOT_NEW"/>
                                        <layout:hidden name="expert_member_finance_section" value="//EXPERT_MEMBER//ROW[NSI_EXPERT_ROLE='RESPONSIBLE_FINANCIER']/FK_EXP_DEPARTMENT"/>
                                    </div>
                                </div>
                                <div class="top_label_cell medium">
                                    <div class="top_label">Сотрудник</div>
                                    <div class="cell_content">
                                        <layout:select value="//EXPERT_MEMBER//ROW[NSI_EXPERT_ROLE='RESPONSIBLE_FINANCIER']/FK_EXP_PERSON" listSource="nsi_exp_person" name="req_expert_member__fk_exp_person" xmlTag=":name:" readonly="//ENABLISH//ENABLE_NOT_NEW"/>
                                        <layout:hidden name="expert_member_finance" value="//EXPERT_MEMBER//ROW[NSI_EXPERT_ROLE='RESPONSIBLE_FINANCIER']/FK_EXP_PERSON"/>
                                    </div>
                                </div>
                            </div>
                            <layout:edit type="TEXTAREA" value="//EXPERT_MEMBER//ROW[NSI_EXPERT_ROLE='RESPONSIBLE_FINANCIER']/NOTE" style="height: 32px;width: 100%;border: 1px solid #D9DBDD;border-radius: 2px;" name="req_expert_member__note" xmlTag=":name:" readonly="//ENABLISH//ENABLE_NOT_NEW"/>
                        </div>
                        <h3 class="header line"><span>Привлечение к экспертизе</span></h3>
                        <layout:section label="Привлечение к экспертизе" xmlTag="add_toexp" class="topSection" select="//RECRUIT//ROW" add="1">
                            <layout:simple-field label="Тип" class="medium" required="0">
                                <layout:select value="NSI_PERSON_ROLE" listSourceID="nsi_person_role" name="req_recruit__nsi_person_role" xmlTag=":name:" readonly="//ENABLISH//ENABLE_NOT_NEW"/>
                            </layout:simple-field>
                            <layout:simple-field label="Договор участия" class="medium" required="0">
                                <layout:edit type="TEXT" name="req_recruit__doc_name" xmlTag=":name:" value="DOC_NAME" readonly="//ENABLISH//ENABLE_NOT_NEW"/>
                                <label>от</label>
                                <layout:edit type="DATE" name="req_recruit__doc_date" value="DOC_DATE" xmlTag=":name:" readonly="//ENABLISH//ENABLE_NOT_NEW"/>
                            </layout:simple-field>

                            <layout:simple-field label="Стоимость привлечения, руб." class="medium money" required="0">
                                <layout:edit type="TEXT" name="req_recruit__doc_sum" value="DOC_SUM" xmlTag=":name:" readonly="//ENABLISH//ENABLE_NOT_NEW"/>
                            </layout:simple-field>
                            <script>$(function(){all_masks();});</script>
                        </layout:section>
                        <h3 class="header line"><span>Примечание к учетной карточке</span></h3>
                        <div class="line narrow">
                            <layout:edit type="TEXTAREA" value="//REGUEST//OBJECT_NOTE" name="req_request__object_note" style="height: 75px;width: 100%;border: 1px solid #D9DBDD;border-radius: 2px;" xmlTag=":name:" readonly="//ENABLISH//ENABLE_NOT_NEW"/>
                        </div>
                    </div>

                    <!--div class="steps" id="step7">
                        <layout:header>ШАГ 7. Опись документов</layout:header-->
                        <!--h3 class="header line"><span>Межведомственные</span></h3>
                        <div class="grey_block ">
                            <div class="line checkBox fields_selector">
                                <layout:checkbox forceCheckbox="1" value="//TEST_VALUE" label="Выписка из ЕГРЮЛ" extractFalse="1" name="egrul_check" class="addNewOrg" xmlTag=":name:"/>
                            </div>
                            <div class="full_fields_list">
                                <layout:simple-field label="Заказчик" class="medium" required="0">
                                    <layout:edit type="TEXT" name="egrul_declarant" xmlTag=":name:" value="//TEST_VALUE"/>
                                    <label>Вид лица</label>
                                    <layout:select value="//MY_LIST_VALUE" listSourceID="nsi_person_type" name="egrul_person_type" xmlTag=":name:"/>
                                </layout:simple-field>
                                <layout:simple-field label="ИНН" class="small some_inline" required="0">
                                    <layout:edit type="TEXT" value="//TEST_VALUE" name="egrul_inn" xmlTag=":name:"/>
                                    <label>ОГРН</label>
                                    <layout:edit type="TEXT" value="//TEST_VALUE" name="egrul_ogrn" xmlTag=":name:"/>
                                </layout:simple-field>
                                <layout:simple-field label="Состояние запроса" class="full" required="0">
                                    <layout:edit type="TEXT" value="//TEST_VALUE" name="egrul_request_state" xmlTag=":name:"/>
                                </layout:simple-field>
                                <layout:simple-field label="" class="full" required="0">
                                    <layout:file value="Загрузить" name="req_request__file_id" xmlTag=":name:" sign="false"/>
                                </layout:simple-field>
                            </div>
                        </div>
                        <div class="grey_block ">
                            <div class="line checkBox fields_selector">
                                <layout:checkbox forceCheckbox="1" value="//TEST_VALUE" label="Выписка из ЕГРИП" extractFalse="1" name="egrip_check" class="addNewOrg" xmlTag=":name:"/>
                            </div>
                            <div class="full_fields_list">
                                <layout:simple-field label="Заказчик" class="medium" required="0">
                                    <layout:edit type="TEXT" name="egrip_declarant" xmlTag=":name:" value="//TEST_VALUE"/>
                                    <label>Вид лица</label>
                                    <layout:select value="//MY_LIST_VALUE" listSourceID="nsi_person_type" name="egrul_person_type" xmlTag=":name:"/>
                                </layout:simple-field>
                                <layout:simple-field label="ИНН" class="small some_inline" required="0">
                                    <layout:edit type="TEXT" value="//TEST_VALUE" name="egrip_inn" xmlTag=":name:"/>
                                    <label>ОГРН</label>
                                    <layout:edit type="TEXT" value="//TEST_VALUE" name="egrip_ogrn" xmlTag=":name:"/>
                                </layout:simple-field>
                                <layout:simple-field label="Состояние запроса" class="full" required="0">
                                    <layout:edit type="TEXT" value="//TEST_VALUE" name="egrip_request_state" xmlTag=":name:"/>
                                </layout:simple-field>
                                <layout:simple-field label="" class="full" required="0">
                                        <layout:file value="Загрузить" name="req_request__file_id" xmlTag=":name:" sign="false"/>
                                </layout:simple-field>
                            </div>
                        </div-->
                        <!--h3 class="header line"><span>Поданные заявителем</span></h3>
                        <layout:iterator select="//DOCUMENT2//ROW[IS_ACTUAL='true']">
                            <xsl:variable name="actual">
                                <layout:extract select="IS_ACTUAL"/>
                            </xsl:variable>

                            <div class="expShower" name="req_document" xmlTag=":name:">
                                <div class="hideAndShow open">Свернуть</div>
                                <div class="line checkBox"  >
                                    <layout:checkbox forceCheckbox="1" valueXPATH="DOCUMENTS//NSI_DOCUMENT_TYPE" nameXPATH="OBJECT_ID" extractFalse="1" xmlTag=":name:" valueCheckedXPATH="OBJECT_ID" labelValue="ELEMENT_STRING" name="req_document__nsi_document_type"/>

                                </div>
                                <div class="hideAndShow_content">
                                <layout:table class="test" style="width:100%;" add="1" move="1">
                                    <layout:header>
                                      <layout:cell name="Номер документа" style="width:270px;"/>
                                      <layout:cell name="Дата"  style="width:150px;"/>
                                      <layout:cell name="Примечание"  style="width:344px;"/>
                                    </layout:header>
                                    <layout:body xmlTag=":name:" value="DOCUMENTS/DOCUMENT">
                                        <layout:cell>
                                          <layout:edit type="TEXT"  name="req_document__doc_number" xmlTag=":name:" value="DOC_NUMBER" style="width:260px;"/>
                                        </layout:cell>
                                        <layout:cell>
                                           <label>от</label>
                                          <layout:edit type="DATE"  name="req_document__doc_date" xmlTag=":name:" value="DOC_DATE" style="width:88px;"/>
                                        </layout:cell>
                                        <layout:cell>
                                          <layout:edit type="TEXTAREA"  name="req_document__node" xmlTag=":name:" value="NOTE" style="width:334px;"/>
                                        </layout:cell>
                                    </layout:body>
                                </layout:table>

                                <div class="docLinks">
                                    <a  class="">Загрузить</a>  <a  class="">Сканировать</a>  <a  class="">Запросить</a>
                                </div>
                                </div>
                            </div>

                        </layout:iterator>
                    </div-->




                    <div class="formFooter">
                        <div class="leftBlock">
                            <a class="prevButton">Назад</a>
                        </div>
                        <div class="rightBlock">
                            <input type="button" class="form_button closeButton" value="Отмена"/><input type="button" class="form_button saveCloseButton" value="Сохранить"/><input type="button" class="form_button saveButton" value="Применить"/>
                            <input type="button" class="form_button nextButton" value="Далее"/>
                        </div>
                    </div>

                    <div class="empty_org_template">
                            <layout:simple-field label="Организационно-правовая форма" class="full double_line" required="0">
                                <layout:edit type="TEXT" value="//TEST_VALUE" name="org_template__nsi_company_form" xmlTag=":name:" readonly="1"/>
                            </layout:simple-field>
                            <layout:simple-field label="Наименование полное" class="full" required="0">
                                <layout:edit type="TEXTAREA" name="org_template__full_name" value="//TEST_VALUE" xmlTag=":name:" readonly="1"/>
                            </layout:simple-field>
                            <layout:simple-field label="Наименование краткое" class="full" required="0">
                                <layout:edit type="TEXT" name="org_template_con_contractor__name" value="//TEST_VALUE" xmlTag=":name:" readonly="1"/>
                            </layout:simple-field>
                            <layout:simple-field label="Юридический адрес" class="full" required="0">
                                <layout:edit type="TEXTAREA" name="org_template__address_legal" value="//TEST_VALUEADDRESS_LEGAL" xmlTag=":name:" readonly="1"/>
                            </layout:simple-field>
                            <layout:simple-field label="Фактический адрес" class="full" required="0">
                                <layout:edit type="TEXTAREA" name="org_template__address_post" value="//TEST_VALUEADDRESS_POST" xmlTag=":name:" readonly="1"/>
                            </layout:simple-field>
                            <layout:simple-field label="ИНН" class="small some_inline" required="0">
                                <layout:edit type="TEXT" value="//TEST_VALUE" name="org_template__inn" xmlTag=":name:" readonly="1"/>
                                <label>КПП</label>
                                <layout:edit type="TEXT" value="//TEST_VALUE" name="org_template__kpp" xmlTag=":name:" readonly="1"/>
                            </layout:simple-field>
                            <layout:simple-field label="ОГРН" class="small some_inline" required="0">
                                <layout:edit type="TEXT" value="//TEST_VALUE" name="org_template__ogrn_number" xmlTag=":name:" readonly="1"/>
                            </layout:simple-field>
                            <layout:simple-field label="ОКПО" class="small some_inline" required="0">
                                <layout:edit type="TEXT" value="//TEST_VALUE" name="org_template__okpo" xmlTag=":name:" readonly="1"/>
                            </layout:simple-field>
                            <layout:simple-field label="Телефон, факс" class="small some_inline mask_phone" required="0">
                                <layout:edit type="TEXT" value="//TEST_VALUE" name="org_template__phone" xmlTag=":name:" readonly="1"/>
                            </layout:simple-field>
                            <layout:simple-field label="Электронная почта" class="medium mask_email" required="0">
                                <layout:edit type="EMAIL" value="//TEST_VALUE" name="org_template__email" xmlTag=":name:" readonly="1"/>
                            </layout:simple-field>

                            <h3 class="header line"><span>Банковские реквизиты</span></h3>
                                <layout:simple-field label="Наименование реквизитов" class="full" required="0">

                                    <select class="bank_select" name="declarer_con_bank_account_select_name" xmlTag=":name:">
                                        <option value="">Не выбрано</option>
                                        <xsl:for-each select="//DEFAULT_LIST//ROW">
                                            <option value="{ID}"><xsl:value-of select="NAME"/></option>
                                        </xsl:for-each>
                                    </select>
                                </layout:simple-field>
                                <div class="bank_show">
                                    <layout:iterator select="//DEFAULT_LIST//ROW">
                                        <div id="" class="bankShowTemplate">
                                            <layout:hidden name="id" value="ID"/>
                                            <layout:simple-field label="Отделение банка" class="medium" required="0">
                                                <layout:edit type="TEXTAREA" value="BANK_NAME" name="org_template__bank_name" xmlTag=":name:" readonly="1"/>
                                            </layout:simple-field>
                                            <layout:simple-field label="Адрес банка" class="medium" required="0">
                                                <layout:edit type="TEXTAREA" value="BANK_ADDRESS" name="org_template__bank_address" xmlTag=":name:" readonly="1"/>
                                            </layout:simple-field>
                                            <layout:simple-field label="БИК" class="small number_9" required="0">
                                                <layout:edit type="TEXT" value="BANK_BIC" name="org_template__bank_bik" xmlTag=":name:" readonly="1"/>
                                            </layout:simple-field>
                                            <layout:simple-field label="Расчётный счет" class="medium" required="0">
                                                <layout:edit type="TEXT" value="ACCOUNT_SET" name="org_template__bank_account_set" xmlTag=":name:" readonly="1"/>
                                            </layout:simple-field>
                                            <layout:simple-field label="Корреспондентский счет" class="medium" required="0">
                                                 <layout:edit type="TEXT" value="ACCOUNT_COR" name="org_template__bank_account_cor" xmlTag=":name:" readonly="1"/>
                                            </layout:simple-field>
                                        </div>
                                    </layout:iterator>
                                </div>

                            <h3 class="header line"><span>Представитель</span></h3>

                                <layout:simple-field label="ФИО" class="medium" required="0">
                                     <select class="pers_select"  name="declarer_con_person_select_name" xmlTag=":name:">
                                        <option value="">Не выбрано</option>
                                        <xsl:for-each select="//DEFAULT_LIST//ROW">
                                            <option value="{PERS_ID}"><xsl:value-of select="PERS_NAME"/></option>
                                        </xsl:for-each>
                                    </select>
                                </layout:simple-field>
                                <div class="pers_show">
                                    <layout:iterator select="//DEFAULT_LIST//ROW">
                                        <div id="" class="persShowTemplate">
                                            <layout:hidden name="id" value="PERS_ID"/>
                                            <layout:simple-field label="Должность" class="full" required="0">
                                                <layout:edit type="TEXT" value="PERS_POST" name="org_template__post" xmlTag=":name:" readonly="1"/>
                                            </layout:simple-field>
                                            <layout:simple-field label="Тип документа" class="medium" required="0">
                                                <layout:edit type="TEXT" name="org_template_req_expert_member__nsi_person_document" value="PERS_NSI_PERSON_DOCUMENT" xmlTag=":name:" readonly="1"/>
                                            </layout:simple-field>
                                            <layout:simple-field label="Серия и номер" class="small" required="0">
                                                <layout:edit type="TEXT" value="PERS_DOC_SERIAL" name="org_template__doc_serial" xmlTag=":name:" readonly="1"/>
                                                <label>  </label>
                                                <layout:edit type="TEXT" value="PERS_DOC_NUMBER" name="org_template__doc_number" xmlTag=":name:" readonly="1"/>
                                            </layout:simple-field>
                                            <layout:simple-field label="Когда выдан" class="medium" required="0">
                                                <layout:edit type="DATE" name="org_template__doc_reg_date" value="PERS_DOC_DATE" xmlTag=":name:" readonly="1"/>
                                            </layout:simple-field>
                                            <layout:simple-field label="Кем выдан" class="full" required="0">
                                                <layout:edit type="TEXT" value="PERS_DOC_ORGAN" name="org_template__doc_reg_organ" xmlTag=":name:" readonly="1"/>
                                            </layout:simple-field>
                                            <layout:simple-field label="Телефон" class="small some_inline mask_phone" required="0">
                                                <layout:edit type="TEXT" value="PERS_PHONE" name="org_template__phone" xmlTag=":name:" readonly="1"/>
                                            </layout:simple-field>
                                            <layout:simple-field label="Электронная почта" class="medium mask_email" required="0">
                                                <layout:edit type="EMAIL" value="PERS_EMAIL" name="org_template__email" xmlTag=":name:" readonly="1"/>
                                            </layout:simple-field>
                                        </div>
                                    </layout:iterator>
                                </div>

                        </div>
                </layout:form>
            </div>
        </div>


    </xsl:variable>
    {B{FRM$XML_LAYOUT$V0.1}E}
    <xsl:template match="/">
        <xsl:call-template name="pageBuilder">
            <xsl:with-param name="customStyles">
              <xsl:copy-of select="$STYLES"/>
            </xsl:with-param>
            <xsl:with-param name="data" select="$DATA"/>
            <xsl:with-param name="layout" select="$LAYOUT"/>
        </xsl:call-template>
        <script src="/static/JQueryPlugins/jquery.maskedinput-1.2.2.js"></script>
        <script>
{B{FRM$XML_LAYOUT$V0.1-VALIDATE_SCRIPT}E}
    <![CDATA[

        function makeFileXmlTag(obj){
            obj = (obj)?obj:$('form');
            obj.find('.fileButton input[type="file"]')
                .closest('.fileButton')
                .siblings('.attachmentsTableWrapper')
                .find('.attachmentFileRow')
                .each(function(indx, elm){
                    var fileIdInputName = 'con_contract_document__file_id';
                    $(elm).find('.file_input_js input[name="'+fileIdInputName+'"]').remove();
                    var fileIdInput = $(elm).find('.file_input_js input[name="'+fileIdInputName+'"]');
                    if (fileIdInput.length==0){
                        $(elm).find('.file_input_js').append('<input type="hidden" name="'+fileIdInputName+'"/>');
                    }
                    fileIdInput = $(elm).find('.file_input_js input[name="'+fileIdInputName+'"]');
                    fileIdInput.val($(elm).attr('id'));
                    fileIdInput.attr('xftag', fileIdInputName);
                });
            console.log('makeFileXmlTag called');
        }

        function initCheckboxes(){
          $('.processed_checkboxes').each(function(indx, elm){
            $(elm).find('input[value="1"]').each(function(indx2, elm2){
              var checkName = $(elm2).attr('name');
              var inputToChange = $(elm2).parents('.processed_checkboxes').siblings('.related_checkboxes').find('[value="'+checkName+'"]');
              inputToChange.attr('checked', true);
              inputToChange.siblings('.overTrop').addClass('checked');
            });
          });
        }
        function make_chkbox_moving(chkbox_name, data, placement){
            $('[name="'+chkbox_name+'"]').click(function(){
                if ($(this).next('span.overTrop').hasClass('checked')) {
                    if ($('#'+data).text().length > 1) {
                        $('#'+placement).append($('#'+data+'>div'));
                    }
                } else {
                    if ($('#'+placement).text().length > 1) {
                        $('#'+data).append($('#'+placement+'>div'));
                    }
                }
            });
            $('[name="'+chkbox_name+'"]').click();


        }
        function number_mask(obj, field_length){
            obj.keyup(function(eventObject){
            $(this).val($(this).val().replace(/(\D+)/g, ''));
            if ($(this).val().length>field_length) {$(this).val($(this).val().slice(0, field_length))}

        });
        }

    function all_masks(){
        number_mask($('.number_9 input[type="text"]'), 9);
        number_mask($('.number_24 input[type="text"]'), 24);
        $('.mask_phone input[type="text"]:not(.maskApplied)').mask("+7(999) 999-99-99").addClass('maskApplied');
        $('.sectionTemplate .mask_phone input[type="text"]').removeClass('maskApplied');

        $('.money input[type="text"]').keyup(function(eventObject){
                $(this).val($(this).val().replace(/(\D+)/g, ''));
              });
        }


        function makeSelectValue($lead, $leadSection){
            var $leadSectionToken = $leadSection.parents('.cell_content').find('.tokenInput');
            var $leadSelect = $lead.parents('.cell_content').find('select');
            if($leadSection.val() == $leadSectionToken.attr('data-old-value')){
                $leadSelect.find('[value='+$lead.val()+']').attr('selected', true);
                $leadSelect.change();
            }
        }


        function stepToStep(stepNum){
            var this_step = $('.frmAppeal_steps li').eq(stepNum);
            $('[name="currentStep"]').val(stepNum+1);
            $('.steps').hide();
            $('#'+this_step.attr('data-content-block')).show();
            $('.frmAppeal_steps__current').removeClass('frmAppeal_steps__current');
            this_step.addClass('frmAppeal_steps__current');
            current_step = this_step.attr('data-step-number')-0;
            makeSelectValue($('[name="expert_member_lead"]'), $('[name="expert_member_lead_section"]'));
            makeSelectValue($('[name="expert_member_finance"]'), $('[name="expert_member_finance_section"]'));
            if (current_step==0){
                var memberLead = $('[name="expert_member_lead"]');
                memberLead.siblings('.customSelect').find('select option[value="'+memberLead.val()+'"]').attr('selected', true);
                memberLead.siblings('.customSelect').find('select ').change();

                var memberFin = $('[name="expert_member_finance"]');
                memberFin.siblings('.customSelect').find('select option[value="'+memberFin.val()+'"]').attr('selected', true);
                memberFin.siblings('.customSelect').find('select ').change();
            }
        }
        function saveForm(form){
            /* создание xml строки */
            var xmlAsString = '';
            try{
                xmlAsString = xf_generateXML(thisFormId);
            }catch(e){
                alert('Ошибка ' + e.name + ":" + e.message + "\n" + e.stack); //
            }
            console.log(xmlAsString);
            $('#'+thisFormId+'_XML').val(xmlAsString);

            var $this = form;
            $.ajax({
                url: $this.attr('action'),
                type : 'POST',
                data: $this.serialize()
            })
            .success(function(data){
                console.log('Got Answer!');
                console.log(data);
                $.ajax({
                    url: '/customactions/loaderCreateBaseVersion.action',
                    type: 'POST',
                    data: {
                        requestId: data.data
                    }
                }).success(function(data2){
                    console.log('Got 2nd Answer!');
                    console.log(data2);
                    var newLocation = {};
                    newLocation.pathname = '/portal/getCardHtml.action';
                    newLocation.search = '?cardId=WIN$LOADER&documentId='+data2.data;
                    window.location.href = window.location.host+newLocation.pathname+newLocation.search;
                })
            })
            .error();
        }
        function addFieldsActivate(){
            $('.addNewOrg:not(.processed)').each(function(indx, elm){
                if (!$(elm).parents('.sectionTemplate').length){
                    $(elm).addClass('processed');
                    var linkedBlock = $(elm).parents('.fields_selector').siblings('.full_fields_list');
                    linkedBlock.attr('data-linked-block', fieldActivateIteration.toString()+indx);
                    if ($('form+.hide').length<1){
                        $('form').after('<div class="hide"/>');
                    }
                    $('form+.hide').append(linkedBlock);
                    $(elm).attr('data-linked-block', fieldActivateIteration.toString()+indx);
                }

            })
            .click(function(){
                if (!$(this).hasClass('readOnly')){
                    var linkedBlock = $('.full_fields_list[data-linked-block="'+$(this).attr('data-linked-block')+'"]');
                    if ($(this).hasClass('pressed')){
                        $(this).removeClass('pressed');
                        $('form+.hide').append(linkedBlock);
                    }else{
                        $(this).addClass('pressed');
                        $(this).parents('.fields_selector').after(linkedBlock);
                        if ($(this).siblings('._token_input_wrapper').length){
                            $(this).siblings('._token_input_wrapper').find('.tokenInput').data('tokenInputSettings').deleteAlways = true;
                            $(this).siblings('._token_input_wrapper').find('.tokenInput').tokenInput('clear', false);
                        } else {
                            $(this).siblings('.customSelect').find('option:selected').attr('selected', false);
                            $(this).siblings('.customSelect').find('select').change();
                        }
                    }
                }
            });
            fieldActivateIteration++;
        }
        var fieldActivateIteration = 0;
        var current_step = 0;
        var max_steps = 0;
        var thisForm = $('form').eq(0);
        var thisFormId = thisForm.attr('id');

        function postAddToken(t, item) {
            /* Связь мультиселекта с комбобоксом */
            var linkToControl='';
            var urlObj = {
                    action: '/components/multiselect.action?',
                    parameters: {
                        identifier:'nsi_exp_person',
                        parameters:item.objectId,
                        paramnames:'EXP_DEPARTMENT',
                        term:''
                    }
                };
            var urlLinkParams = [];
            for (key in urlObj.parameters){
                urlLinkParams.push(key+'='+urlObj.parameters[key]);
            }
            var urlLink = urlObj.action+urlLinkParams.join('&');
            for (key in t.context.attributes){
                if (t.context.attributes[key]['name']=='data-name'){
                    linkToControl = t.context.attributes[key]['value'];
                }
            }
            console.log(t);
            console.log(urlLink);
             if (t.parents('.row').find('select').length){
                console.log('GOT related select');
                console.log(t.parents('.row').find('select'));
                t.parents('.row').find('select').customSelectRefresh({url: urlLink});
            }
            /* --конец Связь мультиселекта с комбобоксом */

            if (item.extraFields){
                var unitValue = (item.extraFields.units)?item.extraFields.units:false;
                var unitListNumber = (item.extraFields.snum)?item.extraFields.snum:false;
                if (unitValue){
                    t.parents('.cellWrapTable').next('.cellWrapTable').find('input[type="text"]').val(unitValue);
                    t.parents('.tep').find('.tep_measure input').val(unitValue);
                } else {
                    t.parents('.tep').find('.tep_measure input').val('');
                }
                if (unitListNumber){
                    t.parents('.cellWrapTable').prev('.cellWrapTable').find('input[type="text"]').val(unitListNumber);
                    t.parents('.tep').find('.tep_left input').val(unitListNumber);
                } else {
                    t.parents('.tep').find('.tep_left input').val('');
                }
            } else {
                t.parents('.tep').find('.tep_measure input').val('');
                t.parents('.tep').find('.tep_left input').val('');
            }

            if (t.attr('data-name') == 'req_link_FK_req_request_link' || t.attr('data-name') == 'req_request__fk_req_request_previous'){
                $.ajax({
                    url: '/components/multiselect.action',
                    data: {
                        identifier: 'service_type_by_request',
                        paramnames: 'REQUEST_ID',
                        parameters: item.objectId
                    }
                }).success(function(data){
                    console.log(data.valueString);
                    t.parents('.line').find('[name="req_request_previous_nsi_service_type"]').val(data[0].valueString);
                    t.parents('.rowWrapTable').find('[name="req_link_nsi_service_type"]').val(data[0].valueString);
                });
            }


        }
        function makeSelectKladr(){
            /* Работа с КЛАДР */
            $('.kladr .tokenInput').on('change', function(){

                if($(this).tokenInput('get')){
                    var objectId = $(this).tokenInput('get')[0].id;
                    $(this).parents('.line').nextAll('.line').find('.tokenInput').each(function(indx, elm){
                        $(elm).tokenInput('clear', false);
                        var parametersArr = $(elm).attr('data-parameters').split('__');
                        parametersArr[1] = objectId;
                        var paramNameaArr = $(elm).data('tokenInputSettings').paramNames.split('__');
                        $(elm).tokenInput('setParam', {paramNames: [paramNameaArr[0], paramNameaArr[1]], parameters: parametersArr})
                    })
                }
            })
            /* endof Работа с КЛАДР */
        }
        function makeAdressLine(){
            var resultAdressLine = [];
            $('.kladr .tokenInput').each(function(indx, elm){
                if ($(elm).tokenInput('get').length){
                    resultAdressLine.push($(elm).tokenInput('get')[0].searchString);
                }
            });
            ($('[name="req_request__house"]').val().length)?resultAdressLine.push('д.'+ $('[name="req_request__house"]').val()):'';
            ($('[name="req_request__ownership"]').val().length)?resultAdressLine.push('вл.'+ $('[name="req_request__ownership"]').val()):'';
            ($('[name="req_request__housing"]').val().length)?resultAdressLine.push('корп.'+ $('[name="req_request__housing"]').val()):'';
            ($('[name="req_request__building"]').val().length)?resultAdressLine.push('стр.'+ $('[name="req_request__building"]').val()):'';
            ($('[name="req_request_address_more"]').val().length)?resultAdressLine.push($('[name="req_request_address_more"]').val()):'';

            $('[name="req_request_combo_address"]').val(resultAdressLine.join(', '));
        }
        function roleShower(){
            $(document).on('change', '.role_selector select', function(){
                var thisValue = $(this).find(':selected').val(),
                    relatedBlock = $(this).closest('.member').find('.project_org');

                if (thisValue=='GEN' || thisValue=='RESEARCH' || thisValue=='SUB'){
                    relatedBlock.show();
                }
                else{
                    relatedBlock.hide();
                }
            });
            $('.role_selector select').change();
        }
        function getOrgDataAndShow($this){
            var orgId = $this.val();
            $.ajax({
                url: '/customactions/getOrganizationInfo.action',
                data: {
                    contractorId: orgId
                }
            })
            .success(function(data){
                var $relOrgData = $this.parents('.line').siblings('.this_org_data');

                var contractor = data.data.contractor;
                var personList = data.data.personList;
                var bankAccountList = data.data.bankAccountList;

                if (contractor && !!personList.length){

                    $relOrgData.html($('.hide .empty_org_template').clone());

                    /* обработка нажатости кнопки */
                    var $relAddOrgButt = $this.parents('.line').find('.addNewOrg');
                    if ($relAddOrgButt.hasClass('pressed')){
                        $relAddOrgButt.click();
                    }
                    /* конец обработки нажатости кнопки */


                    var $persShow = $relOrgData.find('.pers_show');
                    var $persShowTemplate = $persShow.find('>div').clone();
                    $persShow.html('');
                    var personListActive='';

                    personList.forEach(function(item, i, arr){
                        item.text = item.name.replace(/(\\)/g, '');
                        var $thisPersShow = $persShowTemplate.clone();
                        $thisPersShow.attr('id', item.id);
                        $thisPersShow.find('[name="id"]').val(item.id);
                        $thisPersShow.find('[name="org_template__post"]').val(item.post);
                        $thisPersShow.find('[name="org_template_req_expert_member__nsi_person_document"]').val(item.nsiPersonDocument);
                        $thisPersShow.find('[name="org_template__doc_serial"]').val(item.docSerial);
                        $thisPersShow.find('[name="org_template__doc_number"]').val(item.docNumber);
                        $thisPersShow.find('[name="org_template__doc_reg_date"]').val(item.docDate);
                        $thisPersShow.find('[name="org_template__doc_reg_organ"]').val(item.docOrgan);
                        $thisPersShow.find('[name="org_template__phone"]').val(item.phone);
                        $thisPersShow.find('[name="org_template__email"]').val(item.email.replace(/(\/)/g, '.'));
                        if (!!item.isActive){
                            personListActive = item.id;
                        }
                        $('form+.hide').append($thisPersShow);

                    });


                    var $persSelect = $relOrgData.find('select.pers_select');
                    $persSelect.customSelectRefresh({json: personList});
                    $persSelect.find('[selected="selected"]').removeAttr('selected');
                    $persSelect.find('[value="'+personListActive+'"]').attr('selected', true);
                    $persSelect.change()

                    var $bankShow = $relOrgData.find('.bank_show');
                    var $bankShowTemplate = $bankShow.find('>div').clone();
                    $bankShow.html('');
                    var bankAccountListActive='';
                    bankAccountList.forEach(function(item, i, arr){
                        item.text = item.name.replace(/(\\)/g, '');
                        var $thisbankShow = $bankShowTemplate.clone();
                        $thisbankShow.attr('id', item.id);
                        $thisbankShow.find('[name="org_template__bank_name"]').val(item.bankName.replace(/(\\)/g, ''));
                        $thisbankShow.find('[name="org_template__bank_address"]').val(item.bankAddress);
                        $thisbankShow.find('[name="org_template__bank_bik"]').val(item.bankBic);
                        $thisbankShow.find('[name="org_template__bank_account_set"]').val(item.accountSet);
                        $thisbankShow.find('[name="org_template__bank_account_cor"]').val(item.accountCor);
                        if (!!item.isActive){
                            bankAccountListActive = item.id;
                        }
                        $('form+.hide').append($thisbankShow);
                    });
                    var $bankSelect = $relOrgData.find('select.bank_select');
                    $bankSelect.customSelectRefresh({json: bankAccountList});
                    $bankSelect.find('[selected="selected"]').removeAttr('selected');
                    $bankSelect.find('[value="'+bankAccountListActive+'"]').attr('selected', true);
                    $bankSelect.change()


                    $relOrgData.find('[name="org_template__nsi_company_form"]').val(contractor.nsi_company_form);
                    $relOrgData.find('[name="org_template__full_name"]').val(contractor.full_name.replace(/(\\)/g, ''));
                    $relOrgData.find('[name="org_template_con_contractor__name"]').val(contractor.name.replace(/(\\)/g, ''));
                    $relOrgData.find('[name="org_template__address_legal"]').val(contractor.address_legal);
                    $relOrgData.find('[name="org_template__address_post"]').val(contractor.address_post);
                    $relOrgData.find('[name="org_template__inn"]').val(contractor.inn);
                    $relOrgData.find('[name="org_template__kpp"]').val(contractor.kpp);
                    $relOrgData.find('[name="org_template__ogrn_number"]').val(contractor.ogrn_number);
                    $relOrgData.find('[name="org_template__okpo"]').val(contractor.okpo);
                    $relOrgData.find('[name="org_template__phone"]').val(contractor.phone);
                    $relOrgData.find('[name="org_template__email"]').val(contractor.email.replace(/(\/)/g, '.'));

                } else {
                    $relOrgData.html('');
                }

            });
        }

        $(function(){
            /* KLADR Action */
            makeSelectKladr();
            $('[name="member_con_contractor_select__name"]').change();

            $(document).on('click', '.sectionBtnAdd, .sectionBtnDelete', function(){
                $('[name="member_con_contractor_select__name"]').change();
            });

            $('.kladr input, .kladr textarea').change(function(){
              makeAdressLine();
            });
            /* endof KLADR Action */

            var emptyOption = $('<option/>');
            emptyOption.text('Не выбрано');
            emptyOption.val('');
            $('select').each(function(indx, elm){
                if (!!$(elm).find('option').eq(0).val()){
                     $(elm).prepend(emptyOption.clone());
                }
            });

            if (!!+$('[name="disableAll"]').val()){
                $('#step4 .sectionBtnAdd').hide();
                $('#step2 .addNewOrg').hide();
            }
            if (!!+$('[name="disableNotNew"]').val()){
                $('#step5 .sectionBtnAdd, #step6 .sectionBtnAdd').hide();
            }

            $(document).on('change', '[data-name="obj_parameter__nsi_object_params"]', function(){
                var activeTokenObj = $(this);
                var tiValuesArr = [];
                activeTokenObj.tokenInput('get').forEach(function(item, i, arr){
                    tiValuesArr.push('values='+item.id);
                });
                var tiUrl = tiValuesArr.join('&');
                $.ajax({
                    url: '/components/multiselectElements.action',
                    data: 'identifier=nsi_object_param&'+tiUrl,
                }).success(function(data){
                    var trueResult = [];
                    data.forEach(function(item, i, arr){
                        if (item.extraFields.object_leaf=='0'){
                            trueResult.push(item);
                        }
                    });
                    var thisSection = activeTokenObj.parents('.section');
                    trueResult.forEach(function(item, i, arr){
                        var thisToken = {};
                        if (i==0){
                            thisToken = thisSection.find('input.tokenInput');
                        } else {
                            thisSection.siblings('.sectionBtnAdd').click();
                            thisToken = thisSection.siblings('.section').last().find('input.tokenInput');
                        }
                        thisToken.data('tokenInputSettings').deleteAlways=true;
                        thisToken.tokenInput('setValues', item.objectId);
                    });
                });
            });

            $('form+.hide').append($('.empty_org_template'));

            $(document).on('change', 'select.pers_select', function(){
                console.log($(this).val());
                $('.pers_show').html($('#'+$(this).val()).clone());
            });
            $(document).on('change', 'select.bank_select', function(){
                console.log($(this).val());
                $('.bank_show').html($('#'+$(this).val()).clone());
            });

            $(document).on('change', '[name="declarer_con_contractor_select__name"], [name="member_con_contractor_select__name"]', function(){
                getOrgDataAndShow($(this));
            });

            $('.registryRequest').click(function(){
                $this = $(this);
                if (!$this.hasClass('readOnly') && !$this.hasClass('clicked')){

                    saveFormUniversal(thisForm,
                            {success: function(data){
                                    console.log(data);
                                    $this.siblings('input:not(.date)').val(data.data.registryNumber);
                                    $this.siblings('input.date').val(data.data.registryDate);
                                    $('[name="req_request__user_info_text"]').val(data.data.registryUser);
                                    $('[name="req_request__user_info"]').val(data.data.registryUserId);
                                    $('[name="req_request__nsi_request_status"]').val('REQ_REGISTERED');
                                    $this.addClass('clicked');
                                    saveFormUniversal(thisForm, false, {success: function(){}}, '/customactions/openTaskCheckPdBtn.action');
                            }},
                    {success: function(){}}, '/customactions/registryRequest.action');
                }
            });

            $('input, textarea, select').each(function(indx, elm){
                if ($(elm).attr('readonly') || !!+$(elm).attr('data-readonly')){
                    $(elm).addClass('readOnly');
                    $(elm).parents('.customSelect').addClass('readOnly');
                    $(elm).parents('._token_input_wrapper').addClass('readOnly');
                    if ($(elm).siblings('.form_button ').length){
                        $(elm).siblings('.form_button ').addClass('readOnly');
                    }
                }
            });

            $('.fileList[readonly="1"]').each(function(indx, elm){
                $(elm).find('.fileButton:not(.disabled)').addClass('disabled');
            });

            $(document).on('click', '.sectionBtnAdd, .sectionBtnDelete', function(){
                $('input, textarea, select').each(function(indx, elm){
                    if ($(elm).attr('readonly')){
                        $(elm).addClass('readOnly');
                        $(elm).parents('.customSelect').addClass('readOnly');
                        $(elm).parents('._token_input_wrapper').addClass('readOnly');
                        if ($(elm).siblings('.form_button ').length){
                            $(elm).siblings('.form_button ').addClass('readOnly');
                        }
                    }
                });

                $('.fileList[readonly="1"]').each(function(indx, elm){
                    $(elm).find('.fileButton:not(.disabled)').addClass('disabled');
                });
            });

             $('.fileProc').click(function(){
                makeFileXmlTag();
            });
            all_masks();
            addFieldsActivate();

            setTimeout(initCheckboxes, 200);
            make_chkbox_moving('buyer_checkbox', 'buyer', 'buyer_placement');
            make_chkbox_moving('reciever_checkbox', 'reciever', 'reciever_placement');
            $('.frmAppeal_steps li').each(function(indx, elm){
                $(elm).attr('data-step-number', indx);
                max_steps = indx;
            });
            $('form .line').click(function(){
                makeFileXmlTag();
            });
            stepToStep(0);
            $(document).on('click', '.frmAppeal_steps li', function(){
                /*saveFormUniversal(thisForm, false, {success: function(){}});*/
                if (step_validate($('#step'+(current_step+1))).result){
                    $('[data-content-block="'+'#step'+(current_step+1)+'"]').removeClass('frmAppeal_steps__error');
                }
                stepToStep($(this).attr('data-step-number')-0);
                console.log($(this).attr('data-step-number')-0);
            });

            $(document).on('click', '.steps', function(){
                var thisStepId = $(this).attr('id');
                if (!$(this).find('.redField').length){
                    $('[data-content-block="'+thisStepId+'"]').removeClass('frmAppeal_steps__error');
                }
                if(!thisForm.find('.redField').length){
                    $('.notValidate').removeClass('notValidate');
                }
            });
            $('.closeButton').click(function(){
                window.close();
            });
            $('.saveCloseButton').click(function(){
                saveFormUniversal(thisForm, {success: function(){window.close();}});
            });
            $('.saveButton').click(function(){
                $('.file_input_js input').each(function(indx, elm){
                    if (!$(elm).attr('xftag')){
                        $(elm).attr('xftag', ':name:')
                    }

                });
                saveFormUniversal(thisForm);
            });
            $('.nextButton').click(function(){
                makeAdressLine();
                $('.file_input_js input').each(function(indx, elm){
                    if (!$(elm).attr('xftag')){
                        $(elm).attr('xftag', ':name:')
                    }

                });
                if (current_step<=max_steps){
                    makeFileXmlTag($('#step'+(current_step+1)));
                    if (current_step!=max_steps){
                        stepToStep(current_step+1);
                    } else {
                        var validateArr = [];
                        $('.steps').each(function(indx, elm){
                            var validate = step_validate($(elm)).result;
                            validateArr.push(validate);
                            if (!validate){
                                $('.frmAppeal_steps [data-content-block="'+$(elm).attr('id')+'"]').addClass('frmAppeal_steps__error');
                            } else {
                                $('.frmAppeal_steps [data-content-block="'+$(elm).attr('id')+'"]').addClass('frmAppeal_steps__checked');
                            }
                        });
                        if (!(validateArr.indexOf(false)+1) && !$(this).hasClass('notValidate')){
                            saveFormUniversal(thisForm, {success: callFileLoader});
                        }else{
                            $(this).addClass('notValidate');
                        }
                    }
                }
            });
            $('.prevButton').click(function(){
                if (current_step!=0){
                    $('.frmAppeal_steps li').eq(current_step-1).click();
                }
            });

            $(document).on('change', '[name="con_contractor_declarant_nsi_company_form"]', function(){
                    if ($(this).val()=='ur'){
                        $('.fiz').hide();
                        if ($('.fiz .addNewOrg').hasClass('pressed')){
                            $('.fiz .addNewOrg').click();
                        }
                        $('.ur').show();
                    }else{
                        $('.ur').hide();
                        if ($('.ur .addNewOrg').hasClass('pressed')){
                            $('.ur .addNewOrg').click();
                        }
                        $('.fiz').show();
                    }
            });


            if ($('[name="con_contractor_declarant_nsi_company_form"]').val()=='ur'){
                $('.fiz').hide();
                if ($('.fiz .addNewOrg').hasClass('pressed')){
                    $('.fiz .addNewOrg').click();
                }
                $('.ur').show();
            }else{
                $('.ur').hide();
                if ($('.ur .addNewOrg').hasClass('pressed')){
                    $('.ur .addNewOrg').click();
                }
                $('.fiz').show();
            }
            $('.simpleTable .theadAFT').each(function(indx, elm){
                $(elm).parent('.wrapTable').append($(elm));
                $(elm).prepend($('<div class="cellWrapTable"></div><div class="cellWrapTable"></div>'));
            });
            $('.simpleTable .wrapTable').removeClass('line');
            $('.simpleTable.wrapTable .sectionBtnAdd ').click(function(){
                var parentTable = $(this).parents('.wrapTable');
                parentTable.append(parentTable.find('.theadAFT'));
            });
            $('form a').last().remove();
            $('form br').last().remove();
            $('.hideAndShow').click(function(){
                if ($(this).hasClass('open')){
                    $(this).removeClass('open');
                    $(this).siblings('.hideAndShow_content').hide();
                }else{
                    $(this).addClass('open');
                    $(this).siblings('.hideAndShow_content').show();
                }
            });
            $('.hideAndShow.open').click();
            $('.expShower input[type="checkbox"]').click(function(){
                if ($(this).siblings('.overTrop').hasClass('checked') && $(this).parents('.line.checkBox').siblings('.hideAndShow').hasClass('open') || !$(this).siblings('.overTrop').hasClass('checked') && !$(this).parents('.line.checkBox').siblings('.hideAndShow').hasClass('open')){
                    $(this).parents('.line.checkBox').siblings('.hideAndShow').click();
                }
            });
            $('.expShower input[type="checkbox"]:checked').parents('.line.checkBox').siblings('.hideAndShow').click();
            $('.radioGroup input[type="radio"]').click(function(){
                if( $(this).val() == '0'){
                    $(this).closest('.radioGroup').siblings('.before_appeal').show();
                }else{
                    $(this).closest('.radioGroup').siblings('.before_appeal').hide();
                }
            });
            $('.radioGroup input[type="radio"]:checked').click();
            $('.noinner_line').find('.line').each(function(indx, elm){
                $(elm).removeClass('line');
            });

        });
        ]]>
    </script>
    <xml style="display: none">
      <xsl:copy-of select="$DATA"/>
    </xml>
    </xsl:template>
</xsl:stylesheet>

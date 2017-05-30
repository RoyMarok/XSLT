<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:layout="URN:html-form-layout:v0.1" xmlns="http://www.w3.org/1999/xhtml" xmlns:ex2="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLTExtension" xmlns:ctx="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLDataContext" xmlns:gbu="http://xmlns.oracle.com/MSG_GBU_doc">
    <xsl:output method="html" indent="yes" omit-xml-declaration="yes" undeclare-prefixes="yes" exclude-result-prefixes="#all"/>


    <xsl:variable name="DATA">
        <ROOT xmlns="">
            <TEST_VALUE>Value</TEST_VALUE>
            <AVANS_VALUE>100</AVANS_VALUE>
            <MY_MULTISELECT_VALUE>galactica_admin1</MY_MULTISELECT_VALUE>
            <MY_LIST_VALUE>id1</MY_LIST_VALUE>
            <!--MY_LIST>
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

                <ROWSET>
                    <ROW>
                        <LIST>
                            <ROW>
                                <ID>id1</ID>
                                <NAME>name1</NAME>
                            </ROW>
                            <ROW>
                                <ID>id2</ID>
                                <NAME>name2</NAME>
                            </ROW>
                        </LIST>
                        <LIST_VALUE>id1</LIST_VALUE>
                        <TABLE_VALUE>id1</TABLE_VALUE>
                    </ROW>

                </ROWSET>

            </TABLE>-->

            <PARENT_REQUEST_ID>
              <xsl:choose>
                <xsl:when test="//DOGOVOR_HEAD//REQUEST_ID!=''"><xsl:value-of select="//DOGOVOR_HEAD//REQUEST_ID"/></xsl:when>
                <xsl:otherwise><xsl:value-of select="//SESSION_TEMP_PARAMETER//ROW[NAME='requestId']/VALUE"/></xsl:otherwise>
              </xsl:choose>
            </PARENT_REQUEST_ID>
            <CONTRACT_DOCUMENT_WF>
                <ROW_SET>
                    <xsl:for-each select="//CONTRACT_DOCUMENT/ROW_SET/ROW">
                        <ROW>
                            <xsl:copy-of select="*"/>
                            <xsl:variable name="fileId" select="FILE_ID"/>
                            <FILES_CD>
                                <ROW_SET>
                                    <xsl:copy-of select="//FILES_D/ROW_SET/ROW[FOLDER=$fileId]"/>
                                </ROW_SET>
                            </FILES_CD>
                        </ROW>
                    </xsl:for-each>
                </ROW_SET>
            </CONTRACT_DOCUMENT_WF>
            <DOGOVOR_STATUS_CALC>
                <xsl:choose>
                    <xsl:when test="//CONTRACT_STATUS_ID">
                        <xsl:copy-of select="//CONTRACT_STATUS_ID"/>
                    </xsl:when>
                    <xsl:otherwise>PROJECT</xsl:otherwise>
                </xsl:choose>
            </DOGOVOR_STATUS_CALC>
            <APPROVED_LIST>
                <xsl:choose>
                    <xsl:when test="count(//CON_CONTRACT_APPROVEMENT//ROW) &gt; 0">
                        <xsl:copy-of select="//CON_CONTRACT_APPROVEMENT/*"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:copy-of select="//CON_CONTRACT_APPROVEMENT_DEFAULT/*"/>
                    </xsl:otherwise>
                </xsl:choose>
            </APPROVED_LIST>
            <COMBINED_FILE_LINE>
                    <xsl:value-of select="string-join(//FILES//FILE_COMBO_LINE, '||')"/>
            </COMBINED_FILE_LINE>
            <IS_ANY_SIGNED>
                <xsl:choose>
                    <xsl:when test="count(//FILES//ROW[FILE_ECP=1]) &gt; 0">1</xsl:when>
                    <xsl:otherwise>0</xsl:otherwise>
                </xsl:choose>
            </IS_ANY_SIGNED>
            <FILE_COUNT><xsl:value-of select="count(//FILES//ROW)"/></FILE_COUNT>
            <DOGOVOR_STATUS><xsl:value-of select="upper-case(//DOGOVOR_HEAD//CONTRACT_STATUS_ID)"/></DOGOVOR_STATUS>
            <xsl:copy-of select="/"/>
        </ROOT>

    </xsl:variable>
    <xsl:variable name="STYLES">
        <style>
            .hidden{
            display: none;

            }
            h3.header{
            font-weight: bold;
            font-size: 20px;
            }
            .line.info{
            font-style: italic;
            margin-top: 0;
            color: gray;
            }
            .line textarea {
            height: 32px;
            }
            .customSelect .curSelect{
            height: 32px;
            }
            .line input.form_button{
            width: auto;
            padding: 0 10px;
            margin-left: 10px;
            background: #319adc;
            background: #0086bd;
            font-weight: normal;
            font-size: 15px;
            border: 0;
            text-shadow: none;
            line-height: 32px;
            text-align: center;
            color: white;
            cursor: pointer;
            transition: all .3s ease;
            }
            .line input.form_button:first-child{
            margin-left: 0;
            }
            .line input.form_button:hover{
            background: #44b2f7;
            transition: all .3s ease;
            }
            .related_checkboxes{
            margin-top: 10px;
            }
            .related_checkboxes.hidden_box .checkbox-wrap{
            display: none;
            }
            .sectionContainer {
            position: relative;
            }
            .sectionContainer.sectionEmpty {

            }
            .sectionCaption{
            display: none;
            }

            .sectionBtnAdd,
            .sectionBtnDelete {
            display: inline-block;
            width: auto;
            float: none;
            background: none;
            border: none;
            cursor: pointer;
            padding-left: 1.5rem;
            font-size: 1rem;
            outline: none;
            }
            .sectionBtnAdd {
            /* position: absolute;
            bottom: 5px;
            left: 840px;*/
            position: relative;
            margin-right: 0;
            color: #1976D2;
            }
            .sectionBtnAdd:hover {
            color: #0D47A1;
            }
            .sectionContainer.sectionEmpty .sectionBtnAdd {
            /* left: 654px;*/
            }
            .sectionBtnDelete {
            float: none;
            /*margin-left: 250px;*/
            color: #d32f2f;
            position: relative;
            }
            .sectionBtnDelete:hover {
            color: #b71c1c;
            cursor: pointer;
            }
            .sectionBtnAdd:before,
            .sectionBtnDelete:before {

            display: inline-block;
            position: absolute;
            height: 31px;
            left: 0;
            top: -.5rem;
            font-size: 1.9rem;
            }
            .sectionBtnDelete:before{
            content: '\00d7';

            }
            .sectionBtnAdd:before{
            content: '+';
            }
            .wrapTable .sectionBtnAdd:before,
            .wrapTable .sectionBtnDelete:before{
            display: none;
            }
            .wrapTable .sectionBtnDelete,
            .wrapTable .sectionBtnAdd{
            margin: 0;
            padding: 0;
            left: 0;
            }

            .line .customSelect{
            width: 100%;
            }
            .double_line .inputName{
            line-height: 14px;
            }
            .line.double_line.required .inputName strong{
            line-height: inherit;
            }
            .redStar strong{
            color: red;
            display: inline-block;
            font-size: 100%;
            font-weight: normal;
            margin: 0 4px;
            vertical-align: baseline;
            }
            input.form_button{
                width: auto;
                padding: 3px 15px;
                margin-left: 10px;
                background: #319adc;
                background: #0086bd;
                background: white;
                font-weight: normal;
                font-size: 16px;
                border: 0;
                text-shadow: none;
                line-height: 32px;
                text-align: center;
                color: white;
                cursor: pointer;
                transition: all .3s ease;
                color: #333;
                border: 1px solid #D9DBDD;
                vertical-align: top;
            }
            input.form_button:focus{
                box-shadow: none;
            }
            input.form_button.nextButton{
                background-color: #319adc;
                border-color: #319adc;
                color: white;
                margin-left: 0;
                height: 35px;
            }
            input.form_button:hover{
                background-color: #0092ff;
                border-color: #0092ff;
                color: white;
            }

            input.form_button.nextButton.notValidate{
                background-color: #dc3131;
                border-color: #dc3131;

            }
            input.form_button.nextButton.notValidate:hover{
                background-color: #c62d2d;
                border-color: #c62d2d;
            }
            .line.redField .inputWrap&gt;input[type="text"],
            .line.redField .inputWrap .token-input-list,
            .line.redField .inputWrap .customSelect,
            .line.redField .inputWrap .curSelect,
            .line.redField .inputWrap textarea,
            .line.redField .inputWrap .overTrop,
            .line.redField .inputWrap input[type="text"] + img{
                box-shadow: 0 0 0 2px #fb7979;
                border-color: #d23d3d;
            }
             input{
                border-radius: 2px;
            }
            .line.checkbox input.masked[type="checkbox"]{
                margin-left: 0px;
                margin-top: 5px;
                width: 19px;
                height: 18px;
            }

            .line .inputWrap input:read-only,
            .line .inputWrap input:read-only + img,
            .line .inputWrap textarea:read-only{
                background-color: #f7f7f7;
            }
            .line .inputWrap input:read-only:hover,
            .line .inputWrap textarea:read-only:hover,
            .line .inputWrap input:read-only:hover + img{
                border-color: #D9DBDD;
            }
            .line .inputWrap input:read-only:focus,
            .line .inputWrap textarea:read-only:focus,
            .line .inputWrap input:read-only:focus + img{
                box-shadow: none;
            }
            .line.small.date input, .line.small.date select, .line.small.date textarea, .line.small.date .customSelect, .line.small.date .gradWrapper, .line.small.date .fileInputWrapper, .line.small.date .tokenWrapper{
                width: 120px;
            }
            #cboxClose{
                border: none;
                top: 10px;
            }
            span.hide{
                display: none;
            }
            .holiday+img+span.hide{
                display: inline-block;
                color: red;
                font-style: italic;
                margin-left: 10px;
            }
            .fileDesignButton{
                text-align: center;
                /*display: none;*/
                color: #333;
            }
            .fileButton.fileSign{
                display: none;
            }
            .line .inputWrap input.form_button.personSign{
                background: #0086bd;

            }
            .line .inputWrap input.form_button.personSign:hover{
                background-color: #8bc24a;

            }
            .line .inputWrap input.form_button.disable.personSign{
                color: #bdbdbd;
                background-color: #989898;
                cursor: default;
            }
            .hide{
                display: none!important;
            }
        </style>
    </xsl:variable>
    <xsl:variable name="LAYOUT">
        <layout:form action="/customactions/contractSave.action" xmlTag="contract">
            <layout:hidden name="requestId" value="/ROOT/PARENT_REQUEST_ID" xmlTag=":name:"/>
            <layout:hidden name="documentId" value="//DOGOVOR_HEAD//DOGOVOR_ID" xmlTag=":name:"/>
            <layout:hidden name="contractStatusId" value="//DOGOVOR_STATUS_CALC" xmlTag=":name:"/>
            <layout:hidden name="ecpExist" value="//IS_ANY_SIGNED" xmlTag=":name:"/>
            <layout:hidden name="fileCount" value="//FILE_COUNT" xmlTag=":name:"/>
            <layout:header>Договор</layout:header>
            <h3 class="header line">Реквизиты договора</h3>
            <layout:simple-field label="Номер договора" class="small" required="1">
                <layout:edit type="TEXT" name="con_contract__doc_number" xmlTag=":name:" value="//DOGOVOR_HEAD//DOC_NUMBER"/>
                <input type="button" value="№" class="form_button"/>
                <!--input type="button" value="Зарегистрировать договор" class="form_button"/-->
                <label>от</label>
                <layout:edit type="DATE" name="con_contract__doc_date" value="//DOGOVOR_HEAD//DOC_DATE" xmlTag=":name:"/>
            </layout:simple-field>
            <layout:simple-field label="Зарегистрировал договор" class="full" required="0">
                <layout:edit type="TEXT" name="con_contract__user_info" value="//DOGOVOR_HEAD//DOG_REGISTRATOR" xmlTag=":name:" readonly="1"/>
            </layout:simple-field>
            <layout:simple-field label="Предмет договора" class="full" required="1">
                <layout:select name="con_contract__nsi_contract_subject" value="//DOGOVOR_HEAD//CONTRACT_SUBJECT_ID" listSourceID="nsi_contract_subject" xmlTag=":name:"/>
            </layout:simple-field>
            <layout:simple-field label="Номер обращения" class="full">
                <a href="/portal/getCardHtml.action?cardId=FRM$APPEAL_V2_EDIT&amp;documentId={//REGUEST//ID}" target="_blank">Ссылка на обращение  №<xsl:value-of select="//REGUEST//ORDER_NUMBER"/> от <xsl:value-of select="//REGUEST//ORDER_DATE"/></a>
                <!--xsl:value-of select="//REGUEST//REG_NUMDATE"/-->
            </layout:simple-field>
            <layout:simple-field label="Ведущее подразделение" class="full" required="0">
                <layout:edit type="TEXT" name="res_resolution__fk_exp_department" value="//REGUEST//EXP_DEPARTMENT" xmlTag=":name:" readonly="1"/>
            </layout:simple-field>
            <layout:simple-field label="Наименование объекта" class="full" required="0">
                <layout:edit type="TEXT" name="req_request__object_name" value="//REGUEST//OBJECT_NAME" xmlTag=":name:" readonly="1"/>
            </layout:simple-field>
            <layout:simple-field label="Адрес объекта" class="full" required="0">
                <layout:edit type="TEXTAREA" name="req_request__address" value="//REGUEST//ADDRESS" xmlTag=":name:" readonly="1"/>
            </layout:simple-field>
            <layout:simple-field label="Примечание к договору" class="full" required="0">
                <layout:edit type="TEXTAREA" name="con_contract__note" value="//DOGOVOR_HEAD//DOG_NOTE" xmlTag=":name:"/>
            </layout:simple-field>

            <h3 class="header line">Срок исполнения</h3>
            <layout:simple-field label="Дата подписания договора" class="full" required="0">
                <layout:edit type="DATE" name="con_contract__date_signed" value="//DOGOVOR_HEAD//DOG_DATE_SIGNED" xmlTag=":name:"/>
                <div>Допустимый срок экспертизы: 30, 45 или 60 дней</div>
            </layout:simple-field>
            <layout:simple-field label="Дата передачи заявителю" class="full" required="0">
                <layout:edit type="DATE" name="con_contract__date_passed" value="//DOGOVOR_HEAD//DOG_DATE_PASSED" xmlTag=":name:"/>
            </layout:simple-field>
            <xsl:choose>
                <xsl:when test="//DOGOVOR_HEAD//DOG_DATE_EXPERT_BEGIN">
                    <layout:simple-field label="Дата начала экспертизы" class="small " required="0">
                        <layout:edit type="DATE" name="con_contract__date_expert_begin" value="//DOGOVOR_HEAD//DOG_DATE_EXPERT_BEGIN" xmlTag=":name:" readonly="1" class="date_start"/>
                        <label>Срок проведения</label>
                        <layout:edit type="TEXT" name="con_contract__expert_period_day" value="//DOGOVOR_HEAD//DOG_EXPERT_PERIOD_DAY" readonly="1"  xmlTag=":name:" class="date_duration integer"/>
                        <layout:select name="con_contract__nsi_period_day_type" value="//DOGOVOR_HEAD//DOG_PERIOD_DAY_TYPE_ID" readonly="1" listSourceID="nsi_period_day_type" xmlTag=":name:"/>
                    </layout:simple-field>
                </xsl:when>
                <xsl:otherwise>
                    <layout:simple-field label="Дата начала экспертизы" class="small " required="0">
                        <layout:edit type="DATE" name="con_contract__date_expert_begin" value="//DOGOVOR_HEAD//DOG_DATE_EXPERT_BEGIN" xmlTag=":name:" class="date_start"/>
                        <label>Срок проведения</label>
                        <layout:edit type="TEXT" name="con_contract__expert_period_day" value="//DOGOVOR_HEAD//DOG_EXPERT_PERIOD_DAY" xmlTag=":name:" class="date_duration integer"/>
                        <layout:select name="con_contract__nsi_period_day_type" value="//DOGOVOR_HEAD//DOG_PERIOD_DAY_TYPE_ID" listSourceID="nsi_period_day_type" xmlTag=":name:"/>
                    </layout:simple-field>
                </xsl:otherwise>
            </xsl:choose>


            <layout:simple-field label="Дата окончания работ по договору (календ. дни)" class="small double_line" required="0">
                <layout:edit type="DATE" name="con_contract__date_expert_finish" value="//DOGOVOR_HEAD//DOG_DATE_EXPERT_FINISH" xmlTag=":name:" class="date_finish_calc" />
            </layout:simple-field>
            <layout:simple-field label="Дата начала для сведений о прохождении" class="full double_line" required="0">
                <layout:edit type="DATE" name="con_contract__date_info_begin" value="//DOGOVOR_HEAD//DOG_DATE_INFO_BEGIN" xmlTag=":name:" class="date_start_copy"/>
            </layout:simple-field>
            <layout:simple-field label="Плановая дата выпуска" class="small date" required="0">
                <layout:edit type="TEXT" name="con_contract__plan_date_expert_finish" value="//DOGOVOR_HEAD//DOG_DATE_EXPERT_FINISH2" xmlTag=":name:" readonly="1" class="date_finish_calc"/>
            </layout:simple-field>
            <layout:simple-field label="Контрольная дата" class="full " required="0">
                <layout:edit type="DATE" name="con_contract__date_control" value="//DOGOVOR_HEAD//DOG_DATE_CONTROL" xmlTag=":name:"/>
            </layout:simple-field>

            <h2 class="header">Стороны договора</h2>

            <h3 class="header line">Исполнитель</h3>
            <layout:simple-field label="Наименование организации" class="full" required="0">
                <xsl:choose>
                    <xsl:when test="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='EXECUTOR']/CON_NAME">
                        <layout:edit type="TEXTAREA" name="executor_org_name" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='EXECUTOR']/CON_NAME" xmlTag=":name:" readonly="1"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <layout:edit type="TEXTAREA" name="executor_org_name" value="//DOGOVOR_DEFAULT//EXECUTE_CON_CONTRACTOR_NAME" xmlTag=":name:" readonly="1"/>
                    </xsl:otherwise>
                </xsl:choose>
            </layout:simple-field>

            <layout:simple-field label="ФИО" class="full" required="0">
                <xsl:choose>
                    <xsl:when test="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='EXECUTOR']/PERS_FK_CON_CONTRACTOR">
                        <layout:select name="executor_name" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='EXECUTOR']/PERS_FK_CON_CONTRACTOR" listSourceID="nsi_con_person" xmlTag=":name:"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <layout:select name="executor_name" value="//DOGOVOR_DEFAULT//EXECUTE_CON_PERSON_ID" listSourceID="nsi_con_person" xmlTag=":name:"/>
                    </xsl:otherwise>
                </xsl:choose>
            </layout:simple-field>




            <layout:simple-field label="Должность" class="full" required="0">
                <xsl:choose>
                    <xsl:when test="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='EXECUTOR']/PERS_POST">
                        <layout:edit type="TEXT" name="executor_post" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='EXECUTOR']/PERS_POST" xmlTag=":name:" />
                    </xsl:when>
                    <xsl:otherwise>
                        <layout:edit type="TEXT" name="executor_post" value="//DOGOVOR_DEFAULT//EXECUTE_CON_PERSON_POST" xmlTag=":name:" />
                    </xsl:otherwise>
                </xsl:choose>
            </layout:simple-field>
            <layout:simple-field label="Действует на основании" class="full" required="0">
                <xsl:choose>
                    <xsl:when test="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='EXECUTOR']/PERS_DOC_PROXY">
                        <layout:edit type="TEXT" name="executor_org_name" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='EXECUTOR']/PERS_DOC_PROXY" xmlTag=":name:" />
                    </xsl:when>
                    <xsl:otherwise>
                        <layout:edit type="TEXT" name="executor_org_name" value="//DOGOVOR_DEFAULT//EXECUTE_CON_PERSON_DOC_PROXY" xmlTag=":name:" />
                    </xsl:otherwise>
                </xsl:choose>
            </layout:simple-field>

            <h3 class="header line">Заказчик</h3>
            <xsl:choose>
                <xsl:when test="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/CON_NSI_COMPANY_FORM='ФЛ'">
                    <layout:simple-field label="ФИО" class="full" required="0">
                        <a href="" target="_blank"><xsl:value-of select="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/PERS_NAME"/></a>
                    </layout:simple-field>
                    <layout:simple-field label="Телефон, факс" class="full" required="0">
                        <layout:edit type="TEXT" name="phys_client_phone" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/PERS_PHONE" xmlTag=":name:" readonly="1"/>
                    </layout:simple-field>
                    <layout:simple-field label="Почта" class="full" required="0">
                        <layout:edit type="TEXT" name="phys_client_email" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/PERS_EMAIL" xmlTag=":name:" readonly="1"/>
                    </layout:simple-field>
                </xsl:when>
                <xsl:otherwise>


                    <layout:simple-field label="Наименование огранизации" class="full" required="0">
                        <a target="_blank"><xsl:value-of select="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/FULL_NAME"/></a>
                    </layout:simple-field>
                    <layout:simple-field label="ФИО представителя" class="full" required="0">
                        <xsl:value-of select="concat(//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/PER_LAST_NAME, ' ', //CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/PER_FIRST_NAME, ' ', //CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/PER_MIDDLE_NAME)" />
                    </layout:simple-field>
                    <layout:simple-field label="Телефон, факс" class="full" required="0">
                        <layout:edit type="TEXT" name="client_phone" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/PHONE" xmlTag=":name:" readonly="1"/>
                    </layout:simple-field>
                    <layout:simple-field label="Почта" class="full" required="0">
                        <layout:edit type="TEXT" name="client_email" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/EMAIL" xmlTag=":name:" readonly="1"/>
                    </layout:simple-field>
                </xsl:otherwise>
            </xsl:choose>

            <layout:simple-field label="Проект документа отдан" class="full checkBox double_line" required="0">
                <layout:checkbox forceCheckbox="1" value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/CM_IS_DOCUMENT_PASSED" name="con_contract_member__is_document_passed" label="" extractFalse="0" xmlTag=":name:"/>
            </layout:simple-field>


            <h3 class="header line">Плательщик</h3>
            <layout:simple-field label="" class="full checkBox" required="0">
                <xsl:choose>
                    <xsl:when test="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='CUSTOMER']/CON_FULL_NAME">
                        <layout:checkbox forceCheckbox="1" value="1" valueChecked="1" id="buyer_checkbox" name="customer_as_contractor" label="Совпадает с заказчиком" extractFalse="1" xmlTag=":name:"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <layout:checkbox forceCheckbox="1" value="0" id="buyer_checkbox" name="customer_as_contractor" label="Совпадает с заказчиком" extractFalse="1" xmlTag=":name:"/>
                    </xsl:otherwise>
                </xsl:choose>

            </layout:simple-field>
            <div id="buyer_placement">
                <div>
                    <!--layout:simple-field label="Роль организации" class="medium" required="1">
                        <layout:select name="customer_nsi_company_role" value="//MY_LIST_VALUE" listSource="nsi_company_role" xmlTag=":name:"/>
                    </layout:simple-field-->
                    <layout:simple-field label="ОПФ" class="full" required="1">
                        <layout:select name="customer_nsi_company_form" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='CUSTOMER']/CON_NSI_COMPANY_FORM" listSourceID="nsi_company_form" xmlTag=":name:"/>

                    </layout:simple-field>

                    <layout:simple-field label="Наименование полное" class="full" required="1">
                        <layout:edit type="TEXTAREA" name="customer_full_name" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='CUSTOMER']/CON_FULL_NAME" xmlTag=":name:"/>
                    </layout:simple-field>
                    <layout:simple-field label="Наименование краткое" class="full" required="0">
                        <layout:edit type="TEXT" name="customer_name" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='CUSTOMER']/CON_NAME" xmlTag=":name:"/>
                    </layout:simple-field>
                    <layout:simple-field label="Юридический адрес" class="full" required="1">
                        <layout:edit type="TEXTAREA" name="customer_address_legal" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='CUSTOMER']/CON_ADDRESS_LEGAL" xmlTag=":name:"/>
                    </layout:simple-field>
                    <layout:simple-field label="Фактический адрес" class="full" required="0">
                        <layout:edit type="TEXTAREA" name="customer_address_post" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='CUSTOMER']/CON_ADDRESS_POST" xmlTag=":name:"/>
                    </layout:simple-field>
                    <layout:simple-field label="ИНН" class="medium" required="0">
                        <layout:edit type="TEXT" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='CUSTOMER']/CON_INN" name="customer_inn" class="digital" xmlTag=":name:"/>
                        <label>КПП</label>
                        <layout:edit type="TEXT" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='CUSTOMER']/CON_KPP" name="customer_kpp" class="digital" xmlTag=":name:"/>
                    </layout:simple-field>
                    <layout:simple-field label="ОГРН" class="medium" required="0">
                        <layout:edit type="TEXT" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='CUSTOMER']/CON_OGRN_NUMBER" name="customer_ogrn_number" xmlTag=":name:" class="digital"/>
                        <label>ОКПО</label>
                        <layout:edit type="TEXT" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='CUSTOMER']/CON_OKPO" name="customer_okpo" class="digital" xmlTag=":name:"/>
                    </layout:simple-field>
                    <layout:simple-field label="Телефон, факс" class="medium" required="0">
                        <layout:edit type="TEXTAREA" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='CUSTOMER']/CON_PHONE" name="customer_phone" xmlTag=":name:"/>
                        <label>Почта</label>
                        <layout:edit type="TEXT" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='CUSTOMER']/CON_EMAIL" name="customer_email" xmlTag=":name:"/>
                    </layout:simple-field>
                    <h4 class="header line">Представитель</h4>
                    <layout:simple-field label="ФИО" class="full" required="0">
                        <layout:select name="customer_assignee_name" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='CUSTOMER']/PERS_FK_CON_CONTRACTOR" listSource="nsi_con_person" xmlTag=":name:"/>
                    </layout:simple-field>
                    <layout:simple-field label="Должность" class="full" required="0">
                        <layout:edit type="TEXT" name="customer_assignee_post" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='CUSTOMER']/PERS_POST" xmlTag=":name:"/>
                    </layout:simple-field>
                    <layout:simple-field label="Действует на основании" class="full" required="0">
                        <layout:edit type="TEXT" name="customer_assignee_doc_proxy" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='CUSTOMER']/PERS_DOC_PROXY" xmlTag=":name:"/>
                    </layout:simple-field>

                    <layout:simple-field label="Телефон, факс" class="medium" required="0">
                        <layout:edit type="TEXT" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='CUSTOMER']/PERS_PHONE" name="customer_assignee_phone" xmlTag=":name:"/>
                        <label>Почта</label>
                        <layout:edit type="TEXT" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='CUSTOMER']/PERS_EMAIL" name="customer_assignee_email" xmlTag=":name:"/>
                    </layout:simple-field>

                    <h4 class="header line">Банковские реквизиты</h4>
                    <layout:simple-field label="Наименование реквизитов" class="full" required="0">
                        <layout:edit type="TEXT" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='CUSTOMER']/BANK_DATA_NAME" name="customer_bank_account_name" xmlTag=":name:"/>
                    </layout:simple-field>
                    <layout:simple-field label="Отделение банка" class="full" required="0">
                        <layout:edit type="TEXTAREA" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='CUSTOMER']/BANK_NAME" name="customer_bank_account_bank_name" xmlTag=":name:"/>
                    </layout:simple-field>
                    <layout:simple-field label="БИК" class="full number_9" required="0">
                        <layout:edit type="TEXT" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='CUSTOMER']/BANK_BIC" name="customer_bank_account_bank_bic" xmlTag=":name:"/>
                    </layout:simple-field>

                    <layout:simple-field label="Расчетный счет" class="full number_24" required="0">
                        <layout:edit type="TEXT" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='CUSTOMER']/BANK_ACCOUNT_SET" name="customer_bank_account_set" xmlTag=":name:"/>
                    </layout:simple-field>
                    <layout:simple-field label="Корреспондентский счет" class="full number_24" required="0">
                        <layout:edit type="TEXT" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='CUSTOMER']/BANK_ACCOUNT_COR" name="customer_bank_account_cor" xmlTag=":name:"/>
                    </layout:simple-field>
                    <layout:simple-field label="Проект документа отдан" class="full checkBox" required="0">
                        <layout:checkbox forceCheckbox="1" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='CUSTOMER']/CM_IS_DOCUMENT_PASSED" name="customer_is_document_passed" label="" extractFalse="1" xmlTag=":name:"/>
                    </layout:simple-field>
                </div>
            </div>


            <h3 class="header line">Получатель</h3>
            <layout:simple-field label="" class="full checkBox" required="0">

                <xsl:choose>
                    <xsl:when test="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='CUSTOMER']/CON_FULL_NAME">
                        <layout:checkbox forceCheckbox="1" value="1" valueChecked="1" name="receiver_as_contractor" id="reciever_checkbox" label="Совпадает с заказчиком" extractFalse="1" xmlTag=":name:"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <layout:checkbox forceCheckbox="1" value="0" name="receiver_as_contractor" id="reciever_checkbox" label="Совпадает с заказчиком" extractFalse="1" xmlTag=":name:"/>
                    </xsl:otherwise>
                </xsl:choose>
            </layout:simple-field>
            <div id="reciever_placement">
                <div>
                    <!--layout:simple-field label="Роль организации" class="medium" required="1">
                        <layout:select name="receiver_nsi_company_role" value="//MY_LIST_VALUE" listSource="nsi_company_role" xmlTag=":name:"/>
                    </layout:simple-field-->
                    <layout:simple-field label="ОПФ" class="full" required="1">
                        <layout:select name="receiver_nsi_company_form" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='RECEIVER']/CON_NSI_COMPANY_FORM" listSourceID="nsi_company_form" xmlTag=":name:"/>
                    </layout:simple-field>

                    <layout:simple-field label="Наименование полное" class="full" required="1">
                        <layout:edit type="TEXTAREA" name="receiver_full_name" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='RECEIVER']/CON_FULL_NAME" xmlTag=":name:"/>
                    </layout:simple-field>
                    <layout:simple-field label="Наименование краткое" class="full" required="0">
                        <layout:edit type="TEXT" name="receiver_name" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='RECEIVER']/CON_NAME" xmlTag=":name:"/>
                    </layout:simple-field>
                    <layout:simple-field label="Юридический адрес" class="full" required="1">
                        <layout:edit type="TEXTAREA" name="receiver_address_legal" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='RECEIVER']/CON_ADDRESS_LEGAL" xmlTag=":name:"/>
                    </layout:simple-field>
                    <layout:simple-field label="Фактический адрес" class="full" required="0">
                        <layout:edit type="TEXTAREA" name="receiver_address_post" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='RECEIVER']/CON_ADDRESS_POST" xmlTag=":name:"/>
                    </layout:simple-field>
                    <layout:simple-field label="ИНН" class="medium" required="0">
                        <layout:edit type="TEXT" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='RECEIVER']/CON_INN" name="receiver_inn" class="digital"  xmlTag=":name:"/>
                        <label>КПП</label>
                        <layout:edit type="TEXT" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='RECEIVER']/CON_KPP" name="receiver_kpp" class="digital" xmlTag=":name:"/>
                    </layout:simple-field>
                    <layout:simple-field label="ОГРН" class="medium" required="0">
                        <layout:edit type="TEXT" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='RECEIVER']/CON_OGRN_NUMBER" class="digital" name="receiver_ogrn_number" xmlTag=":name:"/>
                        <label>ОКПО</label>
                        <layout:edit type="TEXT" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='RECEIVER']/CON_OKPO" class="digital" name="receiver_okpo" xmlTag=":name:"/>
                    </layout:simple-field>
                    <layout:simple-field label="Телефон, факс" class="medium" required="0">
                        <layout:edit type="TEXTAREA" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='RECEIVER']/CON_PHONE" name="receiver_phone" xmlTag=":name:"/>
                        <label>Почта</label>
                        <layout:edit type="TEXT" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='RECEIVER']/CON_EMAIL" name="receiver_email" xmlTag=":name:"/>
                    </layout:simple-field>
                    <h4 class="header line">Представитель</h4>
                    <layout:simple-field label="ФИО" class="full" required="0">
                        <layout:select name="receiver_assignee_name" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='RECEIVER']/PERS_FK_CON_CONTRACTOR" listSource="nsi_con_person" xmlTag=":name:"/>
                    </layout:simple-field>
                    <layout:simple-field label="Должность" class="full" required="0">
                        <layout:edit type="TEXT" name="receiver_assignee_post" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='RECEIVER']/PERS_POST" xmlTag=":name:"/>
                    </layout:simple-field>
                    <layout:simple-field label="Действует на основании" class="full" required="0">
                        <layout:edit type="TEXT" name="receiver_assignee_doc_proxy" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='RECEIVER']/PERS_DOC_PROXY" xmlTag=":name:"/>
                    </layout:simple-field>

                    <layout:simple-field label="Телефон, факс" class="medium" required="0">
                        <layout:edit type="TEXT" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='RECEIVER']/PERS_PHONE" name="receiver_assignee_phone" xmlTag=":name:"/>
                        <label>Почта</label>
                        <layout:edit type="TEXT" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='RECEIVER']/PERS_EMAIL" name="receiver_assignee_email" xmlTag=":name:"/>
                    </layout:simple-field>

                    <h4 class="header line">Банковские реквизиты</h4>
                    <layout:simple-field label="Наименование реквизитов" class="full" required="0">
                        <layout:edit type="TEXT" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='RECEIVER']/BANK_DATA_NAME" name="receiver_bank_account_name" xmlTag=":name:"/>
                    </layout:simple-field>
                    <layout:simple-field label="Отделение банка" class="full" required="0">
                        <layout:edit type="TEXTAREA" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='RECEIVER']/BANK_NAME" name="receiver_bank_account_bank_name" xmlTag=":name:"/>
                    </layout:simple-field>
                    <layout:simple-field label="БИК" class="full number_9" required="0">
                        <layout:edit type="TEXT" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='RECEIVER']/BANK_BIC" name="receiver_bank_account_bank_bic" xmlTag=":name:"/>
                    </layout:simple-field>

                    <layout:simple-field label="Расчетный счет" class="full number_24" required="0">
                        <layout:edit type="TEXT" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='RECEIVER']/BANK_ACCOUNT_SET" name="receiver_bank_account_set" xmlTag=":name:"/>
                    </layout:simple-field>
                    <layout:simple-field label="Корреспондентский счет" class="full number_24" required="0">
                        <layout:edit type="TEXT" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='RECEIVER']/BANK_ACCOUNT_COR" name="receiver_bank_account_cor" xmlTag=":name:"/>
                    </layout:simple-field>
                    <layout:simple-field label="Проект документа отдан" class="full checkBox" required="0">
                        <layout:checkbox forceCheckbox="1" value="//CONTACT_MEMBERS//ROW[CM_NSI_COMPANY_ROLE='RECEIVER']//CM_IS_DOCUMENT_PASSED" name="receiver_is_document_passed" label="" extractFalse="1" xmlTag=":name:"/>
                    </layout:simple-field>
                </div>
            </div>

            <h3 class="header line">Стоимость</h3>
            <layout:simple-field label="Сумма" class="small nds_calc_block" required="0">
                <layout:edit type="TEXT" value="//DOGOVOR_HEAD//DOG_SUM" name="con_contract__doc_sum" xmlTag=":name:" class="digital nds_value"/>
                <label>Ставка НДС</label>
                <layout:select name="con_contract__nsi_value_vat" value="//DOGOVOR_HEAD//DOG_VALUE_VAT_ID" listSourceID="nsi_value_vat" xmlTag=":name:"/>
                <label>НДС</label>
                <layout:edit type="TEXT" value="//DOGOVOR_HEAD//DOG_SUM_VAT" name="con_contract__doc_sum_vat" xmlTag=":name:" readonly="1" class="nds_calc"/>
            </layout:simple-field>
            <layout:simple-field label="Итого" class="full" required="0">
                <layout:edit type="TEXT" value="//DOGOVOR_HEAD//DOG_SUM_TOTAL" name="con_contract__doc_sum_total" xmlTag=":name:" class="doc_sum_total" readonly="1"/>
            </layout:simple-field>
            <!--layout:simple-field label="Итого прописью" class="full" required="0">
                <layout:edit type="TEXTAREA" value="" readonly="1"/>
            </layout:simple-field-->
            <xsl:variable name="avans">

            </xsl:variable>
            <layout:simple-field label="Размер аванса" class="small avans_sum" required="0">
                <xsl:choose>
                    <xsl:when test="//DOGOVOR_HEAD//DOG_VALUE_PREPAYMENT_ID">
                        <layout:select name="con_contract__nsi_value_prepayment" value="//DOGOVOR_HEAD//DOG_VALUE_PREPAYMENT_ID" listSourceID="nsi_value_prepayment" xmlTag=":name:"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <layout:select name="con_contract__nsi_value_prepayment" value="//AVANS_VALUE" listSourceID="nsi_value_prepayment" xmlTag=":name:"/>
                    </xsl:otherwise>
                </xsl:choose>

                <label>руб</label>
                <layout:edit type="TEXT" value="//DOGOVOR_HEAD//DOG_SUM_PREPAYMENT" name="con_contract__sum_prepayment" xmlTag=":name:" readonly="1" class="avans_value"/>
            </layout:simple-field>

            <h3 class="header line">Утвержденный комплект файлов по договору</h3>
            <layout:simple-field label="" class="medium" required="0">
                <!--input type="button" value="Загрузить" class="form_button"/>
                <input type="button" value="Сканировать" class="form_button"/-->
                <layout:file value="Загрузить" id="con_contract__folder_id" name="con_contract__folder_id" xmlTag=":name:" sign="true" pre_files="//COMBINED_FILE_LINE"/>
            </layout:simple-field>

            <layout:line/>
            <layout:simple-field label="" class="medium" required="0">
                <input type="button" value="Начать согласование" class="form_button startSign" /><br/>
                <input type="button" value="Отменить согласование" class="form_button fileDesignButton hide" />
            </layout:simple-field>

            <h3 class="header line">Лист согласования</h3>
            <xsl:variable name="current_user" select="//CURRENT_USER_INFO//PERSON_ID"/>
          <layout:table class="all_local_comment line checkBox" style="width:100%;" add="1" move="0">
                <layout:header>
                    <layout:cell name="№"/>
                    <layout:cell name="Роль"/>
                    <layout:cell name="Плановый согласующий"/>
                    <layout:cell name="Статус"/>
                    <layout:cell name="Примечание"/>
                    <layout:cell name="Подписать"/>
                    <layout:cell name="Дата подписания"/>
                </layout:header>
                <layout:body value="//APPROVED_LIST//ROW" xmlTag="add_toexp">
                    <layout:cell class="cell-position" style="text-align: center; vertical-align: middle;">

                    </layout:cell>
                    <layout:cell>
                        <layout:multiselect value="NSI_RESOLUTION_ROLE" limit="1" listSourceID="nsi_resolution_role" name="con_contract_approvement_member__nsi_resolution_role" readonly="1" xmlTag=":name:"/>
                    </layout:cell>
                    <layout:cell>
                        <layout:multiselect value="FK_EXP_PERSON" limit="1" listSourceID="nsi_exp_person_all" name="con_contract_approvement_member__fk_exp_person"  readonly="1" xmlTag=":name:"/>
                        <input type="hidden" name="current_user" value="{$current_user}"/>
                        <layout:hidden name="selected_user" value="FK_EXP_PERSON"/>
                    </layout:cell>
                    <layout:cell>
                      <layout:multiselect value="NSI_APPROVEMENT_ROLE" limit="1" listSourceID="nsi_approvement_role" name="con_contract_approvement_member__nsi_resolution_local_status" xmlTag=":name:" readonly="1"/>
                    </layout:cell>
                    <layout:cell>
                        <xsl:choose>
                            <xsl:when test="FK_EXP_PERSON=$DATA//CURRENT_USER_INFO//PERSON_ID">
                                <layout:edit type="TEXTAREA" style="width: 100%" name="con_contract_approvement_member__note" value="NOTE"  xmlTag=":name:" />
                            </xsl:when>
                            <xsl:otherwise>
                                <layout:edit type="TEXTAREA" style="width: 100%" name="con_contract_approvement_member__note" value="NOTE" readonly="1" xmlTag=":name:" />
                            </xsl:otherwise>
                        </xsl:choose>
                    </layout:cell>
                    <layout:cell>
                        <xsl:choose>
                            <xsl:when test="FK_EXP_PERSON=$DATA//CURRENT_USER_INFO//PERSON_ID">
                                <xsl:choose>
                                    <xsl:when test="DATE_SIGNED != ''">
                                        <input type="button" style="width: 100%;" value="Подписать" class="form_button disable personSign signedButton"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <input type="button" style="width: 100%;" value="Подписать" class="form_button personSign unSignedButton"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:otherwise>
                                <input type="button" style="width: 100%;" value="Подписать" class="form_button disable personSign hide defaultButton" />
                            </xsl:otherwise>
                        </xsl:choose>
                        <input type="hidden" name="person_sign_status"/>
                    </layout:cell>
                    <layout:cell>
                        <span class="date_signed"><layout:extract select="DATE_SIGNED"/></span>
                        <layout:hidden name="con_contract_approvement_member__date_signed" value="DATE_SIGNED" xmlTag=":name:"/>
                    </layout:cell>
                </layout:body>
            </layout:table>

            <layout:simple-field label="Примечание" class="full" required="0">
                <layout:edit type="TEXTAREA" name="con_contract__file_complect_note" value="" style="" xmlTag=":name:"/>
            </layout:simple-field>

            <h3 class="header line">Рабочие версии документов</h3>
            <layout:table class="test" style="width:100%;" add="1" move="1">
                <layout:header>
                    <layout:cell name="Вид документа" width=""/>
                    <layout:cell name="Статус" width=""/>
                    <layout:cell name="Комментарий" width=""/>
                    <layout:cell name="Файл" width=""/>
                </layout:header>
                <layout:body value="//CONTRACT_DOCUMENT_WF/ROW_SET/ROW" xmlTag="con_contract_document">
                    <layout:cell>
                        <layout:select name="con_contract_document__nsi_contract_document" value="NSI_CONTRACT_DOCUMENT" listSourceID="nsi_contract_document" xmlTag=":name:"/>
                    </layout:cell>
                    <layout:cell>
                        <layout:select name="con_contract_document__nsi_document_status" value="NSI_DOCUMENT_STATUS" listSourceID="nsi_document_status" xmlTag=":name:"/>
                    </layout:cell>
                    <layout:cell>
                        <layout:edit type="TEXTAREA" name="con_contract_document__note" value="NOTE" style="" xmlTag=":name:"/>
                    </layout:cell>
                    <layout:cell>
                        <!-- вставить layout:file -->
                        <layout:file value="Загрузить" name="con_contract_document__file_id" pre_files="FILES_CD//FILE_COMBO_LINE" sign="1" xmlTag=":name:"/>
                        <!--<layout:hidden name="con_contract_document__date_signed"" value="TABLE_VALUE" style="" xmlTag="/>
                        <layout:hidden name="con_contract_document__signatory_name" value="TABLE_VALUE" style="" xmlTag=":name:"/>-->
                    </layout:cell>


                </layout:body>
            </layout:table>

            <h3 class="header line">Приостановка оказания услуг</h3>
            <layout:simple-field label="Дата приостановки" class="small" required="0">
                <layout:edit type="DATE" name="con_contract__date_paused" value="//DOGOVOR_HEAD//DOG_DATE_PAUSED" xmlTag=":name:"/>
            </layout:simple-field>
            <layout:simple-field label="Срок приостановки" class="small" required="0">
                <layout:edit type="DATE" name="con_contract__date_resumed" value="//DOGOVOR_HEAD//DOG_DATE_RESUMED" xmlTag=":name:"/>
            </layout:simple-field>

            <h3 class="header line">Аннулирование договора</h3>
            <layout:simple-field label="Договор аннулирован" class="full checkBox" required="0">
                <layout:checkbox forceCheckbox="1" value="//DOGOVOR_HEAD//DOG_IS_CANCELED" name="con_contract__is_canceled" label="" extractFalse="1" xmlTag=":name:"/>
            </layout:simple-field>
            <layout:simple-field label="Дата возврата средств" class="small" required="0">
                <layout:edit type="DATE" name="con_contract__date_reverse" value="//DOGOVOR_HEAD//DOG_DATE_REVERSE" xmlTag=":name:"/>
            </layout:simple-field>
            <layout:simple-field label="Номер п.п. по возврату средств" class="full double_line" required="0">
                <layout:edit name="con_contract__reverse_doc_point" value="//DOGOVOR_HEAD//DOG_REVERSE_DOC_POINT" xmlTag=":name:"/>
            </layout:simple-field>
            <layout:simple-field label="Сумма возврата" class="small" required="0">
                <layout:edit type="TEXT" value="//DOGOVOR_HEAD//DOG_REVERSE_SUM" name="con_contract__reverse_sum" xmlTag=":name:"/>
                <label>руб.</label>
            </layout:simple-field>
            <!--layout:simple-field label="Сумма возврата прописью" class="full" required="0">
                <layout:edit type="TEXTAREA" value="" name="" xmlTag="return_sum_string"/>
            </layout:simple-field-->
            <layout:line />
            <!--layout:simple-field label="Организация создавшая" class="full" required="0">
                <layout:multiselect value="//MY_MULTISELECT_VALUE" limit="1" listSourceID="TEST_LIST" name="organization_created" xmlTag=":name:"/>
            </layout:simple-field>
            <layout:simple-field label="Организация просматривающая" class="full" required="0">
                <layout:multiselect value="//MY_MULTISELECT_VALUE" limit="1" listSourceID="TEST_LIST" name="organization_browsing" xmlTag=":name:"/>
            </layout:simple-field-->
            <layout:simple-field label="" class="full" required="0">
                <!--layout:edit type="RESET" value="Отмена"/-->
                <!--layout:edit type="SUBMIT" value="Сохранить"/-->
                <input type="button" class="form_button saveCloseButton" value="Сохранить"/>
                <div class="rightBlock"><input type="button" class="form_button saveButton" value="Применить"/>
                <input type="button" class="form_button closeButton" value="Отмена"/>
                </div>
            </layout:simple-field>


            <layout:clear/>
        </layout:form>

        <div class="hidden">
            <div id="buyer">

            </div>
            <div id="reciever">

            </div>
        </div>

    </xsl:variable>

    {B{FRM$XML_LAYOUT$V0.1}E}
    <!-- **************************** Основной темплейт ******************************** -->
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
        function make_chkbox_moving(chkbox_id, data, placement){
            $('#'+chkbox_id).click(function(){
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
            $('#'+chkbox_id).click();


        }

        function number_mask(obj, field_length){
            obj.keyup(function(eventObject){
            $(this).val($(this).val().replace(/(\D+)/g, ''));
            if (field_length && $(this).val().length>field_length) {
                $(this).val($(this).val().slice(0, field_length))
            }

      });
        }
        function ndsCalc(){
            if ($('.nds_calc_block').find('.nds_value').val()){
            var this_sum = $('.nds_calc_block').find('.nds_value').val();
            $('.nds_calc_block').find('.nds_value').val(parseInt(this_sum));
            var nds_val = ($('.nds_calc_block').find('option:selected').val()/100)*$('.nds_calc_block').find('.nds_value').val();
            nds_val = Math.round(nds_val*100)/100;
            $('.nds_calc_block').find('.nds_calc').val(nds_val);
            $('.doc_sum_total').val(+$('.nds_calc_block').find('.nds_value').val()+nds_val);
            }
        }
        function dateRender(date){
            var date = (date)?date:new Date();
            var monthRender = (+date.getMonth()+1).toString();
            var dateRender = date.getDate().toString();
            var dateFinalRender = ((dateRender.length<2)?'0'+dateRender:dateRender)+'.'+((monthRender.length<2)?'0'+monthRender:monthRender)+'.'+date.getFullYear();
            console.log(dateRender, dateRender.length, '0'+dateRender);
            return dateFinalRender;
        }
        function dateParseRu(dateStr) {
            var dateStr = (dateStr)?dateStr:dateRender(new Date());
            var DateArr = dateStr.split('.').reverse();
            return new Date(startDateArr[0], startDateArr[1]-1, startDateArr[2]);
        }
        function dateCalc(){
            if ($('.date_start').val() && $('.date_duration').val()){
            var startDateArr = $('.date_start').val().split('.').reverse();
            var startDate = new Date(startDateArr[0], startDateArr[1]-1, startDateArr[2]);
            var dateDuration = +$('.date_duration').val()-1;
            var endDate = new Date(startDate);
            var datePeriodType = $('.date_duration').siblings('.customSelect').find('option:selected').val();

            var countDays = 0;
            if (datePeriodType=="WORKDAYS"){
                /*while (dateDuration!=0){
                    countDays++;
                    var calcDate = new Date(startDate);
                    calcDate.setDate(startDate.getDate()+countDays);
                    console.log(calcDate.getDay());
                    if (calcDate.getDay()!=0 && calcDate.getDay()!=6){
                       dateDuration--;
                    }
                }*/
                var durationRange = ((dateDuration%5)+5)*7;
                var calcDate = new Date(startDate);
                calcDate.setDate(startDate.getDate()+durationRange);
                $.ajax({
                    url: '/customactions/getWorkDay.action',
                    type: 'GET',
                    data: {
                        startDate: $('.date_start').val(),
                        endDate: dateRender(calcDate)
                    }
                })
                .success(function(data){
                    console.log(data);
                    while (dateDuration!=0){
                        if (data.data[countDays].isWork=='true'){
                           dateDuration--;
                        }
                        countDays++;
                    }
                    endDate.setDate(startDate.getDate()+countDays);
                    $.ajax({
                        url: '/customactions/getWorkDay.action',
                        type: 'GET',
                        data: {
                            startDate: dateRender(endDate),
                            endDate: dateRender(endDate)
                        }
                    })
                    .success(function(data){
                        if (data.data[0].isWork=='false'){
                            $('.date_finish_calc').addClass('holiday');
                        } else {
                            $('.date_finish_calc').removeClass('holiday');
                        }
                    });
                    $('.date_finish_calc').val(dateRender(endDate));
                });
            } else {
                endDate.setDate(dateDuration+startDate.getDate());
                $.ajax({
                    url: '/customactions/getWorkDay.action',
                    type: 'GET',
                    data: {
                        startDate: dateRender(endDate),
                        endDate: dateRender(endDate)
                    }
                })
                .success(function(data){
                    if (data.data[0].isWork=='false'){
                        $('.date_finish_calc').addClass('holiday');
                    } else {
                        $('.date_finish_calc').removeClass('holiday');
                    }
                });
                $('.date_finish_calc').val(dateRender(endDate));
            }

            $('.date_start_copy').val($('.date_start').val());

            /*if (endDate.getDay()==0 || endDate.getDay()==6){
                $('.date_finish_calc').addClass('holiday');
            } else {
                $('.date_finish_calc').removeClass('holiday');
            }*/


            }
        }
        function all_masks(){
            /*dateMask();*/
            number_mask($('.number_9 input[type="text"]'), 9);
            number_mask($('.number_20 input[type="text"]'), 20);
            number_mask($('.number_24 input[type="text"]'), 24);
            $('input[type="text"].digital').keyup(function(eventObject){
                    $(this).val($(this).val().replace(/(\D+)/g, ''));
                });


            $('.mask_phone input[type="text"]').mask("+7(999) 999-99-99");
            $('.mask_email input[type="email"]').focusout(function(){
                if (!/(.*)@(.[^.]*).(.*)/ig.test($(this).val())){
                    /*alert('Некорректный e-mail');*/

                }
            });

            $('.money input[type="text"], .integer').keyup(function(eventObject){
                $(this).val($(this).val().replace(/(\D+)/g, ''));
              });
            ndsCalc();
            avansCalc();
        }
        var thisForm = $('form').eq(0);
        var thisFormId = thisForm.attr('id');
        function avansCalc(){
            var avans = ($('.avans_sum').find('option:selected').val()/100)*$('.doc_sum_total').val();
            avans = Math.round(avans*100)/100;
            $('.avans_sum .avans_value').val(avans);
        }
        function _allFilesSigned(){
            _signAppletCallbackFileSigned();
        }
        function _signAppletCallbackFileSigned(){
            $('.fileDesignButton').show();
            $('.sectionBtnAdd, .sectionBtnDelete').hide();
            $('.deleteElem').hide();
            $('[data-name-filename="con_contract__folder_id"] .fileInputButton').addClass('disabled');

            /* добавить ридонли */
            fieldList.forEach(function(item, i, arr) {
                $('[name="'+item+'"]').attr('readonly', true);
                $('[name="'+item+'"]').addClass('readOnly');
            });
            $('[name="con_contract__date_signed"]').val(dateRender());

            if ($('.pressed').length){
                var $thisPressed = $('.pressed').eq(0);
                $thisPressed.addClass('disable');
                var nextCell = $thisPressed.parents('.cellWrapTable').next('.cellWrapTable');
                nextCell.find('.date_signed').html(dateRender());
                nextCell.find('input').val(dateRender());
                makeFileXmlTag();
                saveFormUniversal($('form').eq(0), false, {success: function(){}});
                $thisPressed.siblings('[name="person_sign_status"]').val('person_approved');

                if ($('[xftag="approved_list"]:visible').length == $('[value="person_approved"]').length){
                    $status.val('APPROVED');
                }
                $thisPressed.removeClass('pressed');
            }
            else{
                $status.val('APPROVED');
            }
        }
        var $status = $('[name="contractStatusId"]');
        /* список полей */
        var fieldList=[
            'con_contract__doc_number',
            'con_contract__doc_date',
            'con_contract__nsi_contract_subject',
            'con_contract__note',
            'con_contract__date_signed',
            'con_contract__date_passed',
            'con_contract__date_expert_begin',
            'con_contract__expert_period_day',
            'con_contract__nsi_period_day_type',
            'con_contract__date_expert_finish',
            'con_contract__date_info_begin',
            'con_contract__plan_date_expert_finish',
            'con_contract__date_control',

            'executor_name',
            'executor_post',
            'executor_org_name',
            'con_contract_member__is_document_passed',

            'customer_nsi_company_form',
            'customer_full_name',
            'customer_name',
            'customer_address_legal',
            'customer_address_post',
            'customer_inn',
            'customer_kpp',
            'customer_ogrn_number',
            'customer_okpo',
            'customer_phone',
            'customer_email',
            'customer_assignee_name',
            'customer_assignee_post',
            'customer_assignee_doc_proxy',
            'customer_assignee_phone',
            'customer_assignee_email',
            'customer_bank_account_name',
            'customer_bank_account_bank_name',
            'customer_bank_account_bank_bic',
            'customer_bank_account_set',
            'customer_bank_account_cor',
            'customer_is_document_passed',

            'receiver_nsi_company_form',
            'receiver_full_name',
            'receiver_name',
            'receiver_address_legal',
            'receiver_address_post',
            'receiver_inn',
            'receiver_kpp',
            'receiver_ogrn_number',
            'receiver_okpo',
            'receiver_phone',
            'receiver_email',
            'receiver_assignee_name',
            'receiver_assignee_post',
            'receiver_assignee_doc_proxy',
            'receiver_assignee_phone',
            'receiver_assignee_email',
            'receiver_bank_account_name',
            'receiver_bank_account_bank_name',
            'receiver_bank_account_bank_bic',
            'receiver_bank_account_set',
            'receiver_bank_account_cor',
            'receiver_is_document_passed',

            'con_contract__doc_sum',
            'con_contract__nsi_value_vat',
            'con_contract__doc_sum_vat',
            'con_contract__doc_sum_total',
            'con_contract__nsi_value_prepayment',
            'con_contract__sum_prepayment',

            'con_contract__date_paused',
            'con_contract__date_resumed',
            'con_contract__is_canceled',
            'con_contract__date_reverse',
            'con_contract__reverse_doc_point',
            'con_contract__reverse_sum',

            ];
        function postAddToken(t, item) {
            var cUser = $('[name="current_user"]').eq(0).val();
            t.parents('._token_input_wrapper').siblings('[name="selected_user"]').val(item.objectId);
            if (item.objectId == cUser && $status.val() != 'APPROVED'){
                t.parents('.rowWrapTable').find('.personSign').removeClass('hide');
                t.parents('.rowWrapTable').find('[name="con_contract_approvement_member__note"]').removeClass('readOnly').removeAttr('readonly');
                if ($('.startSign').hasClass('hide') && !$('.fileDesignButton').hasClass('hide')){
                    t.parents('.rowWrapTable').find('.personSign').removeClass('disable');
                }

            }
        }
        $(function(){
            all_masks();
            $('.cell-position').each(function(){
              var $this = $(this),
                  pos = $this.parent().data('position');
              $this.text(pos);
            });

            setTimeout(function(){
                $.signECP.callbacks.globals.signAppletCallbackFileSigned = _signAppletCallbackFileSigned;
                $.signECP.callbacks.globals.allFilesSigned = _signAppletCallbackFileSigned;
            }, 1000);

            $(document).on('click', '.personSign:not(.disable)', function(){
                if (!$('[data-name-fileid="con_contract__folder_id"] .fileSign').hasClass('disabled')){
                    $(this).addClass('pressed');
                    $('.fileSign').click();
                }
            });

            $(document).on('click', '.startSign', function(){
                if (!$('[data-name-fileid="con_contract__folder_id"] .fileSign').hasClass('disabled')){
                    $(this).addClass('hide');
                    $('.fileDesignButton').removeClass('hide');
                    $('.sectionBtnAdd, .sectionBtnDelete').hide();

                    /* добавить ридонли */
                    fieldList.forEach(function(item, i, arr) {
                        $('[name="'+item+'"]').attr('readonly', true);
                        $('[name="'+item+'"]').addClass('readOnly');
                    });

                    $('.personSign').removeClass('hide');

                    var cUser = $('[name="current_user"]').eq(0).val();
                    $('.personSign').each(function(indx, elm){
                        var sUser = $(elm).parents('.rowWrapTable').find('[name="selected_user"]').val();
                        if (cUser == sUser){
                            $(elm).removeClass('disable');
                        }
                    });
                    $status.val('APPROVEMENT');
                } else {
                    $(this).addClass('disable');
                }

            });



            $(document).on('click', '.fileDesignButton', function(){
                $('.personSign').addClass('hide disable');
                $('.startSign').removeClass('hide');
                $(this).addClass('hide');

                /*$('[name="con_contract_approvement_global__note"]').removeAttr('readonly').removeClass('readOnly');
                $('[name="con_contract_approvement_global__is_no_comment"]').removeAttr('readonly').removeClass('readOnly');
                $('[name="res_remark__is_no_comment"]').removeAttr('readonly').removeClass('readOnly');
                $('[name="res_remark__is_global_included"]').removeAttr('readonly').removeClass('readOnly');
                $('[name="con_contract_approvement_global__comment_text"]').removeAttr('readonly').removeClass('readOnly');*/
                $('.date_signed').html('');
                $('[name="con_contract_approvement_member__date_signed"]').val('');


                $('.attachmentsTableWrapper').find('.attachmentFileRow').each(function(indx, elm){
                    var thisFileId = $(elm).attr('id');
                    var $this = $(elm);
                    $.ajax({
                        url: '/elib/deleteSignForApplet.action',
                        data: {
                            cardId: thisFileId
                        }
                    }).success(function(data){
                        console.log('Remove Sign Message for: '+thisFileId);
                        console.log(data);
                        $this.removeClass('signed');
                        $this.find('.signFileImg').remove();
                        $('.deleteElem').show();
                        $('[name="con_contract_approvement_member__date_signed"]').val('');
                    });
                });
                $status.val('PROJECT');
                $('[data-name-filename="con_contract__folder_id"] .fileInputButton').removeClass('disabled');

                /* убрать ридонли */
                fieldList.forEach(function(item, i, arr) {
                        $('[name="'+item+'"]').removeAttr('readonly');
                        $('[name="'+item+'"]').removeClass('readOnly');
                    });

                $('.sectionBtnAdd, .sectionBtnDelete').show();
            });

            /*if ($status.val()=='APPROVED'){
                _signAppletCallbackFileSigned();
            }*/

            setTimeout(function(){
                $('.personSign').each(function(indx, elm){
                    var $thisRow = $(elm).parents('.rowWrapTable');
                    var signDate = $thisRow.find('[name$="date_signed"]').val();
                    var sUser = $thisRow.find('[name="selected_user"]').val();
                    var cUser = $thisRow.find('[name="current_user"]').val();
                    console.log('signDate:'+signDate);
                    console.log('selected_user:'+sUser);
                    console.log('current_user:'+cUser);
                    if (signDate && sUser==cUser){
                        $(elm).addClass('disable signedButton');
                    }
                });

            }, 1000);



            if ($status.val() == 'APPROVEMENT' && $('[data-name-filename="con_contract__folder_id"] .attachmentsTable  li').length){
                $('.startSign').click();
            }

            if ($('[name="ecpExist"]').val()=='1'){
                $('.fileDesignButton').removeClass('hide');
                $('.startSign').addClass('hide');
                $('.sectionBtnAdd, .sectionBtnDelete').hide();
                $('.deleteElem').hide();
                $('.AttachmentFileName').each(function(indx, elm){
                    $(elm).before('<img class="signFileImg" src="/static/typeForm/img/key_go.png" />');
                    $(elm).parents('.attachmentFileRow').addClass('signed');
                });
            }
            if(!+$('[name="fileCount"]').val()){
                $('.startSign').addClass('hide');
            }
            $(document).on('change', '.fileList', function(){
                console.log('File Added');
                if ($('.fileDesignButton').hasClass('hide') && $('.startSign').hasClass('hide')){
                    $('.startSign').removeClass('hide');
                }
            });

            if ($status.val() == 'APPROVED'){
                $('.personSign').addClass('disable');
            }


            $(document).on('click', '.sectionBtnAdd, .sectionBtnDelete', function(){
                $('[xftag="approved_list"]:visible').each(function(indx, elm){
                    $(elm).attr('data-position', indx+1);
                    $(elm).find('.cell-position').html(indx+1);
                });
            });


            $('[name="executor_name"]').on('change', function() {
                var term = $(this).find('option:selected').text();
                $.ajax({
                    type: 'GET',
                    url: '/components/multiselect.action?identifier=nsi_con_person&term=' + term
                })
                .done(function(data){
                    var executorPost = data[0].extraFields.post;
                    $('[name="executor_post"]').val(executorPost);
                });

            });
            $('input, textarea').each(function(indx, elm){
                if ($(elm).attr('readonly')){
                    $(elm).addClass('readOnly');
                }
            });
            $('input[type="text"].nds_calc').siblings('.customSelect').find('select').change(function(){
                ndsCalc();
                avansCalc();
            });
            avansCalc();
            $('.nds_value, .avans_sum select').change(function(){
                ndsCalc();
                avansCalc();
            });
            setTimeout(initCheckboxes, 200);
            make_chkbox_moving('buyer_checkbox', 'buyer', 'buyer_placement');
            make_chkbox_moving('reciever_checkbox', 'reciever', 'reciever_placement');
            setTimeout(function(){$('.date_finish_calc+img').after('<span class="hide">Выходной день!</span>');}, 1000);

            dateCalc();
            $('.date_start, .date_duration, .date_duration+.customSelect select').change(function(){
                dateCalc();
            });

            /*$('input[type="submit"]').click(function(){
            $('.fileButton input[type="file"]').closest('.fileButton').siblings('.attachmentsTableWrapper').find('.attachmentFileRow').each(function(indx, elm){
                    var fileIdInputName = 'con_contract_document__file_id';
                    var fileIdInput = $(elm).find('.file_input_js input[name="'+fileIdInputName+'"]');

                        if (fileIdInput.length==0){
                            $(elm).find('.file_input_js').append('<input type="hidden" name="'+fileIdInputName+'"/>');
                        }
                        fileIdInput = $(elm).find('.file_input_js input[name="'+fileIdInputName+'"]');
                        fileIdInput.val($(elm).attr('id'));
                        fileIdInput.attr('xftag', fileIdInputName);
                    });

            });*/
            $('.closeButton').click(function(){
                window.close();
            });
            $('.saveCloseButton').click(function(){
                if (step_validate($('form')).result){
                    $(this).removeClass('notValidate');
                    makeFileXmlTag();
                    saveFormUniversal(thisForm, {success: function(){window.close();}});
                }else{
                    $(this).addClass('notValidate');
                    $(document).scrollTop($('.redField').offset().top);
                }

            });
            $('.saveButton').click(function(){
                if (step_validate($('form')).result){
                    $(this).removeClass('notValidate');
                    makeFileXmlTag();
                    /*$('form').submit();*/
                    saveFormUniversal($('form').eq(0));
                }else{
                    $(this).addClass('notValidate');
                    $(document).scrollTop($('.redField').offset().top);
                }
            });

        });
        ]]>
        </script>
        <xml style="display: none">
          <xsl:copy-of select="$DATA"/>
        </xml>
    </xsl:template>
</xsl:stylesheet>
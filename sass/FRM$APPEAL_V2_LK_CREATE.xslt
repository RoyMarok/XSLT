<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:layout="URN:html-form-layout:v0.1" xmlns="http://www.w3.org/1999/xhtml" xmlns:ex2="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLTExtension" xmlns:ctx="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLDataContext" xmlns:gbu="http://xmlns.oracle.com/MSG_GBU_doc">
<xsl:output method="html" indent="yes" omit-xml-declaration="yes" undeclare-prefixes="yes" exclude-result-prefixes="#all"/>
	<xsl:variable name="DATA">
        <ROOT xmlns="">
            <TEST_VALUE></TEST_VALUE>
            <HARDCODEDATA>
                <NSI_SERVICE_TYPE>GE</NSI_SERVICE_TYPE>
                <NSI_REQUEST_TYPE>ONLINE</NSI_REQUEST_TYPE>
                <FLAG_ID>FORM_SHORTLENGTHED_FROM_LK_FLAG_TRUE</FLAG_ID>
                <NSI_REQUEST_STATUS>PROJECT</NSI_REQUEST_STATUS>
                <IS_DELETED>0</IS_DELETED>
            </HARDCODEDATA>
            <DECLARANT>
                <xsl:choose>
                    <xsl:when test="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']">
                        <xsl:copy-of select="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:copy-of select="//CURRENT_CONTRACTOR//ROW"/>
                    </xsl:otherwise>
                </xsl:choose>
            </DECLARANT>
            <MY_MULTISELECT_VALUE></MY_MULTISELECT_VALUE>
            <MY_LIST_VALUE>id1</MY_LIST_VALUE>
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
        <xsl:copy-of select="/"/>
        </ROOT>

    </xsl:variable>
    <xsl:variable name="STYLES">
    	{B{FRM$XML_LAYOUT$V0.1-2PANEL_STYLES}E}
        <style>
            .project_org, .before_appeal{
                display: none;
            }
            .line.double_line .inputWrap label,
            .line.double_line .inputWrap p
            {
                white-space: normal;
                max-width: 500px;
                line-height: 1em;
            }
            .fileExistAction{
                display: none;
            }
            .formFooter .leftBlock{
                width: 120px;
            }
            .formFooter .rightBlock {
                width: 680px;
                text-align: right;
            }
            .req-star {
                color: red;
            }

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
                        <span>Объект и цель</span>
                    </li>
					<li class="" data-content-block="step2">
                        <span>Заявитель и исполнитель</span>
                    </li>
					<li class="" data-content-block="step3">
                        <span>Условия предоставления услуги</span>
                    </li>
					<li class="" data-content-block="step4">
                        <span>Загрузка документации</span>
                    </li>
				</ol>
			</div>
			<div class="frmAppeal_content">
				<layout:form action="/customactions/requestSave.action" xmlTag="request">
                    <layout:hidden name="documentId" value="//SYS_LOG//DOC_KEY" xmlTag=":name:"/>
                    <!--xsl:choose>
                        <xsl:when test="//SYS_LOG//DOC_KEY">
                            <layout:hidden name="req_request__is_deleted" value="//REGUEST//IS_DELETED" xmlTag=":name:"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <layout:hidden name="req_request__is_deleted" value="//HARDCODEDATA//IS_DELETED" xmlTag=":name:"/>
                        </xsl:otherwise>
                    </xsl:choose-->

                    <layout:hidden name="req_request__is_deleted" value="//HARDCODEDATA//IS_DELETED" xmlTag=":name:"/>

                    <xsl:choose>
                        <xsl:when test="//REGUEST//NSI_REQUEST_STATUS">
                            <layout:hidden name="req_request__nsi_request_status" value="//REGUEST//NSI_REQUEST_STATUS" xmlTag=":name:"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <layout:hidden name="req_request__nsi_request_status" value="//HARDCODEDATA//NSI_REQUEST_STATUS" xmlTag=":name:"/>
                        </xsl:otherwise>
                    </xsl:choose>


                    <layout:hidden name="flagId" value="//HARDCODEDATA//FLAG_ID" xmlTag=":name:"/>
					<div class="steps" id="step1">
						<layout:header>ШАГ 1. Сведения об объекте и цели заявления</layout:header>
						<layout:simple-field label="" class="full radioGroup_list radio ur_fiz" required="0">
                            <layout:radio labelValue="Государственная экспертиза проектной документации и результатов инженерных изысканий" value="PROJDOC_WITHOUT_COST_ENGINEERING" valueCheckedPath="//REGUEST//NSI_EXPERT_TARGET" name="req_request__nsi_expert_target" checked="1" xmlTag=":name:"/>
                            <layout:radio labelValue="Государственная экспертиза проектной документации после проведения государственной экспертизы результатов инженерных изысканий" value="PROJDOC_WITHOUT_COST" valueCheckedPath="//REGUEST//NSI_EXPERT_TARGET" name="req_request__nsi_expert_target" checked="0" xmlTag=":name:"/>
                            <layout:radio labelValue="Государственная экспертиза результатов инженерных изысканий" value="RESULTS_ENGINEERING_SURVEY" valueCheckedPath="//REGUEST//NSI_EXPERT_TARGET" name="req_request__nsi_expert_target" checked="0" xmlTag=":name:"/>
                        </layout:simple-field>
                        <layout:hidden name="req_request__nsi_service_type" value="//HARDCODEDATA//NSI_SERVICE_TYPE" xmlTag=":name:"/>
                        <layout:hidden name="req_request__nsi_request_type" value="//HARDCODEDATA//NSI_REQUEST_TYPE" xmlTag=":name:"/>
                        <layout:simple-field label="Первичность заявления" class="full radioGroup radio" required="0">
                            <layout:radio labelValue="Первичное" value="1" name="req_request__is_primary_request" valueCheckedPath="//REGUEST//IS_PRIMARY_REQUEST" checked="1" xmlTag=":name:"/>
                            <layout:radio labelValue="Повторное" value="0" name="req_request__is_primary_request" valueCheckedPath="//REGUEST//IS_PRIMARY_REQUEST" checked="0" xmlTag=":name:"/>
                        </layout:simple-field>
                        <div class="before_appeal">
                            <layout:simple-field label="Предыдущее заявление" class="medium" required="0">
                                <layout:multiselect value="//REGUEST//FK_REQ_REQUEST_PREVIOUS" limit="1" listSourceID="nsi_request_all_CON" name="req_request__fk_req_request_previous" xmlTag=":name:"/>
                                <label> </label>
                                <layout:edit type="TEXT" name="req_request_previous_nsi_service_type" value="//REGUEST//FK_REQ_REQUEST_PREVIOUS_SERVICE_TYPE"  xmlTag=":name:" readonly="1"/>
                            </layout:simple-field>
                            <layout:simple-field label="Примечание" class="full" required="0">
                                <layout:edit type="TEXTAREA" name="req_request__request_previous_comment" value="//REGUEST//REQUEST_PREVIOUS_COMMENT"  xmlTag=":name:"/>
                            </layout:simple-field>
                        </div>
                        <h3 class="header line"><span>Сведения об объекте</span></h3>
                        <layout:simple-field label="Наименование объекта" class="full" required="1">
                            <layout:edit type="TEXTAREA" value="//REGUEST//OBJECT_NAME" name="req_request__object_name" xmlTag=":name:"/>
                        </layout:simple-field>
                        <layout:simple-field label="Стадия проектирования" class="medium" required="0">
                            <layout:select name="req_request__nsi_object_stage" value="//REGUEST//NSI_OBJECT_STAGE" listSourceID="nsi_object_stage" xmlTag=":name:"/>
                        </layout:simple-field>
                        <layout:simple-field label="Вид работ" class="medium" required="0">
                            <layout:select name="req_request__nsi_object_work_type" value="//REGUEST//NSI_OBJECT_WORK_TYPE" listSourceID="nsi_object_work_type" xmlTag=":name:"/>
                        </layout:simple-field>
                        <layout:simple-field label="Функциональное назначение" class="medium" required="0">
                            <layout:select name="req_request_nsi_object_usage" value="//REGUEST//NSI_OBJECT_USAGE" listSourceID="nsi_object_usage" xmlTag=":name:"/>
                        </layout:simple-field>
                        <layout:simple-field label="Вид объекта" class="medium" required="1">
                            <layout:select name="req_request__nsi_object_type" value="//REGUEST//NSI_OBJECT_TYPE" listSourceID="nsi_object_type" xmlTag=":name:"/>
                        </layout:simple-field>
                        <layout:simple-field label="Признак уникальности" class="full" required="0">
                             <layout:multiselect value="//OBJ_UNIQUE//NSI_OBJECT_UNIQUE_TYPE" limit="100" listSourceID="nsi_object_unique_type" name="req_request__nsi_object_unique_type" xmlTag=":name:"/>
                        </layout:simple-field>
                        <layout:simple-field label="Источник финансирования" class="medium" required="1">
                            <layout:select name="req_request__nsi_object_finance" value="//REGUEST//NSI_OBJECT_FINANCE" listSourceID="nsi_object_finance" xmlTag=":name:"/>
                        </layout:simple-field>
                        <layout:simple-field label="BIM" class="full radioGroup radio" required="1">
                            <layout:radio labelValue="Да" value="1" name="req_request__is_bim" checked="0" valueCheckedPath="//REGUEST//IS_BIM" xmlTag=":name:"/>
                            <layout:radio labelValue="Нет" value="0" name="req_request__is_bim" checked="1" valueCheckedPath="//REGUEST//IS_BIM" xmlTag=":name:"/>
                        </layout:simple-field>
                        <layout:simple-field label="Номер положительного заключения государственной экологической экспертизы" class="full double_line" required="0">
                            <layout:edit type="TEXT" value="//REGUEST//ECO_EXPERT_NUMBER" name="req_request__eco_expert_number" xmlTag=":name:"/>
                        </layout:simple-field>
                        <layout:simple-field label="Дата положительного заключения государственной экологической экспертизы" class="full double_line" required="0">
                            <layout:edit type="DATE" name="req_request__eco_expert_date" value="//REGUEST//ECO_EXPERT_DATE" xmlTag=":name:"/>
                        </layout:simple-field>
                        <h3 class="header line"><span>Документы по планировке территории</span></h3>
                        <layout:simple-field label="Номер ГПЗУ" class="full" required="0">
                            <layout:edit type="TEXT" value="//REGUEST//GPZU_NUMBER" name="req_request__gpzu_number" xmlTag=":name:"/>
                        </layout:simple-field>
                        <h3 class="header line"><span>Сведения о земельно-правовых отношениях</span></h3>
                        <layout:simple-field label="Земельный участок находится" class="full  radioGroup_list radio" required="0">
                            <layout:radio labelValue="В собственности заявителя" value="1" name="req_request__is_object_owner" checked="1" valueCheckedPath="//REGUEST//IS_OBJECT_OWNER" xmlTag=":name:"/>
                            <layout:radio labelValue="В аренде/пользовании у заявителя" value="0" name="req_request__is_object_owner" checked="0" valueCheckedPath="//REGUEST//IS_OBJECT_OWNER" xmlTag=":name:"/>
                        </layout:simple-field>
                        <layout:simple-field label="Кадастровый номер" class="medium" required="0">
                            <layout:edit type="TEXT" value="//REGUEST//CADASTRAL_NUMBER" name="req_request__cadastral_number" xmlTag=":name:"/>
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
                            <layout:multiselect name="req_request__kladr_region" value="//REGUEST//KLADR_REGION" listSourceID="KLADR_LIST" paramnames="INPUT_LEVEL__INPUT_CODE" parameters="1" limit="1" xmlTag=":name:"/>
                        </layout:simple-field>

                        <layout:simple-field label="Район" class="medium" required="0">
                            <layout:multiselect name="req_request__kladr_district" value="//REGUEST//KLADR_DISTRICT" listSourceID="KLADR_LIST" paramnames="INPUT_LEVEL__INPUT_CODE" parameters="2__{$kladr1}" limit="1" xmlTag=":name:"/>
                        </layout:simple-field>
                        <layout:simple-field label="Город" class="medium" required="0">
                            <layout:multiselect name="req_request__kladr_town" value="//REGUEST//KLADR_TOWN" listSourceID="KLADR_LIST" paramnames="INPUT_LEVEL__INPUT_CODE" parameters="3__{$kladr2}" limit="1" xmlTag=":name:"/>

                        </layout:simple-field>
                        <layout:simple-field label="Нас. пункт" class="medium" required="0">
                            <layout:multiselect name="req_request__kladr_locality" value="//REGUEST//KLADR_LOCALITY" listSourceID="KLADR_LIST" paramnames="INPUT_LEVEL__INPUT_CODE" parameters="4__{$kladr3}" limit="1" xmlTag=":name:"/>

                        </layout:simple-field>
                        <layout:simple-field label="Улица" class="medium" required="0">
                            <layout:multiselect name="req_request__kladr_street" value="//REGUEST//KLADR_STREET" listSourceID="KLADR_LIST" paramnames="INPUT_LEVEL__INPUT_CODE" parameters="5__{$kladr4}" limit="1" xmlTag=":name:"/>
                        </layout:simple-field>
                        <layout:simple-field label="Дом" class="ultra_small" required="0">
                            <layout:edit type="TEXT" value="//REGUEST//HOUSE" name="req_request__house" xmlTag=":name:"/>
                            <label>Владение</label>
                            <layout:edit type="TEXT" value="//REGUEST//OWNERSHIP" name="req_request__ownership" xmlTag=":name:"/>
                            <label>Корпус</label>
                            <layout:edit type="TEXT" value="//REGUEST//HOUSING" name="req_request__housing" xmlTag=":name:"/>
                            <label>Строение</label>
                            <layout:edit type="TEXT" value="//REGUEST//BUILDING" name="req_request__building" xmlTag=":name:"/>
                        </layout:simple-field>

                        <!--layout:simple-field label="Адрес" class="full" required="0">
                            <layout:multiselect value="//MY_MULTISELECT_VALUE" limit="1" listSourceID="TEST_LIST" name="req_request_address" xmlTag=":name:"/>
                        </layout:simple-field-->
                        <layout:simple-field label="Дополнительные адресные данные" class="full double_line" required="0">
                            <layout:edit type="TEXTAREA" value="//REGUEST//ADDRESS_MORE" name="req_request_address_more" xmlTag=":name:"/>
                        </layout:simple-field>
                        <layout:simple-field label="Сформированный адрес" class="full" required="0">
                            <layout:edit type="TEXTAREA" value="//REGUEST//ADDRESS" name="req_request_combo_address" xmlTag=":name:" readonly="1"/>
                        </layout:simple-field>
                        </div>
                        <h3 class="header line"><span>Основные ТЭП</span></h3>

                        <!--layout:table class="test" style="width:100%;" add="1" move="1">
                            <layout:header>
                              <layout:cell name="Номер п/п" style="width:106px;"/>
                              <layout:cell name="Показатель" style="width:115px;"/>
                              <layout:cell name="Ед. изм." style="width:83px;"/>
                              <layout:cell name="Значение" style="width:145px;"/>

                              <layout:cell name="Примечание" style="width:297px;"/>
                            </layout:header>
                            <layout:body xmlTag="obj_parameter" value="//TEP">
                                <layout:cell style="width:106px;">
                                  <layout:edit type="TEXT"  name="obj_parameter__sort" xmlTag=":name:" value="//TEST_VALUE" style="width:96px;"/>
                                </layout:cell>
                                <layout:cell width="115" style="width:115px;">
                                  <layout:multiselect value="//MY_MULTISELECT_VALUE" limit="1" listSourceID="nsi_object_param" name="obj_parameter__nsi_object_params" xmlTag=":name:" style="width:105px;"/>
                                </layout:cell>
                                <layout:cell width="83" style="width:83px;">
                                  <layout:edit type="TEXT"  name="obj_parameter__nsi_object_params_measure" xmlTag=":name:" value="//TEST_VALUE" style="width:73px;"/>
                                </layout:cell>
                                <layout:cell width="145" style="width:145px;">
                                  <layout:edit type="TEXT"  name="obj_parameter__value_before" xmlTag=":name:" value="//TEST_VALUE" style="width:135px;"/>
                                </layout:cell>
                                <layout:cell width="297" style="width:297px;">
                                  <layout:edit type="TEXT"  name="obj_parameter__note" xmlTag=":name:" value="//TEST_VALUE" style="width:287px;"/>
                                </layout:cell>
                            </layout:body>
                          </layout:table-->
                          <layout:section select="//OBJ_PARAMETER//ROW" xmlTag="obj_parameter" class="topSection" add="1" delete="1">
                            <div class="line tep">
                            <div class="tep_left">
                                <layout:edit type="TEXT"  name="obj_parameter__sort" xmlTag=":name:" value="SORT" readonly="1" style="width:55px;"/>
                            </div>
                            <div class="tep_right">
                                <div class="tep_params">
                                    <div class="top_label">Показатель</div>
                                    <layout:multiselect value="NSI_OBJECT_PARAMETER" limit="100" listSourceID="nsi_object_param" name="obj_parameter__nsi_object_params" viewingId="57949E9FAB23443F98CA918599BCFABA" multiple="true" xmlTag=":name:" style="width:609px;" readonly="1"/>
                                    <!--layout:multiselect value="NSI_OBJECT_PARAMETER" limit="1" listSourceID="nsi_object_param" name="obj_parameter__nsi_object_params" viewingId="57949E9FAB23443F98CA918599BCFABA" bottomHierarchy="1" xmlTag=":name:" style="width:609px;"/-->
                                    <!--layout:multiselect value="NSI_OBJECT_PARAMETER" limit="1" listSourceID="nsi_object_param" name="obj_parameter__nsi_object_params" xmlTag=":name:" style="width:609px;"/-->
                                </div>
                                <div class="tep_measure triple">
                                    <div class="top_label">Ед. изм.</div>
                                    <layout:edit type="TEXT"  name="obj_parameter__nsi_object_params_measure" xmlTag=":name:" value="NSI_OP_UNITS_MEASURE" readonly="1" />
                                </div>
                                <div class="tep_value_before triple">
                                    <div class="top_label">Значение</div>
                                    <layout:edit type="TEXT"  name="obj_parameter__value_before" xmlTag=":name:" value="VALUE_BEFORE" />
                                </div>
                                <!--div class="tep_value_after triple">
                                    <div class="top_label">После экспертизы</div>
                                    <layout:edit type="TEXT"  name="obj_parameter__value_after" xmlTag=":name:" value="VALUE_AFTER" />
                                </div-->
                                <div class="tep_note">
                                    <div class="label">Примечание</div>
                                    <layout:edit type="TEXTAREA"  name="obj_parameter__note" xmlTag=":name:" value="NOTE" style="width:518px;"/>
                                </div>
                            </div>
                            </div>
                        </layout:section>

					</div>
					<div class="steps" id="step2">
						<layout:header>ШАГ 2. Сведения о заявителе и исполнителях работ</layout:header>
						<!--layout:simple-field label="Выбрать из проекта" class="full" required="0">
                            <layout:multiselect value="//MY_MULTISELECT_VALUE" limit="1" listSourceID="nsi_con_contractor" name="declarer_con_contractor_select_name" xmlTag=":name:" />

                        </layout:simple-field-->


                        <xsl:choose>
                            <xsl:when test="$DATA//DECLARANT//ID">
                                <layout:hidden name="declarer_con_contractor_select__name" value="//DECLARANT//ID" xmlTag=":name:"/>
                            </xsl:when>
                            <xsl:when test="$DATA//DECLARANT//FK_CON_CONTRACTOR">
                                <layout:hidden name="declarer_con_contractor_select__name" value="//DECLARANT//FK_CON_CONTRACTOR" xmlTag=":name:"/>
                            </xsl:when>

                        </xsl:choose>





                        <div class="ur">


                            <layout:simple-field label="Организационно-правовая форма" class="full double_line" required="0">
                                <layout:edit type="TEXT" value="//DECLARANT//COMPANY_FORM" name="con_contractor__nsi_company_form" xmlTag=":name:" readonly="1"/>
                            </layout:simple-field>
                            <layout:simple-field label="Наименование полное" class="full" required="0">
                                <layout:edit type="TEXTAREA" name="declarer_con_contractor__full_name" value="//DECLARANT//FULL_NAME" xmlTag=":name:" readonly="1"/>
                            </layout:simple-field>
                            <layout:simple-field label="Наименование краткое" class="full" required="0">
                                <layout:edit type="TEXT" name="declarer_con_contractor__name" value="//DECLARANT//NAME" xmlTag=":name:" readonly="1"/>
                            </layout:simple-field>
                            <layout:simple-field label="Юридический адрес" class="full" required="0">
                                <layout:edit type="TEXTAREA" name="declarer_con_contractor__address_legal" value="//DECLARANT//ADDRESS_LEGAL" xmlTag=":name:" readonly="1"/>
                            </layout:simple-field>
                            <layout:simple-field label="Фактический адрес" class="full" required="0">
                                <layout:edit type="TEXTAREA" name="declarer_con_contractor__address_post" value="//DECLARANT//ADDRESS_POST" xmlTag=":name:" readonly="1"/>
                            </layout:simple-field>
                            <layout:simple-field label="ИНН" class="small some_inline" required="0">
                                <layout:edit type="TEXT" value="//DECLARANT//INN" name="declarer_con_contractor__inn" xmlTag=":name:" readonly="1"/>
                                <label><!--strong class="req-star">*</strong-->КПП</label>
                                <layout:edit type="TEXT" value="//DECLARANT//KPP" name="declarer_con_contractor__kpp" xmlTag=":name:" readonly="1"/>
                            </layout:simple-field>
                            <layout:simple-field label="ОГРН" class="small some_inline" required="0">
                                <layout:edit type="TEXT" value="//DECLARANT//OGRN_NUMBER" name="declarer_con_contractor__ogrn_number" xmlTag=":name:" readonly="1"/>
                            </layout:simple-field>
                            <layout:simple-field label="ОКПО" class="small some_inline" required="0">
                                <layout:edit type="TEXT" value="//DECLARANT//OKPO" name="declarer_con_contractor__okpo" xmlTag=":name:" readonly="1"/>
                            </layout:simple-field>
                            <layout:simple-field label="Телефон, факс" class="small some_inline mask_phone" required="0">
                                <layout:edit type="TEXT" value="//DECLARANT//PHONE" name="declarer_con_contractor__phone" xmlTag=":name:" readonly="1"/>
                            </layout:simple-field>
                            <layout:simple-field label="Электронная почта" class="medium mask_email" required="0">
                                <layout:edit type="EMAIL" value="//DECLARANT//EMAIL" name="declarer_con_contractor__email" xmlTag=":name:" readonly="1"/>
                            </layout:simple-field>

                            <h3 class="header line"><span>Банковские реквизиты</span></h3>
                                <layout:simple-field label="Наименование реквизитов" class="full" required="0">
                                    <!--layout:select name="declarer_con_bank_account__name" value="//ORG_ACCOUNTS//ID" listSourceID="nsi_request_type" xmlTag=":name:"/-->
                                    <select id="bank_select" name="declarer_con_bank_account_select_name" xmlTag=":name:">
                                        <option value="">Не выбрано</option>
                                        <xsl:for-each select="//ORG_ACCOUNTS//ROW">
                                            <option value="{ID}"><xsl:value-of select="NAME"/></option>
                                        </xsl:for-each>
                                    </select>
                                </layout:simple-field>
                                <div class="bank_show">
                                    <layout:iterator select="//ORG_ACCOUNTS//ROW">
                                        <div id="">
                                            <layout:hidden name="id" value="ID"/>
                                            <layout:simple-field label="Отделение банка" class="medium" required="0">
                                                <layout:edit type="TEXTAREA" value="BANK_NAME" name="declarer_con_bank_account__bank_name" xmlTag=":name:" readonly="1"/>
                                            </layout:simple-field>
                                            <layout:simple-field label="Адрес банка" class="medium" required="0">
                                                <layout:edit type="TEXTAREA" value="BANK_ADDRESS" name="declarer_con_bank_account__bank_address" xmlTag=":name:" readonly="1"/>
                                            </layout:simple-field>
                                            <layout:simple-field label="БИК" class="small number_9" required="0">
                                                <layout:edit type="TEXT" value="BANK_BIC" name="declarer_con_bank_account__bank_bik" xmlTag=":name:" readonly="1"/>
                                            </layout:simple-field>
                                            <layout:simple-field label="Расчётный счет" class="medium" required="0">
                                                <layout:edit type="TEXT" value="ACCOUNT_SET" name="declarer_con_bank_account__bank_account_set" xmlTag=":name:" readonly="1"/>
                                            </layout:simple-field>
                                            <layout:simple-field label="Корреспондентский счет" class="medium" required="0">
                                                 <layout:edit type="TEXT" value="ACCOUNT_COR" name="declarer_con_bank_account__bank_account_cor" xmlTag=":name:" readonly="1"/>
                                            </layout:simple-field>
                                        </div>
                                    </layout:iterator>
                                </div>





                            <h3 class="header line"><span>Представитель</span></h3>

                                <layout:simple-field label="ФИО" class="medium" required="0">
                                    <!--layout:multiselect value="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE='DECLARANT']/FK_CON_PERSON" limit="1" listSourceID="nsi_con_contractor" name="declarer_con_person__name" xmlTag=":name:"/-->
                                    <select id="pers_select"  name="declarer_con_person_select_name" xmlTag=":name:">
                                        <option value="">Не выбрано</option>
                                        <xsl:for-each select="//ORG_PERS//ROW">
                                            <option value="{PERS_ID}"><xsl:value-of select="PERS_NAME"/></option>
                                        </xsl:for-each>
                                    </select>
                                </layout:simple-field>
                                <div class="pers_show">
                                    <layout:iterator select="//ORG_PERS//ROW">
                                        <div id="">
                                            <layout:hidden name="id" value="PERS_ID"/>
                                            <layout:simple-field label="Должность" class="full" required="0">
                                                <layout:edit type="TEXT" value="PERS_POST" name="declarer_con_person__post" xmlTag=":name:" readonly="1"/>
                                            </layout:simple-field>
                                            <layout:simple-field label="Тип документа" class="medium" required="0">
                                                <layout:edit type="TEXT" name="declarer_req_expert_member__fk_exp_person" value="PERS_NSI_PERSON_DOCUMENT" xmlTag=":name:" readonly="1"/>
                                            </layout:simple-field>
                                            <layout:simple-field label="Серия и номер" class="small" required="0">
                                                <layout:edit type="TEXT" value="PERS_DOC_SERIAL" name="declarer_con_person__doc_serial" xmlTag=":name:" readonly="1"/>
                                                <label>  </label>
                                                <layout:edit type="TEXT" value="PERS_DOC_NUMBER" name="declarer_con_person__doc_serial" xmlTag=":name:" readonly="1"/>
                                            </layout:simple-field>
                                            <layout:simple-field label="Когда выдан" class="medium" required="0">
                                                <layout:edit type="DATE" name="declarer_con_person__doc_reg_date" value="PERS_DOC_DATE" xmlTag=":name:" readonly="1"/>
                                            </layout:simple-field>
                                            <layout:simple-field label="Кем выдан" class="full" required="0">
                                                <layout:edit type="TEXT" value="PERS_DOC_ORGAN" name="declarer_con_person__doc_reg_organ" xmlTag=":name:" readonly="1"/>
                                            </layout:simple-field>
                                            <layout:simple-field label="Телефон" class="small some_inline mask_phone" required="0">
                                                <layout:edit type="TEXT" value="PERS_PHONE" name="declarer_con_person__phone" xmlTag=":name:" readonly="1"/>
                                            </layout:simple-field>
                                            <layout:simple-field label="Электронная почта" class="medium mask_email" required="0">
                                                <layout:edit type="EMAIL" value="PERS_EMAIL" name="declarer_con_person__email" xmlTag=":name:" readonly="1"/>
                                            </layout:simple-field>
                                        </div>
                                    </layout:iterator>
                                </div>

                        </div>
                        <!--div class="fiz" name="fiz" xmlTag=":name:" style="display: none">


                            <layout:simple-field label="ФИО" class="medium" required="0">
                                <layout:select name="declarer_con_person__name_fiz" value="//MY_LIST_VALUE" listSourceID="nsi_con_contractor" xmlTag=":name:"/>

                            </layout:simple-field>
                            <layout:simple-field label="ИНН" class="small some_inline" required="1">
                                <layout:edit type="TEXT" value="//TEST_VALUE" name="con_contractor__inn_fiz" xmlTag=":name:" readonly="1"/>
                                <label>СНИЛС</label>
                                <layout:edit type="TEXT" value="//TEST_VALUE" name="declarer_con_person__snils_number_fiz" xmlTag=":name:" readonly="1"/>
                            </layout:simple-field>

                            <layout:simple-field label="Тип документа" class="medium" required="0">
                                <layout:edit type="TEXT" value="//TEST_VALUE" name="con_contractor__inn_fiz" xmlTag=":name:" readonly="1"/>
                            </layout:simple-field>
                            <layout:simple-field label="Серия и номер" class="small" required="0">
                                <layout:edit type="TEXT" value="//TEST_VALUE" name="declarer_con_person__doc_serial_fiz" xmlTag=":name:" readonly="1"/>
                                <label>  </label>
                                <layout:edit type="TEXT" value="declarer_con_person__doc_serial_fiz" xmlTag=":name:" readonly="1"/>
                            </layout:simple-field>
                            <layout:simple-field label="Когда выдан" class="medium" required="0">
                                <layout:edit type="DATE" name="declarer_con_person__doc_reg_date_fiz" value="//TEST_VALUE" xmlTag=":name:" readonly="1"/>
                            </layout:simple-field>
                            <layout:simple-field label="Кем выдан" class="medium" required="0">
                                <layout:edit type="TEXT" value="//TEST_VALUE" name="declarer_con_person__doc_reg_organ_fiz" xmlTag=":name:" readonly="1"/>
                            </layout:simple-field>

                        <h3 class="header line"><span>Банковские реквизиты</span></h3>
                          	<layout:simple-field label="Наименование реквизитов" class="medium" required="0">
                                    <layout:select name="declarer_con_bank_account__name" value="//MY_LIST_VALUE" listSourceID="nsi_request_type" xmlTag=":name:"/>
                                </layout:simple-field>
                            <layout:simple-field label="Отделение банка" class="medium" required="0">
                                    <layout:edit type="TEXTAREA" value="//TEST_VALUE" name="declarer_con_bank_account__bank_name_fiz" xmlTag=":name:" readonly="1"/>
                                </layout:simple-field>

                                <layout:simple-field label="БИК" class="small number_9" required="0">
                                    <layout:edit type="TEXT" value="//TEST_VALUE" name="declarer_con_bank_account__bank_bik_fiz" xmlTag=":name:" readonly="1"/>
                                </layout:simple-field>
                                <layout:simple-field label="Расчётный счет" class="medium" required="0">
                                    <layout:edit type="TEXT" value="//TEST_VALUE" name="declarer_con_bank_account__bank_account_set_fiz" xmlTag=":name:" readonly="1"/>
                                </layout:simple-field>
                                <layout:simple-field label="Корреспондентский счет" class="medium" required="0">
                                     <layout:edit type="TEXT" value="//TEST_VALUE" name="declarer_con_bank_account__bank_account_cor_fiz" xmlTag=":name:" readonly="1"/>
                                </layout:simple-field>

                        </div-->
						<h3 class="header line"><span>Участники проекта</span></h3>
						<layout:section label="Участник проекта" xmlTag="members" class="topSection" select="//CONTRACTOR_MEMBER//ROW[NSI_COMPANY_ROLE!='DECLARANT']" add="1">
                            <layout:hidden name="member_con_contractor_select__name" value="FK_CON_CONTRACTOR" xmlTag=":name:"/>
                            <div class="member">
                            <layout:simple-field label="" class="full radioGroup_list radio" required="0">
                                <layout:radio labelValue="Юридическое лицо" value="ЮЛ" name="member_con_contractor__nsi_company_form" checked="1" xmlTag=":name:"/>
                                <layout:radio labelValue="Индивидуальный предприниматель" value="ИП" name="member_con_contractor__nsi_company_form" checked="0" xmlTag=":name:"/>
                            </layout:simple-field>
                            <layout:simple-field label="Роль организации" class="medium role_selector" required="1">
                                <layout:select name="member_req_contractor_member__nsi_company_role" value="NSI_COMPANY_ROLE" listSourceID="nsi_company_role" xmlTag=":name:"/>
                            </layout:simple-field>
                            <layout:simple-field label="Наименование полное" class="full" required="1">
                                <layout:edit type="TEXTAREA" name="member_con_contractor__full_name" value="FULL_NAME" xmlTag=":name:"/>
                            </layout:simple-field>
                            <layout:simple-field label="Наименование краткое" class="full" required="0">
                                <layout:edit type="TEXT" name="member_con_contractor__name" value="NAME" xmlTag=":name:"/>
                            </layout:simple-field>
                            <layout:simple-field label="Юридический адрес" class="full" required="0">
                                <layout:edit type="TEXTAREA" name="member_con_contractor__address_legal" value="ADDRESS_LEGAL" xmlTag=":name:"/>
                            </layout:simple-field>
                            <layout:simple-field label="Фактический адрес" class="full" required="0">
                                <layout:edit type="TEXTAREA" name="member_con_contractor__address_post" value="ADDRESS_POST" xmlTag=":name:"/>
                            </layout:simple-field>
                            <layout:simple-field label="ИНН" class="small some_inline" required="1">
                                <layout:edit type="TEXT" value="INN" name="member_con_contractor__inn" xmlTag=":name:"/>
                                <label><strong class="req-star">*</strong> КПП</label>
                                <layout:edit type="TEXT" value="KPP" name="member_con_contractor__kpp" xmlTag=":name:"/>
                            </layout:simple-field>
                            <layout:simple-field label="ОГРН" class="small some_inline" required="0">
                                <layout:edit type="TEXT" value="OGRN_NUMBER" name="member_con_contractor__ogrn_number" xmlTag=":name:"/>
                                <label>ОКПО</label>
                                <layout:edit type="TEXT" value="OKPO" name="member_con_contractor__okpo" xmlTag=":name:"/>
                            </layout:simple-field>
                            <layout:simple-field label="Телефон" class="small some_inline mask_phone" required="0">
                                <layout:edit type="TEXT" value="PHONE" name="member_con_contractor__phone" xmlTag=":name:"/>
                            </layout:simple-field>
                            <layout:simple-field label="Электронная почта" class="medium mask_email" required="0">
                                <layout:edit type="EMAIL" value="EMAIL" name="member_con_contractor__email" xmlTag=":name:"/>
                            </layout:simple-field>

                            <!--h3 class="header line"><span>Банковские реквизиты</span></h3>

                                <layout:simple-field label="Наименование реквизитов" class="medium" required="1">

                                    <layout:select name="member_requizit_name" value="//MY_LIST_VALUE" listSourceID="nsi_request_type" xmlTag=":name:"/>
                                </layout:simple-field>
                                <layout:simple-field label="Адрес банка" class="medium" required="1">
                                    <layout:edit type="TEXTAREA" value="//TEST_VALUE" name="member_con_bank_account__bank_adress" xmlTag=":name:"/>
                                </layout:simple-field>
                                <layout:simple-field label="Отделение банка" class="medium" required="1">
                                    <layout:edit type="TEXTAREA" value="//TEST_VALUE" name="member_con_bank_account__bank_name" xmlTag=":name:"/>
                                </layout:simple-field>

                                <layout:simple-field label="БИК" class="small number_9" required="0">
                                    <layout:edit type="TEXT" value="//TEST_VALUE" name="member_con_bank_account__bank_bik" xmlTag=":name:"/>
                                </layout:simple-field>
                                <layout:simple-field label="Расчётный счет" class="medium" required="1">
                                    <layout:edit type="TEXT" value="//TEST_VALUE" name="member_con_bank_account__bank_account_set" xmlTag=":name:"/>
                                </layout:simple-field>
                                <layout:simple-field label="Корреспондентский счет" class="medium" required="0">
                                     <layout:edit type="TEXT" value="//TEST_VALUE" name="member_con_bank_account__bank_account_cor" xmlTag=":name:"/>
                                </layout:simple-field-->

                            <!--h3 class="header line"><span>Представитель</span></h3>

                                <layout:simple-field label="ФИО" class="medium" required="0">
                                    <layout:edit type="TEXT" value="//TEST_VALUE" name="member_con_person__name" xmlTag=":name:"/>

                                </layout:simple-field>
                                <layout:simple-field label="Фамилия" class="medium" required="1">
                                    <layout:edit type="TEXT" value="//TEST_VALUE" name="member_con_person__last_name" xmlTag=":name:"/>
                                    </layout:simple-field>
                                    <layout:simple-field label="Имя" class="medium" required="1">
                                        <layout:edit type="TEXT" value="//TEST_VALUE" name="member_con_person__first_name" xmlTag=":name:"/>
                                    </layout:simple-field>
                                    <layout:simple-field label="Отчество" class="medium" required="1">
                                        <layout:edit type="TEXT" value="//TEST_VALUE" name="member_con_person__middle_name" xmlTag=":name:"/>
                                    </layout:simple-field>
                                <layout:simple-field label="Должность" class="medium" required="1">
                                    <layout:edit type="TEXT" value="//TEST_VALUE" name="member_con_person__post" xmlTag=":name:"/>
                                </layout:simple-field>
                                <layout:simple-field label="Действует на основании" class="medium" required="0">
                                    <layout:edit type="TEXT" value="//TEST_VALUE" name="member_con_person__doc_proxy" xmlTag=":name:"/>
                                </layout:simple-field>

                                <layout:simple-field label="Телефон" class="small some_inline mask_phone" required="0">
                                    <layout:edit type="TEXT" value="//TEST_VALUE" name="member_con_person__phone" xmlTag=":name:"/>
                                </layout:simple-field>
                                <layout:simple-field label="Электронная почта" class="medium mask_email" required="0">
                                    <layout:edit type="EMAIL" value="//TEST_VALUE" name="member_con_person__email" xmlTag=":name:"/>
                                </layout:simple-field-->
                            <div class="project_org">

                                <layout:simple-field label="ГИП/Телефон" class="medium" required="0">
                                    <layout:edit type="TEXT" value="//TEST_VALUE" name="member_con_contractor__phone_gip" xmlTag=":name:"/>
                                </layout:simple-field>
                                <layout:simple-field label="ГАП/Телефон" class="medium" required="0">
                                    <layout:edit type="TEXT" value="//TEST_VALUE" name="member_con_contractor__phone_gap" xmlTag=":name:"/>
                                </layout:simple-field>
                                <layout:simple-field label="Примечание" class="full" required="0">
                                    <layout:edit type="TEXTAREA" value="//TEST_VALUE" name="member_con_contractor__note" xmlTag=":name:"/>
                                </layout:simple-field>
                                <div class="line narrow">
                                    <div class="top_label">Реквизиты свидетельства о допуске к видам работ по подготовке проектной документации и (или) по инженерным изысканиям, выданного саморегулируемой организацией</div>
                                    <layout:edit type="TEXTAREA" value="//TEST_VALUE" name="member_con_contractor__doc_sro" style="height: 75px;width: 100%;border: 1px solid #D9DBDD;border-radius: 2px;" xmlTag=":name:"/>
                                </div>
                                <div class="line narrow">
                                    <div class="top_label">Файлы свидетельства о допуске к видам  работ по подготовке проектной документации и (или) по инженерным изысканиям, выданного саморегулируемой организацией</div>
                                    <layout:file value="Загрузить" id="member_con_contractor__folder_id_spo" pre_files="FILE_COMBO_LINE" xmlTag=":name:"/>
                                </div>
                            </div>
                            <script>$(function(){
                                all_masks();
                                addFieldsActivate();

                                });</script>
                            </div>
                        </layout:section>
					</div>
					<div class="steps" id="step3">
						<layout:header>ШАГ 3. Согласие с условиями предоставления услуги</layout:header>
						<h3 class="header line"><span>Способ получения результата</span></h3>
						<layout:simple-field label="" class="small checkBox" required="0">
                            <div class="one_must_be">
                                <layout:checkbox forceCheckbox="1" label="Получить лично (на бумажном носителе)" name="req_request__is_result_offline" valueXPATH="//IS_RESULT_OFFLINE" valueChecked="1" xmlTag=":name:"/>
                                <layout:checkbox forceCheckbox="1" label="Получить в электронном виде" name="req_request__is_result_online" valueXPATH="//IS_RESULT_ONLINE" valueChecked="1" xmlTag=":name:"/>
                            </div>
                        </layout:simple-field>
						<h3 class="header line"><span>Согласие с условиями предоставления услуги</span></h3>
                        <layout:simple-field label="" class="full double_line checkBox" required="1">
                            <layout:checkbox forceCheckbox="1" label="Согласен на обработку персональных данных в соответствии со статьёй 9 Федерального закона №152-ФЗ" name="" value="test" valueChecked=""/>
                        </layout:simple-field>
						<layout:simple-field label="Информирование об изменениях" class="full double_line checkBox" required="1">
                            <layout:checkbox forceCheckbox="1" label="Обязуюсь сообщать обо всех изменениях, связанных с представленными в настоящем заявлении документами и сведениями" name="" value="test" valueChecked=""/>
                        </layout:simple-field>
                        <layout:simple-field label="Ответственность за сведения" class="full double_line checkBox" required="1">
                            <layout:checkbox forceCheckbox="1" label="Я ознакомлен с правилами предоставления государственной услуги и как заявитель несу ответственность за полноту и достоверность представленных сведений" name="" value="test" valueChecked=""/>
                        </layout:simple-field>
                        <layout:simple-field label="Отсутствие секретности" class="full double_line checkBox" required="1">
                            <layout:checkbox forceCheckbox="1" label="Подтверждаю, что переданная мной проектная документация и (или) результаты инженерных изысканий не содержат сведения, доступ к которым ограничен в соответствии с законодательством Российской Федерации" name="" value="test" valueChecked=""/>
                        </layout:simple-field>

                    </div>
                    <div class="steps" id="step4">
                        <layout:header>ШАГ 4. Загрузка проектной документации</layout:header>
                        <h3 class="header line"><span>Загрузить Проектную документацию</span></h3>
                        <div class="double_line centered">
                            <p>Проектная документация на объект капитального строительства, соответствующая требованиям Постановления Правительства Российской Федерации от 16.02.2008 г. N 87</p>
                            <input type="button" class="form_button loadDocs" value="Перейти к загрузке"/>
                        </div>
                        <!--layout:simple-field label="" class="full double_line centered" required="0">

                        </layout:simple-field-->

                        <h3 class="header line"><span>Отправить документы на экспертизу</span></h3>
                        <div class="double_line centered">
                            <p style="color: red; text-align: center; font-weight: bold;">Внимание!</p>
                            <p>Перед отправкой заявления проверьте правильность заполнения формы и наличие загруженных файлов проектной документации.</p>
                        </div>


					</div>
					<div class="formFooter">
                        <div class="leftBlock">
                            <a class="prevButton">Назад</a>
                        </div>
                        <div class="rightBlock">
                            <!--div class="disclaimer">Вы можете сохранить страницу — введённые данные сохранятся для последующего заполнения форм</div-->

                            <input type="button" class="form_button closeButton" value="Отмена"/><input type="button" class="form_button saveCloseButton" value="Сохранить как черновик"/><input type="button" class="form_button saveButton" value="Применить"/>
                            <input type="button" class="form_button nextButton" value="Далее"/>
                            <input type="button" class="form_button fileExistAction" value="Отправить на экспертизу"/>
                        </div>
                    </div>
				</layout:form>
                <div class="hide">
                    <div class="popup" id="nofiles">
                        <p>Файлы проектной документации не загружены. Вы уверены, что хотите отправить заявление на экспертизу?</p>
                        <input type="button" class="form_button agree" value="Да"/><input type="button" class="form_button cancel" value="Нет"/>
                    </div>
                    <!--div class="popup" id="success">
                        <p>Заявление успешно отправлено</p>
                        <input type="button" class="form_button" value="ОК"/>
                    </div-->
                </div>
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

    function dateMask(){
      $.mask.definitions['m'] = "[0-1]";
      $.mask.definitions['d'] = "[0-3]";
      $('input.date').mask("d9.m9.9999");
    }

      function all_masks(){
        /*dateMask();*/
        number_mask($('.number_9 input[type="text"]'), 9);
        number_mask($('.number_24 input[type="text"]'), 24);
        $('.mask_phone input[type="text"]:not(.maskApplied)').mask("+7(999) 999-99-99").addClass('maskApplied');
        $('.sectionTemplate .mask_phone input[type="text"]').removeClass('maskApplied');
        $('.mask_email input[type="email"]').focusout(function(){
            if (!/(.*)@(.[^.]*).(.*)/ig.test($(this).val())){
                /*alert('Некорректный e-mail');*/

            }
        });

        $('.money input[type="text"]').keyup(function(eventObject){
                $(this).val($(this).val().replace(/(\D+)/g, ''));
              });
        }



        function stepToStep(stepNum){
            var this_step = $('.frmAppeal_steps li').eq(stepNum);
            $('.steps').hide();
            $('#'+this_step.attr('data-content-block')).show();
            $('.frmAppeal_steps__current').removeClass('frmAppeal_steps__current');
            this_step.addClass('frmAppeal_steps__current');
            current_step = this_step.attr('data-step-number')-0;
            this_step.nextAll().removeClass('frmAppeal_steps__checked');
            this_step.prevAll().addClass('frmAppeal_steps__checked');
            /*
            $('.frmAppeal_steps li.frmAppeal_steps__checked').click(function(){
                if ($(this).hasClass('frmAppeal_steps__checked')){
                    stepToStep($(this).attr('data-step-number')-0);
                    console.log($(this).attr('data-step-number')-0);
                }

            });*/
        }
        function saveForm(form){
            /*var xmlAsString = '';
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
                .error(function(data){
                    console.log(data);
                    alert('status: '+data.status+' | responseText: '+data.responseText);
                });
            })
            .error(function(data){
                alert(data);
            });*/
        }
        function addFieldsActivate(){
            $('.addNewOrg:not(.processed)').each(function(indx, elm){
                $(this).addClass('processed');
                var linkedBlock = $(this).parents('.fields_selector').siblings('.full_fields_list');
                linkedBlock.attr('data-linked-block', fieldActivateIteration.toString()+indx);
                if ($('form+.hide').length<1){
                    $('form').after('<div class="hide"/>');
                }
                $('form+.hide').append(linkedBlock);
                $(elm).attr('data-linked-block', fieldActivateIteration.toString()+indx);
            })
            .click(function(){
                var linkedBlock = $('.full_fields_list[data-linked-block="'+$(this).attr('data-linked-block')+'"]');
                if ($(this).hasClass('pressed')){
                    $(this).removeClass('pressed');
                    $('form+.hide').append(linkedBlock);
                }else{
                    $(this).addClass('pressed');
                    $(this).parents('.fields_selector').after(linkedBlock);
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

            console.log(t);
            console.log(urlLink);
            if (t.closest('.row').find('select').length){
                console.log(t.closest('.row').find('select'));
                t.closest('.row').find('select').customSelectRefresh({url: urlLink});
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

            if (item.extraFields && item.extraFields.servicetype){
                t.parents('.line ').find('[name="req_request_previous_nsi_service_type"]').val(item.extraFields.servicetype);
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
                        /*$(elm).attr('data-parameters', parametersArr.join('__'));*/
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
            /*$('.role_selector select:not(.eventsApplied)').each(function(indx, elm){
                $(elm).change(function(){
                    var thisValue = $(this).find(':selected').val(),
                        relatedBlock = $(this).closest('.member').find('.project_org');

                    if (thisValue=='GEN' || thisValue=='RESEARCH' || thisValue=='SUB'){
                        relatedBlock.show();
                    }
                    else{
                        relatedBlock.hide();
                    }
                });
                $(elm).addClass('eventsApplied').change();
            });*/
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

        function allStepValidation(execFunction){
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
            if (!(validateArr.indexOf(false)+1)){
                $('.saveCloseButton').removeClass('disable');
                $('.saveButton').removeClass('disable');
                execFunction();
            }else{
                $('.saveCloseButton').addClass('disable');
                $('.saveButton').addClass('disable');
                $(document).scrollTop($('.redField').offset().top);
            }
        }

        $(function(){
            /* KLADR Action */
            makeSelectKladr();
            $('.hide').append($('[name="flagId"]'));

            $('.kladr input, .kladr textarea').change(function(){
              makeAdressLine();
            });
            /* endof KLADR Action */
            if ($('[name="req_request__is_deleted"]').val()==0){
                $('.saveCloseButton').val('Сохранить');
            }

            $(document).on('change', '[data-name="obj_parameter__nsi_object_params"]', function(){
                /*console.log('changed');
                console.log($(this).tokenInput('get'))*/
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
                    /*console.log(data);*/
                    var trueResult = [];
                    data.forEach(function(item, i, arr){
                        /*console.log(item);*/
                        if (item.extraFields.object_leaf=='0'){
                            trueResult.push(item);
                        }
                    });
                    /*console.log(trueResult);*/
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


            $('input, textarea').each(function(indx, elm){
                if ($(elm).attr('readonly')){
                    $(elm).addClass('readOnly');
                }
            });

            $('.bank_show>div').each(function(indx, elm){
                $(elm).attr('id', $(elm).find('[name="id"]').val());
            });
            $('.hide').append($('.bank_show>div'));
            $('#bank_select').change(function(){
                console.log($(this).val());
                $('.hide').append($('.bank_show>div'));
                $('.bank_show').append($('#'+$(this).val()));
            });

            $('.pers_show>div').each(function(indx, elm){
                $(elm).attr('id', $(elm).find('[name="id"]').val());
            });
            $('.hide').append($('.pers_show>div'));
            $('#pers_select').change(function(){
                console.log($(this).val());
                $('.hide').append($('.pers_show>div'));
                $('.pers_show').append($('#'+$(this).val()));
            });


            roleShower();
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

            $(document).on('click', '.frmAppeal_steps li.frmAppeal_steps__checked', function(){
                stepToStep($(this).attr('data-step-number')-0);
                console.log($(this).attr('data-step-number')-0);
                $('.nextButton').show();
                $('.fileExistAction').hide();
            });


            $('.closeButton').click(function(){
                window.close();
            });
            $('.saveCloseButton').click(function(){
                allStepValidation(function(){
                    $('[name="req_request__nsi_request_status"]').val('PROJECT');
                    saveFormUniversal(thisForm, {success: function(){window.close();}});
                });
            });
            $('.saveButton').click(function(){
                allStepValidation(function(){
                    $('[name="req_request__nsi_request_status"]').val('PROJECT');
                    saveFormUniversal(thisForm);
                });

            });

            $('.nextButton').click(function(){
                if (current_step<=max_steps){
                    if (step_validate($('#step'+(current_step+1))).result){
                        $(this).removeClass('notValidate');
                        makeFileXmlTag($('#step'+(current_step+1)));
                        if (current_step!=max_steps){
                            stepToStep(current_step+1);
                            if (current_step==max_steps){
                                $('.nextButton').hide();
                                $('.fileExistAction').show();
                            } else {

                            }
                        } else {
                            /*saveForm(thisForm);*/
                            /*saveFormUniversal(thisForm, {success: callFileLoader})*/
                        }
                    }else{
                        $(this).addClass('notValidate');
                        $(document).scrollTop($('.redField').offset().top);
                    }
                }
            });
            $('.prevButton').click(function(){
                if (current_step!=0){
                    $('.frmAppeal_steps li').eq(current_step-1).click();
                    $('.nextButton').show();
                    $('.fileExistAction').hide();
                }
            });

            $('.loadDocs').click(function(){
                saveFormUniversal(thisForm, {success: callFileLoaderNewWindow})
            });
            $(document).on('hover', '.fileExistAction', function(){
                var $thisButton = $(this);
                if ($('[name="documentId"]').val().length){
                    $(this).removeClass('disable');
                }else{
                    $(this).removeClass('disable');
                    if (!$thisButton.hasClass('processing')){
                        $thisButton.addClass('processing');
                        $('[name="req_request__nsi_request_status"]').val('PROJECT');

                        saveFormUniversal($('form').eq(0), false, {success: function(){$thisButton.removeClass('processing');}});

                        /*saveFormUniversal(thisForm,
                                    {success: function(){
                                        saveFormUniversal(thisForm, false, {success: function(){$thisButton.removeClass('processing');}});
                                    }},
                                {success: function(){}}, '/customactions/openTaskObr.action');*/
                    }


                }
            });
            $('.fileExistAction:not(.processing)').click(function(){
                console.log('DocumentID: '+$('[name="documentId"]').val());
                if ($('[name="documentId"]').val().length){
                    $.ajax({
                    url: '/customactions/fileCount.action',
                    type: 'POST',
                    data: {
                        documentId: $('[name="documentId"]').val()
                    }

                    })
                    .success(function(data){
                        console.log(data);


                        if (data.data<1){
                            $.colorbox({inline:true, href:"#nofiles",  width:"500px", height: "200px"});
                            $('#nofiles .cancel').click(function(){
                                $.colorbox.close();
                            });
                            $('#nofiles .agree').click(function(){
                                $('[name="req_request__nsi_request_status"]').val('REQUEST_NEW');
                                $('[name="req_request__is_deleted"]').val('0');
                                $('form').append($('[name="flagId"]'));

                                /*saveFormUniversal($('form').eq(0), false, {success: function(){}}, '/customactions/openTaskObr.action');
                                saveFormUniversal(thisForm, {success: function(){window.close()}}, {success: function(){
                                        defaultSuccessModal('Заявление успешно отправлено')
                                        }
                                    });*/
                                saveFormUniversal(thisForm,
                                    {success: function(){

                                    saveFormUniversal(thisForm, {success: function(){window.close();}}, {success: function(){}}, '/customactions/openTaskBtn.action');

                                    /*window.close();*/
                                }
                                }, {success: function(){defaultSuccessModal('Заявление успешно отправлено')}});


                                });
                        } else {
                            $('[name="req_request__nsi_request_status"]').val('REQUEST_NEW');
                            $('[name="req_request__is_deleted"]').val('0');
                            $('form').append($('[name="flagId"]'));
                            saveFormUniversal(thisForm,
                                {success: function(){

                                saveFormUniversal(thisForm, {success: function(){window.close();}}, {success: function(){}}, '/customactions/openTaskBtn.action');

                                    /*window.close();*/
                            }
                            }, {success: function(){defaultSuccessModal('Заявление успешно отправлено')}});
                        }
                    })
                    .error(function(data){
                        console.log(data);
                    });
                }

            });

            /*
            $('.ur_fiz [type="radio"]').each(function(indx, elm){
                $(elm).attr('data-count', indx);
            })
            .click(function(){
                var num = $(this).attr('data-count')-0;
                console.log(num);
                if (num>1){
                    $('.ur').hide();
                    if ($('.ur .addNewOrg').hasClass('pressed')){
                        $('.ur .addNewOrg').click();
                    }
                    $('.fiz').show();
                }else{
                    $('.fiz').hide();
                    if ($('.fiz .addNewOrg').hasClass('pressed')){
                        $('.fiz .addNewOrg').click();
                    }
                    $('.ur').show();
                }
            });
            $('.ur_fiz [type="radio"]').eq(0).click();
			*/

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
            $('.radioGroup input[type="radio"]').click(function(){
                if( $(this).val() == '0'){
                    $(this).closest('.radioGroup').siblings('.before_appeal').show();
                }else{
                    $(this).closest('.radioGroup').siblings('.before_appeal').hide();
                }
            });
            $('.radioGroup input[type="radio"]:checked').each(function(indx, elm){
               $(elm).click();
            });
            $('.radioGroup input[type="radio"]:checked').eq(0).click();
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
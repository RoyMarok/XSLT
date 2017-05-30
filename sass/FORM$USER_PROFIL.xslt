<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:layout="URN:html-form-layout:v0.1" xmlns="http://www.w3.org/1999/xhtml" xmlns:ex2="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLTExtension" xmlns:ctx="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLDataContext" xmlns:gbu="http://xmlns.oracle.com/MSG_GBU_doc">
<xsl:output method="html" indent="yes" omit-xml-declaration="yes" undeclare-prefixes="yes" exclude-result-prefixes="#all"/>
<xsl:variable name="DATA">
    <ROOT xmlns="">
    <xsl:copy-of select="/"/>
    </ROOT>
</xsl:variable>
<xsl:variable name="STYLES">
    {B{FRM$XML_LAYOUT$V0.1-2PANEL_STYLES}E}
    <style>
    .line {
        width: 905px;
    }
    .frmProfil_content{
        width: 956px;
        margin: 0 auto;
        overflow: hidden;
        border-radius: 5px;
        border-width: 1px;
        border-style: solid;
        border-color: rgba(215, 216, 219, 1);
    }
    .formContent{
        overflow: hidden;
    }
    .formContent .line .inputWrap input.readOnly + img{
        background-color: #f7f7f7;
    }
    h3.header:before{
        width: 956px;
    }
    .rightBlock{
        float: right;
    }
    .formFooter{
        padding: 20px;
    }
    .formFooter:before {
        content: '';
        width: 850px;
        width: 110%;
        position: absolute;
        height: 250%;
        background-color: #fafbfc;
        border-top: 1px solid #d7d8db;
        z-index: 10;
        margin: 0;
        margin-left: -5%;
        margin-top: -3%;
        }
    </style>
</xsl:variable>
<xsl:variable name="LAYOUT">
    <div class="frmProfil_content">
        <layout:form action="/customactions/profileSave.action" xmlTag="request">
            <layout:hidden name="documentId" value="//CON_PERSON//FK_CON_CONTRACTOR" xmlTag=":name:"/>

                <xsl:choose>
                    <xsl:when test="//CON_PERSON//FK_CON_CONTRACTOR">
            <div class="formContent">
                <layout:header>Профиль пользователя</layout:header>
                <layout:simple-field label="" class="full radioGroup_list radio ur_fiz" required="0">
                    <layout:radio labelValue="Юридическое лицо" value="ur" name="con_contractor_nsi_company_form" checked="1" xmlTag=":name:"/>
                    <layout:radio labelValue="Индивидуальный предприниматель" value="ip" name="con_contractor_nsi_company_form" checked="0" xmlTag=":name:"/>
                    <layout:radio labelValue="Физическое лицо" value="fiz" name="con_contractor_nsi_company_form" checked="0" xmlTag=":name:"/>
                    <!--layout:hidden value="//MY_LIST_VALUE" name="is_primary_request" xmlTag=":name:"/-->
                </layout:simple-field>
                <layout:simple-field label="" class="full  checkBox" required="1">
                        <layout:checkbox forceCheckbox="1" label="Согласен на обработку персональных данных в соответствии со статьёй 9 Федерального закона 152-ФЗ" name="fz152_9_agree" value="0" valueChecked="1"/>
                    </layout:simple-field>
                <h3 class="header line"><span>Идентификационные сведения представителя</span></h3>
                <layout:simple-field label="Фамилия" class="medium" required="0">
                    <layout:edit type="TEXT" value="//CON_PERSON//LAST_NAME" name="con_person__last_name" readonly="1" xmlTag=":name:"/>
                </layout:simple-field>
                <layout:simple-field label="Имя" class="medium" required="0">
                    <layout:edit type="TEXT" value="//CON_PERSON//FIRST_NAME" name="con_person__first_name" readonly="1" xmlTag=":name:"/>
                </layout:simple-field>
                <layout:simple-field label="Отчество" class="medium" required="0">
                    <layout:edit type="TEXT" value="//CON_PERSON//MIDDLE_NAME" name="con_person__middle_name" readonly="1" xmlTag=":name:"/>
                </layout:simple-field>
                <layout:simple-field label="ИНН" class="small some_inline" required="0">
                    <layout:edit type="TEXT" value="//CON_PERSON//INN" class="number_12" name="con_contractor__inn" readonly="1" xmlTag=":name:"/>
                    <label class="redstar">СНИЛС</label>
                    <layout:edit type="TEXT" value="//CON_PERSON//SNILS" class="number_11" name="con_person__snils_number" readonly="1" xmlTag=":name:"/>
                </layout:simple-field>
                <layout:simple-field label="Телефон" class="small some_inline mask_phone" required="0">
                    <layout:edit type="TEXT" value="//CON_PERSON//PHONE" name="con_person__phone"  xmlTag=":name:"/>
                </layout:simple-field>
                <layout:simple-field label="Электронная почта" class="medium mask_email" required="0">
                    <layout:edit type="EMAIL" value="//CON_PERSON//EMAIL" name="con_person__email"  xmlTag=":name:"/>
                </layout:simple-field>
                <layout:simple-field label="Тип документа" class="full" required="0">
                     <layout:edit type="TEXT" value="//CON_PERSON//NSI_PERSON_DOC_TEXT" name="con_person__nsi_person_doc_text" readonly="1" xmlTag=":name:"/>
                </layout:simple-field>
                <layout:simple-field label="Серия и номер" class="small" required="0">
                    <layout:edit type="TEXT" value="//CON_PERSON//PER_DOC_SERIAL" name="con_person__doc_serial" readonly="1" xmlTag=":name:"/>
                    <label>  </label>
                    <layout:edit type="TEXT" value="//CON_PERSON//PER_DOC_NUMBER" name="con_person__doc_serial" readonly="1" xmlTag=":name:"/>
                    <label class="redstar">Когда выдан</label>
                    <layout:edit type="DATE" name="con_person__doc_reg_date" value="//CON_PERSON//PER_DOC_DATE" readonly="1" xmlTag=":name:"/>
                </layout:simple-field>
                <layout:simple-field label="Кем выдан" class="full" required="0">
                    <layout:edit type="TEXTAREA" value="//CON_PERSON//PER_DOC_ORGAN" name="con_person__doc_reg_organ" readonly="1" xmlTag=":name:"/>
                </layout:simple-field>
                <xsl:if test="//CON_CONTRACTOR//NAME">
                    <h3 class="header line"><span>Идентификационные сведения организации</span></h3>
                    <layout:simple-field label="Организационно-правовая форма" class="full double_line" required="0">
                        <layout:edit type="TEXT" name="nsi_company_form_text" value="//CON_CONTRACTOR//COMPANY_FORM" readonly="1" xmlTag=":name:"/>
                    </layout:simple-field>
                    <layout:simple-field label="Наименование полное" class="full" required="0">
                        <layout:edit type="TEXTAREA" name="con_contractor__full_name" value="//CON_CONTRACTOR//FULL_NAME" readonly="1" xmlTag=":name:"/>
                    </layout:simple-field>
                    <layout:simple-field label="Наименование краткое" class="full" required="0">
                        <layout:edit type="TEXT" name="con_contractor__name" value="//CON_CONTRACTOR//NAME" readonly="1" xmlTag=":name:"/>
                    </layout:simple-field>
                    <layout:simple-field label="Юридический адрес" class="full" required="0">
                        <layout:edit type="TEXTAREA" name="con_contractor__address_legal" value="//CON_CONTRACTOR//ADDRESS_LEGAL" readonly="1" xmlTag=":name:"/>
                    </layout:simple-field>
                    <layout:simple-field label="Фактический адрес" class="full" required="0">
                        <layout:edit type="TEXTAREA" name="con_contractor__address_post" value="//CON_CONTRACTOR//ADDRESS_POST" readonly="1" xmlTag=":name:"/>
                    </layout:simple-field>
                    <layout:simple-field label="ИНН" class="small some_inline" required="0">
                        <layout:edit type="TEXT" value="//CON_CONTRACTOR//INN" name="con_contractor__inn"  class="number_10" readonly="1" xmlTag=":name:"/>
                        <label class="redStar">КПП</label>
                        <layout:edit type="TEXT" value="//CON_CONTRACTOR//KPP" name="con_contractor__kpp" class="number_9" readonly="1" xmlTag=":name:"/>
                    </layout:simple-field>
                    <layout:simple-field label="ОГРН" class="small some_inline" required="0">
                        <layout:edit type="TEXT" value="//CON_CONTRACTOR//OGRN_NUMBER" name="con_contractor__ogrn_number" class="number_13" readonly="1" xmlTag=":name:"/>
                        <label>ОКПО</label>
                        <layout:edit type="TEXT" value="//CON_CONTRACTOR//OKPO" class="number_10" name="con_contractor__okpo" readonly="1" xmlTag=":name:"/>
                    </layout:simple-field>

                    <layout:simple-field label="Телефон, факс" class="small some_inline mask_phone" required="0">
                        <layout:edit type="TEXT" value="//CON_CONTRACTOR//PHONE" name="con_contractor__phone"  xmlTag=":name:"/>
                    </layout:simple-field>
                    <layout:simple-field label="Электронная почта" class="medium mask_email" required="0">
                        <layout:edit type="EMAIL" value="//CON_CONTRACTOR//EMAIL"  name="con_contractor__email"  xmlTag=":name:"/>
                    </layout:simple-field>
                    <layout:simple-field label="Организация экспертизы" class="medium " required="0">
                        <layout:select name="ore_con_contractor_select__name" value="NULL" listSourceID="nsi_con_contractor" xmlTag=":name:"/>
                    </layout:simple-field>
                </xsl:if>
                <h3 class="header line"><span>Банковские реквизиты</span></h3>
                <layout:simple-field label="Наименование реквизитов" class="full" required="0">
                    <!--layout:select name="declarer_con_bank_account__name" value="//ORG_ACCOUNTS//ID" listSourceID="nsi_request_type" xmlTag=":name:"/-->
                    <select id="bank_select" name="declarer_con_bank_account_select_name" xmlTag=":name:">
                        <option value="">Не выбрано</option>
                        <xsl:for-each select="//CON_BANK_ACCOUNT//ROW">
                            <xsl:choose>
                                <xsl:when test="IS_ACTIVE=1">
                                    <option value="{ID}" selected='selected'><xsl:value-of select="NAME"/></option>
                                </xsl:when>
                                <xsl:otherwise>
                                    <option value="{ID}"><xsl:value-of select="NAME"/></option>
                                </xsl:otherwise>
                            </xsl:choose>

                        </xsl:for-each>
                    </select>
                </layout:simple-field>
                <div class="bank_show">
                    <layout:iterator select="//CON_BANK_ACCOUNT//ROW">
                        <div id="">
                            <layout:hidden name="id" value="ID"/>
                            <layout:simple-field label="Отделение банка" class="full" required="0">
                                <layout:edit type="TEXTAREA" value="BANK_NAME" name="declarer_con_bank_account__bank_name" xmlTag=":name:" readonly="1"/>
                            </layout:simple-field>
                            <layout:simple-field label="Основные реквизиты" class="full  checkBox" required="0">
                                <layout:checkbox forceCheckbox="1" label="" name="con_contractor__is_primary" valueXPATH="IS_ACTIVE" readonly="1" valueChecked="1"/>
                            </layout:simple-field>

                            <layout:simple-field label="Адрес банка" class="full" required="0">
                                <layout:edit type="TEXTAREA" value="BANK_ADDRESS" name="declarer_con_bank_account__bank_address" xmlTag=":name:" readonly="1"/>
                            </layout:simple-field>
                            <layout:simple-field label="БИК" class="small number_9" required="0">
                                <layout:edit type="TEXT" value="BANK_BIC" name="declarer_con_bank_account__bank_bik" xmlTag=":name:" readonly="1"/>
                            </layout:simple-field>
                            <layout:simple-field label="Расчётный счет" class="medium " required="0">
                                <layout:edit type="TEXT" value="ACCOUNT_SET" name="declarer_con_bank_account__bank_account_set" xmlTag=":name:" readonly="1" class="number_20"/>
                            </layout:simple-field>
                            <layout:simple-field label="Корреспондентский счет" class="medium " required="0">
                                 <layout:edit type="TEXT" value="ACCOUNT_COR" name="declarer_con_bank_account__bank_account_cor" class="number_20" xmlTag=":name:" readonly="1"/>
                            </layout:simple-field>
                        </div>
                    </layout:iterator>
                </div>
            </div>
                    </xsl:when>
                    <xsl:otherwise>


            <div class="formContent">
                <layout:header>Профиль пользователя</layout:header>
                <layout:simple-field label="" class="full radioGroup_list radio ur_fiz" required="0">
                    <layout:radio labelValue="Юридическое лицо" value="ur" name="con_contractor_nsi_company_form" checked="1" xmlTag=":name:"/>
                    <layout:radio labelValue="Индивидуальный предприниматель" value="ip" name="con_contractor_nsi_company_form" checked="0" xmlTag=":name:"/>
                    <layout:radio labelValue="Физическое лицо" value="fiz" name="con_contractor_nsi_company_form" checked="0" xmlTag=":name:"/>
                    <!--layout:hidden value="//MY_LIST_VALUE" name="is_primary_request" xmlTag=":name:"/-->
                </layout:simple-field>
                <h3 class="header line"><span>Идентификационные сведения представителя</span></h3>
                <layout:simple-field label="Фамилия" class="medium" required="1">
                    <layout:edit type="TEXT" value="//CON_PERSON//LAST_NAME" name="con_person__last_name" xmlTag=":name:"/>
                </layout:simple-field>
                <layout:simple-field label="Имя" class="medium" required="1">
                    <layout:edit type="TEXT" value="//CON_PERSON//FIRST_NAME" name="con_person__first_name" xmlTag=":name:"/>
                </layout:simple-field>
                <layout:simple-field label="Отчество" class="medium" required="1">
                    <layout:edit type="TEXT" value="//CON_PERSON//MIDDLE_NAME" name="con_person__middle_name" xmlTag=":name:"/>
                </layout:simple-field>
                <layout:simple-field label="ИНН" class="small some_inline" required="1">
                    <layout:edit type="TEXT" value="//CON_PERSON//INN" class="number_12" name="con_contractor__inn" xmlTag=":name:"/>
                    <label class="redstar"><strong>*</strong>СНИЛС</label>
                    <layout:edit type="TEXT" value="//CON_PERSON//SNILS" class="number_11" name="con_person__snils_number" xmlTag=":name:"/>
                </layout:simple-field>
                <layout:simple-field label="Телефон" class="small some_inline mask_phone" required="1">
                    <layout:edit type="TEXT" value="//CON_PERSON//PHONE" name="con_person__phone" xmlTag=":name:"/>
                </layout:simple-field>
                <layout:simple-field label="Электронная почта" class="medium mask_email" required="1">
                    <layout:edit type="EMAIL" value="//CON_PERSON//EMAIL" name="con_person__email" xmlTag=":name:"/>
                </layout:simple-field>
                <layout:simple-field label="Тип документа" class="full" required="1">
                     <layout:select value="//CON_PERSON//NSI_PERSON_DOC" limit="1" listSourceID="nsi_person_doc" name="con_person__nsi_person_doc" xmlTag=":name:"/>
                </layout:simple-field>
                <layout:simple-field label="Серия и номер" class="small" required="1">
                    <layout:edit type="TEXT" value="//CON_PERSON//PER_DOC_SERIAL" name="con_person__doc_serial" xmlTag=":name:"/>
                    <label>  </label>
                    <layout:edit type="TEXT" value="//CON_PERSON//PER_DOC_NUMBER" name="con_person__doc_serial" xmlTag=":name:"/>
                    <label class="redstar"><strong>*</strong>Когда выдан</label>
                    <layout:edit type="DATE" name="con_person__doc_reg_date" value="//CON_PERSON//PER_DOC_DATE" xmlTag=":name:"/>
                </layout:simple-field>
                <layout:simple-field label="Кем выдан" class="full" required="1">
                    <layout:edit type="TEXTAREA" value="//CON_PERSON//PER_DOC_ORGAN" name="con_person__doc_reg_organ" xmlTag=":name:"/>
                </layout:simple-field>
                <div class="organization_data">
                    <div class="organization_content">
                    <h3 class="header line"><span>Идентификационные сведения организации</span></h3>
                    <layout:simple-field label="Организационно-правовая форма" class="full double_line" required="1">
                        <layout:select name="nsi_company_form" value="//CON_CONTRACTOR//NSI_COMPANY_FORM" listSourceID="nsi_company_form" xmlTag=":name:"/>
                    </layout:simple-field>
                    <layout:simple-field label="Наименование полное" class="full" required="1">
                        <layout:edit type="TEXTAREA" name="con_contractor__full_name" value="//CON_CONTRACTOR//FULL_NAME" xmlTag=":name:"/>
                    </layout:simple-field>
                    <layout:simple-field label="Наименование краткое" class="full" required="1">
                        <layout:edit type="TEXT" name="con_contractor__name" value="//CON_CONTRACTOR//NAME" xmlTag=":name:"/>
                    </layout:simple-field>
                    <layout:simple-field label="Юридический адрес" class="full" required="0">
                        <layout:edit type="TEXTAREA" name="con_contractor__address_legal" value="//CON_CONTRACTOR//ADDRESS_LEGAL" xmlTag=":name:"/>
                    </layout:simple-field>
                    <layout:simple-field label="Фактический адрес" class="full" required="0">
                        <layout:edit type="TEXTAREA" name="con_contractor__address_post" value="//CON_CONTRACTOR//ADDRESS_POST" xmlTag=":name:"/>
                    </layout:simple-field>
                    <layout:simple-field label="ИНН" class="small some_inline" required="1">
                        <layout:edit type="TEXT" value="//CON_CONTRACTOR//INN" name="con_contractor__inn"  class="number_10" xmlTag=":name:"/>
                        <label class="redStar"><strong>*</strong>КПП</label>
                        <layout:edit type="TEXT" value="//CON_CONTRACTOR//KPP" name="con_contractor__kpp" class="number_9" xmlTag=":name:"/>
                    </layout:simple-field>
                    <layout:simple-field label="ОГРН" class="small some_inline" required="0">
                        <layout:edit type="TEXT" value="//CON_CONTRACTOR//OGRN_NUMBER" name="con_contractor__ogrn_number" class="number_13" xmlTag=":name:"/>
                        <label>ОКПО</label>
                        <layout:edit type="TEXT" value="//CON_CONTRACTOR//OKPO" class="number_10" name="con_contractor__okpo" xmlTag=":name:"/>
                    </layout:simple-field>

                    <layout:simple-field label="Телефон, факс" class="small some_inline mask_phone" required="1">
                        <layout:edit type="TEXT" value="//CON_CONTRACTOR//PHONE" name="con_contractor__phone" xmlTag=":name:"/>
                    </layout:simple-field>
                    <layout:simple-field label="Электронная почта" class="medium mask_email" required="1">
                        <layout:edit type="EMAIL" value="//CON_CONTRACTOR//EMAIL"  name="con_contractor__email" xmlTag=":name:"/>
                    </layout:simple-field>
                    <layout:simple-field label="Организация экспертизы" class="medium " required="0">
                        <layout:select name="ore_con_contractor_select__name" value="NULL" listSourceID="nsi_con_contractor" xmlTag=":name:"/>
                    </layout:simple-field>
                    </div>
                </div>
                <h3 class="header line"><span>Банковские реквизиты</span></h3>
                <layout:section select="//CON_BANK_ACCOUNT//ROW" xmlTag="con_bank_account_section" class="topSection" add="1" delete="1">
                    <layout:simple-field label="Наименование реквизитов" class="full" required="1">
                        <layout:edit type="TEXT" value="NAME" name="declarer_con_bank_account_name" xmlTag=":name:" />
                    </layout:simple-field>
                    <layout:simple-field label="Отделение банка" class="full" required="0">
                        <layout:edit type="TEXTAREA" value="BANK_NAME" name="declarer_con_bank_account__bank_name" xmlTag=":name:" />
                    </layout:simple-field>
                    <layout:simple-field label="Основные реквизиты" class="full  checkBox" required="0">
                        <layout:checkbox forceCheckbox="1" label="" name="con_contractor__is_primary" valueXPATH="IS_ACTIVE" valueChecked="1"/>
                    </layout:simple-field>

                    <layout:simple-field label="Адрес банка" class="full" required="0">
                        <layout:edit type="TEXTAREA" value="BANK_ADDRESS" name="declarer_con_bank_account__bank_address" xmlTag=":name:" />
                    </layout:simple-field>
                    <layout:simple-field label="БИК" class="small number_9" required="1">
                        <layout:edit type="TEXT" value="BANK_BIC" name="declarer_con_bank_account__bank_bik" xmlTag=":name:" />
                    </layout:simple-field>
                    <layout:simple-field label="Расчётный счет" class="medium " required="1">
                        <layout:edit type="TEXT" value="ACCOUNT_SET" name="declarer_con_bank_account__bank_account_set" class="number_20" xmlTag=":name:" />
                    </layout:simple-field>
                    <layout:simple-field label="Корреспондентский счет" class="medium number_20" required="1">
                         <layout:edit type="TEXT" value="ACCOUNT_COR" name="declarer_con_bank_account__bank_account_cor" class="number_20" xmlTag=":name:" />
                    </layout:simple-field>
                <script type="text/javascript">
                    all_masks();
                </script>
                </layout:section>


            </div>

                    </xsl:otherwise>
                </xsl:choose>



            <div class="formFooter">
                <div class="rightBlock">
                    <input type="button" class="form_button closeButton" value="Отмена"/>
                    <input type="button" class="form_button saveButton" value="Применить"/>
                    <input type="button" class="form_button saveCloseButton" value="Сохранить"/>
                </div>
            </div>
        </layout:form>
        <div class="hide"></div>
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
        var thisForm = $('form').eq(0);
        var thisFormId = thisForm.attr('id');
        function number_mask(obj, field_length){
            obj.keyup(function(eventObject){
            $(this).val($(this).val().replace(/(\D+)/g, ''));
            if ($(this).val().length>field_length) {$(this).val($(this).val().slice(0, field_length))}

        });
        }
        function all_masks(){
            /*dateMask();*/
            number_mask($('.number_8 input[type="text"]'), 8);
            number_mask($('.number_9 input[type="text"]'), 9);
            number_mask($('.number_10 input[type="text"]'), 10);
            number_mask($('.number_11 input[type="text"]'), 11);
            number_mask($('.number_12 input[type="text"]'), 12);
            number_mask($('.number_20 input[type="text"]'), 20);
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
        $(function(){
            $('input, textarea').each(function(indx, elm){
                if ($(elm).attr('readonly')){
                    $(elm).addClass('readOnly');
                }
            });
            all_masks();
            setTimeout(initCheckboxes, 200);
            $(document).on('click', '.sectionBtnAdd, .sectionBtnDelete', function(){
                initCheckboxes();
            });
            $(document).on('change', '[name="con_contractor__is_primary"]', function(){
                if ($(this).attr('checked')){
                    $(this).addClass('thisCheck');
                    $('[name="con_contractor__is_primary"]:not(.thisCheck)').each(function(indx, elm){
                        $(elm).removeAttr('checked');
                        $(elm).change();
                    });
                    $(this).removeClass('thisCheck');
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
            $('#bank_select').change();
            $('[name="con_contractor_nsi_company_form"]').change(function(){
                if ($(this).val() == 'fiz'){
                    $('.hide').append($('.organization_data>div'));
                }else{
                    $('.organization_data').append($('.organization_content'));
                }
            });
            $('.closeButton').click(function(){
                    window.close();
                });
                $('.saveCloseButton').click(function(){
                    if (step_validate($('form')).result){
                        $(this).removeClass('notValidate');
                        saveFormUniversal($('form').eq(0), {success: function(){window.close();}});
                    } else {
                        $(this).addClass('notValidate');
                        $(document).scrollTop($('.redField').offset().top);
                    }

                });
                $('.saveButton').click(function(){
                    if (step_validate($('form')).result){
                        $(this).removeClass('notValidate');
                        saveFormUniversal($('form').eq(0));
                    } else {
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

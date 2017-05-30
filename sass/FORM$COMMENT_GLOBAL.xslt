<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:layout="URN:html-form-layout:v0.1" xmlns="http://www.w3.org/1999/xhtml" xmlns:ex2="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLTExtension" xmlns:ctx="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLDataContext" xmlns:gbu="http://xmlns.oracle.com/MSG_GBU_doc">

    <xsl:output method="html" indent="yes" omit-xml-declaration="yes" undeclare-prefixes="yes" exclude-result-prefixes="#all"/>
    <xsl:variable name="DATA">
        <GLOBAL xmlns="">
            <RES_COMMENT_TEXT_WF>
                <ROW_SET>
                    <xsl:for-each select="//RES_COMMENT_TEXT/ROW_SET/ROW">
                        <ROW>
                            <xsl:copy-of select="*"/>
                            <FILES_CT>
                                <ROW_SET>
                                    <xsl:variable name="folderId" select="FOLDER_ID"/>
                                    <xsl:for-each select="//FILES_CMNT/ROW_SET/ROW[FOLDER=$folderId]">
                                        <ROW>
                                            <xsl:copy-of select="*"/>
                                        </ROW>
                                    </xsl:for-each>
                                </ROW_SET>
                            </FILES_CT>
                        </ROW>
                    </xsl:for-each>
                </ROW_SET>
            </RES_COMMENT_TEXT_WF>
            <APPROVED_LIST>
                <xsl:choose>
                    <xsl:when test="count(//RES_COMMENT_MEMBER//ROW) &gt; 0">
                        <xsl:copy-of select="//RES_COMMENT_MEMBER/*"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:copy-of select="//RES_COMMENT_MEMBER_DEFAULT/*"/>
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
            <xsl:copy-of select="/"/>
        </GLOBAL>
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
            .all_local_comment{
                counter-reset: conter1;
            }
            .numCount:before{
                counter-increment: conter1;
                content: counter(conter1);
                position: absolute;
                display: block;
                width: 27px;
                height: 16px;
                text-align: center;
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
            .line .inputWrap input.form_button.disable.personSign,
            .disable.form_button.startSign
            {
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
        <layout:form action="/customactions/globalCommentSave.action" xmlTag="global_comment">
            <layout:hidden name="requestId" value="//REQUEST_ID" xmlTag=":name:"/>
            <layout:hidden name="documentId" value="//COMMENT_GLOBAL//ID" xmlTag=":name:"/>
            <layout:hidden name="ecpExist" value="//IS_ANY_SIGNED" xmlTag=":name:"/>
            <layout:hidden name="fileCount" value="//FILE_COUNT" xmlTag=":name:"/>
            <layout:header>Сводное замечание</layout:header>
            <h3 class="header line"><xsl:value-of select="//COMMENT_GLOBAL//REQUEST_OBJECT_NAME"/> - <xsl:value-of select="//COMMENT_GLOBAL//REQUEST_OBJECT_ADDRES"/></h3>
            <layout:simple-field label="Ведущее подразделение" class="full" required="0">
                <layout:edit type="TEXT" name="res_comment_global__exp_department_name" value="//COMMENT_GLOBAL//FK_EXP_DEPARTMENT_TEXT" xmlTag=":name:" readonly="1"/>
            </layout:simple-field>

            <layout:simple-field label="Ведущий эксперт" class="medium" required="0">
                <layout:edit type="TEXT" name="res_comment_global__exp_person_name" value="//COMMENT_GLOBAL//FK_EXP_PERSON_TEXT" xmlTag=":name:" readonly="1"/>
            </layout:simple-field>

            <layout:simple-field label="Дата создания проекта" class="small" required="0">
                <layout:edit type="DATE" name="res_comment_global__date_expert_begin" value="//COMMENT_GLOBAL//DATE_CREATED" xmlTag=":name:" readonly="1"/>
            </layout:simple-field>
            <layout:simple-field label="Плановая дата" class="small" required="0">
                <layout:edit type="DATE" name="res_comment_global__date_planned" value="//COMMENT_GLOBAL//DATE_PLANNED" xmlTag=":name:" readonly="1"/>
            </layout:simple-field>
            <layout:simple-field label="Дата подписания" class="small" required="0">
                <layout:edit type="DATE" name="res_comment_global__date_signed" value="//COMMENT_GLOBAL//DATE_SIGNED" xmlTag=":name:" readonly="1"/>
            </layout:simple-field>
            <layout:simple-field label="Статус" class="medium" required="0">
                <layout:edit type="TEXT" name="res_comment_global__nsi_comment_status_text" value="//COMMENT_GLOBAL//NSI_COMMENT_STATUS_TEXT" xmlTag=":name:" readonly="1"/>
                <layout:hidden name="res_comment_global__nsi_comment_status" value="//COMMENT_GLOBAL//NSI_COMMENT_STATUS"/>

            </layout:simple-field>
            <layout:simple-field label="Примечание" class="full" required="0">
                <layout:edit type="TEXTAREA" name="res_comment_global__note" value="//COMMENT_GLOBAL//NOTE" xmlTag=":name:"/>
            </layout:simple-field>
            <layout:simple-field label="Замечания ведущего эксперта отсутствуют" class="full checkBox double_line" required="0">
                <layout:checkbox forceCheckbox="1" valueXPATH="//COMMENT_GLOBAL//IS_NO_COMMENT" name="res_comment_global__is_no_comment" label="" extractFalse="0" xmlTag=":name:"/>
            </layout:simple-field>

            <h3 class="header line">Перечень локальных замечаний</h3>

            <layout:simple-field label="" class="full checkBox" required="0">
                <layout:checkbox forceCheckbox="1" valueChecked="1" valueXPATH="//COMMENT_GLOBAL//IS_NO_COMMENT" name="res_remark__is_no_comment" label="Включить все локальные замечания" extractFalse="1"/>
            </layout:simple-field>

            <layout:table class="all_local_comment line checkBox" style="width:100%;" add="0" move="0">
                <layout:header>
                    <layout:cell name="№" style="width: 10px;"/>
                    <layout:cell name="Включить" style="width:px;"/>
                    <layout:cell name="Раздел" style="width:px;"/>
                    <layout:cell name="Тематика" style="width:px;"/>
                    <layout:cell name="Эксперт" style="width:px;"/>
                    <layout:cell name="Номер замечания" style="width:px;"/>
                    <layout:cell name="Дата замечания плановая" style="width:px;"/>
                    <layout:cell name="Замечание устранено" style="width:px;"/>
                    <layout:cell name="Открыть" style="width:px;"/>
                </layout:header>
                <layout:body xmlTag="res_section" value="//COMMENT_JOIN//ROW">
                    <layout:cell style="width:10px;" class="numCount">

                    </layout:cell>
                    <layout:cell style="width: px;">
                        <div class="">
                            <layout:checkbox forceCheckbox="1" value="1" name="res_remark__is_global_included" valueChecked="1" label="" extractFalse="1" xmlTag=":name:"/>
                        </div>
                    </layout:cell>
                    <layout:cell style="width:px;">
                        <layout:edit type="TEXT" name="res_section__nsi_project_section" value="NSI_PROJECT_SECTION_TEXT" xmlTag=":name:" readonly="1"/>
                    </layout:cell>
                    <layout:cell style="width:px;">
                        <layout:edit type="TEXT" name="res_section__nsi_project_subject" value="NSI_PROJECT_SUBJEC_TEXT" xmlTag=":name:" readonly="1"/>
                    </layout:cell>
                    <layout:cell style="width:px;">
                        <layout:edit type="TEXT" name="res_section__FK_exp_person" value="EXP_PERSON_TEXT" xmlTag=":name:" readonly="1"/>
                    </layout:cell>
                    <layout:cell style="width:px;">
                        <layout:edit type="TEXT" name="res_remark__comment_number" value="REMARK_COMMENT_NUMBER" xmlTag=":name:" readonly="1"/>
                    </layout:cell>
                    <layout:cell style="width:px;">
                        <layout:edit type="TEXT" name="res_comment_local__date_planned" value="CMNT_DATE_PLANED" xmlTag=":name:" readonly="1"/>
                    </layout:cell>
                    <layout:cell style="width:px;">
                        <!--layout:checkbox forceCheckbox="1" value="REMARK_DATE_CORRECTED_FLG" name="res_remark__date_corrected" label="" extractFalse="1" xmlTag=":name:" readonly="1" /-->
                        <xsl:choose>
                            <xsl:when test="REMARK_DATE_CORRECTED_FLG = '1'"><img src="/portal_static/img/greenCube.png"/></xsl:when>
                        </xsl:choose>
                    </layout:cell>
                    <layout:cell style="width:px;">
                        <layout:anchor target="_blank" value="Открыть" hrefPath="URL_COMMENT_LOCAL"/>
                        <layout:hidden value="FK_RES_COMMENT_GLOBAL" name="res_comment_local_id" xmlTag=":name:"/>
                        <layout:hidden value="REMARK_ID" name="res_comment_id" xmlTag=":name:"/>
                    </layout:cell>
                </layout:body>
            </layout:table>

            <h3 class="header line">Замечания ведущего эксперта</h3>
            <layout:section label="Замечания ведущего эксперта" xmlTag="add_toexp" class="topSection" select="//RES_COMMENT_TEXT_WF/ROW_SET/ROW" add="1" delete="1">
                <layout:simple-field label="Номер замечания" class="small" required="0">
                    <layout:edit type="TEXT" name="res_comment_text__comment_number" value="COMMENT_NUMBER" readonly="1" xmlTag=":name:"/>
                </layout:simple-field>
                <layout:simple-field label="Текст замечания" class="full" required="0">
                    <layout:edit type="TEXTAREA" name="res_comment_text__comment_text" value="COMMENT_TEXT" xmlTag=":name:"/>
                </layout:simple-field>
                <layout:simple-field label="Нормативное обоснование" class="full" required="0">
                    <layout:edit type="TEXTAREA" name="res_comment_text__rationale" value="RATIONALE" xmlTag=":name:"/>
                </layout:simple-field>
                <layout:simple-field label="Ссылки, примечания" class="full" required="0">
                    <layout:edit type="TEXTAREA" name="res_comment_text__note" value="NOTE" xmlTag=":name:"/>
                </layout:simple-field>
                <layout:simple-field label="Приложения к замечанию" class="medium" required="0">
                    <layout:file value="Загрузить" id="res_comment_text__folder_id" name="res_comment_text__folder_id" pre_files="FILES_CT//FILE_COMBO_LINE" xmlTag=":name:"/>
                </layout:simple-field>
            </layout:section>
            <layout:simple-field label="Общие выводы" class="full" required="0">
                <layout:edit type="TEXTAREA" name="res_comment_global__comment_text" value="//COMMENT_GLOBAL//COMMENT_TEXT" xmlTag=":name:"/>
            </layout:simple-field>
            <layout:simple-field label="Сводное замечание" class="full" required="0">
                <input type="button" value="Сформировать печатную форму" class="form_button"/>
            </layout:simple-field>

            <layout:simple-field label="Файлы" class="medium" required="0">
                <layout:file value="Загрузить" name="res_comment_global__folder_id" id="res_comment_global__folder_id" xmlTag=":name:" sign="true" pre_files="//COMBINED_FILE_LINE"/>
                <!--layout:file value="Загрузить" name="res_comment_global__folder_id" xmlTag=":name:" sign="true" filesXPATH="//FILES//ROW"/-->
            </layout:simple-field>

            <layout:line/>
            <layout:simple-field label="" class="medium" required="0">
                <input type="button" value="Начать согласование" class="form_button startSign" /><input type="button" value="Отменить согласование" class="form_button fileDesignButton hide" />
            </layout:simple-field>

            <h3 class="header line">Лист согласования</h3>


            <xsl:variable name="current_user" select="//CURRENT_USER_INFO//PERSON_ID"/>
            <!--input type="hidden" name="current_user" value="{$current_user}"/-->

            <layout:table class="approved_list line checkBox" style="width:100%;" add="1" move="0">
                <layout:header>
                    <layout:cell name="№"/>
                    <layout:cell name="Роль"/>
                    <layout:cell name="Плановый согласующий"/>
                    <layout:cell name="Роль в согласовании"/>
                    <layout:cell name="Примечание"/>
                    <layout:cell name="Подписать"/>
                    <layout:cell name="Дата подписания"/>
                </layout:header>
                <layout:body value="//APPROVED_LIST//ROW" xmlTag="approved_list">
                    <layout:cell class="cell-position" style="text-align: center; vertical-align: middle;">

                    </layout:cell>
                    <layout:cell>
                        <layout:multiselect value="NSI_RESOLUTION_ROLE" limit="1" listSourceID="nsi_resolution_role" name="res_comment_member__nsi_resolution_role" readonly="1" xmlTag=":name:"/>
                        <!--layout:extract select="NSI_RESOLUTION_ROLE_TEXT"/-->
                    </layout:cell>
                    <layout:cell>
                        <layout:multiselect value="FK_EXP_PERSON" limit="1" listSourceID="nsi_exp_person_all" name="res_comment_member__fk_exp_person" readonly="1" xmlTag=":name:"/>
                        <input type="hidden" name="current_user" value="{$current_user}"/>
                        <layout:hidden name="selected_user" value="FK_EXP_PERSON"/>
                        <!--layout:extract select="EXP_PERSON_TEXT"/-->
                    </layout:cell>
                    <layout:cell>
                      <layout:multiselect value="NSI_APPROVEMENT_ROLE" limit="1" listSourceID="nsi_approvement_role" name="res_comment_member__nsi_resolution_local_status"  xmlTag=":name:" readonly="1"/>
                      <!--layout:extract select="NSI_APPROVEMENT_ROLE_TEXT"/-->
                    </layout:cell>
                    <layout:cell>

                        <xsl:choose>
                            <xsl:when test="FK_EXP_PERSON=$DATA//CURRENT_USER_INFO//PERSON_ID">
                                <layout:edit type="TEXTAREA" style="width: 100%" name="res_comment_member__note" value="NOTE"  xmlTag=":name:" />
                            </xsl:when>
                            <xsl:otherwise>
                                <layout:edit type="TEXTAREA" style="width: 100%" name="res_comment_member__note" value="NOTE" readonly="1" xmlTag=":name:" />
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
                        <layout:hidden name="res_comment_member__date_signed" value="DATE_SIGNED"  xmlTag=":name:"/>
                    </layout:cell>
                </layout:body>
            </layout:table>


            <layout:line/>


            <!--layout:simple-field label="Организация создавшая" class="full" required="0">
                <layout:multiselect value="//MY_MULTISELECT_VALUE" limit="1" listSourceID="nsi_exp_expert" name="organization_created" xmlTag=":name:"/>
            </layout:simple-field>
            <layout:simple-field label="Организация просматривающая" class="full" required="0">
                <layout:multiselect value="//MY_MULTISELECT_VALUE" limit="1" listSourceID="nsi_exp_expert" name="organization_browsing" xmlTag=":name:"/>
            </layout:simple-field-->
            <layout:simple-field label="" class="full" required="0">
                <input type="button" class="form_button saveCloseButton" value="Сохранить"/>
                <div class="rightBlock"><input type="button" class="form_button saveButton" value="Применить"/>
                <input type="button" class="form_button closeButton" value="Отмена"/>
                </div>
            </layout:simple-field>
            <layout:clear/>
        </layout:form>
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
            function makeFileXmlTag(obj){
            obj = (obj)?obj:$('form');
            obj.find('.fileButton input[type="file"]')
                .closest('.fileButton')
                .siblings('.attachmentsTableWrapper')
                .find('.attachmentFileRow')
                .each(function(indx, elm){
                    var fileIdInputName = 'con_contract_document__file_id';
                    fileIdInputName = $(elm).parents('.fileList').attr('data-name-filename');

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
        if ($(this).val().length>field_length) {$(this).val($(this).val().slice(0, field_length))}
        $(this).val($(this).val().replace(/(\D+)/g, ''));
      });
        }


        function all_masks(){

            number_mask($('.number_9 input[type="text"]'), 9);
            number_mask($('.number_20 input[type="text"]'), 20);
            $('input[type="text"].digital').keyup(function(eventObject){
                    $(this).val($(this).val().replace(/(\D+)/g, ''));
                });


            $('.mask_phone input[type="text"]').mask("+7(999) 999-99-99");
            $('.mask_email input[type="email"]').focusout(function(){
                if (!/(.*)@(.[^.]*).(.*)/ig.test($(this).val())){
                    /*alert('Некорректный e-mail');*/

                }
            });

            $('.money input[type="text"]').keyup(function(eventObject){
                $(this).val($(this).val().replace(/(\D+)/g, ''));
              });

        }
        function dateRender(date){
            var date = (date)?date:new Date();
            var monthRender = (+date.getMonth()+1).toString();
            var dateRender = date.getDate().toString();
            var dateFinalRender = ((dateRender.length<2)?'0'+dateRender:dateRender)+'.'+((monthRender.length<2)?'0'+monthRender:monthRender)+'.'+date.getFullYear();
            console.log(dateRender, dateRender.length, '0'+dateRender);
            return dateFinalRender;
        }
        function _allFilesSigned(){
            _signAppletCallbackFileSigned();
        }
        function _signAppletCallbackFileSigned(){
            $('.fileDesignButton').removeClass('hide');

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
                    $('[name="res_comment_global__nsi_comment_status"]').val('APPROVED');
                    $('[name="res_comment_global__nsi_comment_status_text"]').val('Утверждено');
                }
                $thisPressed.removeClass('pressed');
            }
            else{
                $('[name="res_comment_global__nsi_comment_status"]').val('APPROVED');
                $('[name="res_comment_global__nsi_comment_status_text"]').val('Утверждено');
            }



            $('[data-name-filename="res_comment_global__folder_id"] .fileInputButton').addClass('disabled');
            $('.all_local_comment input[type="checkbox"]').each(function(indx, elm){
                $(elm).attr('readonly', true);
                $(elm).addClass('readOnly');
            });
            /* добавить ридонли */
            fieldList.forEach(function(item, i, arr) {
                $('[name="'+item+'"]').attr('readonly', true);
                $('[name="'+item+'"]').addClass('readOnly');
            });


            $('.sectionBtnAdd, .sectionBtnDelete').hide();
            $('.deleteElem').hide();
            $('[name="res_comment_global__date_signed"]').val(dateRender());
        }
        var fieldList=[
            "res_remark__is_no_comment",
            "res_comment_text__comment_text",
            "res_comment_text__rationale",
            "res_comment_text__note",
            "res_comment_global__comment_text",
            "res_comment_global__is_no_comment",
            "res_remark__is_no_comment",
            "res_remark__is_global_included",
            "res_comment_global__comment_text"
        ];
        function postAddToken(t, item) {
            var cUser = $('[name="current_user"]').eq(0).val();
            if (item.objectId == cUser && $('[name="res_comment_global__nsi_comment_status"]').val() != 'APPROVED'){
                t.parents('.rowWrapTable').find('.personSign').removeClass('disable hide');
                t.parents('.rowWrapTable').find('[name="res_comment_member__note"]').removeClass('readOnly').removeAttr('readonly');
            }
        }
         $(function(){
            all_masks();
            $('input, textarea').each(function(indx, elm){
                if ($(elm).attr('readonly')){
                    $(elm).addClass('readOnly');

                }
            });

            $(document).on('click', '.personSign:not(.disable)', function(){
                if (!$('.fileSign').hasClass('disabled')){
                    $(this).addClass('pressed');
                    $('.fileSign').click();
                }

            });

            if ($('[name="res_comment_global__nsi_comment_status"]').val()=='APPROVED'){
                _signAppletCallbackFileSigned();
            }
            $('.cell-position').each(function(){
              var $this = $(this),
                  pos = $this.parent().data('position');
              $this.text(pos);
            });
            setTimeout(initCheckboxes, 200);
            setTimeout(function(){
                $.signECP.callbacks.globals.signAppletCallbackFileSigned = _signAppletCallbackFileSigned;
                $.signECP.callbacks.globals.allFilesSigned = _signAppletCallbackFileSigned;
            }, 1000);
            /*
            $('[data-name-filename="res_comment_global__folder_id"] .fileSign').after('<span class="fileButton fileDesignButton">Снять подпись</span>');*/

            $(document).on('click', '.startSign', function(){

                if (!$('.fileSign').hasClass('disabled')){
                    $(this).removeClass('disable');
                    $(this).addClass('hide');
                    $('.fileDesignButton').removeClass('hide');
                    $('.sectionBtnAdd, .sectionBtnDelete').hide();
                    $('.deleteElem').hide();

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

                    $('[name="res_comment_global__nsi_comment_status"]').val('APPROVEMENT');
                    $('[name="res_comment_global__nsi_comment_status_text"]').val('На согласовании');

                } else {
                    $(this).addClass('disable');
                }
            });

            if ($('[name="res_comment_global__nsi_comment_status"]').val() == 'APPROVEMENT' && $('[data-name-filename="res_comment_global__folder_id"] .attachmentsTable  li').length){
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

            if ($('[name="res_comment_global__nsi_comment_status"]').val() == 'APPROVED'){
                $('.personSign').addClass('disable');
            }

            $(document).on('click', '.sectionBtnAdd, .sectionBtnDelete', function(){
                var counter=1;
                $('.section [name="res_comment_text__comment_number"]').each(function(indx, elm){
                    if (!$(elm).parents('.sectionTemplate').length){
                        $(elm).val(counter);
                        counter++;
                    }

                });
                $('[xftag="approved_list"]:visible').each(function(indx, elm){
                    $(elm).attr('data-position', indx+1);
                    $(elm).find('.cell-position').html(indx+1);
                });
            });

            $(document).on('click', '.fileDesignButton', function(){
                $('.personSign').addClass('hide disable');



                $('.date_signed').html('');
                $('[name="res_comment_member__date_signed"]').val('');

                $('.startSign').removeClass('hide');
                $(this).addClass('hide');


                $('.attachmentsTableWrapper').find('.attachmentFileRow').each(function(indx, elm){
                    var thisFileId = $(elm).attr('id');
                    var $this = $(elm);
                    $.ajax({
                        url: '/elib/deleteSignForApplet.action',
                        data: {
                            cardId: thisFileId
                        }
                    }).success(function(data){
                        console.log('Remove Sing Message for: '+thisFileId);
                        console.log(data);
                        $this.removeClass('signed');
                        $this.find('.signFileImg').remove();
                        $('.deleteElem').show();
                        $('[name="res_comment_global__date_signed"]').val('');
                    });
                });
                $('[name="res_comment_global__nsi_comment_status"]').val('PROJECT');
                $('[name="res_comment_global__nsi_comment_status_text"]').val('Проект');
                $('[data-name-filename="res_comment_global__folder_id"] .fileInputButton').removeClass('disabled');
                $('.all_local_comment input[type="checkbox"]').each(function(indx, elm){
                    $(elm).removeAttr('readonly');
                    $(elm).removeClass('readOnly');
                    });
                /* убрать ридонли */
                fieldList.forEach(function(item, i, arr) {
                        $('[name="'+item+'"]').removeAttr('readonly');
                        $('[name="'+item+'"]').removeClass('readOnly');
                    });

                $('.sectionBtnAdd, .sectionBtnDelete').show();
            });
            /* Включить все локальные замечания */
            $('input[name="res_remark__is_no_comment"]').click(function(){
                if ($(this).attr('checked')){
                    $('.all_local_comment input').each(function(indx, elm){
                        if (!$(elm).attr('checked')){
                            $(elm).click();
                        }
                    });
                }else{
                    $('.all_local_comment input').each(function(indx, elm){
                        if ($(elm).attr('checked')){
                            $(elm).click();
                        }
                    });
                }
            });
            $('form .line').click(function(){
                makeFileXmlTag();
            });
            $('.closeButton').click(function(){
                    window.close();
                });
            $('.saveCloseButton').click(function(){
                if (step_validate($('form')).result){
                    $(this).removeClass('notValidate');
                    makeFileXmlTag();
                    saveFormUniversal($('form').eq(0), {success: function(){window.close();}});
                } else {
                    $(this).addClass('notValidate');
                    $(document).scrollTop($('.redField').offset().top);
                }

            });
            $('.saveButton').click(function(){
                if (step_validate($('form')).result){
                    $(this).removeClass('notValidate');
                    makeFileXmlTag();
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

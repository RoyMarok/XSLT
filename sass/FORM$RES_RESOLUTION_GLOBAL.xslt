<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:layout="URN:html-form-layout:v0.1" xmlns="http://www.w3.org/1999/xhtml" xmlns:ex2="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLTExtension" xmlns:ctx="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLDataContext" xmlns:gbu="http://xmlns.oracle.com/MSG_GBU_doc">

    <xsl:output method="html" indent="yes" omit-xml-declaration="yes" undeclare-prefixes="yes" exclude-result-prefixes="#all"/>
    <xsl:variable name="DATA">

        <GLOBAL xmlns="">
            <RRG>
                <xsl:choose>
                    <xsl:when test="count(ROOT/RES_RESOLUTION_GLOBAL//ROW) &gt; 0">
                        <xsl:copy-of select="ROOT/RES_RESOLUTION_GLOBAL/*"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:copy-of select="ROOT/RES_RESOLUTION_GLOBAL_DEFAULT/*"/>
                    </xsl:otherwise>
                </xsl:choose>
                <NOTE_REJECTED>
                    <xsl:for-each select="//RES_RESOLUTION_GLOBAL_DEFAULT//NOTE_REJECTED_DATES//ROW">
                        <strong><xsl:value-of select="NSI_PROJECT_SECTION_TEXT"/></strong><br/>
                        <strong><xsl:value-of select="NSI_PROJECT_SUBJECT_TEXT"/></strong><br/>
                        <p><strong><xsl:value-of select="COMMENT_NUMBER"/>.</strong> <xsl:value-of select="COMMENT_TEXT"/></p>
                    </xsl:for-each>
                </NOTE_REJECTED>
            </RRG>
             <RRM>
                <xsl:choose>
                    <xsl:when test="count(ROOT/RES_RESOLUTION_MEMBER//ROW) &gt; 0">
                        <xsl:copy-of select="ROOT/RES_RESOLUTION_MEMBER/*"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:copy-of select="ROOT/RES_RESOLUTION_MEMBER_DEFAULT/*"/>
                    </xsl:otherwise>
                </xsl:choose>
            </RRM>
            <APPROVED_LIST>

            </APPROVED_LIST>
            <REQUEST_ID>
              <xsl:choose>
                    <xsl:when test="//URL_PARAMS//REQUESTID != ''">
                        <xsl:value-of select="//URL_PARAMS//REQUESTID"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="//RES_RESOLUTION_GLOBAL//REQUEST_ID"/>
                    </xsl:otherwise>
                </xsl:choose>
            </REQUEST_ID>
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
            .line.checkbox .checkbox-wrap {
                display: inline-block;
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
            /*
            .line .inputWrap input.form_button{
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
            .line .inputWrap input.form_button:focus{
                box-shadow: none;
            }
            .line .inputWrap input.form_button.nextButton{
                background-color: #319adc;
                border-color: #319adc;
                color: white;
                margin-left: 0;
                height: 35px;
            }
            .line .inputWrap input.form_button:hover{
                background-color: #0092ff;
                border-color: #0092ff;
                color: white;
            }
            */
            .line .inputWrap input.form_button.nextButton.notValidate{
                background-color: #dc3131;
                border-color: #dc3131;
            }
            .line .inputWrap input.form_button.nextButton.notValidate:hover{
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
            .radioGroup_list.line.radio label.labelFloat {
                float: none;
                display: block;
                margin-left: 0;
            }
            .radioGroup_list.line.radio label.labelFloat + label.labelFloat {
                margin-left: 0;
            }
            .line .inputWrap label.concl_approve_color {
                color: green;
            }
            .line .inputWrap label.concl_reject_color {
                color: red;
            }
            .line.checkbox input[type=checkbox]:checked + .overTrop {
                border: 1px solid #0086bd;
            }
            .line.checkbox input[type=checkbox]:checked + .overTrop:before {
                color: #0086bd;
                -webkit-box-shadow: 0 0 0 10px, 10px -10px 0 10px, 32px 0 0 20px, 0px 32px 0 20px, -5px 5px 0 10px, 20px -12px 0 11px;
                box-shadow: 0 0 0 10px, 10px -10px 0 10px, 32px 0 0 20px, 0px 32px 0 20px, -5px 5px 0 10px, 20px -12px 0 11px;
                -webkit-animation: checkbox-on 0.3s forwards;
                -o-animation: checkbox-on 0.3s forwards;
                animation: checkbox-on 0.3s forwards;
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
                display: none;
            }
        </style>
    </xsl:variable>
    <xsl:variable name="LAYOUT">
        <layout:form action="/customactions/globalConclusionSave.action">
            <layout:hidden name="requestId" value="/GLOBAL/REQUEST_ID"/>
            <layout:hidden name="documentId" value="//URL_PARAMS//DOCUMENTID"/>
            <layout:hidden name="ecpExist" value="//IS_ANY_SIGNED" xmlTag=":name:"/>
            <layout:hidden name="fileCount" value="//FILE_COUNT" xmlTag=":name:"/>
            <layout:header>Сводное заключение</layout:header>
      <h3 class="header line"><layout:extract select="//RRG//REQUEST_NAMEADRESS"/></h3>

      <layout:line/>

            <layout:simple-field label="Ведущее подразделение" class="full" required="0">
                <layout:edit type="TEXT" name="" value="//RRG//EXP_DEPARTMENT_TEXT" readonly="1"/>
            </layout:simple-field>
            <layout:hidden name="res_resolution_global__fk_exp_department" value="//RRG//FK_EXP_DEPARTMENT"/>

            <layout:simple-field label="Ведущий эксперт" class="medium" required="0">
                <layout:edit type="TEXT" name="" value="//RRG//EXP_PERSON_TEXT" readonly="1"/>
            </layout:simple-field>
            <layout:hidden name="res_resolution_global__fk_exp_person" value="//RRG//FK_EXP_PERSON"/>

            <layout:simple-field label="Результат экспертизы" class="medium" required="0">
                <!--layout:radio label="Положительное заключение" style="color: green;" name="res_resolution_global__is_approved" value="1" valueCheckedPath="//RRG//IS_APPROVED"/>
                <layout:radio label="Отрицательное заключение" style="color: red;" name="res_resolution_global__is_approved" value="0" valueCheckedPath="//RRG//IS_APPROVED"/-->
                <layout:edit type="TEXT" name="res_resolution_global__is_approved_calc_text" value="//RRG//IS_APPROVED_CALC_TEXT" readonly="1"/>
                <layout:hidden value="//RRG//IS_APPROVED_CALC" name="res_resolution_global__is_approved_calc"/>
            </layout:simple-field>

            <layout:simple-field label="Дата создания проекта" class="small" required="0">
                <layout:edit type="DATE" name="res_resolution_global__date_created" value="//RRG//DATE_CREATED" readonly="1"/>
            </layout:simple-field>

            <layout:simple-field label="Плановая дата" class="small" required="0">
                <layout:edit type="DATE" name="res_resolution_global__date_planned" value="//RRG//DATE_PLANNED" readonly="1"/>
            </layout:simple-field>

            <layout:simple-field label="Статус" class="small" required="0">
                <layout:edit type="TEXT" value="//RRG//NSI_RESOLUTION_STATUS_TEXT"  name="res_resolution_global__nsi_resolution_status_text" readonly="1"/>
                <layout:hidden name="res_resolution_global__nsi_resolution_status" value="//RRG//NSI_RESOLUTION_STATUS"/>
            </layout:simple-field>
            <h3 class="header line">Перечень локальных заключений</h3>

      <xsl:if test="count(//RES_RESOLUTION_LOCAL//ROW) &gt; 0">
           <div class="line checkBox">
                  <layout:checkbox forceCheckbox="1" id="toggleAllConcl" label="Включить все локальные заключения"/>
              </div>
      </xsl:if>

            <layout:table class="all_local_comment localConcl line checkBox" style="width:100%;" add="0" move="0">
                <layout:header>
                    <layout:cell name="№"/>
                    <layout:cell name="Включить"/>
                    <layout:cell name="Раздел"/>
                    <layout:cell name="Тематика"/>
                    <layout:cell name="Эксперт"/>
                    <layout:cell name="Результат"/>
                    <layout:cell name="Дата заключения плановая"/>
                    <layout:cell name="Открыть"/>
                </layout:header>
                <layout:body value="//RES_RESOLUTION_LOCAL//ROW" xmlTag="local_conclusion">
                    <layout:cell class="cell-position" style="text-align: center; vertical-align: middle;">

                    </layout:cell>
                     <layout:cell style="vertical-align: middle;">
                        <layout:checkbox forceCheckbox="1" xmlTag="res_resolution_local__join_is_included" value="1" valueChecked="1"/>
                        <layout:hidden xmlTag="res_resolution_global" value="JOIN_FK_RES_RESOLUTION_GLOBAL"/>
                        <layout:hidden xmlTag="res_resolution_local" value="JOIN_FK_RES_RESOLUTION_LOCAL"/>
                    </layout:cell>
                    <layout:cell>
                        <layout:edit style="width: 100%;" type="TEXTAREA" value="SEC_NSI_PROJECT_SECTION_TEXT" readonly="1"/>
                    </layout:cell>
                    <layout:cell>
                        <layout:edit style="width: 100%;" type="TEXTAREA" value="SEC_NSI_PROJECT_SUBJECT_TEXT" readonly="1"/>
                    </layout:cell>
                    <layout:cell>
                        <layout:edit style="width: 100%;" type="TEXTAREA" value="SEC_EXP_PERSON_TEXT" readonly="1"/>
                    </layout:cell>
                    <layout:cell style="text-align: center; vertical-align: middle;">
                        <layout:if test="IS_APPROVED" operator="eq" value="1">
                            <span style="color: green;"><layout:extract select="IS_APPROVED_TEXT"/></span>
                        </layout:if>
                        <layout:if test="IS_APPROVED" operator="eq" value="0">
                            <span style="color: red;"><layout:extract select="IS_APPROVED_TEXT"/></span>
                        </layout:if>
                    </layout:cell>
                    <layout:cell style="text-align: center; vertical-align: middle;">
                        <layout:extract select="DATE_PLANNED"/>
                    </layout:cell>
                    <layout:cell style="text-align: center; vertical-align: middle;">
                        <layout:anchor target="_blank" value="Открыть" hrefPath="RES_RESOLUTION_LOCAL_URL"/>
                    </layout:cell>
                </layout:body>
            </layout:table>
            <layout:simple-field label="Причины для отрицательного заключения" class="full" required="0">
                <layout:edit type="TEXTAREA" style="height: 100px;" name="res_resolution__note_rejected" value="//RRG//NOTE_REJECTED"/>
            </layout:simple-field>

            <layout:simple-field label="Примечание" class="full" required="0">
                <layout:edit type="TEXTAREA" name="res_resolution_global__note" value="//RRG//NOTE"/>
            </layout:simple-field>

         <!-- <layout:simple-field label="" class="full" required="0">
                <input type="button" value="Сформировать печатную форму" class="form_button"/>
            </layout:simple-field> -->

      <layout:simple-field label="Сводное заключение" class="small" required="0">
                <layout:file value="Загрузить" sign="true" multiple="false" pre_files="//COMBINED_FILE_LINE" id="res_resolution_global__folder_id"/>
            </layout:simple-field>

            <layout:line/>

            <layout:simple-field label="" class="medium" required="0">
                <input type="button" value="Начать согласование" class="form_button startSign" /><input type="button" value="Отменить согласование" class="form_button fileDesignButton hide" />
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
                <layout:body value="//RRM//ROW" xmlTag="add_toexp">
                    <layout:cell class="cell-position" style="text-align: center; vertical-align: middle;">

                    </layout:cell>
                    <layout:cell>
                        <layout:multiselect value="NSI_RESOLUTION_ROLE" limit="1" listSourceID="nsi_resolution_role" name="res_resolution_global_member__nsi_resolution_role" readonly="1" xmlTag=":name:"/>
                        <!--layout:extract select="NSI_RESOLUTION_ROLE_TEXT"/-->
                    </layout:cell>
                    <layout:cell>
                        <layout:multiselect value="FK_EXP_PERSON" limit="1" listSourceID="nsi_exp_person_all" name="res_resolution_global_member__fk_exp_person" readonly="1" xmlTag=":name:"/>
                        <input type="hidden" name="current_user" value="{$current_user}"/>
                        <layout:hidden name="selected_user" value="FK_EXP_PERSON"/>
                        <!--layout:extract select="EXP_PERSON_TEXT"/-->
                    </layout:cell>
                    <layout:cell>
                      <layout:multiselect value="NSI_APPROVEMENT_ROLE" limit="1" listSourceID="nsi_approvement_role" name="res_resolution_global_member__nsi_resolution_local_status"  xmlTag=":name:" readonly="1"/>
                      <!--layout:extract select="NSI_APPROVEMENT_ROLE_TEXT"/-->
                    </layout:cell>
                    <layout:cell>

                        <xsl:choose>
                            <xsl:when test="FK_EXP_PERSON=$DATA//CURRENT_USER_INFO//PERSON_ID">
                                <layout:edit type="TEXTAREA" style="width: 100%" name="res_resolution_global_member__note" value="NOTE"  xmlTag=":name:" />
                            </xsl:when>
                            <xsl:otherwise>
                                <layout:edit type="TEXTAREA" style="width: 100%" name="res_resolution_global_member__note" value="NOTE" readonly="1" xmlTag=":name:" />
                            </xsl:otherwise>
                        </xsl:choose>
                    </layout:cell>
                    <layout:cell>
                        <xsl:choose>
                            <xsl:when test="FK_EXP_PERSON=$DATA//CURRENT_USER_INFO//PERSON_ID">
                                <xsl:choose>
                                    <xsl:when test="DATE_SIGNED">
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
                        <layout:hidden xmlTag="res_resolution_global_member__date_signed" value="DATE_SIGNED"/>
                    </layout:cell>
                </layout:body>
            </layout:table>


            <layout:line/>

            <!--<layout:simple-field label="Организация создавшая" class="full" required="0">
                <layout:multiselect value="//EXP_PERMISSION/ROW_SET/ROW[IS_OWNER = '1']/FK_EXP_EXPERT" limit="1" listSourceID="nsi_exp_expert" name="exp_permission__exp_permission__fk_exp_expert_create"/>
            </layout:simple-field>

            <layout:simple-field label="Организация просматривающая" class="full" required="0">
                <layout:multiselect value="//EXP_PERMISSION/ROW_SET/ROW[IS_OWNER = '0']/FK_EXP_EXPERT" limit="1" listSourceID="nsi_exp_expert" name="exp_permission__fk_exp_expert_browsing"/>
            </layout:simple-field>-->



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
        <script>
        {B{FRM$XML_LAYOUT$V0.1-VALIDATE_SCRIPT}E}
        <![CDATA[
        var thisForm = $('form').eq(0);
        var thisFormId = thisForm.attr('id');
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
            $('.fileDesignButton').show();
            $('.sectionBtnAdd, .sectionBtnDelete').hide();
            $('.deleteElem').hide();

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
                    $statusText.val('Утверждено');
                }
                $thisPressed.removeClass('pressed');
            }
            else{
                $status.val('APPROVED');
                $statusText.val('Утверждено');
            }

            $('[data-name-filename="res_resolution_global__folder_id"] .fileInputButton').addClass('disabled');

            $('.all_local_comment input[type="checkbox"]').each(function(indx, elm){
                $(elm).attr('readonly', true);
                $(elm).addClass('readOnly');
            });

            /* добавить ридонли */
            fieldList.forEach(function(item, i, arr) {
                $('[name="'+item+'"]').attr('readonly', true);
                $('[name="'+item+'"]').addClass('readOnly');
            });

            $('[name="res_resolution_global_member__date_signed"]').val(dateRender());
        }
        function postAddToken(t, item) {
            var cUser = $('[name="current_user"]').eq(0).val();
            if (item.objectId == cUser  && $status.val() != 'APPROVED'){
                t.parents('.rowWrapTable').find('.personSign').removeClass('disable hide');
                t.parents('.rowWrapTable').find('[name="res_resolution_global_member__note"]').removeClass('readOnly').removeAttr('readonly');
            }
        }
        var fieldList=[
            'res_resolution__note_rejected',
            'res_resolution_global__note',
            ];
        var $status = $('[name="res_resolution_global__nsi_resolution_status"]');
        var $statusText = $('[name="res_resolution_global__nsi_resolution_status_text"]');

        $(function(){
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
                if (!$('.fileSign').hasClass('disabled')){
                    $(this).addClass('pressed');
                    $('.fileSign').click();
                }
            });

            $(document).on('click', '.startSign', function(){
                if (!$('.fileSign').hasClass('disabled')){
                    $(this).addClass('hide');
                    $('.fileDesignButton').removeClass('hide');
                    $('.sectionBtnAdd, .sectionBtnDelete').hide();
                    $('.deleteElem').hide();

                    /* добавить ридонли */
                    fieldList.forEach(function(item, i, arr) {
                        $('[name="'+item+'"]').attr('readonly', true).addClass('readOnly');
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
                    $statusText.val('На согласовании');
                } else {
                    $(this).addClass('disable');
                }
            });

            $(document).on('click', '.fileDesignButton', function(){
                $('.personSign').addClass('hide disable');
                /* убрать ридонли */
                fieldList.forEach(function(item, i, arr) {
                        $('[name="'+item+'"]').removeAttr('readonly');
                        $('[name="'+item+'"]').removeClass('readOnly');
                    });
                $('.date_signed').html('');
                $('[name="res_resolution_global_member__date_signed"]').val('');

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
                        console.log('Remove Sign Message for: '+thisFileId);
                        console.log(data);
                        $this.removeClass('signed');
                        $this.find('.signFileImg').remove();
                        $('.deleteElem').show();
                        $('[name="res_resolution_global_member__date_signed"]').val('');
                    });
                });

                $status.val('PROJECT');
                $statusText.val('Проект');

                $('[data-name-filename="res_resolution_global__folder_id"] .fileInputButton').removeClass('disabled');
                $('.sectionBtnAdd, .sectionBtnDelete').show();
            });

            if ($status.val()=='APPROVED'){
                _signAppletCallbackFileSigned();
            }

            if ($status.val() == 'APPROVEMENT' && $('[data-name-fileid="res_resolution_global__folder_id"] .attachmentsTable  li').length){
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


            $('#toggleAllConcl').on('change', function(){
                var isChecked = $(this).prop('checked');
                $('.localConcl input:checkbox').prop('checked', isChecked).change();
            });


            $('input, textarea').each(function(indx, elm){
                if ($(elm).attr('readonly')){
                    $(elm).addClass('readOnly');
                }
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
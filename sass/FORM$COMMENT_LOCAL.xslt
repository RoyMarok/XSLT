<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:layout="URN:html-form-layout:v0.1" xmlns="http://www.w3.org/1999/xhtml" xmlns:ex2="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLTExtension" xmlns:ctx="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLDataContext" xmlns:gbu="http://xmlns.oracle.com/MSG_GBU_doc">

    <xsl:output method="html" indent="yes" omit-xml-declaration="yes" undeclare-prefixes="yes" exclude-result-prefixes="#all"/>
    <xsl:variable name="DATA">
        <GLOBAL xmlns="">
            <REMARK_WF>
                <ROW_SET>
                    <xsl:for-each select="//REMARK/ROW_SET/ROW">
                        <ROW>
                            <xsl:copy-of select="*"/>
                            <xsl:variable name="rem_id" select="REM_ID"/>
                            <xsl:copy-of select="//REMARK_FILES//ROW[DOCUMENT=$rem_id]/*"/>
                        </ROW>
                    </xsl:for-each>
                </ROW_SET>
            </REMARK_WF>
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
            .added_files{
                display: none;
            }
            .fileCheckComplete, .fileCompleteWork{
                text-align: center;
                color: #333;
                padding: 0 10px;
                /*display: none;*/
            }
            .fileDesignButton{
                text-align: center;
                display: none;
                color: #333;
            }

            .hide{
                display: none!important;
            }

            .fileList .signFileImg {
                margin-top: 5px;
            }
        </style>
    </xsl:variable>
    <xsl:variable name="LAYOUT">
        <layout:form action="/customactions/localCommentSave.action" xmlTag="local_comment">
            <layout:hidden name="sectionId" value="//RES_SEC_ID" xmlTag=":name:"/>
            <layout:hidden name="documentId" value="//COMMENT//ID" xmlTag=":name:"/>
            <layout:hidden name="dateSigned" value="//DATE_SIGNED" class="date_signed" xmlTag=":name:"/>
            <layout:hidden name="ecpExist" value="//IS_ANY_SIGNED" xmlTag=":name:"/>
            <layout:hidden name="fileCount" value="//FILE_COUNT" xmlTag=":name:"/>

            <layout:header>Локальное замечание</layout:header>
            <h3 class="header line"><xsl:value-of select="//COMMENT//REQUEST_OBJECT_NAME"/> - <xsl:value-of select="//COMMENT//REQUEST_OBJECT_ADDRES"/></h3>
            <layout:simple-field label="Раздел ПД" class="full" required="0">
                <layout:edit type="TEXTAREA" name="res_section__nsi_project_section_text" value="//RES_SEC_NSI_PROJECT_SECTI_TEXT" xmlTag=":name:" readonly="1"/>
                <layout:hidden name="res_section__nsi_project_section" value="//RES_SEC_NSI_PROJECT_SECTION" xmlTag=":name:"/>
            </layout:simple-field>
            <layout:simple-field label="Тематика" class="full" required="0">
                <layout:edit type="TEXT" name="res_section__nsi_project_subject_text" value="//RES_SEC_NSI_PROJECT_SUBJE_TEXT" xmlTag=":name:" readonly="1"/>
                <layout:hidden name="res_section__nsi_project_subject" value="//RES_SEC_NSI_PROJECT_SUBJECT" xmlTag=":name:"/>
            </layout:simple-field>
            <layout:simple-field label="Ответственное подразделение" class="full" required="0">
                <layout:edit type="TEXT" name="res_section__fk_exp_department__exp_department_name_text" value="//RES_SEC_FK_EXP_DEPARTMENT_TEXT" xmlTag=":name:" readonly="1"/>
                <layout:hidden name="res_section__fk_exp_department__exp_department_name" value="//RES_SEC_FK_EXP_DEPARTMENT" xmlTag=":name:"/>
            </layout:simple-field>
            <layout:simple-field label="Ответственный эксперт" class="full" required="0">
                <layout:edit type="TEXT" name="res_section__fk_exp_department__exp_department_name_text" value="//RES_SEC_FK_EXP_PERSON_TEXT" xmlTag=":name:" readonly="1"/>
                <layout:hidden name="res_section__fk_exp_department__exp_department_name" value="//RES_SEC_FK_EXP_PERSON" xmlTag=":name:"/>
            </layout:simple-field>
            <layout:simple-field label="Дата создания проекта" class="small" required="0">
                <layout:edit type="DATE" name="res_comment_local__data_created" value="//DATE_CREATED" xmlTag=":name:" readonly="1"/>
            </layout:simple-field>
            <layout:simple-field label="Плановая дата" class="small" required="0">
                <layout:edit type="DATE" name="res_comment_local__date_planned" value="//RES_SEC_DATE_BEGIN_PLAN" xmlTag=":name:" readonly="1"/>
            </layout:simple-field>
            <layout:simple-field label="Статус" class="medium" required="0">
                <layout:edit type="TEXT" name="res_comment_local__nsi_comment_local_status_text" value="//NSI_COMMENT_LOCAL_STATUS_TEXT" xmlTag=":name:" readonly="1"/>
                <layout:hidden name="res_comment_local__nsi_comment_local_status" value="//NSI_COMMENT_LOCAL_STATUS" xmlTag=":name:"/>
            </layout:simple-field>

            <layout:simple-field label="Замечания по разделу нет" class="full checkBox double_line" required="0">
                <layout:checkbox forceCheckbox="1" valueXPATH="//COMMENT//IS_NO_COMMENT" valueChecked="1" name="res_comment_local__is_no_comment" label="" extractFalse="1" xmlTag=":name:"/>
            </layout:simple-field>
            <layout:simple-field label="" class="full" required="0">
                <input type="button" value="Сформировать печатную форму" class="form_button"/>
            </layout:simple-field>
            <layout:simple-field label="Файлы" class="medium" required="0">
                <layout:file value="Загрузить" id="res_comment_text__folder_id" pre_files="//COMBINED_FILE_LINE" sign="1" xmlTag=":name:"/>
            </layout:simple-field>

            <h3 class="header line">Замечание</h3>
            <layout:section label="Замечание" xmlTag="add_remark" class="topSection" select="//REMARK_WF/ROW_SET/ROW" add="1" delete="1">

                <layout:simple-field label="Номер замечания" class="small" required="0">
                    <layout:edit type="TEXT" name="res_remark__comment_number" value="REM_COMMENT_NUMBER" xmlTag=":name:" readonly="1"/>
                </layout:simple-field>
                <!--layout:simple-field label="Файлы" class="full" required="0">
                    <input type="button" value="Выбрать файлы раздела" class="form_button"/>
                </layout:simple-field>
                <table class="added_files">
                    <thead>
                        <tr>
                            <td>№</td>
                            <td>Наименование</td>
                            <td>Страницы</td>
                            <td>Примечание</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table-->

                <layout:simple-field label="Текст замечания" class="full" required="0">
                    <layout:edit type="TEXTAREA" name="res_remark__comment_text" value="REM_COMMENT_TEXT" xmlTag=":name:"/>
                </layout:simple-field>
                <layout:simple-field label="Файлы приложения" class="medium" required="0">
                    <layout:file value="Загрузить" id="res_remark__folder_id" pre_files="FILE_COMBO_LINE" />
                </layout:simple-field>
                <layout:simple-field label="Дата устранения замечания" class="small" required="0">
                    <layout:edit type="DATE" name="res_remark__date_corrected" value="REM_DATE_CORRECTED" xmlTag=":name:"/>
                </layout:simple-field>
                <layout:simple-field label="Результат устранения" class="full" required="0">
                    <layout:edit type="TEXTAREA" name="res_remark__result_corrected" value="REM_NOTE_FIX" xmlTag=":name:"/>
                </layout:simple-field>
                <layout:simple-field label="Комментарий заявителя" class="full" required="0">
                    <layout:edit type="TEXTAREA" name="res_remark__declarant_comment_text" value="REM_NOTE_DECLARENT" xmlTag=":name:"/>
                </layout:simple-field>
            </layout:section>

            <layout:simple-field label="Примечания к разделу" class="full" required="0">
                <layout:edit type="TEXTAREA" name="res_comment_local__comment_text" value="//COMMENT//COMMENT_TEXT" xmlTag=":name:"/>
            </layout:simple-field>


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
            $('.fileDesignButton').show();
            $('.sectionBtnAdd, .sectionBtnDelete').hide();
            $('.deleteElem').hide();
            $('.fileInputButton').addClass('disabled');

            /* добавить ридонли */
            fieldList.forEach(function(item, i, arr) {
                $('[name="'+item+'"]').attr('readonly', true);
                $('[name="'+item+'"]').addClass('readOnly');
            });

            $('[name="dateSigned"]').val(dateRender());

            $status.val('APPROVED');
            $statusText.val('Утверждено');
            /*saveFormUniversal($('form').eq(0), false, {success: function(){}});*/
            /* кастом экшены */
                saveFormUniversal(thisForm, false, {success: function(){}}, '/customactions/signLocalCommentBtn.action');

        }
        var fieldList=[
            'res_remark__declarant_comment_text',
            'res_remark__result_corrected',
            'res_remark__date_corrected',
            'res_remark__comment_text',
            'res_comment_local__comment_text'
        ];
        var $status = $('[name="res_comment_local__nsi_comment_local_status"]');
        var $statusText = $('[name="res_comment_local__nsi_comment_local_status_text"]');
        var thisForm = $('form').eq(0);
         $(function(){
            all_masks();
            setTimeout(function(){
                $.signECP.callbacks.globals.signAppletCallbackFileSigned = _signAppletCallbackFileSigned;
                $.signECP.callbacks.globals.allFilesSigned = _signAppletCallbackFileSigned;
            }, 1000);
            $('input, textarea').each(function(indx, elm){
                if ($(elm).attr('readonly')){
                    $(elm).addClass('readOnly');
                }
            });
            $(document).on('click', '.sectionBtnAdd, .sectionBtnDelete', function(){
                var counter=1;
                $('.section [name="res_remark__comment_number"]').each(function(indx, elm){
                    if (!$(elm).parents('.sectionTemplate').length){
                        $(elm).val(counter);
                        counter++;
                    }

                });
                setTimeout(function(){
                    $.signECP.callbacks.globals.signAppletCallbackFileSigned = _signAppletCallbackFileSigned;
                    $.signECP.callbacks.globals.allFilesSigned = _signAppletCallbackFileSigned;
                }, 1000);
            });

            $('[data-name-fileid="res_comment_text__folder_id"] .fileSign').after('<span class="fileButton fileDesignButton">Снять подпись</span>');

            setTimeout(initCheckboxes, 200);

            $(document).on('click', '.fileDesignButton', function(){

                $(this).siblings('.attachmentsTableWrapper').find('.attachmentFileRow').each(function(indx, elm){
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
                        $('.fileDesignButton').hide();
                        $('.deleteElem').show();
                        $('[name="dateSigned"]').val('');
                        $(' .fileInputButton').removeClass('disabled');
                        $('.sectionBtnAdd, .sectionBtnDelete').show();
                         /* убрать ридонли */
                        fieldList.forEach(function(item, i, arr) {
                            $('[name="'+item+'"]').removeAttr('readonly');
                            $('[name="'+item+'"]').removeClass('readOnly');
                        });
                        $('.fileInputButton').removeClass('disabled');



                        $status.val('IN_PROCESS');
                        $statusText.val('Проект');
                        /* кастом экшены */
                        saveFormUniversal(thisForm, false, {success: function(){}}, '/customactions/removeSignLocalBtn.action');
                    });
                });
            });

            if ($status.val()=='APPROVED'){
                _signAppletCallbackFileSigned();
            }
            if ($('[name="ecpExist"]').val()=='1'){
                $('.fileDesignButton').removeClass('hide');
                $('.fileDesignButton').show();
                $('.startSign').addClass('hide');
                $('.sectionBtnAdd, .sectionBtnDelete').hide();
                $('.deleteElem').hide();

                $('.AttachmentFileName').each(function(indx, elm){
                    $(elm).before('<img class="signFileImg" src="/static/typeForm/img/key_go.png" />');
                    $(elm).parents('.attachmentFileRow').addClass('signed');
                });
            }



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

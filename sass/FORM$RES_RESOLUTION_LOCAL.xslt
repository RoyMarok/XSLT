<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:layout="URN:html-form-layout:v0.1" xmlns="http://www.w3.org/1999/xhtml" xmlns:ex2="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLTExtension" xmlns:ctx="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLDataContext" xmlns:gbu="http://xmlns.oracle.com/MSG_GBU_doc">
    <xsl:output method="html" indent="yes" omit-xml-declaration="yes" undeclare-prefixes="yes" exclude-result-prefixes="#all"/>

    <xsl:variable name="DATA">
        <ROOT xmlns="">
            <TEST_VALUE>Value</TEST_VALUE>
            <MY_MULTISELECT_VALUE>galactica_admin1</MY_MULTISELECT_VALUE>
            <MY_LIST_VALUE>id1</MY_LIST_VALUE>
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
        </ROOT>
    </xsl:variable>
    <xsl:variable name="LAYOUT">
        <layout:form action="/customactions/localConclusionSave.action" xmlTag="resolution_local">
            <layout:header>Локальное заключение</layout:header>
            <h3 class="headerDesc"><xsl:value-of select="//REQUEST_NAMEADRESS"/></h3>
            <!--h2 class="header">Наименование объекта - строительный адрес</h2-->


			<layout:hidden name="documentId" value="//RES_RESOLUTION_LOCAL//ID" xmlTag=":name:"/>
			<layout:hidden name="sectionId" value="//SECTION_ID" xmlTag=":name:"/>
            <layout:hidden name="dateSigned" value="//DATE_SIGNED" class="date_signed" xmlTag=":name:"/>
            <layout:hidden name="ecpExist" value="//IS_ANY_SIGNED" xmlTag=":name:"/>
            <layout:hidden name="fileCount" value="//FILE_COUNT" xmlTag=":name:"/>

             <layout:simple-field label="Раздел ПД" class="full" required="0">
                <layout:edit type="TEXT" value="//SEC_NSI_PROJECT_SECTION_TEXT" name="project_section" xmlTag=":name:" readonly="1"/>
            </layout:simple-field>
             <layout:simple-field label="Тематика" class="full" required="0">
                <layout:edit type="TEXT" value="//SEC_NSI_PROJECT_SUBJECT_TEXT" name="project_subject" xmlTag=":name:" readonly="1"/>
            </layout:simple-field>
             <layout:simple-field label="Ответственное подразделение" class="full" required="0">
                <layout:edit type="TEXT" value="//SEC_EXP_DEPARTMENT_TEXT" name="exp_departament_text" xmlTag=":name:" readonly="1"/>
                <layout:hidden name="exp_departament" value="//SEC_EXP_DEPARTMENT" xmlTag=":name:"/>
            </layout:simple-field>
             <layout:simple-field label="Ответственный эксперт" class="medium" required="0">
                <layout:edit type="TEXT" value="//SEC_EXP_PERSON_TEXT" name="exp_person_text" xmlTag=":name:" readonly="1"/>
                <layout:hidden name="exp_person" value="SEC_EXP_PERSON" xmlTag=":name:"/>
            </layout:simple-field>
            <layout:simple-field label="Результат экспертизы" class="medium  " required="0">
				<!--xsl:choose>
					<xsl:when test="//IS_APPROVED = '0'">
						<layout:radio value="1" checked="0" name="is_approved" label="Положительное заключение" xmlTag=":name:"/>
						<layout:radio value="0" checked="1" name="is_approved" label="Отрицательное заключение" xmlTag=":name:"/>
					</xsl:when>
					<xsl:otherwise>
						<layout:radio value="1" checked="1" name="is_approved" label="Положительное заключение" xmlTag=":name:"/>
						<layout:radio value="0" checked="0" name="is_approved" label="Отрицательное заключение" xmlTag=":name:"/>
					</xsl:otherwise>
				</xsl:choose-->
                <!--layout:radio valueCheckedPath="//IS_APPROVED" value="1" name="is_approved" label="Положительное заключение" xmlTag=":name:"/>
                <layout:radio valueCheckedPath="//IS_APPROVED" value="0" name="is_approved" label="Отрицательное заключение" xmlTag=":name:"/-->
                <layout:edit type="TEXT" name="res_resolution_global__is_approved_text" value="//IS_APPROVED_CALC_TEXT" readonly="1"/>
                <layout:hidden value="//IS_APPROVED_CALC" name="is_approved"/>
            </layout:simple-field>
            <layout:simple-field label="Примечание" class="full" required="0">
                <layout:edit type="TEXTAREA" value="//NOTE" name="note" xmlTag=":name:"/>
            </layout:simple-field>
            <layout:simple-field label="Дата создания проекта" class="small" required="0">
                <layout:edit type="DATE" name="date_created" value="//DATE_CREATED" xmlTag=":name:" readonly="1"/>
            </layout:simple-field>
            <layout:simple-field label="Плановая дата" class="small" required="0">
                <layout:edit type="DATE" name="date_planned" value="//DATE_PLANNED" xmlTag=":name:" readonly="1"/>
            </layout:simple-field>
            <layout:simple-field label="Статус" class="medium" required="0">
                <layout:edit type="TEXT" value="//NSI_RLS_STATUS_TEXT" name="resolution_status_text" xmlTag=":name:" readonly="1"/>
                <layout:hidden value="//NSI_RESOLUTION_LOCAL_STATUS" name="nsi_resolution_local_status" xmlTag=":name:"/>
            </layout:simple-field>

            <layout:line/>

            <layout:simple-field label="Основания для разработки раздела" class="full" required="0">
                <layout:edit type="TEXTAREA" value="//REASON_DEVELOPMENT" name="reason_development" xmlTag=":name:"/>
            </layout:simple-field>
            <layout:simple-field label="Стадия рассмотрения ПД" class="full" required="0">
                <layout:edit type="TEXTAREA" value="//STUDY_STAGE" name="study_stage" xmlTag=":name:"/>
            </layout:simple-field>
            <layout:simple-field label="Описание основных решений" class="full" required="0">
                <layout:edit type="TEXTAREA" value="//NOTE_SOLUTION" name="note_solution" xmlTag=":name:"/>
            </layout:simple-field>
            <layout:simple-field label="Сведения об оперативных изменениях" class="full" required="0">
                <layout:edit type="TEXTAREA" value="//CHANGES_INFO" name="changes_info" xmlTag=":name:"/>
            </layout:simple-field>
            <layout:simple-field label="Выводы" class="full" required="0">
                <layout:edit type="TEXTAREA" value="//RESOLUTION_TEXT" name="resolution_text" xmlTag=":name:"/>
            </layout:simple-field>

            <layout:simple-field label="Файлы" class="medium" required="0">
                <layout:file value="Загрузить" id="folder_id" name="folder_id" sign="1" xmlTag=":name:" pre_files="//COMBINED_FILE_LINE"/>
            </layout:simple-field>

            <layout:line/>

            <!--<layout:simple-field label="Организация создавшая" class="full" required="0">
                <layout:multiselect value="//EXP_PERMISSION/ROW_SET/ROW[IS_OWNER='1']/FK_EXP_EXPERT" listSourceID="nsi_exp_expert" name="exp_expert_owner" xmlTag=":name:"/>
            </layout:simple-field>
            <layout:simple-field label="Организация просматривающая" class="full" required="0">
                <layout:multiselect value="//EXP_PERMISSION/ROW_SET/ROW[IS_OWNER!='1']/FK_EXP_EXPERT" listSourceID="nsi_exp_expert" name="exp_expert" xmlTag=":name:"/>
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

    <xsl:variable name="STYLES">
        <style>
            .hidden{
            display: none;

            }
            h3.header{
            font-weight: bold;
            font-size: 20px;
            }
            h3.headerDesc {
                color: #7D8FA4;
                font-size: 20px;
                font-weight: bold;
                padding-left: 70px;
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
            }/*
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
            .line .inputWrap textarea:read-only {
                background-color: #f7f7f7;
            }
            .line .inputWrap input:read-only:hover,
            .line .inputWrap textarea:read-only:hover,
            .line .inputWrap input:read-only:hover + img {
                border-color: #D9DBDD;
            }
            .line .inputWrap input:read-only:focus,
            .line .inputWrap textarea:read-only:focus,
            .line .inputWrap input:read-only:focus + img {
                box-shadow: none;
            }
            /*
            .line .inputWrap input:-moz-read-only,
            .line .inputWrap input:-moz-read-only + img,
            .line .inputWrap textarea:-moz-read-only {
                background-color: #f7f7f7;
            }
            .line .inputWrap input:-moz-read-only:hover,
            .line .inputWrap textarea:-moz-read-only:hover,
            .line .inputWrap input:-moz-read-only:hover + img {
                border-color: #D9DBDD;
            }
            .line .inputWrap input:-moz-read-only:focus,
            .line .inputWrap textarea:-moz-read-only:focus,
            .line .inputWrap input:-moz-read-only:focus + img {
                box-shadow: none;
            }*/

            .radioGroup_list.line.radio label.labelFloat {
                float: none;
                display: block;
                margin-left: 0;
            }
            .radioGroup_list.line.radio label.labelFloat + label.labelFloat {
                margin-left: 0;
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

    {B{FRM$XML_LAYOUT$V0.1}E}
    <xsl:template match="/">
        <xsl:call-template name="pageBuilder">
            <xsl:with-param name="customStyles" select="$STYLES"/>
            <xsl:with-param name="data" select="$DATA"/>
            <xsl:with-param name="layout" select="$LAYOUT"/>
        </xsl:call-template>

		<script type="text/javascript">
        {B{FRM$XML_LAYOUT$V0.1-VALIDATE_SCRIPT}E}
        <![CDATA[

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
            $('.deleteElem').hide();
            $('[name="folder_id"] .fileInputButton').addClass('disabled');

            /* добавить ридонли */
            fieldList.forEach(function(item, i, arr) {
                $('[name="'+item+'"]').attr('readonly', true);
                $('[name="'+item+'"]').addClass('readOnly');
            });

            $('[name="dateSigned"]').val(dateRender());

            $status.val('APPROVED');
            $statusText.val('Утверждено');

            saveFormUniversal($('form').eq(0), false, {success: function(){}});
            /* кастом экшены */
            saveFormUniversal(thisForm, false, {success: function(){}}, '/customactions/signLocalConclusionBtn.action');

        }
        var fieldList=[
            'reason_development',
            'study_stage',
            'note_solution',
            'changes_info',
            'resolution_text'
        ];
        var $status = $('[name="nsi_resolution_local_status"]');
        var $statusText = $('[name="resolution_status_text"]');
        var thisForm = $('form').eq(0);
        var thisFormId = thisForm.attr('id');
            $(function(){
                setTimeout(function(){
                $.signECP.callbacks.globals.signAppletCallbackFileSigned = _signAppletCallbackFileSigned;
                $.signECP.callbacks.globals.allFilesSigned = _signAppletCallbackFileSigned;
            }, 1000);

            $('[data-name-filename="folder_id"] .fileSign').after('<span class="fileButton fileDesignButton">Снять подпись</span>');

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
                            $('[name="'+item+'"]').removeAttr('readonly').removeClass('readOnly');
                        });
                        $('[name="folder_id"] .fileInputButton').removeClass('disabled');


                        $('[name="nsi_resolution_local_status"]').val('IN_PROCESS');
                        $('[name="resolution_status_text"]').val('Проект');
                        saveFormUniversal($('form').eq(0), false, {success: function(){}});
                        /* кастом экшены */
                        saveFormUniversal(thisForm, false, {success: function(){}}, '/customactions/removeSignLocalConclusionBtn.action');
                    });
                });
            });

            if ($status.val()=='APPROVED'){
                /*_signAppletCallbackFileSigned();*/
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

        <XML style="display: none" class="body">
          <xsl:copy-of select="."/>
        </XML>

    </xsl:template>
</xsl:stylesheet>

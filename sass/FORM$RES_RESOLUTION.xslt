<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:layout="URN:html-form-layout:v0.1" xmlns="http://www.w3.org/1999/xhtml" xmlns:ex2="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLTExtension" xmlns:ctx="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLDataContext" xmlns:gbu="http://xmlns.oracle.com/MSG_GBU_doc">
<xsl:output method="html" indent="yes" omit-xml-declaration="yes" undeclare-prefixes="yes" exclude-result-prefixes="#all"/>

    <xsl:variable name="DATA">
        <ROOT xmlns="">
            <TEST_VALUE>Value</TEST_VALUE>
            <MY_MULTISELECT_VALUE>galactica_admin1</MY_MULTISELECT_VALUE>
            <MY_LIST_VALUE>id1</MY_LIST_VALUE>
            <xsl:copy-of select="//RES_RESOLUTION/ROW_SET/ROW[1]"/>
            <FILES>
                <xsl:copy-of select="//FILES"/>
            </FILES>
            <xsl:copy-of select="/"/>
        </ROOT>
    </xsl:variable>

    <xsl:variable name="LAYOUT">
        <layout:form action="/customactions/conclusionSave.action" xmlTag="resolution">
            <layout:header>Заключение экспертизы</layout:header>
            <h3 class="headerDesc"><xsl:value-of select="//RES_RESOLUTION/ROW_SET/ROW[1]/REQUEST_NAMEADRESS"/></h3>
            <xml id="data" style="display: none">
	<xsl:copy-of select="$DATA"/>
</xml>
            <layout:hidden name="requestId" value="ROOT//URL_PARAMS//REQUESTID" xmlTag=":name:"/>

            <layout:hidden name="documentId" value="//ROOT/ROW/ID" xmlTag=":name:"/>

            <h3 class="header line">Реквизиты заключения</h3>
            <layout:simple-field label="Номер заключения" class="small" required="1">
                <layout:edit type="TEXT" id="docNumber" name="doc_number" xmlTag=":name:" value="//DOC_NUMBER" style="width:150px;"/>
                <input type="button" value="№" data-targets="docNumber,dateDompleted" data-paramNames="registryNumber,registryDate" class="form_button generate-concl-number"/>
                <label>от</label>
                <layout:edit type="DATE" id="dateDompleted" name="date_completed" value="//DATE_COMPLETED" xmlTag=":name:"/>
            </layout:simple-field>
            <layout:simple-field label="Результат" class="full radio radioGroup_list approvedChange" required="0">
                <xsl:choose>
					          <xsl:when test="//IS_APPROVED = '0'">
						            <layout:radio value="1" checked="0" name="is_approved" label="Положительное" xmlTag=":name:"/>
						            <layout:radio value="0" checked="1" name="is_approved" label="Отрицательное" xmlTag=":name:"/>
                    </xsl:when>
					          <xsl:otherwise>
						            <layout:radio value="1" checked="1" name="is_approved" label="Положительное" xmlTag=":name:"/>
						            <layout:radio value="0" checked="0" name="is_approved" label="Отрицательное" xmlTag=":name:"/>
					          </xsl:otherwise>
				        </xsl:choose>
            </layout:simple-field>
            <layout:simple-field label="Причина отрицательного заключения" class="full approvedChange_target" required="0">
                <layout:edit type="TEXTAREA" value="//NOTE_REJECTED" name="note_rejected" xmlTag=":name:"/>
            </layout:simple-field>

            <layout:line/>

            <h3 class="header line">Внесение в реестр</h3>
            <layout:simple-field label="Номер в реестре" class="small" required="1">
                <layout:edit type="TEXT" id="registryNumber" name="registry_number" xmlTag=":name:" value="//REGISTRY_NUMBER" style="width:150px;"/>
                <input type="button" value="№" data-targets="registryNumber,registryDate" data-paramNames="registryNumber,registryDate" class="form_button generate-reestr-number"/>
                <label>от</label>
                <layout:edit type="DATE" id="registryDate" name="registry_date" value="//REGISTRY_DATE" xmlTag=":name:"/>
            </layout:simple-field>
            <layout:simple-field label="Комментарий" class="full" required="0">
                <layout:edit type="TEXTAREA" value="//REGISTRY_NOTE" name="registry_note" xmlTag=":name:"/>
            </layout:simple-field>

            <layout:line/>

            <h3 class="header line">Файлы для перезачи заявителю</h3>
            <layout:simple-field label="" class="medium" required="0">
                <layout:file value="Загрузить" name="folder_info" xmlTag=":name:" pre_files="//FILES//FILE_COMBO_LINE"/>
            </layout:simple-field>
            <layout:simple-field label="Дата передачи заявителю" class="small" required="0">
                <layout:edit type="DATE" name="date_post_resolution" value="//DATE_POST_RESOLUTION" xmlTag=":name:"/>
            </layout:simple-field>


            <layout:line/>

            <!--<layout:simple-field label="Организация сдавшая" class="full" required="0">
                <layout:multiselect value="//EXP_PERMISSION/ROW_SET/ROW[IS_OWNER='1']/FK_EXP_EXPERT" limit="1" listSourceID="nsi_exp_expert" name="exp_expert_owner" xmlTag=":name:"/>
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

            .radioGroup_list.line.radio label.labelFloat {
                float: none;
                display: block;
                margin-left: 0;
            }
            .radioGroup_list.line.radio label.labelFloat + label.labelFloat {
                margin-left: 0;
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

        <XML class="body" style="display: none;">
          <xsl:copy-of select="."/>
        </XML>

        <script type="text/javascript">
            {B{FRM$XML_LAYOUT$V0.1-VALIDATE_SCRIPT}E}

        <![CDATA[

        	function generateNumbers($button, actionUrl, urlParams) {

            	targets = $button.attr('data-targets').split(','),
            	paramNames = $button.attr('data-paramNames').split(',');

            	showLoadingIndicator();

            	$.get(actionUrl, urlParams)
				.done(function(json) {

					var data = json.data;

					targets.forEach(function(item, i, arr) {
						var param = paramNames[i].trim();

						$('#' + item).val(data[param]).change();
					});
				 })
				.fail(function(jqXHR, textStatus) {
					console.log('Ошибка: ' + textStatus );
				})
				.always(function() {
					hideLoadingIndicator();
				});
        	}

            $(function(){
                $('.approvedChange input').on('change', function() {
                    $('.approvedChange_target')[['remove', 'add'][$(this).val()] + 'Class']('hidden').find('textarea').val('');
                }).filter(':checked').change();

                $('.generate-concl-number').on('click', function(){
                	var actionUrl = '/customactions/generateConclusionNumber.action',
                		urlParams = { requestId: $('input[name="requestId"]').val() };

                	generateNumbers($(this), actionUrl, urlParams);

                });

                 $('.generate-reestr-number').on('click', function(){
                	var actionUrl = '/customactions/registryConclusion.action',
                		urlParams = {
                			requestId: $('input[name="requestId"]').val(),
                			resolution: ($('input[name="is_approved"]:checked').val() == 1) ? 1 : 2
                		};

                	generateNumbers($(this), actionUrl, urlParams);

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

    </xsl:template>
</xsl:stylesheet>

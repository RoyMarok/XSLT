<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:layout="URN:html-form-layout:v0.1" xmlns="http://www.w3.org/1999/xhtml" xmlns:ex2="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLTExtension" xmlns:ctx="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLDataContext">

<xsl:output method="html" encoding="utf-8" omit-xml-declaration="yes" undeclare-prefixes="yes" exclude-result-prefixes="#all" />

<xsl:variable name="DATA">
  <GLOBAL xmlns="">
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
        line-height: 11px;
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
      .line .inputWrap input.form_button.applyButton {
        height: 35px;
        margin-right: 100px;
      }
      .line .inputWrap input.cancel {
        margin: 0;
      }
      .line .inputWrap input.form_button:hover{
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


      /* my new styles */

      .line .input-label {
        background: transparent;
        color: #D9DBDD;
        border-left: 1px solid #D9DBDD;
        border-radius: 0;
        font-size: 16px;
        padding: 5px 11px 5px 10px;
        position: relative;
        left: -38px;
        top: 1px;
      }
      .line .inputWrap input.date + img,
      .line .inputWrap input.timeInput + img {
        margin-left: -1px;
      }
      .formWrapper .formSpace {
        margin: 32px 0 25px;
        background: url(../static/typeForm/img/formSpaceBg.gif) scroll repeat-x 0 0 transparent;
      }
      .line .act-number-input {
        padding-right: 42px;
      }
      .contract-inputs {
        margin-left: 250px;
      }
      .contract-inputs {
        display: inline-block;
        width: auto;
      }
      .contract-id-date {
        display: inline-block;
        width: auto;
        margin-left: 30px;
        position: relative;
        top: 21px;
      }
      .contract-id-date a {
        text-decoration: underline;
      }
      .line .applyButton {
        float: right;
      }

        .fileDesignButton{
            text-align: center;
            display: none;
            color: #333;
        }


  </style>
</xsl:variable>

<xsl:variable name="LAYOUT">


  <layout:form action="/customactions/actSave.action" xmlTag="request">
    <layout:header>Акт</layout:header>

    <layout:line/>

    <h3 class="header line">Реквизиты акта</h3>

    <layout:simple-field label="Номер акта" class="medium contract-inputs" required="1">
      <layout:edit type="TEXT" name="con_report__doc_number" class="act-number-input" value="//ACT//DOC_NUMBER"  xmlTag=":name:"/>
      <input type="button" value="№" class="form_button afterClose" />
      <label>от</label>
      <layout:edit type="DATE" name="con_report__doc_date" value="//ACT//DOC_DATE"  xmlTag=":name:"/>
    </layout:simple-field>

    <div class="contract-id-date">
      <a href="{//ACT//DOGOVOR_URL}" target="_blank">
            По договору №<xsl:value-of select="//ACT//DOGOVOR_NUMBER"/> от <xsl:value-of select="//ACT//DOGOVOR_DATE"/>
      </a>
    </div>


    <layout:line/>

    <h3 class="header line">Подписание документа</h3>

    <layout:simple-field label="Дата подписания" class="full" required="0">
      <layout:edit type="DATE" name="con_report__date_signed" value="//ACT//DATE_SIGNED" xmlTag=":name:"/>
    </layout:simple-field>

    <layout:line/>

    <h3 class="header line">Утверждённая версия документа</h3>

    <layout:simple-field class="full" required="0">
      <layout:file value="Загрузить" sign="true" name="con_report__file_id" id="con_report__file_id" pre_files="//ACT//FILE_COMBO_LINE"  xmlTag=":name:"/>
    </layout:simple-field>

    <layout:line/>

    <!--layout:simple-field label="Организация создавшая" class="full" required="0">
      <layout:edit type="TEXT" name="EXP_PERMISSIONT__FK_EXP_EXPERT" value="ASDF"  readonly="1"  xmlTag=":name:" />
    </layout:simple-field>

    <layout:simple-field label="Организация просматривающая" class="full" required="0">
      <layout:multiselect name="EXP_PERMISSION__FK_EXP_EXPERT" limit="100" value="//MY_MULTISELECT_VALUE" listSourceID="nsi_con_contractor"  xmlTag=":name:"/>
    </layout:simple-field>

    <layout:line/-->

    <layout:hidden name="contractId" value="//URL_PARAMS//CONTRACTID"/>
    <layout:hidden name="documentId" value="//URL_PARAMS//DOCUMENTID"/>

    <layout:simple-field label="" class="full" required="0">
      <input type="button" class="form_button saveCloseButton" value="Сохранить"/>
      <div class="rightBlock"><input type="button" class="form_button saveButton" value="Применить"/>
      <input type="button" class="form_button closeButton" value="Отмена"/>
      </div>
    </layout:simple-field>

  </layout:form>




</xsl:variable>

{B{FRM$XML_LAYOUT$V0.1}E}

<xsl:template match="/">
  <xsl:call-template name="pageBuilder">
    <xsl:with-param name="customStyles" select="$STYLES" />
    <xsl:with-param name="data" select="$DATA" />
    <xsl:with-param name="layout" select="$LAYOUT" />
  </xsl:call-template>

  <script>
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
            $('[data-name-filename="con_report__file_id"] .fileInputButton').addClass('disabled');

            /* добавить ридонли */
            fieldList.forEach(function(item, i, arr) {
                $('input[name="'+item+'"]').attr('readonly', true);
                $('input[name="'+item+'"]').addClass('readOnly');
            });

            $('.deleteElem').hide();
            $('[name="con_report__date_signed"]').val(dateRender());
        }
        var fieldList=[
            'con_report__doc_number',
            'con_report__doc_date',
            'con_report__date_signed'
            ];
    $(function(){
        var $form = $('form').eq(0);
        setTimeout(function(){
                $.signECP.callbacks.globals.signAppletCallbackFileSigned = _signAppletCallbackFileSigned;
                $.signECP.callbacks.globals.allFilesSigned = _signAppletCallbackFileSigned;
            }, 1000);

        $('[data-name-filename="con_report__file_id"] .fileSign').after('<span class="fileButton fileDesignButton">Снять подпись</span>');

        $(document).on('click', '.fileDesignButton', function(){
                $(this).siblings('.attachmentsTableWrapper').find('.attachmentFileRow').each(function(indx, elm){
                    var thisFileId = $(elm).attr('id');
                    $this = $(elm);
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

                    });
                });
                $('[name="con_report__date_signed"]').val('');
                $('[data-name-filename="con_report__file_id"] .fileInputButton').removeClass('disabled');
               /* убрать ридонли */
                fieldList.forEach(function(item, i, arr) {
                        $('input[name="'+item+'"]').removeAttr('readonly');
                        $('input[name="'+item+'"]').removeClass('readOnly');
                    });
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

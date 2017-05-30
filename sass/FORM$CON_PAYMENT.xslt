<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:layout="URN:html-form-layout:v0.1" xmlns="http://www.w3.org/1999/xhtml" xmlns:ex2="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLTExtension" xmlns:ctx="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLDataContext" xmlns:gbu="http://xmlns.oracle.com/MSG_GBU_doc">
    <xsl:output method="html" indent="yes" omit-xml-declaration="yes" undeclare-prefixes="yes" exclude-result-prefixes="#all"/>

<xsl:variable name="DATA">
  <GLOBAL xmlns="">
    <INVOICEID>
    <xsl:choose>
      <xsl:when test="//PAYMENT//FK_CON_INVOICE != ''">
        <xsl:value-of select="//PAYMENT//FK_CON_INVOICE"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="/ROOT/URL_PARAMS//INVOICEID"/>
      </xsl:otherwise>
    </xsl:choose>
    </INVOICEID>
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
            </style>
    </xsl:variable>
    <xsl:variable name="LAYOUT">
        <layout:form action="/customactions/paymentInfSave.action">
            <layout:hidden name="invoiceId" value="//GLOBAL/INVOICEID"/>
            <layout:hidden name="documentId" value="//URL_PARAMS//DOCUMENTID"/>

            <layout:header>Внесение сведений об оплате</layout:header>

            <layout:simple-field label="Дата оплаты" class="small" required="1">
                <layout:edit type="DATE" name="con_payment__date_paid" value="//PAYMENT//DATA_PAID"/>
            </layout:simple-field>

            <layout:simple-field label="Сумма" class="medium" required="1">
                <layout:edit class="summ" type="TEXT" name="con_payment__sum_paid" value="//PAYMENT//SUM_PAID"/>
            </layout:simple-field>

            <layout:simple-field label="Номер платежного документа" class="medium" required="1">
                <layout:edit type="TEXT" name="con_payment__order_number" value="//PAYMENT//ORDER_NUMBER"/>
            </layout:simple-field>

              <layout:simple-field label="Скан платежного документа" class="small" required="0">
                <layout:file value="Загрузить" sign="" multiple="" pre_files="//PAYMENT//FILE_COMBO_LINE" id="con_payment__file_id_order"/>
            </layout:simple-field>

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

        <xml style="display: none">
          <xsl:copy-of select="$DATA"/>
        </xml>
       <script src="/static/JQueryPlugins/jquery.maskedinput-1.2.2.js"></script>
       <script>
        <xsl:text disable-output-escaping="yes">
         {B{FRM$XML_LAYOUT$V0.1-VALIDATE_SCRIPT}E}
        <![CDATA[



            $(function(){

                $('[data-name="res_section__fk_exp_department"]').on('change', function() {
                    var name = $(this).data('name'),
                        value = $('input:hidden[name="' + name + '"]').val(),
                        $inputs = $('[data-identifier="nsi_exp_person"]');

                    $inputs.each(function(){
                        $(this).tokenInput('destroy');
                        initTokenInput($(this), {componentsUrl: '/portal'});
                        $(this).tokenInput('setParam', { paramNames: 'EXP_DEPARTMENT', parameters: value})
                    });

                });


                $('.approvedChange input').on('change', function() {
                    $('.approvedChange_target')[['remove', 'add'][$(this).val()] + 'Class']('hidden');
                }).filter(':checked').change();

                $('.summ').keypress(function(event) {
                    if (event.which != 46 && (event.which < 47 || event.which > 59))
                    {
                        event.preventDefault();
                        if ((event.which == 46) && ($(this).indexOf('.') != -1)) {
                            event.preventDefault();
                        }
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
        //]]>
        </xsl:text>
        </script>

    </xsl:template>
</xsl:stylesheet>

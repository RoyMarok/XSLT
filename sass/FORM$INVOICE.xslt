<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:layout="URN:html-form-layout:v0.1" xmlns="http://www.w3.org/1999/xhtml" xmlns:ex2="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLTExtension" xmlns:ctx="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLDataContext" xmlns:gbu="http://xmlns.oracle.com/MSG_GBU_doc">
    <xsl:output method="html" indent="yes" omit-xml-declaration="yes" undeclare-prefixes="yes" exclude-result-prefixes="#all"/>

<!--     <xsl:variable name="DATA">
        <ROOT xmlns="">
            <TEST_VALUE>Value</TEST_VALUE>
            <MY_MULTISELECT_VALUE>galactica_admin1</MY_MULTISELECT_VALUE>
            <MY_LIST_VALUE>id1</MY_LIST_VALUE>
            <xsl:copy-of select="//RES_RESOLUTION/ROW_SET/ROW[1]"/>
        </ROOT>
    </xsl:variable> -->


<xsl:variable name="DATA">
  <GLOBAL xmlns="">
    <TEST_VALUE></TEST_VALUE>
    <ZERO_VALUE>0</ZERO_VALUE>
    <DEFAULT_LIST><ROW></ROW></DEFAULT_LIST>
    <LOCAL_INVOCE>
        <xsl:choose>
            <xsl:when test="//INVICE//ID">
                <xsl:copy-of select="//INVICE/ROW_SET/ROW"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy-of select="//INVICE_DEFAULT//ROW"/>
            </xsl:otherwise>
        </xsl:choose>
    </LOCAL_INVOCE>
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

            /* new styles */

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
            .formWrapper .formSpace {
                margin: 32px 0 25px;
                background: url(../static/typeForm/img/formSpaceBg.gif) scroll repeat-x 0 0 transparent;
            }
            .cellWrapTable textarea {
                width: 100%;
            }


        </style>
    </xsl:variable>
    <xsl:variable name="LAYOUT">
        <layout:form action="/customactions/invoiceSave.action" xmlTag="invoice">
            <layout:header>СЧЕТ</layout:header>


            <layout:hidden name="documentId" value="//INVICE/ROW_SET/ROW/ID"/>
            <layout:hidden name="contractId" value="//GLOBAL//LOCAL_INVOCE//DOGOVOR_ID"/>

            <h3 class="header line">Реквизиты счета</h3>
            <layout:simple-field label="Номер счета" class="small" required="1">
                <layout:edit type="TEXT" id="docNumber" name="con_invoice__doc_number" xmlTag=":name:" value="//INVICE//DOC_NUMBER" style="width:150px;"/>
                <input type="button" value="№" data-targets="docNumber,dateDompleted" data-paramNames="registryNumber,registryDate" class="form_button generate-concl-number"/>
                <label>от</label>
                <layout:edit type="DATE" id="dateDompleted" name="con_invoice__doc_date" value="//INVICE//DOC_DATE" xmlTag=":name:"/>
                <label>по договору №<xsl:value-of select="//DOGOVOR_NUMBER"/> от <xsl:value-of select="//DOGOVOR_DATE"/></label>
            </layout:simple-field>

            <layout:simple-field label="Примечание к счету" class="full" required="0">
                <layout:edit type="TEXTAREA" value="//INVICE//NOTE" name="con_invoice__note" xmlTag=":name:"/>
            </layout:simple-field>

            <h3 class="header line">Спецификация</h3>
            <layout:table class="specs_table" style="width:100%;" add="1" move="1">
                <layout:header>
                    <layout:cell name="Предмет договора" width=""/>
                    <layout:cell name="Количество" width=""/>
                    <layout:cell name="Цена" width=""/>
                    <layout:cell name="Стоимость" width=""/>
                </layout:header>
                <layout:body value="//INVICE_ITEMS//ROW" xmlTag="con_invoice_item">
                    <layout:cell>
                        <layout:edit type="TEXTAREA" name="con_invoice_item__name" value="NAME" style="" xmlTag=":name:"/>
                    </layout:cell>
                    <layout:cell>
                       <layout:edit type="TEXT"  name="con_invoice_item__item_count" value="ITEM_COUNT" xmlTag=":name:"/>
                    </layout:cell>
                    <layout:cell>
                        <layout:edit type="TEXT"  name="con_invoice_item__item_price" value="ITEM_PRICE" xmlTag=":name:"/>
                    </layout:cell>
                    <layout:cell>
                        <layout:edit type="TEXT" name="con_invoice_item__sum" value="ITEM_COUNT" xmlTag=":name:"/>
                    </layout:cell>
                </layout:body>
            </layout:table>

            <layout:simple-field label="Итого" class="small" required="0">
                <layout:edit type="TEXT" name="con_invoice__doc_sum" xmlTag=":name:" value="//INVICE//DOC_SUM" style="width:150px;" readonly="1" />
            </layout:simple-field>
            <layout:simple-field label="Стоимость по договору" class="small" required="0">
                <layout:edit type="TEXT" name="con_contract__doc_sum" xmlTag=":name:" value="//LOCAL_INVOCE//DOGOVOR_SUM" style="width:150px;" readonly="1" />
                <label>Ставка НДС</label>
                <layout:select name="con_contract__nsi_value_vat" value="//LOCAL_INVOCE//DOGOVOR_NSI_VALUE_VAT" listSourceID="nsi_value_vat" />
                <label>НДС</label>
                <layout:edit type="TEXT" name="con_contract__doc_sum_vat" xmlTag=":name:" value="//LOCAL_INVOCE//DOGOVOR_SUM_VAT" readonly="1" style="width:150px;"/>
            </layout:simple-field>

            <layout:simple-field label="Итого к оплате" class="small" required="0">
                <layout:edit type="TEXT" name="con_contract__doc_sum_total" xmlTag=":name:" value="//LOCAL_INVOCE//DOGOVOR_SUM_TOTAL" style="width:150px;" readonly="1" />
            </layout:simple-field>

            <!--layout:simple-field label="Итого прописью" class="small" required="0">
                <layout:edit type="TEXT" name="con_contract__doc_sum_total" xmlTag=":name:" value="//INVICE//DOC_SUM_TOTAL" style="width:150px;" readonly="1" />
            </layout:simple-field-->

             <layout:line/>

            <h3 class="header line">Утвержденный документ</h3>
            <layout:simple-field label="" class="small" required="1">
                <layout:file value="Загрузить" sign="1" multiple="" pre_files="//INVICE//FILE_COMBO_LINE" id="con_invoice__file_id"/>
            </layout:simple-field>

            <layout:line/>


            <h3 class="header line">Сведения об оплате</h3>
            <layout:section label="Сведения об оплате" xmlTag="con_payment_element" class="topSection" select="//INVICE_PAYMENT/ROW_SET/ROW[IS_DECLARANT_INFO='0']" add="1">
                <layout:simple-field label="Оплаченная сумма" class="small" required="0">
                    <layout:edit type="TEXT" name="con_payment__sum_paid" xmlTag=":name:" value="SUM_PAID" />
                </layout:simple-field>
                <layout:simple-field label="Дата поступления платежа" class="medium" required="0">
                    <layout:edit type="DATE" name="con_payment__date_received" xmlTag=":name:" value="DATA_PAID"/>
                </layout:simple-field>
                <layout:hidden value="//GLOBAL//ZERO_VALUE" name="is_declarant_info" xmlTag=":name:"/>
            </layout:section>

            <layout:line/>

            <layout:simple-field label="Итого оплачено" class="medium" required="0">
                <layout:edit type="TEXT" name="con_invoice__sum_paid" xmlTag=":name:" value="//INVICE//SUM_PAID" readonly="1"/>
            </layout:simple-field>
            <layout:simple-field label="Процент от суммы по счету" class="medium" required="0">
                <layout:edit type="TEXT" name="con_invoice__sum_paid_proc" xmlTag=":name:" value="//TEST_VALUE" readonly="1"/>
            </layout:simple-field>

            <layout:line/>

            <h3 class="header line">Сведения об аннулировании</h3>
            <layout:simple-field label="Счет аннулирован" class="full double_line checkBox">
                <layout:checkbox forceCheckbox="1" label="" name="con_invoice__is_annulled" valueXPATH="//INVICE//IS_ANNULLED" valueChecked="1" xmlTag=":name:"/>
            </layout:simple-field>
            <!--h3 class="header line">Внесение в реестр</h3>
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

            <h3 class="header line">Файлы для передачи заявителю</h3>
            <layout:simple-field label="" class="medium" required="0">
                <layout:file value="Загрузить" name="folder_info" xmlTag=":name:" pre_files="//FILES//FILE_COMBO_LINE"/>
            </layout:simple-field>
            <layout:simple-field label="Дата передачи заявителю" class="small" required="0">
                <layout:edit type="DATE" name="date_post_resolution" value="//DATE_POST_RESOLUTION" xmlTag=":name:"/>
            </layout:simple-field-->








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



    {B{FRM$XML_LAYOUT$V0.1}E}

    <xsl:template match="/">

        <xsl:call-template name="pageBuilder">
            <xsl:with-param name="customStyles" select="$STYLES"/>
            <xsl:with-param name="data" select="$DATA"/>
            <xsl:with-param name="layout" select="$LAYOUT"/>
        </xsl:call-template>

        <xml id="data" style="display: none">
            <xsl:copy-of select="$DATA"/>
        </xml>

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
            function sumCalc(){
                var docSum = 0;
                    $('[name="con_invoice_item__sum"]').each(function(indx, elm){
                        $(elm).val($(elm).parents('.rowWrapTable').find('[name="con_invoice_item__item_count"]').val()*
                        $(elm).parents('.rowWrapTable').find('[name="con_invoice_item__item_price"]').val());
                        docSum+=+($(elm).val());
                    });
                    $('[name="con_invoice__doc_sum"]').val(docSum);
            }
            function paidSum(){
                var sumPaid = 0;
                $('[name="con_payment__sum_paid"]').each(function(indx, elm){
                    var correctedVal = $(elm).val().replace( /,/g, "." );
                    $(elm).val(correctedVal);
                    sumPaid+= +(correctedVal);
                });
                $('[name="con_invoice__sum_paid"]').val(sumPaid);
                var docSum = $('[name="con_contract__doc_sum_total"]').val();
                if (sumPaid>0 && docSum>0){
                    var calcSum = (sumPaid/docSum)*100;
                    calcSum = Math.round(calcSum);
                    $('[name="con_invoice__sum_paid_proc"]').val(calcSum);
                }

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

                sumCalc();
                $(document).on('change', '.specs_table input, .specs_table textarea', function(){
                    sumCalc();
                });
                $(document).on('click', '.sectionBtnAdd , .sectionBtnDelete', function(){
                    sumCalc();
                });

                paidSum();

                $(document).on('change', 'input[name="con_payment__sum_paid"] , input[name="con_payment__date_received"]', function(){paidSum();});

                $(document).on('change', '[name="con_contract__nsi_value_vat"]', function(){
                    var ndsValue = $('[name="con_contract__doc_sum"]').val()*$(this).val()/100;
                    ndsValue = Math.round(ndsValue*100)/100;
                    if (isNaN(ndsValue)){
                        ndsValue = 0;
                    }
                    $('[name="con_contract__doc_sum_vat"]').val(ndsValue);
                    $('[name="con_contract__doc_sum_total"]').val(+$('[name="con_contract__doc_sum"]').val()+ (+ndsValue));
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
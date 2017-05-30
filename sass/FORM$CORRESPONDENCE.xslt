<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:layout="URN:html-form-layout:v0.1" xmlns="http://www.w3.org/1999/xhtml" xmlns:ex2="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLTExtension" xmlns:ctx="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLDataContext" xmlns:gbu="http://xmlns.oracle.com/MSG_GBU_doc">

<xsl:output method="html" indent="yes" omit-xml-declaration="yes" undeclare-prefixes="yes" exclude-result-prefixes="#all"/>

    <xsl:variable name="DATA">
        <GLOBAL xmlns="">
          <RD>
            <xsl:copy-of select="/ROOT/REQ_DISPATCH//ROW[1]/*"/>
          </RD>
          <RDR>
            <xsl:choose>
              <xsl:when test="count(//REQ_DISPATCH_RECIPIENT//ROW) = 0">
                <ROW_SET>
                  <ROW></ROW>
                </ROW_SET>
              </xsl:when>
              <xsl:otherwise>
                <xsl:copy-of select="//REQ_DISPATCH_RECIPIENT"/>
              </xsl:otherwise>
            </xsl:choose>
          </RDR>
          <EASY_USE>
            <REQUEST_ID>
            <xsl:choose>
              <xsl:when test="/ROOT/REQ_DISPATCH//ROW[1]/FK_REQ_REQUEST != ''">
                <xsl:value-of select="/ROOT/REQ_DISPATCH//ROW[1]/FK_REQ_REQUEST"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="/ROOT/URL_PARAMS//REQUESTID"/>
              </xsl:otherwise>
            </xsl:choose>
          </REQUEST_ID>
          <NSI_DISPATCH_SUBJECT>
              <xsl:choose>
                <xsl:when test="/ROOT/REQ_DISPATCH//ROW[1]/DISPATCH_SUBJECT_NAME != ''">
                  <xsl:value-of select="/ROOT/REQ_DISPATCH//ROW[1]/DISPATCH_SUBJECT_NAME"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="//URL_PARAMS//NSI_DISPATCH_SUBJECT"/>
                </xsl:otherwise>
              </xsl:choose>
          </NSI_DISPATCH_SUBJECT>
          </EASY_USE>

          <COMBINED_FILE_LINE>
                    <xsl:value-of select="string-join(//REQ_DISPATCH//FILES//FILE_COMBO_LINE, '||')"/>
            </COMBINED_FILE_LINE>
            <IS_ANY_SIGNED>
                <xsl:choose>
                    <xsl:when test="count(//REQ_DISPATCH//FILES//ROW[FILE_ECP=1]) &gt; 0">1</xsl:when>
                    <xsl:otherwise>0</xsl:otherwise>
                </xsl:choose>
            </IS_ANY_SIGNED>
            <FILE_COUNT><xsl:value-of select="count(//REQ_DISPATCH//FILES//ROW)"/></FILE_COUNT>

          <xsl:copy-of select="/"/>
        </GLOBAL>
    </xsl:variable>

    <xsl:variable name="LAYOUT">
        <layout:form action="/customactions/dispatchSave.action">

          <layout:hidden name="requestId" value="//EASY_USE/REQUEST_ID"  xmlTag=":name:"/>
          <layout:hidden name="documentId" value="//URL_PARAMS//DOCUMENTID" xmlTag=":name:"/>
           <layout:hidden name="ecpExist" value="//IS_ANY_SIGNED" xmlTag=":name:"/>
            <layout:hidden name="fileCount" value="//FILE_COUNT" xmlTag=":name:"/>
          <layout:hidden name="currentOrg" value="//CURRENT_USER//CONTRACTORID" xmlTag=":name:"/>

          <layout:header>Корреспонденция</layout:header>

          <h3 class="header line">Выбор типа документа</h3>

          <layout:line/>

          <layout:simple-field label="Тип документа корреспонденции" class="full double_line " required="1">
              <layout:select name="req_dispatch__nsi_dispatch_subject" value="//EASY_USE/NSI_DISPATCH_SUBJECT" listSourceID="nsi_dispatch_subject" xmlTag=":name:"/>
          </layout:simple-field>

          <layout:simple-field label="По обращению" class="full" required="1">
              <layout:multiselect name="req_dispatch__fk_req_request" value="//EASY_USE/REQUEST_ID"  limit="1" listSourceID="nsi_request_all"  xmlTag=":name:"/>
          </layout:simple-field>

          <h3 class="header line">Основная регистрация</h3>

          <layout:simple-field label="Регистрационный номер" class="medium" required="1">
            <layout:edit type="TEXT" name="req_dispatch__doc_number" value="//RD/DOC_NUMBER"  xmlTag=":name:"/>
            <input type="button" value="№" class="form_button afterClose" />
            <label>от</label>
            <layout:edit type="DATE" name="req_dispatch__doc_date" value="//RD/DOC_DATE"  xmlTag=":name:"/>
          </layout:simple-field>

          <layout:simple-field label="Вид поступления документа" class="medium">
            <layout:select name="req_dispatch__nsi_request_type" value="//RD/NSI_REQUEST_TYPE" listSourceID="nsi_request_type"  xmlTag=":name:"/>
          </layout:simple-field>

          <layout:simple-field label="Тип документа" class="medium" required="1" >
            <layout:select id="processDirection" name="req_dispatch__nsi_process_direction" value="//RD/NSI_PROCESS_DIRECTION" listSourceID="nsi_process_direction"  xmlTag=":name:"/>
            <label for="docType">Вид</label>
            <layout:select id="dispatchType" name="req_dispatch__nsi_dispatch_type" value="//RD/NSI_DISPATCH_TYPE" listSourceID="nsi_dispatch_type"  xmlTag=":name:"/>
          </layout:simple-field>

          <layout:simple-field label="Предыдущий документ" class="medium prevDoc">
            <layout:multiselect name="req_dispatch__fk_req_dispatch_previos" limit="1" paramnames="REQ_REQUEST_ID" parametersXPATH="/GLOBAL/REQUEST_ID"  value="//RD/FK_REQ_DISPATCH_PREVIOS" listSourceID="nsi_req_dispatch_previus"  xmlTag=":name:"/>
          </layout:simple-field>

          <layout:simple-field label="На номер" class="medium numberIn">
            <layout:edit type="TEXT" name="req_dispatch__doc_number_in" value="//RD/DOC_NUMBER_IN"  xmlTag=":name:"/>
            <label>от</label>
            <layout:edit type="DATE" name="req_dispatch__doc_date_in" value="//RD/DOC_DATE_IN"  xmlTag=":name:"/>
          </layout:simple-field>

          <layout:simple-field label="Номер исходящий" class="medium numberOut">
            <layout:edit type="TEXT" name="req_dispatch__doc_number_out" value="//RD/DOC_NUMBER_OUT" xmlTag=":name:" />
            <label>от</label>
            <layout:edit type="DATE" name="req_dispatch__doc_date_out" value="//RD/DOC_DATE_OUT"  xmlTag=":name:"/>
          </layout:simple-field>

          <layout:simple-field label="Содержание" class="full">
            <layout:edit type="TEXTAREA" name="req_dispatch__note" value="//RD/NOTE"  xmlTag=":name:"/>
          </layout:simple-field>

          <layout:line/>

          <h3 class="header line">Адресаты документа</h3>

          <layout:simple-field label="Отправитель" class="full">
            <layout:multiselect  name="req_dispatch__fk_con_contractor_from" value="//RD/FK_CON_CONTRACTOR_FROM" listSourceID="nsi_con_contractor" limit="1" xmlTag=":name:"/>
          </layout:simple-field>

          <layout:simple-field label="ФИО" class="full">
            <layout:multiselect name="req_dispatch__fk_con_person_from" value="//RD/FK_CON_PERSON_FROM" limit="1" paramnames="CON_CONTRACTOR_ID" parametersXPATH="//RS/FK_CON_CONTRACTOR_FROM"  listSourceID="nsi_con_person2"  xmlTag=":name:" />
          </layout:simple-field>

          <layout:section label="Получатель" xmlTag="DISPATCH_RECIPIENT" class="topSection" select="//RDR//ROW" add="1" delete="1">
            <layout:simple-field label="Получатель" class="full con-contactor">
              <layout:multiselect  name="req_dispatch_recipient__fk_con_contractor" value="FK_CON_CONTRACTOR" listSourceID="nsi_con_contractor" limit="1" xmlTag=":name:"/>
            </layout:simple-field>

            <layout:simple-field label="ФИО" class="full con-person">
              <layout:multiselect name="req_dispatch_recipient__fk_con_person" value="FK_CON_PERSON" paramnames="CON_CONTRACTOR_ID" parametersXPATH="FK_CON_CONTRACTOR_FROM"  listSourceID="nsi_con_person2"  limit="1"  xmlTag=":name:" />
            </layout:simple-field>
          </layout:section>

          <h3 class="header line">Приложенные файлы</h3>

          <layout:simple-field label="Файлы" class="full">
            <layout:file value="Загрузить" sign="" multiple="true" pre_files="//COMBINED_FILE_LINE" id="req_dispatch__folder_id" name="req_dispatch__folder_id" xmlTag=":name:"/>
          </layout:simple-field>

          <layout:line/>

          <!--layout:simple-field label="Организация создавшая" class="full" required="0">
            <layout:multiselect value="//EXP_PERMISSION/ROW_SET/ROW[IS_OWNER = '1']/FK_EXP_EXPERT" limit="1" listSourceID="nsi_exp_expert" name="exp_permission__exp_permission__fk_exp_expert_create"/>
          </layout:simple-field>

          <layout:simple-field label="Организация просматривающая" class="full" required="0">
            <layout:multiselect value="//EXP_PERMISSION/ROW_SET/ROW[IS_OWNER = '0']/FK_EXP_EXPERT" limit="1" listSourceID="nsi_exp_expert" name="exp_permission__fk_exp_expert_browsing"/>
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
        </style>
    </xsl:variable>

    {B{FRM$XML_LAYOUT$V0.1}E}
    <!-- **************************** Основной темплейт ******************************** -->
    <xsl:template match="/">
        <xsl:call-template name="pageBuilder">
            <xsl:with-param name="customStyles" select="$STYLES" />
            <xsl:with-param name="data" select="$DATA"/>
            <xsl:with-param name="layout" select="$LAYOUT"/>
        </xsl:call-template>
        <script>
        {B{FRM$XML_LAYOUT$V0.1-VALIDATE_SCRIPT}E}
        </script>
        <script>
          var currentUser = {
            contractorId : '<xsl:value-of select="//CURRENT_USER//CONTRACTORID"/>',
            presonId : '<xsl:value-of select="//CURRENT_USER//PERSONID"/>'
          }
          <![CDATA[

            var toggle = function () {
              var processDirection = $('#processDirection').val(),
              dispatchType = $('#dispatchType').val(),
              prevDoc = $('.prevDoc'),
              numberIn = $('.numberIn'),
              numberOut = $('.numberOut');


              if (dispatchType === 'ANSWER' || dispatchType === 'REPEATED') {
                prevDoc.show().find('input').prop('disabled', false);
              } else {
                prevDoc.hide().find('input').prop('disabled', true);
              }
              if (processDirection === 'OUT' || (processDirection === 'IN' && dispatchType === 'ANSWER')) {
                numberIn.show().find('input').prop('disabled', false);
              } else {
                numberIn.hide().find('input').prop('disabled', true);
              }

              if (processDirection === 'IN') {
                numberOut.show().find('input').prop('disabled', false);
              } else {
                numberOut.hide().find('input').prop('disabled', true);
              }

            }

            function postAddToken(t, item) {
                if (t.attr('data-name')=="req_dispatch_recipient__fk_con_contractor"){
                    $('[data-name="req_dispatch_recipient__fk_con_person"]').tokenInput('setParam', {paramNames: 'CON_CONTRACTOR_ID', parameters: item.objectId});
                }
                if (t.attr('data-name')=="req_dispatch__fk_con_contractor_from"){
                    $('[data-name="req_dispatch__fk_con_person_from"]').tokenInput('setParam', {paramNames: 'CON_CONTRACTOR_ID', parameters: item.objectId});
                }

            }


            $(function(){

                setTimeout(function(){
                  $('#processDirection').change();
                }, 1000);
              toggle();
              $('#processDirection').on('change', function(){
                var $fromContractor = $('[data-name="req_dispatch__fk_con_contractor_from"]'),
                    $fromPerson = $('[data-name="req_dispatch__fk_con_person_from"]'),
                    $toContractor = $('[data-name="req_dispatch_recipient__fk_con_contractor"]').first(),
                    $toPerson = $('[data-name="req_dispatch_recipient__fk_con_person"]').first();

                toggle();

                switch ($(this).val()) {
                  case 'IN':
                      $toContractor.tokenInput('setValues', currentUser.contractorId);
                      $toPerson.tokenInput('setValues', currentUser.presonId);
                      $fromContractor.tokenInput('setValues', '');
                      $fromPerson.tokenInput('setValues', '');
                    break;
                  case 'OUT':
                      $fromContractor.tokenInput('setValues', currentUser.contractorId);
                      $fromPerson.tokenInput('setValues', currentUser.presonId);
                      $toContractor.tokenInput('setValues', '');
                      $toPerson.tokenInput('setValues', '');
                    break
                  default:
                    return false;
                }
              });

              $('#dispatchType').on('change', function(){
                toggle();
              });

              $('[data-name="req_dispatch__fk_con_contractor_from"]').on('change', function() {
                  var name = $(this).data('name'),
                      value = $('input:hidden[name="' + name + '"]').val(),
                      $inputs = $('[data-name="req_dispatch__fk_con_person_from"]');

                  $inputs.each(function(){
                      $(this).tokenInput('destroy');
                      initTokenInput($(this), {componentsUrl: '/components'});
                      $(this).tokenInput('setParam', { paramNames: 'CON_CONTRACTOR_ID', parameters: value});
                  });

              });

              $(document).on('change', '[data-name="req_dispatch_recipient__fk_con_contractor"]', function(){
                var name = $(this).data('name'),
                    value = $(this).closest('.line').find('input:hidden[name="' + name + '"]').val(),
                    $input = $(this).closest('.con-contactor').next('.con-person').find('[data-name="req_dispatch_recipient__fk_con_person"]');

                $input.tokenInput('destroy');
                initTokenInput($input, {componentsUrl: '/components'});
                $input.tokenInput('setParam', { paramNames: 'CON_CONTRACTOR_ID', parameters: value});

              });

              $('.closeButton').click(function(){
                  window.close();
              });

              $('.saveCloseButton').click(function(){
                    if (step_validate($('form')).result){
                        $(this).removeClass('notValidate');
                        makeFileXmlTag();
                        saveFormUniversal($('form').eq(0), false, {success: function(){}}, '/customactions/closeTaskBtn.action');
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
                        saveFormUniversal($('form').eq(0), false, {success: function(){}}, '/customactions/closeTaskBtn.action');
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

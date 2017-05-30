<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:layout="URN:html-form-layout:v0.1" xmlns="http://www.w3.org/1999/xhtml" xmlns:ex2="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLTExtension" xmlns:ctx="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLDataContext" xmlns:gbu="http://xmlns.oracle.com/MSG_GBU_doc">
    <xsl:output method="html" indent="yes" omit-xml-declaration="yes" undeclare-prefixes="yes" exclude-result-prefixes="#all"/>

<xsl:variable name="DATA">
  <GLOBAL xmlns="">
    <REQUEST_ID>
    <xsl:choose>
      <xsl:when test="/ROOT/RES_SECTION//FK_REQ_REQUEST != ''">
        <xsl:value-of select="//RES_SECTION//ROW[1]/FK_REQ_REQUEST"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="/ROOT/URL_PARAMS//REQUESTID"/>
      </xsl:otherwise>
    </xsl:choose>
    </REQUEST_ID>
    <RS>
      <xsl:choose>
        <xsl:when test="/ROOT/URL_PARAMS//DOCUMENTID != ''">
          <xsl:copy-of select="//RES_SECTION//ROW[1]"/>
      </xsl:when>
      <xsl:otherwise>
            <REQUEST_NSI_OBJECT_TYPE><xsl:value-of select="//RES_SECTION_DEFAULT//ROW[1]/REQUEST_NSI_OBJECT_TYPE"/></REQUEST_NSI_OBJECT_TYPE>
            <DATE_BEGIN_PLAN><xsl:value-of select="//RES_SECTION_DEFAULT//ROW[1]/DATE_BEGIN_PLAN_MAX"/></DATE_BEGIN_PLAN>
            <DATE_COMMENT_PLAN><xsl:value-of select="//RES_SECTION_DEFAULT//ROW[1]/DATE_COMMENT_PLAN_MAX"/></DATE_COMMENT_PLAN>
            <DATE_RESOLUTION_PLAN><xsl:value-of select="//RES_SECTION_DEFAULT//ROW[1]/DATE_RESOLUTION_PLAN_MAX"/></DATE_RESOLUTION_PLAN>
      </xsl:otherwise>
    </xsl:choose>
    </RS>
    <xsl:copy-of select="/"/>
  </GLOBAL>
</xsl:variable>

    <xsl:variable name="STYLES"><textarea style="display:none"><xsl:copy-of select="."/></textarea>
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
        <layout:form action="/customactions/destinationSectionSave.action">
            <layout:header>Форма назначение раздела</layout:header>
          <layout:simple-field label="Раздел ПД" class="full" required="1">
            <layout:multiselect name="res_section__nsi_project_section" limit="1" paramnames="typeobjfirst" parametersXPATH="//RS//REQUEST_NSI_OBJECT_TYPE" value="//RS//NSI_PROJECT_SECTION" listSourceID="nsi_project_section"/>
            </layout:simple-field>
            <layout:simple-field label="Тематика" class="full">
                <layout:multiselect name="res_section__nsi_project_subject" limit="1" value="//RS//NSI_PROJECT_SUBJECT" listSourceID="nsi_project_subject"/>
            </layout:simple-field>
            <layout:simple-field label="Ответственное подразделение" class="full" required="1">
                <layout:multiselect id="selectDepartment" name="res_section__fk_exp_department" limit="1" value="//RS//FK_EXP_DEPARTMENT" listSourceID="nsi_exp_department"/>
            </layout:simple-field>
            <layout:simple-field label="Ответственный эксперт" class="full">
                <layout:multiselect name="res_section__fk_exp_person" paramnames="EXP_DEPARTMENT" parametersXPATH="//RS//FK_EXP_DEPARTMENT" limit="1" value="//RS//FK_EXP_PERSON" listSourceID="nsi_exp_person"/>
            </layout:simple-field>
            <layout:simple-field label="Согласование" class="full">
                <layout:multiselect name="res_approvement__fk_exp_person_agreement" value="//RES_APPROVEMENT//ROW[NSI_APPROVEMENT_ROLE='APPROVE']/FK_EXP_PERSON" paramnames="EXP_DEPARTMENT" parametersXPATH="//RS//FK_EXP_DEPARTMENT" listSourceID="nsi_exp_person"/>
            </layout:simple-field>
            <layout:simple-field label="Утверждение" class="full">
                <layout:multiselect name="res_approvement__fk_exp_person_statement" value="//RES_APPROVEMENT//ROW[NSI_APPROVEMENT_ROLE='CONFIRM']/FK_EXP_PERSON" paramnames="EXP_DEPARTMENT" parametersXPATH="//RS//FK_EXP_DEPARTMENT" listSourceID="nsi_exp_person"/>
            </layout:simple-field>

      <h3 class="header line">Сроки экспертизы</h3>
      <layout:simple-field label="Плановая дата начала экспертизы" class="small double_line" required="1">
                <layout:edit type="DATE" name="res_section__date_begin_plan" value="//RS//DATE_BEGIN_PLAN"/>
                <layout:hidden name="date_begin_plan_max" value="//RES_SECTION_DEFAULT//DATE_BEGIN_PLAN_MAX"/>
            </layout:simple-field>
            <layout:simple-field label="Плановая дата выдачи замечания по разделу" class="small double_line" required="1">
                <layout:edit type="DATE" name="res_section__date_comment_plan" value="//RS//DATE_COMMENT_PLAN"/>
                <layout:hidden name="date_comment_plan_max" value="//RES_SECTION_DEFAULT//DATE_COMMENT_PLAN_MAX"/>
            </layout:simple-field>
            <layout:simple-field label="Плановая дата выдачи заключения по разделу" class="small double_line" required="1">
                <layout:edit type="DATE" name="res_section__date_resolution_plan" value="//RS//DATE_RESOLUTION_PLAN"/>
                <layout:hidden name="date_section_plan_max" value="//RES_SECTION_DEFAULT//DATE_RESOLUTION_PLAN_MAX"/>
            </layout:simple-field>

      <layout:line/>
            <!-- <layout:simple-field label="Организация создавшая" class="full" required="0">
                <layout:multiselect value="//MY_MULTISELECT_VALUE" listSourceID="nsi_exp_expert" name="exp_permission__FK_exp_expert-is_owner"/>
            </layout:simple-field>
            <layout:simple-field label="Организация просматривающая" class="full" required="0">
                <layout:multiselect value="//MY_MULTISELECT_VALUE" listSourceID="nsi_exp_expert" name="exp_permission__FK_exp_expert"/>
            </layout:simple-field>-->

            <layout:hidden name="requestId" value="//GLOBAL/REQUEST_ID"/>
            <layout:hidden name="documentId" value="//URL_PARAMS//DOCUMENTID"/>

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
function dateParseRu(dateStr) {
    var dateStr = (dateStr)?dateStr:dateRender(new Date());
    var DateArr = dateStr.split('.').reverse();
    return new Date(DateArr[0], DateArr[1]-1, DateArr[2]);
}

var $date = {
    current: {
        begin: $('[name="res_section__date_begin_plan"]'),
        comment: $('[name="res_section__date_comment_plan"]'),
        resolution: $('[name="res_section__date_resolution_plan"]')
    },
    default: {
        begin: $('[name="date_begin_plan_max"]'),
        comment: $('[name="date_comment_plan_max"]'),
        resolution: $('[name="date_section_plan_max"]')
    }
};

            $(function(){


                $(document).on('change', '[name="'+$date.current.begin.attr('name')+'"]', function(){
                    $(this).val($date.default.begin.val());
                });
                $(document).on('change', '[name="'+$date.current.comment.attr('name')+'"]', function(){
                    var thisDateParse = dateParseRu($(this).val());
                    var minDateParse = dateParseRu($date.default.begin.val());
                    var maxDateParse = dateParseRu($date.default.comment.val());
                    if (thisDateParse<minDateParse) {
                        $(this).val($date.default.begin.val());
                    }
                    if (thisDateParse>maxDateParse) {
                        $(this).val($date.default.comment.val());
                    }
                });
                $(document).on('change', '[name="'+$date.current.resolution.attr('name')+'"]', function(){
                    var thisDateParse = dateParseRu($(this).val());
                    var minDateParse = dateParseRu($date.default.begin.val());
                    var maxDateParse = dateParseRu($date.default.resolution.val());
                    if (thisDateParse<minDateParse) $(this).val($date.default.begin.val());
                    if (thisDateParse>maxDateParse) $(this).val($date.default.resolution.val());
                });

                $('[data-name="res_section__fk_exp_department"]').on('change', function() {
                    var name = $(this).data('name'),
                        value = $('input:hidden[name="' + name + '"]').val(),
                        $inputs = $('[data-identifier="nsi_exp_person"]');

                    $inputs.each(function(){
                        $(this).tokenInput('destroy');
                        initTokenInput($(this), {componentsUrl: '/portal'});
                        $(this).tokenInput('setParam', { paramNames: 'EXP_DEPARTMENT', parameters: value})
                    });

                    console.log($inputs);

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
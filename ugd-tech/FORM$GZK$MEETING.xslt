<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="utf-8" indent="no"/>

<xsl:variable name="DATA">
    <ROOT xmlns="">
        <xsl:copy-of select="/"/>
    </ROOT>
</xsl:variable>

<xsl:template match="/">
<link rel="stylesheet" href="/static/TokenInput/latest/token-input.css"/>
<link rel="stylesheet" href="/static/typeForm/css/form.css"/>
<link rel="stylesheet" href="/static/multiselect/multiselect.css"/>
<link rel="stylesheet" href="/portal_static/css/ps/theme/ui.datepicker.css"/>
<link rel="stylesheet" href="/autoform/css/spbren/custom-theme/jquery-ui.custom.css"/>
<link rel="stylesheet" href="/portal_static/css/form-customize.css"/>
<link type="text/css" rel="stylesheet" href="/static/typeForm/css/fileuploader.css" />

{B{FORM$GZK$STYLE}E}


<div class="frmWrapp">
    <div class="frmContainer">
        <form action="submit/simpleSubmit.action?action=gzk.save_meeting" id="gzk_meeting" xfTag="MEETING">
            <div xfTag="GENERAL_INFO">
                <input type="hidden" name="ID" value="{//GENERAL_INFO//ID}" xfTag=":name:"/>

                <input type="hidden" name="STATUS" value="{//GENERAL_INFO//STATUS}" xfTag=":name:"/>
                <input type="hidden" name="DOCUMENT_TYPE" value="{//GENERAL_INFO//DOCUMENT_TYPE}" xfTag=":name:"/>

                <div class="hidden" id="hiddenData"></div>

            </div>
            <div class="frmBlock frmBlockHeader" xfTag="ADD_INFO" id="ADD_INFO">
                <div class="frmLine">
                    <div class="frmElement frmElement__left frmElement__left_m">
                        <div class="frmElement_label">Место проведения</div>
                        <div class="frmElement_frmField">
                            <input type="text"  name="PLACE_OF_MEETING" value="{//ADD_INFO//PLACE_OF_MEETING}" xfTag=":name:"/>
                        </div>
                    </div>
                    <div class="frmElement frmElement__right frmElement__right_m">
                        <div class="frmElement_label">Статус</div>
                        <div class="frmElement_frmField"><select></select></div>
                    </div>
                </div>
                <div class="frmLine">
                    <div class="frmElement frmElement__left frmElement__left_m">
                        <div class="frmElement_label">Номер заседания</div>
                        <div class="frmElement_frmField">
                        <input type="text"  name="MEETING_NUMBER" value="{//ADD_INFO//MEETING_NUMBER}" xfTag=":name:"/>
                    </div>
                    </div>

                </div>
                <input type="hidden" name="MEETING_DATE" value="" xfTag=":name:"/>
                <input type="hidden" name="MEETING_TIME" value="" xfTag=":name:"/>

            </div>
            <div class="frmBlock">
                <h1 class="frmHeader">Заседание</h1>
                <h2 class="frmHeader">Общая информация</h2>
                <div class="frmLine">
                    <div class="frmElement frmElement__left frmElement__left_xl">
                        <div class="frmElement_label">Вид заседания</div>
                        <div class="frmElement_frmField"><div class="_token_input_wrapper" xfTag="PARENT_ID" >
                            <input type="text" class="input-default tokenInput forHeaderData" data-identifier="GZK_MEETING_TYPES" data-load-names="true" data-token-limit="1" data-info="inputName" data-save-text="true" name="PARENT_ID"/>
                             <xsl:if test="//GENERAL_INFO//PARENT_ID">
                                <span class="hidden tokenValues">
                                    <span class="tokenItem">
                                       <span class="tokenId"><xsl:value-of select="//GENERAL_INFO//PARENT_ID"/></span>
                                    </span>
                                </span>
                            </xsl:if>
                            </div></div>
                    </div>
                </div>
                <div class="frmLine">
                    <div class="frmElement frmElement__left frmElement__left_xs">
                        <div class="frmElement_label">Дата заседания</div>
                        <div class="frmElement_frmField"><input type="text"  name="MEETING_DATE" class="forHeaderData datePicker moveTo" data-dest="#ADD_INFO [name='MEETING_DATE']" value="{//ADD_INFO//MEETING_DATE}" /></div>
                    </div>
                    <div class="frmElement frmElement__right frmElement__right_xs">
                        <div class="frmElement_label">Время</div>
                        <div class="frmElement_frmField"><input type="text"  name="MEETING_TIME" class="forHeaderData timePicker moveTo" data-dest="#ADD_INFO [name='MEETING_TIME']" value="{//ADD_INFO//MEETING_TIME}" placeholder="__:__" /></div>
                    </div>
                </div>
            </div>
            <div class="frmBlock" xfTag="PARTICIPANTS">
                <h2 class="frmHeader">Участники</h2>
                <div id="persons"></div>
                <div class="buttonWrapper" style="text-align: center"><div class="blueButton addPerson addButton">Добавить участника</div></div>
            </div>

            <div class="frmBlock" xfTag="SUBJECT">
                <h2 class="frmHeader">Повестка</h2>
                <div class="frmLine">
                    <div class="frmElement frmElement_file frmElement__left frmElement__full">
                        <span class="fileList"
                            data-multiple="false"
                            data-allowedExtensions="all"
                            data-name-filename="FILE_NAME"
                            data-name-fileid="FILE_ID">
                                <xsl:if test="//SUBJECT//FILE_ID">
                                    <xsl:attribute name="data-pre-files">
                                        <xsl:value-of select="string-join((//SUBJECT//FILE_ID, //SUBJECT//FILE_NAME, //SUBJECT//FILE_SIZE), '==')"/>
                                    </xsl:attribute>
                                </xsl:if>
                        </span>
                    </div>
                </div>
                <div class="frmLine">
                    <div class="frmElement frmElement__left frmElement__left_xl">
                        <div class="frmElement_label">Комментарий</div>
                        <div class="frmElement_frmField">
                            <textarea name="COMENT" xfTag=":name:"><xsl:value-of select="//SUBJECT//COMENT"/></textarea>
                        </div>
                    </div>
                </div>
            </div>
            <div class="frmBlock" xfTag="PROTOCOL">
                <h2 class="frmHeader">Протокол</h2>
                <div class="frmLine">
                    <div class="frmElement frmElement__left frmElement__left_m">
                        <div class="frmElement_label">Дата заседания</div>
                        <div class="frmElement_frmField"><input type="text"  name="APPROVAL_DATE" class="forHeaderData datePicker" value="{//PROTOCOL//APPROVAL_DATE}" xfTag=":name:"/></div>
                    </div>
                    <div class="frmElement frmElement__right frmElement__right_m">
                        <div class="frmElement_label">Подписал</div>
                        <div class="frmElement_frmField"><div class="_token_input_wrapper" xfTag="OSHS_SIGNER">
                            <input type="text" class="input-default tokenInput applicant" data-identifier="GZK_EMPLOYEES" data-load-names="true" data-token-limit="1" data-info="inputName" data-save-text="true" name="OSHS_SIGNER" />
                            <xsl:if test="//PROTOCOL//OSHS_SIGNER_STR">
                                <span class="hidden tokenValues">
                                    <span class="tokenItem">
                                       <span class="tokenId"><xsl:value-of select="//PROTOCOL//OSHS_SIGNER_STR"/></span>
                                    </span>
                                </span>
                            </xsl:if>
                            </div></div>
                    </div>
                </div>
                <div class="frmLine">
                    <div class="frmElement frmElement_file frmElement_triple">
                        <div class="fileUploaderHead fileUploaderHead_pdf">Электронный образ</div>
                        <span class="fileList"
                            data-multiple="false"
                            data-allowedExtensions="all"
                            data-name-filename="FILE_NAME"
                            data-name-fileid="DIGITAL_DOC_ID">
                            <xsl:if test="//PROTOCOL//DIGITAL_DOC_ID">
                                <xsl:attribute name="data-pre-files">
                                    <xsl:value-of select="string-join((//PROTOCOL//DIGITAL_DOC_ID, //PROTOCOL//DIGITAL_DOC_NAME, //PROTOCOL//DIGITAL_DOC_SIZE), '==')"/>
                                </xsl:attribute>
                            </xsl:if>
                        </span>
                    </div>
                    <div class="frmElement frmElement_file frmElement_triple">
                        <div class="fileUploaderHead fileUploaderHead_doc">Протокол</div>
                        <span class="fileList"
                            data-multiple="false"
                            data-allowedExtensions="all"
                            data-name-filename="FILE_NAME"
                            data-name-fileid="PROTOCOL_WORD_ID">

                            <xsl:if test="//PROTOCOL//PROTOCOL_WORD_ID">
                                <xsl:attribute name="data-pre-files">
                                    <xsl:value-of select="string-join((//PROTOCOL//PROTOCOL_WORD_ID, //PROTOCOL//PROTOCOL_WORD_NAME, //PROTOCOL//PROTOCOL_WORD_SIZE), '==')"/>
                                </xsl:attribute>
                            </xsl:if>
                        </span>
                    </div>
                    <div class="frmElement frmElement_file frmElement_triple">
                        <div class="fileUploaderHead fileUploaderHead_img">Приложения</div>
                        <span class="fileList"
                            data-multiple="true"
                            data-allowedExtensions="all"
                            data-name-filename="ATTACH_NAME"
                            data-name-fileid="ATTACH_ID"
                            >

                            <xsl:if test="//PROTOCOL//ATTACHS">
                                <xsl:attribute name="data-pre-files">
                                    <xsl:value-of select="string-join((//PROTOCOL//ATTACH_ID, //PROTOCOL//ATTACH_NAME, //PROTOCOL//ATTACH_SIZE), '==')"/>
                                </xsl:attribute>
                            </xsl:if>
                        </span>
                    </div>

                </div>
            </div>
            <div class="frmBlock" xfTag="CORRECTIONS">
                <h2 class="frmHeader">Технические правки</h2>
                <div id="techs"></div>
                <div class="buttonWrapper" style="text-align: center"><div class="blueButton addTech addButton">Добавить вопрос</div></div>
            </div>
            <div style="text-align: center"><div class="blueButton submitButton">Сохранить</div></div>
        </form>
    </div>
</div>
<script type="text/x-tmpl-mustache" id="techTpl">
{{#techs}}
<div class="multiBlock" xfTag="CORRECTION">
    <div class="multiBlock_header">
        <span class="multiBlock_headerLabel"><span class="multiBlock_headerLabel_comboString"></span><span class="invisible">__</span></span>
        <div class="multiBlock_headerControl"><div class="multiBlock_close"></div>
        <div class="multiBlock_toggle"></div></div>
    </div>
    <div class="multiBlock_content">
        <div class="frmLine">
            <div class="frmElement frmElement__left frmElement__left_m">
                <div class="frmElement_label">Вопрос</div>
                <div class="frmElement_frmField">
                    <div class="_token_input_wrapper" xfTag="QUESTION_NUMBER" >
                    <input type="text" class="input-default tokenInput forHeaderData" data-identifier="GZK_QUESTION" data-load-names="true" data-token-limit="1" data-info="inputName" data-save-text="true" name="QUESTION_NUMBER"/>
                    <span class="hidden tokenValues">
                    {{#number}}
                        <span class="tokenItem">
                           <span class="tokenId">{{number}}</span>
                        </span>
                    {{/number}}
                    </span>
                    </div>
                </div>
            </div>
            <div class="frmElement frmElement__right frmElement__right_m">
                <div class="frmElement_label">Основание</div>
                <div class="frmElement_frmField">
                    <div class="_token_input_wrapper">
                        <input type="text" class="forHeaderData" name="CORRECTION_REASON" value="{{reason}}"  xfTag=":name:"/>
                    </div>
                </div>
            </div>
        </div>

        <div class="frmLine">
            <div class="frmElement frmElement_file frmElement__left frmElement__full">
                <span class="fileList"
                    data-multiple="true"
                    data-allowedExtensions="all"
                    data-name-filename="FILE_NAME"
                    data-name-fileid="DIGITAL_DOC_ID"

                    data-pre-files="{{docId}}{{#fileName}}=={{fileName}}{{/fileName}}{{#fileSize}}=={{fileSize}}{{/fileSize}}"

                    >
                </span>
            </div>
        </div>
    </div>
</div>
{{/techs}}
</script>
<script type="text/x-tmpl-mustache" id="personTpl">
{{#participants}}
<div class="multiBlock" xfTag="PARTICIPANT">
    <div class="multiBlock_header">
        <span class="multiBlock_headerLabel"><span class="multiBlock_headerLabel_comboString"></span><span class="invisible">__</span></span>
        <div class="multiBlock_headerControl"><div class="multiBlock_close"></div>
        <div class="multiBlock_toggle"></div></div>
    </div>
    <div class="multiBlock_content">
        <div class="frmLine">
            <div class="frmElement frmElement__left frmElement__left_m">
                <div class="frmElement_label">Роль</div>
                <div class="frmElement_frmField">
                    <div class="_token_input_wrapper" xfTag="PERSON_ROLE" >
                    <input type="text" class="input-default tokenInput forHeaderData" data-identifier="GZK_PARTICIPANT_ROL" data-load-names="true" data-token-limit="1" data-info="inputName" data-save-text="true" name="PERSON_ROLE"/>
                    <span class="hidden tokenValues">
                    {{#person_role}}
                        <span class="tokenItem">
                           <span class="tokenId">{{person_role}}</span>
                           <span class="tokenValue">{{person_role}}</span>
                        </span>
                    {{/person_role}}
                    </span>
                    </div>
                </div>
            </div>
            <div class="frmElement frmElement__right frmElement__right_m">
                <div class="frmElement_label">Сотрудник</div>
                <div class="frmElement_frmField"><div class="_token_input_wrapper" xfTag="OSHS_PERSON">
                    <input type="text" class="input-default tokenInput applicant" data-identifier="GZK_EMPLOYEES" data-load-names="true" data-token-limit="1" data-info="inputName" data-save-text="true" name="OSHS_PERSON" />
                    <span class="hidden tokenValues">
                    {{#oshs_person_id}}
                        <span class="tokenItem">
                           <span class="tokenId">{{oshs_person_id}}</span>
                           <span class="tokenValue">{{oshs_person_id}}</span>
                        </span>
                    {{/oshs_person_id}}
                    </span>
                    </div></div>
            </div>
        </div>
        <div class="frmLine ">
            <div class="frmElement frmElement__left frmElement__left_s">
                <div class="frmElement_label">Фамилия</div>
                <div class="frmElement_frmField"><input type="text"  name="LAST_NAME" class="forHeaderData" value="{{last_name}}" xfTag=":name:"/></div>
            </div>
            <div class="frmElement frmElement__mid frmElement__mid_s">
                <div class="frmElement_label">Имя</div>
                <div class="frmElement_frmField"><input type="text"  name="FIRST_NAME" class="forHeaderData" value="{{first_name}}" xfTag=":name:"/></div>
            </div>
            <div class="frmElement frmElement__right frmElement__right_s">
                <div class="frmElement_label">Отчество</div>
                <div class="frmElement_frmField"><input type="text"  name="MIDDLE_NAME" class="forHeaderData" value="{{middle_name}}" xfTag=":name:"/></div>
            </div>
        </div>
        <div class="frmLine ">
            <div class="frmElement frmElement__left frmElement__left_xl">
                <div class="frmElement_label">Организация</div>
                <div class="frmElement_frmField"><div class="_token_input_wrapper" xfTag="ORGANIZATION">
                  <input type="text" class="input-default tokenInput applicantOrg" data-identifier="CC_ORGANIZATIONS" data-load-names="true" data-save-text="true" data-token-limit="1" data-info="inputName" name="ORGANIZATION"/>
                  <span class="hidden tokenValues">
                    {{#organization_id}}
                       <span class="tokenItem">
                           <span class="tokenId">{{organization_id}}</span>
                           <span class="tokenValue">{{organization_str}}</span>
                       </span>
                    {{/organization_id}}
                  </span>
                </div></div>
            </div>
        </div>
        <div class="frmLine ">
            <div class="frmElement frmElement__left frmElement__left_xl">
                <div class="frmElement_label">Должность</div>
                <div class="frmElement_frmField"><input type="text" name="POSITION" xfTag=":name:" value="{{position}}"/></div>
            </div>
        </div>
    </div>
</div>
{{/participants}}
</script>
<script src="/static/JQuery/1.8.3/jquery.min.js"></script>
<script src="/static/HSF/latest/hsf.js"></script>
<script src="js/spbren/configuration.js"></script>
<script src="/static/TokenInput/latest/jquery.tokeninput.js"></script>
<script src="/static/typeForm/formHelper.js"></script>
<script type="text/javascript" src="/static/typeForm/typeForm.js"></script>
<script type="text/javascript" src="/static/FileUploader/2.0-beta/fileuploader.js"></script>
<script type="text/javascript" src="/elib/js/sign.js"></script>
<script type="text/javascript" src="/portal_static/js/form/ajaxupload-fix.js"></script>
<!--script type="text/javascript" src="/static/typeForm/fileuploader.js"></script-->
<script type="text/javascript" src="/static/JQueryPlugins/jquery.fileUp.js"></script>
<script src="https://cdn.jsdelivr.net/mustache.js/2.3.0/mustache.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.maskedinput/1.4.1/jquery.maskedinput.min.js"></script>
<script src="js/jquery/jquery-ui-1.10.4.custom.min.js"></script>
<script src="/static/JQueryPlugins/ui.datepicker-ru.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<script>
var persons = {participants: [
    <xsl:for-each select="//PARTICIPANTS//PARTICIPANT">
        {person_role:'<xsl:value-of select="PERSON_ROLE"/>',
        oshs_person_id:'<xsl:value-of select="OSHS_PERSON_ID"/>',
        oshs_person_str:'<xsl:value-of select="OSHS_PERSON_STR"/>',
        first_name:'<xsl:value-of select="FIRST_NAME"/>',
        middle_name:'<xsl:value-of select="MIDDLE_NAME"/>',
        last_name:'<xsl:value-of select="LAST_NAME"/>',
        organization_id:'<xsl:value-of select="ORGANIZATION_ID"/>',
        organization_str:'<xsl:value-of select="ORGANIZATION_STR"/>',
        position:'<xsl:value-of select="POSITION"/>',}<xsl:if test="position() != count(//PARTICIPANTS//PARTICIPANT)">,</xsl:if>
    </xsl:for-each>
]};
var techs = {techs: [
    <xsl:for-each select="//CORRECTIONS//CORRECTION">
        {number:'<xsl:value-of select="QUESTION_NUMBER"/>',
        reason:'<xsl:value-of select="CORRECTION_REASON"/>',
        docId:'<xsl:value-of select="DIGITAL_DOC_ID"/>',
        fileName: '<xsl:value-of select="FILE_NAME"/>',
        fileSize: '<xsl:value-of select="FILE_SIZE"/>',
        fileExt: '<xsl:value-of select="FILE_EXTENSION"/>',
        }<xsl:if test="position() != count(//CORRECTIONS//CORRECTION)">,</xsl:if>
    </xsl:for-each>
]};
var mustacheRender = '';
var $personTemplate;
var personTpl = {participants: [{}]};
var $techTemplate;
var techTpl = {techs: [{}]};
var nowDate = new Date();
var startThisYear = new Date(nowDate.getFullYear(), 0, 1);
var monthsRu = {
    '01': 'января',
    '02': 'февраля',
    '03': 'марта',
    '04': 'апреля',
    '05': 'мая',
    '06': 'июня',
    '07': 'июля',
    '08': 'августа',
    '09': 'сентября',
    '10': 'октября',
    '11': 'ноября',
    '12': 'декабря'
};
window.datePickerFormat = {
        dateFormat:      "dd.mm.yy",
        showOn:          "button",
        buttonImageOnly: true,
        changeYear:      true,
        changeMonth:     true,
        duration:        '',
        showButtonPanel: false,
        gotoCurrent:     false,
        selectOtherMonths: true,
        showOtherMonths: true,
        numberOfMonths: 1,
        range: 'period',
        yearRange: "2012:"+nowDate.getFullYear(),
        monthNamesShort: [ "Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь" ],
        onChangeMonthYear: function(year, month, inst){
            setTimeout(function(){$('select').selectik();}, 10);

            /*console.log('YearMonthChange');*/
        }
        };

<![CDATA[
function postAddToken(t, item) {
    console.log('t:');
    console.log(t);
    console.log('item: ');
    console.log(item);
    if (item && item.extraFields){
        if (item.extraFields.asgmt) $('[name="ASGMT"]').val(item.extraFields.asgmt);
        if (item.extraFields.category) $('[name="CATEGORY"]').val(item.extraFields.category);
        if (item.extraFields.decis) $('[name="DECIS"]').val(item.extraFields.decis);


    }
    if (t.attr('data-name') == 'PARENT_ID'){
        $.ajax({
            url: '/ugd/submit/simpleSubmit.action',
            type: 'POST',
            data: {
                action: 'gzk.get_meeting_type_json',
                MEETING_TYPE_ID: item.objectId
            }
        }).success(function(data){

            if (typeof data == 'string') data = JSON.parse(data);

            if (data.meeting_type && data.meeting_type.place_of_meeting) $('[name="PLACE_OF_MEETING"]').val(data.meeting_type.place_of_meeting);

            if (data.meeting_type && data.meeting_type.participants){
                var persons = {participants: [{}]};
                persons.participants = data.meeting_type.participants;
                persons.participants.forEach(function(item, i, arr){
                    item.oshs_person_id = (item.oshs_person_id == '')?item.oshs_person_str:item.oshs_person_id;
                    item.organization_id = (item.organization_id == '')?item.organization_str:item.organization_id;
                });

                if (persons.participants.length>0){
                    mustacheRender = Mustache.render($personTemplate, persons);
                    $('#persons').html(mustacheRender);
                }
                $('#persons .tokenInput').each(function() {
                    initTokenInput($(this), {
                        deleteAlways: true
                    });
                });
            }

        });
    }
}
function addFileText(context){
    context = (context)?context:$(document);
    $buttonText = $('<span/>');
    $buttonText.addClass('buttonText');
    $buttonText.html('Перетащите файл сюда или <span class="anchorText">выберите файл</span>');
    $('.qq-upload-button', context).each(function(indx, elm){
        console.log('Got buttons in fileField: '+$(elm).find('.buttonText').length);
        if (!$(elm).find('.buttonText').length){
            $(elm).prepend($buttonText.clone());
        }
    });


}
$(function(){
    $('.timePicker').mask("99:99");
    /*$('.timePicker').timepicker({
        timeFormat: 'HH:mm',
        interval: 60,
        minTime: '0',
        maxTime: '23:59',
        defaultTime: '',
        startTime: '10:00',
        dynamic: false,
        dropdown: true,
        scrollbar: true
    });*/
    $('.timePicker').change(function(){
        var time = $(this).val();
        timeArr = time.split(':');
        timeArr[0] = (timeArr[0]>23)?23:timeArr[0];
        timeArr[1] = (timeArr[1]>59)?59:timeArr[1];
        $(this).val(timeArr.join(':'));
    });

    $('input.datePicker').datepicker(datePickerFormat);

    persons.participants.forEach(function(item, i, arr){
            item.oshs_person_id = (item.oshs_person_id == '')?item.oshs_person_str:item.oshs_person_id;
            item.organization_id = (item.organization_id == '')?item.organization_str:item.organization_id;
        });
    $personTemplate = $('#personTpl').html();
    Mustache.parse($personTemplate);

    if (persons.participants.length>0){
        mustacheRender = Mustache.render($personTemplate, persons);
        $('#persons').html(mustacheRender);
    }

    $techTemplate = $('#techTpl').html();
    Mustache.parse($techTemplate);
    if (techs.techs.length>0){
        mustacheRender = Mustache.render($techTemplate, techs);
        $('#techs').html(mustacheRender);
    }

    $('.tokenInput').each(function() {
        initTokenInput($(this), {
            deleteAlways: true
        });
    });
    if (!!$.fn['fileUp']) {
        $('.fileList').fileUp();
        addFileText();
    }
    $(document).on('click', '.multiBlock_toggle', function(){
        var $parent = $(this).parents('.multiBlock');
        $parent.find('.forHeaderData').change();
        if ($parent.hasClass('collapse')){
            $parent.removeClass('collapse');
        }else{
            $parent.addClass('collapse');
        }
    });
    $(document).on('change', '.forHeaderData', function(){
        var $parentHeader = $(this).parents('.multiBlock_content').siblings('.multiBlock_header').find('.multiBlock_headerLabel_comboString');
        var $parentContent = $(this).parents('.multiBlock_content');
        console.log('Is it persons: '+$(this).parents('#persons').length);
        if ($(this).parents('#persons').length){
            var role = $parentContent.find('[data-name="PERSON_ROLE"]').siblings('ul.token-input-list').find('li').eq(0).attr('title');
            role = (role)?role:''
            $parentHeader.text(role+' '+$parentContent.find('[name="LAST_NAME"]').val()+' '+$parentContent.find('[name="FIRST_NAME"]').val()+' '+$parentContent.find('[name="MIDDLE_NAME"]').val());
        }
        if ($(this).parents('#documents').length){

        }

    });
    $(document).on('change', '.applicant', function(){
        var fioLine = $(this).siblings('ul.token-input-list').find('li').eq(0).attr('title');
        var fioObj = fioLine.split(' ');
        var $parentHeader = $(this).parents('.multiBlock_content').siblings('.multiBlock_header').find('.multiBlock_headerLabel_comboString');
        var $parentContent = $(this).parents('.multiBlock_content');
        if (fioObj[1]) $parentContent.find('[name="FIRST_NAME"]').val(fioObj[1]);
        if (fioObj[2]) $parentContent.find('[name="MIDDLE_NAME"]').val(fioObj[2]);
        if (fioObj[0]) $parentContent.find('[name="LAST_NAME"]').val(fioObj[0]);
        $parentHeader.text($parentContent.find('[data-name="PERSON_ROLE_NICK"]').siblings('ul.token-input-list').find('li').eq(0).attr('title')+' '+fioLine);

    });
    $(document).on('click', '.multiBlock_close', function(){
        $(this).parents('.multiBlock').remove();
    });

    $('.addPerson').click(function(){
        mustacheRender = Mustache.render($personTemplate, personTpl);
        $('#persons').append(mustacheRender);
        $('#persons').find('.multiBlock').last().find('.tokenInput').each(function() {
            initTokenInput($(this), {
                deleteAlways: true
            });
        });
    });
    $('.addTech').click(function(){
        mustacheRender = Mustache.render($techTemplate, techTpl);
        $('#techs').append(mustacheRender);
        $('#techs').find('.multiBlock').last().find('.tokenInput').each(function() {
            initTokenInput($(this), {
                deleteAlways: true
            });
        });
        if (!!$.fn['fileUp']) {
            $('#techs').find('.fileList').last().fileUp();
            addFileText($('#techs'));
        }
    });
    $('.submitButton').click(function(){
        $('.moveTo').each(function(indx, elm){
            if ($(elm).attr('data-dest') != ''){
                if(!$(elm).hasClass('array') && ($(elm).attr('type')!= 'checkbox' || $(elm).attr('checked'))){
                    $($(elm).attr('data-dest')).val($(elm).val());
                } else if ($(elm).hasClass('array')){
                    var $target =$($(elm).attr('data-dest'));
                    var dataArr = $(elm).val().split(' ');
                    var mustacheObj = [];
                    var $targetTemplate = $($target.attr('data-template')).html();
                    Mustache.parse($targetTemplate);
                    for (var i=0; i<dataArr.length;i++){
                        var mustacheObjElm = {};
                        mustacheObjElm[$(elm).attr('data-array-name')] = dataArr[i];
                        mustacheObj.push(mustacheObjElm);
                    }
                    mustacheRender = Mustache.render($targetTemplate, {days:mustacheObj});
                    $target.html(mustacheRender);
                }
            }
        });

        /* перенос данных для корректной генерации XML */
        $('#hiddenData').append($('[xfTag="PARTICIPANTS"]').clone());
        $('#hiddenData').append($('[xfTag="PARENT_ID"]').clone());

        $('.file_input_js').each(function(indx, elm){
            $(elm).find('input[type="hidden"]').attr('xfTag', ':name:');
        });
        var xmlAsString = '';
        var $this = $(this).parents('form');
        var thisFormId = $this.attr('id');
        var $xmlString = $('[name="XML"]').length?$('[name="XML"]'):$('<input type="hidden"/>');
        $xmlString.attr({
            name: 'XML',
            id: 'XML_'+thisFormId
        });
        try{
            xmlAsString = xf_generateXML(thisFormId);
        }catch(e){
            alert('Ошибка ' + e.name + ":" + e.message + "\n" + e.stack); //
        }
        $xmlString.val(xmlAsString);
        $this.append($xmlString);
        $.ajax({
            url: $this.attr('action'),
            type : 'POST',
            data: $this.serialize()
        }).success(function(data){
            window.close();

            /* удаление лишних данных */
            $('#hiddenData').html('');



            if (window.opener){
                window.opener.location.reload();
            }
        })
    });
});

]]>
</script>
{B{FRM$XML_GENERATION$V0.1}E}
<xml style="display: none">
<xsl:copy-of select="*"/>
</xml>

</xsl:template>

</xsl:stylesheet>

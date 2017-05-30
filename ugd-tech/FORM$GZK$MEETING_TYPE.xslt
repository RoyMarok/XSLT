<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="utf-8" indent="no"/>

<xsl:variable name="DATA">
    <ROOT xmlns="">
        <xsl:copy-of select="/"/>
    </ROOT>
</xsl:variable>

<xsl:template match="/">
<!--xsl:variable name="DATA" select="//FORM"/-->
<link rel="stylesheet" href="/static/TokenInput/latest/token-input.css"/>
<link rel="stylesheet" href="/static/typeForm/css/form.css"/>
<link rel="stylesheet" href="/static/multiselect/multiselect.css"/>
<link rel="stylesheet" href="/portal_static/css/ps/theme/ui.datepicker.css"/>
<link rel="stylesheet" href="/autoform/css/spbren/custom-theme/jquery-ui.custom.css"/>
<link rel="stylesheet" href="/portal_static/css/form-customize.css"/>

<script src="/static/JQuery/1.8.3/jquery.min.js"></script>
{B{FORM$GZK$STYLE}E}
<div class="frmWrapp">
    <div class="frmContainer">

        <form action="submit/simpleSubmit.action?action=gzk.save_meeting_type" id="gzk_meeting_type" xfTag="MEETING_TYPE">
            <div xfTag="GENERAL_INFO">
            <input type="hidden" name="ID" value="{//GENERAL_INFO//ID}" xfTag=":name:"/>
            <input type="hidden" name="PARENT_ID" value="{//GENERAL_INFO//PARENT_ID}" xfTag=":name:"/>
            <input type="hidden" name="STATUS_NICK" value="{//GENERAL_INFO//STATUS_NICK}" xfTag=":name:"/>
            <input type="hidden" name="DOCUMENT_TYPE" value="{//GENERAL_INFO//DOCUMENT_TYPE}" xfTag=":name:"/>
            <div class="frmBlock"  >
                <h1 class="frmHeader">Вид заседания</h1>
                <h2 class="frmHeader">Общая информация</h2>
                <div class="frmLine ">
                    <div class="frmElement frmElement__left frmElement__left_m">
                        <div class="frmElement_label">Краткое наименование</div>
                        <div class="frmElement_frmField"><input type="text" class="moveTo" data-dest="#ADD_INFO [name='SHORT_NAME']" name="SHORT_NAME" value="{//MEETING_TYPE//ADD_INFO//SHORT_NAME}"/></div>
                    </div>
                    <div class="frmElement frmElement__right frmElement__right_m">
                        <div class="frmElement_label">Ник</div>
                        <div class="frmElement_frmField"><input type="text" class="moveTo" data-dest="#ADD_INFO [name='NICK']" name="STATUS"  value="{//MEETING_TYPE//ADD_INFO//NICK}"/> </div>
                    </div>
                </div>
                <div class="frmLine ">
                    <div class="frmElement frmElement__left frmElement__left_m">
                        <div class="frmElement_label">Полное наименование</div>
                        <div class="frmElement_frmField"><input type="text" class="moveTo" data-dest="#ADD_INFO [name='FULL_NAME']" name="FULL_NAME" value="{//MEETING_TYPE//ADD_INFO//FULL_NAME}"/> </div>
                    </div>
                    <div class="frmElement frmElement__right frmElement__right_xs">
                        <div class="frmElement_label">Актуальный вид заседания</div>
                        <div class="frmElement_frmField "><label class="frmSwitch frmSwitch_checkbox"><input type="checkbox" class="moveTo" data-dest="#ADD_INFO [name='IS_ACTUAL']" name="IS_ACTUAL" value="1">
                            <xsl:if test="//MEETING_TYPE//ADD_INFO//IS_ACTUAL=1">
                                <xsl:attribute name="checked" value="checked"/>
                            </xsl:if>
                        </input><i></i></label></div>
                    </div>
                </div>
                <div class="frmLine ">
                    <div class="frmElement frmElement__left frmElement__left_m">
                        <div class="frmElement_label">Место проведения</div>
                        <div class="frmElement_frmField"><input type="text" class="moveTo" data-dest="#ADD_INFO [name='PLACE_OF_MEETING']" name="PLACE_OF_MEETING" value="{//MEETING_TYPE//ADD_INFO//PLACE_OF_MEETING}"/> </div>
                    </div>
                </div>
                <div class="frmLine overflow">
                    <div class="frmElement frmElement__left frmElement__left_xl">
                        <div class="frmElement_label">Периодичность</div>
                        <div class="frmElement_frmField">
                            <div class="frmPeriod">
                                <div class="frmPeriod_wrapper">
                                    <xsl:for-each select="//CONF_PERIODICITY//ROW">
                                    <xsl:choose>
                                        <xsl:when test="ID = 'WEEKLY'">
                                            <div>
                                                <xsl:attribute name="class">
                                                    <xsl:choose>
                                                        <xsl:when test="//ADD_INFO//PERIOD_TYPE='WEEKLY'">
                                                        frmPeriod_element weekDays_wrapper selected
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                        frmPeriod_element weekDays_wrapper
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </xsl:attribute>
                                            <xsl:value-of select="NAME"/> <input type="hidden" name="{ID}" data-dest="#ADD_INFO [name='PERIOD_TYPE']" value="{ID}">
                                                <xsl:attribute name="class">
                                                    <xsl:choose>
                                                        <xsl:when test="//ADD_INFO//PERIOD_TYPE=ID">periodValue moveTo                                                        </xsl:when>
                                                        <xsl:otherwise>periodValue                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </xsl:attribute>
                                            </input>
                                            <input type="hidden" class="moveTo array" data-dest="#DAYS" data-array-name="weekDay" name="WEEK_DAY" value="{string-join(//DAYS//WEEK_DAY, ' ')}"/><div class="weekDays">
                                            <xsl:for-each select="//CONF_WEEK_DAYS//ROW">
                                                <div class="weekDay" data-value="{NICK}"><xsl:value-of select="NAME"/></div>
                                            </xsl:for-each>
                                                <!--div class="weekDay" data-value="MON">Пн</div>
                                                <div class="weekDay" data-value="TUE">Вт</div>
                                                <div class="weekDay" data-value="WEN">Ср</div>
                                                <div class="weekDay" data-value="THU">Чт</div>
                                                <div class="weekDay" data-value="FRI">Пт</div>
                                                <div class="weekDay" data-value="SAT">Сб</div>
                                                <div class="weekDay" data-value="SUN">Вс</div-->
                                                </div>
                                            </div>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <div class="frmPeriod_element"><xsl:value-of select="NAME"/><input type="hidden" name="{ID}"  class=" periodValue" data-dest="#ADD_INFO [name='PERIOD_TYPE']" value="{ID}">
                                                <xsl:attribute name="class">
                                                    <xsl:choose>
                                                        <xsl:when test="//ADD_INFO//PERIOD_TYPE=ID">
                                                        periodValue moveTo
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                        periodValue
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </xsl:attribute>
                                            </input></div>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    </xsl:for-each>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="frmLine ">
                    <div class="frmElement frmElement__left frmElement__left_xl multiline">
                        <div class="frmElement_label">Категория, решение, поручение</div>
                        <div class="frmElement_frmField"><div class="_token_input_wrapper">
                          <input type="text" class="input-default tokenInput applicantOrg" data-identifier="GZK_CAT_DECIS_ORDER_TYPE" data-viewing-id="41D37A6617354CE6BCB5E105CD3C9F30" data-ext-search="true" data-save-text="true" data-search-multiple="true" data-load-names="true" data-token-limit="100" data-info="inputName"/>
                          <span class="hidden tokenValues">
                            <xsl:for-each select="//CAT_DECIS_ASGMTS//CAT_DECIS_ASGMT">
                               <span class="tokenItem">
                                   <span class="tokenId"><xsl:value-of select="string-join( (CATEGORY, DECIS, ASGMT), '__')"/></span>
                               </span>
                            </xsl:for-each>
                          </span>
                     </div> </div>
                    </div>
                </div>
            </div>
            <div class="frmBlock" xfTag="PARTICIPANTS">
                <h2 class="frmHeader">Участники</h2>

                <!--div class="multiBlock" xfTag="PARTICIPANT">
                    <div class="multiBlock_header">
                        <span class="multiBlock_headerLabel"><span class="invisible">__</span></span>
                        <div class="multiBlock_headerControl"><div class="multiBlock_close"></div>
                        <div class="multiBlock_toggle"></div></div>
                    </div>
                    <div class="multiBlock_content">
                        <div class="frmLine">
                            <div class="frmElement frmElement__left frmElement__left_m">
                                <div class="frmElement_label">Роль</div>
                                <div class="frmElement_frmField"><input type="text" name="PERSON_ROLE_NICK" class="forHeaderData" xfTag=":name:"/></div>
                            </div>
                            <div class="frmElement frmElement__right frmElement__right_m">
                                <div class="frmElement_label">Сотрудник</div>
                                <div class="frmElement_frmField"><div class="_token_input_wrapper">
                                    <input type="text" class="input-default tokenInput applicantOrg" data-identifier="GZK_EMPLOYEES" data-save-text="true" data-load-names="true" data-token-limit="1" data-info="inputName" name="OSHS_PERSON_ID" xfTag=":name:"/>
                                    <span class="hidden tokenValues">
                                    <xsl:if test="$DATA/APPLICANT_ORG_ID != '' or $DATA/APPLICANT_ORG != ''">
                                        <span class="tokenItem">
                                           <span class="tokenId"><xsl:value-of select="$DATA/APPLICANT_ORG_ID"/></span>
                                           <span class="tokenValue"><xsl:value-of select="$DATA/APPLICANT_ORG"/></span>
                                        </span>
                                    </xsl:if>
                                    </span>
                                    </div></div>
                            </div>
                        </div>
                        <div class="frmLine ">
                            <div class="frmElement frmElement__left frmElement__left_s">
                                <div class="frmElement_label">Фамилия</div>
                                <div class="frmElement_frmField"><input type="text"  name="personLastName" class="forHeaderData" xfTag=":name:"/></div>
                            </div>
                            <div class="frmElement frmElement__mid frmElement__mid_s">
                                <div class="frmElement_label">Имя</div>
                                <div class="frmElement_frmField"><input type="text"  name="personFirstName" class="forHeaderData" xfTag=":name:"/></div>
                            </div>
                            <div class="frmElement frmElement__right frmElement__right_s">
                                <div class="frmElement_label">Отчество</div>
                                <div class="frmElement_frmField"><input type="text"  name="personMiddleName" class="forHeaderData" xfTag=":name:"/></div>
                            </div>
                        </div>
                        <div class="frmLine ">
                            <div class="frmElement frmElement__left frmElement__left_xl">
                                <div class="frmElement_label">Организация</div>
                                <div class="frmElement_frmField"><div class="_token_input_wrapper">
                                  <input type="text" class="input-default tokenInput applicantOrg" data-identifier="CC_ORGANIZATIONS" data-save-text="true" data-load-names="true" data-token-limit="1" data-info="inputName" name="APPLICANT_ORG" xfTag=":name:"/>
                                  <span class="hidden tokenValues">
                                    <xsl:if test="$DATA/APPLICANT_ORG_ID != '' or $DATA/APPLICANT_ORG != ''">
                                       <span class="tokenItem">
                                           <span class="tokenId"><xsl:value-of select="$DATA/APPLICANT_ORG_ID"/></span>
                                           <span class="tokenValue"><xsl:value-of select="$DATA/APPLICANT_ORG"/></span>
                                       </span>
                                    </xsl:if>
                                  </span>
                                </div></div>
                            </div>
                        </div>
                        <div class="frmLine ">
                            <div class="frmElement frmElement__left frmElement__left_xl">
                                <div class="frmElement_label">Должность</div>
                                <div class="frmElement_frmField"><input type="text" name="POSITION" xfTag=":name:" value="{POSITION}"/></div>
                            </div>
                        </div>
                    </div>
                </div-->
                <div id="persons"></div>


                <div class="buttonWrapper" style="text-align: center"><div class="blueButton addPerson addButton">Добавить участника</div></div>
            </div>
            <span id="CAT_DECIS_ASGMTS" xfTag="CAT_DECIS_ASGMTS">
                <!--span xfTag="CAT_DECIS_ASGMT">
                    <input type="hidden" name="CATEGORY" xfTag=":name:"/>
                    <input type="hidden" name="DECIS" xfTag=":name:"/>
                    <input type="hidden" name="ASGMT" xfTag=":name:"/>
                </span-->
            </span>
            </div>
            <div class="frmBlock">
                <xsl:if test="count(//CONF_RESULTS//ROW) > 0">
                <div class="frmLine ">
                    <div class="frmElement frmElement__left frmElement__left_xl multiline">
                        <div class="frmElement_label">Результаты рассмотрения</div>
                        <div class="frmElement_frmField">
                            <ul class="markless"  xfTag="RESULTS">
                                <xsl:for-each select="//CONF_RESULTS//ROW">
                                    <li xfTag="RESULT"><span class="checkbox" >
                                    <input type="checkbox" class="masked" autocomplete="off"  name="RESULT" xfTag=":name:" value="{NICK}">
                                        <xsl:if test="count(//RESULTS/RESULT[RESULT=NICK]) > 0">
                                            <xsl:attribute name="checked" value="true"/>
                                        </xsl:if>
                                    </input>
                                    <span class="overTrop"></span></span><label class=""><xsl:value-of select="NAME"/></label></li>
                                </xsl:for-each>
                            </ul>
                        </div>
                    </div>
                </div>
                </xsl:if>

                <xsl:if test="count(//CONF_MATERIAL_TYPES//ROW) > 0">
                <div class="frmLine ">
                    <div class="frmElement frmElement__left frmElement__left_xl multiline">
                        <div class="frmElement_label"></div>
                        <div class="frmElement_frmField">
                            <table class="overviewResult"  xfTag="MATERIALS">
                                <tr>
                                    <th>Прилагаемые материалы</th>
                                    <th>Необходимость</th>
                                </tr>
                                <xsl:for-each select="//CONF_MATERIAL_TYPES//ROW">
                                    <tr xfTag="MATERIAL">
                                        <td><span class="checkbox" ><input type="checkbox" class="masked" autocomplete="off" name="MATERIAL_TYPE" xfTag=":name:" value="{NICK}" data-link="{NICK}"/><span class="overTrop"></span></span><label class=""><xsl:value-of select="NAME"/></label></td>
                                        <td><label class="frmSwitch frmSwitch_checkbox">
                                        <input type="checkbox" data-link="{NICK}" name="MANDATORY_REVIEW" xfTag=":name:" value="1">
                                        </input>
                                        <i></i></label></td>
                                    </tr>
                                </xsl:for-each>
                            </table>
                        </div>
                    </div>
                </div>
                </xsl:if>

            </div>
            <span id="ADD_INFO" xfTag="ADD_INFO">
                <input type="hidden" name="NICK" value="{//MEETING_TYPE//ADD_INFO//NICK}" xfTag=":name:"/>
                <input type="hidden" name="SHORT_NAME" value="{//MEETING_TYPE//ADD_INFO//SHORT_NAME}" xfTag=":name:"/>
                <input type="hidden" name="FULL_NAME" value="{//MEETING_TYPE//ADD_INFO//FULL_NAME}" xfTag=":name:"/>
                <input type="hidden" name="IS_ACTUAL" value="{//MEETING_TYPE//ADD_INFO//IS_ACTUAL}" xfTag=":name:"/>

                <input type="hidden" name="PLACE_OF_MEETING" xfTag=":name:"/>
                <input type="hidden" name="PERIOD_TYPE" xfTag=":name:"/>
            </span>
            <span id="DAYS" xfTag="DAYS" data-template="#weekDayTpl">

            </span>

            <div style="text-align: center"><div class="blueButton submitButton">Сохранить</div></div>

        </form>
    </div>
</div>
<script type="text/x-tmpl-mustache" id="cdaTpl">
{{#cda}}
    <span xfTag="CAT_DECIS_ASGMT">
        <input type="hidden" name="CATEGORY" value="{{category}}" xfTag=":name:"/>
        <input type="hidden" name="DECIS" value="{{decis}}" xfTag=":name:"/>
        <input type="hidden" name="ASGMT" value="{{asgmt}}" xfTag=":name:"/>
    </span>
{{/cda}}
</script>
<script type="text/x-tmpl-mustache" id="weekDayTpl">
{{#days}}
    <span xfTag="DAY" class="arrayElement">
        <input type="hidden" name="WEEK_DAY" value="{{weekDay}}" xfTag=":name:"/>
    </span>
{{/days}}
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
                    {{#role}}
                        <span class="tokenItem">
                           <span class="tokenId">{{role}}</span>
                           <span class="tokenValue">{{role}}</span>
                        </span>
                    {{/role}}
                    </span>
                    </div>
                </div>
            </div>
            <div class="frmElement frmElement__right frmElement__right_m">
                <div class="frmElement_label">Сотрудник</div>
                <div class="frmElement_frmField"><div class="_token_input_wrapper" xfTag="OSHS_PERSON">
                    <input type="text" class="input-default tokenInput applicant" data-identifier="GZK_EMPLOYEES" data-load-names="true" data-token-limit="1" data-info="inputName" data-save-text="true" name="OSHS_PERSON" />
                    <span class="hidden tokenValues">
                    {{#oshsPersonId}}
                        <span class="tokenItem">
                           <span class="tokenId">{{oshsPersonId}}</span>
                           <span class="tokenValue">{{oshsPersonStr}}</span>
                        </span>
                    {{/oshsPersonId}}
                    </span>
                    </div></div>
            </div>
        </div>
        <div class="frmLine ">
            <div class="frmElement frmElement__left frmElement__left_s">
                <div class="frmElement_label">Фамилия</div>
                <div class="frmElement_frmField"><input type="text"  name="LAST_NAME" class="forHeaderData" value="{{lastName}}" xfTag=":name:"/></div>
            </div>
            <div class="frmElement frmElement__mid frmElement__mid_s">
                <div class="frmElement_label">Имя</div>
                <div class="frmElement_frmField"><input type="text"  name="FIRST_NAME" class="forHeaderData" value="{{firstName}}" xfTag=":name:"/></div>
            </div>
            <div class="frmElement frmElement__right frmElement__right_s">
                <div class="frmElement_label">Отчество</div>
                <div class="frmElement_frmField"><input type="text"  name="MIDDLE_NAME" class="forHeaderData" value="{{middleName}}" xfTag=":name:"/></div>
            </div>
        </div>
        <div class="frmLine ">
            <div class="frmElement frmElement__left frmElement__left_xl">
                <div class="frmElement_label">Организация</div>
                <div class="frmElement_frmField"><div class="_token_input_wrapper" xfTag="ORGANIZATION">
                  <input type="text" class="input-default tokenInput applicantOrg" data-identifier="CC_ORGANIZATIONS" data-load-names="true" data-save-text="true" data-token-limit="1" data-info="inputName" name="ORGANIZATION"/>
                  <span class="hidden tokenValues">
                    {{#orgId}}
                       <span class="tokenItem">
                           <span class="tokenId">{{orgId}}</span>
                           <span class="tokenValue">{{orgStr}}</span>
                       </span>
                    {{/orgId}}
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
<script src="https://cdn.jsdelivr.net/mustache.js/2.3.0/mustache.min.js"></script>
<script>
var isActual = '<xsl:value-of select="//ADD_INFO//IS_ACTUAL"/>';
var results = [
    <xsl:for-each select="//RESULTS/RESULT">
        <xsl:if test="RESULT_STR !='' ">
        '<xsl:value-of select="RESULT_STR"/>'
        <xsl:if test="position() != count(//RESULTS/RESULT)">,</xsl:if></xsl:if>
    </xsl:for-each>
];
var materials = [
    <xsl:for-each select="//MATERIALS/MATERIAL">
        <xsl:if test="MATERIAL_TYPE !='' ">{name: '<xsl:value-of select="MATERIAL_TYPE"/>',
        value: <xsl:choose>
            <xsl:when test="MANDATORY_REVIEW !=''">
                <xsl:value-of select="MANDATORY_REVIEW"/>
            </xsl:when>
            <xsl:otherwise>0</xsl:otherwise>
        </xsl:choose>
        }
        <xsl:if test="position() != count(//MATERIALS/MATERIAL)">,</xsl:if></xsl:if>
    </xsl:for-each>
];
<xsl:value-of select="NULL"/>
var persons = {participants: [
    <xsl:for-each select="//PARTICIPANTS//PARTICIPANT">
        {role:'<xsl:value-of select="PERSON_ROLE"/>',
        oshsPersonId:'<xsl:value-of select="OSHS_PERSON_ID"/>',
        oshsPersonStr:'<xsl:value-of select="OSHS_PERSON_STR"/>',
        firstName:'<xsl:value-of select="FIRST_NAME"/>',
        middleName:'<xsl:value-of select="MIDDLE_NAME"/>',
        lastName:'<xsl:value-of select="LAST_NAME"/>',
        orgId:'<xsl:value-of select="ORGANIZATION_ID"/>',
        orgStr:'<xsl:value-of select="ORGANIZATION_STR"/>',
        position:'<xsl:value-of select="POSITION"/>',}<xsl:if test="position() != count(//PARTICIPANTS//PARTICIPANT)">,</xsl:if>
    </xsl:for-each>
]};
var personTpl = {participants: [{}]};
var $cdaTemplate;
var mustacheRender = '';
<![CDATA[

function postAddToken(t, item) {
    console.log('t:');
    console.log(t);
    console.log('item: ');
    console.log(item);
    if (item && item.extraFields && (item.extraFields.category || item.extraFields.decis || item.extraFields.asgmt)){
        var cdaTpl = {cda: [{
            category: (item.extraFields.category)?item.extraFields.category:'',
            decis: (item.extraFields.decis)?item.extraFields.decis:'',
            asgmt: (item.extraFields.asgmt)?item.extraFields.asgmt:''
        }]};
        mustacheRender = Mustache.render($cdaTemplate, cdaTpl);
        $('#CAT_DECIS_ASGMTS').append(mustacheRender);
    }


}


    $(function(){
        results.forEach(function(item, i, arr){
            $('[name="RESULT"][value="'+item+'"]').attr('checked', true);
        });
        materials.forEach(function(item, i, arr){
            $('[name="MATERIAL_TYPE"][value="'+item.name+'"]').attr('checked', true);
            if (!!item.value) $('[name="MANDATORY_REVIEW"][data-link="'+item.name+'"]').attr('checked', true);
        });
        persons.participants.forEach(function(item, i, arr){
            item.oshsPersonId = (item.oshsPersonId == '')?item.oshsPersonStr:item.oshsPersonId;
            item.orgId = (item.orgId == '')?item.orgStr:item.orgId;
        });
        /*var $personTemplate = $('.multiBlock').eq(0).clone();*/
        var $personTemplate = $('#personTpl').html();
        Mustache.parse($personTemplate);
        $cdaTemplate = $('#cdaTpl').html();
        Mustache.parse($cdaTemplate);
        $('.weekDay').each(function(indx, elm){
            $(elm).text($(elm).text().replace(/[аеёиоуыэюя]/ig, ''));
            $(elm).text($(elm).text().substr(0,2));
        });


        if (persons.participants.length>0){
            mustacheRender = Mustache.render($personTemplate, persons);
            $('#persons').html(mustacheRender);

        }

        $('.tokenInput').each(function() {
            initTokenInput($(this), {
                deleteAlways: true
            });
        });
        /*
        $('.control__checkbox input[type="checkbox"]').each(function(indx, elm){
            var $radioAdd = $('<div></div>');
            $radioAdd.addClass('control__indicator');
            $(elm).after($radioAdd);

        });*/

        /*$personTemplate.find('.tokenInput').each(function(indx, elm){
            $(elm).tokenInput('clear', false);
        });*/
        /*$personTemplate.find('input').each(function(indx, elm){
            $(elm).val('');
        });
        $personTemplate.find('.multiBlock_headerLabel').html('<span class="invisible">__</span>');*/


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
            var role = $parentContent.find('[data-name="PERSON_ROLE"]').siblings('ul.token-input-list').find('li').eq(0).attr('title')
            role = (role)?role:''
            $parentHeader.text(role+' '+$parentContent.find('[name="LAST_NAME"]').val()+' '+$parentContent.find('[name="FIRST_NAME"]').val()+' '+$parentContent.find('[name="MIDDLE_NAME"]').val());
        });
        $(document).on('change', '.applicant', function(){
            var fioLine = $(this).siblings('ul.token-input-list').find('li').eq(0).attr('title');
            var fioObj = fioLine.split(' ');
            var $parentHeader = $(this).parents('.multiBlock_headerLabel_comboString').siblings('.multiBlock_header').find('.multiBlock_headerLabel');
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

        $('.weekDays_wrapper').each(function(indx, elm){
            var weekDayArr = $(elm).find('[name="WEEK_DAY"]').val().split(' ');
            $(elm).find('.weekDay').each(function(indx2, elm2){
                if (!!(weekDayArr.indexOf($(elm2).attr('data-value'))+1)) $(elm2).addClass('selected');
            });
        });

        $('.frmPeriod_element, .weekDay').click(function(event){

            if ($(this).hasClass('selected')){
                $(this).removeClass('selected');
                $(this).parents('.frmPeriod_element').removeClass('selected');
                $(this).find('.periodValue').removeClass('moveTo');
            } else {
                $(this).addClass('selected');
                $(this).find('.periodValue').addClass('moveTo');
                if (!$(this).parents('.frmPeriod_element').find('.periodValue').hasClass('moveTo')) $(this).parents('.frmPeriod_element').find('.periodValue').addClass('moveTo');
                if (!$(this).parents('.frmPeriod_element').hasClass('selected')) $(this).parents('.frmPeriod_element').addClass('selected');
                /*$(this).parents('.frmPeriod_element').find('.periodValue').val(1);*/
                $(this).parents('.frmPeriod_element').siblings().removeClass('selected');
                $(this).parents('.frmPeriod_element').siblings().each(function(indx, elm){
                    $(elm).find('.periodValue').removeClass('moveTo');
                });
                $(this).siblings('.frmPeriod_element').removeClass('selected');
                $(this).siblings().find('.weekDay').removeClass('selected');
                console.log($(this).attr('data-value')+' '+ !!$(this).attr('data-value'));
                if ($(this).attr('data-value')) {
                    var weekDayArr = [];
                    var weekDayString = $('.weekDays_wrapper [name="WEEK_DAY"]').val();
                    $(this).parents('.weekDays').find('.selected').each(function(indx, elm){
                        weekDayArr.push($(elm).attr('data-value'));
                    });
                    if (weekDayArr.length > 0){
                        weekDayString = weekDayArr.join(' ');
                    }

                    $('.weekDays_wrapper [name="WEEK_DAY"]').val(weekDayString)
                } else {
                    $('.weekDays_wrapper [name="WEEK_DAY"]').val('');
                };
            }
            event.stopPropagation();
        });
        $('[name="MANDATORY_REVIEW"]').change(function(){
            if ($(this).attr('checked')){
                $(this).parents('tr').find('[name="MATERIAL_TYPE"]').attr('checked', true).change();
            }

        });
        $('[name="MATERIAL_TYPE"]').change(function(){
            if (!$(this).attr('checked')){
                $(this).parents('tr').find('[name="MANDATORY_REVIEW"]').attr('checked', false).change();
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
                if (window.opener){
                    window.opener.location.reload();
                }
            })
        });


    });
]]>
</script>
{B{FRM$XML_GENERATION$V0.1}E}
<XML style="display: none">
  <xsl:copy-of select="."/>
</XML>

</xsl:template>
</xsl:stylesheet>

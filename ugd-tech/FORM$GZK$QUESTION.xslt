<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="utf-8" indent="no"/>

<xsl:variable name="DATA">
    <ROOT xmlns="">
        <COMBINED_FILES>
            <xsl:for-each select="//FILES//FILE">
                <FILE><xsl:value-of select="string-join((FILE_ID, FILE_NAME, FILE_SIZE), '==')"/></FILE>
            </xsl:for-each>
        </COMBINED_FILES>
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
        <form action="submit/simpleSubmit.action?action=gzk.save_question" id="gzk_question" xfTag="QUESTION">
            <div xfTag="GENERAL_INFO">
                <input type="hidden" name="ID" value="{//GENERAL_INFO//ID}" xfTag=":name:"/>
                <input type="hidden" name="PARENT_ID" value="{//GENERAL_INFO//PARENT_ID}" xfTag=":name:"/>
                <input type="hidden" name="STATUS" value="{//GENERAL_INFO//STATUS}" xfTag=":name:"/>
                <input type="hidden" name="DOCUMENT_TYPE" value="{//GENERAL_INFO//DOCUMENT_TYPE}" xfTag=":name:"/>

                <div class="hidden" id="hiddenData"></div>
                <span id="CAT_DECIS_ASGMTS" xfTag="CAT_DECIS_ASGMTS">
                    <!--span xfTag="CAT_DECIS_ASGMT">
                        <input type="hidden" name="CATEGORY" xfTag=":name:"/>
                        <input type="hidden" name="DECIS" xfTag=":name:"/>
                        <input type="hidden" name="ASGMT" xfTag=":name:"/>
                    </span-->
                </span>


            </div>
            <div xfTag="ADD_INFO">
                <div class="hidden" id="hiddenData2"></div>
            </div>
            <div class="frmBlock frmBlockHeader">
                <div class="frmLine">
                    <div class="frmElement frmElement__left frmElement__left_s">
                        <div class="frmElement_label">Вид заседания</div>
                        <div class="frmElement_frmField"><div class="_token_input_wrapper" xfTag="MEETING_TYPE" >
                                <input type="text" class="input-default tokenInput forHeaderData" data-identifier="GZK_MEETING_TYPES" data-load-names="true" data-token-limit="1" data-info="inputName" data-save-text="true" name="MEETING_TYPE"/>
                            </div></div>
                    </div>
                    <div class="frmElement frmElement__mid frmElement__mid_s">
                        <div class="frmElement_label">от</div>
                        <div class="frmElement_frmField"><input type="text"  name="ORDER_DATE" class="forHeaderData datePicker" value="" xfTag=":name:"/></div>
                    </div>
                    <div class="frmElement frmElement__right frmElement__right_s">
                        <div class="frmElement_label">Статус</div>
                        <div class="frmElement_frmField">
                            <select>
                                <option name="">Не выбрано</option>
                                <xsl:for-each select="//CONF_DOC_STATUS_QUESTION//ROW">
                                    <option name="{NICK}">
                                    <xsl:if test="//GENERAL_INFO//STATUS = NICK">
                                        <xsl:attribute name="selected" value="selected"/>
                                    </xsl:if>
                                    <xsl:value-of select="NAME"/></option>
                                </xsl:for-each>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="frmLine">
                    <div class="frmElement frmElement__left frmElement__left_m">
                        <div class="frmElement_label">Заседание</div>
                        <div class="frmElement_frmField">
                            <div class="_token_input_wrapper" xfTag="GZK_MEETINGS" >
                                <input type="text" class="input-default tokenInput forHeaderData" data-identifier="GZK_MEETINGS" data-parameters="MEETINGTYPEID" data-paramnames="meetingTypeId" data-load-names="true" data-token-limit="1" data-info="inputName" data-save-text="true" name="GZK_MEETINGS"/>
                            </div>
                        </div>
                    </div>
                    <div class="frmElement frmElement__right frmElement__right_m">
                        <div class="frmElement_label">Номер</div>
                        <div class="frmElement_frmField">
                            <input type="text"  name="ITEM_NUMBER" class="forHeaderData" value="{//ADD_INFO//ITEM_NUMBER}" xfTag=":name:"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="frmBlock">
                <h1 class="frmHeader">Вопрос к рассмотрению</h1>
                <div class="frmLine ">
                    <div class="frmElement frmElement__left frmElement__left_xl">
                        <div class="frmElement_label">Предмет рассмотрения</div>
                        <div class="frmElement_frmField"><input type="text" class=""  name="APPROVAL_SUBJECT" value="{//ADD_INFO//APPROVAL_SUBJECT}" xfTag=":name:"/></div>
                    </div>
                </div>
                <div class="frmLine ">
                    <div class="frmElement frmElement__left frmElement__left_xl">
                        <div class="frmElement_label">Адрес</div>
                        <div class="frmElement_frmField"><div class="_token_input_wrapper" xfTag="ADSRESS">
                            <input type="text" class="input-default tokenInput " data-identifier="GZK_ADSRESSES" data-load-names="true" data-save-text="true" data-token-limit="1" data-info="inputName" name="ADSRESS"/>
                            <span class="hidden tokenValues">
                                <xsl:if test="//ADD_INFO//ADDRESS_ID">
                                   <span class="tokenItem">
                                       <span class="tokenId"><xsl:value-of select="//ADD_INFO//ADDRESS_ID"/></span>
                                   </span>
                                </xsl:if>
                            </span>
                            </div></div>
                    </div>
                </div>
                <div class="frmLine ">
                    <div class="frmElement frmElement__left frmElement__left_xl">
                        <div class="frmElement_label"></div>
                        <div class="frmElement_frmField"><input type="text" value="{//ADD_INFO//ADDRESS_ADD_INFO}" name="ADDRESS_ADD_INFO" placeholder="Дом, строение, квартира" xfTag=":name:"/></div>
                    </div>
                </div>
                <div class="frmLine ">
                    <div class="frmElement frmElement__left frmElement__left_xl" xfTag="DISTRICTS">
                        <div class="frmElement_label">Округ, район</div>
                        <div class="frmElement_frmField" xfTag="DISTRICT"><div class="_token_input_wrapper" xfTag="DISTRICT">
                            <input type="text" class="input-default tokenInput " data-identifier="GZK_OMKTE" data-viewing-id="9F93B2C0E50F4A648DC4B8CCF6380A2D" data-ext-search="true" data-load-names="true" data-save-text="true" data-token-limit="1" data-parameters="OMKYMID" data-paramnames="omkymId" data-info="inputName" name="DISTRICT"/>
                            <span class="hidden tokenValues">
                                <xsl:for-each select="//DISTRICTS//DISTRICT">
                                   <span class="tokenItem">
                                       <span class="tokenId"><xsl:value-of select="DISTRICT_ID"/></span>
                                   </span>
                                </xsl:for-each>
                            </span>
                            </div></div>
                    </div>
                </div>
                <div class="frmLine ">
                    <div class="frmElement frmElement__left frmElement__left_xl" xfTag="CADASTRS">
                        <div class="frmElement_label">Кадастровый номер</div>
                        <div class="frmElement_frmField" xfTag="CADASTR"><div class="_token_input_wrapper" xfTag="KADASTR_NUM">
                            <input type="text" class="input-default tokenInput " data-identifier="GZK_OMKTE" data-load-names="true" data-save-text="true" data-token-limit="1" data-info="inputName" name="KADASTR_NUM"/>
                            <span class="hidden tokenValues">
                                <xsl:for-each select="//CADASTRS//CADASTR">
                                   <span class="tokenItem">
                                       <span class="tokenId"><xsl:value-of select="KADASTR_NUM"/></span>
                                   </span>
                                </xsl:for-each>
                            </span>
                            </div></div>
                    </div>
                </div>
                <div class="frmLine " xfTag="LABELS">
                    <div class="frmElement frmElement__left frmElement__left_xl">
                        <div class="frmElement_label">Тэги</div>
                        <div class="frmElement_frmField"><div class="_token_input_wrapper" xfTag="LABEL">
                            <input type="text" class="input-default tokenInput " data-identifier="GZK_LABELS" data-load-names="true" data-save-text="true"  data-info="inputName" name="LABEL"/>
                            <span class="hidden tokenValues">
                                <xsl:for-each select="//QUESTION//LABELS//LABEL">
                                   <span class="tokenItem">
                                       <span class="tokenId"><xsl:value-of select="LABEL_ID"/></span>
                                   </span>
                                </xsl:for-each>
                            </span>
                            </div></div>
                    </div>
                </div>


            </div>
            <div class="frmBlock" xfTag="DOCUMENTS">
                <h2 class="frmHeader">Документы</h2>
                <div id="documents"></div>
                <div class="buttonWrapper" style="text-align: center"><div class="blueButton addDoc addButton">Добавить документ</div></div>
            </div>
            <div class="frmBlock">
                <h2 class="frmHeader">Докладчики</h2>
                <div class="frmLine ">
                    <div class="frmElement frmElement__left frmElement__left_xl multiline">
                        <div class="frmElement_label">Инициатива рассмотрения</div>
                        <div class="frmElement_frmField"><div class="_token_input_wrapper" xfTag="OSHS_INITIATOR">
                            <input type="text" class="input-default tokenInput " data-identifier="GZK_EMPLOYEES" data-load-names="true" data-save-text="true" data-token-limit="1" data-info="inputName" name="OSHS_INITIATOR"/>
                            <span class="hidden tokenValues">
                                <xsl:if test="//ADD_INFO//OSHS_INITIATOR_ID">
                                   <span class="tokenItem">
                                       <span class="tokenId"><xsl:value-of select="//ADD_INFO//OSHS_INITIATOR_ID"/></span>
                                   </span>
                                </xsl:if>
                            </span>
                            </div></div>
                    </div>
                </div>
                <div id="persons" xfTag="PARTICIPANTS"></div>
                <div class="buttonWrapper" style="text-align: center"><div class="blueButton addPerson addButton">Добавить участника</div></div>
            </div>
            <div class="frmBlock" xfTag="INTERESTED_ORG">
                <h2 class="frmHeader">Заинтересованные организации</h2>
                <div class="frmLine " xfTag="INTERESTED_ORGS">
                    <div class="frmElement frmElement__left frmElement__left_xl multiline">
                        <div class="frmElement_label">Заинтересованные организации</div>
                        <div class="frmElement_frmField"><div class="_token_input_wrapper" xfTag="ORGANIZATION_ID">
                            <input type="text" class="input-default tokenInput " data-identifier="GZK_ORGANIZATIONS" data-load-names="true" data-save-text="true" data-token-limit="1" data-info="inputName" name="ORGANIZATION_ID"/>
                            <span class="hidden tokenValues">
                                <xsl:for-each select="//INTERESTED_ORGS//INTERESTED_ORG">
                                   <span class="tokenItem">
                                       <span class="tokenId"><xsl:value-of select="ORGANIZATION_ID"/></span>
                                   </span>
                                </xsl:for-each>
                            </span>
                            </div></div>
                    </div>
                </div>
            </div>
            <div class="frmBlock"  xfTag="ASSIGNMENTS">
                <h2 class="frmHeader">Поручения</h2>
                <div id="orders"></div>
                <div class="buttonWrapper" style="text-align: center"><div class="blueButton addOrder addButton">Добавить поручение</div></div>
            </div>
            <div class="frmBlock">
                <h2 class="frmHeader">Рассмотрение</h2>
                <div class="frmLine">
                    <div class="tabs" >
                        <div class="tabHead">
                            <div class="tab active" data-link="protocol">Вопрос по протоколу</div>
                            <div class="tab" data-link="listen">Заслушали</div>
                            <div class="tab" data-link="decide">Решили</div>
                        </div>
                        <div class="tabContent" data-slector="bigTexts">
                            <div class="tabElement" data-link="protocol">
                                <textarea name="QUESTION_TEXT" xfTag=":name:"><xsl:value-of select="//ROOT//QUESTION_TEXT" /></textarea>
                            </div>
                            <div class="tabElement" data-link="listen">
                                <textarea name="QUESTION_LISTENER" xfTag=":name:"><xsl:value-of select="//ROOT//QUESTION_LISTENER" /></textarea>
                            </div>
                            <div class="tabElement" data-link="decide">
                                <textarea name="QUESTION_DECISION" xfTag=":name:"><xsl:value-of select="//ROOT//QUESTION_DECISION" /></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="frmLine">
                    <div class="frmElement frmElement__left frmElement__left_xxl">
                        <div class="frmElement_label">Результат</div>
                        <div class="frmElement_frmField">
                            <select xfTag="QUESTION_RESULT">
                                <option name="">Не выбрано</option>
                                <xsl:for-each select="//CONF_RESULTS//ROW">
                                    <option name="{NICK}">
                                    <xsl:if test="//ADD_INFO//QUESTION_RESULT = NICK">
                                        <xsl:attribute name="selected" value="selected"/>
                                    </xsl:if>
                                    <xsl:value-of select="NAME"/></option>
                                </xsl:for-each>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="frmBlock">
                <h2 class="frmHeader">Категория</h2>
                <div class="frmLine ">
                    <div class="frmElement frmElement__left frmElement__left_xl multiline">
                        <div class="frmElement_label">Категория/решение/поручение</div>
                        <div class="frmElement_frmField"><div class="_token_input_wrapper" xfTag="CAT">
                            <input type="text" class="input-default tokenInput " data-identifier="GZK_CAT_DECIS_ORDER_TYPE" data-viewing-id="41D37A6617354CE6BCB5E105CD3C9F30" data-ext-search="true"  data-load-names="true" data-search-multiple="true" data-save-text="true" data-info="inputName" name="CAT"/>
                            <span class="hidden tokenValues">
                                <xsl:for-each select="//CAT_DECIS_ASGMTS//CAT_DECIS_ASGMT">
                                   <span class="tokenItem">
                                       <span class="tokenId"><xsl:value-of select="string-join( (CATEGORY, DECIS, ASGMT), '__')"/></span>
                                   </span>
                                </xsl:for-each>
                            </span>
                            </div></div>
                    </div>
                </div>
            </div>
            <div class="frmBlock" xfTag="FILES">
                <h2 class="frmHeader">Материалы</h2>
                <div xfTag="FILE">
                    <div class="frmLine" >
                    <div class="frmElement frmElement_file frmElement__left frmElement__full" >
                        <span class="fileList"
                            data-multiple="true"
                            data-allowedExtensions="all"
                            data-name-filename="FILE_NAME"
                            data-name-fileid="FILE_ID">
                                <xsl:if test="count(//COMBINED_FILES//FILE) &gt; 0">
                                    <xsl:attribute name="data-pre-files">
                                        <xsl:value-of select="string-join(//COMBINED_FILES//FILE, '||')"/>
                                    </xsl:attribute>
                                </xsl:if>
                        </span>
                    </div>
                    </div>
                    <div class="frmLine">
                        <div class="frmElement frmElement__left frmElement__left_xl">
                            <div class="frmElement_label">Комментарий</div>
                            <div class="frmElement_frmField">
                                <textarea name="UPLOADED_FILE_COMMENT" xfTag=":name:"><xsl:value-of select="//FILES//UPLOADED_FILE_COMMENT"/></textarea>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div style="text-align: center"><div class="blueButton submitButton">Сохранить</div></div>
        </form>
    </div>
</div>

<script type="text/x-tmpl-mustache" id="docTpl">
{{#documents}}
<div class="multiBlock" xfTag="DOCUMENT">
    <div class="multiBlock_header">
        <span class="multiBlock_headerLabel"><span class="multiBlock_headerLabel_comboString"></span><span class="invisible">__</span></span>
        <div class="multiBlock_headerControl"><div class="multiBlock_close"></div>
        <div class="multiBlock_toggle"></div></div>
    </div>
    <div class="multiBlock_content">
        <div class="frmLine">
            <div class="frmElement frmElement__left frmElement__left_m">
                <div class="frmElement_label">Тип документа</div>
                <div class="frmElement_frmField">
                    <input type="text"  name="DOCUMENT_TYPE" value="{{type}}" xfTag=":name:"/>
                    <!--div class="_token_input_wrapper" xfTag="DOC_TYPE" >
                    <input type="text" class="input-default tokenInput forHeaderData" data-identifier="GZK_PARTICIPANT_ROL" data-load-names="true" data-token-limit="1" data-info="inputName" data-save-text="true" name="DOC_TYPE"/>
                    <span class="hidden tokenValues">
                    {{#type}}
                        <span class="tokenItem">
                           <span class="tokenId">{{type}}</span>
                        </span>
                    {{/type}}
                    </span>
                    </div-->
                </div>
            </div>
            <div class="frmElement frmElement__right frmElement__right_m">
                <div class="frmElement_label">Документ</div>
                <div class="frmElement_frmField">
                    <input type="text"  name="DOCUMENT" value="{{doc}}" xfTag=":name:"/>
                    <!--div class="_token_input_wrapper" xfTag="DOC" >
                    <input type="text" class="input-default tokenInput forHeaderData" data-identifier="GZK_PARTICIPANT_ROL" data-load-names="true" data-token-limit="1" data-info="inputName" data-save-text="true" name="DOC"/>
                    <span class="hidden tokenValues">
                    {{#doc}}
                        <span class="tokenItem">
                           <span class="tokenId">{{doc}}</span>
                        </span>
                    {{/doc}}
                    </span>
                    </div-->
                </div>
            </div>
        </div>

        <div class="frmLine">
            <div class="frmElement frmElement_file frmElement__left frmElement__full">
                <span class="fileList"
                    data-multiple="true"

                    data-allowedExtensions="all"
                    data-name-filename="FILE_NAME"
                    data-name-fileid="DOCUMENT_FILE_ID"
                    data-pre-files="{{fileId}}{{#fileName}}=={{fileName}}{{/fileName}}{{#fileSize}}=={{fileSize}}{{/fileSize}}"
                    >
                </span>
            </div>
        </div>
    </div>
</div>
{{/documents}}
</script>
<script type="text/x-tmpl-mustache" id="orderTpl">
{{#orders}}
<div class="multiBlock" xfTag="ASSIGNMENT">
    <div class="multiBlock_header">
        <span class="multiBlock_headerLabel"><span class="multiBlock_headerLabel_comboString"></span><span class="invisible">__</span></span>
        <div class="multiBlock_headerControl"><div class="multiBlock_close"></div>
        <div class="multiBlock_toggle"></div></div>
    </div>
    <div class="multiBlock_content">
        <div class="frmLine">
            <div class="frmElement frmElement__left frmElement__left_m">
                <div class="frmElement_label">Номер</div>
                <div class="frmElement_frmField">
                    <input type="text"  name="ASSIGN_NUM" class="forHeaderData" value="{{number}}" xfTag=":name:"/>
                </div>
            </div>
            <div class="frmElement frmElement__right frmElement__right_m">
                <div class="frmElement_label">от</div>
                <div class="frmElement_frmField">
                    <input type="text"  name="ASSIGN_DATE" class="forHeaderData datePicker" value="{{date}}" xfTag=":name:"/>
                </div>
            </div>
        </div>
        <div class="frmLine">
            <div class="frmElement frmElement__left frmElement__left_xl">
                <div class="frmElement_label">Примечание</div>
                <div class="frmElement_frmField">
                    <textarea name="ASSIGN_COMMENT" xfTag=":name:">{{description}}</textarea>
                </div>
            </div>
        </div>
        <div class="frmLine">
            <div class="frmElement frmElement_file frmElement__left frmElement__full">
                <span class="fileList"
                    data-multiple="true"

                    data-allowedExtensions="all"
                    data-name-filename="FILE_NAME"
                    data-name-fileid="ASSIGN_FILE_ID"
                    data-pre-files="{{fileId}}{{#fileName}}=={{fileName}}{{/fileName}}{{#fileSize}}=={{fileSize}}{{/fileSize}}"
                    >
                </span>
            </div>
        </div>
    </div>
</div>
{{/orders}}
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

<script type="text/x-tmpl-mustache" id="cdaTpl">
{{#cda}}
    <span xfTag="CAT_DECIS_ASGMT">
        <input type="hidden" name="CATEGORY" value="{{category}}" xfTag=":name:"/>
        <input type="hidden" name="DECIS" value="{{decis}}" xfTag=":name:"/>
        <input type="hidden" name="ASGMT" value="{{asgmt}}" xfTag=":name:"/>
    </span>
{{/cda}}
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
<script>
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

var docs = {documents: [
    <xsl:for-each select="//DOCUMENTS//DOCUMENT">
    {
        type:'<xsl:value-of select="DOCUMENT_TYPE"/>',
        doc:'<xsl:value-of select="DOCUMENT_ID"/>',
        fileId:'<xsl:value-of select="DOCUMENT_FILE_ID"/>',
        fileName:'<xsl:value-of select="DOCUMENT_STR"/>'
    }<xsl:if test="position() != count(//DOCUMENTS//DOCUMENT)">,</xsl:if>
    </xsl:for-each>
    ]};
var orders = {orders: [
    <xsl:for-each select="//ASSIGNMENTS//ASSIGNMENT">
    {
        number:'<xsl:value-of select="ASSIGN_NUM"/>',
        date:'<xsl:value-of select="ASSIGN_DATE"/>',
        description: '<xsl:value-of select="ASSIGN_COMMENT"/>',
        fileId:'<xsl:value-of select="ASSIGN_FILE_ID"/>',
        fileName:'<xsl:value-of select="ASSIGN_FILE_NAME"/>',
    }<xsl:if test="position() != count(//ASSIGNMENTS//ASSIGNMENT)">,</xsl:if>
    </xsl:for-each>
    ]};

var mustacheRender = '';
var $cdaTemplate;
var $personTemplate;
var $docTemplate;
var $orderTemplate;
var personTpl = {participants: [{}]};
var docTpl = {documents: [{}]};
var orderTpl = {orders: [{}]};
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
    console.log('add t:');
    console.log(t);
    console.log('add item: ');
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
    if (t.attr('data-name') == 'MEETING_TYPE'){
        $('[data-name="GZK_MEETINGS"]').tokenInput('setParam', {paramNames: 'meetingTypeId', parameters: item.objectId})
    }
    if (t.attr('data-name') == 'ADSRESS'){
        $('[data-name="DISTRICT"]').tokenInput('setParam', {paramNames: 'omkymId', parameters: item.objectId});
        var tokens = $('[data-name="DISTRICT"]').tokenInput('get');
        if (tokens.length == 1) $('[data-name="DISTRICT"]').tokenInput('setValues', );
    }

}
function postDeleteToken(t, item) {
    console.log('delete t:');
    console.log(t);
    console.log('delete item: ');
    console.log(item);
    if (t.attr('data-name') == 'MEETING_TYPE'){
        $('[data-name="GZK_MEETINGS"]').tokenInput('setParam', {paramNames: 'meetingTypeId', parameters: 'MEETINGTYPEID'})
    }

    if (t.attr('data-name') == 'ADSRESS'){
        $('[data-name="DISTRICT"]').tokenInput('setParam', {paramNames: 'omkymId', parameters: 'OMKYMID'})
    }
}
function showTabList(context){
    context = (context)?context:$(document);
    $('.tabElement', context).each(function(indx, elm){
        /*console.log($(elm).attr('data-link'));
        console.log($(elm).parents('.tabs').find('.tab[data-link="'+$(elm).attr('data-link')+'"]').length);
        console.log($(elm).parents('.tabs').find('.tab[data-link="'+$(elm).attr('data-link')+'"]').eq(0).hasClass('active').length);*/
        if ($(elm).parents('.tabs').find('.tab[data-link="'+$(elm).attr('data-link')+'"]').hasClass('active')){
            $(elm).show();
        } else {
            $(elm).hide();
        }
    });
}
function addFileText(context){
    context = (context)?context:$(document);
    $buttonText = $('<span/>');
    $buttonText.addClass('buttonText');
    $buttonText.html('Перетащите файл сюда или <span class="anchorText">выберите файл</span>');
    $('.qq-upload-button', context).prepend($buttonText);
}
	$(function(){
        showTabList();
        $('.tab').click(function(){
            $(this).siblings('.tab').removeClass('active');
            $(this).addClass('active');
            showTabList($(this).parents('.tabs'));
        });
		$('input[name="TIME"]').mask("99:99");
        $('input.datePicker').datepicker(datePickerFormat);
        persons.participants.forEach(function(item, i, arr){
            item.oshsPersonId = (item.oshsPersonId == '')?item.oshsPersonStr:item.oshsPersonId;
            item.orgId = (item.orgId == '')?item.orgStr:item.orgId;
        });
        $docTemplate = $('#docTpl').html();
        Mustache.parse($docTemplate);

        $orderTemplate = $('#orderTpl').html();
        Mustache.parse($orderTemplate);

        $personTemplate = $('#personTpl').html();
        Mustache.parse($personTemplate);
        $('.weekDay').each(function(indx, elm){
            $(elm).text($(elm).text().replace(/[аеёиоуыэюя]/ig, ''));
            $(elm).text($(elm).text().substr(0,2));
        });

        if (docs.documents.length>0){
            mustacheRender = Mustache.render($docTemplate, docs);
            $('#documents').html(mustacheRender);
        }

        if (orders.orders.length>0){
            mustacheRender = Mustache.render($orderTemplate, orders);
            $('#orders').html(mustacheRender);
        }

        if (persons.participants.length>0){
            mustacheRender = Mustache.render($personTemplate, persons);
            $('#persons').html(mustacheRender);
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
        $('.addDoc').click(function(){
            mustacheRender = Mustache.render($docTemplate, docTpl);
            $('#documents').append(mustacheRender);
            $('#documents').find('.multiBlock').last().find('.tokenInput').each(function() {
                initTokenInput($(this), {
                    deleteAlways: true
                });
            });
            if (!!$.fn['fileUp']) {
                $('#documents').find('.fileList').last().fileUp();
                addFileText($('#documents'));
            }
        });
        $('.addOrder').click(function(){
            mustacheRender = Mustache.render($orderTemplate, orderTpl);
            $('#orders').append(mustacheRender);
            $('#orders').find('.multiBlock').last().find('.tokenInput').each(function() {
                initTokenInput($(this), {
                    deleteAlways: true
                });
            });
            if (!!$.fn['fileUp']) {
                $('#orders').find('.fileList').last().fileUp();
                addFileText($('#orders'));
            }
            $('#orders').find('input.datePicker').datepicker(datePickerFormat);
        });
        $(document).on('click', '.toExpand, .toShrink', function(){
            if ($(this).hasClass('toExpand')){
                $(this).parents('.expandControl').siblings('.expandableText').addClass('expand');

            }else{
                $(this).parents('.expandControl').siblings('.expandableText').removeClass('expand');
            }
            $(this).hide();
            $(this).siblings('span').show();
        });
        setTimeout(function(){
            $('.expandableText').each(function(indx, elm){
                var $expandControl = $('<div/>');
                $expandControl.addClass('expandControl');
                $expandControl.html('<span class="toExpand">Развернуть</span><span class="toShrink">Свернуть</span>');
                console.log(parseInt($(elm).css('max-height')));
                console.log($(elm).height());
                if (parseInt($(elm).css('max-height')) == $(elm).height()){
                    $(elm).after($expandControl);
                    $expandControl.find('.toShrink').hide();
                    $expandControl.find('.toExpand').click();
                }

            });
        }, 100);
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

            $('#hiddenData2').append($('[xfTag="MEETING_TYPE"]').clone());
            $('#hiddenData2').append($('[name="ORDER_DATE"]').clone());
            $('#hiddenData2').append($('[xfTag="GZK_MEETINGS"]').clone());
            $('#hiddenData2').append($('[name="ITEM_NUMBER"]').clone());
            $('#hiddenData2').append($('[xfTag="OSHS_INITIATOR"]').clone());
            $('#hiddenData2').append($('[name="APPROVAL_SUBJECT"]').clone());
            $('#hiddenData2').append($('[xfTag="ADSRESS"]').clone());
            $('#hiddenData2').append($('[name="ADDRESS_ADD_INFO"]').clone());
            $('#hiddenData2').append($('[name="QUESTION_TEXT"]').clone());
            $('#hiddenData2').append($('[name="QUESTION_LISTENER"]').clone());
            $('#hiddenData2').append($('[name="QUESTION_DECISION"]').clone());
            $('#hiddenData2').append($('[xfTag="QUESTION_RESULT"]').clone());

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
                /*window.close();*/
                if (window.opener){
                    window.opener.location.reload();
                }
            })
        });
	})
]]>
</script>
{B{FRM$XML_GENERATION$V0.1}E}
    <xml style="display: none">
<xsl:copy-of select="*"/>
</xml>

</xsl:template>

</xsl:stylesheet>

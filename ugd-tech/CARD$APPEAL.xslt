<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:layout="URN:html-form-layout:v0.1" xmlns="http://www.w3.org/1999/xhtml" xmlns:ex2="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLTExtension" xmlns:ctx="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLDataContext" xmlns:gbu="http://xmlns.oracle.com/MSG_GBU_doc">
<xsl:output method="html" indent="yes" omit-xml-declaration="yes" undeclare-prefixes="yes" exclude-result-prefixes="#all"/>
<xsl:variable name="DATA">
    <ROOT xmlns="">
        <xsl:copy-of select="/"/>
    </ROOT>
</xsl:variable>
    <xsl:template match="/">

<style>
    #tabs-container{
        display: none;
    }
    .card{
        border: 1px solid #ccc;
        border-radius: 3px;
        overflow: hidden;
        width: 1128px;
        width: 1220px;
        margin: 0 auto;
        font-family: 'PT Sans', sans-serif;
        color: #1E1E1E;
    }
    .card a{
        color: #319ADC;
        text-decoration: none;
        transition: all .3s;
        border-bottom: 1px solid rgba(49, 154, 220, 0.21);
        border-bottom: 1px solid transparent;
    }
    .card a:hover{
        color: #E74C3C;
        border-color: #E74C3C;
        border-color: transparent;
    }
    .cardHeader{
        background-color: #F2F6FA;
        padding: 15px 30px;
        border-bottom: 1px solid #ccc;
        position: relative;
        font-size: 14px;
    }
    .cardHeader>div{
        vertical-align: top;
        display: inline-block;
    }
    .cardHeader .numberSection{
        width: 380px;
        margin-right: 15px;
        display: inline-block;
    }
    .cardHeader .numberSection .bigNumber{
        font-size: 22px;
        margin-bottom: 10px;
    }
    .cardHeader .numberSection .requestType{
        font-size: 14px;
        color: #215968;
    }
    .cardHeader .operator{
        display: inline-block;
        height: 48px;
        padding-left: 48px;
        width: 200px;
        margin-top: 10px;
        background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACIAAAAiCAYAAAA6RwvCAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA8pJREFUeNq8WFlPU0EUPr1toZBehBYrZYksshhq4AeI9VHBPwD+DcODiRqLvvDqEz/A/gJBH6U8qUHFYMISukntjgUKQjc852aa3NK7zEV0ki+UOzPnfDNzthnTRigGBpoLMYnwIjyIXkQL6ztAhBHriGXEO0SCV7CJk8gEYhZxD2HhlF1GvEXMI1b0Bgs6/f2IN4gA4oEBEtTMbE6Ayei/KJFpxBfEFPx9m2KyZtQGqK3wKeK5luR0Jg1b29uQzWbB6XDA8NAwtLe3a00hW3qNuIHw8djIY8RLNWnFYhHWvq3Bz3i8rs/d4YbxsTGwWq16O/QE8ULraKa1SFQqFVj9vKpIglo8EZf6aZxOm2O6FIn0IRa0ZqdSKUil05oaqD+ZSvLYzQLTWUfkFULUmpnJZrgsM5PJ8gwTmc4aIrd5vGM3xhf8YrFdI940IScyyzOrsbGRS7rN1mTEtR9ViVDYvs8zo1QqcUkulUtGiFDKcAnsB1fELBQKXJJPTk6MECHdkwJLYFzNgYGLywpF0WjkvSuwLMrVOt1urnHujg6jREYFlsq5Wk93D7iuurR3rc0BA/0DRon0CXqxoyb6CQJ4RkfBZDKpLw37zWazUSIiETHxji6Xy1DG8N3d1aVyJG4wI1le7zpvsYcIp9ago6MjKZhRoPqNHuG94wWLxSr9X0JytANEYmhwEAIrAbA2NEBXZycS7ga73c7D45CIhNSI0Mo2tzYhEo3WrHJ/Pwe3PB7JKLN7e9Da2grXXC4pFxUwOxOoRAiGQpJd3RwZQeKaESJMR/NdjcSHTx9hJxis2+pq9v2Vy6HCLakmkb4n4nUyQuGQJKdYKmoRWSci75V6qkWPclLLSMHN0dYGzc3N4HQ6JftJJpWzLsnZ2NiEs7MzNSLLAitw66wrEo2AVnFESsleKIqeIuKJBJyenqrOif6Iqi2MdC8RkSQr/euUabVQOAw5PBraiRzaTDgS1vW4ZDql1EW6k9XsO2/U3Ui5POzvodHqusbBgdLneXkZQPeORXkvR90plYZ9vb1YSOsXTCRPbGk5/3mpeueRF8907/hajbR09uSatPJ8Pg/Hx8fScdEWU01Khkd/SQF9p6hLEVcwCWC2mMGK7tqEhizaRcm9aeeabLaaDUKMI4JKVfwMK/n/R3uI8KtV8X52p/nX7ZmchNpNb44N/JckfLxXTh/buvwlEsgzmT6jd18/M6bFSyCxxGT5L/oasMNu9F52oy8bUF5hc7zs2rBzGe8j8oeaKdlDzXXElWpSpszAHmoCLHXEeQX/EWAALjOB3lzUTBoAAAAASUVORK5CYII=');
        background-repeat: no-repeat;
    }
    .cardHeader .deadLine{
        display: inline-block;
        margin-top: 10px;
    }
    .cardHeader .label{
        font-size: 11px;
        color: #7D8FA4;
    }
    .status{
        position: absolute;
        padding: 5px 10px;
        border-bottom-left-radius: 2px;
        background-color: #319ADC;
        color: white;
        font-size: 11px;
        top: 0;
        right: 0;

    }
    .cardBody{
        padding: 40px 30px;
        font-size: 14px;
    }
    .cardBodyMain{
        width: 660px;
        width: 750px;
        margin-right: 50px;
        display: inline-block;
        vertical-align: top;
    }

    .tableView .row{
        margin-bottom: 10px;
    }
    .tableView .label,
    .tableView .value{
        display: inline-block;
        vertical-align: top;
    }
    .tableView .label{
        width: 165px;
        margin-right: 10px;
        position: relative;

    }
    .tableView .label:after{
        content: '';
        display: block;
        position: relative;
        border-bottom: 1px dotted #DADADA;
        width: 100%;
        margin-top: -4px;
        z-index: 3;
    }
    .tableView .label span{
        display: inline-block;
        padding-right: 15px;
        background-color: white;
        position: relative;
        z-index: 4;
    }
    .tableView .value{
        width: 475px;
    }
    .tableView .value .reestrObject:not(:last-child){
        margin-bottom: 15px;
    }
    .message{
        padding: 10px 15px;
        border-radius: 2px;
        margin: 20px 0;

    }
    .message ol{
        padding-left: 15px;
    }
    .message h3{
        font-size: 14px;
        font-weight: bold;
        margin-top: 0;
    }
    .peachColor{
        background-color: #FEF6DD;
    }
    .greyColor{
        background-color: #F2F6FA;
    }
    .expandableText{
        max-height: 65px;
        position: relative;
        white-space: pre-wrap;
        overflow: hidden;
        transition: all .3s;
    }
    .expandableText.expand{
        max-height: initial;
        transition: all .3s;
    }
    .expandableText.expand+.expandControl:before{
        opacity: 0;
    }
    .expandableText.expand+.expandControl{
        /*margin-top: 15px;*/
    }
    .expandControl{
        /*margin-bottom: 30px;*/
        position: relative;

        color: #319ADC;
        padding-top: 10px;
    }
     .expandControl span{
        cursor: pointer;
     }
    .expandControl span:hover{
        color: #E74C3C;
    }
    .expandControl:before{
        content: '';
        position: absolute;
        width: 100%;
        height: 20px;
        margin-top: -30px;
        display: block;
        background: -moz-linear-gradient(top,  rgba(255,255,255,0) 0%, rgba(255,255,255,1) 100%);
        background: -webkit-linear-gradient(top,  rgba(255,255,255,0) 0%,rgba(255,255,255,1) 100%);
        background: linear-gradient(to bottom,  rgba(255,255,255,0) 0%,rgba(255,255,255,1) 100%);
    }
    .listLimited .expandControl{
        /*padding-top: 0;*/
    }
    .listLimited .expandControl:before{
        display: none;
    }
    .peachColor .expandControl:before{
        background: -moz-linear-gradient(top,  rgba(254, 246, 221,0) 0%, rgba(254, 246, 221,1) 100%);
        background: -webkit-linear-gradient(top,  rgba(254, 246, 221,0) 0%,rgba(254, 246, 221,1) 100%);
        background: linear-gradient(to bottom,  rgba(254, 246, 221,0) 0%,rgba(254, 246, 221,1) 100%);
    }
    .greyColor .expandControl:before{
        background: -moz-linear-gradient(top,  rgba(242, 246, 250,0) 0%, rgba(242, 246, 250,1) 100%);
        background: -webkit-linear-gradient(top,  rgba(242, 246, 250,0) 0%,rgba(242, 246, 250,1) 100%);
        background: linear-gradient(to bottom,  rgba(242, 246, 250,0) 0%,rgba(242, 246, 250,1) 100%);
    }

    .cardHeaderButtonBar {
        position: absolute;
        bottom: 0;
        right: 0;
    }
    .cardHeaderButtonBar .buttonIcon {
        cursor: pointer;
        padding: 10px;
        transition: all .3s;
    }
    .cardHeaderButtonBar .buttonIcon img{
        transition: all .3s;
    }
    .cardHeaderButtonBar .buttonIcon:hover {
        opacity: 0.7;
    }
    .rDropTarget {
        border: 1px solid #ACACAC;
    }
    .rDropTarget a {
        text-decoration: none;
        color: #000;
        padding: 7px 20px;
        background: #fff;
        display: block;
    }
    .rDropTarget a:hover {
        background: #F2F2F2;
    }
    .cardHeaderButtonBar .buttonIcon:hover img{
        transition: all .3s;
        transform: rotate(180deg);
    }
    .ft-people-group {
        /*margin-bottom: 33px;*/
        font-family: 'PTSans', Arial, sans-serif;
        font-size: 14px;
        box-sizing: border-box;
        /*display: flex;*/
        /*flex-direction: column;*/
        flex-wrap: wrap;
        width: 100%;
        overflow: hidden;
        padding: 0;
        margin-left: -20px;

      }
     .ft-people-group * {
    box-sizing: border-box;
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
}
      .ft-people-group:last-child {
        margin-bottom: 0;
      }
      .ft-people-group li {
        min-height: 46px;
        display: block;
        margin-bottom: 5px;
        position: relative;
        /*width: 350px;
        width: 50%;*/
      }
      .ft-people-group li:last-child {
        margin-bottom: 0;
      }
      li:not(:last-child) .ft-people-group-inner {
        margin-bottom: 20px;
      }
      .ft-people-group-inner {
        display: table;
        border-left: 3px solid transparent;
        padding: 0;
        position: absolute;
        /*cursor: pointer;*/
        position: relative;
        width: 100%;
      }
      .ft-people-group-inner.selected,
      .selected .ft-people-group-inner{
        background: #F5F7FA;
        background: #319adc;
        color: white;


      }
      .ft-people-group li.selected:hover .ft-people-group-inner{
        background: #0072ff;
      }
      .ft-people-group li:hover .ft-people-group-inner {
        /*background: #fff;
        background: #F5F7FA;*/
        /*width: 400px;*/
        z-index: 10;
        position: relative;

        /*-webkit-box-shadow: 0px 0px 17px 0px rgba(0,0,0,0.42);
        -moz-box-shadow: 0px 0px 17px 0px rgba(0,0,0,0.42);
        box-shadow: 0px 0px 17px 0px rgba(0,0,0,0.42);*/
      }
      .ft-people-group li:hover .ft-people-extended-info {
        display: block;
      }
      .ft-people-group li:hover .ft-people-photo span {
        border-color: #BCCAD3;
      }
      .ft-people-author .ft-people-group-inner {
        border-color: #7266ba;
      }
      .ft-people-executor .ft-people-group-inner {
        border-color: #23b7e5;
      }
      .ft-people-external-executor .ft-people-group-inner {
        border-color: #fad733;
      }
      .ft-people-observer .ft-people-group-inner {
        border-color: #27c24c;
      }

      .ft-people-photo {
        display: table-cell;
        padding: 4px 0 4px 17px;
        /* vertical-align: middle; */
        padding-top: 0;
        padding-left: 0;
      }
      .ft-people-photo span {
        display: block;
        width: 34px;
        height: 34px;
        border: 2px solid #fff;
        border-radius: 50%;
        -webkit-background-size: cover;
        background-size: cover;
        background-repeat: no-repeat;
        background-position: center center;
        box-sizing: border-box;
        background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACIAAAAiCAMAAAANmfvwAAAAh1BMVEUAAADY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+WKk5iPmJ2NlpvU2+Grs7nDy9G+xsuttrugqa7N1Nqyur+VnqOSm6DW3eOjrLGcpaqXoKXJ0de6wseosLadpqvP192aoqh4jQezAAAAFXRSTlMA+uy0s6BgIhbyy35aPcxZ83w+ejxHN123AAABYklEQVQ4y42U2XLCMAxFnZUQdlpvsbMCAUL///vaNLIsmtLpfZPnjCVdyWZEWZrkYRCEeZJm7Ddt4oCjgngzAxYR/6Fo8Uzslnym5ZoSKw4yg7gYhFaeeIMjfRajztoxB8wCB6dKTKpOjtlBpa4OK5ws1jPVjL0UiBS+r5F4x1AiIjlq9CfGqEek90jMWOY97RBpic8ZS32kEFHcK2WJDypEPgiSsNwHN0QaguQs9AFad9EECVlAohqQKycKKKKv92lGV00Rn6huWlUXUsl7LdumJomgXF2q79mYxnAztl24m7bQtB6mFLwRJZ/SDcAkYF0Js9GmNRpcLk5gXRbQCd6sullnsZkGAGNEWwtRXFxQwhjZhiJfgN+ayi0Di+iqdLbFpRlviXAxH7as+k4qJaRQSnZ9VdqHX0y25i+FT+nwiliRp/YnAbn2c2C//v+zRx1jujrxcQbAF7Qdv6Dt8xf0CQt3TYPhEUP4AAAAAElFTkSuQmCC');
      }
      .ft-people-info {
        padding: 0 13px;
        display: table-cell;
        vertical-align: middle;
        width: 100%;
      }
      .ft-people-info &gt; span {
        display: block;
      }
      .ft-people-info &gt; strong {
        font-weight: bold;
        font-size: 11px;
        color: #7d8fa4;
      }
      .ft-people-info .date{
        color: #B2B5BE;
        font-size: 12px;
      }
      .ft-people-info .expandableText{
        margin-top: 10px;

      }
        .tag,
        a.tag,
        a.tag:visited,
        .issue .tagLine .tag,
        .issue .tagLine a.tag,
        .issue .tagLine a.tag:visited
       {
            padding: 5px 10px;
            border-radius: 5px;
            color: white;
            font-size: 11px;
            display: inline-block;
            margin-right: 5px;
            margin-top: 10px;
            border: 1px solid #E7E8EC;
            text-decoration: none;

            /*background-color: #E5F1FF;
            color: #319ADC;
            color: #235dc1;*/

            background-color: #EDF1F2;
            color: #58666E;


        }
        .tag,
        a.tag:hover,
        .card a.tag:hover,
        .issue .tagLine .tag,
        .issue .tagLine a.tag:hover


        {
            /*background-color: #319ADC;
            background-color: #235dc1;*/
            color: white;

            background-color: #58666E;
            border-color: #58666E;

        }


</style>
<div class="card">
        <input type="hidden" name="documentId" value="{//ROOT//APPEAL//ID}"/>
        <div class="cardHeader"><div class="numberSection"><div class="bigNumber">№ <xsl:value-of select="//ROOT//ALT_CODE"/> от <xsl:value-of select="//ROOT//APPEAL_DATE"/></div>
        <div class="requestType"><xsl:value-of select="//ROOT//APPEAL_SOURCE_NAME"/></div></div><div class="operator"><div><xsl:value-of select="//ROOT//EXECUTOR_FIO "/></div><div class="label">оператор</div></div><xsl:if test="//ROOT//DEADLINE//DEADLINE_DATE"><div class="deadLine">
            <div class="label">Срок исполнения</div>
            <div class="date"><xsl:value-of select="//ROOT//DEADLINE//DEADLINE_DATE"/></div>
        </div></xsl:if>
        <div class="status" style="background-color: {//ROOT//APPEAL_STATUS_COLOR}" ><xsl:value-of select="//ROOT//APPEAL_STATUS_NAME "/></div>
        <div class="cardHeaderButtonBar">
            <div class="rDropWrapper buttonIcon">
                <div class="rDrop"><img src="/portal_static/img/redesign/settings.png"/></div>
                <div class="rDropTarget" style="display: none;">
                    <xsl:for-each select="//CC_APPEAL//APPEAL/BUTTONS/BUTTON">

                        <xsl:choose>
                            <xsl:when test="NICK = 'BtnTransfer_2Line' or NICK = 'BtnAppointExecutor'">
                                <a href="{FORM}" onclick="f.openWin(this.href, 'appealForm', 600, 450); return false;"><xsl:value-of select="NAME"/></a>
                            </xsl:when>
                            <xsl:when test="NICK = 'BtnClose'">
                                <a href="{FORM}" onclick="f.openWin(this.href, 'appealForm', 800, 630); return false;"><xsl:value-of select="NAME"/></a>
                            </xsl:when>
                            <xsl:otherwise>
                                <a href="{FORM}" onclick="f.openWin(this.href, 'appealForm', 1310, 800); return false;"><xsl:value-of select="NAME"/></a>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </div>
            </div>
        </div>
        </div>
        <div class="cardBody">
            <div class="cardBodyMain">
                <div class="tableView">
                    <xsl:if test="//ROOT//LAST_NAME or //ROOT//FIRST_NAME or //ROOT//MIDDLE_NAME">
                    <div class="row">
                        <div class="label"><span>ФИО</span></div>
                        <div class="value"><xsl:value-of select="string-join((//ROOT//LAST_NAME, //ROOT//FIRST_NAME, //ROOT//MIDDLE_NAME), ' ')"/></div>
                    </div>
                    </xsl:if>
                    <xsl:if test="//ROOT//PHONE">
                    <div class="row">
                        <div class="label"><span>Телефон</span></div>
                        <div class="value"><xsl:value-of select="//ROOT//PHONE"/></div>
                    </div>
                    </xsl:if>
                    <xsl:if test="//ROOT//EMAIL">
                    <div class="row">
                        <div class="label"><span>Электронная почта</span></div>
                        <div class="value"><a href="mailto:{//ROOT//EMAIL}"><xsl:value-of select="//ROOT//EMAIL"/></a></div>
                    </div>
                    </xsl:if>
                    <xsl:if test="//ROOT//APPLICANT_TYPE_NAME">
                    <div class="row">
                        <div class="label"><span>Тип заявителя</span></div>
                        <div class="value"><xsl:value-of select="//ROOT//APPLICANT_TYPE_NAME"/></div>
                    </div>
                    </xsl:if>
                    <xsl:if test="//ROOT//APPLICANT_ORG">
                    <div class="row">
                        <div class="label"><span>Организация</span></div>
                        <div class="value"><xsl:value-of select="//ROOT//APPLICANT_ORG"/></div>
                    </div>
                    </xsl:if>
                    <xsl:if test="//ROOT//APPLICANT_ORG_INN">
                    <div class="row">
                        <div class="label"><span>ИНН</span></div>
                        <div class="value"><xsl:value-of select="//ROOT//APPLICANT_ORG_INN"/></div>
                    </div>
                    </xsl:if>
                    <xsl:if test="//ROOT//APPLICANT_ORG_OGRN">
                    <div class="row">
                        <div class="label"><span>ОГРН</span></div>
                        <div class="value"><xsl:value-of select="//ROOT//APPLICANT_ORG_OGRN"/></div>
                    </div>
                    </xsl:if>
                    <xsl:if test="//ROOT//APPEAL_TYPE_NAME">
                    <div class="row">
                        <div class="label"><span>Тип обращения</span></div>
                        <div class="value"><xsl:value-of select="//ROOT//APPEAL_TYPE_NAME"/></div>
                    </div>
                    </xsl:if>
                </div>
                <xsl:if test="//ROOT//APPEAL_TEXT != ''">
                <div class="message greyColor">
                        <h3>Текст обращения заявителя</h3>
                        <div class="expandableText"><xsl:value-of select="//ROOT//APPEAL_TEXT" /></div>
                        <xsl:for-each select="//ROOT//LABELS/LABEL">
                            <a href="{LNK}" class="tag" target="_blank"><xsl:value-of select="NAME"/></a>
                        </xsl:for-each>
                </div>
                </xsl:if>
                <div class="tableView">
                    <xsl:if test="//ROOT//COMPLAIN_ORG">
                    <div class="row">
                        <div class="label"><span>Организация</span></div>
                        <div class="value"><xsl:value-of select="//ROOT//COMPLAIN_ORG"/></div>
                    </div>
                    </xsl:if>
                    <xsl:if test="//ROOT//POSITION">
                    <div class="row">
                        <div class="label"><span>Профессия</span></div>
                        <div class="value"><xsl:value-of select="//ROOT//POSITION"/></div>

                    </div>
                    </xsl:if>
                    <xsl:if test="//ROOT//COMPLAIN_PERIOD_SINCE and //ROOT//COMPLAIN_PERIOD_TO">
                    <div class="row">
                        <div class="label"><span>Период невыплат</span></div>
                        <div class="value">с <xsl:value-of select="//ROOT//COMPLAIN_PERIOD_SINCE"/> по <xsl:value-of select="//ROOT//COMPLAIN_PERIOD_TO"/></div>
                    </div>
                    </xsl:if>
                    <xsl:if test="//ROOT//OBJECTS/OBJECT">
                    <div class="row">
                        <div class="label"><span>Объект реестра</span></div>
                        <div class="value"><xsl:for-each select="//ROOT//OBJECTS/OBJECT"><div class="reestrObject"><a target="_blank" href="/ugd/tabInfo.action?tab=CARD$CARD_OBJ&amp;tab2=CARD_OBJ_TAB&amp;documentId={ID}"><xsl:value-of select="NAME"/></a></div></xsl:for-each></div>
                    </div>
                    </xsl:if>
                    <xsl:if test="//ROOT//ADDRESS_STR != '' or //ROOT//ADD_INFO != ''">
                    <div class="row">
                        <div class="label"><span>Адрес объекта</span></div>
                        <div class="value"><xsl:value-of select="//ROOT//ADDRESS_STR"/><xsl:if test="//ROOT//ADDRESS_STR != '' and //ROOT//ADD_INFO != ''">, </xsl:if><xsl:value-of select="//ROOT//ADD_INFO"/></div>
                    </div>

                    </xsl:if>
                    <xsl:if test="//ROOT//DISTRICT_NAME != ''">
                    <div class="row">
                        <div class="label"><span>Округ, район</span></div>
                        <div class="value"><xsl:value-of select="//ROOT//DISTRICT_NAME"/> <xsl:if test="//ROOT//PREFECT_NAME != ''"> (<xsl:value-of select="//ROOT//PREFECT_NAME"/>)</xsl:if></div>
                    </div>

                    </xsl:if>
                    <xsl:if test="//ROOT//LAUNCH_YEAR != ''">
                    <div class="row">
                        <div class="label"><span>Год заселения</span></div>
                        <div class="value"><xsl:value-of select="//ROOT//LAUNCH_YEAR"/></div>
                    </div>

                    </xsl:if>
                    <xsl:if test="//ROOT//HOUSING_TYPE_NAME != ''">
                    <div class="row">
                        <div class="label"><span>Тип жилья</span></div>
                        <div class="value"><xsl:value-of select="//ROOT//HOUSING_TYPE_NAME"/></div>
                    </div>

                    </xsl:if>

                </div>
                <xsl:if test="//ROOT//APPEAL_ANSWER != ''">
                <div class="message greyColor"><h3>Ответ оператора</h3>
                    <div class="expandableText"><xsl:value-of select="//ROOT//APPEAL_ANSWER" /></div>
                </div>
                </xsl:if>
                <xsl:if test="//ROOT//COMMENTS//COMMENT">
                <div class="message"><h3>Примечание</h3>
                    <ul class="ft-people-group">
                        <xsl:for-each select="//ROOT//COMMENTS//COMMENT">
                            <li data-id="{ID}">
                                <div class="ft-people-group-inner">
                                    <div class="ft-people-photo">
                                      <span>
                                        <xsl:if test="FOTO_ID">
                                          <xsl:attribute name="style">background-image: url(/ugd/getThumb.action?cardId=<xsl:value-of select="FOTO_ID"/>)</xsl:attribute>
                                        </xsl:if>
                                      </span>
                                    </div>
                                    <div class="ft-people-info">
                                        <span><xsl:value-of select="FIO"/></span>
                                        <div class="date"><xsl:value-of select="COMMENT_DATE"/></div>
                                        <div class="expandableText"><xsl:value-of select="APPEAL_COMMENT"/></div>
                                    </div>
                                </div>
                            </li>
                        </xsl:for-each>
                    </ul>

                </div>
                </xsl:if>
            </div>
            {B{CARD$APPEAL$SIDEBAR}E}
        </div>
    </div>
    {B{SCRIPT$RICOS_DROP}E}


<script>
<![CDATA[
$(function(){
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

    $('.rDropWrapper').ricosDrop({targetPosition: 'right bottom'});

});

]]>
</script>
        <xml style="display: none">
          <xsl:copy-of select="/"/>
        </xml>

    </xsl:template>
</xsl:stylesheet>

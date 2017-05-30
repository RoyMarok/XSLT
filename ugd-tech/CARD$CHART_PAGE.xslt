<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:layout="URN:html-form-layout:v0.1" xmlns="http://www.w3.org/1999/xhtml" xmlns:ex2="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLTExtension" xmlns:ctx="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLDataContext" xmlns:gbu="http://xmlns.oracle.com/MSG_GBU_doc">
<xsl:output method="html" indent="yes" omit-xml-declaration="yes" undeclare-prefixes="yes" exclude-result-prefixes="#all"/>
<xsl:variable name="DATA">
    <ROOT xmlns="">
        <xsl:copy-of select="/"/>
    </ROOT>
</xsl:variable>

<xsl:variable name="STYLES">
<style>
    /* Styles for custom selects */
.done select {
    height: 1px;
    width: 1px;
    border: none;
    background: none;
    padding: 0;
    margin: 0;
    position: relative;
    left: -2px;
    z-index: -10;
    outline: none;
    -webkit-appearance: none;
}

.select-list {
    position: absolute;
    left: 0
}

.custom-select {
    z-index: 1;
    margin-right: 20px;
}

.custom-select * {
    -webkit-user-select: none;
    -khtml-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    -o-user-select: none;
    user-select: none;
}

.open_list {
    z-index: 10
}

.custom-select ul,
.custom-select li {
    margin: 0;
    padding: 0;
    list-style: none
}
.custom-select li{
    padding: 0 10px;
}

.custom-select,
.custom-select ul {
    position: relative;
    top: 0;
    left: 0;
    width: initial !important;
}

.custom-select .custom-text {
    cursor: pointer;
    display: inline-block;
}

.custom-select li {
    cursor: pointer;
    min-height: 25px;
    padding: 0 15px;
    line-height: 32px;
    text-align: left;
}

.select-scroll {
    position: absolute;
    right: 2px;
    top: 2px;
    z-index: 2

}

.default-scroll ul {
    overflow-y: scroll
}

.custom-scroll {
    overflow: hidden
}

.scroll-drag {
    display: block;
    position: absolute;
    left: 1px;
    cursor: pointer
}

.disabled * {
    cursor: default !important
}

/* Style for example*/
.custom-select {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 11px;
    font-weight: bold;
    display: inline-block;
}

.custom-select .custom-text,
.custom-select.disabled span.custom-text:hover {
    overflow: hidden;
    color: #FFF;
    font-size: 1rem;
    color: #1783ff;
    font-weight: normal;
    border-bottom: 1px dashed #CDDAFA;
    width: initial !important;
}

.custom-select .custom-text:after {
    font-size: 15px;
    position: relative;
    top: -6px;
    right: 12px;
    display: block;
    /*content: '?';*/
    float: right;
    width: 6px;
    z-index: 2;
}

.custom-select span.custom-text:hover,
.active span.custom-text {

}

.select-list {
    top: 28px;
    line-height: 25px;
    color: #7D8FA4;
    /*padding: 0 10px;*/
    background-color: #fff;
    -moz-box-shadow: 0px 5px 16px rgba(0, 51, 102, 0.25);
    -webkit-box-shadow: 0px 5px 16px rgba(0, 51, 102, 0.25);
    box-shadow: 0px 5px 16px rgba(0, 51, 102, 0.25);
    font-weight: normal;
}

.select-list.custom-scroll {
    /*padding: 2px 0 2px 10px;*/
}

.select-list .selected{
    color: #fff;
    background-color: #1783ff;
}
.select-list li.selected:hover{
    color: #fff;
    background-color: #0072ff;
}
.select-list li:hover {
    color: #1783ff;
    color: #fff;
    background-color: #1783ff;
}

.select-list li.disabled {
    color: #CCCCCC;
    cursor: default
}

.select-scroll {
    background-color: #73b0e2;
    width: 12px;
    -webkit-border-radius: 2px;
    -moz-border-radius: 2px;
    border-radius: 2px;
}

.scroll-drag {
    top: 0;
    width: 10px;
    background-color: #14609e;
    -webkit-border-radius: 2px;
    -moz-border-radius: 2px;
    border-radius: 2px;
}

.maxlength .scroll-drag:after {
    display: block;
    content: '?';
    font-size: 14px;
    position: relative;
    left: 50%;
    top: 50%;
    margin: -14px 0 0 -4px
}

.custom-select .hover {
    color: #FFF
}

.custom-select.disabled {
    opacity: 0.5 !important;
}
</style>
<style>
    html{
        font-family: 'PT Sans Regular', 'PT Sans', sans-serif;
        font-size: 100%;
        color: #333;
        background-color: #eef2f4;
    }
    .dashboard{
        padding: 0 50px;
    }

    .dashSection{
        display: inline-block;
        max-width: 1085px;
        vertical-align: top;
    }
    .dashboard h1{
        font-size: 1.375rem;
        margin-bottom: 4rem;
        text-align: center;
    }
    .dashboard h2{
        font-size: 1.1875rem;
        margin-bottom: 25px;
        font-weight: 400;
    }
    .chart{
        border-radius: 5px;
        padding: 20px;
        border: 1px solid #e7e8ec;
        background-color: white;
        margin-right: 16px;
        margin-bottom: 20px;
        display: inline-block;
        width: 524px;
        vertical-align: top;
    }
    .chart:hover{
        -moz-box-shadow: 0px 5px 16px rgba(0, 51, 102, 0.25);
        -webkit-box-shadow: 0px 5px 16px rgba(0, 51, 102, 0.25);
        box-shadow: 0px 5px 16px rgba(0, 51, 102, 0.25);
    }
    .chart.wide{
        width: 1068px;
    }
    .chart.doc{
        width: 684px;
        display: block;
    }
    .chart h3{
        margin-bottom: 25px;
        margin-top: 0;
    }
    .wrapper {
       /*height: 600px;*/
    }
    .calendar input {
       width: 320px;
    }
    .calendar div {
       /*font-size: 9pt;*/
    }
    /*.date-range-selected > .ui-state-active,
    .date-range-selected > .ui-state-default {
       background: none;
       background-color: lightsteelblue;
    }*/
    .pickerwrap .ui-datepicker .ui-datepicker-title {
            color: #fff;
            margin-bottom: 20px;
            height: 22px;
        }
    .token-input-dropdown ul li {
        font-size: 16px;
    }
    #ui-datepicker-div{
        width: 600px;
        border-radius: 5px;
        border: none;
    }
    /*div.token-input-dropdown ul li.token-input-selected-dropdown-item {
        background-color: #319adc;
        color: #fff;
    }*/
    .docElm{
        display: inline-block;
        width:320px;
        vertical-align: top;
        margin-bottom: 40px;
    }
    .docElm.objFno{
        width: 170px;
        padding-right: 10px;
    }
    .docElm.objFno .bigNumber{
        display: inline-block;
        vertical-align: top;
        font-size: 36px;
        font-weight: bold;
        margin-top: 5px;
        margin-left: 5px;
        max-width: 100px;
    }
    .docElm.objFno .text{
        display: block;
        font-size: 12px;
     }
    .docElm.objFno a{
        text-decoration: none;
    }
    .docElm .img{
        border-radius: 50%;
        width: 56px;
        display: inline-block;
        height: 56px;
        background-color: rebeccapurple;
        margin-right: 15px;
        vertical-align: top;
        transition: all .3s;
    }
    .docElm .img img{
        display: block;
        margin: 0 auto;
        margin-top: 8px;
    }

    .docElm .img.blue{
        background-color: #2DB7F5;
    }
    .docElm .img.purple{
        background-color: #808BC6;
    }
    .docElm .img.yellow{
        background-color: #F9BF00;
    }
    .docElm .img.green{
        background-color: #7DC856;
    }
    .docElm:hover .img{
        background-color: #2074BA;
        transition: all .3s;
    }
    .docElm .text{
        color: #7D8FA4;
        display: inline-block;
        vertical-align: top;
        font-size: 14px;
    }
    .bigNumber{
        font-size: 1.875rem;
        color: #44505E;
        /*margin-top: 10px;*/
        font-weight: bold;
    }

    #ui-datepicker-div .ui-datepicker-calendar td.selected a{
        background-color: #E8F3FB;
        border-color: #E8F3FB;
    }
    #ui-datepicker-div, #ui-datepicker-div .ui-datepicker-calendar td a{
        font-size: 1rem;
    }
    .preloader{
        height: 75px;
        width: 75px;
        overflow: visible;
        margin: 30px auto;
        margin: 11% auto;

    }
    .calendar{
        font-size: 0.875rem;
        margin-bottom: 25px;
    }
    .calendar input{
        border: 1px solid #d9dbdd;
        border-radius: 5px;
        line-height: 30px;
        height: 30px;
    }
    .calendar input.dp{
        opacity: 0;
        position: relative;
        z-index: 200;
    }
    .date_view{
        position: absolute;
        margin-top: -30px;
        padding: 7px 25px;
        background-color: #fff;
        border: 1px solid #d9dbdd;
        border-radius: 5px;
        z-index: 100;
        z-index: 4;
        width: 320px;
        background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA8AAAALAQMAAACaiUUfAAAABlBMVEUAAAB8j6SVLMuOAAAAAXRSTlMAQObYZgAAABZJREFUCNdj4HsHRUDw7h0YQdgPIAgAx3cN8yjqQUUAAAAASUVORK5CYII=');
        background-position: right;
        background-position: 293px;
        background-repeat: no-repeat;
    }
    div.envelope {
        max-width: 100vw;
        margin: 0 auto;
        padding: 0;
    }
    #headerButtons, #tabs-container, div#secondMenu{
        display: none;
    }
    .minimal2calendars{
        border-radius: 5px;
        -moz-box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
        -webkit-box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
        box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
        /*overflow: hidden;*/
        background-color: #fff;
        width: 556px;
        /*border: 1px solid #CDD6DF;*/
        padding-top: 17px;
        position: absolute;
        z-index: 800;
        z-index: 4;
        display: none;
    }
    .pikers_one, .pikers_two{
        display: inline-block;
        vertical-align: top;

    }
    .pickerwrap{
        margin-bottom: 15px;
    }
    .pikers_one{
        padding-right: 17px;
        padding-left: 14px;
    }
    .pikers_two{
        padding-left: 20px;
        border-left: 1px solid #CDD6DF;
    }
    .minimal2calendars input.bigBigButton{
        width: 100%;
        background-color: #1783ff;
        color: #fff;
        border: none;
        height: 47px;
        font-size: 1rem;
        border-radius: 0;
        border-bottom-left-radius: 5px;
        border-bottom-right-radius: 5px;
    }
    .minimal2calendars input.bigBigButton:hover{
        background-color: #0072ff;
    }
    .pickerwrap .ui-datepicker{
        width: inherit;
        border: none;
    }
    .pickerwrap .ui-state-default,
    .pickerwrap .ui-widget-content .ui-state-default,
    .pickerwrap .ui-widget-header .ui-state-default{
        border-radius: 3px;
        border: none;
        text-align: left;
        margin: 3px;
        padding: 7px;
        background: none;
    }
    .pickerwrap .ui-state-highlight,
    .pickerwrap .ui-widget-content .ui-state-highlight,
    .pickerwrap .ui-widget-header .ui-state-highlight{

        background-color: #1783FF;
    }
    .pickerwrap .ui-state-active,
    .pickerwrap .ui-widget-content .ui-state-active,
    .pickerwrap .ui-widget-header .ui-state-active{
        /*background-color: #0865CD;*/
        color: white;
    }
    .pickerwrap .ui-state-hover
    /*.pickerwrap .ui-widget-content .ui-state-hover,
    .pickerwrap .ui-widget-header .ui-state-hover,
    .pickerwrap .ui-state-focus,
    .pickerwrap .ui-widget-content .ui-state-focus,
    .pickerwrap .ui-widget-header .ui-state-focus*/{
        background-color: #EFF6FD;
        color: #555;
    }
    .pickerwrap .ui-datepicker th{
        font-weight: normal;
        font-size: 11px;
        color: #7C8FA4;
    }
    .pickerwrap td,
    .pickerwrap td a{
        transition: all .3s;
    }
    .pickerwrap .ui-datepicker-today a{
        color: #555;
        border: 1px solid #1783FF !important;

    }
    .pickerwrap .ui-datepicker-today.selected a{
        color: #fff;
        border: 1px solid #0865cd !important;
    }
    .pickerwrap .ui-datepicker .ui-datepicker-header{
        border: none;
    }
    .pickerwrap .ui-datepicker select.ui-datepicker-month,
    .pickerwrap .ui-datepicker select.ui-datepicker-year,
    .pickerwrap .ui-datepicker select.ui-datepicker-month:focus,
    .pickerwrap .ui-datepicker select.ui-datepicker-year:focus
    {
        border: none;
        outline: none;
        /*border-bottom: 1px dashed #CDDAFA;*/
        background: white no-repeat center right;
        background-color: transparent;
        background-image: none;
    }
    .pickerwrap .ui-datepicker select:-internal-list-box{
        border: none;
        outline: none;
        -moz-box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
        -webkit-box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
        box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
    }
    .ui-datepicker-month{
        margin-right: 5px;
    }
    .customSelectInner{
        font-weight: normal;
        border-bottom: 1px dashed #CDDAFA;
        color: #1783FF;
        cursor: pointer;
    }
    .pickerwrap .ui-datepicker td{
        /*border-bottom: 1px solid white !important;
        border-top: 1px solid white !important;
        border-collapse: separate !important;
        border-spacing: 1px !important;*/
    }
    .pickerwrap .ui-datepicker td.selected{
        background-color: #1783FF;

    }
    .pickerwrap .ui-datepicker td.selected a:not(.ui-state-hover){
        color: white;
    }
    .pickerwrap .ui-datepicker td.selected-start,
    .pickerwrap .ui-datepicker td.selected:first-child
    {
        border-top-left-radius: 3px;
        border-bottom-left-radius: 3px;
    }
    .pickerwrap .ui-datepicker td.selected-end,
    .pickerwrap td.ui-datepicker-week-end + td.ui-datepicker-week-end.selected{
        border-top-right-radius: 3px;
        border-bottom-right-radius: 3px;
    }
    .pickerwrap .ui-datepicker td.selected-start:not(.selected-end) a,
    .pickerwrap .ui-datepicker td.selected-end:not(.selected-start) a{
        background-color: #0865CD !important;
    }
    .pickerwrap .ui-datepicker .ui-datepicker-next span,
    .pickerwrap .ui-datepicker .ui-datepicker-prev span{
        background-image: url(/portal_static/img/icons/datepicker/right_arrow.png);
        width: 18px;
        height: 22px;
        background-position: 0;
    }
    .pickerwrap .ui-datepicker .ui-datepicker-prev span{
        transform: rotate(180deg);
    }
    .pickerwrap .ui-datepicker .ui-datepicker-next,
    .pickerwrap .ui-datepicker .ui-datepicker-prev,
    .pickerwrap .ui-datepicker .ui-datepicker-prev-hover,
    .pickerwrap .ui-datepicker .ui-datepicker-next-hover{
        top: 0;
        right: 0;
        border: none;
        background: none;
        cursor: pointer;
    }
    .pickerwrap .ui-state-hover,
    .pickerwrap .ui-widget-content .ui-state-hover,
    .pickerwrap .ui-widget-header .ui-state-hover:not(.ui-corner-all){
        border: none;
        background-color: #EFF6FD;
        color: #555;
    }
    .pickerwrap .ui-datepicker-title select{
        display: none;
    }
    .highcharts-credits{
        display: none;
    }
    .emptyRange{
        text-align: center;
        color: #7C8FA4;
        font-size: 1rem;
        width: 220px;
        margin: 0px auto;
        margin-top: 60px;
    }
    .search .tabname{
        display: none;
    }
</style>
<link rel="stylesheet" href="/portal_static/css/ps/theme/ui.datepicker.css" />
<link rel="stylesheet" href="/autoform/css/spbren/custom-theme/jquery-ui.custom.css" />
<link rel="stylesheet" href="/portal_static/css/form-customize.css"/>
</xsl:variable>

<xsl:variable name="LAYOUT">
    <form class="date_form" style="display: none;">
    <input type="hidden" name="DDATE_BEGIN" value="{//PARAMETER_MAP//DDATE_BEGIN}"/>
    <input type="hidden" name="DDATE_END" value="{//PARAMETER_MAP//DDATE_END}"/>
    </form>
    <div class="dashboard">
        <h1>Мониторинг ведения информационных ресурсов ИАС УГД по состоянию на <span class="currentDate">13.02.2017</span></h1>

        <!--div class="wrapper"><div class="calendar"><input type="text" class="dp"/><div class="date_view"><xsl:value-of select="//PARAMETER_MAP//DDATE_BEGIN"/> - <xsl:value-of select="//PARAMETER_MAP//DDATE_END"/></div></div></div-->
        <div class="wrapper"><div class="calendar"><div class="date_view"><xsl:value-of select="//PARAMETER_MAP//DDATE_BEGIN"/> - <xsl:value-of select="//PARAMETER_MAP//DDATE_END"/></div><div class="minimal2calendars">
            <div class="pickerwrap">
                <div class="pikers_one"></div>
                <div class="pikers_two"></div>
            </div>
            <input type="button" value="Применить" class="bigBigButton"/>
        </div></div></div>

        <div class="dashObjects dashSection">
            <h2>Объекты</h2>
            <div class="chart">
                <h3>Динамика формирования объектов по месяцам</h3>
                <div class="ajaxNeed" data-xslt="CARD$CHART$DYN_OBJ_MONTH" style="height: 280px"></div>
            </div>
            <div class="chart">
                <h3>Динамика формирования объектов по статусам</h3>
                <div class="ajaxNeed" data-xslt="CARD$CHART$DYN_OBJ_STAT" style="height: 280px"></div>
            </div>

            <div class="chart wide">
                <h3>Оценка обеспеченности созданных объектов документами</h3>
                <div class="ajaxNeed" data-xslt="CARD$CHART$ASSESS" style="height: 380px"></div>
            </div>

            <div class="chart wide">
                <h3>Динамика формирования объектов по ФНО</h3>
                <div class="ajaxNeed" data-xslt="CARD$CHART$OBJ_FNO" style="height: 340px"></div>
            </div>
        </div>
        <div class="dashDocuments dashSection">
            <h2>Документы</h2>

            <div class="chart doc">
                <h3>Показатели документов</h3>
                <div class="ajaxNeed" data-xslt="CARD$CHART$DOC_STAT" style="height: 180px"></div>
            </div>

            <div class="chart doc">
                <h3>Статистика привязки по видам документов</h3>
                <div class="ajaxNeed" data-xslt="CARD$CHART$DOC_TYPE" style="height: 280px"></div>
            </div>

            <div class="chart doc">
                <h3>Оценка качества внесенных по ГПЗУ сведений</h3>
                <div class="ajaxNeed" data-xslt="CARD$CHART$GPZU_QUAL" style="height: 326px"></div>
            </div>
        </div>

    </div>
    <div class="emptyRange"  style="display: none">
        <img src="/portal_static/img/icons/empty_dashboard.png" alt=""/>
        <p>В данном диапазоне данных нет, выберите другой</p>
    </div>
    <div class="preloader" style="display: none"><svg viewBox="0 0 120 120" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">

    <symbol id="s--circle">
        <circle r="10" cx="20" cy="20"></circle>
    </symbol>

    <g class="g-circles g-circles--v1">
        <g class="g--circle">
            <use xlink:href="#s--circle" class="u--circle"/>
        </g>
        <g class="g--circle">
            <use xlink:href="#s--circle" class="u--circle"/>
        </g>
        <g class="g--circle">
            <use xlink:href="#s--circle" class="u--circle"/>
        </g>
        <g class="g--circle">
            <use xlink:href="#s--circle" class="u--circle"/>
        </g>
        <g class="g--circle">
            <use xlink:href="#s--circle" class="u--circle"/>
        </g>
        <g class="g--circle">
            <use xlink:href="#s--circle" class="u--circle"/>
        </g>
        <g class="g--circle">
            <use xlink:href="#s--circle" class="u--circle"/>
        </g>
        <g class="g--circle">
            <use xlink:href="#s--circle" class="u--circle"/>
        </g>
        <g class="g--circle">
            <use xlink:href="#s--circle" class="u--circle"/>
        </g>
        <g class="g--circle">
            <use xlink:href="#s--circle" class="u--circle"/>
        </g>
        <g class="g--circle">
            <use xlink:href="#s--circle" class="u--circle"/>
        </g>
        <g class="g--circle">
            <use xlink:href="#s--circle" class="u--circle"/>
        </g>
    </g>
</svg></div>

</xsl:variable>

{B{CARD$HTML_TEMPLATE}E}
{B{CARD$CHART$CALL2ACTION_TMPL}E}
    <xsl:template match="/">
        <!--xsl:call-template name="pageBuilder">
            <xsl:with-param name="customStyles">
              <xsl:copy-of select="$STYLES"/>
            </xsl:with-param>
            <xsl:with-param name="data" select="$DATA"/>
            <xsl:with-param name="layout" select="$LAYOUT"/>
        </xsl:call-template-->
        <xsl:copy-of select="$STYLES"/>
        <xsl:copy-of select="$LAYOUT"/>
        <xsl:call-template name="call2actionDash"/>
        <xml style="display: none">
          <xsl:copy-of select="$DATA"/>
        </xml>
<script src="/portal_static/js/highcharts_5.js"></script>
<script src="js/jquery/jquery-ui-1.10.4.custom.min.js"></script>
<script src="/static/JQueryPlugins/ui.datepicker-ru.js"></script>
<script src="/portal_static/js/jquery.datepicker.extension.range.min.js"></script>
<script src="/static/JQueryPlugins/jquery.mousewheel.js"></script>
<script src="/static/JQueryPlugins/jquery.selectik.min.js"></script>
<!--script src="https://cdn.jsdelivr.net/jquery.xml2json/1.2/jquery.xml2json.js"></script-->
<script><![CDATA[
if(window.jQuery)(function($){$.extend({xml2json:function(xml,extended){if(!xml)return{};function parseXML(node,simple){if(!node)return null;var txt='',obj=null,att=null;var nt=node.nodeType,nn=jsVar(node.localName||node.nodeName);var nv=node.text||node.nodeValue||'';if(node.childNodes){if(node.childNodes.length>0){$.each(node.childNodes,function(n,cn){var cnt=cn.nodeType,cnn=jsVar(cn.localName||cn.nodeName);var cnv=cn.text||cn.nodeValue||'';if(cnt==8){return}
else if(cnt==3||cnt==4||!cnn){if(cnv.match(/^\s+$/)){return};txt+=cnv.replace(/^\s+/,'').replace(/\s+$/,'')}
else{obj=obj||{};if(obj[cnn]){if(!obj[cnn].length)obj[cnn]=myArr(obj[cnn]);obj[cnn]=myArr(obj[cnn]);obj[cnn][obj[cnn].length]=parseXML(cn,!0);obj[cnn].length=obj[cnn].length}
else{obj[cnn]=parseXML(cn)}}})}};if(node.attributes){if(node.attributes.length>0){att={};obj=obj||{};$.each(node.attributes,function(a,at){var atn=jsVar(at.name),atv=at.value;att[atn]=atv;if(obj[atn]){obj[cnn]=myArr(obj[cnn]);obj[atn][obj[atn].length]=atv;obj[atn].length=obj[atn].length}
else{obj[atn]=atv}})}};if(obj){obj=$.extend((txt!=''?new String(txt):{}),obj||{});txt=(obj.text)?(typeof(obj.text)=='object'?obj.text:[obj.text||'']).concat([txt]):txt;if(txt)obj.text=txt;txt=''};var out=obj||txt;if(extended){if(txt)out={};txt=out.text||txt||'';if(txt)out.text=txt;if(!simple)out=myArr(out)};return out};var jsVar=function(s){return String(s||'').replace(/-/g,"_")};function isNum(s){var regexp=/^((-)?([0-9]+)(([\.\,]{0,1})([0-9]+))?$)/
return(typeof s=="number")||regexp.test(String((s&&typeof s=="string")?jQuery.trim(s):''))};var myArr=function(o){if(!$.isArray(o))o=[o];o.length=o.length;return o};if(typeof xml=='string')xml=$.text2xml(xml);if(!xml.nodeType)return;if(xml.nodeType==3||xml.nodeType==4)return xml.nodeValue;var root=(xml.nodeType==9)?xml.documentElement:xml;var out=parseXML(root,!0);xml=null;root=null;return out},text2xml:function(str){var out;try{var xml=((!$.support.opacity&&!$.support.style))?new ActiveXObject("Microsoft.XMLDOM"):new DOMParser();xml.async=!1}catch(e){throw new Error("XML Parser could not be instantiated")};try{if((!$.support.opacity&&!$.support.style))out=(xml.loadXML(str))?xml:!1;else out=xml.parseFromString(str,"text/xml")}catch(e){throw new Error("Error parsing XML string")};return out}})})(jQuery)
]]>
</script>

<script>
<![CDATA[
var charts = {};
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
$.datepicker._defaults.onAfterUpdate = null;
var datepicker__updateDatepicker = $.datepicker._updateDatepicker;
$.datepicker._updateDatepicker = function( inst ) {
   datepicker__updateDatepicker.call( this, inst );
   var onAfterUpdate = this._get(inst, 'onAfterUpdate');
   if (onAfterUpdate)
      onAfterUpdate.apply((inst.input ? inst.input[0] : null),
         [(inst.input ? inst.input.val() : ''), inst]);
}
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
var highChartsArr = {};
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
    return new Date(startDateArr[0], startDateArr[1]-1, startDateArr[2]);
}
var drillDownLinks = {};
var allXmlData = {};
function getCharts(){
    $('.ajaxNeed').each(function(indx, elm){
            if ($(elm).attr('data-xslt')){
                $(elm).html($('.preloader').eq(0).clone().show());
                $.ajax({
                    url: 'getCardHtml.action',
                    type: 'GET',
                    data: {
                        cardId: $(elm).attr('data-xslt'),
                        DDATE_BEGIN: $('[name="DDATE_BEGIN"]').val(),
                        DDATE_END: $('[name="DDATE_END"]').val()
                    }
                }).success(function(data){
                    var allZeroData = false;
                    var $data = $(data);
                    var $highchartData = $($data[2]);
                    var chartName = $(elm).attr('data-xslt');

                    /* получение массива ROW из xml */
                    var xmlRowArr = [];
                    if ($.xml2json()){
                        var xmlObj = $.xml2json($data[$data.length-1]);
                        for (var key in xmlObj['root']){
                            for (var key2 in xmlObj['root'][key]){
                                xmlRowArr = xmlObj['root'][key][key2]['row']
                            }
                            }


                        /* приведение всех дробных чисел к float */
                        for (var i=0; i<xmlRowArr.length;i++){
                            for (var key in xmlRowArr[i]){
                                if (/\A(\d*,\d+)/g.test(xmlRowArr[i][key])){
                                    xmlRowArr[i][key] = parseFloat(xmlRowArr[i][key].replace(/,/g, '.'));
                                }
                            }
                        }
                    }
                    allXmlData[chartName] = xmlRowArr;

                    if ($highchartData.hasClass('highchart_data')){
                        console.log($highchartData);
                        var highchartData = {
                            title: {text: ' '},
                            chart: {zoomType: 'x'},
                            legend: {enabled: false},
                            colors: ['#808BC6', '#F6C700', '#E54400', '#7DC856', '#91E8E1', '#7CB5EC'],
                            xAxis: {
                                gridLineWidth: 1,
                                            },
                            yAxis: {
                                title: {text: ' '}
                            },
                            responsive: {
                                rules: [{
                                    condition: {
                                    maxWidth: 1920
                                    },
                                }]
                            },
                            plotOptions: {
                                bar: {
                                    colorByPoint: true,
                                    cursor: 'pointer'
                                },
                                column: {
                                    colorByPoint: true,
                                    cursor: 'pointer'
                                },
                                pie: {
                                    colorByPoint: true,
                                    cursor: 'pointer'
                                },
                            }
                        };
                        highchartData.xAxis.categories = $highchartData.find('.categories').text().split('|');
                        highchartData.series = [];
                        var dataArr=[];
                        /*var linksArr;
                        $highchartData.find('.links').each(function(indxLnk, elmLnk){
                            var linkString = $(elm2).text();
                            linkString = linkString.replace(/(&amp;)/g, '&');
                            if ($(elmLnk).attr('data-element-id')){
                                linksArr[$(elmLnk).attr('data-element-id')] = linkString.split('|||')
                            };
                        });*/

                        /*console.log($highchartData.find('.series .element').length);*/
                        $highchartData.find('.series .element').each(function(indx2, elm2){
                            /*console.log($(elm2));*/
                            if ($(elm2).attr('data-chart-type') != 'line'){
                                highchartData.chart.zoomType = 'y';
                            }
                            if ($(elm2).attr('data-names')){
                                var dataArrNames = $(elm2).attr('data-names').split('|');
                            }

                            if ($(elm2).attr('data-stacked')=='true'){
                                var seriesObj = [];
                                dataArr=[];

                                if (chartName=="CARD$CHART$DOC_TYPE"){
                                    seriesObj[0] = {
                                            name: (dataArrNames && dataArrNames[0])?dataArrNames[0]:'',
                                            data: []
                                        };
                                    seriesObj[1] = {
                                            name: (dataArrNames && dataArrNames[1])?dataArrNames[1]:'',
                                            data: []
                                        };
                                    seriesObj[2] = {
                                            name: (dataArrNames && dataArrNames[2])?dataArrNames[2]:'',
                                            data: []
                                        };
                                    for (var i=0; i<xmlRowArr.length;i++){
                                        seriesObj[0]['data'].push({
                                            description: xmlRowArr[i]['cnt_lnk'],
                                            y: parseFloat(xmlRowArr[i]['rate_lnk'])
                                        });
                                        seriesObj[1]['data'].push({
                                            description: xmlRowArr[i]['cnt_unlnk'],
                                            y: parseFloat(xmlRowArr[i]['rate_unlnk'])
                                        });
                                        seriesObj[2]['data'].push({
                                            description: xmlRowArr[i]['cnt_del'],
                                            y: parseFloat(xmlRowArr[i]['rate_del'])
                                        });

                                        /*seriesObj[0]['data'].push(xmlRowArr[i]['rate_lnk']);
                                        seriesObj[1]['data'].push(xmlRowArr[i]['rate_unlnk']);
                                        seriesObj[2]['data'].push(xmlRowArr[i]['rate_del']);*/
                                        highchartData.colors = [ '#82a2cd', '#597ba8', '#fe5a3e' ];
                                    }
                                } else if (chartName=="CARD$CHART$GPZU_QUAL"){
                                    seriesObj[0] = {
                                            name: (dataArrNames && dataArrNames[0])?dataArrNames[0]:'',
                                            data: []
                                        };
                                    seriesObj[1] = {
                                            name: (dataArrNames && dataArrNames[1])?dataArrNames[1]:'',
                                            data: []
                                        };
                                    for (var i=0; i<xmlRowArr.length;i++){
                                        seriesObj[0]['data'].push({
                                            description: xmlRowArr[i]['cnt_havetep'],
                                            y: parseFloat(xmlRowArr[i]['rate_havetep'])
                                        });
                                        seriesObj[1]['data'].push({
                                            description: xmlRowArr[i]['cnt_nottep'],
                                            y: parseFloat(xmlRowArr[i]['rate_nottep'])
                                        });
                                    }
                                    highchartData.colors = [ '#597ba8', '#fe5a3e' ];
                                }else {
                                    if (/(==)/g.test($(elm2).text())){
                                    var seriesArr = $(elm2).text().split('==');
                                    for (i=0; i<seriesArr.length; i++){
                                        dataArr[i] = seriesArr[i].split('|');
                                        for(j=0;j<dataArr[i].length;j++){
                                            dataArr[i][j] = parseFloat(dataArr[i][j].replace(/,/g, '.'));
                                        }
                                        seriesObj.push({
                                            data: dataArr[i],
                                            name: (dataArrNames && dataArrNames[i])?dataArrNames[i]:''
                                        });
                                        /*console.log(dataArr);*/
                                    }
                                }
                                }


                                highchartData.chart = {type:'bar'};
                                highchartData.series = seriesObj;
                                highchartData.legend= {enabled: true};
                                highchartData.plotOptions.series = {
                                                stacking: 'normal'
                                                };
                                highchartData.plotOptions.bar.colorByPoint= false;

                                highchartData.yAxis['max'] = '100';
                                highchartData.plotOptions.bar['tooltip'] = {
                                              pointFormat: '{series.name}: <b>{point.y}%</b> ({point.description})'};


                            }
                            else{
                                var seriesObj = {
                                    name: $(elm2).attr('data-name'),
                                    type: $(elm2).attr('data-chart-type'),
                                };
                                dataArr = $(elm2).text().split('|');
                                var dataArrProcessed=[];
                                var fillFlag = true;
                                if ($(elm2).attr('data-chart-type') != 'pie'){
                                    for (key in dataArr){
                                        dataArrProcessed[key] = +dataArr[key];
                                    }
                                } else {
                                    fillFlag = false;
                                    for (var key in dataArr){
                                        if (+dataArr[key] > 0) fillFlag = true;
                                        dataArrProcessed[key] = {
                                                y: +dataArr[key]
                                            };
                                        if (dataArrNames){
                                            dataArrProcessed[key]['name'] = dataArrNames[key];
                                        }
                                    }
                                    seriesObj.size = 100;
                                    seriesObj.showInLegend = false;
                                    seriesObj.dataLabels = {
                                        enabled: true
                                    };
                                    seriesObj.center = [50, 80];
                                }
                                seriesObj.data = dataArrProcessed;
                                if (fillFlag)  highchartData.series.push(seriesObj);
                                if ($(elm2).attr('data-chart-type') == 'line'){
                                highchartData.plotOptions = {
                                    series: {
                                        marker: {
                                            enabled: false
                                        },
                                        cursor: 'pointer',
                                        color: '#FDCD37'
                                        }
                                    }
                                }
                                if ($(elm2).attr('data-chart-type') == 'pie'){
                                    highchartData.plotOptions.pie =
                                           {
                                            colors: [ '#7DC856', '#E54400'],
                                            tooltip: {
                                              pointFormat: '{series.name}: <b>{point.y}</b>'
                                            },
                                            dataLabels: {
                                              enabled: true,
                                              format: '<b>{point.name}</b>: <br/>{point.percentage:.1f} %'
                                            },
                                            cursor: 'pointer'
                                          }

                                }
                            }


                            drillDownLinks[chartName] = {};

                            switch (chartName){
                                case "CARD$CHART$DYN_OBJ_MONTH":
                                    for (var i=0; i<xmlRowArr.length;i++){
                                        drillDownLinks[chartName][xmlRowArr[i]['cnt']] = xmlRowArr[i]['lnk'];
                                    }
                                    if (!xmlRowArr.length && typeof(xmlRowArr)=='object' && xmlRowArr['cnt']){
                                        drillDownLinks[chartName][xmlRowArr['cnt']] = xmlRowArr['lnk']
                                    }

                                    highchartData.plotOptions.series['point'] = {
                                        events: {
                                            click: function(){
                                                console.log(this.y);
                                                var lnk = '';
                                                if (drillDownLinks[chartName] && drillDownLinks[chartName][this.y]){
                                                    lnk = drillDownLinks[chartName][this.y];
                                                }
                                                window.open(lnk, '_blank');
                                            }
                                        }
                                    };
                                    if ((Object.keys(drillDownLinks[chartName]).length==1 && !!drillDownLinks[chartName][0]) || Object.keys(drillDownLinks[chartName]).length==0){
                                        allZeroData= true;
                                    }

                                    break;
                                case "CARD$CHART$DYN_OBJ_STAT":
                                    for (var i=0; i<xmlRowArr.length;i++){
                                        drillDownLinks[chartName][xmlRowArr[i]['cnt']] = xmlRowArr[i]['lnk'];
                                    }
                                    if (!xmlRowArr.length && typeof(xmlRowArr)=='object' && drillDownLinks[chartName][xmlRowArr['cnt']]){
                                        drillDownLinks[chartName][xmlRowArr['cnt']] = xmlRowArr['lnk']
                                    }

                                    highchartData.plotOptions.column['events'] = {
                                        click: function(event){
                                            /*console.log('Event Data:');
                                            console.log(event);*/
                                            console.log('Event point Data: '+ event.point.y);
                                            var lnk = '';
                                            if (drillDownLinks[chartName] && drillDownLinks[chartName][event.point.y]){
                                                lnk = drillDownLinks[chartName][event.point.y];
                                                window.open(lnk, '_blank');
                                            }

                                        }
                                    };
                                    highchartData.yAxis={
                                        title: ' ',
                                        type: 'logarithmic',
                                        minorTickInterval: 0.1
                                    };
                                    highchartData.plotOptions.column['dataLabels']= {
                                              enabled: true,
                                              format: '{point.y}',
                                              verticalAlign: 'top',
                                              y: -25,
                                              style: {'font-weight': 'normal', "textOutline": "none",     'text-shadow': 'white 0 1px 1px'}
                                            };
                                    if ((Object.keys(drillDownLinks[chartName]).length==1 && !!drillDownLinks[chartName][0]) || Object.keys(drillDownLinks[chartName]).length==0){
                                        allZeroData= true;
                                    }
                                    break;
                                case "CARD$CHART$ASSESS":
                                    drillDownLinks[chartName]['pie'] = {};
                                    for (var i=0; i<xmlRowArr.length;i++){
                                        if (xmlRowArr[i]['name'] == 'OBJALL' || xmlRowArr[i]['name'] == 'HAVEDOC' || xmlRowArr[i]['name'] == 'NOTDOC'){
                                            drillDownLinks[chartName]['pie'][xmlRowArr[i]['cnt']] = xmlRowArr[i]['lnk'];
                                        }else{
                                            drillDownLinks[chartName][xmlRowArr[i]['cnt']] = xmlRowArr[i]['lnk'];
                                        }

                                    };
                                    highchartData.plotOptions.column['events'] = {
                                        click: function(event){
                                            /*console.log('Event Data:');
                                            console.log(event);*/
                                            console.log('Event point Data: '+ event.point.y);
                                            var lnk = '';
                                            if (drillDownLinks[chartName] && drillDownLinks[chartName][event.point.y]){
                                                lnk = drillDownLinks[chartName][event.point.y];
                                                window.open(lnk, '_blank');
                                            }

                                        }
                                    };
                                    highchartData.plotOptions.pie['events'] = {
                                        click: function(event){
                                            /*console.log('Event Data:');
                                            console.log(event);*/
                                            console.log('Event point Data: '+ event.point.y);
                                            var lnk = '';
                                            if (drillDownLinks[chartName] && drillDownLinks[chartName]['pie'][event.point.y]){
                                                lnk = drillDownLinks[chartName]['pie'][event.point.y];
                                                window.open(lnk, '_blank');
                                            }

                                        }
                                    };
                                    if ((Object.keys(drillDownLinks[chartName]).length==2 && !!drillDownLinks[chartName][0]) || Object.keys(drillDownLinks[chartName]).length==1){
                                        allZeroData= true;
                                    }
                                    break;
                                case "CARD$CHART$DOC_TYPE":
                                    drillDownLinks[chartName] = xmlRowArr;
                                    highchartData.plotOptions.bar['events'] = {
                                        click: function(event){
                                            /*console.log('Event Data:');
                                            console.log(event);*/
                                            console.log('Event point Data: '+ event.point.y);
                                            console.log('Event point colorIndex: '+ event.point.colorIndex);
                                            console.log('Event point Index: '+ event.point.index);
                                            var lnk = '';

                                            switch (event.point.colorIndex){
                                                case 0:
                                                    lnk = xmlRowArr[event.point.index]['lnk_lnk'];
                                                    break;
                                                case 1:
                                                    lnk = xmlRowArr[event.point.index]['lnk_unlnk'];
                                                    break;
                                                case 2:
                                                    lnk = xmlRowArr[event.point.index]['lnk_del'];
                                                    break;

                                            }


                                            if (drillDownLinks[chartName] && event.point.colorIndex!= undefined && event.point.index!= undefined && lnk != ''){
                                                window.open(lnk, '_blank');
                                            }

                                        }
                                    };

                                    allZeroData= true;
                                    for (var i=0;i<drillDownLinks[chartName].length;i++){
                                        if (drillDownLinks[chartName][i]['rate_lnk']!='0' || drillDownLinks[chartName][i]['rate_unlnk']!='0' || drillDownLinks[chartName][i]['rate_del']!='0'){
                                            allZeroData = false;
                                        }
                                    }
                                    break;
                                case "CARD$CHART$GPZU_QUAL":

                                    drillDownLinks[chartName] = xmlRowArr;

                                    /*for (var i=0; i<xmlRowArr.length;i++){
                                        drillDownLinks[chartName][xmlRowArr[i]['rate']] = xmlRowArr[i]['lnk'];
                                    }
                                    if (!xmlRowArr.length && typeof(xmlRowArr)=='object'){
                                        drillDownLinks[chartName][xmlRowArr['cnt']] = xmlRowArr['lnk']
                                    }*/
                                    highchartData.plotOptions.bar['events'] = {
                                        click: function(event){
                                            /*console.log('Event Data:');
                                            console.log(event);*/
                                            console.log('Event point Data: '+ event.point.y);
                                            console.log('Event point colorIndex: '+ event.point.colorIndex);
                                            console.log('Event point Index: '+ event.point.index);
                                            var lnk = '';
                                            switch (event.point.colorIndex){
                                                case 0:
                                                    lnk = xmlRowArr[event.point.index]['lnk_havetep'];
                                                    break;
                                                case 1:
                                                    lnk = xmlRowArr[event.point.index]['lnk_nottep'];
                                                    break;
                                            }
                                             if (drillDownLinks[chartName] && event.point.colorIndex!= undefined && event.point.index!= undefined && lnk != ''){
                                                window.open(lnk, '_blank');
                                            }
                                        }
                                    };
                                    highchartData.yAxis['max'] = '100';
                                    for (var i=0;i<drillDownLinks[chartName].length;i++){
                                        if (drillDownLinks[chartName][i]['rate_havetep']!='0' || drillDownLinks[chartName][i]['rate_nottep']!='0'){
                                            allZeroData = false;
                                        }
                                    }
                                    break;
                            }
                        });

                        console.log(chartName);
                        console.log(highchartData);
                        if (!$(elm).attr('id')) $(elm).attr('id', 'chart_'+indx);

                        if (!allZeroData){
                            highChartsArr['chart_'+indx] = new Highcharts.chart('chart_'+indx, highchartData);
                            var thisChartHeight = $('#chart_'+indx).parents('.chart').height()-30;
                            var thisChartWidth = $('#chart_'+indx).width();
                            /*highChartsArr['chart_'+indx].setSize(thisChartWidth, thisChartHeight);*/
                        } else {
                            $(elm).html($('.emptyRange').eq(0).clone().show());
                        }


                    } else {
                        if ($highchartData.hasClass('show')){
                            $(elm).html($($data[2]));
                            $('.bigNumber').each(function(indx, elm){
                                $(elm).text(format_number($(elm).text()));
                            });
                            if ( chartName=='CARD$CHART$OBJ_FNO' && xmlRowArr.length > 1){
                                drillDownLinks[chartName] = xmlRowArr;
                                for (var i=0; i<xmlRowArr.length; i++){
                                    var $target = $('[data-code="'+xmlRowArr[i]['code']+'"]');
                                    var $anchor = $('<a />');
                                    $anchor.attr('href', xmlRowArr[i]['lnk']);
                                    $anchor.attr('title', $target.find('.text').text());
                                    $anchor.attr('target', '_blank');
                                    $anchor.html($target.html());
                                    $target.html($anchor);
                                }
                            }
                        }
                    }
                });
            }
        });
}
function format_number(number){
    number += '';
    if (number.length > 3) {
    number = number.replace(/\B(?=(?:\d{3})+(?!\d))/g, '\u00A0');

  }
  return number;
}
 function makeTwoRanges(obj1, obj2){
    var extensionRangeOne = obj1.datepicker('widget').data('datepickerExtensionRange');
    var extensionRangeTwo = obj2.datepicker('widget').data('datepickerExtensionRange');

    var date1 = obj1.datepicker('getDate');
    var date2 = obj2.datepicker('getDate');

    /*var date1 = extensionRangeOne.startDate;
    var date2 = extensionRangeTwo.endDate;*/


    var outDate1 = '';
    var outDate2 = '';
    if (date1<date2){
        extensionRangeOne.startDate = date1;
        extensionRangeTwo.startDate = date1;
        extensionRangeOne.endDate = date2;
        extensionRangeTwo.endDate = date2;
        outDate1 = $.datepicker.formatDate("dd.mm.yy", date1);
        outDate2 = $.datepicker.formatDate("dd.mm.yy", date2);

    }else{
        extensionRangeOne.startDate = date2;
        extensionRangeTwo.startDate = date2;
        extensionRangeOne.endDate = date1;
        extensionRangeTwo.endDate = date1;

        outDate1 = $.datepicker.formatDate("dd.mm.yy", date2);
        outDate2 = $.datepicker.formatDate("dd.mm.yy", date1);
    }
    /*obj1.datepicker('setDate', [outDate1, outDate2]);
    obj2.datepicker('setDate', [outDate1, outDate2]);*/

    obj1.datepicker('refresh');
    obj2.datepicker('refresh');
    hInput.begin.val(outDate1);
    hInput.end.val(outDate2);

    $('.date_view').text(outDate1+' - '+outDate2);
    $('.date_view').text(dateRangeRender(extensionRangeOne.startDate, extensionRangeOne.endDate));
 }
function dateRangeRender(startDate, endDate){
    var outDateOneRender = $.datepicker.formatDate("dd", startDate)+' '+monthsRu[$.datepicker.formatDate("mm", startDate)]+' '+$.datepicker.formatDate("yy", startDate);
    var outDateTwoRender = $.datepicker.formatDate("dd", endDate)+' '+monthsRu[$.datepicker.formatDate("mm", endDate)]+' '+$.datepicker.formatDate("yy", endDate);
    return outDateOneRender+' — '+outDateTwoRender;
}
var extensionRangeOneGlobal, extensionRangeTwoGlobal;
var picker = {
    one: $('.pikers_one'),
    two: $('.pikers_two')
};
var hInput = {
    begin: $('[name=DDATE_BEGIN]'),
    end: $('[name=DDATE_END]')
};
var dateRangeState = {
    begin: undefined,
    end: undefined
};
function savePrevDateRange(){
    dateRangeState.begin = extensionRangeOneGlobal.startDate;
    dateRangeState.end = extensionRangeOneGlobal.endDate;
}
function restorePrevDateRange(){
    picker.one.datepicker('setDate', $.datepicker.formatDate("dd.mm.yy", dateRangeState.begin));
    picker.two.datepicker('setDate', $.datepicker.formatDate("dd.mm.yy",dateRangeState.end));
    extensionRangeOneGlobal.startDate = dateRangeState.begin;
    extensionRangeTwoGlobal.startDate = dateRangeState.begin;
    extensionRangeOneGlobal.endDate = dateRangeState.end;
    extensionRangeTwoGlobal.endDate = dateRangeState.end;
    picker.one.datepicker('refresh');
    picker.two.datepicker('refresh');
    hInput.begin.val($.datepicker.formatDate("dd.mm.yy", dateRangeState.begin));
    hInput.end.val($.datepicker.formatDate("dd.mm.yy", dateRangeState.end));
    $('.date_view').text(dateRangeRender(dateRangeState.begin, dateRangeState.end));
    $('select').selectik();
}
    $(function(){
        $('.currentDate').text(dateRender());
        $('.search .tabName').remove();

        Highcharts.setOptions({
            lang: {
                resetZoom: 'Сбросить увеличение'
            }
        });

        var datePickerFormatOne = datePickerFormat;
        var datePickerFormatTwo = datePickerFormat;

        datePickerFormatOne.onSelect = function(dateText, inst){
            makeTwoRanges(picker.one, picker.two);
            setTimeout(function(){$('select').selectik();}, 10);
        };
        datePickerFormatTwo.onSelect = function(dateText, inst){
            makeTwoRanges(picker.one, picker.two);
            setTimeout(function(){$('select').selectik();}, 10);
        };
        picker.one.datepicker(datePickerFormatOne);
        picker.two.datepicker(datePickerFormatTwo);

        extensionRangeOneGlobal = picker.one.datepicker('widget').data('datepickerExtensionRange');
        extensionRangeTwoGlobal = picker.two.datepicker('widget').data('datepickerExtensionRange');

        if (!hInput.begin.val()){
            hInput.begin.val($.datepicker.formatDate("dd.mm.yy", startThisYear));
        }
        if (!hInput.end.val()){
            hInput.end.val(dateRender())
        }
        picker.one.datepicker('setDate', [$('[name="DDATE_BEGIN"]').val(), $('[name="DDATE_END"]').val()]);
        picker.two.datepicker('setDate', [$('[name="DDATE_BEGIN"]').val(), $('[name="DDATE_END"]').val()]);
        $('.date_view').text(dateRangeRender(extensionRangeOneGlobal.startDate, extensionRangeOneGlobal.endDate));
        /* Hack for initial bug with second picker */
        picker.one.datepicker('setDate', extensionRangeOneGlobal.startDateText);
        extensionRangeOneGlobal.endDate = $.datepicker.parseDate( "dd.mm.yy", hInput.end.val());
        picker.one.datepicker('refresh');
        /* endOf Hack */

        /*makeTwoRanges(picker.one, picker.two);*/
        $('select').selectik();
        /*
        var monthRange = nowDate.getMonth();
        for (var i=0; i<monthRange; i++){
            $('.pikers_one .ui-datepicker-prev').click();
        }*/

        savePrevDateRange();
        $('.bigBigButton').click(function(event){
            getCharts();
            savePrevDateRange();
            $('.minimal2calendars').hide();
            event.stopPropagation();
        });

        $(document).click(function(){
            /*if ($('.minimal2calendars:visible').length) getCharts();*/
            $('.minimal2calendars').hide();
            restorePrevDateRange();
        });

        $('.calendar, .date_view, .minimal2calendars').click(function(event){
            savePrevDateRange();
            $('.minimal2calendars').show();
            event.stopPropagation();
        });


        /*$('.calendar input.dp').datepicker({
            range: 'period', // режим - выбор периода
            numberOfMonths: 2,
            changeMonth: true,
            changeYear: true,
            onSelect: function(dateText, inst, extensionRange) {
                // extensionRange - объект расширения
              hInput.begin.val(extensionRange.startDateText);
              hInput.end.val(extensionRange.endDateText);
              $('.date_view').text(extensionRange.startDateText+' - '+extensionRange.endDateText);
              if (extensionRange.endDateText != extensionRange.startDateText) {getCharts()}
            }
          });
        $('.calendar input.dp').datepicker('setDate', [$('[name="DDATE_BEGIN"]').val(), $('[name="DDATE_END"]').val()]);
        var extensionRange = $('.calendar input.dp').datepicker('widget').data('datepickerExtensionRange');
        if(extensionRange.startDateText) hInput.begin.val(extensionRange.startDateText);
        if(extensionRange.endDateText) hInput.end.val(extensionRange.endDateText);
        $('.date_view').text(extensionRange.startDateText+' — '+extensionRange.endDateText);*/
        getCharts();
    });

]]>
</script>
    </xsl:template>

</xsl:stylesheet>

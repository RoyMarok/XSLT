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
        margin-bottom: 1.875rem;
        text-align: center;
    }
    .dashboard h2{
        font-size: 1.1875rem;
        margin-bottom: 25px;
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
    }
     .docElm.objFno .text{
        display: block;
        font-size: 12px;
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
        margin-top: 10px;
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
        width: 320px;
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
    .pickerwrap td a{
        transition: all .3s;
    }
    .pickerwrap .ui-datepicker-today a{
        color: #555;
        border: 1px solid #1783FF !important;

    }
    .pickerwrap .ui-datepicker-today.selected a{
        color: #fff;
        border: 1px solid #fff !important;
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
    .pickerwrap .ui-widget-header .ui-state-hover{
        border: none;
    }
    .pickerwrap .ui-datepicker-title select{
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
            <div class="chart" style="height: 311px">
                <h3>Динамика формирования объектов по месяцам</h3>
                <div class="ajaxNeed" data-xslt="CARD$CHART$DYN_OBJ_MONTH"></div>
            </div>
            <div class="chart" style="height: 311px">
                <h3>Динамика формирования объектов по статусам</h3>
                <div class="ajaxNeed" data-xslt="CARD$CHART$DYN_OBJ_STAT"></div>
            </div>

            <div class="chart wide" style="height: 413px">
                <h3>Оценка обеспеченности созданных объектов документами</h3>
                <div class="ajaxNeed" data-xslt="CARD$CHART$ASSESS"></div>
            </div>

            <div class="chart wide" style="height: 410px">
                <h3>Динамика формирования объектов по ФНО</h3>
                <div class="ajaxNeed" data-xslt="CARD$CHART$OBJ_FNO"></div>
            </div>
        </div>
        <div class="dashDocuments dashSection">
            <h2>Документы</h2>

            <div class="chart doc" style="height: 280px">
                <h3>Показатели документов</h3>
                <div class="ajaxNeed" data-xslt="CARD$CHART$DOC_STAT"></div>
            </div>

            <div class="chart doc" style="height: 311px">
                <h3>Статистика привязки по видам документов</h3>
                <div class="ajaxNeed" data-xslt="CARD$CHART$DOC_TYPE"></div>
            </div>

            <div class="chart doc" style="height: 376px">
                <h3>Оценка качества внесенных по ГПЗУ сведений</h3>
                <div class="ajaxNeed" data-xslt="CARD$CHART$GPZU_QUAL"></div>
            </div>
        </div>

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
        <xml style="display: none">
          <xsl:copy-of select="$DATA"/>
        </xml>
<script src="/portal_static/js/highcharts_5.js"></script>
<script src="js/jquery/jquery-1.11.0.min.js"></script>
<script src="js/jquery/jquery-ui-1.10.4.custom.min.js"></script>
<script src="/static/JQueryPlugins/ui.datepicker-ru.js"></script>
<script src="/portal_static/js/jquery.datepicker.extension.range.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.customselect/0.5.1/jquery.customSelect.min.js"></script>
<script src="/static/JQueryPlugins/jquery.mousewheel.js"></script>
<script src="https://ugd-tech.mos.ru/static/JQueryPlugins/jquery.selectik.min.js"></script>
<script>
<![CDATA[
var charts = {};
var nowDate = new Date();
var startThisYear = new Date(nowDate.getFullYear(), 0, 1);
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
        buttonImage:     "/portal_static/img/searchForm/calIco.png",
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
                    var $data = $(data);
                    var $highchart_data = $($data[2]);
                    if ($highchart_data.hasClass('highchart_data')){
                        console.log($highchart_data);
                        var highchart_data = {
                            title: {text: ' '},
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
                                bar: {colorByPoint: true},
                                column: {colorByPoint: true},
                            }
                        };
                        highchart_data.xAxis.categories = $highchart_data.find('.categories').text().split(',');
                        highchart_data.series = [];
                        /*console.log($highchart_data.find('.series .element').length);*/
                        $highchart_data.find('.series .element').each(function(indx2, elm2){
                            /*console.log($(elm2));*/
                            var seriesObj = {
                                name: $(elm2).attr('data-name'),
                                type: $(elm2).attr('data-chart-type'),
                            };
                            var dataArr = $(elm2).text().split(',');
                            var dataArrProcessed=[];

                            if ($(elm2).attr('data-chart-type') != 'pie'){
                                for (key in dataArr){
                                    dataArrProcessed[key] = +dataArr[key];
                                }
                            } else {
                                for (key in dataArr){
                                    dataArrProcessed[key] = {
                                        y: +dataArr[key]
                                    };
                                }
                                seriesObj.size = 100;
                                seriesObj.showInLegend = false;
                                seriesObj.dataLabels = {
                                    enabled: false
                                };
                                seriesObj.center = [100, 80];
                            }
                            seriesObj.data = dataArrProcessed;
                            highchart_data.series.push(seriesObj);
                            if ($(elm2).attr('data-chart-type') == 'line'){
                            highchart_data.plotOptions = {
                                series: {
                                    marker: {
                                        enabled: false
                                    },
                                    color: '#FDCD37'
                                    }
                                }
                            }
                        });
                        console.log(highchart_data);
                        if (!$(elm).attr('id')) $(elm).attr('id', 'chart_'+indx);
                        highChartsArr['chart_'+indx] = new Highcharts.chart('chart_'+indx, highchart_data);
                        var thisChartHeight = $('#chart_'+indx).parents('.chart').height()-30;
                        var thisChartWidth = $('#chart_'+indx).width();
                        highChartsArr['chart_'+indx].setSize(thisChartWidth, thisChartHeight);
                    } else {
                        if ($highchart_data.hasClass('show')){
                            $(elm).html($($data[2]));
                        }
                    }
                });
            }
        });
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
    obj1.datepicker('refresh');
    obj2.datepicker('refresh');
    $('[name=DDATE_BEGIN]').val(outDate1);
    $('[name=DDATE_END]').val(outDate2);
    $('.date_view').text(outDate1+' - '+outDate2);
 }



    $(function(){
        var cur = -1, prv = -1;
        $('.currentDate').text(dateRender());


        var datePickerFormatOne = datePickerFormat;
        var datePickerFormatTwo = datePickerFormat;

        datePickerFormatOne.onSelect = function(dateText, inst){
            makeTwoRanges($('.pikers_one'), $('.pikers_two'));
            setTimeout(function(){$('select').selectik();}, 10);
        };
        datePickerFormatTwo.onSelect = function(dateText, inst){
            makeTwoRanges($('.pikers_one'), $('.pikers_two'));
            setTimeout(function(){$('select').selectik();}, 10);
        };
        $('.pikers_one').datepicker(datePickerFormatOne);
        $('.pikers_two').datepicker(datePickerFormatTwo);

        var extensionRangeOne = $('.pikers_one').datepicker('widget').data('datepickerExtensionRange');
        var extensionRangeTwo = $('.pikers_two').datepicker('widget').data('datepickerExtensionRange');

        if (!$('[name=DDATE_BEGIN]').val()){
            $('[name=DDATE_BEGIN]').val($.datepicker.formatDate("dd.mm.yy", startThisYear));
        }
        if (!$('[name=DDATE_END]').val()){
            $('[name=DDATE_END]').val(dateRender())
        }
        $('.pikers_one').datepicker('setDate', [$('[name="DDATE_BEGIN"]').val(), $('[name="DDATE_END"]').val()]);
        $('.pikers_two').datepicker('setDate', [$('[name="DDATE_BEGIN"]').val(), $('[name="DDATE_END"]').val()]);
        $('.date_view').text(extensionRangeOne.startDateText+' — '+extensionRangeOne.endDateText);
        /*makeTwoRanges($('.pikers_one'), $('.pikers_two'));*/
        $('select').selectik();


        $('.bigBigButton').click(function(){
            getCharts();
            $('.minimal2calendars').hide();
        });

        $(document).click(function(){
            if ($('.minimal2calendars:visible').length) getCharts();
            $('.minimal2calendars').hide();
        });

        $('.calendar, .date_view, .minimal2calendars').click(function(event){
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
              $('[name=DDATE_BEGIN]').val(extensionRange.startDateText);
              $('[name=DDATE_END]').val(extensionRange.endDateText);
              $('.date_view').text(extensionRange.startDateText+' - '+extensionRange.endDateText);
              if (extensionRange.endDateText != extensionRange.startDateText) {getCharts()}
            }
          });
        $('.calendar input.dp').datepicker('setDate', [$('[name="DDATE_BEGIN"]').val(), $('[name="DDATE_END"]').val()]);
        var extensionRange = $('.calendar input.dp').datepicker('widget').data('datepickerExtensionRange');
        if(extensionRange.startDateText) $('[name=DDATE_BEGIN]').val(extensionRange.startDateText);
        if(extensionRange.endDateText) $('[name=DDATE_END]').val(extensionRange.endDateText);
        $('.date_view').text(extensionRange.startDateText+' — '+extensionRange.endDateText);*/
        getCharts();
    });

]]>
</script>
    </xsl:template>

</xsl:stylesheet>
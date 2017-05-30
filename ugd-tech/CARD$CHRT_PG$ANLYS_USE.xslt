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
    .centerText{
        text-align: center;
    }
    .notifier{
        position: relative;
        padding: 10px;
        padding-left: 50px;
        background-color: #FEF7E5;
        border: 1px solid #EABC64;
        transition: all .3s;
        color: #996633;
        cursor: pointer;
        margin: 20px 0;
        border-radius: 5px;
    }
    .notifier:before{
        content: '';
        position: absolute;
        background-color: #FF9E28;
        border-radius: 50%;
        width: 20px;
        height: 20px;
        transition: all .3s;
        left: 16px;
        top: 9px;
    }

    .notifier:after{
        content: '';
        position: absolute;
        background-image: url(data:image/svg+xml;base64,PHN2ZyBmaWxsPSIjRkZGRkZGIiB4bWxuczpkYz0iaHR0cDovL3B1cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iIHhtbG5zOmNjPSJodHRwOi8vY3JlYXRpdmVjb21tb25zLm9yZy9ucyMiIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyIgeG1sbnM6c3ZnPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczpzb2RpcG9kaT0iaHR0cDovL3NvZGlwb2RpLnNvdXJjZWZvcmdlLm5ldC9EVEQvc29kaXBvZGktMC5kdGQiIHhtbG5zOmlua3NjYXBlPSJodHRwOi8vd3d3Lmlua3NjYXBlLm9yZy9uYW1lc3BhY2VzL2lua3NjYXBlIiB2ZXJzaW9uPSIxLjEiIHg9IjBweCIgeT0iMHB4IiB2aWV3Qm94PSIwIDAgMTAwIDEwMCI+PGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMCwtOTUyLjM2MjE4KSI+PHBhdGggc3R5bGU9ImNvbG9yOiMwMDAwMDA7ZW5hYmxlLWJhY2tncm91bmQ6YWNjdW11bGF0ZTsiIGQ9Im0gNTkuMDA0OTkzLDk1Ny4zNTcxNSBjIC00LjQxODMsMCAtOCwzLjU4MTcgLTgsOCAwLDQuNDE4MyAzLjU4MTcsOCA4LDggNC40MTgzLDAgOCwtMy41ODE3IDgsLTggMCwtNC40MTgzIC0zLjU4MTcsLTggLTgsLTggeiBtIC04LjM3NSwyMC4wMzEyIGMgLTQuOTE1OSwwLjIyMjIgLTEwLjE0MzMsMi42NDMyIC0xNC41MzEyLDYuMDMxMyBsIC0wLjUsNS4xNTYyIGMgNC4xNDU3LC0xLjYzNDEgOC40MTM0LC0xLjY0MDMgOS42ODc0LDIuMjUgMy4xMDE0LDkuNDYzMzUgLTcuNTM1NCwyNi4wNDI3NSAtMTAuNDM3NCwzNC43MTg4NSAtNy44NzMyLDIzLjUzODIgMTEuMDQ5NSwyNi4yNjM5IDI0LjUzMTIsMTYuNTYyNSBsIDAuNSwtNS41OTM3IGMgLTcuMzM1MiwyLjMxMTkgLTEyLjU1MjUsLTAuNTE1NSAtOC4zMTI1LC0xMi44MTI2IDIuMDQyOCwtNS45MzE1IDE5LjEyMTcsLTM1LjgzMjE1IDcuMzEyNSwtNDQuMDYyNTUgLTIuNDcyNiwtMS43MjM2IC01LjMwMDUsLTIuMzgzMiAtOC4yNSwtMi4yNSB6IiBmaWxsPSIjRkZGRkZGIiBzdHJva2U9Im5vbmUiIG1hcmtlcj0ibm9uZSIgdmlzaWJpbGl0eT0idmlzaWJsZSIgZGlzcGxheT0iaW5saW5lIiBvdmVyZmxvdz0idmlzaWJsZSIvPjwvZz48L3N2Zz4=);
        background-size: 13px;
        background-repeat: no-repeat;
        width: 20px;
        height: 20px;
        left: 20px;
        top: 12px;
    }
    .notifier:hover{
        border-color: #0072ff;
        color: #0072ff;
        background-color: white;
        transition: all .3s;
    }
    .notifier:hover:before{
        background-color: #0072ff;
    }

    .dashboard{
        padding: 0 50px;
        color: #58666E;
    }

    .dashSection{
        /*display: inline-block;
        max-width: 1085px;
        vertical-align: top;*/
        display: flex;
        vertical-align: top;
        flex-wrap: wrap;
        position: relative;
        margin-bottom: 20px;
    }
    .wrapper+.dashSection{
        /*margin-top: 75px;*/
    }
    .dashboard h1{
        font-size: 1.375rem;
        margin-bottom: 4rem;
        text-align: center;
        margin-bottom: 0;
    }
    .dashboard h2{
        font-size: 1.1875rem;
        margin-bottom: 25px;
        font-weight: 400;
    }
    .chart{
        border-radius: 5px;
        padding: 10px 20px;
        padding: 20px;
        border: 1px solid #e7e8ec;
        background-color: white;
        margin-right: 16px;
        margin-bottom: 20px;
        display: inline-block;
        width: 30%;
        width: 48%;
        vertical-align: top;
        flex-grow: 1;
    }
    .chart:hover{
        -moz-box-shadow: 0px 5px 16px rgba(0, 51, 102, 0.25);
        -webkit-box-shadow: 0px 5px 16px rgba(0, 51, 102, 0.25);
        box-shadow: 0px 5px 16px rgba(0, 51, 102, 0.25);
    }
    .chart .list{
        margin-left: -20px;
        margin-right: -20px;
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
        font-size: 1rem;
        font-weight: normal;
        position: relative;
    }
    .chart h3.topLine{
        margin-top: 15px;
    }
    .chart h3.topLine:before{
        content: '';
        width: 100%;
        height: 1px;
        border-top: 1px solid #EEF2F4;
        position: absolute;
        /*margin-left: 10%;*/
        margin-top: -15px;
    }
    .ajaxNeed{
        text-align: center;
    }
    .ajaxNeed .show{
        text-align: left;
    }
    .wrapper {
       /*height: 600px;*/
       position: relative;
       margin: 20px 0;
       margin: 35px 0;
    }
    .rangeSelector{
        display: inline-block;
        font-size: 0.875rem;
        margin-left: 5px;
    }
    .rangeSelector>div{
        padding: 10px;
        border: 1px solid #D9DBDD;
        position: relative;
        z-index: 1;
        cursor: pointer;
        /*margin: -3px;*/
        margin-left: -5px;
        background-color: white;
        display: inline-block;
        padding: 8px 15px;
        padding-top: 6px;
        transition: all .1s;
    }
    .rangeSelector>div:first-child{
        border-top-left-radius: 5px;
        border-bottom-left-radius: 5px;
    }
    .rangeSelector>div:last-child{
        border-top-right-radius: 5px;
        border-bottom-right-radius: 5px;
    }

    .rangeSelector>div.active{
        color: white;
        background-color: #319ADC;
        border-color: #2074BA;
        transition: all .1s;
        z-index: 10;
    }
    .rangeSelector>div:not(.active):hover{
        border-color: #999999;
        z-index: 10;
        transition: all .1s;
    }
    .rangeSelector>div.active:hover{
        background-color: #2074BA;
    }
    .rangeSelector+.calendar{
        /*display: inline-block;*/
        margin-left: 15px;
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
        width: 320px;
        width: 40%;
        width: 44%;
        vertical-align: top;
        margin-bottom: 40px;
        padding-left: 10%;
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
    .docElm.objFno a{
        text-decoration: none;
    }
    .docElm .img{
        border-radius: 50%;
        width: 56px;
        display: inline-block;
        height: 56px;
        background-color: rebeccapurple;
        background-color: #EEF2F4;
        margin-right: 15px;
        vertical-align: top;
        transition: all .3s;
    }
    .docElm .img img{
        display: block;
        margin: 0 auto;
        margin-top: 8px;
        margin-top: 10px;
        margin-left: 12px;
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
        position: relative;
        display: inline-block;
        width: 390px;
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
        padding: 8px 25px;
        padding-top: 6px;
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
        margin-top: 3px;
        -webkit-margin-before: 4px;
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
        /*padding-top: 80px;*/
        position: relative;
        display: inline-block;
        line-height: 1em;
    }
    .search .tabname{
        display: none;
    }
    .ft-cc-group, .ft-cc-group {
        /*margin-bottom: 33px;*/
        font-size: 14px;
        box-sizing: border-box;
        /*display: flex;*/
        /*flex-direction: column;*/
        flex-wrap: wrap;
        width: 100%;
        overflow: hidden;
        padding: 0;

      }
     .ft-cc-group *, .ft-cc-group * {
            box-sizing: border-box;
            -moz-box-sizing: border-box;
            -webkit-box-sizing: border-box;
        }
      .ft-cc-group:last-child, .ft-cc-group:last-child {
        margin-bottom: 0;
      }
      .ft-cc-group li, .ft-cc-group li {
        min-height: 46px;
        display: block;
        margin-bottom: 5px;
        position: relative;
        /*width: 350px;
        width: 50%;*/
      }
      .ft-cc-group li:last-child,
      .ft-cc-group li:last-child
       {
        margin-bottom: 0;
      }
      .ft-cc-group-inner,
      .ft-cc-group-inner
       {
        display: table;
        border-left: 3px solid transparent;
        padding: 0;
        position: absolute;
        cursor: pointer;
        position: relative;
        width: 101%;
      }
      .ft-cc-group-inner.selected,
      .selected .ft-cc-group-inner{
        background: #F5F7FA;
        background: #319adc;
        color: white;


      }
      .ft-cc-group li.selected:hover .ft-cc-group-inner{
        background: #0072ff;
      }
      .ft-cc-group li:hover .ft-cc-group-inner,
      .ft-cc-group li:hover .ft-cc-group-inner
       {
        background: #fff;
        background: #F5F7FA;
        /*width: 400px;*/
        z-index: 10;
        position: relative;

        /*-webkit-box-shadow: 0px 0px 17px 0px rgba(0,0,0,0.42);
        -moz-box-shadow: 0px 0px 17px 0px rgba(0,0,0,0.42);
        box-shadow: 0px 0px 17px 0px rgba(0,0,0,0.42);*/
      }
      .ft-cc-group li:hover .ft-cc-extended-info {
        display: block;
      }
      .ft-cc-group li:hover .ft-cc-photo span {
        border-color: #BCCAD3;
      }
      .ft-cc-author .ft-cc-group-inner {
        border-color: #7266ba;
      }
      .ft-cc-executor .ft-cc-group-inner {
        border-color: #23b7e5;
      }
      .ft-cc-external-executor .ft-cc-group-inner {
        border-color: #fad733;
      }
      .ft-cc-observer .ft-cc-group-inner {
        border-color: #27c24c;
      }
      .ft-cc-enters,
      .ft-cc-enters{
        text-align: right;
        display: table-cell;
        vertical-align: middle;
        font-weight: bold;
        min-width: 40px;
      }
      .ft-cc-enters{
        text-align: left;
      }

      .ft-cc-photo {
        display: table-cell;
        padding: 4px 0 4px 17px;
        vertical-align: middle;
      }
      .ft-cc-photo span {
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
      .ft-cc-info,
      .ft-cc-info {
        padding: 0 13px;
        /*padding: 0 20px;*/
        display: table-cell;
        vertical-align: middle;
        width: 100%;
      }
      .ft-cc-info &gt; span {
        display: block;
      }
      .ft-cc-info &gt; strong {
        font-weight: bold;
        font-size: 11px;
        color: #7d8fa4;
      }
      .ft-cc-info .ft-cc-info-org {
        font-size: 11px;
        color: #7d8fa4;
      }
      .ft-cc-extended-info {
        display: none;
        margin: 13px 0;
      }
      .ft-cc-extended-info table {
        margin-bottom: 26px;
      }
      .ft-cc-extended-info th {
        width: 116px;
        text-align: left;
        overflow: hidden;
        font-weight: normal;
        vertical-align: top;
        padding: 4px 0;
      }
      .ft-cc-extended-info th span {
        background-color: #fff;
        position: relative;
        z-index: 2;
        padding-right: 3px;
      }
      .ft-cc-extended-info th span:after {
        content: '........................................';
        display: block;
        white-space: nowrap;
        position: absolute;
        color: #000;
        opacity: .2;
        bottom: 0;
        z-index: -1;

      }
      .ft-cc-extended-info td {
        padding: 4px;
        vertical-align: top;
      }
      .ft-cc-extended-info strong {
        font-weight: bold;
      }
      .ft-cc-extended-info p {}

      .ft-button {
        display: inline-block;
        margin-right: 10px;
        border-radius: 3px;
        border: 1px solid transparent;
        /*min-width: 150px;*/
        padding: 7px 10px;
        background: transparent;
        font-size: 16px;
        position: relative;
        cursor: pointer;
        text-decoration: none;
        outline: none;
      }
      .ft-button:hover {
        background-color: #fff;
        border-color: #ccc;
      }
      .ft-button-primary {
        color: #fff;
        background-color: #319ADC;
      }
      .ft-button-primary:hover {
        background-color: #0072ff;
        border-color: transparent;
      }
      .ft-button:before {
        content: '';
        display: block;
        background-repeat: no-repeat;
        background-position: center center;
        height: 100%;
        position: absolute;
        left: 10px;
        top: 0;
        opacity: .7;
      }
      .ft-cc-group{
        counter-reset: org_list;
        font-size: 14px;
      }
      .ft-cc-group li .ft-cc-group-inner:before{
        counter-increment: org_list;
        content: counter(org_list) ". ";
        color: #99b1c6;
        position: absolute;
        margin-left: -10px;
      }
      .ft-cc-group li .ft-cc-group-inner{
        padding: 15px;
        padding-left: 25px;
        padding-right: 8px;
      }
      .ft-cc-enters{

        text-align: right;
        padding-right: 16px;
      }
      .ft-people li .ft-cc-group-inner{
        padding-top: 5px;
        padding-bottom: 5px;
      }
      .ft-people li .ft-cc-group-inner:before{
        margin-top: 5px;
      }
      .tabWrapper{
        margin-left: 20px;
        font-size: 11px;
        /*margin-bottom: 10px;*/
      }
      .tabDescr{
        display: inline-block;
        margin-right: 10px;
      }
      .tabSelector{
        margin-right: 7px;
        padding: 3px 9px;
        border-radius: 3px;
        font-weight: bold;
        display: inline-block;
        cursor: pointer;
        transition: all .3s;
      }
      .tabSelector.active,
      .tabSelector:hover
      {
        background-color: #F5F7FA;
        transition: all .3s;
      }
      .tabSelector.active:hover{
        color: white;
        background-color: #58666E;
      }
    .chart{
        width: 30%;
    }
@media screen and (max-width: 1602px){
    .docElm .text{
        font-size: .8vw;
    }
    .chart { width: 47%; }
}
@media screen and (max-width: 1157px){
    .docElm .text{
        font-size: 14px;
    }
    .chart { width: 100%; margin-right: 0; }
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
        <h1>Анализ использования ИАС УГД по состоянию на <span class="currentDate">13.02.2017</span></h1>
        <div class="wrapper"><div class="rangeSelector rangeSelector__dates"><div class="today">Сегодня</div><div class="yesterday">Вчера</div><div class="week">Неделя</div><div class="month">Месяц</div>
        <div class="quater">Квартал</div>
        <div class="year">Год</div></div><div class="calendar"><div class="date_view"><xsl:value-of select="//PARAMETER_MAP//DDATE_BEGIN"/> - <xsl:value-of select="//PARAMETER_MAP//DDATE_END"/></div><div class="minimal2calendars">
            <div class="pickerwrap">
                <div class="pikers_one"></div>
                <div class="pikers_two"></div>
            </div>
            <input type="button" value="Применить" class="bigBigButton"/>
        </div></div></div>
        <div class="dashSection">
            <div class="chart">
                <h3>Активность зарегистрированных пользователей</h3>
                <div class="ajaxNeed" data-xslt="CARD$CHRT_PG$ANLYS_USE$ACTIVITY" style="height: 400px; line-height: 400px;"></div>
            </div>
            <div class="chart" >
                <h3>Динамика посещаемости</h3>
                <div class="ajaxNeed" data-xslt="CARD$CHRT_PG$ANLYS_USE$DYN_ATTEND" style="height: 400px; line-height: 400px;"></div>
            </div>
            <div class="chart" >
                <h3>ТОП 10 сотрудников</h3>
                <div class="ajaxNeed list" data-xslt="CARD$CHRT_PG$ANLYS_USE$TOP_EMP"></div>
            </div>
            <div class="chart" >
                <h3>ТОП 10 организаций</h3>
                <div class="ajaxNeed list" data-xslt="CARD$CHRT_PG$ANLYS_USE$TOP_ORG"></div>
            </div>
        </div>
    </div>
    <div class="emptyRange empty1" style="display: none">
        <img src="/portal_static/img/icons/empty_dashboard.png" alt=""/>
        <p>В данном диапазоне данных нет, выберите другой</p>
    </div>
    <div class="emptyRange empty2" style="display: none">
        <img src="/portal_static/img/icons/empty_dashboard.png" alt=""/>
        <p>А в ответ - тишина. Тишина, тихо, тихо, тихо...</p>
    </div>
    {B{CARD$PRELOADER}E}
</xsl:variable>
{B{CARD$HTML_TEMPLATE}E}
{B{CARD$CHART$CALL2ACTION_TMPL}E}
<xsl:template match="/">

        <xsl:copy-of select="$STYLES"/>
        <xsl:copy-of select="$LAYOUT"/>
        <!--xsl:call-template name="call2actionDash"/-->
        <xml style="display: none">
          <xsl:copy-of select="$DATA"/>
        </xml>
<script src="/portal_static/js/highcharts_5.js" ></script>
<script src="/portal_static/js/highcharts-more.js" ></script>
<script src="https://code.highcharts.com/modules/treemap.js" ></script>
<!--script src="https://code.highcharts.com/modules/heatmap.js" ></script-->
<!--script src="/portal_static/js/highcharts-exporting.js" ></script-->
<script src="js/jquery/jquery-ui-1.10.4.custom.min.js" ></script>
<script src="/static/JQueryPlugins/ui.datepicker-ru.js" ></script>
<script src="/portal_static/js/jquery.datepicker.extension.range.min.js" ></script>
<script src="/static/JQueryPlugins/jquery.mousewheel.js" ></script>
<script src="/static/JQueryPlugins/jquery.selectik.min.js" ></script>
<script ><![CDATA[
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
    var dateArr = dateStr.split('.').reverse();
    return new Date(dateArr[0], dateArr[1]-1, dateArr[2]).getTime();
}
var drillDownLinks = {};
var allXmlData = {};
Highcharts.setOptions({
    lang: {
        months: [ "Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь" ],
        shortMonths: [ "Янв" , "Фев" , "Мар" , "Апр" , "Май" , "Июн" , "Июл" , "Авг" , "Сен" , "Окт" , "Ноя" , "Дек"],
        weekdays: ['Воскресенье', 'Понедельник', 'Вторник', 'Среда', 'Четверг', 'Пятница', 'Суббота']
    }
});
function getCharts(){
    $('.ajaxNeed').each(function(indx, elm){
            if ($(elm).attr('data-xslt')){
                $(elm).html($('.preloader').eq(0).clone().show());
                var sourceArr = [];
                $('.rangeSelector__sources .active').each(function(indx3, elm3){
                    sourceArr.push($(elm3).attr('data-source'));
                });
                console.log(sourceArr);
                var sendData = {
                        cardId: $(elm).attr('data-xslt'),
                        DDATE_BEGIN: $('[name="DDATE_BEGIN"]').val(),
                        DDATE_END: $('[name="DDATE_END"]').val(),
                        CC_APPEAL_SOURCE: sourceArr
                    };
                outArr = [];
                for(var key in sendData){
                    if (typeof sendData[key] != 'object'){
                        outArr.push(key+'='+sendData[key]);
                    }else{
                        outArr.push(key+'='+sendData[key].join('&'+key+'='));
                    }
                };
                sendData = outArr.join('&');
                $.ajax({
                    url: 'getCardHtml.action',
                    type: 'GET',
                    data: sendData
                }).success(function(data){
                    var marginTop = 30;
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
                        if (xmlRowArr){
                            for (var i=0; i<xmlRowArr.length;i++){
                                for (var key in xmlRowArr[i]){
                                    if (/(\d*,\d+)/g.test(xmlRowArr[i][key])){
                                        xmlRowArr[i][key] = parseFloat(xmlRowArr[i][key].replace(/,/g, '.'));
                                    }
                                }
                            }
                            allXmlData[chartName] = xmlRowArr;
                        } else {
                            allXmlData[chartName] = xmlObj['root'];
                        }
                    }


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
                                } else if (chartName=="CARD$CHRT_PG$ANLYS_USE$ACTIVITY"){
                                    seriesObj[0] = {
                                            name: (dataArrNames && dataArrNames[0])?dataArrNames[0]:'',
                                            data: []
                                        };
                                    seriesObj[1] = {
                                            name: (dataArrNames && dataArrNames[1])?dataArrNames[1]:'',
                                            data: []
                                        };
                                    highchartData.colors = [ '#82A2CD', '#597ba8' ];
                                    for (var i=0; i<xmlRowArr.length;i++){
                                        seriesObj[0]['data'].push({
                                            description: '',
                                            y: parseFloat(xmlRowArr[i]['cnt_noexit'])
                                        });
                                        seriesObj[1]['data'].push({
                                            description: '',

                                            y: parseFloat(xmlRowArr[i]['cnt_exit'])
                                        });
                                    }
                                    highchartData.plotOptions.bar['tooltip'] = {
                                              pointFormat: '{series.name} уникальных пользователей: <b>{point.y}</b> '};
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





                            }
                            else {
                                var seriesObj = {
                                    name: $(elm2).attr('data-name'),
                                    type: $(elm2).attr('data-chart-type'),
                                };
                                dataArr = $(elm2).text().split('|');
                                if (/(==)/ig.test($(elm2).text())){
                                    for (var i=0; i<dataArr.length; i++){
                                        dataArr[i] = dataArr[i].split('==');
                                    }
                                }
                                var dataArrProcessed=[];
                                var fillFlag = true;
                                if ($(elm2).attr('data-chart-type') != 'pie'){
                                    for (var key=0; key<dataArr.length; key++){
                                        if (typeof dataArr[key] == 'object'){
                                            dataArrProcessed[key] = dataArr[key];
                                        }else{
                                            if (/(\d*,\d+)/g.test(dataArr[key])){
                                                dataArrProcessed[key] = parseFloat(dataArr[key].replace(/,/g, '.'));
                                            }else{
                                                dataArrProcessed[key] = +dataArr[key];
                                            }


                                        }

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
                                case "CARD$CHRT_PG$ANLYS_USE$ACTIVITY":
                                    highchartData.plotOptions.series['marker'] = {enabled: true};
                                    highchartData.yAxis['endOnTick'] = false;
                                    highchartData.yAxis['min'] = '0';
                                    highchartData.yAxis['max'] = allXmlData[chartName][0]['cnt_all'];


                                    /*console.log(indx2);
                                    console.log(highchartData);*/
                                    /*allZeroData = true;*/
                                    break;
                                case "CARD$CHRT_PG$ANLYS_USE$DYN_ATTEND":
                                    var dataArrProcessed = [];
                                    for (var i=0; i<allXmlData[chartName].length;i++){
                                        dataArrProcessed.push([dateParseRu(allXmlData[chartName][i]['date_']), parseFloat(allXmlData[chartName][i]['cnt'])]);
                                    }
                                    if (!allXmlData[chartName].length && typeof allXmlData[chartName] == 'object' && parseFloat(allXmlData[chartName]['cnt'])>0){
                                        dataArrProcessed.push([dateParseRu(allXmlData[chartName]['date_']), parseFloat(allXmlData[chartName]['cnt'])]);
                                    } else if (!allXmlData[chartName].length) {
                                        allZeroData = true;
                                    }
                                    highchartData.xAxis = {type:'datetime'};
                                    highchartData.series = [{
                                            type: 'area',
                                            name: 'Количество пользователей',
                                            data: dataArrProcessed
                                        }];
                                    /*highchartData.yAxis['min'] = '0';*/
                                    highchartData.yAxis['type'] = 'logarithmic';
                                    highchartData.chart.zoomType= 'x';
                                    highchartData.plotOptions= {
                                        area: {
                                            fillColor: {
                                                linearGradient: {
                                                    x1: 0,
                                                    y1: 0,
                                                    x2: 0,
                                                    y2: 1
                                                },
                                                stops: [
                                                    [0, Highcharts.getOptions().colors[0]],
                                                    [1, Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0).get('rgba')]
                                                ]
                                            },
                                            marker: {
                                                radius: 2
                                            },
                                            lineWidth: 1,
                                            states: {
                                                hover: {
                                                    lineWidth: 1
                                                }
                                            },
                                            threshold: null
                                        }
                                    };
                                    break;
                                case "CARD$CHART$APPEAL_AVEREANGE_TIME":
                                    var currentMonthAver = (xmlRowArr.length)?xmlRowArr[0]['cur_aver']:xmlRowArr['cur_aver'];
                                    var currentMonthAverStr = '';
                                    if (currentMonthAver%10 == 1 && (currentMonthAver%100>20 || currentMonthAver%100<10)){
                                            currentMonthAverStr = 'день';
                                        }
                                        else if (currentMonthAver%10 >1 && currentMonthAver%10 <5 && (currentMonthAver%100>20 || currentMonthAver%100<10)){
                                            currentMonthAverStr = 'дня';
                                        }else{
                                            currentMonthAverStr = 'дней';
                                        }
                                    currentMonthAverStr = currentMonthAver+' '+currentMonthAverStr;
                                    console.log(currentMonthAverStr);
                                    var bigN = $('<div/>');
                                    bigN.addClass('bigNumber centerText');
                                    bigN.html(currentMonthAverStr);
                                    $(elm).siblings('.bigNumber').remove();
                                    if (!$(elm).siblings('.bigNumber').length) $(elm).siblings('.centerText').before(bigN);

                                    highchartData.yAxis['softMax'] = 30;
                                    highchartData.yAxis['min'] = 0;
                                    /*highchartData.plotOptions.series.marker.enabled = true;*/
                                    for (var i=0; i<highchartData.series[0].data.length; i++){
                                        var color = '#82A2CD';
                                        if (highchartData.series[0].data[i]>19){color = '#CCCC99';}
                                        if (highchartData.series[0].data[i]>29){color = '#CB6666';}
                                        highchartData.series[0].data[i] = {
                                            y:highchartData.series[0].data[i],
                                            color: color
                                        };
                                    }
                                    marginTop = 100;
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
                            var thisChartHeight = $('#chart_'+indx).parents('.chart').height()-marginTop;
                            var thisChartWidth = $('#chart_'+indx).width();
                            /*highChartsArr['chart_'+indx].setSize(thisChartWidth, thisChartHeight);*/
                        } else {
                            $(elm).html($('.empty1').eq(0).clone().show());
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
                        } else {
                            $(elm).html($('.empty2').eq(0).clone().show());
                        }
                    }
                });
            }
        });
}
function format_number(number){
    number += '';
    if (number.length > 3) {
    number = number.replace(/\B(?=(?:\d{3})+(?!\d))/g, ' ');

  }
  return number;
}
 function makeTwoRanges(obj1, obj2){
    var extensionRangeOne = obj1.datepicker('widget').data('datepickerExtensionRange');
    var extensionRangeTwo = obj2.datepicker('widget').data('datepickerExtensionRange');

    var date1 = obj1.datepicker('getDate');
    var date2 = obj2.datepicker('getDate');

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
function selectDateRange(dateRange){
    console.log(dateRange.begin);
    console.log(dateRange.end);
    picker.one.datepicker('setDate', $.datepicker.formatDate("dd.mm.yy", dateRange.begin));
    picker.two.datepicker('setDate', $.datepicker.formatDate("dd.mm.yy",dateRange.end));
    extensionRangeOneGlobal.startDate = dateRange.begin;
    extensionRangeTwoGlobal.startDate = dateRange.begin;
    extensionRangeOneGlobal.endDate = dateRange.end;
    extensionRangeTwoGlobal.endDate = dateRange.end;
    picker.one.datepicker('refresh');
    picker.two.datepicker('refresh');
    hInput.begin.val($.datepicker.formatDate("dd.mm.yy", dateRange.begin));
    hInput.end.val($.datepicker.formatDate("dd.mm.yy", dateRange.end));
    $('.date_view').text(dateRangeRender(dateRange.begin, dateRange.end));
    $('select').selectik();
    savePrevDateRange();
    getCharts();
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

        savePrevDateRange();
        $('.bigBigButton').click(function(event){
            getCharts();
            savePrevDateRange();
            $('.minimal2calendars').hide();
            $('.rangeSelector__dates>div').removeClass('active');
            event.stopPropagation();
        });

        $(document).click(function(){
            $('.minimal2calendars').hide();
            restorePrevDateRange();
        });

        $('.calendar, .date_view, .minimal2calendars').click(function(event){
            savePrevDateRange();
            $('.minimal2calendars').show();
            event.stopPropagation();
        });

        /*getCharts();*/
        $('.rangeSelector .today').click(function(){
            selectDateRange({begin: nowDate, end: nowDate})
        });
        $('.rangeSelector .yesterday').click(function(){
            selectDateRange({begin:new Date(nowDate.getFullYear(), nowDate.getMonth(), nowDate.getDate()-1), end: new Date(nowDate.getFullYear(), nowDate.getMonth(), nowDate.getDate()-1)})
        });
        $('.rangeSelector .week').click(function(){
            selectDateRange({begin:new Date(nowDate.getFullYear(), nowDate.getMonth(), nowDate.getDate()-7), end: nowDate})
        });
        $('.rangeSelector .month').click(function(){
            selectDateRange({begin:new Date(nowDate.getFullYear(), nowDate.getMonth(), 1), end: nowDate})
        });
        $('.rangeSelector .quater').click(function(){
            var month = 0;
            switch(Math.ceil((nowDate.getMonth()+1)/3)){
                case 1:
                    month=0;
                    break;
                case 2:
                    month=3;
                    break;
                case 3:
                    month=6;
                    break;
                case 4:
                    month=9;
                    break;
            }
            selectDateRange({begin:new Date(nowDate.getFullYear(), month, 1), end: nowDate});
        });
        $('.rangeSelector .year').click(function(){
            selectDateRange({begin:startThisYear, end: nowDate})
        });
        $('.rangeSelector__dates>div').click(function(event){
            $(this).siblings().removeClass('active');
            $(this).addClass('active');
            event.stopPropagation();
        });

        $('.rangeSelector .month').click();


    });

]]>
</script>
</xsl:template>

</xsl:stylesheet>

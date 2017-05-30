<style>
   /* checkbox animation */
@-webkit-keyframes checkbox-on {
    0% { box-shadow: 0 0 0 10px, 10px -10px 0 10px, 32px 0 0 20px, 0px 32px 0 20px, -5px 5px 0 10px, 15px 2px 0 11px; }
    50% { box-shadow: 0 0 0 10px, 10px -10px 0 10px, 32px 0 0 20px, 0px 32px 0 20px, -5px 5px 0 10px, 20px 2px 0 11px; }
    100% { box-shadow: 0 0 0 10px, 10px -10px 0 10px, 32px 0 0 20px, 0px 32px 0 20px, -5px 5px 0 10px, 20px -12px 0 11px; }
}
@keyframes checkbox-on {
    0% { box-shadow: 0 0 0 10px, 10px -10px 0 10px, 32px 0 0 20px, 0px 32px 0 20px, -5px 5px 0 10px, 15px 2px 0 11px; }
    50% { box-shadow: 0 0 0 10px, 10px -10px 0 10px, 32px 0 0 20px, 0px 32px 0 20px, -5px 5px 0 10px, 20px 2px 0 11px; }
    100% { box-shadow: 0 0 0 10px, 10px -10px 0 10px, 32px 0 0 20px, 0px 32px 0 20px, -5px 5px 0 10px, 20px -12px 0 11px; }
}
.checkbox, .checkbox-wrap{
    position: relative;
}
 .overTrop {
    width: 20px;
    height: 20px;
    border: 1px solid #D9DBDD;
    overflow: hidden;
    background-image: none;
    background-repeat: no-repeat;
    background-position: 3px -24px;
    background-attachment: scroll;
    position: absolute;
    left: 0;
    top: 0;
    z-index: 1;
    cursor: pointer;
    border-radius: 2px;
    border-color: #bcbcbc;
    background-color: transparent;

}
 .overTrop:before {
    position: absolute;
    content: '';
    -webkit-transform: rotate(45deg);
    -ms-transform: rotate(45deg);
    -o-transform: rotate(45deg);
    transform: rotate(45deg);
    display: block;
    margin-top: -3px;
    margin-left: 7px;
    width: 0;
    height: 0;
    -webkit-box-shadow: 0 0 0 0, 0 0 0 0, 0 0 0 0, 0 0 0 0, 0 0 0 0, 0 0 0 0, 0 0 0 0 inset;
    box-shadow: 0 0 0 0, 0 0 0 0, 0 0 0 0, 0 0 0 0, 0 0 0 0, 0 0 0 0, 0 0 0 0 inset;
    transition: all .3s;
    color: white;



}
.overTrop.checked,
input:checked+.overTrop
  {
    border: 1px solid #0086bd;

}
.overTrop.checked:before,
input:checked+.overTrop:before {
    color: #0086bd;

    -webkit-box-shadow: 0 0 0 10px, 10px -10px 0 10px, 32px 0 0 20px, 0px 32px 0 20px, -5px 5px 0 10px, 20px -12px 0 11px;
    box-shadow: 0 0 0 10px, 10px -10px 0 10px, 32px 0 0 20px, 0px 32px 0 20px, -5px 5px 0 10px, 20px -12px 0 11px;
    -webkit-animation: checkbox-on 0.3s forwards;
    -o-animation: checkbox-on 0.3s forwards;
    animation: checkbox-on 0.3s forwards;

}
 input[type=checkbox][disabled] + span.overTrop {
    border-color: #ccc;
    opacity: .8;
    cursor: default;
}
 input[type=checkbox][disabled] + span.overTrop:before {
    color: #ccc;
    opacity: .8;
}


input.masked[type="checkbox"] {
    position: relative;
    margin-top: 7px;
    z-index: 200;
    margin: 0;
    width: 20px;
    height: 20px;
    cursor: pointer;
    opacity: 0;
    -moz-opacity: 0;
    -khtml-opacity: 0;
    filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
    top: 4px;
}
.checkbox+label{
    margin-left: 10px;
}
</style>
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
      <style type="text/css">
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
    margin-left: -5px;
    background-color: white;
    display: inline-block;
    padding: 7px 15px;
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
.pickerwrap .ui-datepicker .ui-datepicker-title {
    color: #fff;
    margin-bottom: 20px;
    height: 22px;
}
#ui-datepicker-div{
    width: 600px;
    border-radius: 5px;
    border: none;
}
.ui-datepicker-calendar {
    line-height: initial;
}
#ui-datepicker-div .ui-datepicker-calendar td.selected a{
    background-color: #E8F3FB;
    border-color: #E8F3FB;
}
#ui-datepicker-div, #ui-datepicker-div .ui-datepicker-calendar td a{
    font-size: 1rem;
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
    padding: 7px 25px;
    background-color: #fff;
    border: 1px solid #d9dbdd;
    /*border-radius: 5px;*/
    line-height: 18px;
    z-index: 100;
    z-index: 4;
    width: 320px;
    background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA8AAAALAQMAAACaiUUfAAAABlBMVEUAAAB8j6SVLMuOAAAAAXRSTlMAQObYZgAAABZJREFUCNdj4HsHRUDw7h0YQdgPIAgAx3cN8yjqQUUAAAAASUVORK5CYII=');
    background-position: right;
    background-position: 293px;
    background-repeat: no-repeat;
    margin-top: 4px;
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
    width: auto;
    margin-left: -24px;
}
.pikers_one, .pikers_two{
    display: inline-block;
    vertical-align: top;

}
.pickerwrap{
    margin-bottom: 15px;
    font-size: .9em;
}
.pikers_one{
    padding-right: 17px;
    padding-left: 14px;
}
.pikers_two{
    padding-left: 20px;
    border-left: 1px solid #CDD6DF;
}
input:focus{
    outline: none;
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
    outline: none!important;
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
    padding: 0;
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
    background: none;
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
    padding: 0;
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
.ft-button {
    display: inline-block;
    margin-right: 10px;
    /*border-radius: 3px;*/
    border: 1px solid transparent;
    /*min-width: 150px;*/
    padding: 12px 50px;
    background: transparent;
    font-size: 16px;
    position: relative;
    cursor: pointer;
    text-decoration: none;
    outline: none;
    line-height: 16px;
}
.ft-button:hover {
    background-color: #fff;
    border-color: #ccc;
}
.ft-button-primary {
    color: #fff;
    background-color: #319ADC;
    margin: 20px;
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
.centered .inputWrap{
    text-align: center;
}
</style>
      <style>
body {
    margin: 0;
    font-family: 'PTSans', Arial, sans-serif;
    background-color: #fff;
}
.sf-wrapper {

}
.sf-container {
    width: 550px;
    /*height: 830px;*/
    border-radius: 3px;
    /*position: absolute;*/
    left: 0;
    right: 0;
    margin: 0 auto;
    /*border: 1px solid #cdd6df;*/
}

.sf-container form{
        margin: 0 42px;
}
.sf-header {
    height: 50px;
    background-color: #319adc;
    font-size: 22px;
    color: #fff;
    position: relative;
    padding-left: 42px;
    line-height: 50px;
}
.sf-header .search-icon {
    background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABYAAAAWCAYAAADEtGw7AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAWZJREFUeNqslbFKxEAURZOAKUS22n8w4IKFpRFtRPwH8QtSLGy/7BeoH7F2wXJ1Ky1kLU0h0cbaZitFBZWM98EdCHGymazz4JBhcufy8mbexPcMoZTq4BGDCAQgB7e+7796ywQM18EIvKu/IXOnoGfj5ZdMZcEYbIIMTMEMFMz+AIhmDvaR/YNtphn4BkPQNWi6YECNaDdsjEf83KGFNqH2oknYYf3uTZnWrBHtF1it0wSsnwimqNvccp+l/itgb5FxxPGsxQHS2miRccBx0cK4KK2vNc45jlsYa23uevOyps3TwjOez4GF6TH4ARObDHrgheZJg6lo3kC8bEtfgTtu1DY4ZEt/gjXwBHasjqi0qXQU61cNmZtIpuCRc9fgkt0YGjO2uDZvkN2HvjfwSMFuadk53h95/w1mWo2+C+NEmeOkWpa2xiEY1/wQEheZ9w3mqeci+Pn6d/YMtlwZh6x5qk1/BRgADEq2QqZIIPMAAAAASUVORK5CYII=');
    width: 22px;
    height: 22px;
    position: absolute;
    top: 14px;
    left: 10px;
}
.sf-header .sf-close-btn,
.filterWrapper .fancybox-close-small:after{
    content: '';
    border: none;
    background: none;
    color: #fff;
    font-size: 34px;
    cursor: pointer;
    padding: 0;
    margin: 0;
    position: absolute;
    right: 23px;
    top: 18px;
    line-height: 0px;
    width: 16px;
    height: 16px;
    background-image: url(data:image/svg+xml;base64,PHN2ZyBmaWxsPSIjRkZGRkZGIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCA5NiA5NiIgeD0iMHB4IiB5PSIwcHgiPjx0aXRsZT5jb2xsZWN0aW9uPC90aXRsZT48cmVjdCB4PSIxOS4xNyIgeT0iNDUuNSIgd2lkdGg9IjU4LjQ2IiBoZWlnaHQ9IjUuMDQiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC0xOS43OCA0OC4yOSkgcm90YXRlKC00NSkiLz48cmVjdCB4PSI0NS44OCIgeT0iMTguOCIgd2lkdGg9IjUuMDQiIGhlaWdodD0iNTguNDYiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC0xOS43OCA0OC4yOSkgcm90YXRlKC00NSkiLz48L3N2Zz4=);
    background-repeat: no-repeat;
    background-size: 32px;
    background-position: 50%;
    transition: all .3s;
    border-radius: 0;
}
.sf-header .sf-close-btn:hover,
.fancybox-close-small:hover:after
{
    transform: rotate(180deg);
    transition: all .3s;
    background-size: 40px;
}
.sf-container  .tokenWrapper, .sf-container ul.token-input-list{
    width: 100%;
}
[target="pageEditor"]{
    display: none;
}
.sf-container .line.full{
    width: 100%;
}
.sf-container .line .inputName{
    width: 100%;
    float: none;
    text-align: left;
}
.sf-container .line .inputWrap{
    margin-left: 0;
}
.sf-container .line.checkbox .inputWrap{
    margin-top: -25px;
}
.sf-container .line.checkbox .inputWrap label{
    font-size: 13px;
}
.checkbox-wrap{
    display: inline-block;
}
.checkbox-wrap:not(:last-child){
    margin-right: 30px;
}
.sf-container .line.full .tokenWrapper{
    width: 100%!important;
}


.grey-line {
    height: 1px;
    background: #dbdbdb;
    width: 548px;
    margin: 25px 0 25px -42px;
}

.filterWrapper{
    padding: 0;
}
div.token-input-dropdown{
    z-index: 99999;
}
</style>

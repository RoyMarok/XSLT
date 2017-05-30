<div>
    <link rel="stylesheet" href="/portal_static/css/ps/theme/ui.datepicker.css"/>
    <link rel="stylesheet" href="/autoform/css/spbren/custom-theme/jquery-ui.custom.css"/>
    <!--link rel="stylesheet" href="/static/typeForm/css/form.css" /-->
    <link rel="stylesheet" href="/portal_static/css/redesign/form.css"/>
    <link rel="stylesheet" href="/portal_static/css/form-customize.css"/>
<style type="text/css"> /* Стили для переключалки */
    .switcherWrap {
        width: 35px;
        height: 21px;
        border-radius: 21px;
        border: 0;
        position: relative;
        background: #777;
        cursor: pointer;
    }
    .switcherWrap .switcherGrip {
       position: absolute;
       top: 0;
       border-radius: 100%;
       border: 1px solid #777;
       width: 21px;
       height: 21px;
       background: #fff;
    }
    .switcherWrap[data-index="0"] .switcherGrip {
       left: 0;
    }
    .switcherWrap[data-index="1"] .switcherGrip {
       right: 0;
    }
    .switcherLabel {
        padding: 0 10px;
        cursor: default;
    }
    .fieldTrigger {
        line-height: 32px;
    }
    .fieldTrigger div {
        display: inline-block;
        vertical-align: middle;
    }
</style>
<style type="text/css">
/*Стили для какого-то селекта*/
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
html{
  font-family: 'PT Sans Regular', 'PT Sans', sans-serif;
  font-size: 100%;
  color: #333;
  background-color: #eef2f4;
}
#headerButtons, #tabs-container, div#secondMenu {
  display: none;
}
.dashboard{
	padding: 0 50px;
}
.dashSection{
    display: flex;
    vertical-align: top;
    flex-wrap: wrap;
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
.paddingBlock {
    padding: 20px 0;
    overflow: hidden;
}

.chart{
	border-radius: 5px;
	padding: 10px 20px;
	border: 1px solid #e7e8ec;
	background-color: white;
	margin-right: 16px;
	margin-bottom: 20px;
	display: inline-block;
	width: 48%;
	vertical-align: top;
  flex-grow: 1;
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


.calendar input {
   width: 320px;
}
.pickerwrap .ui-datepicker .ui-datepicker-title {
		color: #fff;
		margin-bottom: 20px;
		height: 22px;
	}
#ui-datepicker-div .ui-datepicker-calendar td.selected a{
  background-color: #E8F3FB;
  border-color: #E8F3FB;
}
#ui-datepicker-div, #ui-datepicker-div .ui-datepicker-calendar td a{
  font-size: 1rem;
}

.ajaxNeed {
    position: relative;
    height: 100%;
    min-height: 100px;
}
.preloader{
  height: 75px;
  width: 75px;
  overflow: visible;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
.calendar{
	font-size: 0.875rem;
}
.calendar input{
	border: 1px solid #d9dbdd;
	border-radius: 3px;
	line-height: 30px;
	height: 30px;
}
.calendar input.dp{
	opacity: 0;
	position: relative;
	z-index: 200;
}
.date_view{
  padding: 7px 25px;
  background-color: #fff;
  border: 1px solid #d9dbdd;
  border-radius: 3px;
  z-index: 100;
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
<style type="text/css">
.filterBar {
    padding-bottom: 20px;
    white-space: nowrap;
}
.filterBar .filterItem {
    display: inline-block;
    width: auto;
    vertical-align: top;
    padding: 0 20px 0 0;
}
.filterBar .filterItem .inputWrap {
    width: auto;
    margin: 0;
}
.filterBar .filterItem .gradWrapper {
    background: #fff;
    border: 1px solid #d9dbdd;
    border-radius: 3px;
    width: 100%;
}

.fieldTrigger label {
    display: none;
}

.chartCaption {
    font-size: 15px;
}

/*
@media screen and (max-width: 1000px) {
    .dashSection { display: block; }
    .chart { width: 100%; margin-right: 0; }
}*/

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
</div>

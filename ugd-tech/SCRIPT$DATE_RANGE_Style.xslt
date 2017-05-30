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

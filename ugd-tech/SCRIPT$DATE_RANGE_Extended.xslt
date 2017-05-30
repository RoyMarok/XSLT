<!--script src="js/jquery/jquery-ui-1.10.4.custom.min.js" ></script-->
<script src="/static/JQueryPlugins/ui.datepicker-ru.js" ></script>
<script src="/portal_static/js/jquery.datepicker.extension.range.min.js" ></script>
<script src="/static/JQueryPlugins/jquery.mousewheel.js" ></script>
<script src="/static/JQueryPlugins/jquery.selectik.min.js" ></script>
<script><![CDATA[
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
function dateRender(date){
    var date = (date)?date:new Date();
    var monthRender = (+date.getMonth()+1).toString();
    var dateRender = date.getDate().toString();
    var dateFinalRender = ((dateRender.length<2)?'0'+dateRender:dateRender)+'.'+((monthRender.length<2)?'0'+monthRender:monthRender)+'.'+date.getFullYear();
    console.log(dateRender, dateRender.length, '0'+dateRender);
    return dateFinalRender;
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
        hInput.begin.val(dateRender());
    }
    if (!hInput.end.val()){
        hInput.end.val(dateRender())
    }
    picker.one.datepicker('setDate', [hInput.begin.val(), hInput.end.val()]);
    picker.two.datepicker('setDate', [hInput.begin.val(), hInput.end.val()]);
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
});]]>
</script>

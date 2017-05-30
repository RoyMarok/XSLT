<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

    <xsl:output method="html" encoding="utf-8" indent="no"/>

    <xsl:template match="/">
<script src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.0.47/jquery.fancybox.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.0.47/jquery.fancybox.min.css" />
      <xml style="display: none">
      	<xsl:copy-of select="*"/>
      </xml>

      <xsl:variable name="PROG" select="//PROG_MAIN//ROW[1]" />
        <div class="pd-card">
          <div class="pd-header">
            <div class="pd-header__inner">
              <span class="pd-header-title">Программа действий</span>
              <h1><xsl:value-of select="$PROG/YEAR_DATE"/> год</h1>
              <h2><xsl:value-of select="$PROG/REG_DEPARTMENT"/></h2>
              <div class="pd-header-status" style="background-color:{$PROG/STATUS_COLOR}">
                <xsl:value-of select="$PROG/STATUS_NAME"/>
              </div>
            </div>
          </div>

          <div class="pd-tabs">
              <ul>
                <li><a data-clickable="1" href="/ugd/getCardHtml.action?cardId=CARD$PROG_MAIN_TODO&amp;documentId={$PROG/ID}">Мероприятия</a></li>
                <li><a data-clickable="1" href="/ugd/getCardHtml.action?cardId=CARD$PROG_MAIN_INDICATORS&amp;documentId={$PROG/ID}">Показатели</a></li>
                <li><a data-clickable="{normalize-space(//FT_DOC_HAVE_TASK//ROW)}" href="/ugd/getCardHtml.action?cardId=CARD$FUNCTIONAL_TASKS$DOC_PROGRESS_EXEC&amp;documentId={$PROG/ID}">Ход исполнения</a></li>
              </ul>
          </div>

          <div class="pd-body" id="pd-body">

          </div>
        </div>

        <div style="display: none;" id="modalFilter" class="filterWrapper">
            {B{FORM$PROG_MAIN$SEARCH_FILTER_NAKED}E}
        </div>
        <div style="display: none;" id="modalIndicatorFilter" class="filterWrapper">
            {B{FORM$PROG_MAIN_INDICATOR$SEARCH_FILTER_NAKED}E}
        </div>
        <div id="pd-modal" class="pd-modal-place"></div>

        {B{CARD$PROG_STYLES}E}

<style>
  .filterBlock {
    font-size: 14px;
    position: relative;
    height: 32px;

  }
  .filterBlock div{
    display: inline-block;
  }
  .filterButton{
    position: absolute;
    padding: 8px 20px;
    border-radius: 2px;
    border: 1px solid #d9dbdd;
    padding-right: 36px;
    cursor: pointer;
    transition: all .3s;
    display: inline-block;
    right: 0;
  }
  .filterButton:hover{
    border-color: #999999;
    background-color: white;

  }
  .filterButton:after{
    content: '';
    position: absolute;
    background-image: url('data:image/svg+xml;base64,PHN2ZyBmaWxsPSIjN2M4ZmE0IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB2ZXJzaW9uPSIxLjEiIHg9IjBweCIgeT0iMHB4IiB2aWV3Qm94PSIwIDAgMTAwIDEwMCIgZW5hYmxlLWJhY2tncm91bmQ9Im5ldyAwIDAgMTAwIDEwMCIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSI+PHJlY3QgeD0iNSIgeT0iNC45OTkiIGZpbGw9Im5vbmUiIHdpZHRoPSI5MCIgaGVpZ2h0PSI5MCIvPjxnPjxwYXRoIGQ9Ik05Mi43MDIsODEuNTYzTDcxLjIzNCw2MC4wOTZjOC45NjQtMTQuMTE4LDYuOTcyLTMyLjY2NC00Ljk1Mi00NC41OUM1OS41MDEsOC43MjUsNTAuNDgzLDQuOTksNDAuODk1LDQuOTkgICBjLTkuNTksMC0xOC42MDYsMy43MzQtMjUuMzg3LDEwLjUxNkM4LjcyNywyMi4yODgsNC45OTIsMzEuMzAzLDQuOTkyLDQwLjg5MmMwLDkuNTkxLDMuNzM0LDE4LjYwNywxMC41MTYsMjUuMzg4ICAgYzYuNzgsNi43OCwxNS43OTUsMTAuNTE2LDI1LjM4NSwxMC41MTZjNi44NTcsMCwxMy40NjgtMS45MTksMTkuMjA1LTUuNTZsMjEuNDY3LDIxLjQ2NmMxLjQ4NiwxLjQ4NywzLjQ2NSwyLjMwNyw1LjU2OCwyLjMwOGwwLDAgICBjMi4xMDUsMCw0LjA4NC0wLjgxOCw1LjU3LTIuMzA4YzEuNDg4LTEuNDg3LDIuMzA3LTMuNDY4LDIuMzA3LTUuNTdTOTQuMTg5LDgzLjA0OSw5Mi43MDIsODEuNTYzeiBNNTguNzQxLDU4LjczOCAgIGMtNC43NjEsNC43Ni0xMS4wOTksNy4zODItMTcuODQ3LDcuMzgyYy02Ljc0OSwwLTEzLjA4Ny0yLjYyMi0xNy44NDctNy4zODJjLTQuNzU5LTQuNzYtNy4zOC0xMS4wOTctNy4zOC0xNy44NDcgICBjMC02Ljc0OCwyLjYyMS0xMy4wODYsNy4zOC0xNy44NDZjNC43Ni00Ljc2LDExLjA5OC03LjM4MSwxNy44NDctNy4zODFjNi43NDgsMCwxMy4wODYsMi42MjEsMTcuODQ3LDcuMzgxICAgQzY4LjU4MSwzMi44ODcsNjguNTgxLDQ4Ljg5Nyw1OC43NDEsNTguNzM4eiIvPjwvZz48L3N2Zz4=');
    background-repeat: no-repeat;
    width: 15px;
    height: 15px;
    right: 8px;
    top: 8px;
  }
  .filterButton:hover:after{
    -webkit-animation: pulse .8s ease-in-out infinite ;
    animation: pulse .8s ease-in-out infinite ;
  }
  @-webkit-keyframes pulse {
      0%{transform: scale(1);}
      50%{transform: scale(1.1);}
  }
  @keyframes pulse {
      0%{transform: scale(1);}
      50%{transform: scale(1.1);}
  }
  .filterBlock div.filterLabel{
    display: none;
  }
</style>
<link rel="stylesheet" href="/static/TokenInput/latest/token-input.css"/>
<link rel="stylesheet" href="/static/typeForm/css/form.css"/>
<link rel="stylesheet" href="/static/multiselect/multiselect.css"/>

<link rel="stylesheet" href="/portal_static/css/ps/theme/ui.datepicker.css"/>
<link rel="stylesheet" href="/autoform/css/spbren/custom-theme/jquery-ui.custom.css"/>
<link rel="stylesheet" href="/portal_static/css/form-customize.css"/>
{B{FORM$PROG_MAIN$SEARCH_FILTER_STYLE}E}
<script src="js/spbren/configuration.js"></script>
<script src="/static/TokenInput/latest/jquery.tokeninput.js"></script>
<script src="/static/typeForm/formHelper.js"></script>
<script src="/static/JQueryPlugins/ui.datepicker-ru.js" ></script>
<script src="/portal_static/js/jquery.datepicker.extension.range.min.js" ></script>
<script src="/static/JQueryPlugins/jquery.mousewheel.js" ></script>
<script src="/static/JQueryPlugins/jquery.selectik.min.js" ></script>
<script >
<![CDATA[
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
      $('.tokenInput').each(function() {
            initTokenInput($(this), {
                deleteAlways: true
            });
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
        /*getCharts();*/
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
});
]]>
</script>

        <script>
function filterSubmit(context){
    var $cardBody = $('#pd-body');

    var filterObj = {};
    $('input[type="hidden"], [type="checkbox"]:checked', context).each(function(indx, elm){
        var elmName = $(elm).attr('name');
        if (!$(elm).attr('name')){
            elmName = $(elm).parents('.tokenWrapper').find('.tokenInput').attr('name');
        }
        if (elmName) filterObj[elmName] = $(elm).val();
    });
    if ($cardBody.attr('data-href')){
        tabInfo.showLoading();
        $.fancybox.close();
        $.ajax({
            url: $cardBody.attr('data-href'),
            data: filterObj
        })
        .success(function(data){
            $cardBody.html(data);
        })
        .always(function(){
            tabInfo.hideLoading();
        });
    }
}
          $(function(){

            setTimeout(function(){
                $('.pd-tabs a').eq(0).click()
            });

            $('.pd-tabs a').on('click', function(e){
              e.preventDefault();
              var $this = $(this);
              if ($this.data('clickable') != 1) return;
              tabInfo.showLoading();

              $this.parent('li').addClass('pd-tab-active').siblings('li').removeClass('pd-tab-active');
              $.get($(this).attr('href')).done(function(data) {
                $('#pd-body').html(data);
                $('#pd-body').attr('data-href', $this.attr('href'));
              }).always(function(){
                  tabInfo.hideLoading();
              });
            });

            $(document).on('click', '.filterSubmitButton', function(){

                filterSubmit($(this).parents('.filterWrapper'));
            });

            $(document).on('click', '.pd-heading', function(){
              var $this = $(this);

              if ($this.data('count') === 0) return;

              $this.toggleClass('pd-heading-collapsed');
              $this.next('.pd-items').toggleClass('pd-hidden');
            });

            $(document).on('click', 'a.pd-get-modal', function(e){
              e.preventDefault();
              tabInfo.showLoading();
              $.get($(this).attr('href')).done(function(data) {
                  $('#pd-modal').css('display', 'flex').hide().html(data).fadeIn(100);
                }).always(function(){
                    tabInfo.hideLoading();
                });
            });

            $('#pd-modal').on('click', function(){
              $(this).fadeOut(100, function(){
                $(this).empty()
              });
            });
          });
        </script>

    </xsl:template>
</xsl:stylesheet>

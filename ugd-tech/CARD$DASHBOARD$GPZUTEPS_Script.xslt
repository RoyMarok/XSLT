<div>
<script src="/portal_static/js/highcharts_5.js"></script>
<!--script src="js/jquery/jquery-1.11.0.min.js"></script-->
<script src="js/jquery/jquery-ui-1.10.4.custom.min.js"></script>
<script src="/static/typeForm/typeForm.js"></script>
<script src="/static/JQueryPlugins/ui.datepicker-ru.js"></script>
<script src="/portal_static/js/jquery.datepicker.extension.range.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.customselect/0.5.1/jquery.customSelect.min.js"></script>
<script src="/static/JQueryPlugins/jquery.mousewheel.js"></script>
<script src="/static/JQueryPlugins/jquery.selectik.min.js"></script>
{B{SCRIPT$DATE_RANGE}E}
{B{SCRIPT$SWITCHER}E}
    
<script type="text/javascript"><![CDATA[
var charts = {};

var highChartsArr = {};

function getFilters() {
    var r = '',
        $w = $('.filterBar'),
        $fields = $('.filterVal', $w),
        $superFilter = $('.activeSuperFilter', $w);
        
    $fields.each(function() {
        var $t = $(this);
        if (!!r) r += '&';
        r += $t.attr('name') + '=' + $t.val();
    });
    
    $superFilter.find('[name="' + $superFilter.attr('data-name') + '"]').each(function() {
        var $t = $(this);
        if (!!r) r += '&';
        r += $t.attr('name') + '=' + $t.val();
    });
    
    return r;
}

function getCharts() {
    $('.ajaxNeed').each(function (indx, elm) {
        var chartId = 'chart_' + indx,
            $chart =  $('#' + chartId),
            $elm = $(elm);
        if ($elm.attr('data-xslt')) {
            $elm.html($('#loaderTemplate').html());
            $.ajax({
                url: 'getCardHtml.action',
                type: 'POST',
                data: 'cardId=' + $(elm).attr('data-xslt') + '&' + getFilters()
            }).success(function (data) {
                $elm.empty().append(data);
            });
        }
    });
}
function format_number(number) {
    number += '';
    if (number.length > 3) number = number.replace(/\B(?=(?:\d{3})+(?!\d))/g, ' ');
    return number;
}

$(function () {
    $('.date_view').dateRange({
	      fieldBegin: $('[name="FDATE_BEGIN"]'),
	      fieldEnd: $('[name="FDATE_END"]'),
	      pickerBegin: $('.pikers_one'),
	      pickerEnd: $('.pikers_two'),
	      dualCalendarSelector: '.minimal2calendars',
	      format: {
		        dateFormat: "dd.mm.yy",
		        showOn: "button",
		        buttonImageOnly: true,
		        changeYear: true,
		        changeMonth: true,
		        duration: '',
		        showButtonPanel: false,
		        gotoCurrent: false,
		        selectOtherMonths: true,
		        showOtherMonths: true,
		        numberOfMonths: 1,
		        range: 'period',
		        yearRange: "2012:" + (new Date()).getFullYear(),
		        monthNamesShort: ["Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь"],
		        onChangeMonthYear: function (year, month, inst) {
			          setTimeout(function () {
				            $('select').selectik();
			          }, 10);
		        }
	      },
	      onSelect: getCharts
    });
    typeForm.initContext($('.filterBar'));
    $('.fieldTrigger').switcher({
        onChange: function() {
            var $t = $(this),
                $vri = $('#filterPermUse'),
                $fno = $('#filterforBuilding'),
                activeClass = 'activeSuperFilter';
            
            if ($t.switcher('getValue') == 'VRI') {
                $vri.show().addClass(activeClass);
                $fno.hide().removeClass(activeClass);
            } else {
                $fno.show().addClass(activeClass);
                $vri.hide().removeClass(activeClass);
            }
        }
    });
    $('.filterBar .superSelect')
        .find(':input[type="text"]')
        .on('change', getCharts)
        .end()
        .find('.clear')
        .on('click', getCharts);
});
]]></script>
</div>
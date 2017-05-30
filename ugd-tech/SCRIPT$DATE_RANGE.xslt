<script type="text/javascript"><![CDATA[
(function($) {
	
	var defaultOptions = {
		    fieldBegin: null,
		    fieldEnd: null,
		    pickerdBegin: null,
		    pickerEnd: null,
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
        onSelect: function() {}
  };
  
  var methods = {
    init: function(options) {
            var settings = $.extend({}, defaultOptions, options || {});
      return this.each(function() {
                var $t = $(this);
                if ($t.data('dateRangeSettings')) return false;
                $t.data('dateRangeSettings', settings);
                _init.call(this);
            });
    }
  };
  
  $.fn.dateRange = function(method) {
    if (methods[method]) {
      return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
    } else {
      return methods.init.apply(this, arguments);
    }
  };

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

    function _init() {
        _setPickerParams();

        var $t = $(this),
            s = $t.data('dateRangeSettings'),
            nowDate = new Date(),
            startYear = new Date(nowDate.getFullYear(), 0, 1),
            $wrapper = $t.parent().find(s.dualCalendarSelector),
            $picker1 = s.pickerBegin,
            $picker2 = s.pickerEnd;

        s.format.onSelect = function (dateText, inst) {
            makeTwoRanges.call($t[0]);
            setTimeout(function () {
                $('select', $wrapper).selectik();
            }, 10);
        };

        if (!s.fieldBegin) return console.log('field date begin not inited');
        if (!s.fieldEnd) return console.log('field date end not inited');

        $picker1.datepicker(s.format);
        $picker2.datepicker(s.format);

        var rangeBegin =  $picker1.datepicker('widget').data('datepickerExtensionRange');
        var rangeEnd = $picker2.datepicker('widget').data('datepickerExtensionRange');

        if (!s.fieldBegin.val()) s.fieldBegin.val($.datepicker.formatDate("dd.mm.yy", startYear));
        if (!s.fieldEnd.val()) s.fieldEnd.val($.datepicker.formatDate("dd.mm.yy", nowDate));

        $picker1.datepicker('setDate', [s.fieldBegin.val(), s.fieldEnd.val()]);
        $picker2.datepicker('setDate', [s.fieldBegin.val(), s.fieldEnd.val()]);

        $t.text(dateRangeRender(rangeBegin.startDate, rangeEnd.endDate));
        
        $picker1.datepicker('setDate', rangeBegin.startDateText);
        rangeBegin.endDate = $.datepicker.parseDate( "dd.mm.yy", s.fieldEnd.val());
        $picker1.datepicker('refresh');
        
        $('select', $wrapper).selectik();

        $('.bigBigButton', $wrapper).click(function (e) {
            s.onSelect();
            $(s.dualCalendarSelector).hide();
            e.stopPropagation();
        });

        $(document).click(function () {
            if ($(s.dualCalendarSelector + ':visible').length) s.onSelect();
            $(s.dualCalendarSelector).hide();
        });

        $t.add($t.parent()).add($wrapper).click(function (event) {
            $wrapper.show();
            event.stopPropagation();
        });

        s.onSelect();
    }

    function _setPickerParams() {
        $.datepicker._defaults.onAfterUpdate = null;
        var datepicker__updateDatepicker = $.datepicker._updateDatepicker;
        $.datepicker._updateDatepicker = function (inst) {
            datepicker__updateDatepicker.call(this, inst);
            var onAfterUpdate = this._get(inst, 'onAfterUpdate');
            if (onAfterUpdate)
                onAfterUpdate.apply((inst.input ? inst.input[0] : null),
                    [(inst.input ? inst.input.val() : ''), inst]);
        };
    }

  function makeTwoRanges() {
        var $t = $(this), s = $t.data('dateRangeSettings');

    var extensionRangeOne = s.pickerBegin.datepicker('widget').data('datepickerExtensionRange');
    var extensionRangeTwo = s.pickerEnd.datepicker('widget').data('datepickerExtensionRange');

    var date1 = s.pickerBegin.datepicker('getDate');
    var date2 = s.pickerEnd.datepicker('getDate');


    var outDate1 = '';
    var outDate2 = '';
    if (date1 < date2) {
      extensionRangeOne.startDate = date1;
      extensionRangeTwo.startDate = date1;
      extensionRangeOne.endDate = date2;
      extensionRangeTwo.endDate = date2;

      outDate1 = $.datepicker.formatDate("dd.mm.yy", date1);
      outDate2 = $.datepicker.formatDate("dd.mm.yy", date2);
    } else {
      extensionRangeOne.startDate = date2;
      extensionRangeTwo.startDate = date2;
      extensionRangeOne.endDate = date1;
      extensionRangeTwo.endDate = date1;

      outDate1 = $.datepicker.formatDate("dd.mm.yy", date2);
      outDate2 = $.datepicker.formatDate("dd.mm.yy", date1);
    }
        s.pickerBegin.datepicker('refresh');
        s.pickerEnd.datepicker('refresh');
        s.fieldBegin.val(outDate1);
        s.fieldEnd.val(outDate2);

    $('.date_view').text(dateRangeRender(extensionRangeOne.startDate, extensionRangeOne.endDate));
  }
  function dateRangeRender(startDate, endDate) {
    var outDateOneRender = $.datepicker.formatDate("dd", startDate) + ' ' + monthsRu[$.datepicker.formatDate("mm", startDate)] + ' ' + $.datepicker.formatDate("yy", startDate);
    var outDateTwoRender = $.datepicker.formatDate("dd", endDate) + ' ' + monthsRu[$.datepicker.formatDate("mm", endDate)] + ' ' + $.datepicker.formatDate("yy", endDate);
    return outDateOneRender + ' — ' + outDateTwoRender;
  }

})(jQuery);
]]></script>
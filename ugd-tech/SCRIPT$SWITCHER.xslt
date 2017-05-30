<script type="text/javascript"><![CDATA[
(function($) {
    var defaultOptions = {
        wrapperClassName: 'switcherWrap',
        gripClassName: 'switcherGrip',
        labelClassName: 'switcherLabel',
        onChange: function() {
            
        }
    };
  
    var methods = {
        init: function(options) {
            var settings = $.extend({}, defaultOptions, options || {});
            return this.each(function() {
                var $t = $(this);
                if ($t.data('switcherSettings')) return false;
                $t.data('switcherSettings', settings);
                _init.call(this);
            });
        },
        change: function(index) {
            return this.each(function() {
                _change.call(this, index);
            });
        },
        getValue: function() {
            return this.find('input:checked').val();
        },
        setValue: function(val) {
            return this.each(function() {
                var $t = $(this),
                    s = $t.data('switcherSettings'),
                    d = $t.data('switcherData');
                
                for (var i=0; i<d.values.length; i++) {
                    if (d.values[i].value == val) {
                        d.values[i].field.attr('checked', 'checked');
                        $('.' + s.wrapperClassName, $t).attr('data-index', i);
                    } else {
                        d.values[i].field.removeAttr('checked');
                    }
                }
                methods.change.call($t);
            });
        },
        getIndex: function() {
            return this.attr('data-index');
        }
    };
  
    $.fn.switcher = function(method) {
        if (methods[method]) {
            return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
        } else {
            return methods.init.apply(this, arguments);
        }
    };
    
    function _init() {
        var $t = $(this),
            s = $t.data('switcherSettings'),
            $fields = $t.find('input[type="radio"]'),
            data = {
                values: []
            },
            index = 0;
        
        if ($fields.length != 2) {
            delete $t.data('switcherSettings');
            console.log('jquery.switcher error: Кол-во RADIO-кнопок != 2'); 
            return false;
        }
        
        $fields.each(function(i) {
            var $f = $(this),
                $label = $f.closest('label').hide();
                
            if (!i) data.name = $f.attr('name');
            if ($f.is(':checked')) {
                index = i;
            }
            
            data.values.push({
                title: $label.text().trim(),
                value: $f.val(),
                color: $f.data('color') || '#ccc',
                checked: $f.is(':checked'),
                field: $f
            });
            data.values.index = index;
            
            $t.data('switcherData', data);
        });
        _paintUserInterface.call(this, index);
    }
    
    function _change(index) {
        var t = this,
            $t = $(this),
            s = $t.data('switcherSettings'),
            d = $t.data('switcherData'),
            oldIndex = d.values.index;
        
        for (var i=0; i<d.values.length; i++) {
            var checked = false;
            
            if (typeof index != 'undefined') {
                checked = index == i;
                if (checked) {
                    d.values[i].field.attr('checked', 'checked').trigger('change');
                } else {
                    d.values[i].field.removeAttr('checked');
                }
            } else {
                checked = d.values[i].field.is(':checked');
            }
            if (checked) d.values.index = i;
            d.values[i].checked = checked;
        }
        
        var color = d.values[d.values.index].color;
        $('.' + s.wrapperClassName, $t).css('backgroundColor', color);
        $('.' + s.gripClassName, $t).css('borderColor', color);
        
        //if (oldIndex != d.values.index) 
            s.onChange.call(this);
    }
    
    function _paintUserInterface(index) {
        var t = this,
            $t = $(this),
            s = $t.data('switcherSettings'),
            d = $t.data('switcherData');
            
        var $mainBlock = $('<div class="' + s.wrapperClassName + '" data-index="' + index + '"><div class="' + s.gripClassName + '"></div></div>')
            .appendTo($t)
            .click(function() {
                var newIndex = +!+$mainBlock.attr('data-index');
                $mainBlock.attr('data-index', newIndex);
                methods.change.call($t, newIndex);
            });
        
        for (var i=0; i<d.values.length; i++) {
            var pasteMethod = i ? 'appendTo' : 'prependTo';
            var $label = $('<div data-index="' + i + '" class="' + s.labelClassName + '">' + d.values[i].title + '</div>')[pasteMethod]($t);
            $label.click(function() {
                var labelIndex = $(this).attr('data-index');
                $mainBlock.attr('data-index', labelIndex);
                methods.change.call($t, labelIndex);
            });
            d.values[i].field.on('change', function() {
                methods.setValue.call($t, this.value);
            });
        }
        
        methods.change.call($t, index);
    }
})(jQuery);
]]></script>
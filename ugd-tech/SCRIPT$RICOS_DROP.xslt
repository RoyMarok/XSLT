<div>
<style type="text/css">
.rDropWrapper {
    position: relative;
}
.rDropTarget {
    position: absolute;
    background: #fff;
    box-shadow: 0 2px 10px 0 #999;
    border: 1px solid #BFBFBF;
}
.rDropTarget .arrow {
    display: block;
    position: absolute;
    left: 50%;
    top: -8px;
    width: 0;
    height: 0;
    margin-left: -8px;
    border-style: solid;
    border-color: #999 transparent;
    border-width: 0 8px 8px 8px;
}
.rDropTarget .arrow:after {
    content: '';
    display: block;
    position: absolute;
    width: 0;
    height: 0;
    top: 1px;
    left: -8px;
    border-style: solid;
    border-color: #fff transparent;
    border-width: 0 8px 8px 8px;
}
.rDropTarget .arrow.bottom {
    border-width: 8px 8px 0 8px;
    top: auto;
    bottom: -8px;
}
.rDropTarget .arrow.bottom:after {
    border-width: 8px 8px 0 8px;
    top: -9px;
}
</style>
<script type="text/javascript"><![CDATA[
(function() {
    var pluginInitFlag = 'ricosDropInited';
    var settingsPropName = 'ricosDropSettings';

    var DEFAULT_SETTINGS = {
        startSelector: '.rDrop', //Селектор элемента, по которому кликаем
        targetSelector: '.rDropTarget', //Селектор элемента, который показываем/скрываем
        showedClass: 'showed', //класс-флаг того, что целевой элемент сейчас виден
        showType: '', //тип анимции появления целевого элемента
        cloneTarget: true, //клонирование целевого элемента в конец body (если родитель overflow: hidden)
        cloneWrapperTpl: '<div class="ricosDropWrapper"></div>', //шаблон враппера клонов
        margin: 10, //отступ от стартового элемента
        arrow: true, //показывать ли стрелку у целевого элемента
        arrowTpl: '<span class="arrow"></span>', //шаблон разметки стрелки,
        targetPosition: '',
        action: 'click'
    };

    var methods = {
        init: function(options) {
            var settings = $.extend({}, DEFAULT_SETTINGS, options || {});

            return this.each(function () {
                var $t = $(this);

                _init.call(this, settings);
            });
        },
        destroy: function() {
            return this.each(function() {
                methods.clear.call(this);
                $(this).removeData(settingsPropName);
            });
        }
    };

    function _init(s) {
        var $t = $(this);

        s.cloneWrapper = $(s.cloneWrapperTpl).appendTo('body');

        $t.data(settingsPropName, s);
        $t.addClass(pluginInitFlag);
        _initEvents.call(this, s);
    }

    function _initEvents(s) {
        var $wrapper = $(this);

        switch (s.action){
            case 'hover':
                $(s.startSelector, this).mouseenter(function(){
                    _show.call($wrapper, s);
                    return false;
                }).mouseleave(function(){
                    _hide.call($wrapper, s);
                    return false;
                });
                break;
            default:
                $(s.startSelector, this).click(function() {
                    $(document).click(function(e) {
                        var needHide = true;
                        needHide = needHide && !$(e.target).closest($wrapper).length;
                        needHide = needHide && !$(e.target).closest(s.cloneWrapper).length;
                        if (needHide) _hide.call($wrapper, s);
                        //e.stopPropagation();
                    });

                    //$target.toggle();
                    _toggle.call($wrapper, s);

                    return false;
                });
                break;
        }


        if (!$.ricosDrop) {
            $.ricosDrop = {
                winWidth: $(window).width()
            };
            $(window).on('resize', function() {
                //Перемещение целевого блока при ресайзе окна
                if (!!$.ricosDrop.check) clearInterval($.ricosDrop.check);
                $.ricosDrop.check = setInterval(function() {
                    var winWidth = $(window).width();

                    if (winWidth != $.ricosDrop.winWidth) {
                        console.log('Ширина окна изменилась');
                        $.ricosDrop.winWidth = winWidth;
                        $('.' + pluginInitFlag).each(function() {
                            var $t = $(this),
                                s = $t.data(settingsPropName);

                            if ($t.hasClass(s.showedClass)) {
                                _reCalcPosition.call(this, s);
                            }
                        });
                    }
                }, 200);
            });
        }
    }

    //Показать целевой блок
    function _show(s) {
        var $t = $(this),
            $target = $(s.targetSelector, this);

        if (s.cloneTarget) $target = $target.clone().appendTo(s.cloneWrapper.empty());
        if (s.arrow) {
            if (s.cloneTarget || !s.arrowBlock)
                s.arrowBlock = $(s.arrowTpl).appendTo($target);
        }
        _reCalcPosition.call(this, s);
        $t.addClass(s.showedClass);

        switch (s.showType) {
            default:
                $target.show();
                break;
        }
    }

    //Скрыть целевой блок
    function _hide(s) {
        var $t = $(this),
            $target = $(s.targetSelector, s.cloneTarget ? s.cloneWrapper : this);

        $t.removeClass(s.showedClass);

        switch (s.showType) {
            default:
                $target.hide();
                break;
        }
    }

    //Скрыть/показать целевой блок
    function _toggle(s) {
        if ($(this).hasClass(s.showedClass))
            _hide.call(this, s);
        else
            _show.call(this, s);
    }

    //Пересчитать и установить новую позицию для целевого блока и его стрелки
    function _reCalcPosition(s) {
        var targetStyle = {}, targetWidth, targetHeight,
            $wrapper = $(this),
            isShowed = $wrapper.hasClass(s.showedClass),
            $win = $(window),
            winWidth = $win.width(),
            winHeight = window.innerHeight,
            $starter = $(s.startSelector, this),
            starterWidth = $starter.outerWidth(true),
            starterHeight = $starter.outerHeight(true),
            starterOffset = $starter.offset(),
            $target = $(s.targetSelector, s.cloneTarget ? s.cloneWrapper : this);

        if (!isShowed) $target.show(); //Если блок еще не виден
        targetWidth = $target.outerWidth(true);
        targetHeight = $target.outerHeight(true);
        if (!isShowed) $target.hide(); //Не скрывать, если пересчет идет при ресайзе window

        if (s.arrow) s.arrowBlock.removeClass('bottom');

        if (s.cloneTarget) {
            if (winWidth - (starterOffset.left + starterWidth/2 - targetWidth/2) >= targetWidth
                && starterOffset.left + starterWidth/2 - targetWidth/2 >= 0
                && !/.*left|right.*/.test(s.targetPosition)) {
                //Центрирование по центру стартового блока, если целевой помещается
                targetStyle.left = starterOffset.left + starterWidth/2 - targetWidth/2 + 'px';
                if (s.arrow) s.arrowBlock.css('left', '50%');
            } else if (winWidth - starterOffset.left >= targetWidth && !~s.targetPosition.indexOf('right')) {
                //Показ от левой границы стартового блока
                targetStyle.left = starterOffset.left + 'px';
                if (s.arrow) s.arrowBlock.css('left', starterWidth/2 + 'px');
            } else {
                //Показ от правой границы налево, если справа недостаточно места
                targetStyle.left = starterOffset.left + starterWidth - targetWidth + 'px';
                if (s.arrow) s.arrowBlock.css('left', targetWidth - starterWidth/2 + 'px');
            }
            //По умолчанию - вертикальное положение целевого блока - под стартовым
            targetStyle.top = starterOffset.top + starterHeight + s.margin + 'px';
            if (winHeight + $('body').scrollTop() - starterOffset.top - starterHeight - s.margin < targetHeight
                && starterOffset.top >= targetHeight
                && !~s.targetPosition.indexOf('bottom')) {
                targetStyle.top = starterOffset.top - targetHeight - s.margin + 'px';
                if (s.arrow) s.arrowBlock.addClass('bottom');
            }
        } else {
            if (winWidth - (starterOffset.left + starterWidth/2 - targetWidth/2) >= targetWidth
                && starterOffset.left + starterWidth/2 - targetWidth/2 >= 0
                && !/.*left|right.*/.test(s.targetPosition)) {
                targetStyle.left = starterWidth/2 - targetWidth/2 + 'px';
                if (s.arrow) s.arrowBlock.css('left', '50%');
            } else if (winWidth - starterOffset.left >= targetWidth && !~s.targetPosition.indexOf('right')) {
                targetStyle.left = 0;
                if (s.arrow) s.arrowBlock.css('left', starterWidth/2 + 'px');
            } else {
                targetStyle.left = starterWidth - targetWidth + 'px';
                if (s.arrow) s.arrowBlock.css('left', targetWidth - starterWidth/2 + 'px');
            }
            targetStyle.top = starterHeight + s.margin + 'px';
            if (winHeight - starterOffset.top - starterHeight < targetHeight
                && starterOffset >= targetHeight
                && !~s.targetPosition.indexOf('bottom')) {
                targetStyle.top = targetHeight - s.margin + 'px';
                if (s.arrow) s.arrowBlock.addClass('bottom');
            }
        }




        if (!isShowed) $target.css(targetStyle);
        else $target.stop().animate(targetStyle, 200);
    }

    $.fn.ricosDrop = function(method) {
        // Method calling and initialization logic
        if(methods[method]) {
            return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
        } else {
            return methods.init.apply(this, arguments);
		}
	};
})(jQuery);
]]></script>
</div>
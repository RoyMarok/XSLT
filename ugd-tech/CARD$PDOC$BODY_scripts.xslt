<script type="text/javascript">
    <![CDATA[
     $(document).ready(function () {

    function transFileSize(fileSpan, value) {
        var sizeTypes = ['б', 'Кб', 'Мб', 'Гб', 'Тб'], i = 0;
        if (!value) {
            value = $(fileSpan).html().replace(/[()]/g, '');
        }
        if (value > 0 && value.indexOf('б')
            < 0) {
            while (value > 1024) {
                i++;
                value /= 1024;
            }
            $(fileSpan).html(Math.round(value) + ' ' + sizeTypes[i]);
        }
    }

    $(".fileSize").each(function () {
        transFileSize(this, 0);
    })
    var elem = $('.p-doc-scroller').each(function () {
        var count = $(this).attr('data-page'),
            id = $(this).attr('data-id'),
            container = $(this).parent().find("div.gallery-images"),
            pages = count - 3;

        for (var pdi = 1; pdi <= count; pdi++) {
            if (pdi <= 3) {
                $(container).append('<div class="thumb-image"><a href="/portal/getImage.action?cardId=' + id + '&page=' + pdi + '" page="' + pdi + '" rel="' + id + '"><img src="/portal/getThumb.action?cardId=' + id + '&page=' + pdi + '" /></a></div>');
            } else {
                $(container).append('<div class="thumb-image"><a href="/portal/getImage.action?cardId=' + id + '&page=' + pdi + '" page="' + pdi + '" rel="' + id + '"></a></div>');
            }
        }
        $('a', container).each(function () {
            $(this).colorbox({opacity: 0.2, current: "Страница: {current} из {total}", photo: true});
        });
    });

    $(".gallery-images").scroll(function () {
        var cardId = $(this).parent().attr('data-id');
        var offset = ($(this).scrollLeft() / 85) + .5 | 0;
        var targetImg = $('div.thumb-image', this).eq(offset + 3);
        $('div.thumb-image', this).each(function (index) {
            if (index < (offset + 3)) {
                if ($(this).find('img').length == 0) {
                    $('a', this).append('<img src="/portal/getThumb.action?cardId=' + cardId + '&amp;page=' + (index + 1) + '"/>');
                }
            }
        });
    });


    var galleryRight = $('.gallery-right');
    if (galleryRight.length > 0 && galleryRight.find('.wrp-images').attr('data-id')) {
        var glWrapper = galleryRight.find('.wrp-images'),
            glId = glWrapper.attr('data-id'),
            glCount = glWrapper.attr('data-images-count'),
            bigImg = galleryRight.find('.main-image');
        if (!!bigImg.length && glCount < 2) {
            $(".other-images").hide()
        }
        console.log(glCount);
        for (var gli = 1; gli <= glCount; gli++) {
            if (gli == 1) {
                bigImg.attr('href', '/portal/getImage.action?cardId=' + glId + '&page=' + gli).children('img').attr('src', '/portal/getImage.action?cardId=' + glId + '&page=' + gli);
            }
            glWrapper.append('<a href="/portal/getImage.action?cardId=' + glId + '&page=' + gli + '" class="link-image" page="' + gli + '" rel="gl' + glId + '"><img src="/portal/getThumb.action?cardId=' + glId + '&page=' + gli + '" alt="" /></a>');
        }
        var xw = 0,
            glass = $('a', glWrapper)
                .each(function (i) {
                    xw += $(this).outerWidth(true) || 110;
                    if (i == 0) {
                        $(this).addClass('active');
                    }
                })
                .click(function () {
                    var $t = $(this), h = $t.attr('href');
                    $t.addClass('active').siblings().removeClass('active');
                    bigImg.attr('href', h).children('img').attr('src', h);
                });

        glass.colorbox({rel:"group-all-j38djd",opacity: 0.2, current: "Страница: {current} из {total}", photo: true});

    //#MGEII-4077 пункт 1
    bigImg.click(function () {
      //показываем галерею
      glass.filter(".active").eq(0).click();
      return false;
    });

        glWrapper.width(xw);
    }

    $('.mainWrapper')
        .on('mousedown', function (e) {
            if ('reviewBlock' in document.body && $(e.target).closest('.baloon-wrapp').length == 0 && document.body.reviewBlock != $(e.target).closest('.preview-block')[0]) {
                $('.baloon-wrapp').hide();
                document.body.reviewBlock = null;
            }
        })
        .on('mouseup', '.preview-block', function (e) {
            $('.baloon-wrapp').hide();
            var thisBaloon = $('.baloon-wrapp', this);
            if ('reviewBlock' in document.body && document.body.reviewBlock == this && !$(e.target).closest('.baloon-wrapp').length) {
                thisBaloon.hide();
                document.body.reviewBlock = null;
            } else {
                thisBaloon.show();
                document.body.reviewBlock = this;
            }
        });
        $(document).on('click', 'a.cardCheckECP', function (event) {
    //$('a.cardCheckECP').bind("click", function (event) {
        var thisCardID = $(this).attr('id');
        tabInfo.showLoading();
        try {
            $.ajax({
                url: '/elib/signInfo.action?cardId=' + thisCardID,
                success: function (json) {
                    var data = json;
                    var s = {
                        a: '',
                        parent: {
                            o: '<div class="checkWindow"><div class="_headBlock"><div class="close_icon"><img src="/portal_static/img/close.png" alt=""/></div><p>Проверка электронной подписи</p></div>',
                            c: '</div>'
                        },
                        contentBlock: {
                            o: '<div class="contentBlock">',
                            c: '</div>'
                        },
                        signInfo: {
                            o: '<div class="signInfo">',
                            c: '</div>'
                        },
                        name: {
                            o: '<div class="field name"><label>Подписал………………………………………………………</label><p>',
                            c: '</p></div>'
                        },
                        dateSign: {
                            o: '<div class="field dateSign"><label style="vertical-align: text-bottom">Дата подписи…………………………………</label><p>',
                            c: '</p></div>'
                        },
                        dateTo: {
                            o: '<div class="field dateTo"><label style="ver123412431234tical-align: text-bottom">Срок действия сертификата…………………………</label><p>',
                            c: '</p></div>'
                        },
                        signStatus: '<div class="signStatus"><p class="status"><img src="/portal_static/img/sign_ok.png" alt="" style="vertical-align: middle"/>ЭЛЕКТРОННАЯ ПОДПИСЬ ДЕЙСТВИТЕЛЬНА</p><p class="info">Подписанные данные не были изменены с момента подписания</p></div>',
                        ok: '<div class="btn"><a class="classname">OK</a></div>'
                    };
                    if (data.data && !data.errors && !data.data[0].displayError) {
                            var i = 0;
                            for (var jj = 0; jj < data.data.length; jj++) {
                                var info = jj;
                                if (i > 0) s.a += '<div class="spacer"></div>';
                                i++;
                                var dateFrom = '';
                                if (data.data[info]['validFrom'] != null) {
                                    dateFrom = new Date(data.data[info]['validFrom']);
                                    var date = dateFrom.getDate().toString();
                                    var month = dateFrom.getMonth() + 1;
                                    month = month.toString();
                                    if (date.length == 1) {
                                        date = "0" + date
                                    }
                                    if (month.length == 1) {
                                        month = "0" + month
                                    }
                                    dateFrom = date + '.' + month + '.' + dateFrom.getFullYear();
                                }
                                var dateTo = '';
                                if (data.data[info]['validTo'] != null) {
                                    dateTo = new Date(data.data[info]['validTo']);
                                    var date = dateTo.getDate().toString();
                                    var month = dateTo.getMonth() + 1;
                                    month = month.toString();
                                    if (date.length == 1) {
                                        date = "0" + date
                                    }
                                    if (month.length == 1) {
                                        month = "0" + month
                                    }
                                    dateTo = date + '.' + month + '.' + dateTo.getFullYear();
                                }
                                var signTime = '';
                                if (data.data[info]['signTime'] != null) {
                                    signTime = new Date(data.data[info]['signTime']);
                                    var date = signTime.getDate().toString();
                                    var month = signTime.getMonth() + 1;
                                    month = month.toString();
                                    if (date.length == 1) {
                                        date = "0" + date
                                    }
                                    if (month.length == 1) {
                                        month = "0" + month
                                    }
                                    signTime = date + '.' + month + '.' + signTime.getFullYear();
                                }
                                var name = "";
                                //name+= (data.data[info]['subject']['cn']!=null) ? data.data[info]['subject']['cn'] : '';
                                //выводим либо sn +g либо cn
                                if (data.data[info]['subject']['sn'] != null) {
                                    name += (data.data[info]['subject']['sn'] != null) ? data.data[info]['subject']['sn'] : '';
                                    name += (data.data[info]['subject']['g'] != null) ? ' ' + data.data[info]['subject']['g'] : '';
                                } else {
                                    name += (data.data[info]['subject']['cn'] != null) ? data.data[info]['subject']['cn'] : '';
                                }
                                name += (data.data[info]['subject']['t'] != null) ? ', ' + data.data[info]['subject']['t'] : '';
                                name += (data.data[info]['subject']['o'] != null) ? ', ' + data.data[info]['subject']['o'] : '';
                                s.a += s.name.o + name + s.name.c;
                                s.a += s.dateTo.o + 'с ' + dateFrom + ' по ' + dateTo + s.dateTo.c;
                                s.a += (signTime) ? s.dateSign.o + signTime + s.dateSign.c : '';
                                var win = s.parent.o + s.contentBlock.o + s.signStatus + s.signInfo.o + s.a + s.signInfo.c + s.ok + s.contentBlock.c + s.parent.c;
                                var _win = $(win);
                            }
                            $("body").append($(_win));
                            var fadediv = $('<div id = "fadediv" > </div>');
                            fadediv.css({
                                'position': 'fixed',
                                'top': 0,
                                'left': 0,
                                'width': '100%',
                                'height': '100%',
                                'min-height': '100%',
                                'background-color': '#d9d9d9',
                                'filter': 'alpha(opacity=30)',
                                'opacity': 0.3,
                                'text-align': 'center',
                                'z-index': 9998
                            });
                            var bodywidth = parseInt($('body').css('width'));
                            var bodyheight = $('body').height();
                            var wh = $(window).height();
                            var scrl_Top = $(window).scrollTop();
                            $(".checkWindow").css({left: parseInt((parseInt(bodywidth) - parseInt(565)) / 2), top: '100px'});
                            $('body').append($(fadediv));
                            tabInfo.hideLoading()
                            $(".classname").click(function () {
                                $(".checkWindow").remove();
                                $("#fadediv").remove();

                            });

                            $(".close_icon").click(function () {
                                $(".checkWindow").remove();
                                $("#fadediv").remove();
                            });

                    } else {
                        var textError = 'ЭЛЕКТРОННАЯ ПОДПИСЬ ОТСУТСТВУЕТ'
                        if (data.errors != null)
                        {textError = 'При проверке подписи произошла неопознанная ошибка';}
                        else if (data.data[0].displayError != null){
                         for (var jj = 0; jj < data.data.length; jj++) {
                                var info = jj;
                            var name = "";
                                //name+= (data.data[info]['subject']['cn']!=null) ? data.data[info]['subject']['cn'] : '';
                                //выводим либо sn +g либо cn
                                if (data.data[info]['subject']['sn'] != null) {
                                    name += (data.data[info]['subject']['sn'] != null) ? data.data[info]['subject']['sn'] : '';
                                    name += (data.data[info]['subject']['g'] != null) ? ' ' + data.data[info]['subject']['g'] : '';
                                } else {
                                    name += (data.data[info]['subject']['cn'] != null) ? data.data[info]['subject']['cn'] : '';
                                }
                               // name += (data.data[info]['subject']['t'] != null) ? ', ' + data.data[info]['subject']['t'] : '';
                               // name += (data.data[info]['subject']['o'] != null) ? ', ' + data.data[info]['subject']['o'] : '';
                            }
                          textError = 'При проверке подписи ' + name + ' произошла ошибка: ' + data.data[0].displayError
                        }
                        var emptyWin = '<div class="checkWindow" id="signWindow">' +
                            '<div class="_headBlock">' +
                            '<div class="close_icon">' +
                            '<img src="/portal_static/img/close.png" alt=""/>' +
                            '</div><p>Проверка электронной подписи</p></div>' +
                            '<div class="contentBlock"><div class="signStatus" style="text-align: center"><p class="status" style="color:#808080;">' +
                            textError + '</p></div>' +
                            '<div class="btn"><span class="ok"><a class="classname">OK</a></span></div></div></div>';
                        $("body").append($(emptyWin));
                        var fadediv = $('<div id="fadediv"></div>');
                        fadediv.css({
                            'position': 'fixed',
                            'top': 0,
                            'left': 0,
                            'width': '100%',
                            'height': '100%',
                            'min-height': '100%',
                            'background-color': '#d9d9d9',
                            'filter': 'alpha(opacity=30)',
                            'opacity': 0.3,
                            'text-align': 'center',
                            'z-index': 9998
                        });
                        var bodywidth = parseInt($('body').css('width'));
                        var bodyheight = $('body').height();
                        var wh = $(window).height();
                        var scrl_Top = $(window).scrollTop();
                        $(".checkWindow").css({left: parseInt((parseInt(bodywidth) - parseInt(565)) / 2)});
                        tabInfo.hideLoading()
                        $('body').append($(fadediv));
                        $(".classname").click(function () {
                            $("#fadediv").remove();
                            $(".checkWindow").remove();
                        });
                        $(".close_icon").click(function () {
                            $("#fadediv").remove();
                            $(".checkWindow").remove();
                        });
                    }
                },
                error: function (xhr, status, text) {
                    alert(text);
                    tabInfo.hideLoading();
                }
            });
        } catch (e) {
            tabInfo.hideLoading();
            alert(e.name);
        }
        event.preventDefault();
    });
});


    ]]>
</script>

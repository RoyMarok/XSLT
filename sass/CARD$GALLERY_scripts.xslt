<script type="text/javascript" src="/static/fileBaloon/fileBaloon.js"></script>
<script type="text/javascript" src="/elib/js/signVerify.js"/>

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
    window.setFileSize = transFileSize;

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
            $(this).colorbox({opacity: 0.2, current: "Страница: {current} из {total}", photo: true, height: '100%'});
        });
        
    });

    $(".gallery-images").scroll(function () {
        var cardId = $(this).parent().attr('data-id');
        var offset = ($(this).scrollLeft() / 85) + .5 | 0;
        var targetImg = $('div.thumb-image', this).eq(offset + 3);
        $('div.thumb-image', this).each(function (index) {
            if (index < (offset + 3)) {
                if ($(this).find('img').length == 0) {
                    $('a', this).append('<img src="getThumb.action?cardId=' + cardId + '&amp;page=' + (index + 1) + '"/>');
                }
            }
        });
    });


    var galleryRight = $('.gallery-right');
  var glWrapper = galleryRight.find('.wrp-images');
  
    if (galleryRight.length > 0 && glWrapper.length > 0) {
        
    var bigImg = galleryRight.find('.main-image');
    var fist_img_galery_id ; 
    
    glWrapper.find('.wrp-images-group').each(function (index) {
      var self = $(this);    
      if (self.attr('data-id')) 
      {
        var galery_id = self.attr('data-id');
        var img_count = self.attr('data-images-count');    
        
        //формирование галереии по её ID
        var buffer = "";
        for (var i = 1; i <= img_count; i++) {
          
          //запомним первое добавленное изображение
          if( fist_img_galery_id  === undefined ){
            fist_img_galery_id = galery_id;  
          }
          
          buffer +=  '<a href="/portal/getImage.action?cardId=' + galery_id + '&page=' + i + '" class="link-image" page="' + i +'"><img src="/portal/getThumb.action?cardId=' + galery_id + '&page=' + i + '" alt="" /></a>'
        }

        self.append(buffer);
      }
    }); 

    //скрыть панель с картинками если галерея пустая    
        if (glWrapper.find("img").length <= 1) {
            $(".other-images").hide()
        }

    //установить большое превью
    if (typeof fist_img_galery_id !== "undefined"){
      bigImg.attr('href', '/portal/getImage.action?cardId=' + fist_img_galery_id + '&page=' + 1).children('img').attr('src', '/portal/getImage.action?cardId=' + fist_img_galery_id + '&page=' + 1);    
        }
    
    var xw = 0,
            glass = $('a', glWrapper)
                .each(function (i) {
          //сложим ширину всех картинок
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

        glass.colorbox({rel:"group-all-j38djd",opacity: 0.2, current: "Страница: {current} из {total}", photo: true, height: '100%'});
    
    //#MGEII-4077 пункт 1
    bigImg.click(function () {
      //показываем галерею
      glass.filter(".active").eq(0).click();
      return false; 
    });
    
        //Ширина строки с картинками
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
    $('a.cardCheckECP').bind("click", function (event) {
        $(this).checkECPPlugin();
    });
});


    ]]>
</script>
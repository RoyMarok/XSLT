<script type="text/javascript" src="/elib/js/signVerify.js"></script>
<script type="text/javascript">
  var h = {dic:function(a,b){return b;}}
</script>
<script type="text/javascript">
    <![CDATA[
      $(document).ready(function(){
         $('.mainWrapper')
          .on('mousedown', function(e) {
            if ('reviewBlock' in document.body && $(e.target).closest('.baloon-wrapp').length == 0 && document.body.reviewBlock != $(e.target).closest('.preview-block')[0]) {
              $('.baloon-wrapp').hide();
              document.body.reviewBlock = null;
            }
          })
          .on('mouseup', '.preview-block', function(e) {

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
         function transFileSize(fileSpan,value) {
            var sizeTypes = ['б', 'Кб', 'Мб', 'Гб', 'Тб'], i=0;
            if (!value) {
              value = $(fileSpan).html().replace(/[()]/g, '');
            }
            if (value > 0 && value.indexOf('б') < 0) {
            while (value > 1024) {
              i++;
              value /= 1024;
            }
            $(fileSpan).html(Math.round(value)+' '+sizeTypes[i]);
          }
        }
        $(".fileSize").each(function(){

          transFileSize(this,0);
        })
        var elem = $('.p-doc-scroller').each(function(){
            var count = $(this).attr('data-page'),
                id    = $(this).attr('data-id'),
                container  = $(this).parent().find("div.gallery-images");
           for(var pdi=1; pdi<=count; pdi++){
              $(container).append('<div class="thumb-image"><a href="/portal/getImage.action?cardId='+id+'&page='+pdi+'" page="'+pdi+'" rel="'+id+'"><img src="/portal/getThumb.action?cardId='+id+'&page='+pdi+'" /></a></div>');
            }
            $('a',container).each(function(){
              $(this).colorbox({opacity: 0.2,current:"Страница: {current} из {total}",photo: true});
            });
        });

        var galleryRight = $('.gallery-right');
        if (galleryRight.length > 0 && galleryRight.find('.wrp-images').attr('data-id')) {
          var glWrapper = galleryRight.find('.wrp-images'),
              glId = glWrapper.attr('data-id'),
              glCount = glWrapper.attr('data-images-count'),
              bigImg = galleryRight.find('.main-image');

           if (!!bigImg.length && glCount < 2) {$(".other-images").hide()}
          for (var gli=1; gli<=glCount; gli++) {
            if (gli == 1) {
              bigImg.attr('href', '/portal/getImage.action?cardId='+glId+'&page='+gli).children('img').attr('src', '/portal/getImage.action?cardId='+glId+'&page='+gli);
            }
            glWrapper.append('<a href="/portal/getImage.action?cardId='+glId+'&page='+gli+'" class="link-image" page="'+gli+'" rel="gl'+glId+'"><img src="/portal/getThumb.action?cardId='+glId+'&page='+gli+'" alt="" /></a>');
          }
          var xw = 0,
            glass = $('a', glWrapper)
              .each(function(i) {
                xw += $(this).outerWidth(true);
                if (i == 0) {
                  $(this).addClass('active');
                }
              })
              .click(function() {
                var $t = $(this), h = $t.attr('href');
                $t.addClass('active').siblings().removeClass('active');
                bigImg.attr('href', h).children('img').attr('src', h);
              });

          /*glass.add(bigImg).each(function(i){
            $(this).colorbox({opacity: 0.2,current:"Страница: {current} из {total}",photo: true});
          });*/
          glass.colorbox({rel:"group-all-j38djd",opacity: 0.2, current: "Страница: {current} из {total}", photo: true, height: '100%'});

          //#MGEII-4077 пункт 1
          bigImg.click(function () {
              //показываем галерею
              glass.filter(".active").eq(0).click();
              return false;
          });

          glWrapper.width(xw);
        }


         $('body').on("click",'.printFile', function(event){
        //   event.stopPropagation();
            var $t = $(this),
                browser = navigator.userAgent.toLowerCase(),
                isIE = (browser.indexOf('msie') != -1) || (browser.indexOf("trident") != -1),
                cardId = $t.attr('data-card-id'),
                count = $t.attr('data-pages'),
                printIframe = function(node) {
                  node.contentWindow.focus();

                  if (isIE) { //IE
                    try {
                      node.contentWindow.document.execCommand('print', false, null);
                    } catch(e) {
                      node.contentWindow.print();
                    }
                  } else {
                    node.contentWindow.print();
                  }
                  node.parentNode.removeChild(node);
                },
                createTestIframe = function() {
                  return $('<iframe style="display: none;"></iframe>');
                };

            if (!count || count == 0) {
              alert('Нет нарезки для печати');
              return false;
            }

            tabInfo.showLoading();
            var iFrame = createTestIframe();
            iFrame[0].onload = function() {
              var iBody = iFrame.contents().find('body'),
                  len = 0,
                  startPrint = function() {
                    tabInfo.hideLoading();
                    printIframe(iFrame[0]);
                  },
                  incLen = function() {
                    len++;
                    if (len == count) {
                      startPrint();
                    }
                  },
                  img,
                  domain = window.location.protocol + '//' + window.location.hostname;

              iFrame.contents()[0].title = 'Print_document';
              //iFrame.contents().find('head title').text($t.parent().find('.prew-description-block p:first').text());

              if (!!count && count > 0) {
                for (var i=1; i<=count; i++) {
                  img = document.createElement('IMG');
                  img.onload = incLen;
                  img.src = domain + 'getImage.action?cardId=' + cardId + '&page=' + i;
                  img.style.width = '95%';
                  if (isIE) img.style.height = '95%';
                  img.style.display = 'block';
                  //if (i > 1) img.style.pageBreakBefore = 'always';
                  $(img).appendTo(iBody);
                }
              }
            };
            iFrame.appendTo('body');
         });

         // Проверка подписи
         $('a.checkECP').bind("click", function(event){
              $(this).checkECPPlugin();
          });


      });
    ]]>
</script>
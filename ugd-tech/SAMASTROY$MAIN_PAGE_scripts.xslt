<script type="text/javascript">
//<![CDATA[  
    var photos = [],
        countHide = 0;
      $(document).ready(function(){
      
      
      var isiPad = navigator.userAgent.match(/iPad/i) != null;

        if(isiPad){
        
            $('.mainDateScroll').css('overflow','scroll');        
        
        };

getImagesFotoScrolling(1, 8, true);
function getImagesFotoScrolling(from, to, first, action) {
	var fotoScroller = $('.fotoScroller');
    var options = {
            countVisible: 7,
            wrpStyle: '',
            checkChild: null
        }, 
        classer = '',
        gw = $(window).width()<=980 ? 980 : $(window).width();
    if(!first) {
        fotoScroller.append('<div id="timeLoaderPhotoOverlay"></div><img id="timeLoaderPhotoImg" src="img/loading2.gif" />');
        var tlpOvlay = $('#timeLoaderPhotoOverlay'),
            tlpImg = $('#timeLoaderPhotoImg');
        tlpOvlay.css({position: 'absolute', width: fotoScroller.innerWidth() +'px', height: fotoScroller.innerHeight()+'px', top: fotoScroller.position().top, left: fotoScroller.position().left, background: '#fff', opacity: 0.6});
        tlpImg.css({display: 'block', position: 'absolute', top: (fotoScroller.position().top + fotoScroller.innerHeight()/2) + 'px', left: '50%', marginLeft: '-33px', marginTop: '-33px'});
    }
    
    $.get('/ugd/getCardJson.action?cardId=SAMOSTROY$MAIN_PAGE_images&IAB$PHOTO='+from+'&IAB$PHOTO='+to, {}, function(data) {
        var d = JSON.parse(data);
        if(d.length>0) {
            for(var i=0;i<options.countVisible;i++) {
                photos.push(d[i]);
                /*if(action != null) {
                    options.checkChild = action.block.children(':first');
                    options.wrpStyle = ' style="width: '+(gw-192)/7+'px; height: '+(gw-192)/7+'px;"';
                }*/
                $('.fotoScrollingBlock').append('<div class="fotoWrapp"'+options.wrpStyle+'><img src="getThumb.action?page=1&amp;cardId='+d[i].photoId+'" height="100%" /><div class="fotoScrollTitle"><a href="/ugd/tabInfo.action?app=SAMOSTROY&amp;documentId='+d[i].docKey+'&amp;tab=SAMOSTROY_CARD">'+d[i].adrsamstr+'</a><div>'+d[i].photoType+'</div><div style="font-weight: normal;">'+d[i].photoDate+'</div></div></div>');
                $('.fotoWrapp').width((gw-192)/7);
                $('.fotoWrapp').height((gw-192)/7);
                if(i == d.length-1) break;
            }
            if(options.countVisible >= d.length) {
                photos.length = 0;
            }
            if(action != null) {
                action.block.width(((gw-192)/7)*$('.fotoWrapp').length+2);
                action.margin += (photos.length > 0) || (action.block.width() - action.margin - action.sw >= action.sw)
                    ? action.sw
                    : action.block.width() - action.margin - action.sw;
                $('.fotoWrapp img:last').load(function() {
                    action.block.animate({'margin-left': -action.margin }, 1000, function() {
                        action.arrow.removeClass('binactive');
                    });
                    countHide = action.margin / ((gw-192)/7);
                    tlpOvlay.add(tlpImg).remove();
                });
            }
            if(first) {
                initGallery();
            }
        }
    });
}
    
//ГАЛЕРЕЯ
function initGallery() {
    //ОПРЕДЕЛЕНИЕ РАЗМЕРОВ
    var specScrLength,
        scrBlockLength,
        specWidth,
        gWindowWidth,
        scrollMargin = 0,
        footerBlock = $('#mainPageFooterBlock'),
        fotoBlock = $('#mainPageFooterBlock .fotoScrollingBlock'),
        fotoWrapp = $('.fotoScrollingBlock .fotoWrapp'),
        arrows = $('.fotonext, .fotoprew');
      
    gWindowWidth = $(window).width()<=980 ? 980 : $(window).width();
      
    footerBlock.show();
    specWidth = sizeStreetMagic(gWindowWidth);
    specScrLength = scrBlockLength - specWidth;

    if(scrollMargin >= specScrLength) {
        $('.fotonext').css('display','none');
        $('.fotoprew').css('display','none');
    }

    $(window).resize(function() {
        var oldMargin = scrollMargin,
            oldBlockWidth = scrBlockLength;
        if($(window).width()<980) return false;
        gWindowWidth = $(window).width();
        specWidth = sizeStreetMagic(gWindowWidth);
        scrollMargin = countHide * specWidth/7;
        specScrLength = scrBlockLength - specWidth;
        fotoBlock.css('margin-left', -scrollMargin + 'px');
    });

     function sizeStreetMagic(a) {
        footerBlock.width(a-90);
        $('.fotoScrollingBlock .fotoWrapp').width((a-192)/7);
        $('.fotoScrollingBlock .fotoWrapp').height((a-192)/7);
        footerBlock.height((a-192)/7);
        $('.fotoScroller').width(a-192);
        arrows.css('line-height', arrows.height()+'px');
        fotoBlock.width(((a-192)/7)*fotoBlock.children().length+2);
        scrBlockLength = ((a-192)/7)*fotoBlock.children().length+2;
        return a-192;
    }
    //ПРОКРУТКА
    arrows.click(function(e) {
        $('#fotoCloneClone').remove();
        var target = $(e.target),
            scrollMargin = Math.abs(parseInt(fotoBlock.css('margin-left')));
        if(target.hasClass('binactive')) {
            return false;
        }
        target.addClass('binactive');
        if(target.hasClass('fotonext')) {
            if(photos.length > 0) {
                getImagesFotoScrolling(photos.length+1, photos.length+8, false, {arrow: target, block: fotoBlock, gw: gWindowWidth, sw: specWidth, margin: scrollMargin});
                return false;
            }
            scrollMargin += (fotoBlock.width() - scrollMargin - specWidth >= specWidth)
                ? specWidth
                : fotoBlock.width() - scrollMargin - specWidth;
        } else {
            scrollMargin = (scrollMargin >= specWidth)
                ? scrollMargin - specWidth
                : 0;
        }
        fotoBlock.animate({'margin-left': -scrollMargin }, 1000, function() {
            target.removeClass('binactive');
            countHide = scrollMargin / ((gWindowWidth-192)/7);
        });
    }).mouseenter(function() {
        $('#fotoCloneClone').remove();
    });
}
//ГАЛЕРЕЯ
      
      $('.fotoScrollingBlock').on('mouseenter', '.fotoWrapp', function(){

        $('#fotoCloneClone').remove();
        var fotoClone = $(this).children('.fotoScrollTitle').clone(true).show();
        var fotoCloneHeight = $(this).height();
        var fotoCloneWidth = $(this).width();
        
        var fotoLeft = $(this).position().left;
        var fotoTops = $(this).position().top;
        
        
        
        var fotoTitle =  $('<div id="fotoCloneClone" style="position: absolute;"></div>').width(fotoCloneWidth).height(fotoCloneHeight).css({'left' : fotoLeft+40,'top' : fotoTops+130}).append(fotoClone);
        
        
        
        $('body').append(fotoTitle);
        


        });
        
        
        
        $('#fotoCloneClone').live('mouseleave',function(){
            
            $('#fotoCloneClone').remove();
        
        });
      
      
      $('.firstPageBlock .map').width($('.diagrammBlock').width()+22);
        
        $('#mapFrame').width($('.diagrammBlock').width()+22);
      
      
            setTimeout( function(){
              
              $('.firstPageBlock .map').width($('.diagrammBlock').width()+22);
              $('#mapFrame').width($('.diagrammBlock').width()+22);
                
              },1000);
      
              $(window).resize(function(){
              
                $('.firstPageBlock .map').width($('.diagrammBlock').width()+22);
                $('#mapFrame').width($('.diagrammBlock').width()+22);
              
              });
      
      
              //$('.diagramm span').each(function(){$(this).attr("style",$(this).attr("style").replace(",","."))}); 
      
      
      //переключалка года
        
            if ($('.objectDestroy .firstRowDb span').eq(1).text() == ''){ $('.objectDestroy .firstRowDb span').eq(0).addClass('switchOff') };
        
            $('.objectDestroy .firstRowDb span').eq(1).hide();
            $('.objDestroyCountWrapper>div').eq(1).hide();


            $('.objectDestroy .firstRowDb span').click(function(){
            
            
            if ($(this).hasClass('switchOff')){ return false; };
            
                if($(this).index()==0){
                    $(this).hide();
                    $('.objDestroyCountWrapper>div').eq(0).hide();
                    $('.objDestroyCountWrapper>div').eq(1).show();
                    $('.objectDestroy .firstRowDb span').eq(1).show();
                } else if($(this).index()==1){
                    $(this).hide();
                    $('.objDestroyCountWrapper>div').eq(1).hide();
                    $('.objDestroyCountWrapper>div').eq(0).show();
                    $('.objectDestroy .firstRowDb span').eq(0).show();
                }
            
            });
            
          
      //переключалка года
      
      
      
      
      //календарик информации
      
      
       $('.dateMonthBlock .prew').click(function(){
       
            $('.mainPagedScrFace').height($('.dateScrolledObj.inf2').height());
            $(this).removeClass('prew').addClass('pdisable');
            $('.ndisable').removeClass('ndisable').addClass('next');
        
            $('.dateMonthBlock .month.m2').css('display','inline-block');
            $('.mainDateScroll .dateScrolledObj.inf2').css('display','block');
            $('.dateMonthBlock .month.m1').hide();
            $('.mainDateScroll .dateScrolledObj.inf1').hide();
    
            
        });
        
         $('.dateMonthBlock .next').live('click',function(){
         
            $('.mainPagedScrFace').height($('.dateScrolledObj.inf1').height());
            $(this).removeClass('next').addClass('ndisable');
            $('.pdisable').removeClass('pdisable').addClass('prew');
        
            $('.dateMonthBlock .month.m1').css('display','inline-block');
            $('.mainDateScroll .dateScrolledObj.inf1').css('display','block');
            $('.dateMonthBlock .month.m2').hide();
            $('.mainDateScroll .dateScrolledObj.inf2').hide();
    
            
        });
        
        //календарик информации
      
      
      
      //общая сумма диаграммы
        
            $('.mainPagedScrFace').height($('.dateScrolledObj.inf1').height());
            
            
            var red = Number($('.numbRed').text());
            var blue = Number($('.numbBlue').text())
            var aqua = Number($('.numbAqua').text())
            var green = Number($('.numbGreen').text())
            
            
            var mainValue = red+blue+aqua+green;
            
            $('#sumOfNumb').append(mainValue);
            
      //общая сумма диаграммы
      
      //размер галереи      
            
           // <!-- var windowWidth = $(window).width()-600;
//                var roundWin = windowWidth/160;
//                    roundWin = roundWin^0;
//                    windowWidth = roundWin*160;
                     
                   
          
                         
//             $('.fotoScroller').css('width',windowWidth+'px');
//             $('#mainPageFooterBlock .fotoBlock').css('width',(windowWidth+200)+'px');
            
//             $(window).resize(function(){
//                 var newWinWidth = $(window).width()-600;
                
//                     var roundWidth = newWinWidth/160;
//                     roundWidth = roundWidth^0;
//                     newWinWidth = roundWidth*160;
                
//                 $('.fotoScroller').css('width',newWinWidth+'px');
//                 $('#mainPageFooterBlock .fotoBlock').css('width',(newWinWidth+200)+'px');
//             });
//       //размер галереи
      
      
      
//       //прокрутка галереи
      
            
      
//         var newScrollWrappWidth = $('.fotoScroller').width();  
//         var scrollLength = (($('.fotoScrollingBlock').children().length)*165)-newScrollWrappWidth;
//         $('.fotoScrollingBlock').width(($('.fotoScrollingBlock').children().length)*165);
        
//         var scrollMargin = 0;
        
//         $('.fotonext').click(function(){
        
//          var newScrollWidth = $('#mainPageFooterBlock .fotoScrollingBlock').width();
         
//          newScrollWrappWidth = $('.fotoScroller').width();
         
//          if($('.fotonext').hasClass('act')){
         
           
                
//                 $('.fotonext').addClass('inac');
//                 $('.fotonext').removeClass('act');
                
//                 scrollMargin += newScrollWrappWidth;
                
//                 $('.fotoScrollingBlock').animate({'margin-left': -scrollMargin},300,function(){
                    
//                  if  (scrollLength <= scrollMargin){
                    
//                         $('.fotonext').addClass('inac');
//                         $('.fotonext').removeClass('act');
//                         return false;
//                         }
                        
//                         $('.fotonext').removeClass('inac');
//                         $('.fotonext').addClass('act');
                        
//                         $('.fotoprew').addClass('act');
                    
//                 });
            
            
//             }
//         });
        
        
//         $('.fotoprew').click(function(){
        
//          var newScrollWidth = $('#mainPageFooterBlock .fotoScrollingBlock').width();
         
//          newScrollWrappWidth = $('.fotoScroller').width();
         
         
//          if($('.fotoprew').hasClass('act')){
         
            
                
//                 $('.fotoprew').addClass('inac');
//                 $('.fotoprew').removeClass('act');
                
//                 scrollMargin -= newScrollWrappWidth;
                
//                 $('.fotoScrollingBlock').animate({'margin-left': -scrollMargin},300,function(){
                
//                     if  (scrollMargin <= 0){
                
//                       $('.fotoprew').addClass('inac');
//                       $('.fotoprew').removeClass('act');
                  
//                       return false;
                    
//                     } 
                    
//                     $('.fotoprew').removeClass('inac');
//                     $('.fotoprew').addClass('act');
                    
//                     $('.fotonext').addClass('act');
                
//                 });
            
//             }
            
//         });
        
        
        
        
//         var scrollHideWidth = $('.fotoScrollingBlock').width();
      
//         var scrollerTopWidth = $('.fotoBlock .fotoScroller').width();
      
//         if(scrollHideWidth < scrollerTopWidth){ $('.fotonext').removeClass('act').addClass('inac') };
      
//       //прокрутка галереи   -->   
            
            
              
      });
    //]]>
    </script>

    

     <script type="text/javascript">
//<![CDATA[
            
     $(document).ready(function() {
           try{
    
            var elem = $('.mainDateScroll')[0];
            var wrapHeight = elem.offsetHeight;
            var scrPositionFtop = 0;
            var scrHeight;
            var okH;
                               
                if (elem.addEventListener) {
                  if ('onwheel' in document) {
                    // IE9+, FF17+
                    elem.addEventListener ("wheel", onWheel, false);
                  } else if ('onmousewheel' in document) {
                    // устаревший вариант события
                    elem.addEventListener ("mousewheel", onWheel, false);
                  } else {
                    // 3.5 <= Firefox < 17, более старое событие DOMMouseScroll пропустим
                    elem.addEventListener ("MozMousePixelScroll", onWheel, false);
                  }
                } else { // IE<9
                  elem.attachEvent ("onmousewheel", onWheel);
                }
                
                } catch(e) {
                    return false;
                }

                function onWheel(e) {
                
                try{
                  e = e || window.event;
                  scrHeight = $('.dateScrolledObj').not(':hidden').height();
                  
                  if (scrHeight < wrapHeight) return;
                  
                  okH = scrHeight - wrapHeight;
                  
                  var scrSpeed = 10;
                  

                  // wheelDelta не дает возможность узнать количество пикселей
                  var delta = e.deltaY || e.detail || -e.wheelDelta;
                  

                    if (e.ctrlKey == true) scrSpeed = 100;
                    if (delta > 0){
                    
                        delta = 3;
                        
                    } else {
                    
                        delta = -3;
                    
                    };
                    scrPositionFtop += delta*scrSpeed;

                    if (scrPositionFtop < 0 ) scrPositionFtop = 0;

                    if (scrPositionFtop > okH) scrPositionFtop = okH;



                    $('.dateScrolledObj').not(':hidden').css('margin-top', -scrPositionFtop+'px');

                    if (scrPositionFtop == 0 || scrPositionFtop == okH) return;
                    
                  e.preventDefault ? e.preventDefault() : (e.returnValue = false);
                  
                  } catch(e) {
                    return false;
                  }
                }

        });

                              
//]]>
    </script>
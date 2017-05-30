
<script type="text/javascript">
   
//<![CDATA[

    function generateFrame(_id) {
        var thisFrame = document.getElementById('mapFrame');
//        var mapSrc = 'http://isio.stroy.mos.ru/op/mapviewer/?app=PortalObjectCard&ids='+_id;
//  Семенец 2013-05-08, убрал абсолютную ссылку, чтобы корректно отображалась на grad.mos.ru
       // if(window.location.href.indexOf('grad.mos.ru') == -1){
        //  var mapSrc = 'https://ugd.mos.ru/op/mapviewer/?app=PortalObjectCard&ids='+_id;
       // }else{
          var mapSrc = 'https://ugd.mos.ru/op/mapviewer/?app=PortalObjectCard&ids='+_id;
          //var mapSrc = 'https://ugd.mos.ru/map/mapinfo.show_minimap?objrs=' + _id + '&z=9';
        //}
          
        var tmpFrame = $('<iframe></iframe>');
        var newMapWidth = ($(window).width() <= 1024) ? 282 : 360;        
       
        tmpFrame.attr({'id':'mapFrame','src':mapSrc,'frameborder':'no'}).width(newMapWidth+2);
        $('#mapImg').width(newMapWidth).append(tmpFrame);
    }
                                    
    $(function(){
        
        function setHoverSpLink(hoverObject) {    //Определение стиля курсора и цвета ссылки для IE
            $(hoverObject).hover(function(){
                $('body').css('cursor', 'pointer');
            }, function() {
                $('body').css('cursor', 'default');
            });
        }
    
        //Изменение стилей при наведении курсора на превьюшки фотографий и АГР
        //Более тяжёлый вариант функции (setPicStyleImg()) см. в портале - файл tab_utilsSp.js
        function setPicStyleImgLight(hoverObject) {
            $(hoverObject).hover(function(){                        //Определение стилей при наведении курсора
                $('body').css('cursor', 'pointer');                 //Курсор
                $(this).css("border", "1px solid #8BB2FF");         //Рамка картинки (синий)
            }, function() {
                $('body').css('cursor', 'default');
                $(this).css("border", "1px solid #FFFFFF");          //Удаление рамки картинки
            });
        }
        
        //Подключение функции подсветки к превьюшкам изображений (формирование превьюшек в файле #SP_OBJECT#obj_card_templates)
        setPicStyleImgLight(".spComPicImg");
        
        $("#photoTab .spComPicImg").click(function() {
            var linkHref = $(this).attr("href");
            openNewWinSP(linkHref, 'name1');
        });
        
        $("#projPicTab .spComPicImg").click(function() {
            var linkHref = $(this).attr("href");
            openNewWinSP(linkHref, 'name1');
        });
        
        //Изменение видимости раздела 'Технико-экономические показатели' при клике на заголовок раздела
        var showFlagTep = false;
        $("#tepTitleWrap").click(function() {
            if (!showFlagTep) {
                $(".tepDataRow").css("display", "table-row");
                $(this).attr("title", "Скрыть показатели");
                showFlagTep = true;
            } else {
                $(".tepDataRow").css("display", "none");
                $(this).attr("title", "Вывести показатели");
                showFlagTep = false;
            }
        });
        
        
        
        //Изменение видимости раздела 'Распорядительные документы' при клике на заголовок раздела
        var showFlagDoc = false;
        $("#docTitleWrap").click(function() {
            var self = $(this).closest("table");
            if (!showFlagDoc) {
                self.find(".spObjRdRow").css("display", "table-row");
                $(this).attr("title", "Скрыть показатели");
                showFlagDoc = true;
            } else {
                self.find(".spObjRdRow").css("display", "none");
                $(this).attr("title", "Вывести показатели");
                showFlagDoc = false;
            }
        });
        
        
        setHoverSpLink("#tepTitleWrap"); //Определение стиля курсора при наведении на надпись 'Технико-экономические показатели'
        
        //Вывод отдельного окна при нажатии на ссылку "Печать"
        $("#printLink").click(function() {
            var prContent = '';
            var printMapSize = "";
            if ($.browser.msie) {
                var addMapStyle = "#mapFrame { height:440px !important; width:700px !important; }";
                addMapStyle += "#mapImg { height:436px !important; width:696px !important; }"
                printMapSize = "width=696&height=436&psIdentifier";
            } else {
                var addMapStyle = "#mapImg, #mapFrame { height:440px !important; width:700px !important; }";
                printMapSize = "width=700&height=440&psIdentifier";
            }
            addMapStyle += ".spObjBuildTitle { padding-bottom:0px; padding-top:0px; }";
            addMapStyle += "#printMainWrap { padding-left:40px; }";
            addMapStyle += "#mapImg { margin-left:2px; }";
            addMapStyle += "#printMainWrap, #printMainWrap .innerTable { width:705px; }";
            addMapStyle += "#objPrintHead { background: transparent url(img/header_bg.jpg) repeat-x left top; height: 66px; width: 100%; }";
            addMapStyle += ".logoPic { position:absolute; top:0px; left:0px; z-index:3; }";
            addMapStyle += ".headBackPic { z-index:0; }";
            addMapStyle += ".spObjStatusCell { vertical-align:middle; }";
            addMapStyle += ".regB_PlanStr a { color:#888888; text-decoration:none; }";
            addMapStyle += ".orgTabIcon { background: transparent url(img/isio/dirIcon.gif) no-repeat scroll 0 3px; }"; //REMOVE AFTER CORRECT DYNAMIC LOAD IMG-SRC
            addMapStyle += ".orgTabLeft { background: transparent url(img/sp/dots.gif) repeat-x scroll 0 14px; width: 248px; }";
            addMapStyle += ".spObjRdGradient { display:none; }";
            addMapStyle += ".spObjRdRow td { vertical-align:top; }";
            addMapStyle += ".rsoRdText, .spRdText { width:99%; }";
            addMapStyle += ".spRdTextWrap, .spRdText, .spRdInfo, .rdInfo div, .spRdInfo div, .spObjContent2 div { height:auto !important; }";
            addMapStyle += ".regB_PlanStr { font-weight:bold; padding-left:3px; }";
            addMapStyle += ".regB_PlanStr a { font-weight:normal; }";
            addMapStyle += ".spObjHeadTab { margin-top:8px; margin-bottom:8px; }";
            addMapStyle += ".orgTabIcon img { margin-left:-8px; margin-bottom:2px; }";
            addMapStyle += ".orgTabIcon { width:22px; text-align:left; border-left:0px none; }";
            addMapStyle += ".spIconRdCell { vertical-align:top; padding-top:5px; }";
            addMapStyle += ".regTepTitleRow .regTepRowTitle, .regTepDataRow .regTepRowProj, .regTepDataRow .regTepRow { font-weight:bold; }";
            addMapStyle += ".regTepDataRow .regTepRowTitle, .regTepDataRow .regTepRowProj, .regTepDataRow .regTepRow { vertical-align: top; }";
            
            prContent = '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">';
            prContent += "<html><head>";
            prContent += $(document).find("head").html();
            prContent += "<style>" + addMapStyle + "</style>";
            prContent += "<style>" + $("body").find("style").html() + "</style>";
            prContent += "<script>";
            prContent += "function photoScale() { $('#prPhoto').attr('width','250').css('display', 'block'); }";
            prContent += "function printIcons() { $('.orgTabIcon').each(function() { var imgSrc = $(this).css('background-image').split(\'portal/\')[1].split('gif')[0] + 'gif'; $(this).append('<img src=' + imgSrc + '>'); }); }";
            prContent += "function printDocIcons() { $('.spIconCell, .spIconRdCell').each(function() { var imgSrc = $(this).css('background-image').split(\'portal/\')[1].split('gif')[0] + 'gif'; $(this).empty().append('<img src=' + imgSrc + '>'); $(this).css({'background':'none'}); }); }";
            prContent += "<\/script>";
            prContent += "</head><body onload='photoScale(); printIcons(); printDocIcons();'>";
            prContent += "<div class='headerTop'>";
            prContent += "<img class='logoPic' alt='Строительный Комплекс Правительства Москвы' src='img/logo.gif'/></div><div id='printMainWrap'>";
            
            if ( $(document).find(".strutStick").length > 0 ) {
                var headPrintContent = $(document).find(".strutStick").clone();
                prContent += $(headPrintContent).html();
            }
            
            if ( $(document).find("#leftSection").length > 0 ) {
                prContent += $(document).find("#leftSection").html(); //LAST NORM WITHOUT change content
            }
            prContent += "<div style='height:1px;border-top:1px solid #CFCFCF;'></div>"; //Разделитель перед картой
            
            //Формирование содержимого для нижнего подраздела (карта + фотографии + ход строительства)
            if ( $(document).find("#mapImg").length > 0 ) {
                var printMapContent = $(document).find("#mapImg").clone();
                
                var originalSrc = $(printMapContent).children("iframe").attr("src");
                var splitResBeforW = originalSrc.split("width")[0];
                // var splitResLast = originalSrc.split("psIdentifier")[1]; //Norm for OLD Maps
                var splitResLast = originalSrc.split("appID")[1];
                var finalResult = splitResBeforW + printMapSize + splitResLast;
                $(printMapContent).children("iframe").attr("src", finalResult); //Переопределение URL карты для изменения размеров
                
                prContent += "<div id='mapImg' class='spObjMapWrap'>" + $(printMapContent).html() + "</div>"; //Добавление карты в выводимый HTML
                prContent += "<div style='height:1px;border-top:1px solid #CFCFCF;margin-top:10px;margin-bottom:5px;'></div>"; //Разделитель после карты
            }
            
            prContent += "<table><tbody><tr>";
            if ($(document).find("#photoTab").length > 0) {
                var imgSrc = $(document).find("#photoTab").find(".spObjPicCell:first").find('.spComPicImg').attr('src');
                var imgSrcClear = imgSrc.split("cardId=")[1];
                //Формирование фотографии. Изображение берётся в оригинале и масштабируется при открытии страницы (см. функцию "onload" в теге "body" выше)
                prContent += "<td style='padding-right:8px;'><img id='prPhoto' style='display:none;' src='getImage.action?cardId=" + imgSrcClear + "&page=1'/></td>";
            }
            
            if ($(document).find("#spObjBuildProc").length > 0) {
                prContent += "<td style='vertical-align:top;'>" +$(document).find("#spObjBuildProc").html() + "</td>";
            }
            prContent += "</tr></tbody></table>";
            prContent += "<div style='width:100%; padding-bottom:20px;'></div>";
            prContent += "</div><div id='printBottomEl' style='height:20px; width:100%; background-color: #FFFFFF; border:0px none;'></div></body></html>";

            printWindow = window.open("","","height=800,width=800,top=10,left=10,menubar=yes,status=yes,toolbar=yes,scrollbars=yes,resizable=yes,status=1");
            printWindow.document.write(prContent);
            printWindow.document.close();
            printWindow.focus();
        });
        
        if ($(window).width() <= 1024) {
        
            $('img#object3D').removeAttr("width").removeAttr("height").css({ width: "", height: ""}).width(285);
            
            
            if ($('iframe.videoIframe').length >0){
                var wCamSRC = $('iframe.videoIframe').attr('src');                
                wCamSRC = wCamSRC.replace('wCams=360','wCams=282').replace('hCams=236','hCams=187');
                $('iframe.videoIframe').css({width:'284px',height:'190px'}).attr('src',wCamSRC);
            }        
        
        }
        
        
        
        
        if($(window).width() <= 1024) {
            $("#rightSection").css("width", "282px");
            $(".spObjImgWrap").css({
                "border": "0px none",
                "height": "auto"
            });
            $(".spObjPicCell").css({
                "height": "auto",
                "padding-left": "0px"
            });
            $("#spObjBuildProc").removeAttr("id").css("padding-top", "0px");
            
            var currentWidth;
            var currentHeight;
            var resultMas;            
           
            var objImgList = $(".spObjImgWrap > img");
            $.each(objImgList, function(i, l) {
                currentWidth = $(this).width();
                currentHeight = $(this).height();
                
                if (currentWidth != 0) {            
                    $(".rightSectTitle").css("margin-left", "4px");
                    $(this).width( $(this).width()/1.111 ).height( $(this).height()/1.111 );               
                }
            });
            
        }
        
        
    });
    
        //Масштабирование правой части при открытии страницы
    $(window).load(function () {
        newImgWidth = ($(window).width() <= 1024) ? 135 : 175;        
        $('.spComPicImg').each(function(){
            $(this).removeAttr('width').removeAttr('height').css({ width: "", height: "" });                
            ($(this).width()>$(this).height())? $(this).attr('width',newImgWidth):$(this).attr('height',newImgWidth);            
        });  
    });
    
  
   var videoCamZayav, videoCamJurnal;;
    function openVideoCamZayavWindow (_zayavLink, _zayavId) {
        var _params = 'toolbar=yes,location=yes,directories=yes,status=yes,menubar=yes,scrollbars=yes,copyhistory=yes,resizable=yes';
        videoCamZayav = open(_zayavLink+_zayavId,'','');    
    }
    function openVideoJurnal (_vjrCamId, _vjrObjId) {
        var _params = 'width=1000,height=700,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,copyhistory=no,resizable=no';        
        videoCamJurnal = open('htmlcardbody.action?documentId=VJR:' + _vjrCamId + ':' + _vjrObjId + '&pageId=VIDEO_JURNAL$main','_blank',_params); 
    }
//]]>
</script>

    
    
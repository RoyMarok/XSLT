<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="utf-8" indent="no"/>

    <xsl:template match="/">

        <xsl:variable name="ARTICLE" select="//KB_ARTICLE//ARTICLE"/>
        <xsl:variable name="BTN_GRANTS" select="//KB_BUTTON_GRANTS//ROW[1]"/>

        <!--div class="kb-breadcrumbs">
          <ul>
            <li>База знаний</li>
            <xsl:for-each select="$ARTICLE/BREADCRUMBS/BREADCRUMB">
              <li><xsl:value-of select="text()"/></li>
            </xsl:for-each>
            <li><xsl:value-of select="$ARTICLE/NAME"/></li>
          </ul>
        </div-->
        <div class="kb-card">
          <div class="kb-article-head">
            <h1><xsl:value-of select="$ARTICLE/NAME"/></h1>
            <ul class="kb-article-tags">
              <xsl:for-each select="$ARTICLE/TAGS/TAG">
                <li class="kb-article-tag">
                    <a style="background-color: #{NORMAL_COLOUR_BG}; color: #{NORMAL_COLOUR_FONT}" href="#{ID}" onmouseenter="this.style.backgroundColor = '#{HOVER_COLOUR_BG}'; this.style.color = '#{HOVER_COLOUR_FONT}'" onmouseleave="this.style.backgroundColor = '#{NORMAL_COLOUR_BG}'; this.style.color = '#{NORMAL_COLOUR_FONT}'">
                      <span><xsl:value-of select="NAME"/></span>
                    </a>
                </li>
              </xsl:for-each>
            </ul>
            <div class="kb-status-block">
                <div class="kb-status-element">Статья актуальна <div class="kb-status-i"></div></div>
            </div>
            <div class="kb-status-target" style="display: none;">
              <div class="kb-article-info">
                <table>
                    <tr>
                        <td>
                            <span>Автор</span>
                            <xsl:value-of select="$ARTICLE/CREATE_BY"/>
                        </td>
                        <td>
                            <span>Автор изменений</span>
                            <xsl:value-of select="$ARTICLE/CREATE_DATE"/>
                        </td>
                        <td>
                            <span>Создано</span>
                            <xsl:value-of select="$ARTICLE/CREATE_BY"/>
                        </td>
                        <td>
                            <span>Актуализированно</span>
                            <xsl:value-of select="$ARTICLE/MODIFY_DATE"/>
                        </td>
                    </tr>
                </table>
              </div>
            </div>

            <div class="cardHeaderButtonBar">
                <div class="rDropWrapper buttonIcon">
                    <div class="rDrop"><img src="/portal_static/img/redesign/settings.png"/></div>
                    <!--div class="rDropTarget" style="display: none;"-->
                        <ul class="kb-actions-list rDropTarget">
                            <xsl:if test="$BTN_GRANTS/HASADDARTICLE = 1">
                                <li><a class="kb-action-add newWindowData" widthwin="1000" heightwin="700" link="/ugd/getCardHtml.action?cardId=FORM$KNOWELGE_BASE$ARTICLE">Добавить статью</a></li>
                            </xsl:if>
                            <xsl:if test="$BTN_GRANTS/HASEDITARTICLE = 1">
                                <li><a class="kb-action-edit newWindowData" widthwin="1000" heightwin="700" link="/ugd/getCardHtml.action?cardId=FORM$KNOWELGE_BASE$ARTICLE&amp;documentId={$ARTICLE/ID}">Редактировать</a></li>
                            </xsl:if>
                            <xsl:if test="$ARTICLE/TYPE = 'DEV_PROC'">
                                <li><a class="kb-action-params" data-fancybox="" data-src="#paramCorr" href="javascript:;">Уточнить параметры</a></li>
                            </xsl:if>
                            <xsl:if test="$BTN_GRANTS/HASDELETEARTICLE = 1">
                                <li><a class="kb-action-delete">Удалить</a></li>
                            </xsl:if>
                        </ul>
                    <!--/div-->
                </div>
            </div>

          </div>
          <!--div class="kb-article-info">
            <div class="kb-actions">
              <span>Мои действия</span>
              <ul class="kb-actions-list">
                <xsl:if test="$BTN_GRANTS/HASADDARTICLE = 1">
                  <li><a class="kb-action-add newWindowData" widthwin="1000" heightwin="700" link="/ugd/getCardHtml.action?cardId=FORM$KNOWELGE_BASE$ARTICLE">Добавить статью</a></li>
                </xsl:if>
                <xsl:if test="$BTN_GRANTS/HASEDITARTICLE = 1">
                  <li><a class="kb-action-edit newWindowData" widthwin="1000" heightwin="700" link="/ugd/getCardHtml.action?cardId=FORM$KNOWELGE_BASE$ARTICLE&amp;documentId={$ARTICLE/ID}">Редактировать</a></li>
                </xsl:if>
                <xsl:if test="$BTN_GRANTS/HASDELETEARTICLE = 1">
                  <li><a class="kb-action-delete">Удалить</a></li>
                </xsl:if>
              </ul>
            </div>
            <table>
              <tr>
                <td>
                  <span>Автор</span>
                  <xsl:value-of select="$ARTICLE/CREATE_BY"/>
                </td>
                <td>
                  <span>Автор изменений</span>
                  <xsl:value-of select="$ARTICLE/CREATE_DATE"/>
                </td>
                <td>
                  <span>Создано</span>
                  <xsl:value-of select="$ARTICLE/CREATE_BY"/>
                </td>
                <td>
                  <span>Актуализированно</span>
                  <xsl:value-of select="$ARTICLE/MODIFY_DATE"/>
                </td>
              </tr>
            </table>
          </div-->
          <div class="kb-article-body">
            <div class="kb-article-contents">
              <div id="contents"></div>
            </div>
            <div class="kb-article-text" id="articleMd"><xsl:value-of select="$ARTICLE/MARKDOWN"/></div>
          </div>
       </div>
        <xsl:if test="$ARTICLE/TYPE = 'DEV_PROC'">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.0.47/jquery.fancybox.min.css" />
            <script src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.0.47/jquery.fancybox.min.js"></script>
<style>
.paramCorrectionForm{
    padding: 0;
    padding-bottom: 20px;
    min-width: 450px;
    overflow: hidden;
}
.paramCorrectionForm .formElement{
    padding: 0 30px;
}
.paramCorrectionForm .formElement .elementHeader{
    padding: 10px 0;
    font-weight: bold;
}
.paramCorrectionForm h3{
    padding: 20px;
    text-transform: uppercase;
    background-color: #169bd5;
    color: white;
    font-weight: bold;
    font-size: 20px;
}


.blueButton{
    display: inline-block;
    padding: 15px 32px;
    background-color: #169bd5;
    margin: 0 auto;
    text-decoration: none;
    color: white;
    border-radius: 3px;
    transition: all .3s;
    cursor: pointer;
}
.blueButton:hover{
    background-color: #0072ff;
}

.paramCorrectionForm .blueButton{
    margin-top: 20px;
}

.control {
    font-size: 15px;
    position: relative;
    display: block;
    padding-left: 30px;
    cursor: pointer;
    line-height: 26px;
}

.control input {
    position: absolute;
    z-index: -1;
    opacity: 0;
}
.control__indicator {
    position: absolute;
    top: 2px;
    left: 0;
    width: 20px;
    height: 20px;
    background: #fff;
    border: 1px solid #7b838e;
    box-sizing: border-box;
    overflow: hidden;
}
.control__radio .control__indicator {
   border-radius: 50%;
}
/* hover */
.control:hover input ~ .control__indicator {
    background: #fff;
    border: 1px solid #7b838e;
}
/* checked */
.control input:checked ~ .control__indicator {
    background: #fff;
    border: 1px solid #319adc;
}
/* check mark */
.control__indicator:after {
    position: absolute;
    content: '';
}


.control__radio .control__indicator:after {
    top: 7px;
    left: 7px;
    width: 6px;
    height: 6px;
    border-radius: 50%;
    background: #fff;

}
.control__radio input:checked ~ .control__indicator {
  border: 1px solid #7b838e;
}

.control__radio input:checked ~ .control__indicator:after {
    width: 10px;
    height: 10px;
    top: 4px;
    left: 0;
    right: 0;
    background-color: #007aff;
    border-radius: 50%;
    margin: 0 auto;
    animation: radio-on .3s forwards;
}
/* radio animation */
@-webkit-keyframes radio-on {
    0% { opacity: .3; transform: scale(.1);}
    50% { opacity: .7; }

    80% {transform: scale(1.1);}
    100% { opacity: 1; transform: scale(1);}
}
keyframes radio-on {
    0% { opacity: .3; transform: scale(.1);}
    50% { opacity: .7; }
    80% {transform: scale(1.1);}
    100% { opacity: 1; transform: scale(1);}
}
.fancybox-close-small{
    top: 12px;
    right: 12px;
}
.fancybox-close-small:after{
    color: white;
    background: none;
    font-size: 30px;
    transition: all .3s;
}
.fancybox-close-small:hover:after{
    transform: rotate(360deg);
    background: none;
    transition: all .3s;
    color: white;
    /*background-color: #058fcc;*/

}
.kb-article-contents{
    position: relative;
}
.kb-bottom{
    display:inline-block;
    position: absolute;
    bottom: 0;
}
</style>





            <div class="paramCorrectionForm" id="paramCorr" style="display: none;">
                <h3>Уточнение параметров</h3>
                <div class="formElement">
                    <div class="elementHeader">Назначение объекта</div>
                    <ul>
                        <li><label class="control control__radio">Индививдуальное жил строительство<input type="radio" name="element_01"/></label></li>
                        <li><label class="control control__radio">Многосекционный<input type="radio" name="element_01"/></label></li>
                        <li><label class="control control__radio">Для проживания граждан<input type="radio" name="element_01"/></label></li>
                        <li><label class="control control__radio">Для производственной деятельности<input type="radio" name="element_01"/></label></li>
                    </ul>
                </div>
                <div class="formElement">
                    <div class="elementHeader">Этажность</div>
                    <ul>
                        <li><label class="control control__radio">До 2 этажей<input type="radio" name="element_02"/></label></li>
                        <li><label class="control control__radio">2-3 этажа<input type="radio" name="element_02"/></label></li>
                        <li><label class="control control__radio">3-10 этажей<input type="radio" name="element_02"/></label></li>
                        <li><label class="control control__radio">Больше 10 этажей<input type="radio" name="element_02"/></label></li>
                    </ul>
                </div>
                <div class="formElement">
                    <div class="elementHeader">Тип проекта</div>
                    <ul>
                        <li><label class="control control__radio">Типовой проект<input type="radio" name="element_03"/></label></li>
                        <li><label class="control control__radio">Технически сложный<input type="radio" name="element_03"/></label></li>

                    </ul>
                </div>
                <div style="text-align: center"><div class="blueButton">Сохранить</div></div>

            </div>
        </xsl:if>
       <script>



       var converter = new showdown.Converter(),
           $container = $('#articleMd'),
           articleHTML = converter.makeHtml($('#articleMd').text());

        $container.empty().html(articleHTML);

        buildContents(articleHTML);
        affix();

        changeUrl(window.location.href);

        $('.kb-action-delete').on('click', function(){
          if (confirm('Вы действительно хотите удалить эту статью?')) {
            //window.location.href =
            window.open('/ugd/submit/simpleSubmit.action?action=knowledge_base.delete_article&amp;ARTICLE_ID=<xsl:value-of select="$ARTICLE/ID"/>', '', '');
          }
        });


          function changeUrl(url) {
            var newURL,
                state = {},
                title = '<xsl:value-of select="$ARTICLE/NAME"/>',
                a = getLocation(url),
                params = urlToObject(a.search);

            params.documentId = '<xsl:value-of select="$ARTICLE/ID"/>';
            newURL = a.pathname + '?' + objectToURL(params) + a.hash;
            window.history.pushState(state, title, newURL);
          }
          <xsl:text disable-output-escaping="yes">
          <![CDATA[
          function buildContents(html) {
            if (!html) return;

            var $list,
                $container = $('#contents');

            $container.append('<h2>Содержание</h2><nav><ol></ol></nav>');
            $list = $container.find('ol');

            $(html + ' :header').each(function() {
              var item,
                  $this = $(this),
                  tag = $this[0].tagName,
                  title = $this.text(),
                  id = $this.attr('id');

              item =
                '<li class="' + tag + '">' +
                  '<a data-id="' + id + '" href="#">' + title + '</a>' +
                '</li>';

              if (tag === 'H1') {
                $list.append(item)
              }
              if (tag === 'H2') {
                var $lastH1 = $list.find('.H1').last(),
                    $nestedList = ($lastH1.find('ol').length) ? $lastH1.find('ol') : $lastH1.append('<ol />').find('ol');
                $nestedList.append(item)
              }
            });
          }

          $('#contents a').on('click', function(e){
            e.preventDefault()
            var $this = $(this),
                $elem =  $('#' + $this.data('id')),
                offsetTop;

            if ($elem.length) {
              offsetTop = $elem.offset().top - 78;
              $('html, body').animate({ scrollTop: $elem.offset().top - 68}, 'fast', function() {
                if (offsetTop > $(document).scrollTop() + 20) {
                  $elem.fadeOut(100).fadeIn(100);
                }
              });
            } else {
              $('html, body').animate({ scrollTop: $('#articleMd').offset().top - 78}, 'fast')
            }


          });

          $('.kb-status-i').hover(function() {
              $('.kb-status-target').stop().fadeIn(200);
          }, function() {
              $('.kb-status-target').stop().fadeOut(200);
          });

          $('.cardHeaderButtonBar .rDropWrapper').ricosDrop({targetPosition: 'right bottom'});


          function affix() {

            var $container = $('#contents'),
                offsetTop = $container.offset().top,
                containerWidth = $container.width()

            $(document).on('scroll', function(){
              if ($(this).scrollTop() > offsetTop - 68) {
                $container.removeClass('kb-bottom');
                $container.addClass('kb-fixed').css({width: containerWidth + 'px'});
                var winH = window.innerHeight;
                var topS = $(document).scrollTop();
                var w = {
                    height: $('.kb-article-body').height(),
                    top: $('.kb-article-body').offset().top
                };
                var c = {
                        top: parseInt($('.kb-article-contents>div').css('top')),
                        height: $('.kb-article-contents>div').height(),
                        obj: $('.kb-article-contents>div')
                    };
                w['bottom'] = w.top+w.height-topS;
                c['bottom'] = c.top+c.height;
                console.log('w[bottom] '+w['bottom']);
                console.log('c[bottom] '+c['bottom']);
                if (w['bottom'] < c['bottom']){
                    c.obj.removeClass('kb-fixed');
                    c.obj.addClass('kb-bottom');
                }
              } else {
                $container.removeClass('kb-fixed').css({width: 'auto'});
              }
            });


          }

            $('.paramCorrectionForm input[type="radio"]').each(function(indx, elm){
                var $radioAdd = $('<div></div>');
                $radioAdd.addClass('control__indicator');
                $(elm).after($radioAdd);

            });


        ]]>
        </xsl:text>
       </script>
        <xml style="display: none">
          <xsl:copy-of select="*"/>
        </xml>
    </xsl:template>
</xsl:stylesheet>

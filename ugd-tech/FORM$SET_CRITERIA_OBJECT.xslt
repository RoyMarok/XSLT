<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="utf-8" indent="no"/>

    <xsl:template match="/">
		<link rel="stylesheet" href="/static/slickSlider/slick.css"/>
		<style>
			body {
				background-image: url(/portal_static/img/procedure_icons/background.png);
				-webkit-background-size: cover;
				background-size: cover;
      }
      div#secondMenu,
      #tabs-container {
        display: none;
      }
      .fco-main {
        position: relative;
        width: 1113px;
        margin: 40px auto 0;
      }
      .fco-steps {
        background-color: #26374A;
        padding: 30px 0;
        width: 319px;
        position: absolute;
        top: 0;
      }
      .fco-steps ol {
        list-style-type: none;
        padding: 0;
        margin: 0;
        counter-reset: list;
      }
      .fco-steps ol li {
        position: relative;
        padding-left: 43px;
        height: 26px;
        line-height: 26px;
        margin: 24px 0 24px 29px;
        opacity: .7;
        font-size: 18px;
        color: #fff;
        cursor: default;

      }
      .fco-steps ol li::before,
      .fco-steps ol li::after {
        width: 26px;
        height: 26px;
        display: block;
        position: absolute;
        left: 0;
        text-align: center;
        border-radius: 50%;
        top: 50%;
        margin-top: -13px;
        background: #fff;
        color: #26374A;
        font-weight: bold;
      }
      .fco-steps ol li::after {
        content: '';
        background-color: #61BC47;
        display: none;
        background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAALCAMAAAB4W0xQAAAAPFBMVEUAAAD+/v7////////+/v7+/v7+/v7+/v7+/v7+/v7////////+/v7+/v7+/v7+/v7+/v7+/v7+/v7///+R8a7jAAAAE3RSTlMA8zsEqvuPb1TXQgzfw7ezn4tkOtkPjAAAAEVJREFUCNdNx0sSgCAMBNFBIAL+nfvf1ZQVCL3pevC2646TDjINxZPkDrT3V1KFBSVTXKh6GcJKrZrMJndu6ImqwHtC1wdA4wPi8iwnEAAAAABJRU5ErkJggg==');
        background-position: center center;
        background-repeat: no-repeat;
      }
      .fco-steps ol li::before {
        content: counter(list);
        counter-increment: list;
        display: inline-block;
        margin-right: 20px;
      }
      .fco-steps ol li.fco-steps__current {
        opacity: 1;
      }
      .fco-steps ol li.fco-steps__checked {
        opacity: 1;
      }
      .fco-steps ol li.fco-steps__checked span {
        cursor: pointer;
      }
      .fco-steps ol li.fco-steps__checked::after {
        display: block;
      }
      .fco-steps ol li.fco-steps__checked::before {
        background-color: transparent;
      }
      .fco-content {
        width: 794px;
        margin-left: 319px;
        background-color: #fff;
        -webkit-box-shadow: 0px 15px 42px 0px rgba(0,0,0,0.33);
        -moz-box-shadow: 0px 15px 42px 0px rgba(0,0,0,0.33);
        box-shadow: 0px 15px 42px 0px rgba(0,0,0,0.33);
      }
      .fco-sections {
        position: relative;
      }
      .fco-section {
        padding: 17px 26px;
        background: #F2F4F7;
        display: none;
        height: auto;
        outline: none;
      }
      .fco-buttons {
        padding: 0 36px 27px;
        background: #F2F4F7;
        position: relative;
        /*margin-top: -69px;*/
        display: none;
        -webkit-transition: margin-top .3s, opacity .3s;
        -o-transition: margin-top .3s, opacity .3s;
        transition: margin-top .3s, opacity .3s;
        z-index: 1;
      }
      .fco-buttons.fco-buttons--visible {
        /*margin-top: 0;*/
        /*opacity: 1;*/
        display: block;
      }
      .fco-buttons::before,
      .fco-buttons::after {
        content: '';
        display: table;
        clear: both;
      }
      .fco-back,
      .fco-next {
        display: block;
        width: 120px;
        line-height: 38px;
        text-align: center;
        font-size: 16px;
        border: none;
        cursor: pointer;
        outline: none;
        border: 1px solid transparent;
        position: static;
      }
      .fco-back {
        float: left;
        color: #4364C8;
        background-color: transparent;
      }
      .fco-back:hover {
        background-color: #fff;
        border-color: #D9DBDD;
      }
      .fco-next {
        float: right;
        color: #fff;
        background-color: #319ADC;
      }
      .fco-next:hover {
        background-color: #2F91FB;
      }
      .fco-submit {
        display: block;
        width: 267px;
        line-height: 38px;
        text-align: center;
        font-size: 15px;
        border: none;
        cursor: pointer;
        outline: none;
        background-color: #319ADC;
        margin: 20px auto 0;
        color: #fff;
      }
      .fco-submit:hover {
        background-color: #2F91FB;
      }
      .fco-section.obj-category {
        background: #fff;
      }
      .fco-section::before,
      .fco-section::after {
        content: '';
        display: table;
        clear: both;
      }

      .fco-param-row {

      }

      .fco-cols1  {

      }
      .fco-cols2  {
        display: -webkit-flex;
        display: -ms-flexbox;
        display: flex;
        overflow: hidden;
      }
      .fco-cols2 .fco-param {
        flex: 1;
      }


      .fco-clear::before,
      .fco-clear::after {
        content: '';
        display: table;
        clear: both;
      }
      .fco-param {
        border: 1px solid #e6e7eb;
        background: #fff;
        padding: 9px 9px 18px;
        margin: 10px;
      }
      .fco-param-header {
        display: table;
        background-position: left center;
        background-repeat: no-repeat;
        height: 55px;
        border-collapse: collapse;
        margin-bottom: 9px;
      }
      .fco-param-header h2 {
        display: table-cell;
        vertical-align: middle;
        font-size: 18px;
        font-weight: bold;
        color: #333;
        padding-left: 64px;
      }
      .fco-radio {
        position: relative;
        display: block;
        z-index: 1;
        margin: 0 0 15px 64px;
      }
      .fco-radio::before,
      .fco-radio::after {
        content: '';
        display: table;
        clear: both;
      }
      .fco-param &gt; .fco-radio:last-child {
        margin-bottom: 0;
      }
      .fco-label {
        display: block;
        margin-left: 20px;
        padding-left: 9px;
      }
      .fco-label label {
        cursor: pointer;
        font-size: 16px;
      }
      .fco-radio input[type=radio] {
        display: inline-block;
        width: 20px;
        height: 20px;
        margin: 0;
        position: relative;
        z-index: 2;
        opacity: 0;
        cursor: pointer;
        float: left;
      }
      .fco-radio-check {
        display: inline-block;
        border-radius: 50%;
        width: 20px;
        height: 20px;
        border: 1px solid #888;
        background: #fff;
        position: absolute;
        left: 0;
      }
      .fco-radio-check::before {
        content: '';
        position: absolute;
        border-radius: 50%;
        width: 10px;
        height: 10px;
        background: #007AFF;
        transform: translate(-50%, -50%);
        top: 50%;
        left: 50%;
        opacity: 0;
        -webkit-transition: opacity .2s;
        -o-transition: opacity .2s;
        transition: opacity .2s;
      }
      .fco-radio input[type=radio]:checked ~ .fco-radio-check::before {
        opacity: 1;
      }
      .fco-radio input[type=radio]:disabled {
        cursor: default;
      }
      .fco-radio input[type=radio]:disabled  ~ .fco-radio-check,
      .fco-radio input[type=radio]:disabled  ~ .fco-label {
        cursor: default;
        opacity: .6;
      }
      .fco-image-radio {
        width: 339px;
        text-align: center;
        position: relative;
        height: 215px;
        overflow: hidden;
        background-repeat: no-repeat;
        background-position: center 15px;
        font-size: 18px;
        padding: 155px 20px 0;
        margin-bottom: 20px;
      }
      .fco-image-radio:nth-child(odd) {
         float: right;
      }
      .fco-image-radio:nth-child(even) {
         float: left;
      }
      .fco-image-radio:hover {
        -webkit-box-shadow: 0px 15px 42px 0px rgba(0,0,0,0.33);
        -moz-box-shadow: 0px 15px 42px 0px rgba(0,0,0,0.33);
        box-shadow: 0px 15px 42px 0px rgba(0,0,0,0.33);
      }
      .fco-image-radio input[type=radio] {
        display: block;
        width: 100%;
        height: 100%;
        position: absolute;
        top: 0;
        right: 0;
        left: 0;
        bottom: 0;
        opacity: 0;
        cursor: pointer;
      }
      .IZHS {
        background-image: url(/portal_static/img/procedure_icons/IZHS.png);
      }
      .LOW_ZHIL {
        background-image: url(/portal_static/img/procedure_icons/LOW_ZHIL.png);
      }
      .HIGH_ZHIL {
        background-image: url(/portal_static/img/procedure_icons/HIGH_ZHIL.png);
      }
      .NOZHIL_NOPROM {
        background-image: url(/portal_static/img/procedure_icons/NOZHIL_NOPROM.png);
      }
      .UNIQUE {
        background-image: url(/portal_static/img/procedure_icons/UNIQUE.png);
      }
      .OTHER {
        background-image: url(/portal_static/img/procedure_icons/OTHER.png);
      }
      .FLOORS {
        padding-left: 73px;
        background-image: url(/portal_static/img/procedure_icons/Etazhnost.png);
      }
      .SQUARE {
        padding-left: 73px;
        background-image: url(/portal_static/img/procedure_icons/Obshchaia_ploshchad_obekta.png);
      }
      .DISTRICT {
        padding-left: 73px;
        background-image: url(/portal_static/img/procedure_icons/territorialnaia_prinadlezhnost.png);
      }
      .OBJ_FUNC {
        padding-left: 73px;
        background-image: url(/portal_static/img/procedure_icons/Naznachenie_obekta.png);
      }
      .FIN_SOURCE {
        padding-left: 73px;
        background-image: url(/portal_static/img/procedure_icons/istochnik_finansirovaniia.png);
      }
      .EXP_TYPE {
        padding-left: 73px;
        background-image: url(/portal_static/img/procedure_icons/ekspertiza_proektnoi_dokumentatcii.png);
      }

      .PROJECT_TYPE {
        padding-left: 73px;
        background-image: url(/portal_static/img/procedure_icons/tip_proektnoi_dokumentatcii.png);
      }
      .TREES_FELL {
        padding-left: 73px;
        background-image: url(/portal_static/img/procedure_icons/Vyrubka_ili_peresadka_derevev.png);
      }
      .GROUND_VOLUME {
        padding-left: 73px;
        background-image: url(/portal_static/img/procedure_icons/obem_obrazuemykh_gruntov.png);
      }
      .SPEC_COND {
        padding-left: 73px;
        background-image: url(/portal_static/img/procedure_icons/Poluchenie_STU.png);
      }

      .OOPT {
        padding-left: 73px;
        background-image: url(/portal_static/img/procedure_icons/OOPT.png);
      }
      .CULT_OBJ {
        padding-left: 73px;
        background-image: url(/portal_static/img/procedure_icons/Obekty_kulturnogo_naslediia.png);
      }
      .PIPELINE {
        padding-left: 73px;
        background-image: url(/portal_static/img/procedure_icons/Zony_truboprovodnogo_transporta.png);
      }
      .METRO {
        padding-left: 73px;
        background-image: url(/portal_static/img/procedure_icons/Zony_metropolitena.png);
      }
      .HIGHWAY {
        padding-left: 73px;
        background-image: url(/portal_static/img/procedure_icons/magistralnye_ulitcy_gorodskogo_naznacheniia.png);
      }
      .ROADWAY {
        padding-left: 73px;
        background-image: url(/portal_static/img/procedure_icons/Pri_stroitelstve_trebuetsia_zaniatie_proezzhei_chasti.png);
      }
      .CONNECT_SYSTEMS {
        padding-left: 73px;
        background-image: url(/portal_static/img/procedure_icons/Trebuetsia_podcliuchenie_k_setiam_resursosnabzheniia.png);
      }
      .CONNECT_ELECTRO {
        padding-left: 73px;
        background-image: url(/portal_static/img/procedure_icons/Elektricheskie_seti.png);
      }
      .CONNECT_HEATING {
        padding-left: 73px;
        background-image: url(/portal_static/img/procedure_icons/Sistema_teplosnabzheniia.png);
      }
      .CONNECT_COLD_WATER {
        padding-left: 73px;
        background-image: url(/portal_static/img/procedure_icons/Sistema_holodnogo_vodosnabzheniia.png);
      }
      .CONNECT_GAS {
        padding-left: 73px;
        background-image: url(/portal_static/img/procedure_icons/Seti_gazoraspredeleniia.png);
      }
      .CONNECT_STORM_SEWER {
        padding-left: 73px;
        background-image: url(/portal_static/img/procedure_icons/Leevnevaia_sistema_vodootvedeniia.png);
      }
      .CONNECT_WATER_DISP {
        padding-left: 73px;
        background-image: url(/portal_static/img/procedure_icons/Bytovye_ili_obshchesplavnye_sistemy_vodootvedeniia.png);
      }
      .CONNECT_HOT_WATER {
        padding-left: 73px;
        background-image: url(/portal_static/img/procedure_icons/Connect_hot_water.png);
      }
      .SANZONE {
        padding-left: 73px;
        background-image: url(/portal_static/img/procedure_icons/Vyrubka_ili_peresadka_derevev.png);
      }
      #footer {
        display: none;
      }
      .custom-footer-wrap {
        margin: 75px 53px 0;
      }
      .custom-footer-wrap::before,
      .custom-footer-wrap::after {
        content: '';
        display: table;
        clear: both;
      }
      ul.custom-footer {
        padding: 0;
        list-style: none;
        display: table;
        border-collapse: collapse;
        float: right;
      }
      ul.custom-footer li {
        display: table-cell;
        vertical-align: middle;
        padding-left: 30px;
      }

      @media all and (max-width : 1024px)  {

        .fco-main {
          width: 100%;
        }
        .fco-content {
          width: calc(100% - 269px);
        }

        .fco-image-radio {
          width: 40%;
          -webkit-background-size: 148px;
          background-size: 148px;
          padding-top: 120px;
        }
        .fco-cols2 {
          display: block;
        }
        .fco-cols2 .fco-param:first-child {
          margin-bottom: 20px;
        }
        .fco-content {
          margin-left: 269px;
        }
        .fco-steps {
          width: 269px;
        }
        .fco-steps ol li {
          font-size: 15px;
        }
        .custom-footer-wrap {
          margin-right: 0;
        }
      }
    </style>

    <link rel="stylesheet" href="/portal_static/css/common.min.css"/>
    <div class="fco-main">
      <div class="fco-steps">
        <ol id="fcoSteps">
          <li class="fco-steps__current"><span>Что будем строить</span></li>
          <xsl:for-each select="//PARAMGROUPS/PARAMGROUP">
            <li><span><xsl:value-of select="NAME"/></span></li>
          </xsl:for-each>
        </ol>
      </div>
      <div class="fco-content">
        <form id="form" action="getCardHtml.action?cardId=CARD$PROCEDURE_CALC" method="POST" xfTag="PARAMS">
          <div id="fcoSections" class="fco-sections">
            <div xfTag="PARAM" class="fco-section obj-category">
              <input type="hidden" xfTag="NICK" value="OBJ_CATEGORY" name=""/>
              <xsl:for-each select="//DEV_OBJ_CATEGORY//ROW">
                <div class="fco-image-radio {ID}">
                  <input type="radio" onclick="criteriaObject.changeType(this);" name="OBJ_CATEGORY" value="{ID}"/>
                  <span><xsl:value-of select="NAME"/></span>
                </div>
              </xsl:for-each>
            </div>
            <xsl:for-each select="//PARAMGROUPS/PARAMGROUP">
              <div class="fco-section">
              <xsl:variable name="PARAMGROUP_NICK" select="NICK"/>
                <xsl:for-each select="PARAMROWS/PARAMROW">
                  <div class="fco-param-row fco-cols{count(PARAMS/PARAM)} fco-clear">
                    <xsl:for-each select="PARAMS/PARAM">
                      <xsl:variable name="PARAM_NICK" select="NICK"/>

                        <div xfTag="PARAM" class="fco-param">
                          <div class="fco-param-header {$PARAM_NICK}"><h2><xsl:value-of select="NAME"/></h2></div>
                          <input type="hidden" xfTag="NICK" value="{$PARAM_NICK}" name=""/>
                          <xsl:for-each select="PARAMVALS/PARAMVAL">
                            <xsl:variable name="IS_DEFAULT">
                              <xsl:choose>
                                  <xsl:when test="FL_DEFAULT_VALUE = '1'"><xsl:text>true</xsl:text></xsl:when>
                                  <xsl:otherwise><xsl:text>false</xsl:text></xsl:otherwise>
                              </xsl:choose>
                            </xsl:variable>
                            <div class="fco-radio">
                              <input type="radio" name="{$PARAM_NICK}" value="{NICK}" id="{NICK}" data-default="{$IS_DEFAULT}"/>
                              <span class="fco-radio-check"></span>
                              <div class="fco-label">
                                <label for="{NICK}"><xsl:value-of select="NAME"/></label>
                              </div>
                            </div>
                          </xsl:for-each>
                        </div>

                    </xsl:for-each>
                  </div>
                </xsl:for-each>

              </div>
            </xsl:for-each>
          </div>
          <div id="fcoButtons" class="fco-buttons">
            <button id="fcoBackward" class="fco-back" type="button">Назад</button>
            <button id="fcoForward" class="fco-next" type="button">Далее</button>
          </div>
          <input type="hidden" name="XML" id="form_XML"/>
        </form>
      </div>
    </div>
    <div class="custom-footer-wrap">
      <ul class="custom-footer">
        <li><a href="http://dgp.mos.ru" target="_blank"><img src="/portal_static/img/dgp_logo.png"/></a></li>
        <li><a href="http://dit.mos.ru" target="_blank"><img src="/portal_static/img/dit_logo.png"/></a></li>
        <!--li><a href="http://www.ursip.ru" target="_blank"><img src="/portal_static/img/ursip-logo.png"/></a></li-->
        <li><a href="http://www.ursip.ru" target="_blank"><img src="/portal_static/img/ursip_logo_new.png" height="58"/></a></li>
      </ul>
    </div>
    <xml style="display: none">
      <xsl:copy-of select="*"/>
    </xml>
    <script src="/static/slickSlider/slick.min.js"/>
    {B{FRM$XML_GENERATION$V0.1}E}
    <script>
        var criteriaObject = (function(){
          var  $steps, $section, $sections, $buttons, $forwardBtn, $backwardBtn, maxIndex, $submitBtn,
            stepCurrentClass = 'fco-steps__current',
            stepCheckedClass = 'fco-steps__checked',
            formId = 'form',
             switchStep = function(index) {
               var $currentStep = $steps.eq(index);
               $steps.removeClass(stepCheckedClass).removeClass(stepCurrentClass);
               $currentStep.addClass(stepCurrentClass);
               $currentStep.prevAll().addClass(stepCheckedClass);
          },
              renderMetaTag = function(){
                var metaTag = $('<meta/>', {
                name: 'viewport',
                content: 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
            });
            metaTag.appendTo($('head'));
              }

        /*
          dev_proc_paramvalue - ID значения параметра, которое определяет недоступность параметра
          disable_paramvalue - ID значения параметра, которое становится недоступным при выборе DEV_PROC_PARAMVALUE
        */
        var disabledParamsData = [];
        // <xsl:for-each select="//DEV_PROC_PARAMDISABLE//ROW">
        disabledParamsData.push({
          param: '<xsl:value-of select="DEV_PROC_PARAMVALUE"/>',
          value: '<xsl:value-of select="DISABLE_PARAMVALUE"/>'
        });
        // </xsl:for-each>

        // make object with depends
        /*var depends = {};
        $(disabledParamsData).each(function(e, i){
          (depends[i.value]) ? depends[i.value].push(i.param) : depends[i.value] = [i.param];
        });*/
        var categoryData = [];
        // <xsl:for-each select="//DEV_OBJ_CAT_PARAMVALUE//ROW">
        categoryData.push({
          param: '<xsl:value-of select="DEV_OBJ_CATEGORY"/>',
          value: '<xsl:value-of select="DEV_PROC_PARAMVALUE"/>'
        });
        // </xsl:for-each>

        return {
              init: function() {
                $steps = $('#fcoSteps li');
                $section = $('#fcoSections');
            $sections = $('#fcoSections .fco-section');
            $forwardBtn = $('#fcoForward');
            $backwardBtn = $('#fcoBackward');
            $buttons = $('#fcoButtons');
            maxIndex = $sections.length - 1;
            $submitBtn = $('<button/>', {
                id: 'fco-sumit',
                type: 'submit',
                'class': 'fco-submit',
                text: 'Посмотреть результаты расчета'
            });
            window.test = disabledParamsData
            $section.not('.slick-initialized').on('afterChange', function(event, slick, currentSlide) {

              switchStep(currentSlide);

            }).on('beforeChange', function(event, slick, currentSlide, nextSlide){

              $('html, body').animate({scrollTop: $('.tabInfoView').offset().top - 89}, 300);

              switch(nextSlide) {
                case 0:
                  $buttons.removeClass('fco-buttons--visible');
                break;
                case maxIndex:
                  $forwardBtn.hide();
                  $buttons.addClass('fco-buttons--visible');
                break;
                default:
                  $forwardBtn.show();
                  $buttons.addClass('fco-buttons--visible');
              }
            });

            $steps.find('span').on('click', function(){
              var $parent =  $(this).parent('li');

              if (!$parent.hasClass('fco-steps__checked')) return;
              $section.slick('slickGoTo', $(this).parent('li').index());
            });

            $section.not('.slick-initialized').slick({
              prevArrow: $backwardBtn,
                  nextArrow: $forwardBtn,
                  speed: 300,
                  accessibility: false,
                  draggable: false,
                  adaptiveHeight: true,
                  infinite: false,
                  swipe: false

            });

            if ($sections.eq(maxIndex).find('#fco-sumit').length === 0) {
              $submitBtn.appendTo($sections.eq(maxIndex));
            };

            $('#' + formId)
              .on('submit', function(){
                var xmlAsString = xf_generateXML(formId),
                  $form = $(this),
                  $target = $('.fco-main').parent();

                tabInfo.showLoading()
                        $('#' + formId + '_XML').val(xmlAsString);
                $.post('getCardHtml.action?cardId=CARD$PROCEDURE_CALC', $form.serialize())
                  .done(function(data) {
                    tabInfo.hideLoading()
                    $target.empty().html(data);
                    $('html, body').scrollTop();
                  });

                return false;
              })
              // disable submit on enter
              .on('keyup keypress', function(e) {
                var keyCode = e.keyCode || e.which;

                if (keyCode === 13) {
                  e.preventDefault();
                  return false;
                }
              });

            // the disable behavior logic
            $sections.find('input:radio')
              // .on('focusin', function(){
              //   var $this = $(this),
              //     $container = $this.closest('.fco-param'),
              //     value = $container.attr('data-value');

              //    var toDisable = disabledParamsData.filter(function(item) { return item.param === value }).map(function(item) { return item.value})


              //    toDisable.forEach(function(value, i){
              //   	var $control = $('#' + formId +' input:radio[value="' + value + '"]')
              //   	$control.prop('disabled', false)
              //   })

              // })
              .on('change', function(){
                 var $this = $(this),
                    $container = $this.closest('.fco-param'),
                 	oldValue = $container.attr('data-value'),
                    value = $this.val()

	            $container.attr('data-value', value);
	            $this.attr('xfTag', 'VALUE').closest('.fco-radio').siblings().find('input:radio').removeAttr('xfTag');

	            var old = disabledParamsData
	                .filter(function(item) { 
	                	return item.param === oldValue 
	                }).map(function(item) { 
	                	return item.value
	                })

	            var depends = disabledParamsData
                	.filter(function(item, index) {
                		return (old.findIndex(function(i) { return item.value === i}) !== -1)
                	})
                	.reduce(function(map, obj) {
	                	if (map[obj.value]) {
	                		map[obj.value].push(obj.param);
	                	} else {
	                		map[obj.value] = [obj.param];
	                	}
					    return map;
					}, {});
                    
                old.forEach(function(value){
 					$('#' + formId +' input:radio[value="' + value + '"]').prop('disabled', depends[value].some(function(item){
                		return $('#' + formId +' input:radio[value="' + item + '"]').is(':checked')
                 	}))
	            })

	            //disable new
                disabledParamsData
                	.filter(function(item) {
                		return item.param === value 
                	})
                	.map(function(item) { 
                		return item.value 
                	})
                	.forEach(function(value){
	                	var $control = $('#' + formId +' input:radio[value="' + value + '"]')
	                	console.log(value)
	                	$control.prop('disabled', true)
	                	if ($control.is(':checked')) {
	                        setTimeout(function() {
	                            $control.closest('.fco-param').find('input:radio').not(':disabled').eq(0).prop('checked', true).change()
	                        }, 10)
	                    }
	            	});

              });
              },
              changeType: function(button) {
                var name = $(button).val(),
                  $controls = $('.fco-radio').find('input:radio'),
                  category = [],
                  names = $controls.map(function(){
                return this.name;
              }).get();

                names = $.unique(names);

                $controls.prop('disabled', false);
                $controls.prop('checked', false);

                $.grep(categoryData, function(e){
                  if (e.param === name) {
                    category.push(e.value);
                  };
                });

            $(names).each(function(i, name){
              var $input,
                $elements = $('#' + formId + ' input:radio[name="' + name + '"]'),
                categoryElement = $.grep($elements, function(elem){
                  var $elem = $(elem),
                    value = $elem.val();

                  if (category.indexOf(value) != -1) {
                    return $elem;
                  };
                    });

              if (categoryElement /*<xsl:text disable-output-escaping="yes"><![CDATA[*/ && /*]]> </xsl:text>*/ categoryElement.length == 1) {
                $input = $(categoryElement[0]);
              }else {
                $input = $elements.filter('[data-default="true"]');
              }

              $input.prop('checked', true).focusin().change();
            });

               $section.slick('slickNext');
              }
          }
        })();

      $(function(){
        criteriaObject.init();
      });

    </script>
  </xsl:template>
</xsl:stylesheet>
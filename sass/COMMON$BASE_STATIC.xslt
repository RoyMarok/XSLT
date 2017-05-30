<xsl:template name="base_static">
	<xsl:param name="content" />
	<head>

    <link href="/portal_static/css/redesign/normalize.css" rel="stylesheet" />
    <link href="/portal_static/css/redesign/index.css" rel="stylesheet" />
    <link href="/portal_static/css/redesign/headerFlex.css" rel="stylesheet" />
    <link href="/portal_static/css/redesign/buttons.css" rel="stylesheet" />
    <link href="/portal_static/css/redesign/dropDownMenu.css" rel="stylesheet" />
    <link href="/portal_static/css/redesign/searchControl.css" rel="stylesheet" />
    <link href="/portal_static/css/redesign/secondMenu.css" rel="stylesheet" />
    <link href="/portal_static/css/redesign/vitrina.css" rel="stylesheet" />
    <link href="/portal_static/css/redesign/searchForm.css" rel="stylesheet" />
    <link href="/portal_static/css/redesign/footer.css" rel="stylesheet" />
    <link href="/portal_static/css/redesign/tabs.css" rel="stylesheet" />
		<link rel="stylesheet" href="/portal_static/css/redesign/footer.css" />


    <style>
    * {
    box-sizing: border-box;
}
div.buttonGroup > ul > li > span{
  line-height: 18px;
}

        #tabsWrap {
          margin: auto;
          max-width: 1300px;
        }
        .mainWrapper{
          height: auto;
          min-height: auto;
        }
          #content-wrap{
padding: 1px;
				background : #F2F2F2;
				color: #333;
				font-family: sans-serif;
				font-size: 20px;
				line-height: 26px;
				-moz-box-sizing: border-box;
				box-sizing: border-box;
			}
    </style>

  <script type="text/javascript" src="/static/JQuery/1.8.3/jquery.min.js" />

  <script type="text/javascript">
    $(function() {
      //растянем content-wrap на всю свободную область
      function on_resize(){
        var window_h = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
        var header_h = $('#header').offset().top + $('#header').outerHeight(true);
        var footer_h = $('#footer').outerHeight(true);

        var h = window_h - (header_h + footer_h);
        if (h > 0){
          $("#content-wrap").css({"min-height": h});
        }
      }

      on_resize();
      $(window).resize(on_resize);
    });
    //@ sourceURL=COMMON_BASE_STATIC.js
    </script>

  </head>

  <body>
  <div class="mainWrapper">
    <xsl:call-template name="common_header"/>
    <div id="content-wrap" >
      <div id="tabsWrap">
        <xsl:copy-of select="$content"/>
      </div>
    </div>
    </div>
    <xsl:call-template name="tmpl_footter"/>
  </body>
</xsl:template>

 <!--Данные футера -->
{B{COMMON$FOOTER_DATA}E}
 <!--Данные шапки -->
{B{COMMON$TOP$LOGO_DATA}E}
{B{COMMON$TOP$LOGO_DATA_COMMON}E}

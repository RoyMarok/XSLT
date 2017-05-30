<xsl:template name="tmpl_header">
     <!--style>
      /*#header_block .logo span { color: #a3a3a3;  display: block;  font-size: 12px;  font-weight: 400;   line-height: 1.4em;    padding: 5px 0 0;}
      #header_block a.logo {  background: rgba(0, 0, 0, 0) url("/portal_static/gge_index_page/img/gge-main/logo.png") no-repeat scroll 0 0;   color: #000000;   display: block;  font-size: 1.4em;   font-weight: 700;    line-height: 0.8em;
                      max-width: 490px;    min-height: 72px;    padding: 11px 0 0 73px;    text-decoration: none;  font-family: "PT Sans Caption",sans-serif;   font-size: 18px; margin-top: 15px;}   */
      </style-->
      <style>
      .mainWrapper {padding-bottom:262px}
      #footer {height:262px; margin-top:-262px}
      a.logo{
          background: url(/portal_static/img/icons/logo@2x.png) no-repeat left;
    padding-left: 230px;
    height: 38px;
    display: block;
    overflow: visible;
      }
      </style>
      <div id="header_block">
        {B{COMMON$TOP$BANNER}E}
        <a class="logo" title="«Системы и проекты»" href="getCardHtml.action?documentId=&amp;cardId=PRIVATE_OFFICE$MAIN_PAGE&amp;tab=PRIVATEOFFICE">
             <!--nobr> ФАУ «Главгосэкспертиза России»</nobr>
            <span>Федеральное автономное учреждение «Главное управление государственной экспертизы»</span-->
        </a>
      </div>

</xsl:template>


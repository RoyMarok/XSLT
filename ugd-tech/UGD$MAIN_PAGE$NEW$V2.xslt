<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="no"/>
    <xsl:template match="/">
        {B{UGD$MAIN_PAGE$NEW_STYLE}E}
        {B{CARD$MAIN_PAGE$STYLE}E}

        <link rel="stylesheet" href="/authS2/fonts/stylesheet.css"/>
        {B{UGD$MAIN_PAGE$CAB_TMPL_STYLE}E}

        <div class="rightBlock">
          <xsl:if test="/ROOT/HOME_GENERAL_SEARCH/ROW_SET/ROW/FL_DISABLED = '1'">  <!--  UGDII-2799   -->
            <table class="searchPanel">
              <tr>
                <td>
                  <span class="inputTextWrapper">
                    <input type="text" placeholder="Поиск объекта, документа, решения, организации" data-search="mainSearchLine"/>
                  </span>
                </td>
                <td width="140px">
                  <span class="simpleSearchBtn left simpleBtn" onclick="simpleSearchBtn('submit/simpleSubmit.action?action=CARD$EXT_SEARCH$BTN&amp;documentId=', 'mainSearchLine')">Найти</span>
                </td>
              </tr>
            </table>
          </xsl:if>

            <div id="advSearchPanel">
                <form id="mainForm_new" onsubmit="return false;">
                    <table cellspacing="0" cellpadding="0" id="advSearchPanelTable" class="tabVitrina filterBottomPanel DBB930281CF04BA7B067CAEFD7DAFAF1">
                        <tbody>
                            <tr>
                                <td width="*" id="searchline" class="searchline">
                                    <div>
                                        <input type="text" style="width: 100%;" placeholder="Поиск" class="inputValues hiddenValues 402882ff3d1fdde4013d593c89df0075" name="402882ff3d1fdde4013d593c89df0075" id="402882ff3d1fdde4013d593c89df0075" value="" attr_type="14" summary="0" defvalue="Адрес объекта"/>
                                    </div>
                                </td>
                                <td style="width:79px;">
                                    <input type="submit" onclick="" value="" class="fastSearchBtn default-btn"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>

            <!-- Настройки  -->
            <xsl:if test="//MENU != ''">
              <div style="  position: relative;   right: 0; top: 20px;"><img src="/portal_static/img/redesign/settings.png" style="cursor: pointer; float: right;" onclick="f.openWin('getCardHtml.action?documentId=&amp;cardId=UGD$MAIN_PAGE$NEW$CONFIGURATOR', 'mainPageSettings', 1150, 800);"/></div>
            </xsl:if>

            <!-- Отображения меню -->
            <div id="subSecondMenu">
                <ul>
                  <xsl:variable name="tab" select="//DOC_KEY//DOC_KEY"/>
                  <xsl:for-each select="//MENU//ROW">

                    <xsl:if test="position() &lt;  10">
                           <li tab="{CODE_MAIN}" onclick="loadDataPage('{CODE_MAIN}')">
                             <xsl:choose>
                               <xsl:when test="CODE_MAIN = $tab">
                                 <xsl:attribute name="class">active</xsl:attribute>
                               </xsl:when>
                               <xsl:when test="CODE_MAIN = 'MAIN' and string-length($tab)=0">
                                 <xsl:attribute name="class">active</xsl:attribute>
                               </xsl:when>
                               <xsl:otherwise>
                               </xsl:otherwise>
                             </xsl:choose>
                            <a><xsl:value-of select="NAME"/></a>
                          </li>
                    </xsl:if>
                    <xsl:if test="position() = 10">
                         <li class="nextMunu">
                            <span>Еще</span>
                            <ul class="subSecondMenu">
                              <div class="arrow"></div>
                              <xsl:for-each select="//MENU//ROW">
                                <xsl:if test="position() &gt; 9">
                                     <li tab="{CODE_MAIN}" onclick="loadDataPage('{CODE_MAIN}')">
                                     <xsl:if test="CODE_MAIN = $tab">
                                        <xsl:attribute name="class">active</xsl:attribute>
                                      </xsl:if>
                                      <a><xsl:value-of select="NAME"/></a>
                                    </li>
                                </xsl:if>
                             </xsl:for-each>
                           </ul>
                         </li>
                    </xsl:if>
                   </xsl:for-each>
                </ul>
            </div>



         <div id="MAIN" class="resources">
            <div class="loadDataPageFirst"></div>
         </div>

      <div id="tabsSourse">

      </div>

      <xsl:if test="string-length(//MENU) = 0 ">
        <xsl:if test="//HOME_BLOCK_CABACC = 1 ">
          <xsl:call-template name="getConnect"/>
        </xsl:if>

        <xsl:if test="//HOME_BLOCK_CABDESC = 1">
          <xsl:call-template name="developersDashboardDescription"/>
        </xsl:if>
      </xsl:if>



      <script>

        /* Массив для отображения дополнительных данных
          "NAME" - наименование закладки
            {"first":bolean, "last":bolean}
            first, last - места добавления данных
        */
        var arrayCards = {
          "MAIN": {"first":true, "last":false, "isLoad":false, "isFirstLoad": true, "xsltFirst":"MAIN"},
          "ORG" : {"first":true, "last":false, "isLoad":false, "isFirstLoad": true, "xsltFirst":"ORG"},
          "GZK"  : {"first":true, "last":true, "isLoad":false, "isFirstLoad": true, "xsltFirst":"GZK", "xsltLast":"GZK_2"},
          "CAB_PROC"  : {"first":true, "last":false, "isLoad":false, "isFirstLoad": true, "xsltFirst":"SET_CRITERIA_OBJECT"},
          "PRIVATE_OFFICE" : {"first":true, "last":false, "isLoad": false, "isFirstLoad": true, "xsltFirst": "PRIVATE_OFFICE"}
        };

        function simpleSearchBtn(url, btnId)
        {
           var searchString = $('input[data-search="'+ btnId +'"]').val();
           location.href = url + searchString;
        }

        var isLoadTabs = false;


        // Загрузка дополнительных данных в карточку
        <![CDATA[
        function loadDataPage(id)
        {
          if (arrayCards[id] && isLoadTabs) {
             try {
                //Загружаем и добавляем данные в верхний блок
                if (!(arrayCards[id]["isLoad"])) {
                    tabInfo.showLoading();
                    if (arrayCards[id]["first"] == true) {
                         ajaxLoad("CARD$MAIN_PAGE$" + arrayCards[id]["xsltFirst"].toUpperCase(), $("#" + id).find(".loadDataPageFirst"));
                         arrayCards[id]["isLoad"] = true;
                    }
                    if (arrayCards[id]["last"] == true) {
                         ajaxLoad("CARD$MAIN_PAGE$" + arrayCards[id]["xsltLast"].toUpperCase(), $("#" + id).find(".loadDataPageLast"));
                         arrayCards[id]["isLoad"] = true;
                    }
                } //if
            }
            catch(error)
            {
                alert(error);
                tabInfo.hideLoading();
            }
          }
        }

        function ajaxLoad(cardId, position)
        {
          $.ajax({
                type: "POST",
                async: true,//async,
                url: "getCardHtml.action",
                data: { "cardId": cardId},
                timeout: 90000,
                success: function(data){
                           position.html(data);
                           tabInfo.hideLoading();

                }
          })
        }

        ]]>


        $(document).ready(function(){

           $(".nextMunu").on("click", function(){
               var self=$(this);
               self.toggleClass("showMenu");

              $(document).click( function(event){
                  if( $(event.target).closest(self).length )
                      return;
                  $(self).removeClass("showMenu");
                //  event.stopPropagation();
              });


           });
           $(".nextMunu").on("click", "li",function(){
              var self=$(this);
                  parent = self.parent();
               parent.find(".activeSubMenu").removeClass("activeSubMenu");
               self.addClass("activeSubMenu");
               parent.removeClass("showMenu");
           });

          var activeElMenu = $("#subSecondMenu li.active");

          var asyn = false;
          if (activeElMenu) {
            $("#" + activeElMenu.attr("tab")).show();
            isLoadTabs = true;
            if (activeElMenu.attr("tab") == 'MAIN'){
              loadDataPage(activeElMenu.attr("tab"));
              asyn = true;
            }
          }

          $('.searchPanel input[type=text]').on('keyup', function(e) {
              if (e.which == 13) {
                  $(".simpleSearchBtn").click();
              }
          });


          isLoadTabs = false;
          $.when(
              $.ajax({
                  type: "POST",
                  async: asyn,//async,
                  url: "getCardHtml.action",
                  data: {
                          "cardId": "CARD$MAIN_PAGE$COMMON",
                        },
                  timeout: 90000,
                  success: function(data){
                      $("#tabsSourse").html(data);

                    //  tabInfo.hideLoading();
                  }
              }) //ajax
          )
          .then(function( data, textStatus, jqXHR ) {
            isLoadTabs = true;
            var id = $("#subSecondMenu li.active").attr("tab");
            $("#" + id).show();
            loadDataPage(id);
            tabInfo.hideLoading();
          });


        })


      </script>


      {B{UGD$MAIN_PAGE$NEW_SCRIPT}E}

      </div>
      <xsl:call-template name="call2action"/>

    </xsl:template>

    {B{UGD$MAIN_PAGE$CAB_TMPL}E}
    {B{UGD$MAIN_PAGE$CALL2ACTION_TMPL}E}









</xsl:stylesheet>
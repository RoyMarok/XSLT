<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:process="http://irmdev.mdi.ru/XDoxProcess" xmlns:task="http://irmdev.mdi.ru/XDoxProcessTask" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cfm="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml" xmlns:datetime="http://exslt.org/dates-and-times">

  <xsl:output method="html"/>

  <xsl:template match="/ROOT">

<xml style="display: none">
  <xsl:copy-of select="*"/>
</xml>

    {B{CARD$MGE$REGISTRATION_styles__}E}
      {B{CARD$BODY_STYLE}E}




    <link rel="stylesheet" href="/static/typeForm/css/form.css?{//SYSDATE/ROW_SET/ROW/SYS_DATE}" type="text/css"/>
    <link rel="stylesheet" href="/static/autoform/autoformStyles.css?{//SYSDATE/ROW_SET/ROW/SYS_DATE}" type="text/css" media="screen"/>
    <link type="text/css" href="/static/TokenInput/latest/token-input.css?{//SYSDATE/ROW_SET/ROW/SYS_DATE}" media="screen" rel="stylesheet"/>
    <link rel="stylesheet" href="/static/redactor/css/redactor.css?{//SYSDATE/ROW_SET/ROW/SYS_DATE}"/>
    <link rel="stylesheet" href="/static/fancybox/jquery.fancybox.css"/>

    {B{CARD$PROCESS_TASK_STYLE}E}

    <!--script src="/portal_static/js/i18nContext.js?" type="text/javascript"/-->
    <script type="text/javascript">
      var h = h || {};
      h.dic = function(context, text) {
           return text
      };
      portal = { i18n: { ru: {} } }

      var trueDocKey = '<xsl:value-of select="DOC_KEY/ROW_SET/ROW/DOC_KEY"/>';
      var urlParams = f.getUrlParams();
      <![CDATA[
      if (!!urlParams && urlParams.documentId != trueDocKey) {

        var url = document.location.href.substr(0, document.location.href.indexOf('?')) + '?';

        $.each(urlParams, function(p) {
          var v = (p == 'documentId') ? trueDocKey : urlParams[p];
          url += '&' + p + '=' + v;
        });

        document.location.href = url;
       }
       ]]>

      $(function() {
        $(".all_access_card").toggle(
              function(){
                  $(".content").find(".access_card").show();
                  $(this).text("Скрыть");
              },
              function(){
                  $(".content").find(".access_card").hide();
                  $(this).text("Показать все");
              }
          );
      });
    </script>

    <script src="js/spbren/configuration.js"></script>
    <script src="/static/accounting/accounting.min.js"></script>
    <!--<script src="/{//PORTAL-STATIC/ROW_SET/ROW/PORTALSTATIC}/js/deligate.js?{//SYSDATE/ROW_SET/ROW/SYS_DATE}" type="text/javascript"> </script>-->
    <!--script src="/portal/js/spbren/deligate.js?{//SYSDATE/ROW_SET/ROW/SYS_DATE}" type="text/javascript"></script-->

    <script src="/static/JQueryPlugins/jquery.hoverIntent.js" type="text/javascript"> </script>
    <script src="/static/MbMenu/jquery.mbMenu-2.8.5rc5.1.js" type="text/javascript"> </script>

    <script src="/xdox/js/process/task.actions.js?{//SYSDATE/ROW_SET/ROW/SYS_DATE}" type="text/javascript"></script>
    <script src="/xdox/js/global.actions.js?{//SYSDATE/ROW_SET/ROW/SYS_DATE}" type="text/javascript"></script>

    <!-- JQueryUI -->
    <script src="/static/JQueryUI/1.8.2/jquery-ui.min.js?2" type="text/javascript"></script>
    <script type="text/javascript" src="/static/JQueryPlugins/jquery.ricos.select-1.0-full.js?2"></script>
    <script src="/static/JQueryPlugins/ui.datepicker-ru.js" type="text/javascript"></script>

    <script type="text/javascript" src="/static/redactor/redactor-8.2.2.js?{//SYSDATE/ROW_SET/ROW/SYS_DATE}"></script>  <!-- UGDII-1866 Lashina 04/09/2015-->
    <!--script type="text/javascript" src="/static/JQueryPlugins/jquery.meio.mask-1.1.3.js"></script>
    <script src="/static/JQueryPlugins/jquery-ui-sliderAccess.js?{//SYSDATE/ROW_SET/ROW/SYS_DATE}" type="text/javascript"></script>
    <script src="/static/JQueryPlugins/jquery-ui-timepicker-addon.js?{//SYSDATE/ROW_SET/ROW/SYS_DATE}" type="text/javascript"></script-->

  <xsl:if test="normalize-space(substring-before(substring-after(//task:ru.xdox.objects.processes.Task/task:Description,'!F'), 'F!')) != ''">

    <!--script type="text/javascript" src="/autoform/js/common.js?{//SYSDATE/ROW_SET/ROW/SYS_DATE}"></script>
    <script type="text/javascript" src="/autoform/js/autoform.js?{//SYSDATE/ROW_SET/ROW/SYS_DATE}"></script>
    <script type="text/javascript" src="/autoform/js/underscore-min.js"></script-->
    <script type="text/javascript" src="/autoform/js/json2.js?{//SYSDATE/ROW_SET/ROW/SYS_DATE}"></script>
    <!--script type="text/javascript" src="/static/FileUploader/2.0-beta/fileuploader.js?{//SYSDATE/ROW_SET/ROW/SYS_DATE}"></script>
    <script type="text/javascript" src="/autoform/js/fieldElib.js?{//SYSDATE/ROW_SET/ROW/SYS_DATE}"></script>
    <script type="text/javascript" src="/autoform/js/fieldFolder.js?{//SYSDATE/ROW_SET/ROW/SYS_DATE}"></script>
    <script type="text/javascript" src="/autoform/js/fieldOnline.js?{//SYSDATE/ROW_SET/ROW/SYS_DATE}"></script>
    <script type="text/javascript" src="/autoform/js/fieldSaving.js?{//SYSDATE/ROW_SET/ROW/SYS_DATE}"></script>
    <script type="text/javascript" src="/autoform/js/fieldApplet.js?{//SYSDATE/ROW_SET/ROW/SYS_DATE}"></script>
    <script type="text/javascript" src="/autoform/js/fieldRegDoc.js?{//SYSDATE/ROW_SET/ROW/SYS_DATE}"></script>
    <script type="text/javascript" src="/autoform/js/fieldVerify.js?{//SYSDATE/ROW_SET/ROW/SYS_DATE}"></script>
    <script type="text/javascript" src="/autoform/js/atmosphere-min.js?{//SYSDATE/ROW_SET/ROW/SYS_DATE}"></script-->
    <script type="text/javascript" src="/static/FileUploader/2.0-beta/fileuploader.js?{//SYSDATE/ROW_SET/ROW/SYS_DATE}"></script>
    <script type="text/javascript" src="/autoform/js/start.js?{//SYSDATE/ROW_SET/ROW/SYS_DATE}"></script>

    <script type="text/javascript" src="/static/JQueryPlugins/jquery.metadata.js"></script>

    <!--script type="text/javascript" src="/pdoc/js/sign/appletCallbacks.js?{//SYSDATE/ROW_SET/ROW/SYS_DATE}"></script-->





    <!--script type="text/javascript" src="/static/TokenInput/latest/jquery.tokeninput.js?{//SYSDATE/ROW_SET/ROW/SYS_DATE}"></script>

    <script type="text/javascript" src="/autoform/js/blocks/cloneMe-1.0.2.js?{//SYSDATE/ROW_SET/ROW/SYS_DATE}"></script>
    <script type="text/javascript" src="/autoform/js/blocks/groupBlocks.js?{//SYSDATE/ROW_SET/ROW/SYS_DATE}"></script>

    <script type="text/javascript" src="/static/typeForm/typeForm.js?{//SYSDATE/ROW_SET/ROW/SYS_DATE}"></script>
    <script type="text/javascript" src="/static/typeForm/formHelper.js?{//SYSDATE/ROW_SET/ROW/SYS_DATE}"></script-->
  </xsl:if>

   <!-- доклисты -->
    <script src="/static/DocList/jquery.doclist.js?{//SYSDATE/ROW_SET/ROW/SYS_DATE}" type="text/javascript"></script>


    <!--cript type="text/javascript" src="/pdoc/js/sign/signAction.js?{//SYSDATE/ROW_SET/ROW/SYS_DATE}"></script>
    <script type="text/javascript" src="/static/DeployJava/deployJava.js?{//SYSDATE/ROW_SET/ROW/SYS_DATE}"></script>
    <script type="text/javascript" src="/pdoc/js/sign/base64.js?{//SYSDATE/ROW_SET/ROW/SYS_DATE}"></script>


    <script src="/elib/js/sign.js?{//SYSDATE/ROW_SET/ROW/SYS_DATE}" type="text/javascript"></script>

    <script type="text/javascript" src="/elib/js/crypto.js?{//SYSDATE/ROW_SET/ROW/SYS_DATE}"></script-->

    <script type="text/javascript" src="/elib/js/crypto.js"></script> <!-- /forms/resources/js/crypto.js -->
    <script type="text/javascript" src="/static/DeployJava/deployJava.js"></script> <!-- /forms/resources/js/deployJava.js -->
    <script type="text/javascript" src="/elib/js/sign.js"></script>
    <script type="text/javascript" src="/static/fancybox/jquery.fancybox.pack.js"></script>


  <!-- Единое подключение подписи -->



   {B{CARD$MGE$PROCESSTASK_TASK_CARD_HEAD}E}
   <div class="pdoc-main-wrapp" id="cardProcessTask">
    <div id="objCard">
      {B{CARD$PDOC$BODY_styles}E}
      {B{CARD$PDOC$BODY_scripts}E}

      <div class="pdoc-right-side">
      <div class="content">
        <xsl:if test="count(//PROCESS_TASK_STAGES/ROW_SET/ROW) &gt; 0">
          <div class="whiteBlock">
            <div class="process-stages">
              <h2>Этапы процесса</h2>
              <ul>
                <xsl:for-each select="//PROCESS_TASK_STAGES/ROW_SET/ROW">
                  <li class="process-stages__{STAGE_STATE}">
                    <xsl:value-of select="STAGE_NAME"/>
                  </li>
                </xsl:for-each>
              </ul>
            </div>
          </div>
        </xsl:if>
        <div class="whiteBlock">
          <xsl:if test="PROCESS_PARENT != ''">
            <div class="cardProperty">
              <div class="cardPropertyName">Головной процесс</div>
              <div class="cardPropertyValue">
              <a href="{//PROCESS_URL/ROW_SET/ROW/PROCESS_URL}" class="processUrl" id="{PROCESS_PARENT/ROW_SET/ROW/PARENT_DOC_KEY}">
                <xsl:value-of select="PROCESS_PARENT/ROW_SET/ROW/ORDINALNUMBER"/>
              </a> от <xsl:value-of select="PROCESS_PARENT/ROW_SET/ROW/CREATED"/>
              </div>
            </div>
          </xsl:if>

          <div class="cardProperty">
            <div class="cardPropertyName">Процесс</div>
            <div class="cardPropertyValue">
              <!--a href="{//PROCESS_URL/ROW_SET/ROW/PROCESS_URL}" class="processUrl" id="{//process:ru.xdox.objects.processes.Process/process:Id}"-->
              <span style="color:#4364c8">Задача № <xsl:value-of select="//task:ru.xdox.objects.processes.Task/task:OrdinalNumber"/> от
                           <xsl:call-template name="date_transform">
                               <xsl:with-param name="old_date" select="//process:ru.xdox.objects.processes.Process/process:Created"/>
                            </xsl:call-template></span>
              <!--xsl:value-of select="//process:ru.xdox.objects.processes.Process/process:OrdinalNumber"/>
              </a --><xsl:text> </xsl:text>
              <div><xsl:call-template name="spec_symbol">
              <xsl:with-param name="str" select="//process:ru.xdox.objects.processes.Process/process:Name"/>
              </xsl:call-template></div>
            </div>
            <xsl:element name="br"/>
            <div>
                <a href="{//PROCESS_URL/ROW_SET/ROW/PROCESS_URL}" class="processUrl" id="{//process:ru.xdox.objects.processes.Process/process:Id}" target="_blank">Ход исполнения</a>
            </div>
           </div>

          <div class="cardProperty">
            <div class="cardPropertyName">Инициатор процесса</div>
            <div class="cardPropertyValue"><xsl:value-of select="//process:ru.xdox.objects.processes.Process/process:Instantiator/process:Name"/></div>
          </div>

          <div class="cardProperty">
            <div class="cardPropertyName">Кому назначено</div>
            <div class="cardPropertyValue">
                <xsl:value-of select="//task:Assignee/task:Name"/>
            </div>
          </div>

          <div class="cardProperty">
            <div class="cardPropertyName">Срок исполнения</div>
            <div class="cardPropertyValue">
                <xsl:choose>
                  <xsl:when test="//task:Deadline != ''">
                  <xsl:call-template name="date_transform">
                    <xsl:with-param name="old_date" select="//task:Deadline"/>
                  </xsl:call-template>
                  <xsl:text> </xsl:text>
                  <xsl:call-template name="time_transform">
                    <xsl:with-param name="date" select="//task:Deadline"/>
                  </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>Срок не определен</xsl:otherwise>
                </xsl:choose>
            </div>
          </div>

          <div class="cardProperty">
            <div class="cardPropertyName">Выдана</div>
            <div class="cardPropertyValue">
              <xsl:call-template name="date_transform">
                  <xsl:with-param name="old_date" select="//task:Issued"/>
                </xsl:call-template>
                <xsl:text> </xsl:text>
                <xsl:call-template name="time_transform">
                  <xsl:with-param name="date" select="//task:Issued"/>
              </xsl:call-template>
            </div>
          </div>

          <div class="cardProperty">
            <div class="cardPropertyName">Исполнитель</div>
            <div class="cardPropertyValue">
              <span onclick="$('.process-executor-info').toggle();" class="process-executor"><xsl:value-of select="//PROCESS_TASK_ASSIGNEE//ASSIGNEE/FV_FIO"/></span>
              <div class="process-executor-info" style="display:none;padding-top: 7px">
                <xsl:if test="//PROCESS_TASK_ASSIGNEE//ASSIGNEE/FV_EMAIL != ''">
                  <div class="cardProperty">
                    <div class="cardPropertyName">Электронная почта</div>
                    <div class="cardPropertyValue">
                        <xsl:value-of select="//PROCESS_TASK_ASSIGNEE//ASSIGNEE/FV_EMAIL"/>
                    </div>
                  </div>
                </xsl:if>
                <xsl:if test="//PROCESS_TASK_ASSIGNEE//ASSIGNEE/FV_PHONE != ''">
                  <div class="cardProperty">
                    <div class="cardPropertyName">Телефон</div>
                    <div class="cardPropertyValue">
                        <xsl:value-of select="//PROCESS_TASK_ASSIGNEE//ASSIGNEE/FV_PHONE"/>
                    </div>
                  </div>
                </xsl:if>
                <xsl:for-each select="//PROCESS_TASK_ASSIGNEE//ASSIGNEE/ASSIGNS/ASSIGN">
                  <xsl:if test="UNIT_ROLE_NAME != ''">
                     <div class="cardProperty">
                      <div class="cardPropertyName">Должность</div>
                      <div class="cardPropertyValue">
                          <xsl:value-of select="UNIT_ROLE_NAME"/>
                      </div>
                    </div>
                  </xsl:if>
                  <xsl:if test="DEPARTMENT_name != ''">
                     <div class="cardProperty">
                      <div class="cardPropertyName">Отдел</div>
                      <div class="cardPropertyValue">
                          <xsl:value-of select="DEPARTMENT_name"/>
                      </div>
                    </div>
                  </xsl:if>
                  <xsl:if test="MANAGEMENTS_NAME != ''">
                     <div class="cardProperty">
                      <div class="cardPropertyName">Организация</div>
                      <div class="cardPropertyValue">
                          <xsl:value-of select="MANAGEMENTS_NAME"/>
                      </div>
                    </div>
                  </xsl:if>

                </xsl:for-each>
              </div>
            </div>
          </div>
        </div>
          </div>
      </div>

      <div class="pdoc-left-side">
          <div class="content">
            <div class="head-wrapper">
                <div class="head-section top">
                    <!--div class="head-block icon-block"></div-->
                    <div class="head-block middle">
                        <div class="appeal"><xsl:value-of select="//PROCESS_DOC//DOC_CLASS"/></div>
                    </div>
                    <xsl:if test="//PROCESS_DOC//DOC_STATUS">
                      <div class="head-block state-block">
                        <div class="state">
                          <xsl:value-of select="//PROCESS_DOC//DOC_STATUS"/>
                        </div>
                      </div>
                    </xsl:if>
                </div>
                <div class="head-section bottom">
                    <!--div class="head-block">
                        <div class="head-left-block textLeft bold caseNum"></div>
                        <div class="textLeft" style="font-size:11px;color:#404040"></div>
                        <div class="textLeft" style="font-size:11px;color:#404040"> </div>
                    </div-->
                    <div class="head-block middle">
                      <div class="adress">
                        <xsl:variable name="desc" select="normalize-space(substring-before(//task:ru.xdox.objects.processes.Task/task:Description, '!'))"/>
                        <xsl:choose>
                           <xsl:when test="$desc!= ''">
                              <xsl:value-of select="$desc"/>
                           </xsl:when>
                           <xsl:otherwise>
                             <xsl:value-of select="//task:ru.xdox.objects.processes.Task/task:Description"/>
                           </xsl:otherwise>
                        </xsl:choose>
                      </div>
                    </div>
                </div>
            </div>
            <div class="whiteBlock">
            <xsl:if test="//DATAOBJECT_ID/ROW_SET/ROW/DATAOBJECT_ID and NEW_DOC/ROW_SET/ROW/NEW_DOC = '0'">
               <div class="cat">
                  <div class="key objProcess"><span><a target="_blank">
                  <xsl:attribute name="href"><xsl:value-of select="//CARD_URL/ROW_SET/ROW/CARD_URL" disable-output-escaping="yes"/></xsl:attribute>
                  Объект процесса</a></span>
                  </div>
                </div>
            </xsl:if>

            <!-- Связанные объекты-->
            <xsl:if test="PROCESS_OBJECT !=''">
                <p class="sectionTitle"><span>Связанные объекты</span></p>
                <xsl:for-each select="PROCESS_OBJECT/ROW_SET/ROW">
                   <xsl:choose>
                      <xsl:when test="position() &gt; 3">
                        <div class="cat access_card" style="display:none">
                           <xsl:apply-templates select="."/>
                        </div>
                      </xsl:when>
                      <xsl:otherwise>
                        <div class="cat">
                           <xsl:apply-templates select="."/>
                        </div>
                      </xsl:otherwise>
                  </xsl:choose>
                </xsl:for-each>
                <xsl:if test="count(PROCESS_OBJECT/ROW_SET/ROW) &gt; 3">
                  <span class="all_access_card">Показать все</span>
                </xsl:if>
                <!--div class="GreyLineDivider"></div-->
            </xsl:if>

            <!-- Основное меню задачи: Перепоручить, изменить исполнителя и др. -->
            <div class="reassignTaskAction newTaskAction contractRegistrationAction subprocess btn_menu" style="display: none;"></div>

            <!-- Поле для вывода ошибок -->
            <div id="errorsTask"></div>

            <div class="GreyLineDivider"></div>

            <!-- Загрузка документа ГИО3 -->
            <xsl:for-each-group select="CARD_FIELD/ROW_SET/ROW[FT_IS_SECTION='TRUE']" group-by="FIELD_ID">
              <xsl:sort select="FIELD_ORDER"/>
              <xsl:call-template name="makeSection">
              <xsl:with-param name="id" select="FIELD_ID"/>
              <xsl:with-param name="name" select="NAME"/>
              <xsl:with-param name="visible" select="VISIBLE"/>
              <xsl:with-param name="htmlclass" select="HTML_CLASS"/>
              <xsl:with-param name="ftnick" select="FT_NICK"/>
              <xsl:with-param name="currentGroup" select="current-group()"/>
              </xsl:call-template>
            </xsl:for-each-group>

             <!-- Вывод отчета в таблице-->
             <div id="readOnlyDocument">
               <xsl:if test="//task:ru.xdox.objects.processes.Task/task:Report/task:Comment != '' or PROCESS_DOC != ''">
                  <p class="sectionTitle"><span>Комментарий по задаче</span></p>
               </xsl:if>
               <xsl:if test="//task:ru.xdox.objects.processes.Task/task:Report/task:Comment != ''">
                   <div class="cat">
                      <div class="key"><span>Комментарий</span></div>
                      <div class="value">
                            <xsl:value-of select="//task:ru.xdox.objects.processes.Task/task:Report/task:Comment"/>
                      </div>
                  </div>
               </xsl:if>
               <!-- Сведения о приложениx-->
               <xsl:if test="//PROCESS_DOC != '' ">
               <table class="attechment_header correspondenceTable">
                  <thead>
                      <tr>
                        <th>Сведения о приложениx</th>
                        <th>Примечание</th>
                      </tr>
                  </thead>
                  <tbody>
                    <xsl:for-each select="//PROCESS_DOC/ROW_SET/ROW">
                      <tr>
                        <td>
                          <xsl:element name="a">
                              <xsl:choose>
                                 <xsl:when test="FN_DOC_TYPE != 2">
                                    <xsl:attribute name="href">tabInfo.action?documentId=<xsl:value-of select="FK_DOC"/>&amp;tab=PCARDGIO3_CARD</xsl:attribute>
                                    <div class="iconApplicationDocument"></div>
                                    <img class="iconApplication" src="/{//PORTAL-STATIC/ROW_SET/ROW/PORTALSTATIC}/img/form/iconNew.png"/>
                                 </xsl:when>
                                 <xsl:otherwise>
                                    <xsl:attribute name="href">/elib/getFile.action?contentType=application/octet-stream&amp;cardId=<xsl:value-of select="FK_FILE"/></xsl:attribute>
                                    <div class="iconApplicationFile"></div>
                                    <img class="iconApplication" src="/{//PORTAL-STATIC/ROW_SET/ROW/PORTALSTATIC}/img/form/iconSave.png"/>
                                 </xsl:otherwise>
                              </xsl:choose>
                              <xsl:value-of select="FV_NAME"/>
                            </xsl:element>
                        </td>
                        <td></td>
                      </tr>
                    </xsl:for-each>
                  </tbody>
               </table>
             </xsl:if>
             </div>

             <!-- Галерея -->
             <xsl:if test="count(//PDOC_FILES/ROW_SET/ROW) &gt; 0 or count(//PROCESS_DOC_ATTACHED_FILES/ROW_SET/ROW) &gt; 0">
              <p class="sectionTitle"><span>Галерея документа</span></p>
                  <div class="document-gallery">
                      <xsl:for-each select="//PDOC_FILES/ROW_SET/ROW">
                        <a class="document-gallery-thumb" rel="fancybox" data-ep="{ECP}" data-cardid="{FK_CARD_ID}" data-pagecount="{PAGECOUNT}" href="/portal/getImage.action?cardId={FK_CARD_ID}&amp;page=1" style="background-image: url(/portal/getThumb.action?cardId={FK_CARD_ID}&amp;page=1)" title="{FV_NAME}"></a>
                      </xsl:for-each>
                      <xsl:for-each select="//PROCESS_DOC_ATTACHED_FILES/ROW_SET/ROW">
                        <a class="document-gallery-thumb" rel="fancybox" data-ep="{ECP}" data-cardid="{FK_CARD_ID}" data-pagecount="{PAGECOUNT}" href="/portal/getImage.action?cardId={FK_CARD_ID}&amp;page=1" style="background-image: url(/portal/getThumb.action?cardId={FK_CARD_ID}&amp;page=1)" title="{FV_NAME}"></a>
                      </xsl:for-each>
                  </div>
             </xsl:if>


                <xsl:if test="//FILES_ADDICTED/ROW_SET/ROW!=''">
                  <p class="sectionTitle"><span>Приложение</span></p>
                </xsl:if>
                <xsl:for-each select="//FILES_ADDICTED/ROW_SET/ROW">
                  <div class="simpleFile">
                    <img class="docMini" src="/{//PORTAL-STATIC/ROW_SET/ROW/PORTALSTATIC}/img/pdf.png" style="float:left"/>
                    <a href="getFile.action?cardId={FK_FILE}"><xsl:value-of select="FV_NAME"/></a>
                  </div>
                </xsl:for-each>
            <!-- // Галерея -->

             <!--Вывод отчета в форме-->
             <div id="editDocument">
                 <!-- автоформы-->
                 <p class="sectionTitle" id="inputDataHeader" style="display:none"><span>Внести данные по задаче</span></p>
                 <div id="autoformPlace" style="width: 100%;"></div>

                 <p class="sectionTitle commentReport"><span>Комментарий по задаче</span></p>
                 <!--div class="formWrapper"-->
                    <form class="form" method="post" theme="simple" id="formReport" action="/xdox/saveProcessTask.action">

                      <input type="hidden" name="saved" value="true" id="saved"/>
                      <input type="hidden" id="toform_processId" name="process" value="{//process:ru.xdox.objects.processes.Process/process:Id}"/>
                      <input type="hidden" id="processId" name="process_" value="{//process:ru.xdox.objects.processes.Process/process:Id}"/>
                      <input type="hidden" id="toform_taskId" name="taskId" value="{//task:ru.xdox.objects.processes.Task/task:Id}"/>

                      <!--Заполняются в зависимости от действия-->
                      <input type="hidden" id="toform_listAlias" name="listAlias" value=""/>
                      <input type="hidden" id="toform_action" name="action" value=""/>
                      <input type="hidden" id="toform_parameters" name="parameters" value=""/>


                      <!-- Временный отчет об исполнениии-->
                      <!--div class="line max commentReport">
                          <label class="inputName">Комментарий</label>
                          <span class="inputWrap"-->
                              <textarea id="reportText" name="comment" rows="5" placeholder="Добавить комментарий"><xsl:value-of select="//task:Report/task:Comment"/></textarea>
                          <!--/span>
                      </div-->

                      <!--Док листы-->
                      <input id="doclist" type="hidden" value="{PROCESS_DOC/ROW_SET/ROW/FK_DOC_LIST}" name="docListId"/>
                      <div id="attachments"></div>
                    </form>
                <!--/div-->

                <!--div class="GreyLineDivider commentReport"></div-->

                <!--Временный отчет BUTTON-->
                <!--div class="createReportAction btn_menu commentReport" style="margin-left:280px">
                </div-->

                <!--div class="GreyLineDivider commentReport"></div-->

                <!--p class="sectionTitle"><span>Завершить задачу</span></p-->
                <!--Выполнить/Отклонить-->
                <!--div class="nextTaskAction assignResponsibleAction btn_close"></div-->

                <div class="buttonBlock">
                    <span class="nextTaskAction assignResponsibleAction reassignTaskAction btn_close"></span>
                    <span class="createReportAction btn_menu commentReport"></span>

                </div>

                <div class="clear"></div>
            </div>
            </div>
          </div>
      </div>
    </div></div><!--mainwrap-->
      {B{CARD$MGE$PROCESSTASK_TASK_CARD2}E}
  </xsl:template>

  <!--Обработка даты-->
  <xsl:template name="date_transform">
    <xsl:param name="old_date"/>
    <xsl:choose>
      <xsl:when test="substring($old_date,5,1) = '-' and substring($old_date,8,1) = '-'">
        <xsl:value-of select="substring($old_date,9,2)"/>
        <xsl:text>.</xsl:text>
        <xsl:value-of select="substring($old_date,6,2)"/>
        <xsl:text>.</xsl:text>
        <xsl:value-of select="substring($old_date,1,4)"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$old_date"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!--Обработка времени-->
  <xsl:template name="time_transform">
    <xsl:param name="date"/>
    <xsl:value-of select="substring($date,12,5)"/>
  </xsl:template>


  <xsl:template match="ROW">
         <div class="block_number_document">
            <a href="/portal/tabInfo.action?documentId={CASE_ID}&amp;tab=APPEAL_CARD&amp;tab2=APPEAL_CARD" target="_blank" class="number_document">
              <xsl:choose>
                  <xsl:when test="CASE_NUM != ''">
                      <xsl:value-of select="CASE_NUM"/>
                  </xsl:when>
                  <xsl:when test="REG_NUM != ''">
                      <xsl:value-of select="REG_NUM"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:if test="REG_DATE != ''">
                      б/н
                    </xsl:if>
                  </xsl:otherwise>
              </xsl:choose>
            </a>
            <xsl:if test="REG_DATE != ''">
              <div class="color_light_gray">от <xsl:value-of select="REG_DATE"/></div>
            </xsl:if>
          </div>
          <div class="value">
        <div><xsl:value-of select="OBJ_ADDRESS" disable-output-escaping="yes"/></div>
        <div class="color_light_gray" style="font-weight:normal"><xsl:value-of select="OBJ_NAME" disable-output-escaping="yes"/></div>
     </div>
  </xsl:template>

  <!--Шаблон карточки ГИО3-->

  {B{CARD$GIO3$TEMPLATE}E}


  <!--Шаблон галереи-->
  {B{CARD$GALLERY_DOCUMENT}E}


</xsl:stylesheet>

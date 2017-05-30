    <xsl:preserve-space elements="textarea"/>

    <!-- ********************************* COMMON$FRM_LAYOUT$V0 начало ******************************** -->

    <!-- **** элементы разметки **** -->
    {B{FRM$XML_LAYOUT$V0.1-SECTION}E}
    {B{FRM$XML_LAYOUT$V0.1-FORM}E}
    {B{FRM$XML_LAYOUT$V0.1-COMMON}E}
    {B{FRM$XML_LAYOUT$V0.1-CHECKBOX}E}
    {B{FRM$XML_LAYOUT$V0.1-TABLE}E}
    {B{FRM$XML_LAYOUT$V0.1-SELECT}E}
    {B{FRM$XML_LAYOUT$V0.1-RADIO}E}



    <!-- главный темплейт -->
    <xsl:template name="pageBuilder">
        <xsl:param name="data" required="yes"/>
        <xsl:param name="layout" required="yes"/>
        <xsl:param name="customStyles" required="yes"/>
                <html>
                    <head>

                        <link type="text/css" rel="stylesheet" href="/portal_static/css/reset.css"/>
                        <link type="text/css" rel="stylesheet" href="/static/typeForm/css/colorbox/colorbox.css"/>

                        <link type="text/css" rel="stylesheet" href="/portal_static/css/ps/form.css"/>
                        <link type="text/css" rel="stylesheet" href="/portal_static/css/ps/theme/ui.core.css" media="screen"/>
                        <link type="text/css" rel="stylesheet" href="/portal_static/css/ps/theme/ui.theme.css" media="screen"/>
                        <link type="text/css" rel="stylesheet" href="/portal_static/css/ps/theme/ui.datepicker.css" media="screen"/>
                        <link href="/static/TokenInput/latest/token-input.css" rel="stylesheet" type="text/css"/>
                        <link href="/static/typeForm/css/form.css" media="screen" rel="stylesheet" type="text/css"/>
                        <link href="/static/multiselect/multiselect.css" media="screen" rel="stylesheet" type="text/css"/>
                        <link type="text/css" rel="stylesheet" href="/static/typeForm/css/fileuploader.css" media="screen"/>
                        <script type="text/javascript">
                            window.sections = [];
                        </script>
                        <style type="text/css">
                          .fieldDescription {
                              background: #ffffcc none repeat scroll 0 0;
                              border-color: lightgrey;
                              border-style: solid;
                              border-width: 1px;
                              display: block;
                              font-size: 8pt;
                              line-height: 9pt;
                              //margin-left: 250px;
                              margin-top: 5px;
                              opacity: 0.75;
                              padding: 5px 10px;
                              position: relative;
                          }
                          .formWrapper input.cancel {
                            padding: 0 20px;
                          }
                          .line.checkbox label {
                            display: inline-block;
                            cursor: pointer;
                          }
                          .line.checkbox .checkbox-wrap  {
                            position: relative;
                          }
                          .sectionBtnDelete {
                            width:auto;
                            float:right;
                          }
                          .sectionBtnAdd {
                            width:auto;
                            font-weight:normal;
                            margin-right:48px;
                            float:right;
                          }
              /* radio inputs */
              .line.radio input[type=radio]{
              margin-right: 4px;
              width: 20px;
              height: 20px;
              margin-top: 5px;
              }
              .line.radio label.labelFloat + label.labelFloat{
              margin-left: 20px;
              }

                        </style>

                        <!-- дополнительные стили-->

                        {B{FRM$XML_LAYOUT$V0.1-BASIC_STYLES}E}
                        {B{FRM$XML_GENERATION$V0.1}E}
                        <link type="text/css" rel="stylesheet" href="/portal_static/css/form-customize.css" />
                        <xsl:copy-of select="$customStyles"/>

                    </head>
                    <body>

                        <div id="loadingIndicator">
                            <img src="img/loading2.gif"/>
                        </div>

                        <script type="text/javascript" src="/static/JQuery/1.8.3/jquery.min.js"/>

        <xsl:call-template name="Context.execute">
            <xsl:with-param name="contextData" select="$data"/>
            <xsl:with-param name="markup" select="$layout">
            </xsl:with-param>
        </xsl:call-template>


                        <!--**********************************  COMMON$FRM$SCRIPTS$V2 начало **********************************-->
                        <script type="text/javascript">
                          var h = {dic:function(a,b){return b;}}
                        </script>
                        <script type="text/javascript" src="/portal/js/spbren/configuration.js"></script>
                        <!--script type="text/javascript" src="/static/FileUploader/2.0-beta/fileuploader.js"></script-->
                        <script type="text/javascript" src="/static/HSF/latest/hsf.js"/>
                        <script type="text/javascript" src="/static/JQuery/1.8.3/jquery.min.js"/>
                        <script type="text/javascript" src="/static/JQueryPlugins/jquery.meio.mask-1.1.3.js"/>
                        <script type="text/javascript" src="/static/JQueryPlugins/jquery.ricos.select-1.0-full.js"></script>
                        <script type="text/javascript" src="/static/JQueryUI/1.9.1/jquery-ui-1.9.1.custom.min.js"></script>
                        <script type="text/javascript" src="/portal_static/js/form/ajaxupload-fix.js"></script>

                        <script type="text/javascript" src="/static/JQueryPlugins/ui.datepicker-ru.js"></script>
                        <script type="text/javascript" src="/forms_gzk/js/main.js"></script>
                        <script type="text/javascript" src="/static/TokenInput/latest/jquery.tokeninput.js"></script>
                        <script type="text/javascript" src="/static/typeForm/formHelper.js"></script>
                        <script type="text/javascript" src="/static/JQueryPlugins/jquery.ba-hashchange.min.js"></script>
                        <script type="text/javascript" src="/static/FileUploader/2.0-beta/fileuploader.js"></script>
                        <script type="text/javascript" src="/static/Colorbox/1.4.33/jquery.colorbox-1.4.33-min.js"></script>



                        <!--script type="text/javascript" src="/static/typeForm/sign.js"></script-->
                        <script type="text/javascript" src="/elib/js/sign.js"></script>

                        <script type="text/javascript" src="/static/JQueryPlugins/jquery.fileUp.js"></script>
                        <script type="text/javascript" src="/static/typeForm/typeForm.js"/>
                        <script type="text/javascript" src="/static/JQueryPlugins/jquery-ui-timepicker-addon.js"/>
                         <script>
                          window.datePickerFormat = {
                              dateFormat:      "dd.mm.yy",
                              showOn:          "button",
                              buttonImage:     "/portal_static/img/searchForm/calIco.png",
                              buttonImageOnly: true,
                              changeYear:      true,
                              changeMonth:     true,
                              duration:        '',
                              showButtonPanel: true,
                              gotoCurrent:     false,
                              beforeShow:      function(i) {
									if ($(i).attr('readonly')) return false;
									window.typeForm.showPicker();
							  },
                              onClose:         window.typeForm.hidePiker
                          };
                        </script>
            <script>
              /* radio inputs */
              $(function(){

                /*$('input[type=radio]')
                  .find('.overTrop')
                  .remove()
                  .after('<span class="overTrop"></span>')
                  .addClass('masked')
                  .click(function () {
                    var el = this;
                    return !(el.readOnly === true || el.getAttribute('readonly'));
                    })
                  .change(function () {
                    var $input;
                    if (this.readOnly === true || this.getAttribute('readonly')) {
                      return false;
                      }
                    if (this.type === 'radio') {
                      $input = $(this).parent().find('input[type=radio], input[type=checkbox]');
                      if ($input.filter(':checked').length === 1) {
                        $input
                          .closest('.line') // *
                          .find('.overTrop.checked') // **
                          .removeClass('checked') // **
                          .end() // *
                          .end() //
                          .next() // .overTrop
                          .addClass('checked');
                      } else {
                      $(this)
                        .closest('label')
                        .find('.overTrop.checked')
                        .removeClass('checked');
                      }
                    } else {
                    $input = $(this);
                    if ($input.filter(':checked').length === 1) {
                    $input
                    .next() // .overTrop
                    .addClass('checked');
                    } else {
                    $input
                    .next() // .overTrop
                    .removeClass('checked');
                    }
                    }
                    return true;
                    })
                  .attr('autocomplete', "off")
                  .filter(':checked')
                  .parent()
                  .find('.overTrop')
                  .addClass('checked');*/

                  $('input[type=radio]')
    .find('.overTrop')
    .remove()
    .after('<span class="overTrop"></span>')
    .addClass('masked')
    .attr('autocomplete', "off")
    .filter(':checked')
    .parent()
    .find('.overTrop')
    .addClass('checked');

    $(document).on('click', 'input[type="radio"]', function(){
      var el = this;
      return !(el.readOnly === true || el.getAttribute('readonly'));
    });

    $(document).on('change', 'input[type=radio], input[type=checkbox]', function(){
      var $input;
      if (this.readOnly === true || this.getAttribute('readonly')) {
        return false;
        }
      if (this.type === 'radio') {
        $input = $(this).parent().find('input[type=radio], input[type=checkbox]');
        if ($input.filter(':checked').length === 1) {
          $input
            .closest('.line') // *
            .find('.overTrop.checked') // **
            .removeClass('checked') // **
            .end() // *
            .end() //
            .next() // .overTrop
            .addClass('checked');
        } else {
        $(this)
          .closest('label')
          .find('.overTrop.checked')
          .removeClass('checked');
        }
      } else {
      $input = $(this);
      if ($input.filter(':checked').length === 1) {
      $input
      .next() // .overTrop
      .addClass('checked');
      } else {
      $input
      .next() // .overTrop
      .removeClass('checked');
      }
      }
      return true;
    });

              });
              </script>
                        <script type="text/javascript">

                            $(document).ready(function () {
                                /* Кнопка добавления переносится вниз */
                                $('.sectionContainer:not(.simpleTable)').each(function(indx, elm){
                                        var addButt = $(elm).find('.sectionBtnAdd');
                                        $(elm).append(addButt);
                                    });
                                $(document).on('click', '.sectionBtnAdd', function(){
                                    if ($(this).parents('.sectionContainer:not(.simpleTable)').length){
                                        $(this).parents('.sectionContainer:not(.simpleTable)').append($(this));
                                    }

                                });
                                window.portalUrl = "/portal/";
                                // переключение закладок
                                function onHashChange() {
                                    //window.scrollCancel = 1;
                                    var hash = window.location.hash.replace('#', '');
                                    tabToggleIndex = document.getElementById('tabIndex');
                                    if (hash === '') {
                                        if (tabToggleIndex &amp;&amp; tabToggleIndex.value) {
                                            hash = tabToggleIndex.value;
                                        } else {
                                            hash = $('div[id^=tab]:first').attr('id');
                                        }
                                    }
                                    window.hash = hash;
                                    var tabIndexInput = document.getElementById('tabIndex');
                                    if (tabIndexInput) {
                                        tabIndexInput.value = hash;
                                    }
                                    $('div[id^=tab]')
                                            .hide()
                                            .filter('#' + hash)
                                            .show();
                                    $('.tabs li')
                                            .removeClass('active')
                                            .find('a[href=#' + hash + ']')
                                            .parent()
                                            .addClass('active');
                                    //setTimeout(function() {$(window).scrollTop(0);}, 200);
                                };
                                f.addEvent(window, 'hashchange', onHashChange);
                                onHashChange();
                                window.h = window.h || {};
                                window.h.dic = function (context, text) {
                                    return text
                                };

                                $('.tokenInput').each(function(){
                                  // не инициализируем токен инпуты, которые находятся внутри секционных пустышек
                                  // потому, что потом, при добавлении секции, он не работают
                                  var pp = $(this).parents('.sectionTemplate');
                                  if (pp.length==0){
                                    initTokenInput($(this), {
                                          componentsUrl: '/components',
                                          deleteAlways: true
                                      });
                                  }
                                });

                                $(".wrapTable").on("click", ".moveRemLine .top", function(){
                                  var self = $(this),
                                      parent = self.parents(".rowWrapTable");
                                  if (!(parent.prev().hasClass("theadAFT")))   {
                                      parent.insertBefore(parent.prev());
                                  }
                                })
                                $(".wrapTable").on("click", ".moveRemLine .bottom", function(){
                                  var self = $(this),
                                      parent = self.parents(".rowWrapTable");
                                  parent.insertAfter(parent.next());
                                })
                            });
                        </script>
                        <!-- ***************************** COMMON$FRM$SCRIPTS$V2 конец *****************************-->
                    </body>
                </html>
    </xsl:template>



    <!-- subheader ********************************
    <layout:subheader xmlns:layout="URN:html-form-layout:v0.1">
    text
    </layout:subheader>
      *******************************************-->
    <xsl:template match="layout:subheader" xmlns:layout="URN:html-form-layout:v0.1">
        <div class="subheader">
            <h2 class="header">
              <xsl:apply-templates/>
            </h2>
        </div>
    </xsl:template>

    <!-- line ********************************
    <layout:line xmlns:layout="URN:html-form-layout:v0.1" />

    </layout:line>
      *******************************************-->
    <xsl:template match="layout:line" xmlns:layout="URN:html-form-layout:v0.1">
        <div class="formSpace"></div>
    </xsl:template>

    <!-- line ********************************
    <layout:line xmlns:layout="URN:html-form-layout:v0.1" />

    </layout:line>
      *******************************************-->
    <xsl:template match="layout:clear" xmlns:layout="URN:html-form-layout:v0.1">
        <div class="clear padinal"></div>
    </xsl:template>

    <!-- file ********************************
     <layout:file xmlns:layout="URN:html-form-layout:v0.1"
       value="text"
       name="NAME"
       sign="true" or sign="" for disable sign
       pre_files="XPATH"
       >

    ....
    </layout:file>
      *******************************************-->
    <xsl:template match="layout:file" xmlns:layout="URN:html-form-layout:v0.1">
        <xsl:variable name="name" select="@name"/>
      <span class="fileList"
                data-name-filename="{@name}"
                data-name-fileid="{@id}">

                <xsl:attribute name="data-pre-files">
                  <xsl:if test="@pre_files">
                    <xsl:value-of  select="string-join(ctx:extract(@pre_files), '||')"/>
                  </xsl:if>
                </xsl:attribute>

                <xsl:attribute name="data-sign">
                  <xsl:value-of select="@sign"/>
                </xsl:attribute>


                <xsl:attribute name="readonly">
                  <xsl:if test="@readonly">
                    <xsl:value-of select="ctx:extract(@readonly)"/>
                  </xsl:if>
                </xsl:attribute>

                <xsl:attribute name="data-allowedExtensions">
                  <xsl:choose>
                    <xsl:when test="@allowedExtensions != ''">
                      <xsl:value-of select="@allowedExtensions"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:text>all</xsl:text>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:attribute>

                <xsl:attribute name="data-multiple">
                  <xsl:choose>
                    <xsl:when test="@multiple != ''">
                      <xsl:value-of select="@multiple"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:text>true</xsl:text>
                    </xsl:otherwise>
                  </xsl:choose>

                </xsl:attribute>
        <xsl:if test="@filesXPATH">
            <!--span class="attachmentsTableWrapper">
                <ul class="attachmentsTable files_token">
                    <xsl:for-each select="ctx:extract(@filesXPATH)">
                    <xsl:choose>
                        <xsl:when test="FILE_ECP=1">
                            <li class="attachmentFileRow signed" id="{FILE_CARD_ID}">
                            <img src="/static/typeForm/img/key_go.png" />
                            <span class="file_name_js AttachmentFileName"><xsl:value-of select="FILE_NAME"/></span>
                        <span class="file_input_js">
                            <input type="hidden" name="{$name}" value="{FILE_CARD_ID}" />
                        </span>
                        <span class="fileSize"><xsl:value-of select="FILE_LENGTH"/></span>
                        <span class="file_delete_js deleteElem"><a href="#">?</a></span>
                        <span class="checkSign"></span>
                    </li>
                        </xsl:when>
                        <xsl:otherwise>
                            <li class="attachmentFileRow" id="{FILE_CARD_ID}">
                                <span class="file_name_js AttachmentFileName"><xsl:value-of select="FILE_NAME"/></span>
                        <span class="file_input_js">
                            <input type="hidden" name="{$name}" value="{FILE_CARD_ID}" />
                        </span>
                        <span class="fileSize"><xsl:value-of select="FILE_LENGTH"/></span>
                        <span class="file_delete_js deleteElem"><a href="#">?</a></span>
                        <span class="checkSign"></span>
                    </li>
                        </xsl:otherwise>
                    </xsl:choose>


                    </xsl:for-each>
                </ul>
            </span-->
        </xsl:if>
      </span>

    </xsl:template>






    <!-- hidden ********************************
    <layout:hidden xmlns:layout="URN:html-form-layout:v0.1"
       value="XPATH"
       name="NAME"
       id="ID"
       >

    ....
    </layout:hidden>
      *******************************************-->
    <xsl:template match="layout:hidden" xmlns:layout="URN:html-form-layout:v0.1">

        <xsl:variable name="dataSource" select="@value"/>

        <input type="hidden" name="{@name}" id="{@id}" style="{@style}">
          <!-- @todo add XML generation flags -->
          <xsl:call-template name="layoutXMLInfo">
            <xsl:with-param name="source" select="."/>
          </xsl:call-template>

          <xsl:attribute name="value">
            <xsl:value-of select="ctx:extract($dataSource)"/>
          </xsl:attribute>
        </input>

    </xsl:template>


    <!-- hiddenSection ********************************
    <layout:hiddenSection xmlns:layout="URN:html-form-layout:v0.1">

    ....
    </layout:hiddenSection>
      *******************************************-->
    <xsl:template match="layout:hiddenSection" xmlns:layout="URN:html-form-layout:v0.1">

        <div name="{@name}" id="{@id}" style="display:none;">
          <!-- @todo add XML generation flags -->
          <xsl:call-template name="layoutXMLInfo">
            <xsl:with-param name="source" select="."/>
          </xsl:call-template>

          <xsl:apply-templates/>
        </div>

    </xsl:template>

    <!-- layout:calculateFlag ******************************************
         calculate flag for a layout element
         input parameters:
            value - flag value
         returnr
            1 - if flag value if 1 or true or not empty, 0 - if it's not
    ************************************************************************-->
    <xsl:function name="layout:calculateFlag" xmlns:xs="http://www.w3.org/2001/XMLSchema">
        <xsl:param name="value"/>
          <xsl:choose>
          <xsl:when test="not(empty($value))">
            <xsl:variable name="_ro1" select="$value"/>
              <xsl:choose>
              <xsl:when test="$_ro1='1' or (($_ro1 castable as xs:boolean) and boolean($_ro1))"><xsl:text>1</xsl:text></xsl:when>
              <xsl:when test="$_ro1='0' or (($_ro1 castable as xs:boolean) and not(boolean($_ro1)))"><xsl:text>0</xsl:text></xsl:when>
              <xsl:otherwise>
                <xsl:variable name="_ro" select="ctx:extract($value)"/>
                  <xsl:choose>
                      <xsl:when test="empty($_ro)"><xsl:text>0</xsl:text></xsl:when>
                      <xsl:when test="$_ro='0' or (($_ro castable as xs:boolean) and not(boolean($_ro)))"><xsl:text>0</xsl:text></xsl:when>
                      <xsl:otherwise><xsl:text>1</xsl:text></xsl:otherwise>
                  </xsl:choose>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:when>
          <xsl:otherwise><xsl:text>0</xsl:text></xsl:otherwise>
        </xsl:choose>
    </xsl:function>


    <!-- edit ********************************
    <layout:edit xmlns:layout="URN:html-form-layout:v0.1"
       value="XPATH"
       name="NAME"
       id="ID"
       type="TEXT|DATE"
       >

    ....
    </layout:edit>
      *******************************************-->
    <xsl:template match="layout:edit" xmlns:layout="URN:html-form-layout:v0.1">

        <xsl:variable name="dataSource" select="@value"/>

        <!-- вычисленное значение которой должно отображаться в поле-->
        <xsl:variable name="dataValue">
          <xsl:choose>
            <xsl:when test="$dataSource!=''">
              <xsl:value-of select="ctx:extract($dataSource)"/>
            </xsl:when>
          </xsl:choose>
        </xsl:variable>
        <!--
        <xsl:variable name="readonly" select="layout:calculateFlag(@readonly)"/>

        <xsl:variable name="visible" select="layout:calculateFlag(@visible)"/>
        -->
        <xsl:choose>
            <!-- если type="MULTILINE" рисуем текст арию -->
            <xsl:when test="@type='MULTILINE' or @type='TEXTAREA'">
                <textarea name="{@name}" id="{@id}" style="{@style}" class="{@class}">
                    <!-- @todo add XML generation flags -->
                    <xsl:call-template name="layoutXMLInfo">
                      <xsl:with-param name="source" select="."/>
                    </xsl:call-template>
                    <xsl:call-template name="standardControlFlags">
                      <xsl:with-param name="source" select="."/>
                    </xsl:call-template>
                    <xsl:value-of select="$dataValue"/>
                </textarea>
            </xsl:when>
            <!-- если type="DATE" рисуем дату -->
            <xsl:when test="@type='DATE'">
                 <input type="text" name="{@name}" id="{@id}" style="{@style}" class="{@class} date">
                    <!-- @todo add XML generation flags -->
                    <xsl:call-template name="layoutXMLInfo">
                      <xsl:with-param name="source" select="."/>
                    </xsl:call-template>
                    <xsl:attribute name="value">
                        <xsl:value-of select="ctx:extract($dataSource)"/>
                        <!--xsl:value-of select="$dataSource"/-->
                    </xsl:attribute>
                    <xsl:call-template name="standardControlFlags">
                      <xsl:with-param name="source" select="."/>
                    </xsl:call-template>
                </input>
            </xsl:when>
            <xsl:when test="@type='SUBMIT'">
                 <input id="{@id}" type="submit" style="{@style}" class="{@class} submit">
                    <!-- @todo add XML generation flags -->
                    <xsl:call-template name="layoutXMLInfo">
                      <xsl:with-param name="source" select="."/>
                    </xsl:call-template>
                    <xsl:attribute name="value">
                        <xsl:value-of select="$dataSource"/>
                    </xsl:attribute>
                    <xsl:call-template name="standardControlFlags">
                      <xsl:with-param name="source" select="."/>
                    </xsl:call-template>
                </input>
            </xsl:when>
            <xsl:when test="@type='RESET'">
                 <input id="{@id}" type="reset" style="{@style}" class="{@class} cancel">
                    <!-- @todo add XML generation flags -->
                    <xsl:call-template name="layoutXMLInfo">
                      <xsl:with-param name="source" select="."/>
                    </xsl:call-template>
                    <xsl:attribute name="value">
                        <xsl:value-of select="$dataSource"/>
                    </xsl:attribute>
                    <xsl:call-template name="standardControlFlags">
                      <xsl:with-param name="source" select="."/>
                    </xsl:call-template>
                </input>
            </xsl:when>
            <!--<xsl:when test="@type='TEXTAREA'">
                 <textarea id="{@id}" style="{@style}" >
                    <!== @todo add XML generation flags ==>
                    <xsl:call-template name="layoutXMLInfo">
                      <xsl:with-param name="source" select="."/>
                    </xsl:call-template>

                    <xsl:value-of select="$dataSource"/>

                    <xsl:call-template name="standardControlFlags">
                      <xsl:with-param name="source" select="."/>
                    </xsl:call-template>
                </textarea>
            </xsl:when>-->
            <xsl:when test="@type='EMAIL'">
              <input type="email" name="{@name}" id="{@id}" style="{@style}" class="{@class}">
                    <!-- @todo add XML generation flags -->
                    <xsl:call-template name="layoutXMLInfo">
                      <xsl:with-param name="source" select="."/>
                    </xsl:call-template>
                    <xsl:attribute name="value">
                        <xsl:value-of select="ctx:extract($dataSource)"/>
                        <!--xsl:value-of select="$dataSource"/-->
                    </xsl:attribute>
                    <xsl:call-template name="standardControlFlags">
                      <xsl:with-param name="source" select="."/>
                    </xsl:call-template>
                </input>
            </xsl:when>
            <!-- иначе рисуем простой едит -->
            <xsl:otherwise>
                <input type="text" name="{@name}" id="{@id}" style="{@style}" class="{@class}">
                    <!-- @todo add XML generation flags -->
                    <xsl:call-template name="layoutXMLInfo">
                      <xsl:with-param name="source" select="."/>
                    </xsl:call-template>
                    <xsl:attribute name="value">
                        <xsl:value-of select="ctx:extract($dataSource)"/>
                        <!--xsl:value-of select="$dataSource"/-->
                    </xsl:attribute>
                    <xsl:call-template name="standardControlFlags">
                      <xsl:with-param name="source" select="."/>
                    </xsl:call-template>
                </input>
                <!--<div>readonly=<xsl:value-of select="$readonly"/></div>-->
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- edit ********************************
    <layout:anchor xmlns:layout="URN:html-form-layout:v0.1"
       value="value"
       href="href"
       valuePath="XPATH"
       hrefPath="XPATH"
       id="ID"
       target="target"
       >
    ....
    </layout:anchor>
      *******************************************-->

    <xsl:template match="layout:anchor" xmlns:layout="URN:html-form-layout:v0.1">
        <xsl:variable name="value">
            <xsl:choose>
                <xsl:when test="@valuePath">
                    <xsl:value-of select="ctx:extract(@valuePath)"/>
                </xsl:when>
                <xsl:when test="@value">
                    <xsl:value-of select="@value"/>
                </xsl:when>
                <xsl:otherwise>0</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:variable name="href">
            <xsl:choose>
                <xsl:when test="@hrefPath">
                    <xsl:value-of select="ctx:extract(@hrefPath)"/>
                </xsl:when>
                <xsl:when test="@href">
                    <xsl:value-of select="@href"/>
                </xsl:when>
                <xsl:otherwise>0</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <a name="{@name}" id="{@id}" style="{@style}" class="{@class}" target="{@target}">
            <xsl:attribute name="href">
                <xsl:value-of select="$href"/>
            </xsl:attribute>
            <xsl:value-of select="$value"/>
        </a>
    </xsl:template>

    <!-- tabset ********************************
    <layout:tabset xmlns:layout="URN:html-form-layout:v0.1">
      <layout:tab label="LABEL">
        ... tab content
      </layput:tab>
      <layout:tab label="LABEL">
        ... tab content
      </layput:tab>

    ....
    </layout:tabset>
      *******************************************-->
    <xsl:template match="layout:tabset" xmlns:layout="URN:html-form-layout:v0.1">
        <div>
           <!-- @todo add XML generation flags -->
            <xsl:call-template name="layoutXMLInfo">
             <xsl:with-param name="source" select="."/>
            </xsl:call-template>

            <ul class="tabs">
              <xsl:for-each select="layout:tab">
                <li>
                    <a href="#tab_{position()}">
                        <xsl:value-of select="@label"/>
                    </a>
                </li>
              </xsl:for-each>
            </ul>

            <xsl:for-each select="layout:tab">
              <div id="tab_{position()}">
                <!-- @todo add XML generation flags -->
                <xsl:call-template name="layoutXMLInfo">
                  <xsl:with-param name="source" select="."/>
                </xsl:call-template>

                <xsl:apply-templates/>
              </div>
            </xsl:for-each>
        </div>
    </xsl:template>


    <!-- header ********************************
    <layout:header xmlns:layout="URN:html-form-layout:v0.1">
    text
    </layout:header>
      *******************************************-->
    <xsl:template match="layout:header" xmlns:layout="URN:html-form-layout:v0.1">
        <div class="header">
            <h1>
                <span>
                    <xsl:apply-templates/>
                </span>
            </h1>
        </div>
    </xsl:template>


    <!-- hint ********************************
    <layout:hint xmlns:layout="URN:html-form-layout:v0.1">
    any
    </layout:header>
      *******************************************-->
    <xsl:template match="layout:hint" xmlns:layout="URN:html-form-layout:v0.1">

        <xsl:param name="field_required">0</xsl:param>
        <xsl:if test="not(exists(@visible)) or layout:calculateFlag(@visible)='1'">
          <div class="fieldDescription">
            <xsl:apply-templates>
                <xsl:with-param name="field_required" select="$field_required"/>
            </xsl:apply-templates>
          </div>
        </xsl:if>
    </xsl:template>

       <!-- text ********************************
    <layout:text xmlns:layout="URN:html-form-layout:v0.1">
    text
    </layout:header>
      *******************************************-->
    <xsl:template match="layout:text" xmlns:layout="URN:html-form-layout:v0.1">
        <div class="header">
          <xsl:value-of select="@value"/>
        </div>
    </xsl:template>



    <!-- multiselect ********************************
    <layout:multiselect xmlns:layout="URN:html-form-layout:v0.1"
       value="XPATH"
       name="NAME"
       id="ID"
       style="STYLE"
       limit="1"
       listSourceID="DICTIONARY_SQL.ID">

    ....
    </layout:multiselect>
      *******************************************-->
    <xsl:template match="layout:multiselect" xmlns:layout="URN:html-form-layout:v0.1">
      <div class="_token_input_wrapper">
        <!-- @todo add XML generation flags -->
        <xsl:call-template name="layoutXMLInfo">
          <xsl:with-param name="source" select="."/>
        </xsl:call-template>

        <xsl:if test="@id">
          <xsl:attribute name="id"><xsl:value-of select="@id"/>_wrapper</xsl:attribute>
        </xsl:if>

        <input type="text" name="{@name}" id="{@id}" style="{@style}" class="tokenInput" data-identifier="{@listSourceID}" data-load-names="true" data-info="inputName" data-paramnames="{@paramnames}">
            <xsl:if test="@limit">
                <xsl:attribute name="data-token-limit">
                    <xsl:value-of select="@limit"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@bottomHierarchy">
                <xsl:attribute name="data-bottom-hierarchy" >
                    <xsl:text>true</xsl:text>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@multiple">
                <xsl:attribute name="data-search-multiple" >
                    <xsl:text>true</xsl:text>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@viewingId">
                <xsl:attribute name="data-viewing-id">
                    <xsl:value-of select="@viewingId"/>
                </xsl:attribute>
                <xsl:attribute name="data-ext-search">true</xsl:attribute>
            </xsl:if>
            <xsl:attribute name="data-parameters">
            <xsl:choose>
              <xsl:when test="@parameters != ''">
                <xsl:value-of select="@parameters"/>
              </xsl:when>
              <xsl:when test="@parametersXPATH != ''">
                <xsl:value-of select="ctx:extract(@parametersXPATH)"/>
              </xsl:when>
              <xsl:otherwise>
              </xsl:otherwise>
            </xsl:choose>
            </xsl:attribute>
            <xsl:call-template name="standardControlFlags">
              <xsl:with-param name="source" select="."/>
            </xsl:call-template>
        </input>

        <xsl:variable name="data"><xsl:if test="@value and @value!=''"><!--<xsl:variable name="dataSource" select="@value"/>--><xsl:copy-of select="ctx:extract(@value)"/></xsl:if><xsl:if test="@textValue and @textValue!=''"><xsl:copy-of select="@textValue"/></xsl:if></xsl:variable>
        <!--<xsl:comment>value=<xsl:copy-of select="$data"/></xsl:comment>-->


        <span class="hidden tokenValues">
            <xsl:choose>
                <xsl:when test="empty($data)">
                    <span class="tokenItem">
                        <span class="tokenId"></span>
                        <span class="tokenValue"></span>
                    </span>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:for-each select="$data/*">
                        <span class="tokenItem">
                            <span class="tokenId"><xsl:value-of select="."/></span>
                            <span class="tokenValue"></span>
                        </span>
                    </xsl:for-each>
                </xsl:otherwise>
            </xsl:choose>
        </span>

      </div>
    </xsl:template>




    <!-- поле формы ********************************
    <layout:simple-field xmlns:layout="URN:html-form-layout:v0.1"
        label="GZKOBJ_TEP$FORM"
            class="medium"
        required="1|0">

    ....
    </layout:simple-field>
      *******************************************-->
    <xsl:template match="layout:simple-field" xmlns:layout="URN:html-form-layout:v0.1">
        <div>
            <xsl:attribute name="class">
                <xsl:text>line </xsl:text>
                <xsl:value-of select="@class"/>
                <xsl:if test="@required='1'">
                    <xsl:text> required </xsl:text>
                </xsl:if>
            </xsl:attribute>
            <label class="inputName">
                <xsl:value-of select="@label"/>
            </label>
            <span class="inputWrap">
                <xsl:apply-templates>
                    <xsl:with-param name="field_required" select="@required"/>
                </xsl:apply-templates>
            </span>
        </div>
    </xsl:template>



    <xsl:template match="layout:copy" xmlns:layout="URN:html-form-layout:v0.1">
        <xsl:copy-of select="./*"/>
    </xsl:template>


    <xsl:template match="*">
        <xsl:param name="field_required">0</xsl:param>
        <xsl:copy>
            <!-- @todo add XML generation flags -->
            <xsl:call-template name="layoutXMLInfo">
              <xsl:with-param name="source" select="."/>
            </xsl:call-template>

            <xsl:for-each select="@*">
                <xsl:copy/>
            </xsl:for-each>
            <xsl:apply-templates>
                <xsl:with-param name="field_required" select="$field_required"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>

    <!-- XML generation info tag processing -->
    <xsl:template name="layoutXMLInfo">
      <xsl:param name="source"/>
      <xsl:if test="$source/@xmlTag">
        <xsl:attribute name="xfTag"><xsl:value-of select="$source/@xmlTag"/></xsl:attribute>
      </xsl:if>
      <xsl:if test="$source/@xmlNS">
        <xsl:attribute name="xfNS"><xsl:value-of select="$source/@xmlNS"/></xsl:attribute>
      </xsl:if>
    </xsl:template>

    <!-- standard flags: readonly-->
    <xsl:template name="standardControlFlags">
      <xsl:param name="source"/>

      <xsl:if test="layout:calculateFlag($source/@readonly)='1'">
        <xsl:attribute name="readonly">1</xsl:attribute>
      </xsl:if>

    </xsl:template>

    <!-- ********************************* COMMON$FRM_LAYOUT$V0 конец ******************************** -->

    <!-- ************* context operating tamplates ****************** -->

    <xsl:template name="Context.setNamespace">
        <xsl:param name="contextName" required="no"/>
        <xsl:param name="namespacePrefix"/>
        <xsl:param name="namespaceURI"/>
        <xsl:variable name="ctx_1" select="ctx:addContextNamespace($contextName, $namespacePrefix, $namespaceURI)"/>
    </xsl:template>

    <xsl:template name="Context.execute">
        <xsl:param name="contextName" required="no"/>
        <xsl:param name="contextData" required="yes"/>
        <xsl:param name="markup" required="yes"/>
        <xsl:variable name="ctx_1" select="ctx:setContext($contextName, $contextData)"/>
        <xsl:apply-templates select="$markup"/>
        <xsl:variable name="ctx_2" select="ctx:releaseContext($contextName)"/>
    </xsl:template>

    <!-- ************************************************************ -->
    <xsl:preserve-space elements="textarea"/>

    <!-- ********************************* COMMON$FRM_LAYOUT$V0 начало ******************************** -->

    <!-- главный темплейт -->
    <xsl:template name="pageBuilder">
        <xsl:param name="data" required="yes"/>
        <xsl:param name="layout" required="yes"/>
                <html>
                    <head>

                        <link type="text/css" rel="stylesheet" href="/portal_static/css/reset.css"/>
                        <link type="text/css" rel="stylesheet" href="/portal_static/css/ps/form.css"/>
                        <link type="text/css" rel="stylesheet" href="/portal_static/css/ps/theme/ui.core.css" media="screen"/>
                        <link type="text/css" rel="stylesheet" href="/portal_static/css/ps/theme/ui.theme.css" media="screen"/>
                        <link type="text/css" rel="stylesheet" href="/portal_static/css/ps/theme/ui.datepicker.css" media="screen"/>
                        <link href="/static/TokenInput/latest/token-input.css" rel="stylesheet" type="text/css"/>
                        <link href="/static/typeForm/css/form.css" media="screen" rel="stylesheet" type="text/css"/>
                        <link href="/static/multiselect/multiselect.css" media="screen" rel="stylesheet" type="text/css"/>
                        <link type="text/css" rel="stylesheet" href="/static/typeForm/css/fileuploader.css" media="screen"/>
                        <link rel="stylesheet" href="https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.css"/>
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

                        </style>


                        {B{GZKOBJ_TEP$FORM_Styles}E}
                        {B{FRM$XML_GENERATION$V0}E}
                        <link type="text/css" rel="stylesheet" href="/portal_static/css/form-customize.css" />
                        <style>
                          .editor-preview-side * {
                            all: inherit;
                          }
                        </style>

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
                        <!--script type="text/javascript" src="/static/FileUploader/2.0-beta/fileuploader.js"></script-->
                        <script type="text/javascript" src="/static/HSF/latest/hsf.js"/>
                        <script type="text/javascript" src="js/spbren/configuration.js"></script>
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

                        <!--script type="text/javascript" src="/static/typeForm/sign.js"></script-->
                        <script type="text/javascript" src="/elib/js/sign.js"></script>

                        <script type="text/javascript" src="/static/JQueryPlugins/jquery.fileUp.js"></script>
                        <script type="text/javascript" src="/static/typeForm/typeForm.js"/>
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
                              beforeShow:      window.typeForm.showPicker,
                              onClose:         window.typeForm.hidePiker
                          };
                        </script>
                        <script type="text/javascript" src="/static/typeForm/formHelper.js"/>
                        <script src="https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.js"></script>
                        <script type="text/javascript">
                            $(document).ready(function () {

                                window.portalUrl = "/ugd/";

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
                                          componentsUrl: '/ugd'
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

                                window.simplemde = new SimpleMDE({ element: document.querySelector('.markdown') });

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
       name="NAME" >

    ....
    </layout:edit>
      *******************************************-->
    <xsl:template match="layout:file" xmlns:layout="URN:html-form-layout:v0.1">

      <span class="fileList"
                xftag="ID"
                data-multiple="true"
                data-name-filename="{@name}"
                data-name-fileid="{@id}"
                data-sign="true"
                data-pre-files="">
      </span>

    </xsl:template>

    <xsl:template match="layout:markdown" xmlns:layout="URN:html-form-layout:v0.1">
      <xsl:variable name="dataSource" select="@value"/>

      <textarea name="{@name}" class="markdown {@class}" id="{@id}" style="{@style}">
        <!-- @todo add XML generation flags -->
        <xsl:call-template name="layoutXMLInfo">
          <xsl:with-param name="source" select="."/>
        </xsl:call-template>

        <xsl:value-of select="ctx:extract($dataSource)"/>
      </textarea>
    </xsl:template>

   <!-- таблица ********************************
        <layout:table class="test">
          <layout:header>
            <layout:cell name="test1"/>
           ..............
          </layout:header>
          <layout:body value="//SAMPLE_LIST//ROW">
             <layout:cell>
              <layout:edit type="TEXT" style="width:120px;" value="NAME"/>
            </layout:cell>
           ...............
          </layout:body>
        </layout:table>

    *******************************************-->
    <xsl:template match="layout:table" xmlns:layout="URN:html-form-layout:v0.1">
        <xsl:variable name="ROW" select="layout:body"/>
        <xsl:variable name="this" select="."/>
        <xsl:variable name="id">
            <xsl:choose>
                <xsl:when test="@id">
                    <xsl:value-of select="@id"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="concat('x_',ex2:newUid(),'_x')"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:if test="@add='1'">

          <xsl:comment>********************** SECTION:EMPTY HIDDEN BLOCK START*******************</xsl:comment>
          <!-- пустышка для добавления -->
          <div xfProcessChildren="0" style="display:none;">

            <div class="{$id} sectionTemplate">


                <!-- строка таблицы -->
                <div class="inputWrap rowWrapTable {$id} section">
                  <!-- XML generation flags -->
                  <xsl:call-template name="layoutXMLInfo">
                    <xsl:with-param name="source" select="$this/layout:body"/>
                  </xsl:call-template>
                  <!-- ячейки таблицы -->
                  <xsl:for-each select="$ROW/layout:cell">
                    <xsl:variable name="sectionLayout" select="*"/>
                    <span class="cellWrapTable" style="{@style}">
                      <xsl:call-template name="Context.execute">
                        <!-- с пустии данными -->
                        <xsl:with-param name="contextData"><NODATA/></xsl:with-param>
                        <xsl:with-param name="markup" select="*"/>
                      </xsl:call-template>
                    </span>
                  </xsl:for-each>

                  <div class="buttonsWrap cellWrapTable">
                    <div class="addRemLine">
                      <span class="xf0_table_sectionBtnDeleteV sectionBtnDelete "><span></span></span>
                    </div>
                  </div>
                  <xsl:if test="$this/@move='1'">
                    <div class="buttonsWrap cellWrapTable">
                      <div class="moveRemLine">
                        <span class="top"><img src="/portal_static/img/upArrow.gif" style="height:15px"/></span>
                        <span class="bottom"><img src="/portal_static/img/downArrow.gif" style="height:15px"/></span>
                      </div>
                    </div>
                  </xsl:if>
                </div>
            </div>


          </div>
          <xsl:comment>********************** SECTION:EMPTY HIDDEN BLOCK END*******************</xsl:comment>
        </xsl:if>

        <!-- начало таблицы-->
        <div style="width:905px; margin:0 auto">
          <!-- XML generation flags -->
          <xsl:call-template name="layoutXMLInfo">
            <xsl:with-param name="source" select="$this"/>
          </xsl:call-template>

          <div class="line wrapTable sectionContainer {$id} {@class}" style="{@style}">
            <!-- шапка -->
            <div class="theadAFT rowWrapTable">
              <xsl:for-each select="layout:header/layout:cell">
                <label class="headWrapTable cellWrapTable" style="{@style}"><xsl:value-of select="@name"/></label>
              </xsl:for-each>
              <!-- кнопка добавления секции -->
              <xsl:if test="$this/@add='1'">
                <div class="buttonsWrap cellWrapTable">
                  <div class="">
                    <span class="xf0_table_sectionBtnAddV sectionBtnAdd" section="{$id}"><span></span></span>
                  </div>
                </div>
              </xsl:if>
            </div>

            <!-- строки с данными -->
            <xsl:comment>********************** SECTION:BLOCKS FILLED WITH DATA START*******************</xsl:comment>

              <xsl:for-each select="ctx:extract(layout:body/@value)">
                <xsl:variable name="CELL_DATA" select="."/>
                <div class="inputWrap rowWrapTable section {$id} ">
                  <!-- XML generation flags -->
                  <xsl:call-template name="layoutXMLInfo">
                    <xsl:with-param name="source" select="$this/layout:body"/>
                  </xsl:call-template>
                  <!-- ячейки таблицы -->
                  <xsl:for-each select="$ROW/layout:cell">
                      <xsl:variable name="sectionLayout" select="*"/>
                      <span class="cellWrapTable" style="{@style}">
                        <xsl:call-template name="Context.execute">
                          <xsl:with-param name="contextData" select="$CELL_DATA"/>
                          <xsl:with-param name="markup" select="*"/>
                        </xsl:call-template>
                      </span>
                  </xsl:for-each>
                  <xsl:if test="$this/@add='1'">
                    <div class="buttonsWrap cellWrapTable">
                      <div class="addRemLine">
                        <span class="xf0_table_sectionBtnDeleteV sectionBtnDelete"><span></span></span>
                      </div>
                    </div>
                  </xsl:if>
                  <xsl:if test="$this/@move='1'">
                    <div class="buttonsWrap cellWrapTable">
                      <div class="moveRemLine">
                        <span class="top"><img src="/portal_static/img/upArrow.gif" style="height:15px"/></span>
                        <span class="bottom"><img src="/portal_static/img/downArrow.gif" style="height:15px"/></span>
                      </div>
                    </div>
                  </xsl:if>
                </div>
              </xsl:for-each>


            <xsl:comment>********************** SECTION END *******************</xsl:comment>

            </div>
        </div>
    </xsl:template>


    <!-- section ********************************
    <layout xmlns:layout="URN:html-form-layout:v0.1"
        select="XPATH"
        add="1|0"
        label="Label">
    text
    </layout>
      *******************************************-->
    <xsl:template match="layout:section" xmlns:layout="URN:html-form-layout:v0.1" xmlns:ex2="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLTExtension">
        <xsl:comment>********************** SECTION:START *******************</xsl:comment>
        <xsl:variable name="this" select="."/>
        <xsl:variable name="id">
            <xsl:choose>
                <xsl:when test="@id">
                    <xsl:value-of select="@id"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="concat('x_',ex2:newUid(),'_x')"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <!-- название секции -->
        <xsl:variable name="sectionLabel" select="@label"/>
        <!-- внутренности секции -->
        <xsl:variable name="sectionLayout" select="*"/>
        <!-- добавляется если атрибут add=1-->
        <xsl:if test="@add='1'">
            <h2 class="{$id}" style="line-height:42px;">
                <xsl:value-of select="@label"/>
                <!-- кнопка добавления секции -->
                <input type="button" style="width:auto;font-weight:normal;margin-right:48px;float:right;" class="button sectionBtnAdd" section="{$id}" value="Добавить секцию &quot;{$sectionLabel}&quot;"/>
            </h2>
            <xsl:comment>********************** SECTION:EMPTY HIDDEN BLOCK START*******************</xsl:comment>
            <!-- пустышка для добавления -->
            <div xfProcessChildren="0" style="display:none;">

            <div class="{$id} sectionTemplate">

                <div class="{$id} section">
                  <!-- @todo add XML generation flags -->
                  <xsl:call-template name="layoutXMLInfo">
                    <xsl:with-param name="source" select="$this"/>
                  </xsl:call-template>
                    <xsl:call-template name="Context.execute">
                        <xsl:with-param name="contextData">
                            <NODATA/>
                        </xsl:with-param>
                        <xsl:with-param name="markup" select="$sectionLayout"/>
                    </xsl:call-template>
                    <div class="line full" style="overflow:hidden">
                        <input style="width:auto;float:right;" type="button" class="button sectionBtnDelete" value="Удалить секцию &quot;{$sectionLabel}&quot;"/>
                    </div>
                </div>
            </div>
            </div>

            <xsl:comment>********************** SECTION:EMPTY HIDDEN BLOCK END*******************</xsl:comment>
        </xsl:if>
        <!-- контейнер -->
        <div class="{$id} sectionContainer">

            <xsl:comment>********************** SECTION:BLOCKS FILLED WITH DATA START*******************</xsl:comment>

            <xsl:for-each select="ctx:extract(@select)">
                <div class="{$id} section" style="padding-top:10px;">
                    <!-- @todo add XML generation flags -->
                    <xsl:call-template name="layoutXMLInfo">
                      <xsl:with-param name="source" select="$this"/>
                    </xsl:call-template>

                    <xsl:call-template name="Context.execute">
                        <xsl:with-param name="contextData" select="."/>
                        <xsl:with-param name="markup" select="$sectionLayout"/>
                    </xsl:call-template>
                    <!--<div style="display:none;"> <xsl:copy-of select="$this"/> </div>-->
                    <div class="line full" style="overflow:hidden">
                        <input style="width:auto;float:right;" type="button" class="button sectionBtnDelete" value="Удалить секцию &quot;{$sectionLabel}&quot;"/>
                    </div>
                </div>
            </xsl:for-each>
        </div>
        <xsl:comment>********************** SECTION END *******************</xsl:comment>
    </xsl:template>

    <!-- hidden ********************************
    <layout:hidden xmlns:layout="URN:html-form-layout:v0.1"
       value="XPATH"
       name="NAME"
       id="ID"
       >

    ....
    </layout:edit>
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
    </layout:edit>
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
        <!--
        <xsl:variable name="readonly" select="layout:calculateFlag(@readonly)"/>

        <xsl:variable name="visible" select="layout:calculateFlag(@visible)"/>
        -->
        <xsl:choose>
            <!-- если type="MULTILINE" рисуем текст арию -->
            <xsl:when test="@type='MULTILINE'">
                <textarea name="{@name}" id="{@id}" style="{@style}">
                    <!-- @todo add XML generation flags -->
                    <xsl:call-template name="layoutXMLInfo">
                      <xsl:with-param name="source" select="."/>
                    </xsl:call-template>
                    <xsl:call-template name="standardControlFlags">
                      <xsl:with-param name="source" select="."/>
                    </xsl:call-template>
                    <xsl:value-of select="ctx:extract($dataSource)"/>
                </textarea>
            </xsl:when>
            <!-- если type="DATE" рисуем дату -->
            <xsl:when test="@type='DATE'">
                 <input type="text" name="{@name}" id="{@id}" style="{@style}" class="date">
                    <!-- @todo add XML generation flags -->
                    <xsl:call-template name="layoutXMLInfo">
                      <xsl:with-param name="source" select="."/>
                    </xsl:call-template>
                    <xsl:attribute name="value">
                        <xsl:value-of select="ctx:extract($dataSource)"/>
                    </xsl:attribute>
                    <xsl:call-template name="standardControlFlags">
                      <xsl:with-param name="source" select="."/>
                    </xsl:call-template>
                </input>
            </xsl:when>
            <xsl:when test="@type='SUBMIT'">
                 <input id="{@id}" type="submit" style="{@style}" class="submit">
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
                 <input id="{@id}" type="reset" style="{@style}" class="cancel">
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
            <!-- Поле с типом email -->
            <xsl:when test="@type='EMAIL'">
                <input type="email" name="{@name}" id="{@id}" style="{@style}" onblur="this.checkValidity();">
                    <!-- @todo add XML generation flags -->
                    <xsl:call-template name="layoutXMLInfo">
                      <xsl:with-param name="source" select="."/>
                    </xsl:call-template>
                    <xsl:attribute name="value">
                        <xsl:value-of select="ctx:extract($dataSource)"/>
                    </xsl:attribute>
                    <xsl:call-template name="standardControlFlags">
                      <xsl:with-param name="source" select="."/>
                    </xsl:call-template>
                </input>
            </xsl:when>
            <!-- иначе рисуем простой едит -->
            <xsl:otherwise>
                <input type="text" name="{@name}" id="{@id}" style="{@style}">
                    <!-- @todo add XML generation flags -->
                    <xsl:call-template name="layoutXMLInfo">
                      <xsl:with-param name="source" select="."/>
                    </xsl:call-template>
                    <xsl:attribute name="value">
                        <xsl:value-of select="ctx:extract($dataSource)"/>
                    </xsl:attribute>
                    <xsl:call-template name="standardControlFlags">
                      <xsl:with-param name="source" select="."/>
                    </xsl:call-template>
                </input>
				<!--<div>readonly=<xsl:value-of select="$readonly"/></div>-->
            </xsl:otherwise>
        </xsl:choose>
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

    <!-- форма ********************************
    <layout:form xmlns:layout="URN:html-form-layout:v0.1"
        actionId="GZKOBJ_TEP$FORM"
            action="submit/simpleSubmit.action?action=GZKOBJ_TEP$FORM"
        method="POST"
        target="TARGET">

    ....
    </layout:form>
      *******************************************-->
    <xsl:template match="layout:form" xmlns:layout="URN:html-form-layout:v0.1" xmlns:ex2="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLTExtension">
        <xsl:variable name="id">
            <xsl:choose>
                <xsl:when test="@id">
                    <xsl:value-of select="@id"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="concat('x_',ex2:newUid(),'_x')"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <div class="formWrapper {$id}" id="formWrapper">
            <form class="form {$id}" id="{$id}">
                <!-- @todo add XML generation flags -->
                <xsl:call-template name="layoutXMLInfo">
                  <xsl:with-param name="source" select="."/>
                </xsl:call-template>

                <!-- атрибуты формы -->
                <xsl:choose>
                    <xsl:when test="@actionId">
                        <xsl:attribute name="action">submit/simpleSubmit.action?action=<xsl:value-of select="@actionId"/>
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="@action">
                        <xsl:attribute name="action">
                            <xsl:value-of select="@action"/>
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>

                <xsl:choose>
                    <xsl:when test="@method">
                        <xsl:attribute name="method">
                            <xsl:value-of select="@method"/>
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:attribute name="method">POST</xsl:attribute>
                    </xsl:otherwise>
                </xsl:choose>

                <xsl:choose>
                    <xsl:when test="@target">
                        <xsl:attribute name="target">
                            <xsl:value-of select="@target"/>
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>

                <!-- @todo add XML generation flags -->
                <input type="hidden" name="XML" id="{$id}_XML" value=""/>

                <xsl:apply-templates/>

                <br/>
                <!-- <a href="getCardHtml.action?cardId=COMMON$FRM$CARD_EDIT$CODE&amp;PAGE_ID={//cardId}&amp;documentId={//documentId}" target="pageEditor">Редактор</a> -->
                <p/>

            </form>
        </div>
        <!-- **************************************
            скрипт обработки контролов формы
            добавить привязку на конкретную форму
         ************************************** -->
    <script type="text/javascript">
        <!--
        обработка
        кнопки
        добавления
        секции -->
        function initForm()
        {
          if (!!$.fn['fileUp']) $('.fileList').fileUp();
        }

       $(document).ready(function () {
             var formId = '<xsl:value-of select="$id"/>';
             $form = $( '.form.' + formId );
        //     //$('.form.' + formId + ' input.button.sectionBtnAdd').click(function () {
        //     $('.form.' + formId + ' .sectionBtnAdd').click(function () {
        //         var sectionId = $(this).attr("section");
        //         var sectionTemplate = $('.sectionTemplate.' + sectionId).html();
        //         var cont = $('.sectionContainer.'+sectionId);
        //         <!--//добавляем блок-->
        //         $(cont).append(sectionTemplate);
        //         var sections = $('.section.'+sectionId, cont);
        //         var section = sections[sections.length-1];
        //         <!--//инициализация токенинпутов-->
        //         <!-- @todo добавить инициализацию других элементов -->
        //         $('.tokenInput',section).each(function () {
        //                             initTokenInput ($(this), {
        //                                 componentsUrl: '/ugd'
        //                             });
        //                         });

        //         //$('.sectionContainer.' + sectionId).append(sectionTemplate);
        //         <!-- добавить инициализацию нового блока -->

        //     });
        //     <!-- обработка кнопки удаление секции -->
        //     $('.form.' + formId).on('click', '.sectionBtnDelete', function () {
        //         $(this).parents('.section').remove();
        //     });

        //     $( '.form.' + formId ).submit(function( event ) {
        //         var xmlAsString = xf_generateXML(formId);
        //         console.log(xmlAsString);
        //         $('#'+formId+'_XML').val(xmlAsString);
        //         //event.preventDefault();
        //     });

        $form.submit(function( event ) {
                 var xmlAsString = xf_generateXML(formId);
                 console.log(xmlAsString);
                 $('#'+formId+'_XML').val(xmlAsString);
                 //event.preventDefault();
             });
       });
    </script>

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

        <input type="text" name="{@name}" id="{@id}" style="{@style}" class="tokenInput" data-identifier="{@listSourceID}" data-load-names="true" data-info="inputName">
            <xsl:if test="@limit">
                <xsl:attribute name="data-token-limit">
                    <xsl:value-of select="@limit"/>
                </xsl:attribute>
              	<xsl:if test="@limit &gt; 1">
                  <xsl:attribute name="data-search-multiple">true</xsl:attribute>
                </xsl:if>
            </xsl:if>
            <xsl:if test="@button">
                <xsl:attribute name="data-ext-search">
                    <xsl:value-of select="@button"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@viewingID">
                <xsl:attribute name="data-viewing-id">
                    <xsl:value-of select="@viewingID"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:call-template name="standardControlFlags">
              <xsl:with-param name="source" select="."/>
            </xsl:call-template>
        </input>

        <xsl:variable name="data">
            <xsl:if test="@value and @value!=''">
                <!--<xsl:variable name="dataSource" select="@value"/>-->
                <xsl:copy-of select="ctx:extract(@value)"/>
            </xsl:if>
        </xsl:variable>
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
                            <span class="tokenId">
                                <xsl:value-of select="."/>
                            </span>
                            <span class="tokenValue"></span>
                        </span>
                    </xsl:for-each>
                </xsl:otherwise>
            </xsl:choose>
        </span>

      </div>
    </xsl:template>


    <!-- комбобокс ********************************
    <layout:select xmlns:layout="URN:html-form-layout:v0.1"
       name="NAME"
       value="VALUE"
       listSource="XPATH">

    ....
    </layout:simple-field>
      *******************************************-->
    <xsl:template match="layout:select" xmlns:layout="URN:html-form-layout:v0.1">

        <xsl:param name="field_required">0</xsl:param>

        <xsl:variable name="value" select="ctx:extract(@value)"/>

        <select name="{@name}" id="{@id}">
            <!-- @todo add XML generation flags -->
            <xsl:call-template name="layoutXMLInfo">
               <xsl:with-param name="source" select="."/>
            </xsl:call-template>

            <xsl:call-template name="standardControlFlags">
              <xsl:with-param name="source" select="."/>
            </xsl:call-template>

            <xsl:if test="@readonly='1'">
                <xsl:attribute name="readonly">1</xsl:attribute>
            </xsl:if>
            <xsl:if test="$field_required!='1'">
                <option></option>
            </xsl:if>

            <xsl:choose>
                <xsl:when test="@listSourceID">
                    <xsl:variable name="listData" select="ex2:dictionarySQL( @listSourceID )"/>
                    <xsl:for-each select="$listData//ROW">
                        <option value="{ID}">
                            <xsl:if test="$value=ID">
                                <xsl:attribute name="selected">1</xsl:attribute>
                            </xsl:if>
                            <xsl:value-of select="NAME"/>
                        </option>
                    </xsl:for-each>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:for-each select="ctx:extract(concat('//',@listSource,'//ROW'))">

                        <option value="{ID}">
                            <xsl:if test="$value=ID">
                                <xsl:attribute name="selected">1</xsl:attribute>
                            </xsl:if>
                            <xsl:value-of select="NAME"/>
                        </option>
                    </xsl:for-each>
                </xsl:otherwise>
            </xsl:choose>

        </select>

    </xsl:template>


    <!-- checkbox ********************************
    <layout:checkbox xmlns:layout="URN:html-form-layout:v0.1"
       valueChecked="VALUE"
       valueUnchecked="VALUE"
       labelChecked="LABEL"
       labelUnchecked="LABEL"
       data="XPATH"
       name="NAME"
       id="ID"
       forceCheckbox="1|0">

    ....
    </layout:checkbox>
      *******************************************-->
    <xsl:template match="layout:checkbox" xmlns:layout="URN:html-form-layout:v0.1">

        <xsl:param name="field_required">0</xsl:param>

        <xsl:variable name="value" select="ctx:extract(@value)"/>

        <xsl:variable name="valueChecked">
            <xsl:choose>
                <xsl:when test="@valueChecked">
                    <xsl:value-of select="@valueChecked"/>
                </xsl:when>
                <xsl:otherwise>1</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:variable name="valueUnchecked">
            <xsl:choose>
                <xsl:when test="@valueUnchecked">
                    <xsl:value-of select="@valueUnchecked"/>
                </xsl:when>
                <xsl:otherwise>0</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:choose>
            <xsl:when test="not(@forceCheckbox) or @forceCheckbox!='1'">
                <select name="{@name}" id="{@id}" style="{@style}">
                    <!-- @todo add XML generation flags -->
                    <xsl:call-template name="layoutXMLInfo">
                      <xsl:with-param name="source" select="."/>
                    </xsl:call-template>
            		<xsl:call-template name="standardControlFlags">
              		  <xsl:with-param name="source" select="."/>
                    </xsl:call-template>

                    <xsl:if test="@readonly='1'">
                        <xsl:attribute name="readonly">1</xsl:attribute>
                    </xsl:if>

                    <option>
                        <xsl:if test="$value!=$valueChecked">
                            <xsl:attribute name="selected">1</xsl:attribute>
                        </xsl:if>

                        <xsl:attribute name="value">
                            <xsl:value-of select="$valueUnchecked"/>
                        </xsl:attribute>

                        <xsl:choose>
                            <xsl:when test="@labelUnchecked">
                                <xsl:value-of select="@labelUnchecked"/>
                            </xsl:when>
                            <xsl:otherwise>Нет</xsl:otherwise>
                        </xsl:choose>
                    </option>

                    <option>
                        <xsl:if test="$value=$valueChecked">
                            <xsl:attribute name="selected">1</xsl:attribute>
                        </xsl:if>

                        <xsl:attribute name="value">
                            <xsl:value-of select="$valueChecked"/>
                        </xsl:attribute>

                        <xsl:choose>
                            <xsl:when test="@labelChecked">
                                <xsl:value-of select="@labelChecked"/>
                            </xsl:when>
                            <xsl:otherwise>Да</xsl:otherwise>
                        </xsl:choose>
                    </option>


                </select>

            </xsl:when>
            <xsl:otherwise>
              <div class="checkbox-wrap">
                  <input type="checkbox" name="{@name}" id="{@id}" style="{@style}">
                      <!-- @todo add XML generation flags -->
                      <xsl:call-template name="layoutXMLInfo">
                        <xsl:with-param name="source" select="."/>
                      </xsl:call-template>

              		    <xsl:call-template name="standardControlFlags">
                		    <xsl:with-param name="source" select="."/>
                      </xsl:call-template>

                      <xsl:if test="$value=$valueChecked">
                          <xsl:attribute name="checked">1</xsl:attribute>
                      </xsl:if>
                      <xsl:attribute name="value">
                          <xsl:value-of select="$valueChecked"/>
                      </xsl:attribute>

                  </input>
                  <xsl:if test="@label !=''">
                    <label for="{@id}"><xsl:value-of select="@label"/></label>
                  </xsl:if>
              </div>
            </xsl:otherwise>
        </xsl:choose>

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
            <xsl:call-template name="layoutXMLInfo">
              <xsl:with-param name="source" select="."/>
            </xsl:call-template>
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
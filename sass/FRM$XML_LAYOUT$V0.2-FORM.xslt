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
                <a href="getCardHtml.action?cardId=COMMON$FRM$CARD_EDIT$CODE&amp;PAGE_ID={//cardId}&amp;documentId={//documentId}" target="pageEditor">Редактор</a>
                <p/>

            </form>
        </div>
        <!-- **************************************
            скрипт обработки контролов формы
            добавить привязку на конкретную форму
         ************************************** -->
    <script type="text/javascript">
        function initForm()
        {
          if (!!$.fn['fileUp']) $('.fileList').fileUp();         
        }
        
        function initSectionButtons_<xsl:value-of select="$id"/>(_parent){

            <!-- обработка кнопок добавления секции -->
            // ищем все вложенные кнопки
            $('.sectionBtnAdd', _parent).click(function () {
                // добавление нового блока
                var sectionId = $(this).attr("section");
                var sectionContainer = $(this).parents('.sectionContainer.'+sectionId);
                var sectionTemplate = $('.sectionTemplate.'+sectionId,sectionContainer);
                sectionTemplate.find('input.date').datepicker('destroy');
                var sectionTemplateHtml = sectionTemplate.html();
                var newSection = $(sectionTemplateHtml).appendTo(sectionContainer);
                
                (sectionContainer.children('.section').length > 0 ) ? sectionContainer.removeClass('sectionEmpty') : sectionContainer.addClass('sectionEmpty');

                //init tokenInputs
                $('.tokenInput',newSection).each(function () {
                  initTokenInput ($(this));
                });

                //init datepicker
                $('input.date', newSection).removeAttr('id').datepicker(window.datePickerFormat);

//                $('select', newSection).removeAttr('id').customSelect('destroy');
//                $('select', newSection).customSelect();

                //init buttons
                initSectionButtons_<xsl:value-of select="$id"/>(newSection); 
                
             });

             <!-- обработка кнопок удаление секции -->
             $('.sectionBtnDelete', _parent).click(function () {
                var sectionId = $(this).attr("section");
                var sectionContainer = $(this).parents('.sectionContainer.'+sectionId);
                
                $(this).parents('.section.'+sectionId).remove();
                (sectionContainer.children('.section').length > 0 ) ? sectionContainer.removeClass('sectionEmpty') : sectionContainer.addClass('sectionEmpty');
             });

        
         }    

         $(document).ready(function () {
              var formId = '<xsl:value-of select="$id"/>',
                $form = $( '.form.' + formId );

              initSectionButtons_<xsl:value-of select="$id"/>($form);
              

              $('.sectionContainer').each(function(){
                ///проверяем секции на наличие записей для добавления и удаления класса, помогающего в кастомизации
                if ($(this).children('.section').length > 0 ) {
                    $(this).removeClass('sectionEmpty')

                } else {
                 $(this).addClass('sectionEmpty');
                }

              });
              
             /**
             *    Обработка сабмита формы.
             *    всключает:
             *      -  генерацию XML
             *      -  отправка формы аяксом
             *      -  обработка результата
             */
             $form.submit(function( event ) {                
                  // XML generation
                  // DO NOT REMOVE!!!!!
                  var xmlAsString = '';
                  
                  try{
                    xmlAsString = xf_generateXML(formId);
                  }catch(e){
                    alert('Ошибка ' + e.name + ":" + e.message + "\n" + e.stack); // 
                  }
                  
                  console.log(xmlAsString);
                  $('#'+formId+'_XML').val(xmlAsString);
                 
             
                  // отправка формы аяксом
                  // нужно для устранения проблемы потери парента, в случае если в форме есть аплет
                 var $this = $(this);
  
                  $.ajax({
                    url: $this.attr('action'),
                    type : 'POST', //$this.attr('method'),
                    data: $this.serialize()
                  }).done(function(data) {
                    console.log(data);
                    typeForm.hideLoader();
                  }).error(function(request, status, error){
                    alert(error);
                    typeForm.hideLoader();
                  });
                 

                  return false;
                 
                 //event.preventDefault();               
             });

              $form.find('input:reset').on('click', function(){
                $form[0].reset();
              });
         });

    </script>

    </xsl:template>
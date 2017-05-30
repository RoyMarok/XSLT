<xsl:template name="getConnect">
    <div class="preContentHead"></div>
    <div class="contentHead">
        <div class="contentHeadCaption">
            Получите доступ к сервисам и сведениям Cтройкомплекса<br/>
            по <b>вашим объектам</b> строительства
        </div>
        <a id="connectToService" link="/autoform/start.action?formId=ACC_REQ_CAB_FORM&amp;type=ACC_REQ_CAB" heightwin="900" widthwin="1000" href="javascript:void(0)" class="button newWindowData"><b>Подключиться к сервису</b></a>

          <xsl:if test="(//CUR_ACC_REQ_CAB//REG_REQUEST = '1') and (//CUR_ACC_REQ_CAB//REQUEST_STATUS = '1')" >
            <script>
              $('#connectToService').on('click', function(){
                var requestNumber  = '<xsl:value-of select="//CUR_ACC_REQ_CAB//REQUEST_NUMBER"/>';
                var requestDate  = '<xsl:value-of select="//CUR_ACC_REQ_CAB//REQUEST_DATE"/>';
                var requestDocId  = '<xsl:value-of select="//CUR_ACC_REQ_CAB//DOC_ID"/>';
                var requestComments  = '<xsl:value-of select="//CUR_ACC_REQ_CAB//REQUEST_COMMENTS"/>';
                var messageTemplate = '<div style="background: #fff; padding: 20px;">Ваше заявление <a href="tabInfo.action?documentId='+requestDocId+'&amp;tab=PCARDGIO3_CARD&amp;tab2=PCARDGIO3_CARD&amp;app=CAB_BUILDER">№'+requestNumber+'</a> от '+requestDate+' находится на рассмотрении в Департаменте градостроительной политики города Москвы.</div>';

                $(this).removeClass('newWindowData');
                f.createBubble(messageTemplate, 'auto', 1, {resize:true});

                return false;
              });
            </script>
          </xsl:if>

          <xsl:if test="(//CUR_ACC_REQ_CAB//REG_REQUEST = '1') and (//CUR_ACC_REQ_CAB//REQUEST_STATUS = '2')" >
            <script>
              $('#connectToService').on('click', function(){
                var requestNumber  = '<xsl:value-of select="//CUR_ACC_REQ_CAB//REQUEST_NUMBER"/>';
                var requestDate  = '<xsl:value-of select="//CUR_ACC_REQ_CAB//REQUEST_DATE"/>';
                var requestDocId  = '<xsl:value-of select="//CUR_ACC_REQ_CAB//DOC_ID"/>';
                var requestComments  = '<xsl:value-of select="//CUR_ACC_REQ_CAB//REQUEST_COMMENTS"/>';
                var messageTemplate = '<div style="background: #fff; padding: 20px;">Ваше заявление <a href="tabInfo.action?documentId='+requestDocId+'&amp;tab=PCARDGIO3_CARD&amp;tab2=PCARDGIO3_CARD&amp;app=CAB_BUILDER">№'+requestNumber+'</a> от '+requestDate+' передано на исполнение в Службу технической поддержки.</div>';
                console.log(requestDocId);
                $(this).removeClass('newWindowData');
                f.createBubble(messageTemplate, 'auto', 1, {resize:true});

                return false;
              });
            </script>
          </xsl:if>

          <xsl:if test="(//CUR_ACC_REQ_CAB//REG_REQUEST = '1') and (//CUR_ACC_REQ_CAB//REQUEST_STATUS = '3')" >
             <script>
              $('#connectToService').on('click', function(){
                var requestNumber  = '<xsl:value-of select="//CUR_ACC_REQ_CAB//REQUEST_NUMBER"/>';
                var requestDate  = '<xsl:value-of select="//CUR_ACC_REQ_CAB//REQUEST_DATE"/>';
                var requestDocId  = '<xsl:value-of select="//CUR_ACC_REQ_CAB//DOC_ID"/>';
                var requestComments  = '<xsl:value-of select="//CUR_ACC_REQ_CAB//REQUEST_COMMENTS"/>';
                var messageTemplate = '<div style="background: #fff; padding: 20px;">Ваше заявление <a href="tabInfo.action?documentId='+requestDocId+'&amp;tab=PCARDGIO3_CARD&amp;tab2=PCARDGIO3_CARD&amp;app=CAB_BUILDER">№'+requestNumber+'</a> от '+requestDate+' отклонено Департаментом градостроительной политики города Москвы.<p> Причина отклонения: '+requestComments+'</p> <a link="/autoform/start.action?formId=ACC_REQ_CAB_FORM&amp;type=ACC_REQ_CAB" heightwin="900" widthwin="1000" href="javascript:void(0)" class="newWindowData">Подать новое заявление</a></div>';

                $(this).removeClass('newWindowData');
                f.createBubble(messageTemplate, 'auto', 1, {resize:true});

                return false;
              });
            </script>
          </xsl:if>



    </div>
</xsl:template>

<xsl:template name="developersDashboardDescription">
<script>
  var alertText = '<div style="background: #fff; padding: 20px;">Данный функционал доступен после подключения к сервису Кабинет застройщика.<br/>Отправьте <a href="javascript:void(0)" onclick="$(\'#connectToService\').click()">заявку на подключение</a><br/>Департамент градостроительной политики города Москвы рассмотрит ее ближайшее время.</div>';
  var underConstructionText = '<div style="background: #fff; padding: 20px;">Данный раздел находится в разработке. <br/> Скоро появится возможность обратится в Единый Контактный центр Комплекса через Кабинет застройщика.</div>';

</script>
  <div id="developersDashboardDescription" class="contentGrayCols">
      <div class="contentColsPadding">
          <div class="contentCol purpleCol _documents_objects _clickabled">
            <a style="text-decoration: none;color: #333">
              <xsl:attribute name="href">
                <xsl:if test="normalize-space(//IS_CAB_BUILDER) = '1'">
                  <xsl:text>tabInfo.action?tab=CAB_BUILDER&amp;c=417&amp;b=64CBA9D62DD244B3A61E01E44D83EA10&amp;a=B156412A62C74AAF8B8771AF5383C84C</xsl:text>
                </xsl:if>
              </xsl:attribute>
              <xsl:attribute name="onclick">
                <xsl:if test="normalize-space(//IS_CAB_BUILDER) != '1'">
                  <xsl:text>f.createBubble(alertText, 'auto', 1, {resize:true});return false;</xsl:text>
                </xsl:if>
              </xsl:attribute>
            <div class="contentColCaption">Объекты и документы</div>
            <div class="contentColInfo">
                Основная информация по ТЭПам, документам, решениям ГЗК и РГ ГЗК по вашим объектам. Все разрешительные и градостроительные документы по вашим объектам
            </div>
            </a>
          </div>

          <div class="contentCol blue2Col _personCab _clickabled">
            <a style="text-decoration: none;color: #333" href="tabInfo.action?app=PRIVATEOFFICE&amp;tab=PRIVATEOFFICE_MAINPAGE#tab::id=0/card::cardId=CARD$PRIVATEOFFICE_MAINPAGE_BODY">

            <div class="contentColCaption">Рабочий кабинет</div>
            <div class="contentColInfo">
                Обращения в Комплекс, задачи, сервисы и аналитика
            </div>
            </a>
          </div>

          <div class="contentCol orangeCol _calculator _clickabled">
            <a style="text-decoration: none;color: #333" href="tabInfo.action?tab=PROC_CALC">
            <div class="contentColCaption">Калькулятор процедур</div>
            <div class="contentColInfo">
                Расчёт сроков и планирование последовательности прохождения строительных процедур
            </div>
            </a>
          </div>

          <div class="contentCol _services _clickabled">
            <a style="text-decoration: none;color: #333">
              <xsl:attribute name="href">
                <xsl:if test="normalize-space(//IS_CAB_BUILDER) = '1'">
                  <xsl:text>tabInfo.action?tab=CAB_BUILDER&amp;c=29&amp;b=B9E8FD2C8AB140879515D21A5DF68FD1&amp;a=3A5B67C5828B4F178746F49ADA5BC842</xsl:text>
                </xsl:if>
              </xsl:attribute>
              <xsl:attribute name="onclick">
                <xsl:if test="normalize-space(//IS_CAB_BUILDER) != '1'">
                  <xsl:text>f.createBubble(alertText, 'auto', 1, {resize:true});return false;</xsl:text>
                </xsl:if>
              </xsl:attribute>
            <div class="contentColCaption">Сервисы</div>
            <div class="contentColInfo">
                Подача заявок на утверждение проектно-сметной документации и видеомониторинг объектов строительства
            </div>
            </a>
          </div>

          <div class="contentCol blueCol _mtsk _clickabled">
            <a style="text-decoration: none;color: #333" target="_blank" href="http://mtsk.mos.ru/">
            <div class="contentColCaption">МТСК</div>
            <div class="contentColInfo">
                Каталоги и реестры для проектных, строительных, подрядных, снабженческих и других организаций
            </div>
            </a>
          </div>

          <div class="contentCol _knowledge_base _clickabled">
            <a href="tabInfo.action?tab=KNOWLEDGE_BASE#/tree::rel=1/card::cardId=CARD$KNOWLEDGE_BASE" style="text-decoration: none;color: #333" >
            <!--xsl:attribute name="onclick">
              <xsl:text>f.createBubble(underConstructionText, 'auto', 1, {resize:true});return false;</xsl:text>
            </xsl:attribute-->
            <div class="contentColCaption">База знаний</div>
            <div class="contentColInfo">
              База знаний Комплекса градостроительной политики и строительства. Решение вопросов и уточнение информации по реализации градостроительных процедур.
            </div>
            <!--div class="yellowLabel">скоро</div-->
             </a>
          </div>




      </div>


      <!--div class="contentCol">
          <div class="contentColImage"></div>
          <div class="contentColCaption">Сервисы</div>
          <p>Подать проектную документацию на утверждение</p>
          <p>Отслеживать статусы выполнения заявок</p>
      </div>
      <div class="contentCol">
          <div class="contentColImage"></div>
          <div class="contentColCaption">Объекты</div>
          <p>Актуальная информация по объектам застройщика в виде перечней сгруппированных по состоянию строительства и карточки по каждому объекту:</p>
          <ul>
              <li>состояние строительства</li>
              <li>общая информация об объекте</li>
              <li>технико-экономические показатели</li>
              <li>документы по объекту</li>
              <li>отображение объекта на карте</li>
              <li>фото и видеомониторинг</li>
              <li>решения штабов, рабочих групп и комиссий</li>
          </ul>
      </div>
      <div class="contentCol">
          <div class="contentColImage"></div>
          <div class="contentColCaption">Документы</div>
          <ul>
              <li>Градостроительный план земельного участка</li>
              <li>Свидетельство от утверждении АГР</li>
              <li>Заключение экспертизы ПСД</li>
              <li>Разрешение на строительство</li>
              <li>Заключение о соответствии</li>
              <li>Разрешение на ввод</li>
              <li>План проверок</li>
              <li>Правонарушения</li>
              <li>Штрафы</li>
          </ul>
      </div-->
    </div>

</xsl:template>
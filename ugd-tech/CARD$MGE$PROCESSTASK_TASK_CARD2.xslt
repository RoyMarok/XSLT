<script>     

      <xsl:if test="//TASK_PARAMS//PROCESS_TASK_URL != ''">
        window.location.href = '<xsl:value-of select="//TASK_PARAMS//PROCESS_TASK_URL"/>';
      </xsl:if> 
      
       window.calendarImg = "/static/typeForm/img/inputDateCalendar.gif";   
        
      /* window.console = {};  
        window.console.log = function(arg){
          return null;
      };*/

      var _xDoxUrl =  "/xdox",         
          //processId = '<xsl:value-of select="//TASK_PARAMS//PROCESSID"/>'; //ID процесса
          xslt = '<xsl:value-of select="//TASK_PARAMS//XSLT"/>'; //XSLT формы
          processId = '<xsl:value-of select="//process:ru.xdox.objects.processes.Process/process:Id"/>',
          taskId =  '<xsl:value-of select="//task:ru.xdox.objects.processes.Task/task:Id"/>',
          formId = "<xsl:value-of select="normalize-space(substring-before(substring-after(//task:ru.xdox.objects.processes.Task/task:Description,'!F'), 'F!'))"/>",
          typeDocument = '<xsl:value-of select="//TYPE_ID/ROW_SET/ROW/TYPE_ID"/>',     
          dataObjectId = '<xsl:value-of select="//DATAOBJECT_ID/ROW_SET/ROW/DATAOBJECT_ID"/>',            
          newDoc = '<xsl:value-of select="//NEW_DOC/ROW_SET/ROW/NEW_DOC"/>',  //(1 - новый, 0 - существующий)     
          newVer = '<xsl:value-of select="//NEW_VER/ROW_SET/ROW/NEW_VER"/>', //1- используем новый идентификатор ПД, 0 - остается по-прежнему SURT-1644  
          processUrl = '<xsl:value-of select="//PROCESS_URL/ROW_SET/ROW/PROCESS_URL"/>',
          isNext = false,         
          isSaveDocList = false,
          objectIds = [],      
          elibDetachedSign = '<xsl:value-of select="//DETACHED_SIGN/ROW_SET/ROW/DETACHED_SIGN"/>',
          errorsTask = $("#errorsTask"); 
        
        
      <xsl:for-each select="//PROCESS_OBJECT/ROW_SET/ROW">
        objectIds.push('<xsl:value-of select="OBJECT_ID" />');
      </xsl:for-each>
      
      var objectId = objectIds.join('$');  
  
      
      //Параметры для временного отчета
      var interim_action = '',
          interim_listAlias = '',
          interim_parameters = '',
          showDataobject = true;   // Настройка в СДОУ, отвечает за отображение формы объекта - временно статично забита в true   
 
      var actionsList = {b4e64f33364040929a3d2b8188d8c878 : "createReportAction",
                     ef47b1ad2df741348ca4aab7d355733e : "nextTaskAction",
                     bc559c6fb548426886db37498843017a : "reassignTaskAction", 
                     e5b70690cfd44ba68247b0b4fdfea222 : "contractRegistrationAction", 
                     aed36cb5d8ee4a0ea56812613e8d079c : "newTaskAction",
                     ad5d236dba04454db531a434179b648a : "assignResponsibleAction"  }; 
                     

      // Отображает индикатор загрузки - вызывать ИСКЛЮЧИТЕЛЬНО перед $.ajax()
      function showLoadingIndicator() {     

        $("#overlay").css({
          "width" : "100%",
          "height" : $(document).height()
        }).show();

        $("#loadingIndicator").css({
          top : (getScrolledTop() + 300)
        }).show();
      }

      // Прячет индикатор загрузки - вызывать ИСКЛЮЧИТЕЛЬНО в onSuccess() и onError()!
      function hideLoadingIndicator() {
       
          $("#overlay, #loadingIndicator").hide();
      } 
      
      //Функция возврата из диалогового окна с Контролером и датой ( при переходе на следующий шаг)
        function NextStepResult(json, action, params, nextTask) {            
            var date = json.data.data.deadline;
            var employees = json.data.data.employees;           
            var responsible =  json.data.data.responsible;        
            //Заполнение скрытых input для перехода к следующему шагу
            if (date != null) {
              var d = new Date(date);
              var nextDay = d.getDate() + '.' + (d.getMonth()+1)  + '.' + d.getFullYear();
              var btn= $(" <![CDATA[<input/>]]>", {            
                      "type": "hidden",
                      "name" : "nextTaskDate",
                      "id" : "nextTaskDate",
                      "value": nextDay                     
                     });                    
                     btn.appendTo("#formReport"); 
            }         
            
            btn= $("<![CDATA[<input/>]]>", {            
                      "type": "hidden",
                      "name" : "responsible",
                      "id" : "toform_responsible",
                      "value": responsible                     
                     });                    
                     btn.appendTo("#formReport");              
            
           if (employees) {
            for (var index=0; <![CDATA[index < employees.length]]>; index++)
            {                  
                  var id = employees[index]; 
                 
                  var btn= $("<![CDATA[<input/>]]>", {            
                      "type": "hidden",
                      "name" : "employees",
                      "value": id                     
                     });                    
                     btn.appendTo("#formReport"); 
                  } 
            }
            
           btn= $("<![CDATA[<input/>]]>", {            
                      "type": "hidden",
                      "name" : "nextTaskId",
                      "id" : "toform_nextTaskId",
                      "value": nextTask                     
                     });                    
                     btn.appendTo("#formReport");
           
            saveReport(action, interim_listAlias, params, true);   //SURT-1659      
        }  
        
        
      
        
            
      //Загрузка док листов
      function InitDocList(actionDocList, listAlias) {
            //инициализация доклистов
            //showLoadingIndicator();
            $.getJSON(_xDoxUrl + '/process/taskInfo?action=' + actionDocList + '&amp;listAlias=' + listAlias + '&amp;taskId=' + taskId + 
                            '&amp;parameters=&amp;processId=' + processId,
                function(data){           
                   
                  //showDataobject =  data.showDataobject;                 
                  $('#attachments').doclist('options', {
                        idFieldSelector : '#doclist',
                        files : {
                            show: data.canLoadFiles == true ? true : false,
                            uploadUrl : '/elib/upload.action',
                            scanButton : true,
                            appletsRoot : '/elib/applets',
                            uploadForAppletUrl : '/elib/uploadFileForApplet.action',
                        },
                        admDocs :
                        {
                            show : data.canEditAdmDocs == true ? true : false
                        },
                        pDocs :
                        {
                            show : data.canEditProjectDocs == true ? true : false 
                        },
                        corpDocs :
                        {
                            show : data.canEditCorpDocs == true ? true :false
                        },
                        componentsUrl : '/components',
                        elibUrl : '/elib',
                        staticUrl : '/static'                        
                    });                   
            }) 
            isSaveDocList = true;                
        };
      
       //Сохранение автоформы
     function saveAutoform(){        
       showLoadingIndicator();                
       if (showDataobject)       {                   
            if (newDoc == 1) { 
              try {
                  $.ajax({
                    url: _xDoxUrl + '/createDocument?processId=' + processId + '&amp;entityId=' + dataObjectId,                          
                    type:  'GET',
                    async: false,
                    error : function(error) { 
                      disableBtn();               
                      alert(error);       
                      console.log(error);            
                    },
                    success: function(response) {                        
                        if (response.data != null) { 
                                //Сохраняем автоформу
                                  var saveForm = saveAutoForm();// - сохранить автоформу (возвращает {"error":"","entityId":"296294A89A694636B4F6468B7F8CEFA6","cardUrl":""} )               
                                  isNext =  true;  //!!!    
                                  if ( !!(saveForm.error) ) {                                      
                                      isNext =  false;  //!!!   
                                      alert("Ошибка 006. Ошибка сохранения автоформы - " + saveForm.error);                                           
                                      hideLoadingIndicator();
                                      window.location.reload(); 
                                  } //if                               
                                  newDoc = 0;                                         
                        }//if
                        else {
                           hideLoadingIndicator();
                           alert("Ошибка 002. " + response.errors[0]);                           
                           isNext =  false;  //!!!                     
                        }  //else           
                    }//success
                })  //ajax             
              }//try 
              catch(error)
              {                   
                hideLoadingIndicator(); 
                console.log("Ошибка 007.1 " + error);
                alert("Ошибка 007.1");                          
              }; 
            }//if newDoc=1
            else  {
                //Сохраняем автоформу
                var saveForm = saveAutoForm();// -сохранить автоформу (возвращает {"error":"","entityId":"296294A89A694636B4F6468B7F8CEFA6","cardUrl":""} )                     
                    isNext =  true;  //!!!                        
                if (!!(saveForm.error)) {                                        
                  isNext =  false;  //!!!   
                  alert("Ошибка 006. Ошибка сохранения автоформы - " + saveForm.error);                                           
                  hideLoadingIndicator();
                  window.location.reload(); 
                } //if        
            }//else (newDoc=1)
        }//if (showDataobject)
        else 
        {
            isNext =  true; 
        }             
    } 
       
    // Загрузка автоформы
    function loadAutoform()
    {  
      setTimeout(function() {tabInfo.showLoading();}, 0);
      
      if (newVer == 1)
      {
        var urlVal = _xDoxUrl + '/createDocumentNewVer.action?entityId=' + dataObjectId + '&amp;processId=' + processId;
        $.ajax({
          url: urlVal,                          
          type:  'GET',
          async: false,
          error : 
              function(error) {   
                  disableBtn();                         
                  tabInfo.hideLoading(); 
                  alert("Ошибка загрузки createDocumentNewVer");            
                  console.log(error);            
              },
          success: function(json) {  
                  if (json.errors != null){
                      errorsTask.text("Ошибка 016. " + json.errors);
                      disableBtn();
                      return;            
                  }
                  else if (json.data != null)
                  {
                    dataObjectId = json.data;
                  }
                  else {
                      errorsTask.text("Ошибка 017. createDocumentNewVer вернул null");
                      disableBtn();
                      return;
                  }                          
            }//success
          }); //ajax
        } //if newVer
        
        
        $("#autoformPlace").autoForm({
          formId: formId,
          entityId: dataObjectId,
          typeDocument: typeDocument,
          objectId: objectId,
          autoformParams: "PROCESS_ID=" + processId, //UGDII-1847
          onReady: function() {
            $("#inputDataHeader").show();
            $("#autoformPlace").append('<![CDATA[<div class="GreyLineDivider GreyLineDivider2"></div>]]>');
            
            $('input.reports_Menu').each(function(){
               var $this = $(this),
                nickForDisable = $this.data('vi'),
                nickForHide = $this.data('bv'),
                $disableControl,
                $hideControl;
                
                if (nickForDisable) {
                  $disableControl = $('[nick="' + nickForDisable + '"]');
                  disableButton($disableControl, nickForDisable);
                  $disableControl.on("change", function() {              
                    disableButton($(this), nickForDisable);
                  });  
                }
                
                if (nickForHide) {
                  $hideControl = $('[nick="' + nickForHide + '"]');
                  hideButton($hideControl, nickForHide);
                  $hideControl.on("change", function() {              
                    hideButton($(this), nickForHide);
                  });  
                }
            });
            
            tabInfo.hideLoading(); 
            
            //#GGE-1862 - Не отображать блок "Ввод данных" в карточке задачи процесса, если все поля связанной формы скрыты
            rootSection = fieldSaving.getRoot();
            if (rootSection.children('.content').length) rootSection = rootSection.children('.content');
            if (!rootSection.children(':not(.hide)').length) {
              $("#autoformPlace, #inputDataHeader").hide();
            }  
          }
        });
    }
  
  //UGDIII-86 Управление видимостью перехода в процессе
  function hideButton($control, nick) {

    if ($control.length === 0) {
      alert("Нет связи кнопки и поля - "  +  nick);
      return;
    };

    var nick = $control.attr('nick'),
      controlChecked = $control.find('input:checkbox').prop('checked'),
      $button =  $('[data-bv="' + nick + '"]'); 
      
      (controlChecked) 
      ? $button.removeClass('hide') 
      : $button.addClass('hide');

  }
  
  //Блокирование кнопок перехода на следующий шаг
  function disableButton($control, nick){

    if ($control.length === 0) {
      alert("Нет связи кнопки и поля - "  +  nick);
      return;
    };

    var nick = $control.attr('nick'),
      controlChecked = $control.find('input:checkbox').prop('checked'),
      $button = $('[data-vi="' + nick + '"]');
    
    (controlChecked)
    ? $button.prop('disabled', false).removeClass('disabled')
    : $button.prop('disabled', true).addClass('disabled');
    
  }

  //Распределение событий для кнопок задачи
    function getEvent(data)
    { 
       
      switch (actionsList[data.id]) {
        // Подготовить временный отчет (кнопка сохранить данные без завершения задачи)
        case "createReportAction":             
          // Вызываем DocList
          InitDocList(data.id, data.type); 
                
         //Сохраняем параметры для временного отчета
         interim_action = data.id,
         interim_listAlias = data.type,
         interim_parameters = data.params;
         return "saveReport('" + data.id + "', '" + data.type + "', '" + data.params + "', true)";             
              
       // действия, приводящие к закрытию задачи (переход на следующий шаг)
        case "contractRegistrationAction":
        return("TaskAction.regContract('" + taskId +"')");                         
                
      //действия, приводящие к закрытию задачи (переход на следующий шаг)
      case "nextTaskAction":    
       if (data.pMap != null  <![CDATA[&&]]> 'sf' in data.pMap){ 
           return "singECP(" + (data.pMap.sf == 'a' ? true : false) + ", '" +  data.id + "', '" + data.type + "','" + data.params + "')"
       }   
       else {      
          return "NextStep('" + data.id + "', '" + data.type + "', '" + data.params + "')";    
       }           
               
      //Назначить другого исполнителя
      case "reassignTaskAction":
        return("TaskAction.reassign('" + data.id + "','" + taskId + "','" + data.params + "')");            
               
      // Перепоручение задачи
      case "newTaskAction":       
         return "NextTask();"
      
      //завершениt задачи 
      case "assignResponsibleAction":
         //Глобальная переменная для отключения док листов (т.е. не будут отображатся временные отчеты)
         isSaveDocList = false;
         $(".commentReport").hide();
         var ref = _xDoxUrl + '/processReportDialog.action?action=' + data.id + '&amp;listAlias=' + data.type +
              '&amp;taskId=' + taskId + '&amp;parameters=&amp;process=' + processId + '&amp;callback=;';
              
         return "__openTaskWin('" + ref  +  "', 'Отчет', 800, 700)";
      
       default:
        return false;           
    }       //swich  
  
    };  
    
    function singECP(detach, id, type, param)
    {
     // debugger;
      interim_action = id;
      interim_listAlias = type;
      interim_parameters = param;
      $.fn.signECP({
          detached: detach,   
          enhanceSign: true,       
          callbacks: {
                allFilesSigned: fileSigned
          }
      });
     var array = [];
     $("div.baloon-wrapp").each(function(index, obj) {   
        array.push($(obj).attr('fileid'))
      });
     $("#autoformPlace .attachmentFileRow").each(function(index, obj) {   
        array.push($(obj).attr('id'));
      });
      $('.document-gallery a[data-cardid]').each(function(index, obj) {
        array.push($(obj).attr('data-cardid'));
      });
      $.signECP.easyStart(array);

    }
    
    function fileSigned()
    {       
      
         NextStep(interim_action, interim_listAlias, interim_parameters);
    } 
      
      
    // Вызов диалогового окна с исполнителем и датой
    function NextTask()
    {
       __openTaskWin(_xDoxUrl + '/processErrandTask.action?&amp;taskId=' + taskId + '&amp;process=' + processId +
        '&amp;taskIssued=' + $('#task_issued').val(),
      h.dic("portal.script.xdox", 'Перепоручение задачи'), 800, 700);      
     }
      
    //Сохранение временного отчета об исполнении 
    //Сохранение доклистов
    function saveReport(action, listAlias, params, isNextStep)
    {         
    
      var $form = $("form#formReport");        
        
      //Заполняем скрытые input - параметры для сохранения данных
      $("#toform_listAlias").val(listAlias);
      $("#toform_action").val(action); 
      $("#toform_parameters").val(params == 'null' ? '' : params);  
      showLoadingIndicator();
        
        
      //Проверям и сохраняем автоформу  
      if (formId != '') {      
        var validForm = validateAutoForm();// - валидация  автоформы 
         if (validForm) {                                      
            hideLoadingIndicator();    
            f.createAlertBubble(validForm);
            $(".nextTaskAction input").removeAttr("disabled").removeClass("disabled"); 
            return false;
        } //if       
        saveAutoform();        
      }//if 
      else {
        isNext = true;
      } 
            
      //Сохранение доклиста
     
  /*    if ((isSaveDocList === true) &amp;&amp; ($('#attachments').data('doclist') != undefined)) 
      {
        $('#attachments').doclist("save");
      }      */
   
      if(isNext) {  
        isNext = false; //!!!!!
        //Сохранение данных / перехеод на следующий шаг
        try {                      
          var resp = $.ajax({
            url  : "/xdox/saveProcessTaskAjax.action",                
            type : 'POST',
            async: false,
            data : $form.serialize(),
            error : function(error) {   
              disableBtn();                     
              alert("Ошибка 008. Ошибка перехода на следующий шаг");
              console.log("Ошибка 008. /xdox/saveProcessTaskAjax.action - " + error);                           
            },
            success: function(data) { 
              var dataJson = data.data, errorJson=data.errors;                                                                     
              if (errorJson != null)
              {  
                alert("Ошибка 009. Ошибка перехода на следующий шаг - " + errorJson[0]);            
                //alert(errorJson[0]);
                console.log("Ошибка 009. /xdox/saveProcessTaskAjax.action - " + errorJson[0]);    
                hideLoadingIndicator();             
              }              
              else {
                  isNext = true;             
                  if (isNextStep)  {     
                      // загружаем нужную страницу, после выполнения шага                     
                      if (dataJson != '') {  
                        window.location = window.location.origin + dataJson;
                      }                      
                      else if (action =='b4e64f33364040929a3d2b8188d8c878')
                      {
                          window.location.reload(); 
                          hideLoadingIndicator();  
                      }
                      else {                         
                        window.location = window.location.origin + window.location.pathname.replace('tabInfo.action', '') + processUrl.replace(':documentId', processId);  
                      }
                  } 
                  else
                  {  
                    hideLoadingIndicator();  
                  }
              } //else              
            } //success          
          }) //ajax
        }//try
        catch(error)
        {        
          hideLoadingIndicator();  
          alert("Ошибка 007.3");  
          console.log("Ошибка 007.3 " + error);          
        };          
      } //if
     else {
       //alert("Ошибка сохранения  или перехода на следующий шаг");      
     }       
    }//function
      
    //Переход на следующий шаг 
    function NextStep(action, listAlias, parameters)
    {   
        if (parameters != null) {
          parameters = encodeURI(parameters).replace(/#/g, '%23');
        }
    
        $(".nextTaskAction input").attr("disabled", "disabled").addClass("disabled");  
       //Сохраняем временный отчет       
       // saveReport(interim_action, interim_listAlias, interim_parameters, false);   //SURT-1659 {
           try {  
              isNext = false; 
              $.getJSON(_xDoxUrl + "/checkNextTaskDialog.action?action=" + action + "&amp;listAlias=" + listAlias + 
                        "&amp;taskId=" + taskId + "&amp;parameters=" + parameters +"&amp;process=" + processId) 
                  .success(
                      function(data){    
                        if (data.data.errors != null) {
                          alert(data.data.errors);  
                          console.log("Ошибка 010. xdox/checkNextTaskDialog.action - " + data.data.errors);  
                        } else {
                          //Если есть признак вызова окна с Котролером и Датой
                          //Если параметр есть he:true - то диалоговое окно вызывать не нужно MGEII-3322
                          if (data.data.data === true &amp;&amp; parameters.indexOf('he:true') == -1){ 
                              //Вызываем диалоговое окно
                              $(".nextTaskAction input").removeAttr("disabled").removeClass("disabled");     
                              __openTaskWin(_xDoxUrl + '/processReportDialog.action?action=' + action + '&amp;listAlias=' + listAlias +
                                      '&amp;taskId=' + taskId + '&amp;parameters=' + parameters + '&amp;process=' + processId +
                                      '&amp;callback=', 'Отчет', 800, 700);                            
                          } //if  
                          else{ 
                              // Переходим на следующий шаг
                              //for debug: if (confirm('Перейти на следующий шаг?'))
                              saveReport(action, listAlias, parameters, true);                     
                          }
                        }                                        
                        hideLoadingIndicator();                        
                  })
                  .error(function() 
                  { 
                      disableBtn();
                      hideLoadingIndicator(); 
                      alert("Ошибка 010. Ошибка вызова диалогового окна для перехода на следующий шаг.");  
                      console.log("Ошибка 010. xdox/checkNextTaskDialog.action - " + error);                     
                  }) 
            } //getJson
          catch(error)
          {        
              hideLoadingIndicator();
              alert("Ошибка 007.4");  
              console.log("Ошибка 007.4 " + error); 
          };        
    } 
    
    function LoadXSLTCard(){
      var xsltCard = "<xsl:value-of select="normalize-space(substring-before(substring-after(//task:ru.xdox.objects.processes.Task/task:Description,'!X'), 'X!'))"/>";
      $.ajax({
          url: 'getCardHtml.action?cardId=' + xsltCard,                          
          type:  'GET',
          async: false,
          error : 
              function(error) {
                  alert(error);            
                  console.log(error);            
              },
          success: function(data) {  
               $("#autoformPlace").html(data); 
               $(".commentReport").hide();
               $("#formReport").hide();                 
          }//success
      }); //ajax
    }
 
    
    function errors()
    {   
        // Если есть в параметрах XSLT, тогда загружаем форму которая создана в xslt иначе ГИО3              
        if (xslt != '')
        {          
          LoadXSLTCard();
        }
        else {
        
          //Загружаем автоформы
          //Проверяем Есть ли объект процесса       
          if (formId != '') {             
                    
              if ((typeDocument == '')   &amp;&amp; (dataObjectId == '') &amp;&amp; (parseInt(newDoc) == 1)){
                   errorsTask.text("Ошибка 011. Ошибка настройки процесса: необходимо указать тип ПД в справочнике DATAOBJECT_OF_PROCESS (поле TYPE_ID) и указать тип документа и тип шаблона в справочнике FRM_CARD_USAGE ");
                   disableBtn()                                         
             }
             else if ((typeDocument == '')   &amp;&amp; (dataObjectId == '')  &amp;&amp; parseInt(newDoc) == 0){
                  errorsTask.text("Ошибка 012. Ошибка процесса: объектом процесса является не ПД");
                  disableBtn()   
             }
             else if (typeDocument == '') {
                   errorsTask.text("Ошибка 013. Ошибка процесса: пришел пустой TYPE_ID");
                   disableBtn()   
             }
             else if (dataObjectId == '') {
                   errorsTask.text("Ошибка 014. Ошибка процесса: пришел пустой DATAOBJECT_ID");
                   disableBtn()   
             }
             else if (newDoc == '') {
                   errorsTask.text("Ошибка 015. Ошибка загрузки документа: пришел пустой NEWSDOC пустой");
                   disableBtn()   
             }
             else {                
                loadAutoform(); 
             }
          }  
        } //else
    };   
    
    function disableBtn()
    {
      var disabledBtn = $(".btn_menu input");
      disabledBtn.each(function(){
        $(this).attr("disabled", "disabled").addClass("disabled"); 
      });   
      $(".btn_close input").attr("disabled", "disabled").addClass("disabled");
    } 
    
    $(document).ready(function() {                        
        
        $(".processUrl").each(function(){
          this.href = this.href.replace(':documentId', this.id);
        });
        if (newDoc != 1 &amp;&amp; newDoc != ''){
         $(".objProcess a")[0].href =   $(".objProcess a")[0].href.replace("$%7BDOC_KEY%7D", dataObjectId).replace("$%7BDOC_KEY%7D", dataObjectId);};
                
        onTabChange = {
              process : {
                    id : null,
                    call : function(){
                         //Загружаем данные по кнопкам
                         var urlVal = _xDoxUrl + '/taskmenuAjax.action?taskId=' + taskId + '&amp;processId=' + processId;
                         $.ajax({
                              url: urlVal,                          
                              type:  'GET',
                              async: false,
                              error : function(error) { 
                                  disableBtn();                         
                                  hideLoadingIndicator(); 
                                  alert("Ошибка загрузки меню");            
                                  console.log(error);            
                              },
                              success: function(json) {       
                                  // Проверяем права пользователей (может ли он работать с кнопками)
                                  if (json.errors != null){
                                       //$("#readOnlyDocument").show(); // отображаем объект процесса
                                       $("#editDocument").html("");  //срываем форму для редактирования объекта процесса
                                       errorsTask.text(json.errors);
                                       if (taskId == '')
                                       {
                                          errorsTask.text("Задача процесса не существует");
                                       }
                                  }
                                  else if (json.data != null &amp;&amp; json.data.length > 0){
                                       //$("#readOnlyDocument").html("");
                                       $("#editDocument").show();
                                          
                                       // Построение кнопок
                                       var btn = '',
                                        data = json.data;
                                                  
                                       for(var i=0; i&lt;data.length; i++)
                                       {    
                                            var nameBtn =  actionsList[data[i].id]=='createReportAction' ? "" : data[i].label,
                                                vi = (data[i].pMap !== null <![CDATA[&&]]> 'vi' in data[i].pMap) ? data[i].pMap.vi.toUpperCase() : '',
                                                color = (data[i].pMap !== null <![CDATA[&&]]> 'co' in data[i].pMap) ? data[i].pMap.co : '', //MGEII-3932
                                                bv = (data[i].pMap !== null <![CDATA[&&]]> 'bv' in data[i].pMap) ? data[i].pMap.bv.toUpperCase() : '', //UGDIII-86
                                                hint = actionsList[data[i].id]=='createReportAction' ? 'Вы можете закрыть страницу — введённые данные сохранятся без завершения задачи' : '';
                                                
                                            btn = 
                                              $("<input/>", {            
                                                  "value": nameBtn,
                                                  "type": "button",
                                                  "class" : "reports_Menu",
                                                  "onclick": getEvent(data[i]),
                                                  "id" : "editReportItem_" + data[i].id,
                                                  "data-vi": vi,
                                                  "data-bv": bv,
                                                  "style" : "background:" + color,
                                                  "title": hint
                                              });                            
                                            btn.appendTo("." + actionsList[data[i].id]);                                                                 
                                       }//for 
                                       
                                       //Дополнительная кнопка "Инициализировать процесс"
                                       btn = 
                                           $("<input/>", {            
                                                "value": "Инициировать подпроцесс",
                                                "type" : "button",
                                                "class": "reports_Menu",
                                                "onclick": "XdoxGlobalActions.InitProcess('parentTaskId=" + taskId + "')",
                                                "id" : "editReportItem_init_subprocess"
                                                });
                                       btn.appendTo(".subprocess");  
                                                   
                                       //Загружаем автоформы
                                       //Проверяем Есть ли объект процесса       
                                       errors();                                                                                                 
                                      
                                  }//else  
                                }//success
                             })//ajax
                      }//call
               }//process
        } //onTabChange 
        onTabChange.process.call();                   
    }); 
  
    var cardGallery = (function() {

      var controlsId = 'galleryControls',
        controlsTemplate = $('#controlsTemplate').html(),
        galleryOptions = {
          type: 'image',
          padding: 0,
          margin: [120, 60, 50, 60],
          closeBtn  : false,
          beforeLoad: function() {
            $('#' + controlsId).show();
          },
          afterLoad: function(current, previous) {
            var $currentElement = $(current.element),
              existsEP = !!$currentElement.data('ep'),
              cardId = $currentElement.data('cardid');

            $('#galleryControlsTitle').text(current.title);
            $('#printImage').attr('onclick', 'cardGallery.printImage("' + current.href + '")');

            $('#saveImage').attr('href', '/elib/getFile.action?app=' + app + '&amp;contentType=application/octet-stream&amp;cardId=' + cardId).attr('download', current.title);
            if (existsEP) {
              $('#downloadWithEP').attr('href', '/elib/getFileWithEcp.action?contentType=application/octet-stream<xsl:text disable-output-escaping="yes">&amp;</xsl:text>cardId=' + cardId).show();
              $('.gallery-controls-checkEP').attr('id', cardId).show();
            } else {
              $('#downloadWithEP').attr('href', '').hide();
              $('.gallery-controls-checkEP').hide();
            } 
            
          },
          afterShow: function() {
            
          },
          afterClose: function() {
            $('#' + controlsId).hide();
          },
          helpers: { 
            title: null,
            overlay: {
              // closeClick: false
            },
            documentPages: {
              width: 50,
              height: 50
            }
          }
        },
        printPageHtml = function(src) {
          return '<xsl:text disable-output-escaping="yes"><![CDATA[<html><head></head><body><img src="' + src + '" /></body></html>]]></xsl:text>';
        };
        
        return { 
            init: function($element) {
              $(controlsTemplate).appendTo('body');
              $element.fancybox(galleryOptions);
            },
            printImage: function(src) {
              pagelink = "about:blank";
              var printWindow = window.open(pagelink, "_new");
              printWindow.document.open();
              printWindow.document.write(printPageHtml(src));

              setTimeout(function(){
                printWindow.print();
                printWindow.close()
              }, 10)
              
              return false;
            }
        }
    }());
    
    cardGallery.init($('.document-gallery-thumb'));
</script>


<script id="controlsTemplate" type="x-template">
  <div id="galleryControls" class="gallery-controls">
    <div class="gallery-controls-inner">
      <div class="gallery-controls-left">
        <span id="galleryControlsTitle"></span>
      </div>
      <div class="gallery-controls-right">
        <a class="gallery-controls-print" id="printImage"  title="Напечатать" style="display: none;"></a>
        <a class="gallery-controls-save" id="saveImage" title="Скачать"></a>
        <a class="gallery-controls-save" id="downloadWithEP" title="Скачать с ЭП" style="display: none;"></a>
        <a class="cardCheckECP gallery-controls-checkEP" title="Проверить ЭП" style="display: none;"></a>
        <span class="gallery-controls-close" onclick="$.fancybox.close();" id="galleryControlsClose"><xsl:text disable-output-escaping="yes"><![CDATA[&times;]]></xsl:text></span>
      </div>
    </div>
  </div>
</script>

<script>
<xsl:text disable-output-escaping="yes">
//<![CDATA[ 
 /*
 * Отображение кликабельных превью для нарезаных страниц файла
 */
(function ($) {
  $.fancybox.helpers.documentPages = {
    defaults : {
      width    : 50,
      height   : 50,
      position : 'bottom'
    },

    wrap    : null,
    list    : null,
    width   : 0,
    cardId    : null,
    pagecount : 1,

    init: function (opts, obj) {
      var that = this,
        list, cardId,
        thumbWidth  = opts.width,
        thumbHeight = opts.height;
        $item = $(obj.element);

      this.pageCount = $item.data('pagecount');
      this.cardId = $item.data('cardid');
      cardId = this.cardId;
      list = '';

      if (this.pageCount < 2) return;

      for (var n = 1; n <= this.pageCount; n++) {
        list += '<li style="width:' + thumbWidth + 'px;height:' + thumbHeight + 'px;" onClick="$.fancybox.helpers.documentPages.showPage(' + n + ', this);"></li>';
      }
      
      this.wrap = $('<div id="documentPages"></div>').addClass(opts.position).appendTo('body');
      this.list = $('<ul>' + list + '</ul>').appendTo(this.wrap);
      this.list.find('li').eq(0).addClass('active');
      $.each(this.list.find('li'), function (i) {
        var index = i + 1,
          href = 'getThumb.action?cardId=' + cardId + '&page=' + index;

        $('<img />').load(function () {
          var width  = this.width,
            height = this.height,
            widthRatio, heightRatio, parent;

          if (!that.list || !width || !height) {
            return;
          }

          widthRatio  = width / thumbWidth;
          heightRatio = height / thumbHeight;
          parent = that.list.children().eq(i);

          if (widthRatio >= 1 && heightRatio >= 1) {
            if (widthRatio > heightRatio) {
              width  = Math.floor(width / heightRatio);
              height = thumbHeight;

            } else {
              width  = thumbWidth;
              height = Math.floor(height / widthRatio);
            }
          }

          $(this).css({
            width  : width,
            height : height,
            top    : Math.floor(thumbHeight / 2 - height / 2),
            left   : Math.floor(thumbWidth / 2 - width / 2)
          });

          $(this).hide().appendTo(parent).fadeIn(300);
        }).attr('src', href);

      });

      this.width = this.list.children().eq(0).outerWidth(true);
    },
    showPage: function(i, element) {
      var $container = $('.fancybox-inner'),
        href = 'getImage.action?cardId=' +  this.cardId + '&page=' + i;

      $.fancybox.showLoading();

      $('<img />').load(function () {

        $container.empty();
        $(this).hide().appendTo($container).fadeIn(300);
        $(element).addClass('active').siblings().removeClass('active');
        $.fancybox.hideLoading();

      }).attr('src', href).addClass('fancybox-image');


    },

    beforeLoad: function (opts, obj) {
      obj.margin[ opts.position === 'top' ? 0 : 2 ] += ((opts.height) + 15);
    },

    afterShow: function (opts, obj) {
        if (this.wrap) {
          this.wrap.remove();
        }

        this.init(opts, obj);
    },

    beforeClose: function () {
      if (this.wrap) {
        this.wrap.remove();
      }

      this.wrap  = null;
      this.list  = null;
      this.width = 0;
      this.cardId = null;
      this.pageCount = 1;
    }
  }

}(jQuery));
//]]> 
</xsl:text>
</script>
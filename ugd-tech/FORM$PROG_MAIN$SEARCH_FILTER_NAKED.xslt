

<div class="sf-wrapper">
         <div class="sf-container">
            <div class="sf-header"><span class="search-icon"></span> Поиск по мероприятиям
            <!--button class="sf-close-btn"></button-->
            </div>
            <div class="formWrapper" id="formWrapper">
               <form class="form"  xfTag="request" action="/customactions/requestSave.action" method="POST">

               <input type="hidden" name="DDATE_BEGIN" value=""></input>
               <input type="hidden" name="DDATE_END" value=""></input>
                  <div class="line full"><label class="inputName">Мероприятие</label><span class="inputWrap">
                        <div class="_token_input_wrapper" xfTag=":name:"><input type="text"  id="" style="" name="EVENT" class="tokenInput" data-identifier="PERSONS_FROM_ORGANIZATIONS" data-load-names="true" data-info="inputName" data-paramnames="" data-token-limit="1" data-parameters=""></input><span class="hidden tokenValues"></span>
                        </div>
                     </span>
                  </div>
                  <div class="line full"><label class="inputName">Срок завершения мероприятия</label><span class="inputWrap">
                        <div class="calendar">
                           <div class="date_view"></div>
                           <div class="minimal2calendars">
                              <div class="pickerwrap">
                                 <div class="pikers_one"></div>
                                 <div class="pikers_two"></div>
                              </div><input type="button" value="Применить" class="bigBigButton"></input>
                           </div>
                        </div>
                     </span>
                  </div>
                  <div class="line full checkBox"><label class="inputName">Статус</label><span class="inputWrap">
                        <div class="checkbox-wrap"><input type="checkbox" name="DONE" id="" style="" class="masked" xfTag=":name:" value="1"></input><span class="overTrop"></span><label for="">Выполнено</label>
                        </div>
                        <div class="checkbox-wrap"><input type="checkbox" name="UNDONE" id="" style="" class="masked" xfTag=":name:" value="1"></input><span class="overTrop"></span><label for="">Не выполнено</label>
                        </div>
                        <div class="checkbox-wrap"><input type="checkbox" name="IN_PROGRESS" id="" style="" class="masked" xfTag=":name:" value="1"></input><span class="overTrop"></span><label for="">В работе</label>
                        </div>
                     </span>
                  </div>
                  <div class="grey-line"></div>
                  <div class="line full"><label class="inputName">Курирующий заместитель</label><span class="inputWrap">
                        <div class="_token_input_wrapper" xfTag=":name:"><input type="text"  id="" style="" name="PERSON_CURATOR" class="tokenInput" data-identifier="PERSONS_FROM_ORGANIZATIONS" data-load-names="true" data-info="inputName" data-paramnames="" data-token-limit="1" data-parameters=""></input><span class="hidden tokenValues"></span>
                        </div>
                     </span>
                  </div>
                  <div class="line full"><label class="inputName">Ответственное управление</label><span class="inputWrap">
                        <div class="_token_input_wrapper" xfTag=":name:"><input type="text"  id="" style="" name="RESPONSIBLE_DEPT" class="tokenInput" data-identifier="PERSONS_FROM_ORGANIZATIONS" data-load-names="true" data-info="inputName" data-paramnames="" data-token-limit="1" data-parameters=""></input><span class="hidden tokenValues"></span>
                        </div>
                     </span>
                  </div>
                  <div class="line full"><label class="inputName">Ответственный за мероприятие</label><span class="inputWrap">
                        <div class="_token_input_wrapper" xfTag=":name:"><input type="text"  id="" style="" name="PERSON_EVENT_RESPONSIBLE" class="tokenInput" data-identifier="PERSONS_FROM_ORGANIZATIONS" data-load-names="true" data-info="inputName" data-paramnames="" data-token-limit="1" data-parameters=""></input><span class="hidden tokenValues"></span>
                        </div>
                     </span>
                  </div>
                  <div class="line full"><label class="inputName">Исполнитель</label><span class="inputWrap">
                        <div class="_token_input_wrapper" xfTag=":name:"><input type="text"  id="" style="" name="PERSON_EXECUTER" class="tokenInput" data-identifier="PERSONS_FROM_ORGANIZATIONS" data-load-names="true" data-info="inputName" data-paramnames="" data-token-limit="1" data-parameters=""></input><span class="hidden tokenValues"></span>
                        </div>
                     </span>
                  </div>
                  <div class="line full"><label class="inputName">Соисполнитель</label><span class="inputWrap">
                        <div class="_token_input_wrapper" xfTag=":name:"><input type="text"  id="" style="" name="PERSON_COEXECUTER" class="tokenInput" data-identifier="PERSONS_FROM_ORGANIZATIONS" data-load-names="true" data-info="inputName" data-paramnames="" data-token-limit="1" data-parameters=""></input><span class="hidden tokenValues"></span>
                        </div>
                     </span>
                  </div>
                  <div class="line full centered"><label class="inputName"></label><span class="inputWrap">
                        <div class="ft-button ft-button-primary filterSubmitButton">Найти</div>
                     </span>
                  </div>
               </form>
            </div>
   </div>
</div>


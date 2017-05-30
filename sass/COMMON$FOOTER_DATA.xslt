
   <xsl:template name="tmpl_footter">
      <div id="footer" class="inner hideTabContent">
          <div class="footerWrap">
              <div class="footerSpacer"></div>
              <div class="fList fTitle">
                  <b><a target="_blank" href="https://gge.ru/">Перейти на сайт ФАУ «Главгосэкспертиза России»</a></b>
                  <br/>
                  <ul>
                    <li><a target="_blank" href="https://gge.ru/informacionnye-uslugi-zayavitelyu/">Описание государственных услуг</a></li>
                    <li><a target="_blank" href="https://gge.ru/vopros-otvet/">Часто задаваемые вопросы</a></li>
                  </ul>
                  <br/><br/><br/><br/>
                  <span>© 2015 ФАУ «Главгосэкспертиза России»</span>
                  <!--p>© Департамент градостроительной политики города Москвы</p>
                  <p>Информационно-аналитическая система
                      <br/>управления градостроительной
                      <br/>деятельностью</p-->
              </div>
              <div class="fList fTitle">
                  <b>Экспертиза в электронном виде</b>
                  <br/>
                  <ul>
                    <li><a href="tabInfo.action?tab=PERSONAL_CABINET&amp;b=B1E9590371B943B7ACD32CF2AD830C87#/tree::rel=4/card::cardId=CARD$GIO3$DISC">Описание</a></li>
                    <li><a href="tabInfo.action?tab=PERSONAL_CABINET&amp;b=DB6E0EEB17AC4786AB9A5D68AEB5C89E#/tree::rel=2/card::cardId=CARD$GIO3$INST">Инструкция</a></li>
                    <!--li>График семинаров</li-->
                  </ul>
              </div>
              <div class="fList r">
                  <ul class="oneString">
                      <li><a target="_blank" href="http://www.minstroyrf.ru"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJIAAAAzCAIAAADzWcaSAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NzA4Q0Y1Q0E3NzM3MTFFNTg0MEJFQjEzNEJFNEFDRDMiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NzA4Q0Y1Q0I3NzM3MTFFNTg0MEJFQjEzNEJFNEFDRDMiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo3MDhDRjVDODc3MzcxMUU1ODQwQkVCMTM0QkU0QUNEMyIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo3MDhDRjVDOTc3MzcxMUU1ODQwQkVCMTM0QkU0QUNEMyIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Pux05L8AABEfSURBVHja7FsJVBRn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"/></a></li>
                      <li><a target="_blank" href="https://www.gosuslugi.ru/"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJIAAAAzCAIAAADzWcaSAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NjZBQjQxRjk3NzM3MTFFNUJBMDhDNDMzNTk2MEI1MTYiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NjZBQjQxRkE3NzM3MTFFNUJBMDhDNDMzNTk2MEI1MTYiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo2NkFCNDFGNzc3MzcxMUU1QkEwOEM0MzM1OTYwQjUxNiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo2NkFCNDFGODc3MzcxMUU1QkEwOEM0MzM1OTYwQjUxNiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Pr9ggdgAABXqSURBVHja7FwNWBNH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"/></a></li>
                  </ul>
              </div>
          </div>
      </div>
    </xsl:template>